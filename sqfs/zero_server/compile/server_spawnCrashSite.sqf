#line 1 "z\addons\zero_server\compile\server_spawnCrashSite.sqf"






private ["_guaranteedLoot","_randomizedLoot","_frequency","_variance","_spawnChance","_spawnMarker","_spawnRadius","_spawnFire","_fadeFire","_useStatic","_preWaypoints","_crashDamage"];

_frequency =		_this select 0;
_variance =			_this select 1;
_spawnChance =		_this select 2;
_spawnMarker =		_this select 3;
_spawnRadius =		_this select 4;
_spawnFire =		_this select 5;
_fadeFire =			_this select 6;

_useStatic =	false;
_preWaypoints =	1;
_crashDamage =	0.7;



while {true} do
{
private ["_timeAdjust","_timeToSpawn","_heliModel","_heliStart","_safetyPoint","_crashModel","_exploRange","_lootRadius","_lootTable","_crashName","_spawnRoll","_staticSites","_position","_message","_key","_startTime","_aiGroup","_helicopter","_pilot","_crashSite","_gunner","_preWaypointPos","_wp","_wp2","_wp3","_boomPos","_pos","_dir","_crash","_num","_config","_itemTypes","_index","_weights","_cntWeights","_itemType","_lootPos","_lootItem","_lootArray","_deadBody","_endTime"];


_timeAdjust = round((random(_variance * 2)) - _variance);
_timeToSpawn = diag_tickTime + _frequency + _timeAdjust;


_heliModel = ["ZERO_MH60S","ZERO_MH60S","ZERO_CH47","ZERO_CH47","ZERO_MV22","ZERO_MV22","ZERO_Merlin_HC3_D","ZERO_Merlin_HC3_D","ZERO_Mi8","ZERO_Mi8","ZERO_Mi24","ZERO_Mi24"] call BIS_fnc_selectRandom;


_safetyPoint = [7500,15000];

switch (_heliModel) do
{
case "ZERO_MV22":
{
_crashModel = "ZERO_MV22Wreck";
_exploRange = 400;
_lootRadius = 0.5;
_lootTable = "AmericanCrash";
_heliStart = [[1000,100,300],[7000,100,300],[13000,100,300],[13000,100,300]] call BIS_fnc_selectRandom;
};
case "ZERO_MH60S":
{
_crashModel = "ZERO_UH60Wreck";
_exploRange = 175;
_lootRadius = 0.3;
_lootTable = "AmericanCrash";
_heliStart = [[1000,100,300],[7000,100,300],[13000,100,300],[13000,100,300]] call BIS_fnc_selectRandom;
};
case "ZERO_CH47":
{
_crashModel = "ZERO_CH47FWreck";
_exploRange = 175;
_lootRadius = 0.5;
_lootTable = "GermanCrash";
_heliStart = [[1000,100,300],[7000,100,300],[13000,100,300],[13000,100,300]] call BIS_fnc_selectRandom;
};
case "ZERO_Merlin_HC3_D":
{
_crashModel = "ZERO_HC3Wreck";
_exploRange = 175;
_lootRadius = 0.4;
_lootTable = "BritishCrash";
_heliStart = [[1000,100,300],[7000,100,300],[13000,100,300],[13000,100,300]] call BIS_fnc_selectRandom;
};
case "ZERO_Mi8":
{
_crashModel = "ZERO_Mi8Wreck";
_exploRange = 175;
_lootRadius = 0.4;
_lootTable = "RussianOLDCrash";
_heliStart = [[15500,3000,300],[15500,6000,300],[15500,9000,300],[15500,9000,300]] call BIS_fnc_selectRandom;
};
case "ZERO_Mi24":
{
_crashModel = "ZERO_Mi24Wreck";
_exploRange = 175;
_lootRadius = 0.5;
_lootTable = "RussianNEWCrash";
_heliStart = [[15500,3000,300],[15500,6000,300],[15500,9000,300],[15500,9000,300]] call BIS_fnc_selectRandom;
_preWaypoints = 2;
_useStatic = true;
};
};

_crashName	= getText (configFile >> "CfgVehicles" >> _heliModel >> "displayName");




while {diag_tickTime < _timeToSpawn} do
{
sleep 5;
};

_spawnRoll = random 1;


if (_spawnRoll <= _spawnChance) then
{
_staticSites = [[6701,2540],[10489,2345],[11985,9192],[6316,7803]];
_position = [getMarkerPos _spawnMarker,0,_spawnRadius,10,0,2000,0] call BIS_fnc_findSafePos;


_message = format["%1 started flying to %2",_crashName,_position];
_key = format["CHILD:601:%1:%2:%3:%4:","CRASH",(_heliStart select 0),(_heliStart select 1),_message];
_key call server_hiveWrite;


_startTime = diag_tickTime;


_crashSite = createVehicle ["HeliHEmpty", [(_position select 0),(_position select 1),0],[],0,"CAN_COLLIDE"];


switch (_heliModel) do
{
case "ZERO_Mi24":
{
_aiGroup = createGroup east;
_pilot = _aiGroup createUnit ["ZERO_PILOT_RU",[(_heliStart select 0),(_heliStart select 1),0],[],0,"FORM"];
_gunner = _aiGroup createUnit ["ZERO_PILOT_RU",[(_heliStart select 0)+3,(_heliStart select 1)+3,0],[],0,"FORM"];

_helicopter = createVehicle [_heliModel,_heliStart,[],0,"FLY"];
_helicopter engineOn true;

_pilot moveInDriver _helicopter;
_pilot assignAsDriver _helicopter;
_gunner moveInGunner _helicopter;
_gunner assignAsGunner _helicopter;

_aiGroup setCombatMode "RED";
_helicopter flyInHeight 80;
_helicopter setSpeedMode "LIMITED";
};
case "ZERO_CH47":
{
_aiGroup = createGroup civilian;
_pilot = _aiGroup createUnit ["ZERO_PILOT_US",[(_heliStart select 0),(_heliStart select 1),0],[],0,"FORM"];
_gunner = _aiGroup createUnit ["ZERO_PILOT_US",[(_heliStart select 0)+3,(_heliStart select 1)+3,0],[],0,"FORM"];

_helicopter = createVehicle [_heliModel,_heliStart,[],0,"FLY"];
_helicopter engineOn true;

_pilot moveInDriver _helicopter;
_pilot assignAsDriver _helicopter;
_gunner moveInGunner _helicopter;
_gunner assignAsGunner _helicopter;

_aiGroup setCombatMode "GREEN";
_helicopter flyInHeight 120;
_helicopter setSpeedMode "LIMITED";
};
default
{
_aiGroup = createGroup civilian;
_pilot = _aiGroup createUnit ["ZERO_CREW",[_position select 0,_position select 1,0],[],0,"FORM"];
removeAllWeapons _pilot;
removeAllItems _pilot;

_helicopter = createVehicle [_heliModel,_heliStart,[],0,"FLY"];
_helicopter engineOn true;
_helicopter flyInHeight 120;

_pilot moveInDriver _helicopter;
_pilot assignAsDriver _helicopter;
_aiGroup setCombatMode "BLUE";
};
};

_helicopter setVariable ["ObjectID","1",true];
sleep 0.5;


if (_preWaypoints > 0) then
{
for "_x" from 1 to _preWaypoints do
{

if (_useStatic) then
{
_preWaypointPos = _staticSites call BIS_fnc_selectRandom;
}
else
{
_preWaypointPos = [(getMarkerPos _spawnMarker),0,_spawnRadius,10,0,2000,0] call BIS_fnc_findSafePos;
};
_wp = _aiGroup addWaypoint [_preWaypointPos,0];
if (_heliModel == "ZERO_Mi24") then
{
_wp setWaypointType "SAD";
_wp setWaypointBehaviour "AWARE";
}
else
{
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "CARELESS";
};
};
};

_wp2 = _aiGroup addWaypoint [position _crashSite,0];
if (_heliModel == "ZERO_Mi24") then
{
_wp2 setWaypointType "MOVE";
_wp2 setWaypointBehaviour "AWARE";
}
else
{
_wp2 setWaypointType "MOVE";
_wp2 setWaypointBehaviour "CARELESS";
};


_wp2 setWaypointStatements ["true","_helicopter setDamage 1;"];




_wp3 = _aiGroup addWaypoint [_safetyPoint,0];
if (_heliModel == "ZERO_Mi24") then
{
_wp3 setWaypointType "CYCLE";
_wp3 setWaypointBehaviour "AWARE";
}
else
{
_wp3 setWaypointType "CYCLE";
_wp3 setWaypointBehaviour "CARELESS";
};


waitUntil
{
sleep 0.5;
(((_helicopter distance _position) < 1200) || (!alive _helicopter) || ((getPosATL _helicopter select 2) < 5) || ((damage _helicopter) > _crashDamage))
};

_helicopter flyInHeight 80;
_helicopter setSpeedMode "LIMITED";
_helicopter forceSpeed 100;


waitUntil
{
sleep 0.3;
(((_helicopter distance _position) < _exploRange) || (!alive _helicopter) || ((getPosATL _helicopter select 2) < 5) || ((damage _helicopter) > _crashDamage))
};


if ((_heliModel == "ZERO_MV22") || (_heliModel == "ZERO_CH47")) then
{
_helicopter setDamage 1;
_helicopter setFuel 0;
_pilot setDamage 1;
}
else
{
_helicopter setHit ["mala vrtule",1];

_pilot setDamage 1;
};

_boomPos = getPosATL _helicopter;


_message = format["%1 just exploded at altitude %2",_crashName,(_boomPos select 2)];
_key = format["CHILD:601:%1:%2:%3:%4:","CRASH",(_boomPos select 0),(_boomPos select 1),_message];
_key call server_hiveWrite;


sleep 15;


_pos = [(getPosATL _helicopter select 0),(getPosATL _helicopter select 1),0];


_dir = getDir _helicopter;






switch (_heliModel) do
{
case "ZERO_Mi24":
{
deleteVehicle _pilot;
deleteVehicle _gunner;
deleteVehicle _helicopter;
deleteVehicle _crashSite;

_num = 8 + round(random 2);
};
case "ZERO_CH47":
{
deleteVehicle _pilot;
deleteVehicle _gunner;
deleteVehicle _helicopter;
deleteVehicle _crashSite;

_num = 6 + round(random 4);
};
default
{
deleteVehicle _pilot;
deleteVehicle _helicopter;
deleteVehicle _crashSite;

_num = 4 + round(random 6);
};
};


deleteGroup _aiGroup;

_crash = createVehicle [_crashModel, _pos, [], 0, "CAN_COLLIDE"];

_crash setVariable ["ObjectID","1",true];



_crash setDir _dir;


if (_spawnFire) then
{
dayzFire = [_crash,2,time,false,_fadeFire];
publicVariable "dayzFire";
_crash setVariable ["fadeFire",_fadeFire,true];
};

_lootArray = [];

_config = configFile >> "CfgBuildingLoot" >> _lootTable;
_itemTypes = getArray (_config >> "itemType");
_index = dayz_CBLBase find _lootTable;
_weights = dayz_CBLChances select _index;
_cntWeights = count _weights;


for "_x" from 1 to _num do
{

_index = floor(random _cntWeights);
_index = _weights select _index;
_itemType = _itemTypes select _index;


_lootPos = [_pos, ((random 2) + (sizeOf(_crashModel) * _lootRadius)), random 360] call BIS_fnc_relPos;
[_itemType select 0,_itemType select 1,_lootPos,0] call server_spawnLoot;

if (_itemType select 0 != "") then
{
_lootArray = _lootArray + [_itemType select 0];
};
};

_key = format["CHILD:601:%1:%2:%3:%4:","LOOT",(_pos select 0),(_pos select 1),_lootArray];
_key call server_hiveWrite;


for "_x" from 1 to 3 do
{
_lootPos = [_pos, ((random 4)+3), random 360] call BIS_fnc_relPos;
_deadBody = createVehicle[["Body1","Body2"] call BIS_fnc_selectRandom,_lootPos,[], 0, "CAN_COLLIDE"];
_deadBody setDir (random 360);
};

_endTime = diag_tickTime - _startTime;


_message = format["Crash completed! Flew for %1s and crashed %2m from target",_endTime,round(_position distance _crash)];
_key = format["CHILD:601:%1:%2:%3:%4:","CRASH",(_pos select 0),(_pos select 1),_message];
_key call server_hiveWrite;
};
};