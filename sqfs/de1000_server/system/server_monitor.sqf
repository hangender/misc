
private ["_date","_year","_month","_day","_hour","_minute","_date1","_hiveResponse","_key","_objectCount","_dir","_point","_i","_action","_dam","_selection","_wantExplosiveParts","_entity","_worldspace","_damage","_booleans","_rawData","_ObjectID","_class","_CharacterID","_inventory","_hitpoints","_fuel","_id","_objectArray","_script","_result","_outcome","_clanarray"];
[]execVM "\z\addons\dayz_server\system\s_fps.sqf"; 



dayz_versionNo = 		getText(configFile >> "CfgMods" >> "DayZ" >> "version");
dayz_hiveVersionNo = 	getNumber(configFile >> "CfgMods" >> "DayZ" >> "hiveVersion");

waitUntil{initialized}; 


diag_log "SPAWN BUILDINGS";
[] spawn spawn_spawnbase;


















[] spawn spawn_bridge;
[] spawn spawn_base1;
[] spawn spawn_base2;
[] spawn spawn_base3;
[] spawn spawn_base4;
[] spawn spawn_devil;

[] spawn spawn_house_klen;
[] spawn spawn_hidden;

diag_log "FINISHED BUILDINGS";

diag_log "HIVE: Starting";



_key = "CHILD:307:";
_result = _key call server_hiveReadWrite;
_outcome = _result select 0;
if(_outcome == "PASS") then {
_date = _result select 1;


_year = _date select 0;
_month = _date select 1;
_day = _date select 2;
_hour = _date select 3;
_minute = _date select 4;


_date1 = [2013,8,3,_hour,_minute];

if(isDedicated) then {

setDate _date1;
dayzSetDate = _date1;
dayz_storeTimeDate = _date1;
publicVariable "dayzSetDate";
};
diag_log ("HIVE: Local Time set to " + str(_date1));
};

waituntil{isNil "sm_done"}; 

