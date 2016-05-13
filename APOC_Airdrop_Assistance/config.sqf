
APOC_AA_coolDownTime = 60; //Expressed in sec

APOC_AA_Drops =[
/*
	["Category Name",
		[
			["Text displayed to player",	"Name of vehicle or drop box",	cost, "vehicle or supply (use nothing but these two!"]  //This is an array, use commas between
		] //If something breaks with your list of drops, you've likely messed up the nested arrays.
	]
*/

//Also, presently, these are NON-Persistant vehicles.  Meaning that they will not last over a restart.  Keep that in mind with prices.  Later updates I'll set that up, with pin code entry.
	["NON-Persistant Vehicles",
		[
			["Quadbike", 			"Exile_Bike_QuadBike_Black", 				20000, 	"vehicle"],
			["Box Van (black)", 	"Exile_Car_Van_Box_Black", 					30000, 	"vehicle"],
			["Repair Offroad", 		"Exile_Car_Offroad_Repair_Civillian", 		35000, 	"vehicle"],
			["Classic SUV", 		"Exile_Car_SUVXL_Black",					40000, 	"vehicle"],
			["Strider", 			"Exile_Car_Strider", 						45000, 	"vehicle"],
			["Hunter (HMG)", 		"B_MRAP_01_hmg_F", 							60000, 	"vehicle"],
			["MH-9 Hummingbird", 	"Exile_Chopper_Hummingbird_Civillian_Wasp", 65000, 	"vehicle"],
			["M5 Sandstorm", 		"B_MBT_01_mlrs_F", 					   		500000,  "vehicle"],
			["M4 Scorcher", 		"B_MBT_01_arty_F", 					   		500000,  "vehicle"],
			["2S9 Sochor", 			"O_MBT_02_arty_F", 					   		500000,  "vehicle"]
		]
	],
	
	/*
	["NON-Persistant "A" Vehicles",
		[
			["Ifrit (GMG)", 		"O_MRAP_02_gmg_F", 						60000, 	"vehicle"],
			["Hunter (HMG)", 		"B_MRAP_01_hmg_F", 						60000, 	"vehicle"],
			["M5 Sandstorm", 		"B_MBT_01_mlrs_F", 					   500000, 	"vehicle"],
			["M4 Scorcher", 		"B_MBT_01_arty_F", 					   500000, 	"vehicle"],
			["2S9 Sochor", 			"O_MBT_02_arty_F", 					   500000, 	"vehicle"],
			["AH-9 Pawnee", 		"B_Heli_Light_01_armed_F", 			   	75000, 	"vehicle"]
		]
	],
	*/

	["Weapon Items",
		[
			["Sniper Rifles", 		"airdrop_Snipers", 				5000, "supply"],
			["DLC Rifles", 			"airdrop_DLC_Rifles", 		   10000, "supply"],
			["DLC LMGs", 			"airdrop_DLC_LMGs", 		   15000, "supply"]
		]
	],
	
	["Prestige Player Gear",
		[
			["VR Suits (500)", 		"airdrop_VRSuits", 				45000, "supply"],
			["Backpacks (580)", 	"airdrop_Backpacks", 		    60000, "supply"]
		]
	],

	["Supply Items",
		[
			["Food/Meds (small)",		"airdrop_FoodSmall",			 5000, "supply"],
			["Food/Meds (large)",		"airdrop_FoodLarge",		 	10000, "supply"]
		]
	],
	
	["Repair Items",
		[
			["Vehicle (small)",		"airdrop_RepairSmall",			 5000, "supply"],
			["Vehicle (large)",		"airdrop_RepairLarge",			10000, "supply"]
		]
	],
	
	["Construction Materials",
		[
			["Build Items (small)",		"airdrop_BuildSmall",			   25000, "supply"],
			["Build Items (large)",		"airdrop_BuildLarge",			   50000, "supply"]
		]
	]
];

