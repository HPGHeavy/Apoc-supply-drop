
private ["_mag", "_magCfg"];

_mag = _this;
_magCfg = configFile >> "CfgMagazines" >> _mag;

if (isClass _magCfg) then
{
	// Fix case
	_mag = configName (_magCfg);

	while {["_Tracer", configName (_magCfg)] call fn_findString != -1} do
	{
		_magCfg = inheritsFrom _magCfg;
	};

	if (isClass _magCfg) then
	{
		_mag = configName (_magCfg);
	};
};

_mag
