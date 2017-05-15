






























































fa_coor2str = {
private["_pos","_res","_nearestCity","_town"];

_pos = +(_this);
if (count _pos < 1) then { _pos = [0,0]; }
else { if (count _pos < 2) then { _pos = [_pos select 0,0]; };
};
_nearestCity = nearestLocations [_pos, ["NameCityCapital","NameCity","NameVillage","NameLocal"],1000];
_town = "Wilderness";
if (count _nearestCity > 0) then {_town = text (_nearestCity select 0)};
_res = format["%1 [%2:%3]", _town, round((_pos select 0)/100), round((15360-(_pos select 1))/100)];

_res
};


fa_veh2str = {
private["_res","_oid", "_type"];

_res = "anything";
if (!isNil "_this") then {
_oid = _this getVariable ["ObjectID", nil];
if (isNil "_oid" OR {(_oid == "")}) then { 
_oid = "Hacked vehicle owned by PID#" + str(owner _this); 
} 
else { 
_oid = "OID#" + _oid; 
};
_type = getText(configFile >> "CfgVehicles" >> (typeOf _this) >> "displayName");
if (_type == "") then { _type = typeOf _this; };
_res = format["%1(%2)", _oid, _type ];
};

_res
};


fa_plr2str = {
private["_x","_res","_name"];
_x = _this;
_res = "nobody";
if (!isNil "_x") then {
_name = _x getVariable ["bodyName", nil];
if ((isNil "_name" OR {(_name == "")}) AND ({alive _x})) then { _name = name _x; };
if (isNil "_name" OR {(_name == "")}) then { _name = "UID#"+(getPlayerUID _x); };
_res = format["PID#%1(%2)", owner _x, _name ];
};
_res
};



fa_isoutofmap = {
private ["_SWcorner","_NEcorner"];
_SWcorner = getArray(configFile >> "CfgPatches" >> "vehMaint" >> (worldName) >> "SWcorner");
_NEcorner = getArray(configFile >> "CfgPatches" >> "vehMaint" >> (worldName) >> "NEcorner");
(!((((_this select 0 >= _SWcorner select 0) AND {(_this select 0 <= _NEcorner select 0)})  
AND {(_this select 1 >= _SWcorner select 1)}) AND {(_this select 1 <= _NEcorner select 1)}))
};


fa_spawninventory = { 	
private["_partType","_partChance","_lootWeight","_config","_itemType","_itemChance","_weights",
"_index","_y","_partWeight","_spawnType","_spawnChance","_inventory","_weaponType","_weaponQty" ];

_partType = _this select 0;
_partChance = _this select 1;
_config = configFile >> "CfgBuildingLoot" >> "HeliCrash";

_itemType =	(getArray (_config >> "itemType"));
{ _itemType set [count _itemType, [_x,"object"]] } forEach _partType;
_itemChance = getArray (_config >> "itemChance");


_partWeight = 0; { _partWeight = _partWeight + _x; } forEach _partChance;				

_lootWeight = 0; { _lootWeight = _lootWeight + _x; } forEach _itemChance;


{ _itemChance set [count _itemChance, _x  * _lootWeight / _partWeight]; } forEach _partChance;				

_partWeight = ceil(random(_partWeight));

_spawnType = [];
_spawnQty = [];
_weaponType = [];
_weaponQty = [];
_weights = [_itemType,_itemChance] call fnc_buildWeightedArray;
for "_x" from 0 to _partWeight do {
_index = _weights call BIS_fnc_selectRandom;
if (_index < count _itemType) then {
_y=(_itemType select _index) select 0;
if (_y != "") then {
if (_y isKindOf "Pistol" OR _y isKindOf "RifleCore" OR _y isKindOf "Binocular") then {
_weaponType set [count _weaponType, _y ];
_weaponType set [count _weaponType, 1];  
}
else {
_spawnType set [count _spawnType, _y ];
_spawnQty set [count _spawnQty, 1];  
};
};
};
};
_inventory = [[_weaponType,_weaponQty],[_spawnType,_spawnQty],[[],[]]];
_inventory
};


fa_populateCargo = {
private["_entity","_config","_magItemTypes","_magItemQtys","_i","_inventory"];
_entity = _this select 0;
_inventory = _this select 1;

clearWeaponCargoGlobal  _entity;
clearMagazineCargoGlobal  _entity;
clearBackpackCargoGlobal  _entity;	 
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
case 0: { _entity addWeaponCargoGlobal [_x,(_magItemQtys select _forEachIndex)]; }; 
case 1: { _entity addMagazineCargoGlobal [_x,(_magItemQtys select _forEachIndex)]; }; 
case 2: { _entity addBackpackCargoGlobal [_x,(_magItemQtys select _forEachIndex)]; }; 
};
};
};
} forEach _magItemTypes;
} forEach _inventory;	
};




dayZ_damageableParts = [ "motor", "sklo predni P", "sklo predni L", "karoserie", "palivo", "wheel_1_1_steering", "wheel_2_1_steering", "wheel_1_2_steering", "wheel_2_2_steering", "glass1", "glass2", "glass3", "glass4"

];




