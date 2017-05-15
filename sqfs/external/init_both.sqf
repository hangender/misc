// init dwarden bis dayz function fixes
waitUntil {!isnil "bis_fnc_init"};
BIS_Effects_EH_Killed = compile preprocessFileLineNumbers "\z\addons\dayz_code\system\BIS_Effects\killed.sqf";
BIS_Effects_AirDestruction = compile preprocessFileLineNumbers "\z\addons\dayz_code\system\BIS_Effects\AirDestruction.sqf";
BIS_Effects_AirDestructionStage2 = compile preprocessFileLineNumbers "\z\addons\dayz_code\system\BIS_Effects\AirDestructionStage2.sqf";

BIS_Effects_globalEvent =
{
	BIS_effects_gepv = _this;
	publicVariable "BIS_effects_gepv";
	_this call BIS_Effects_startEvent;
};

BIS_Effects_startEvent =
{
	switch (_this select 0) do
	{
	
		case "AirDestruction":
		{
			[_this select 1] spawn BIS_Effects_AirDestruction;
		};
		case "AirDestructionStage2":
		{
			[_this select 1, _this select 2, _this select 3] spawn BIS_Effects_AirDestructionStage2;
		};
		case "Burn":
		{
			[_this select 1, _this select 2, _this select 3, false, true] spawn BIS_Effects_Burn;
		};
	};
};

"BIS_effects_gepv" addPublicVariableEventHandler
{
	(_this select 1) call BIS_Effects_startEvent;
};

// init dayz variables
dayZ_instance = 1;
dayzHiveRequest = [];
initialized = false;
dayz_previousID = 0;

// init dayz stuff
call compile preprocessFile "\z\addons\dayz_code\init\variables.sqf";
call compile preprocessFile "\z\addons\dayz_code\init\publicEH.sqf";
call compile preprocessFile "\z\addons\dayz_code\medical\setup_functions_med.sqf";
call compile preprocessFile "external\override\compiles.sqf";

waitUntil {!(isNil "dayz_maxAnimals")};
dayz_maxAnimals = 2;

waitUntil {!(isNil "dayz_animalDistance")};
dayz_animalDistance = 400;

waitUntil {!(isNil "dayz_zSpawnDistance")};
dayz_zSpawnDistance = 400;

waitUntil {!(isNil "dayz_maxLocalZombies")};
dayz_maxLocalZombies = 20;

waitUntil {!(isNil "dayz_maxMaxModels")};
dayz_maxMaxModels = 40;

// 80 is default now
waitUntil {!(isNil "dayz_maxMaxWeaponHolders")};
dayz_maxMaxWeaponHolders = 80;

//[0, -1, -1, [-1, -1], false] execVM "external\override\DynamicWeatherEffects.sqf";
[0, 0, 0, [0, 0], false] execVM "external\override\DynamicWeatherEffects.sqf";
setViewDistance 1245;
setTerrainGrid 40;
0 setFog 0;