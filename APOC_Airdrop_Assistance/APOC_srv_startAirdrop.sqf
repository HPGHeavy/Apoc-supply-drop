
if !(isDedicated) exitWith{};

private ["_object","_player","_DropType","_DropSelection","_DropDesc","_DropPrice"]; //Variables coming from APOC_Airdrop_Assistance_XM8.sqf
_DropType 			 	= _this select 0;
_DropSelection		 	= _this select 1;
_player 				= _this select 2;

diag_log format ["SERVER - Apoc's Airdrop Assistance - Player: %1, Drop Type: %2, Selection: %3",name _player,_DropType,_DropSelection];
hint format ["Well we've made it this far! %1, %2, %3,",_player,_DropType,_DropSelection];

//Very convoluted system to extract the price from the arrays
 for "_i" from 0 to (count APOC_AA_Drops)-1 do {
    {
    _Selection = _x select 1;
    if (_DropSelection == _Selection) then
		{
			_DropDesc = _x select 0;
			_DropPrice = _x select 2;
			_DropType = _x select 3;
		}
    } forEach ((APOC_AA_Drops select _i) select 1);
};

/////// Let's spawn us  an AI helo to carry the cargo ///////

_heliType = "B_Heli_Transport_03_unarmed_F";
_center = createCenter civilian;
_grp = createGroup civilian;
if(isNil("_grp2"))then{_grp2 = createGroup civilian;}else{_grp2 = _grp2;};
_flyHeight = 350;
_dropSpot = [(position _player select 0),(position _player select 1),_flyHeight];
_heliDirection = random 360;
_flyHeight = 200;  //Distance from ground that heli will fly at
_heliStartDistance = 5000;
_spos=[(_dropSpot select 0) - (sin _heliDirection) * _heliStartDistance, (_dropSpot select 1) - (cos _heliDirection) * _heliStartDistance, (_flyHeight+200)];

diag_log format ["AAA - Heli Spawned at %1", _spos];
_heli = createVehicle [_heliType, _spos, [], 0, "FLY"];
_heli allowDamage false;
//_heli setVariable ["R3F_LOG_disabled", true, true];
//[_heli] call vehicleSetup;

//Heli needs a pilot.  Let's grab one from the BIS ranks
_crew = _grp createUnit ["O_recon_F", _spos, [], 0, "NONE"];
_crew moveInDriver _heli;
_crew allowDamage false;

_heli setCaptive true;  //Protect heli from other AI

_heliDistance = 5000;
_dir = ((_dropSpot select 0) - (_spos select 0)) atan2 ((_dropSpot select 1) - (_spos select 1));
_flySpot = [(_dropSpot select 0) + (sin _dir) * _heliDistance, (_dropSpot select 1) + (cos _dir) * _heliDistance, _flyHeight];

_grp setCombatMode "BLUE";
_grp setBehaviour "CARELESS";

{_x disableAI "AUTOTARGET"; _x disableAI "TARGET";} forEach units _grp;

//Location where heli flies to?
_wp0 = _grp addWaypoint [_dropSpot, 0, 1];
[_grp,1] setWaypointBehaviour "CARELESS";
[_grp,1] setWaypointCombatMode "BLUE";
[_grp,1] setWaypointCompletionRadius 20;
_wp1 = _grp addWaypoint [_flySpot, 0, 2];
[_grp,2] setWaypointBehaviour "CARELESS";
[_grp,2] setWaypointCombatMode "BLUE";
[_grp,2] setWaypointCompletionRadius 20;
_heli flyInHeight _flyHeight;

//////// Create Purchased Object ////////
_object = switch (_DropType) do {
	case "vehicle":
	{
		_objectSpawnPos = [(_spos select 0), (_spos select 1), (_spos select 2) - 5];
		_object = [_DropSelection, _objectSpawnPos, 0, FALSE] call ExileServer_object_vehicle_createNonPersistentVehicle;

		diag_log format ["Apoc's Airdrop Assistance - Object Spawned at %1", position _object];

		_object attachTo [_heli, [0,0,-5]]; //Attach Object to the heli
		_object
	};
	case "supply":
	{
		_objectSpawnPos = [(_spos select 0), (_spos select 1), (_spos select 2) - 5];
		_object = createVehicle ["Exile_Container_SupplyBox", _objectSpawnPos, [], 0, "None"];

		[_object, _DropSelection] call serv_fillAirdrop;
		_object attachTo [_heli, [0,0,-5]]; //Attach Object to the heli
		_object
	};
	default {  
		_objectSpawnPos = [(_spos select 0), (_spos select 1), (_spos select 2) - 5];
		_object = createVehicle ["Exile_Container_SupplyBox", _objectSpawnPos, [], 0, "None"];

		[_object, "airdrop_FoodSmall"] call serv_fillAirdrop;
		_object attachTo [_heli, [0,0,-5]]; //Attach Object to the heli
		_object
		};
};
_object allowDamage false;

