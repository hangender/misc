#line 1 "z\deathlyrage\breakingpoint_server\system\server_monitor.sqf"
private ["_result","_status","_val","_pos","_wsDone","_dir","_block","_isOK","_countr","_objWpnTypes","_objWpnQty","_dam","_selection","_object","_idKey","_type","_ownerID","_worldspace","_intentory","_hitPoints","_fuel","_damage","_date","_id","_welcome","_key","_myArray","_outcome","_Oilrig","_AircraftCarrier","_spawnCarePackages","_spawnWrecks","_spawnCrashSites"];

if (!isDedicated) exitWith {};

waitUntil{initialized}; 


_Oilrig = objNull;
_Oilrig = createVehicle ["oilrig_base", [10020.368, 1342.6135, -0.043106049], [], 0, "CAN_COLLIDE"];
_Oilrig setPos [10020.368, 1342.6135, -0.043106049];
_Oilrig enableSimulation false;
_AircraftCarrier = objNull;
_AircraftCarrier = createVehicle ["GLT_LHD", [6674.4897, 1949.7725, -0.20630595], [], 0, "CAN_COLLIDE"];
_AircraftCarrier setPos [6674.4897, 1949.7725, -0.20630595];
_AircraftCarrier enableSimulation false;

diag_log "HIVE: Starting";




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

};

_countr = 0;		
{


_countr = _countr + 1;

_idKey = 	_x select 1;
_type =		_x select 2;
_ownerID = 	_x select 3;
_worldspace = _x select 4;
_intentory=	_x select 5;
_hitPoints=	_x select 6;
_fuel =		_x select 7;
_damage = 	_x select 8;
_dir = 0;
_pos = [0,0,0];
_wsDone = false;
if (count _worldspace >= 2) then
{
_dir = _worldspace select 0;
if (count (_worldspace select 1) == 3) then {
_pos = _worldspace select 1;
_wsDone = true;
}
};			
if (!_wsDone) then {
if (count _worldspace >= 1) then { _dir = _worldspace select 0; };
_pos = [getMarkerPos "center",0,4000,10,0,2000,0] call BIS_fnc_findSafePos;
if (count _pos < 3) then { _pos = [_pos select 0,_pos select 1,0]; };
diag_log ("MOVED OBJ: " + str(_idKey) + " of class " + _type + " to pos: " + str(_pos));
};

if (_damage < 1) then {
diag_log("Spawned: " + str(_idKey) + " " + _type);

_object = createVehicle [_type, _pos, [], 0, "CAN_COLLIDE"];
_object setVariable ["lastUpdate",time];

if (_ownerID == "0") then {
_object setVariable ["ObjectID", str(_idKey), true];
} else {
_object setVariable ["ObjectUID", _worldspace call dayz_objectUID2, true];
};
_object setVariable ["CharacterID", _ownerID, true];

clearWeaponCargoGlobal  _object;
clearMagazineCargoGlobal  _object;

if (_object isKindOf "TentStorage") then {
_pos set [2,0];
_object setpos _pos;
_object addMPEventHandler ["MPKilled",{_this call vehicle_handleServerKilled;}]; 
};
_object setdir _dir;
_object setDamage _damage;

if (count _intentory > 0) then {

_objWpnTypes = (_intentory select 0) select 0;
_objWpnQty = (_intentory select 0) select 1;
_countr = 0;					
{
_isOK = 	isClass(configFile >> "CfgWeapons" >> _x);
if (_isOK) then {
_block = 	getNumber(configFile >> "CfgWeapons" >> _x >> "stopThis") == 1;
if (!_block) then {
_object addWeaponCargoGlobal [_x,(_objWpnQty select _countr)];
};
};
_countr = _countr + 1;
} forEach _objWpnTypes; 


_objWpnTypes = (_intentory select 1) select 0;
_objWpnQty = (_intentory select 1) select 1;
_countr = 0;
{
_isOK = 	isClass(configFile >> "CfgMagazines" >> _x);
if (_isOK) then {
_block = 	getNumber(configFile >> "CfgMagazines" >> _x >> "stopThis") == 1;
if (!_block) then {
_object addMagazineCargoGlobal [_x,(_objWpnQty select _countr)];
};
};
_countr = _countr + 1;
} forEach _objWpnTypes;

_objWpnTypes = (_intentory select 2) select 0;
_objWpnQty = (_intentory select 2) select 1;
_countr = 0;
{
_isOK = 	isClass(configFile >> "CfgVehicles" >> _x);
if (_isOK) then {
_block = 	getNumber(configFile >> "CfgVehicles" >> _x >> "stopThis") == 1;
if (!_block) then {
_object addBackpackCargoGlobal [_x,(_objWpnQty select _countr)];
};
};
_countr = _countr + 1;
} forEach _objWpnTypes;
};	

if (_object isKindOf "AllVehicles") then {
{
_selection = _x select 0;
_dam = _x select 1;
if (_selection in dayZ_explosiveParts and _dam > 0.8) then {_dam = 0.8};
[_object,_selection,_dam] call object_setFixServer;
} forEach _hitpoints;
_object setvelocity [0,0,1];
_object setFuel _fuel;
_object call fnc_vehicleEventHandler;
};


dayz_serverObjectMonitor set [count dayz_serverObjectMonitor,_object];
};
} forEach _myArray;




