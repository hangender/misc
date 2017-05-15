



private ["_object","_type","_objectID","_uid","_lastUpdate","_needUpdate","_object_position","_object_inventory","_object_damage","_isNotOk","_garage"];




_object = 	_this select 0;
_type = 	_this select 1;
_forced = false;
if (count _this > 2) then {
_forced = _this select 2;
};
_parachuteWest = typeOf _object == "ParachuteWest";
_isNotOk = false;

_objectID = "0";
_uid = "0";

if (!((isNil "_object") OR {(isNull _object)})) then {
_objectID = _object getVariable ["ObjectID","0"];
_uid = _object getVariable ["ObjectUID","0"];
};

if ((typeName _objectID != "string") || (typeName _uid != "string")) then
{ 

diag_log(format["Non-string Object: ID %1 UID %2", _objectID, _uid]);


_objectID = "0";
_uid = "0";
};

if (!_parachuteWest) then {
if ((typeOf _object) in SafeObjects) then {

} else {
if (_objectID == "0" && _uid == "0") then
{
_object_position = getPosATL _object;

diag_log(format["Deleting object %1 with invalid ID at pos [%2,%3,%4]",
typeOf _object,
_object_position select 0,
_object_position select 1, 
_object_position select 2]);

_isNotOk = true;
};
};
};

if (_isNotOk) exitWith { deleteVehicle _object; };

_lastUpdate = _object getVariable ["lastUpdate",diag_tickTime];
_needUpdate = _object in needUpdate_objects;


_object_position = {
private["_position","_worldspace","_fuel","_key"];
_position = getPosATL _object;
_worldspace = [
round(direction _object),
_position
];
_fuel = 0;
if (_object isKindOf "AllVehicles") then {
_fuel = fuel _object;
};
_key = format["CHILD:305:%1:%2:%3:",_objectID,_worldspace,_fuel];

diag_log ("HIVE: WRITE: "+ str(_key));


_key call server_hiveWrite;
};

_object_inventory = {
private["_inventory","_previous","_key"];
if (_object isKindOf "TrapItems") then {
_inventory = [_object getVariable ["armed", false]];
} else {
_inventory = [
getWeaponCargo _object,
getMagazineCargo _object,
getBackpackCargo _object
];
};
_previous = str(_object getVariable["lastInventory",[]]);
if (str(_inventory) != _previous) then {
_object setVariable["lastInventory",_inventory];
if (_objectID == "0") then {
_key = format["CHILD:309:%1:%2:",_uid,_inventory];
_key call server_hiveWrite;
} else {
_damage = damage _object;
if (_damage > 0.95) then {
_garage = getPosATL _object nearObjects ["Land_sara_hasic_zbroj",7];
if (!((count _garage) > 1)) then {
_key = format["CHILD:303:%1:%2:",_objectID,_inventory];
_key call server_hiveWrite;
}
else {
diag_log("ANTI EXPLOIT: WONT UPDATE DESTORYED VEHICLE IN GARAGE");
};
}
else {
_key = format["CHILD:303:%1:%2:",_objectID,_inventory];
_key call server_hiveWrite;
};
};

diag_log ("HIVE: WRITE: "+ str(_key));

};
};

_object_damage = {

private["_hitpoints","_array","_hit","_selection","_key","_damage"];
_hitpoints = _object call vehicle_getHitpoints;
_damage = damage _object;
_array = [];
{
_hit = [_object,_x] call object_getHit;
_selection = getText (configFile >> "CfgVehicles" >> (typeOf _object) >> "HitPoints" >> _x >> "name");
if (_hit > 0) then {
_array set [count _array,[_selection,_hit]];

} else {
_array set [count _array,[_selection,0]]; 
};



} forEach _hitpoints;

if (_forced) then {	
if (_object in needUpdate_objects) then {
needUpdate_objects = needUpdate_objects - [_object];
};

if (_objectID == "0") then {
_key = format["CHILD:306:%1:%2:%3:",_uid,_array,_damage];
} else {
_garage = getPosATL _object nearObjects ["Land_sara_hasic_zbroj",7];
if (!((count _garage) > 1)) then {
_key = format["CHILD:306:%1:%2:%3:",_objectID,_array,_damage];
diag_log ("HIVE: WRITE: "+ str(_key));
_key call server_hiveWrite;	
};
};
} else {		
if (!(_object in needUpdate_objects)) then {
diag_log format["DEBUG: Monitoring: %1",_object];
needUpdate_objects set [count needUpdate_objects, _object];
};
};
};

_object_killed = {
[_ObjectID,_UID] call server_deleteObj;
};


_object setVariable ["lastUpdate",time,true];
switch (_type) do {
case "all": {
call _object_position;
call _object_inventory;
call _object_damage;
};
case "position": {
call _object_position;
};
case "gear": {
call _object_inventory;
};
case "damage"; case "repair" : {
call _object_damage;
};
case "killed": {
call _object_killed;
};
};