fa_setDamagedParts = {
private ["_part_damage", "_part_name", "_damage", "_hitpoints"];
_damage = 0; 
_hitpoints = _this;
{
_part_damage = 0.05; 
if (random(3)<1) then { _part_damage =  0.80; };
_part_name = getText (configFile >> "CfgVehicles" >> (typeOf _entity) >> "HitPoints" >> _x >> "name");
if (_part_name IN dayZ_damageableParts) then {
_damage = _damage + _part_damage;
_hitpoints set [count _hitpoints, [ _part_name, _part_damage ]];
};
} forEach (_entity call vehicle_getHitpoints);
_damage = _damage / (1 + (count _hitpoints)); 

_damage
};

fa_tentEmpty = {
( (count _this == 0) || {
(count ((_this select 0) select 0) == 0) &&
(count ((_this select 1) select 0) == 0) &&
(count ((_this select 2) select 0) == 0)
})
};


fa_removeExtraTents = {
private ["_emptytenttotal",  "_idx", "_intentory", "_k", "_maxEmptyTents", "_allowedEmptyTents", "_ownerID", "_stall", "_tentcur", "_tentidx", "_tentowner", "_y", "_z", "_myArray"];

_myArray = _this select 0;
_maxEmptyTents = _this select 1;
_allowedEmptyTents = _this select 2;

_tentowner=[];
_tentidx=[];
_tentcur=[];
_emptytenttotal=0;

{
if ((_x select 2) == "TentStorage") then {
_idx=_forEachIndex;
_ownerID = _x select 3;	
if (!(_ownerID IN _tentowner)) then {
_tentidx set [count _tentidx, []];
_tentcur set [count _tentcur, 0];
_tentowner set [count _tentowner, _ownerID];
};
_intentory = (_x select 5);
if (_intentory call fa_tentEmpty) then {
{
if (_x == _ownerID) then {
(_tentidx select _forEachIndex) set [count (_tentidx select _forEachIndex), _idx];
_emptytenttotal = _emptytenttotal + 1;
};
} forEach _tentowner;
};
};
} forEach _myArray;
diag_log (format [ "fa_removeExtraTents: Empty tents: %1, would like less than %2.",
_emptytenttotal,
_maxEmptyTents
]);
if (_emptytenttotal > _maxEmptyTents) then {
for [{_k = _emptytenttotal / 2}, {_k >= 2}, {_k = _k / 2}] do {
_stall = 0;
while {_emptytenttotal > _maxEmptyTents && _stall == 0} do {
_stall = 1;
for [{_x = (count _tentidx) - 1}, {_x >= 0 && _emptytenttotal >= _maxEmptyTents}, {_x = _x - 1}] do {
_y = _tentidx select _x;
_z = _tentcur select _x;
if (_z < (count _y) -_allowedEmptyTents + 2 - _k) then {
_idx = _myArray select (_y select _z);



	
_idx set [ 8, 1 ]; 
_emptytenttotal = _emptytenttotal - 1;
_tentcur set [_x, _z + 1];
_stall=0;
};
};
_z =_z + 1;
};
};
};
};	




fa_checkVehicles = {
private ["_vehcat", "_myArray", "_y", "_j","_type", "_count", "_idKey" ];
_myArray = _this select 0;


_vehcat = [];
_list = configFile >> "CfgPatches" >> "vehMaint";
for "_x" from 0 to (count _list - 1) do {
_class = configname (_list select _x);
_qty = getNumber(configFile >> "CfgPatches" >> "vehMaint" >> _class >> "quantity");
if (_qty > 0) then {
_vehcat set [count _vehcat, [_class, _qty]];

};
};


{
_type =	_x select 2;
for "_j" from 0 to (count _vehcat-1) do {
if (_type == ((_vehcat select _j) select 0)) then {
_count = ((_vehcat select _j) select 1);
if (_count > 0) then {
(_vehcat select _j) set [1, (_count-1)];
if ((_x select 8) >= 1) then { 

};
}

;_j = 999999; 
};
};
} foreach _myArray;


};