_key = "CHILD:307:";
_result = _key call server_hiveReadWrite;
_outcome = _result select 0;
if(_outcome == "PASS") then {
_date = _result select 1; 
if(isDedicated) then {
setDate _date;
dayzSetDate = _date;
publicVariable "dayzSetDate";
};
diag_log ("HIVE: Local Time set to " + str(_date));
};

call server_UpdateBans;
call server_UpdateGlobalVars;
call server_UpdateScripts;

createCenter civilian;

if (isDedicated) then {
endLoadingScreen;
};

hiveInUse = false;


call compile preProcessFileLineNumbers "\z\deathlyrage\breakingpoint_server\objects\ChernoChurch.sqf";
call compile preProcessFileLineNumbers "\z\deathlyrage\breakingpoint_server\objects\DevilsCastle.sqf";
call compile preProcessFileLineNumbers "\z\deathlyrage\breakingpoint_server\objects\Khelm.sqf";
call compile preProcessFileLineNumbers "\z\deathlyrage\breakingpoint_server\objects\Polana.sqf";
call compile preProcessFileLineNumbers "\z\deathlyrage\breakingpoint_server\objects\Bambi.sqf";
call compile preProcessFileLineNumbers "\z\deathlyrage\breakingpoint_server\objects\ChernoRoadblock.sqf";
call compile preProcessFileLineNumbers "\z\deathlyrage\breakingpoint_server\objects\Graveyard_1.sqf";
call compile preProcessFileLineNumbers "\z\deathlyrage\breakingpoint_server\objects\Graveyard_2.sqf";
call compile preProcessFileLineNumbers "\z\deathlyrage\breakingpoint_server\objects\Prison.sqf";
call compile preProcessFileLineNumbers "\z\deathlyrage\breakingpoint_server\objects\Scrapyard.sqf";
call compile preProcessFileLineNumbers "\z\deathlyrage\breakingpoint_server\objects\PeodbaDam.sqf";
call compile preProcessFileLineNumbers "\z\deathlyrage\breakingpoint_server\objects\Nohrt_Cherno.sqf";
call compile preProcessFileLineNumbers "\z\deathlyrage\breakingpoint_server\objects\Nohrt_Dubrocka.sqf";
call compile preProcessFileLineNumbers "\z\deathlyrage\breakingpoint_server\objects\Nohrt_Forrest.sqf";
allowConnection = true;

_spawnCrashSites =    [
6,        
3,        
675,     
1350,      
0.5,        
'center', 
4000,     
true,     
false,    
false,    
1,        
0.25     
] spawn server_spawnCrashSite;



for "_x" from 1 to 6 do {
[] spawn spawn_carePackages;
};


for "_x" from 1 to 20 do {
[] spawn spawn_wrecks;
};

