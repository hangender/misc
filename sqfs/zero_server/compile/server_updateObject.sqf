#line 1 "z\addons\zero_server\compile\server_updateObject.sqf"

private ["_object","_type","_key","_fuel","_objectID","_objectUID","_position","_worldspace","_inventory","_previous","_damage","_hitPoints","_array","_hit","_selection","_hitpoints"];

_object = _this select 0;
_type = _this select 1;
_key = "";
_fuel = 0;

if (typeOf _object == "ParachuteWest") exitWith {};

_objectID = _object getVariable ["ObjectID","0"];
_objectUID = _object getVariable ["ObjectUID","0"];

if ((typeName _objectID != "string") || (typeName _objectUID != "string")) then
{ 
diag_log(format["IGEVENT: ALERT: Corrupted object: ID %1 UID %2",_objectID,_objectUID]);

_objectID = "0";
_objectUID = "0";
};

if (_objectID == "1") exitWith {};

if (_objectID == "0" && _objectUID == "0") exitWith
{
_position = getPosATL _object;
diag_log(format["IGEVENT: ALERT: Unknown object %1 at [%2]",(typeOf _object),(getPosATL _object)]);
deleteVehicle _object;
};

switch (_type) do
{
case "all":
{
if (_object isKindOf "AllVehicles") then
{

_position = getPosATL _object;
_worldspace = [round(direction _object),_position];
_fuel = fuel _object;
_key = format["CHILD:305:%1:%2:%3:",_objectID,_worldspace,_fuel];
_key call server_hiveWrite;
};


_inventory = [getWeaponCargo _object,getMagazineCargo _object,getBackpackCargo _object];
_previous = str(_object getVariable["lastInventory",[]]);
if (str(_inventory) != _previous) then
{
_object setVariable["lastInventory",_inventory];
if (_objectID == "0") then
{
_key = format["CHILD:309:%1:%2:",_objectUID,_inventory];
}
else
{
_key = format["CHILD:303:%1:%2:",_objectID,_inventory];
};
_key call server_hiveWrite;
};


_hitPoints = _object call vehicle_getHitpoints;
_damage = damage _object;
_array = [];

{
_hit = [_object, _x] call object_getHit;
_selection = getText (configFile >> "CfgVehicles" >> (typeOf _object) >> "HitPoints" >> _x >> "name");
if (_hit > 0) then
{
_array set [count _array, [_selection, _hit]]
}
else
{
_array set [count _array,[_selection,0]]; 
};
_object setHit [_selection, _hit];
} forEach _hitPoints;

_key = format["CHILD:306:%1:%2:%3:",_objectID,_array,_damage];
_key call server_hiveWrite;
};
case "position":
{
if (_object isKindOf "AllVehicles") then
{
_position = getPosATL _object;
_worldspace = [round(direction _object),_position];
_fuel = fuel _object;
_key = format["CHILD:305:%1:%2:%3:",_objectID,_worldspace,_fuel];
_key call server_hiveWrite;
};
};
case "gear":
{
_inventory = [getWeaponCargo _object,getMagazineCargo _object,getBackpackCargo _object];
_previous = str(_object getVariable["lastInventory",[]]);
if (str(_inventory) != _previous) then
{
_object setVariable["lastInventory",_inventory];
if (_objectID == "0") then
{
_key = format["CHILD:309:%1:%2:",_objectUID,_inventory];
}
else
{
_key = format["CHILD:303:%1:%2:",_objectID,_inventory];
};
_key call server_hiveWrite;
};
};
case "damage":
{
_hitPoints = _object call vehicle_getHitpoints;
_damage = damage _object;
_array = [];

{
_hit = [_object, _x] call object_getHit;
_selection = getText (configFile >> "CfgVehicles" >> (typeOf _object) >> "HitPoints" >> _x >> "name");
if (_hit > 0) then
{
_array set [count _array, [_selection, _hit]]
}
else
{
_array set [count _array,[_selection,0]]; 
};
_object setHit [_selection, _hit];
} forEach _hitPoints;

_key = format["CHILD:306:%1:%2:%3:",_objectID,_array,_damage];
_key call server_hiveWrite;
};
case "repair":
{
_damage = damage _object;
_hitpoints = _object call vehicle_getHitpoints;
_array = [];

{
_hit = [_object,_x] call object_getHit;
_selection = getText (configFile >> "CfgVehicles" >> (typeOf _object) >> "HitPoints" >> _x >> "name");
if (_hit > 0) then {_array set [count _array,[_selection, _hit]]};
} forEach _hitpoints;

_key = format["CHILD:306:%1:%2:%3:",_objectID,_array,_damage];
_key call server_hiveWrite;
};
};