if (isServer and isNil "sm_done") then {




_key = format["CHILD:302:%1:",dayZ_instance];
_result = _key call server_hiveReadWrite;

diag_log "HIVE: Request sent";


_status = _result select 0;

_myArray = [];
if (_status == "ObjectStreamStart") then {
_val = _result select 1;

diag_log ("HIVE: Commence Object Streaming...");
for "_i" from 1 to _val do {
_result = _key call server_hiveReadWrite;

_status = _result select 0;
_myArray set [count _myArray,_result];

};
diag_log ("HIVE: Streamed " + str(_val) + " objects");
};

_countr = 0;		
{


_countr = _countr + 1;

_action = 		_x select 0; 
_idKey = 		_x select 1;
_type =			if ((typeName (_x select 2)) == "STRING") then { _x select 2 };
_ownerID = 		_x select 3;
_worldspace = 	if ((typeName (_x select 4)) == "ARRAY") then { _x select 4 } else { [] };
_inventory =	if ((typeName (_x select 5)) == "ARRAY") then { _x select 5 } else { [] };
_hitPoints =	if ((typeName (_x select 6)) == "ARRAY") then { _x select 6 } else { [] };
_fuel =			if ((typeName (_x select 7)) == "SCALAR") then { _x select 7 } else { 0 };
_damage = 		if ((typeName (_x select 8)) == "SCALAR") then { _x select 8 } else { 0.9 };

_dir = floor(random(360));
_pos = getMarkerpos "respawn_west";	
_wsDone = false;

if (count _worldspace >= 1 && {(typeName (_worldspace select 0)) == "SCALAR"}) then { 
_dir = _worldspace select 0;
};
if (count _worldspace == 2 && {(typeName (_worldspace select 1)) == "ARRAY"}) then { 
_i = _worldspace select 1;
if (count _i == 3 &&
{(typeName (_i select 0)) == "SCALAR"} && 
{(typeName (_i select 1)) == "SCALAR"} &&
{(typeName (_i select 2)) == "SCALAR"}) then {
_pos = _i;
_wsDone = true;					
};
};
if (!_wsDone) then {
_pos = [getMarkerPos "center",0,30,10,0,2000,0] call BIS_fnc_findSafePos;
if (count _pos < 3) then { _pos = [_pos select 0,_pos select 1,0]; };
diag_log ("MOVED OBJ: " + str(_idKey) + " of class " + _type + " to pos: " + str(_pos));
};

if (_damage < 1) then {


dayz_nonCollide = ["DomeTentStorage","TentStorage","CamoNet_DZ"];


_object = createVehicle [_type, _pos, [], 0, if (_type in dayz_nonCollide) then {"NONE"} else {"CAN_COLLIDE"}];
_object setVariable ["lastUpdate",time];

if (_ownerID == "0") then {
_object setVariable ["ObjectID", str(_idKey), true];
} else {
_object setVariable ["ObjectUID", _worldspace call dayz_objectUID2, true];
};
_object setVariable ["CharacterID", _ownerID, true];

_object setdir _dir;
_object setDamage _damage;


if (!(_object isKindOf "TrapItems")) then {
_cargo = _inventory;
clearWeaponCargoGlobal  _object;
clearMagazineCargoGlobal  _object;
clearBackpackCargoGlobal  _object;	 
_config = ["CfgWeapons", "CfgMagazines", "CfgVehicles" ];
{
_magItemTypes = _x select 0;
_magItemQtys = _x select 1;
_i = _forEachIndex;
{    
if (_x == "Crossbow") then { _x = "Crossbow_DZ" }; 
if (_x == "BoltSteel") then { _x = "WoodenArrow" }; 

if (_x == "DMR") then { _x = "DMR_DZ" };

if (_x == "SVD") then { _x = "SVD_DZ" }; 
if (_x == "SVD_CAMO") then { _x = "SVD_CAMO_DZ" };
if (isClass(configFile >> (_config select _i) >> _x) &&
getNumber(configFile >> (_config select _i) >> _x >> "stopThis") != 1) then {
if (_forEachIndex < count _magItemQtys) then {
switch (_i) do {
case 0: { _object addWeaponCargoGlobal [_x,(_magItemQtys select _forEachIndex)]; }; 
case 1: { _object addMagazineCargoGlobal [_x,(_magItemQtys select _forEachIndex)]; }; 
case 2: { _object addBackpackCargoGlobal [_x,(_magItemQtys select _forEachIndex)]; }; 
};
};
};
} forEach _magItemTypes;
} forEach _cargo;
};

if (_object isKindOf "AllVehicles") then {
if (_object isKindOf "UH1H_DZ2") then {
_clanarray = [];
_clanarray = _hitPoints;
_object setVariable ["owner",_clanarray,true];
_hitPoints = [];						
};
{
_selection = _x select 0;
_dam = _x select 1;
if (_selection in dayZ_explosiveParts and _dam > 0.8) then {_dam = 0.8};

[_object,_selection,_dam] call fnc_veh_setFixServer;						
} forEach _hitPoints;
_object setvelocity [0,0,1];
_object setFuel _fuel;
_object call fnc_veh_ResetEH;









if (_object isKindOf "AN2_DZ") then {
_object addWeapon "M240_veh";
_object addMagazine "100Rnd_762x51_M240";
_object addMagazine "100Rnd_762x51_M240";
_object addMagazine "100Rnd_762x51_M240";
_object addMagazine "100Rnd_762x51_M240";
};
if (_object isKindOf "AH6X_DZ") then {
_object addWeapon "M240_veh";
_object addMagazine "100Rnd_762x51_M240";
_object addMagazine "100Rnd_762x51_M240";
_object addMagazine "100Rnd_762x51_M240";
_object addMagazine "100Rnd_762x51_M240";
};
if (_object isKindOf "MH6J_DZ") then {
_object addWeapon "M240_veh";
_object addMagazine "100Rnd_762x51_M240";
_object addMagazine "100Rnd_762x51_M240";
_object addMagazine "100Rnd_762x51_M240";
_object addMagazine "100Rnd_762x51_M240";
};
} else { 
if (_type in SafeObjects) then {
if (_object isKindOf "TentStorage" || _object isKindOf "CamoNet_DZ" || _object isKindOf "Land_A_tent") then {


_pos set [2,0];
_object setPosATL _pos;
_object addMPEventHandler ["MPKilled",{_this call vehicle_handleServerKilled;}];
};
if (_object isKindOf "TKOrdnanceBox_EP1") then {
_object setVariable ["permaLoot",true,true];
_clanarray = [];
_clanarray = _hitPoints;
_object setVariable ["YouSuck",_clanarray,true];
_object allowDamage false;
_object addEventHandler ["HandleDamage", {false}];
};

if (_object isKindOf "TrapItems") then {
_object setVariable ["armed", _inventory select 0, false];
};
} else {
_damage = 1;
_object setDamage _damage;
diag_log format["OBJ: %1 - %2 REMOVED", _object,_damage];
};
};



dayz_serverObjectMonitor set [count dayz_serverObjectMonitor,_object];
};
sleep 0.01;
} forEach _myArray;



createCenter civilian;
if (isDedicated) then {
endLoadingScreen;
};

if (isDedicated) then {
_id = [] execFSM "\z\addons\dayz_server\system\server_cleanup.fsm";
};

allowConnection = true;


call compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\fa_antiwallhack.sqf";

sm_done = true;
publicVariable "sm_done";

dayz_Plantspawner = [] spawn {
[300] call server_plantSpawner;
};
[] spawn server_spawnCrashSiteMission1;
[] spawn server_spawnCrashSiteMission2;
[] spawn server_spawnCrashSiteMission3;
[] spawn server_basedefend;



[] spawn {
private ["_array","_array2","_array3","_script","_armed"];
_array = str dayz_traps;
_array2 = str dayz_traps_active;
_array3 = str dayz_traps_trigger;

while { true } do {
if ((str dayz_traps != _array) || (str dayz_traps_active != _array2) || (str dayz_traps_trigger != _array3)) then {
_array = str dayz_traps;
_array2 = str dayz_traps_active;
_array3 = str dayz_traps_trigger;

diag_log "DEBUG: traps";
diag_log format["dayz_traps (%2) -> %1", dayz_traps, count dayz_traps];
diag_log format["dayz_traps_active (%2) -> %1", dayz_traps_active, count dayz_traps_active];
diag_log format["dayz_traps_trigger (%2) -> %1", dayz_traps_trigger, count dayz_traps_trigger];
diag_log "DEBUG: end traps";
};

{
if (isNull _x) then {
dayz_traps = dayz_traps - [_x];
};

_script = call compile getText (configFile >> "CfgVehicles" >> typeOf _x >> "script");
_armed = _x getVariable ["armed", false];

if (_armed) then {
if !(_x in dayz_traps_active) then {
["arm", _x] call _script;
};
} else {
if (_x in dayz_traps_active) then {
["disarm", _x] call _script;
};
};


} forEach dayz_traps;
};
};
[] execVM "\z\addons\dayz_server\scripts\outside_map.sqf";
};