diag_log format ["Apoc's Airdrop Assistance - Object at %1", position _object];

//Wait until the heli completes the drop waypoint, then move on to dropping the cargo.
While {true} do {
	sleep 0.1;
	if (currentWaypoint _grp >= 2) exitWith {};  //Completed Drop Waypoint
};

// Let's handle the money after this tricky spot - This way players won't be charged for non-delivered goods!
_playerRespect = _player getVariable ["ExileScore", 0];
		if (_DropPrice > _playerRespect) exitWith {
			{ _x setDamage 1; } forEach units _grp;
			_heli setDamage 1;
			_object setDamage 1;
			diag_log format ["Apoc's Airdrop Assistance - Player Respect Too Low, Drop Aborted. %1. Respect:$%2. Cost: $%3", _player, _playerRespect, _DropPrice];  //A little log love to mark the Scallywag who tried to cheat the valiant pilot
		};

//Server Side Money handling
	_respect = _player getVariable ["ExileScore", 0];
	_playerRespect = _respect - _DropPrice;
	_player setVariable ["ExileScore", _playerRespect, true];
	format["setAccountScore:%1:%2", _playerRespect, (getPlayerUID _player)] call ExileServer_system_database_query_fireAndForget;
	//Dealing with sending network messages into the ExileClient madness (Chunks of this from base Exile client code)
	_player call ExileServer_object_player_sendStatsUpdate;


//Now on to the fun stuff:
	diag_log format ["Apoc's Airdrop Assistance - Object at %1, Detach Up Next", position _object];
	detach _object;
	_objectPosDrop = position _object;
	_heli fire "CMFlareLauncher";
	_heli fire "CMFlareLauncher";

//Delete heli once it has proceeded to end point
	[_heli,_grp,_flySpot,_dropSpot,_heliDistance] spawn {
		private ["_heli","_grp","_flySpot","_dropSpot","_heliDistance"];
		_heli = _this select 0;
		_grp = _this select 1;
		_flySpot = _this select 2;
		_dropSpot = _this select 3;
		_heliDistance = _this select 4;
		while{([_heli, _flySpot] call BIS_fnc_distance2D)>200}do{
			if(!alive _heli || !canMove _heli)exitWith{};
			sleep 5;
		};
		waitUntil{([_heli, _dropSpot] call BIS_fnc_distance2D)>(_heliDistance * .5)};
		{ deleteVehicle _x; } forEach units _grp;
		deleteVehicle _heli;
	};

//Time based deletion of the heli, in case it gets distracted
	[_heli,_grp] spawn {
		private ["_heli","_grp"];
		_heli = _this select 0;
		_grp = _this select 1;
		sleep 30;
		if (alive _heli) then
		{
			{ deleteVehicle _x; } forEach units _grp;
			deleteVehicle _heli;
			diag_log "AIRDROP SYSTEM - Deleted Heli after Drop";
		};
	};

//Attach Parachute / Flares / Smokes
WaitUntil {(((position _object) select 2) < (_flyHeight-20))};
		_heli fire "CMFlareLauncher";
		_objectPosDrop = position _object;
		_para = createVehicle ["B_Parachute_02_F", _objectPosDrop, [], 0, ""];
		_object attachTo [_para,[0,0,-1.5]];

		_smoke1= "SmokeShellGreen" createVehicle getPos _object;
		_smoke1 attachto [_object,[0,0,-0.5]];
		_flare1= "F_40mm_Green" createVehicle getPos _object;
		_flare1 attachto [_object,[0,0,-0.5]];

		//if (_DropType == "vehicle") then {_object allowDamage true;}; //Turn on damage for vehicles

//Drop some flares and smokes on the ground when the object lands
WaitUntil {((((position _object) select 2) < 1) || (isNil "_para"))};
		detach _object;
		
		if (_DropType == "vehicle") then {_object allowDamage true;}; //Turn on damage for vehicles
		
		_smoke2= "SmokeShellGreen" createVehicle getPos _object;
		//_smoke2 attachto [_object,[0,0,-0.5]]; ////Enable this line if you want the smoke attached to the object.
		_flare2= "F_40mm_Green" createVehicle getPos _object;
		//_flare2 attachto [_object,[0,0,-0.5]]; //Enable this line if you want the flare attached to the object.
