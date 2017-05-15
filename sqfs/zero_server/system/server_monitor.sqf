#line 1 "z\addons\zero_server\system\server_monitor.sqf"

private["_key","_data","_result","_status","_vehicles","_val","_countr","_objectID","_type","_ownerID","_dir","_pos","_inventory","_hitPoints","_fuel","_damage","_object","_objWpnTypes","_objWpnQty","_isOK","_block","_selection","_dam","_hitpoints"];

waitUntil { initialized };


_key = format["CHILD:302:%1:",zero_instance];
_data = "HiveEXT" callExtension _key;
diag_log ("HIVE: Initialized");


_result = call compile format ["%1",_data];
_status = _result select 0;
_vehicles = [];

if (_status == "ObjectStreamStart") then
{
_val = _result select 1;

diag_log ("HIVE: Commencing object streaming...");
for "_i" from 1 to _val do
{
_data = "HiveEXT" callExtension _key;
_result = call compile format ["%1",_data];

_status = _result select 0;
_vehicles set [count _vehicles,_result];
};
};

_countr = 0;

{

_countr = _countr + 1;

_objectID =		_x select 1;
_type =			_x select 2;
_ownerID =		_x select 3;
_dir =			(_x select 4) select 0;
_pos =			(_x select 4) select 1;
_inventory =	_x select 5;
_hitPoints =	_x select 6;
_fuel =			_x select 7;
_damage =		_x select 8;

if (_damage < 1) then
{
_object = createVehicle [_type,_pos,[],0,"CAN_COLLIDE"];

_object setVariable ["ObjectID",_objectID,true];
_object setVariable ["CharacterID",_ownerID,true];
_object setVariable ["zeroCustom",829549];

clearWeaponCargoGlobal  _object;
clearMagazineCargoGlobal  _object;

if (_object isKindOf "TentStorage") then
{
_pos set [2,0];
_object setPos _pos;
};

_object setDir _dir;
_object setDamage _damage;

if (count _inventory > 0) then
{

_objWpnTypes = (_inventory select 0) select 0;
_objWpnQty = (_inventory select 0) select 1;
_countr = 0;
{
_isOK = 	isClass(configFile >> "CfgWeapons" >> _x);
if (_isOK) then
{
_block = 	getNumber(configFile >> "CfgWeapons" >> _x >> "stopThis") == 1;
if (!_block) then
{
_object addWeaponCargoGlobal [_x,(_objWpnQty select _countr)];
};
};
_countr = _countr + 1;
} forEach _objWpnTypes;


_objWpnTypes = (_inventory select 1) select 0;
_objWpnQty = (_inventory select 1) select 1;
_countr = 0;
{
_isOK = 	isClass(configFile >> "CfgMagazines" >> _x);
if (_isOK) then
{
_block = 	getNumber(configFile >> "CfgMagazines" >> _x >> "stopThis") == 1;
if (!_block) then
{
_object addMagazineCargoGlobal [_x,(_objWpnQty select _countr)];
};
};
_countr = _countr + 1;
} forEach _objWpnTypes;


_objWpnTypes = (_inventory select 2) select 0;
_objWpnQty = (_inventory select 2) select 1;
_countr = 0;
{
_isOK = 	isClass(configFile >> "CfgVehicles" >> _x);
if (_isOK) then
{
_block = 	getNumber(configFile >> "CfgVehicles" >> _x >> "stopThis") == 1;
if (!_block) then
{
_object addBackpackCargoGlobal [_x,(_objWpnQty select _countr)];
};
};
_countr = _countr + 1;
} forEach _objWpnTypes;
};

if (_object isKindOf "AllVehicles") then
{
{
_selection = _x select 0;
_dam = _x select 1;
if (_selection in dayZ_explosiveParts and _dam > 0.8) then {_dam = 0.8};
[_object,_selection,_dam] call object_setFixServer;
} forEach _hitpoints;

_object setVelocity [0,0,1];
_object setFuel _fuel;
_object call fnc_vehicleEventHandler;
};
};
} forEach _vehicles;

call server_setTime;

createCenter east;
createCenter civilian;
east setFriend [resistance,0];
endLoadingScreen;

call server_spawnBarricades;

if (isDedicated) then
{
[] spawn server_maintenance;
[(30*60),(10*60),1,'center',5000,true,false] spawn server_spawnCrashSite;
};
