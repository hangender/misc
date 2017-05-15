#line 1 "z\addons\zero_server\compile\server_spawnLoot.sqf"

private ["_iItem","_iClass","_iPos","_radius","_item","_itemTypes","_index","_weights","_cntWeights","_qty","_max","_tQty","_canType","_mags"];

_iItem =	_this select 0;
_iClass =	_this select 1;
_iPos =		_this select 2;
_radius =	_this select 3;

switch (_iClass) do
{
default
{

_item = createVehicle ["WeaponHolder", _iPos, [], _radius, "CAN_COLLIDE"];

_itemTypes = ((getArray (configFile >> "cfgLoot" >> _iClass)) select 0);
_index = dayz_CLBase find _iClass;
_weights = dayz_CLChances select _index;
_cntWeights = count _weights;
_qty = 0;
_max = 1 + ceil(random 2);
while {_qty < _max} do
{
_tQty = 1 + round(random 1);
_index = floor(random _cntWeights);
_index = _weights select _index;
_canType = _itemTypes select _index;
_item addMagazineCargoGlobal [_canType,_tQty];
_qty = _qty + _tQty;
};
if (_iItem != "") then
{
_item addWeaponCargoGlobal [_iItem,1];
};
};
case "weapon":
{

_item = createVehicle ["WeaponHolder", _iPos, [], _radius, "CAN_COLLIDE"];
_item addWeaponCargoGlobal [_iItem,1];
_mags = [] + getArray (configFile >> "cfgWeapons" >> _iItem >> "magazines");
if ((count _mags) > 0) then
{
if (_mags select 0 == "Quiver") then { _mags set [0, "WoodenBolt"] }; 
_item addMagazineCargoGlobal [(_mags select 0), (round(random 2))];
};
};
case "magazine":
{

_item = createVehicle ["WeaponHolder", _iPos, [], _radius, "CAN_COLLIDE"];
_item addMagazineCargoGlobal [_iItem,1];
};
case "object":
{

_item = createVehicle [_iItem, _iPos, [], _radius, "CAN_COLLIDE"];
};
};

if ((count _iPos) > 2) then
{
_item setPosATL _iPos;
};

_item setVariable ["permaLoot",true];