APOC_AA_Drop_Contents =[
	["airdrop_Snipers",  //Name of the drop
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			// Valid item types: wep, itm, or bac.
			
			["wep", ["srifle_LRR_camo_F"], 2, 12],
			["wep", ["srifle_GM6_camo_F"], 2, 12],
			["wep", ["srifle_EBR_F"], 2, 12],
			["wep", ["srifle_DMR_02_camo_F"], 2, 12],
			["wep", ["arifle_MXM_Black_F"], 2, 12],
			["itm", ["optic_LRPS"], 2],
			["itm", ["optic_DMS"], 2],
			["itm", ["optic_Nightstalker"], 2],
			["bac", ["B_Carryall_mcamo"], 2]
		]
	],

	["airdrop_DLC_Rifles",
		[
			// ["ItemType",[Array of items/weps to choose from randomly], number of items]
			// If using wep, you need also number of mags to be included.
			
			["wep", ["srifle_DMR_03_multicam_F"], 2, 12],
			["wep", ["srifle_DMR_02_sniper_F"], 2, 12],
			["wep", ["srifle_DMR_05_hex_F"], 2, 12],
			["wep", ["srifle_DMR_04_Tan_F"], 2, 12],
			["itm", ["V_PlateCarrierIAGL_dgtl"], 2],
			["itm", ["V_TacVest_camo"], 2],
			["itm", ["V_PlateCarrierGL_rgr"], 2],
			["itm", ["bipod_01_F_blk"], 2],
			["itm", ["bipod_02_F_hex"], 2],
			["itm", ["optic_DMS"], 2],
			["itm", ["optic_AMS"], 2],
			["itm", ["optic_tws"], 2],
			["itm", ["optic_KHS_blk"], 2],
			["itm", ["muzzle_snds_338_black"], 2],
			["itm", ["muzzle_snds_93mmg"], 2],
			["bac", ["B_Carryall_mcamo"], 2]
		]
	],

	["airdrop_DLC_LMGs",
		[
			// ["ItemType",[Array of items/weps to choose from randomly], number of items]
			// If using wep, you need also number of mags to be included.
			
			["wep", ["MMG_02_black_F"], 2, 8],
			["wep", ["MMG_02_camo_F"], 2, 8],
			["wep", ["MMG_02_sand_F"], 2, 8],
			["wep", ["MMG_01_hex_F"], 2, 8],
			["wep", ["MMG_01_tan_F"], 2, 8],
			["itm", ["V_PlateCarrierIAGL_dgtl"], 2],
			["itm", ["V_TacVest_camo"], 2],
			["itm", ["V_PlateCarrierGL_rgr"], 2],
			["itm", ["bipod_01_F_blk"], 2],
			["itm", ["bipod_02_F_hex"], 2],
			["itm", ["optic_DMS"], 3],
			["itm", ["optic_tws"], 3],
			["itm", ["optic_KHS_blk"], 3],
			["itm", ["muzzle_snds_338_black"], 2],
			["itm", ["muzzle_snds_338_sand"], 2],
			["itm", ["muzzle_snds_93mmg"], 2],
			["bac", ["B_Carryall_mcamo"], 2]
		]
	],
	
	["airdrop_VRSuits",
		[
			["itm", ["U_B_Protagonist_VR"], 1],
			["itm", ["U_I_Protagonist_VR"], 1],
			["itm", ["U_O_Protagonist_VR"], 1]
		]
	],
	
	["airdrop_Backpacks",
		[
			["bac", ["B_mas_m_Bergen_acr"], 1],
			["bac", ["B_mas_m_Bergen_acr_c"], 1],
			["bac", ["B_mas_m_Bergen_acr_g"], 1],
			["bac", ["B_mas_m_Bergen_acr_w"], 1]
		]
	],
	
	["airdrop_FoodSmall",
		[
			["itm", ["Exile_Item_Heatpack"], 3],
			["itm", ["Exile_Item_InstaDoc"], 3],
			["itm", ["Exile_Item_Bandage"], 3],
			["itm", ["Exile_Item_Vishpirin"], 3],
			["itm", ["Exile_Item_EMRE"], 5],
			["itm", ["Exile_Item_BeefParts"], 5],
			["itm", ["Exile_Item_Moobar"], 5],
			["itm", ["Exile_Item_PlasticBottleFreshWater"], 5],
			["itm", ["Exile_Item_PlasticBottleCoffee"], 5],
			["itm", ["Exile_Item_MountainDupe"], 5],
			["bac", ["B_Carryall_mcamo"], 1]
		]
	],

	["airdrop_FoodLarge",
		[
			
			["itm", ["Exile_Item_Defibrillator"], 1],
			["itm", ["Exile_Item_Heatpack"], 6],
			["itm", ["Exile_Item_InstaDoc"], 6],
			["itm", ["Exile_Item_Bandage"], 6],
			["itm", ["Exile_Item_Vishpirin"], 6],
			["itm", ["Exile_Item_EMRE"], 10],
			["itm", ["Exile_Item_BeefParts"], 10],
			["itm", ["Exile_Item_Moobar"], 10],
			["itm", ["Exile_Item_PlasticBottleFreshWater"], 10],
			["itm", ["Exile_Item_PlasticBottleCoffee"], 10],
			["itm", ["Exile_Item_MountainDupe"], 10],
			["bac", ["B_Carryall_mcamo"], 2]
		]
	],
	
	["airdrop_RepairSmall",
		[
			["itm", ["Exile_Item_FuelCanisterFull"], 1],
			["itm", ["Exile_Item_Foolbox"], 1],
			["itm", ["Exile_Item_Wrench"], 1],
			["itm", ["Exile_Item_DuctTape"], 2],
			["itm", ["Exile_Item_JunkMetal"], 2]
		]
	],
	
	["airdrop_RepairLarge",
		[
			["itm", ["Exile_Item_FuelCanisterFull"], 2],
			["itm", ["Exile_Item_Foolbox"], 1],
			["itm", ["Exile_Item_Wrench"], 1],
			["itm", ["Exile_Item_DuctTape"], 4],
			["itm", ["Exile_Item_JunkMetal"], 4]
		]
	],
	
	["airdrop_BuildSmall",
		[
			["itm", ["Exile_Item_WoodFloorKit"], 5],
			["itm", ["Exile_Item_WoodPlank"], 5],
			["itm", ["Exile_Item_WoodWallKit"], 5],
			["itm", ["Exile_Item_WoodWindowKit"], 5],
			["itm", ["Exile_Item_FortificationUpgrade"], 5],
			["itm", ["Exile_Item_MetalBoard"], 5],
			["itm", ["Exile_Item_WoodLog"], 5],
			["itm", ["Exile_Item_MetalPole"], 5],
			["itm", ["Exile_Item_WoodDoorKit"], 3],
			["itm", ["Exile_Item_WoodStairsKit"], 1],
			["itm", ["Exile_Item_WorkBenchKit"], 1],
			["itm", ["Exile_Item_CamoTentKit"], 1],
			["itm", ["Exile_Item_Storagecratekit"], 1],
			["bac", ["B_Carryall_mcamo"], 1]
		]
	],
	
	["airdrop_BuildLarge",
		[
			["itm", ["Exile_Item_WoodFloorKit"], 10],
			["itm", ["Exile_Item_WoodPlank"], 10],
			["itm", ["Exile_Item_WoodFloorPortKit"], 10],
			["itm", ["Exile_Item_WoodWallKit"], 10],
			["itm", ["Exile_Item_WoodWallHalfKit"], 10],
			["itm", ["Exile_Item_WoodWindowKit"], 10],
			["itm", ["Exile_Item_FortificationUpgrade"], 10],
			["itm", ["Exile_Item_MetalBoard"], 10],
			["itm", ["Exile_Item_WoodLog"], 10],
			["itm", ["Exile_Item_MetalPole"], 5],
			["itm", ["Exile_Item_WoodGateKit"], 3],
			["itm", ["Exile_Item_WoodStairsKit"], 3],
			["itm", ["Exile_Item_WoodSupportKit"], 3],
			["itm", ["Exile_Item_WoodDoorKit"], 3],
			["itm", ["Exile_Item_WoodDoorwayKit"], 3],
			["itm", ["Exile_Item_WorkBenchKit"], 3],
			["itm", ["Exile_Item_CamoTentKit"], 3],
			["itm", ["Exile_Item_CodeLock"], 3],
			["itm", ["Exile_Item_Storagecratekit"], 3],
			["itm", ["Exile_Item_CampFireKit"], 1],
			["bac", ["B_Carryall_mcamo"], 2]
		]
	]
];