fa_staywithus = {

private["_a","_dir","_px","_py","_b","_cx","_cy","_k", "_SWcorner", "_NEcorner"];

_dir = +(_this select 0);  
_a = +(_this select 1);  

_SWcorner = getArray(configFile >> "CfgPatches" >> "vehMaint" >> (worldName) >> "SWcorner");
_NEcorner = getArray(configFile >> "CfgPatches" >> "vehMaint" >> (worldName) >> "NEcorner");

_a = ASLtoATL [_a select 0, _a select 1, 0];
if ((((_a select 2) > 9) AND {(surfaceisWater _a)})  
OR {(_a call fa_isoutofmap)}) then { 

_px = _a select 0;
_py = _a select 1; 
_b = getMarkerpos "center";

_cx = (_b select 0) - _px; if (_cx == 0) then { _cx = 0.00001; };
_cy = (_b select 1) - _py; if (_cy == 0) then { _cy = 0.00001; };
if (_px <= (_SWcorner select 0)) then { _py = _py + (1 + (_SWcorner select 0) - _px) / _cx * _cy; _px = 1 + (_SWcorner select 0); };
if (_py <= (_SWcorner select 1)) then { _px = _px + (1 + (_SWcorner select 1) - _py) / _cy * _cx; _py = 1 + (_SWcorner select 1); };
if (_px >= (_NEcorner select 0)) then { _py = _py + ((_NEcorner select 0) - 1 - _px) / _cx * _cy; _px = (_NEcorner select 0) - 1; };
if (_py >= (_NEcorner select 1)) then { _px = _px + ((_NEcorner select 1) - 1 - _py) / _cy * _cx; _py = (_NEcorner select 1) - 1; };

_dir = atan(_cx / _cy);
if (_cy < 0) then { _dir = _dir + 180; };


_a = [_px,_py,0];
for "_k" from 0 to 1 step 0.005 do {
_a = [_px + _cx * _k, _py + _cy * _k, 0];

if (surfaceisWater _a) then {
_a = ASLtoATL [_a select 0, _a select 1, 0];
if (((_a select 2) < 9) AND{(!(_a call fa_isoutofmap))}) then { _k = 2; }
else { if ((_a select 2) < 30) then { _k = _k - 0.0045; };}; 
}
else {
if (!(_a call fa_isoutofmap)) then { _k = 2; };
};
};






};


if (([(_this select 1),_a] call BIS_fnc_distance2Dsqr) <= 30) then { 
[_this select 0, +(_this select 1)]
}
else {
[ _dir, [_a select 0, _a select 1, 0]]
}
};


stream_locationFill = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\stream_locationFill.sqf";
dayz_locationsActive = [];

fa_server_locationCheck = {
private ["_point","_rad","_config","_i","_location","_distCfg","_distAct"];

_point = _this select 0;
_rad = _this select 1;
_config = configFile >> "CfgTownGeneratorChernarus";

if (count _point >= 2) then {
for "_i" from (count _config -1) to 0 step -1 do {
_x = _config select _i;
_location = getArray (_x >> "position");
_distCfg = getNumber (_x >> "size");
_distAct = [_point select 0, _point select 1, 0] distance [_location select 0, _location select 1, 0];

if (!(_i in dayz_locationsActive)) then {
if (_distAct < _distCfg + _rad) then {
dayz_locationsActive set [count dayz_locationsActive,_i];
diag_log format ["%1::fa_server_locationCheck : creating %2 objects at '%3'", "z\addons\dayz_server\compile\fa_hiveMaintenance.sqf", count _x, _location];
[_x, false] call stream_locationFill; 
};
};
};
};
};


fa_smartlocation_commonTests = { 
private ["_found", "_point", "_worldspace"];

_found = false;
_point = _this select 1;



_point set [2, 0];
_point = ATLtoASL _point;
if (((_point select 2) < _this select 3) AND {((_point select 2) > _this select 2)}) then {
if (count (_point nearEntities [["Air", "LandVehicle", "Ship"], _this select 4]) <= 0) then { 
if (_this select 3 < 0) then { 
_found = surfaceisWater _point;
}
else { 
_point set [2, 0];
_worldspace = [_this select 0, _point] call fn_niceSpot;						
if (count _worldspace == 2) then {
_point = _worldspace select 1;
(_this select 1) set [0, _point select 0];
(_this select 1) set [1, _point select 1];
(_this select 1) set [2, 0];
_found = true;
};
};
};
};


_found
};


fa_smartlocation = { 
private ["_type","_class","_dir","_oldpos","_action","_distance","_minAltitude","_maxAltitude","_tmpobject","_width","_found","_wp","_worldCenter","_worldRadius","_locations","_radius","_nearObjectTypes","_types","_pickedLocation","_o","_objects","_counter","_locpos","_loc","_y","_r","_deg","_veh","_size","_old", "_point"];

_type = _this select 0; 
_class = _type;
if (_type isKindOf "Air") then { _class = "Land_Ind_TankBig"; }; 
_dir = _this select 1;
_oldpos	= +(_this select 2); 
_action	= _this select 3; 
_distance = 500; 

_minAltitude = getNumber(configFile >> "CfgPatches" >> "vehMaint" >> _type >> "minAltitude");
_maxAltitude = getNumber(configFile >> "CfgPatches" >> "vehMaint" >> _type >> "maxAltitude");


_tmpobject = _class createVehicleLocal (getMarkerPos "respawn_west");
sleep 0.01; 
_width = (((boundingBox _tmpobject) select 1) select 0);


_point = [];
_found = false;

if ((!(_action IN [ "CREATED", "SPAWNED"])) and {(count _oldpos>=2)}) then {

_point = +(_oldpos);


if (_type isKindOf "Air") then { 
[_point, 20] call fa_server_locationCheck; 
deleteVehicle _tmpobject;
_tmpobject = _class createVehicleLocal _point;  
_point = getPosATL _tmpobject;
};


_found = true;







}
else {
[_point, 20] call fa_server_locationCheck; 
};
deleteVehicle _tmpobject;
sleep 0.01; 


if (_found) then { [_dir, [_point select 0, _point select 1, 0]] } else { [] }
};