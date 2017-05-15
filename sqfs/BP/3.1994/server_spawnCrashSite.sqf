#line 1 "z\addons\deathly_breakingpoint_server\compile\server_spawnCrashSite.sqf"






private["_useStatic","_crashDamage","_lootRadius","_preWaypoints","_preWaypointPos","_endTime","_startTime","_safetyPoint","_heliStart","_deadBody","_exploRange","_heliModel","_lootPos","_list","_craters","_dummy","_wp2","_wp3","_landingzone","_aigroup","_wp","_helipilot","_crash","_crashwreck","_smokerand","_staticcoords","_pos","_dir","_position","_num","_config","_itemType","_itemChance","_weights","_index","_iArray","_crashModel","_lootTable","_guaranteedLoot","_randomizedLoot","_frequency","_variance","_spawnChance","_spawnMarker","_spawnRadius","_spawnFire","_permanentFire","_crashName"];



_guaranteedLoot = _this select 0;
_randomizedLoot = _this select 1;
_frequency	= _this select 2;
_variance	= _this select 3;
_spawnChance	= _this select 4;
_spawnMarker	= _this select 5;
_spawnRadius	= _this select 6;
_spawnFire	= _this select 7;
_fadeFire	= _this select 8;

if(count _this > 9) then {
_useStatic = _this select 9;
} else {
_useStatic = false;
};

if(count _this > 10) then {
_preWaypoints	= _this select 10;
} else {
_preWaypoints = 1;
};

if(count _this > 11) then {
_crashDamage = _this select 11;
} else {
_crashDamage = 1;
};

diag_log(format["CRASHSPAWNER: Starting spawn logic for animated helicrashs - written by Grafzahl [SC:%1||PW:%2||CD:%3]", str(_useStatic), str(_preWaypoints), _crashDamage]);

while {true} do {
private["_timeAdjust","_timeToSpawn","_spawnRoll","_crash","_hasAdjustment","_newHeight","_adjustedPos"];

_timeAdjust = round(random(_variance * 2) - _variance);
_timeToSpawn = time + _frequency + _timeAdjust;


_heliModel = ["UH1H_DZ","Mi17_DZ"] call BIS_fnc_selectRandom;


_heliStart = [[6993.7007,173.05298,300],[1623.715,218.18848,300]] call BIS_fnc_selectRandom;


_safetyPoint = [7492.6675, 15263.042];


_crashModel = "UH1Wreck_DZ";
_exploRange = 385;
_lootRadius = 0.50;


if(_heliModel == "Mi17_DZ") then {
_crashModel = "Mi8Wreck";
_exploRange = 385;
_lootRadius = 0.50;
};



_lootTable = ["HeliCrash","MilitarCrash"] call BIS_fnc_selectRandom;




_crashName	= getText (configFile >> "CfgVehicles" >> _heliModel >> "displayName");

diag_log(format["CRASHSPAWNER: %1%2 chance to start a crashing %3 with loot table '%4' at %5", round(_spawnChance * 100), '%', _crashName, _lootTable, _timeToSpawn]);


while {time < _timeToSpawn} do {
sleep 5;
};

_spawnRoll = random 1;


if (_spawnRoll <= _spawnChance) then {


















_staticcoords =	[
[6277.5605,8332.8262],
[1234.5605,4321.8262],
[4545.5605,1256.8262]
];

if(_useStatic) then {
_position = _staticcoords call BIS_fnc_selectRandom;
} else {
_position = [getMarkerPos _spawnMarker,0,_spawnRadius,10,0,2000,0] call BIS_fnc_findSafePos;
};


diag_log(format["CRASHSPAWNER: %1 started flying from %2 to %3 NOW!(TIME:%4||LT:%5)", _crashName,  str(_heliStart), str(_position), round(time), _lootTable]);


_startTime = time;
_crashwreck = createVehicle [_heliModel,_heliStart, [], 0, "FLY"];


_crashwreck setVariable["Sarge",1];

_crashwreck engineOn true;
_crashwreck flyInHeight 120;
_crashwreck forceSpeed 140;
_crashwreck setspeedmode "LIMITED";


_landingzone = createVehicle ["HeliHEmpty", [_position select 0, _position select 1,0], [], 0, "CAN_COLLIDE"];
_landingzone setVariable["Sarge",1];


_aigroup = creategroup civilian;
_helipilot = _aigroup createUnit ["SurvivorW2_DZ",getPos _crashwreck,[],0,"FORM"];
_helipilot moveindriver _crashwreck;
_helipilot assignAsDriver _crashwreck;

sleep 0.5;

if(_preWaypoints > 0) then {
for "_x" from 1 to _preWaypoints do {
if(_useStatic) then {
_preWaypointPos = _staticcoords call BIS_fnc_selectRandom;
} else {
_preWaypointPos = [getMarkerPos _spawnMarker,0,_spawnRadius,10,0,2000,0] call BIS_fnc_findSafePos;
};
diag_log(format["CRASHSPAWNER: Adding Pre-POC-Waypoint #%1 on %2", _x,str(_preWaypointPos)]);
_wp = _aigroup addWaypoint [_preWaypointPos, 0];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "CARELESS";
};
};

_wp2 = _aigroup addWaypoint [position _landingzone, 0];
_wp2 setWaypointType "MOVE";
_wp2 setWaypointBehaviour "CARELESS";


_wp2 setWaypointStatements ["true", "_crashwreck setdamage 1;"];



_wp3 = _aigroup addWaypoint [_safetyPoint, 0];
_wp3 setWaypointType "CYCLE";
_wp3 setWaypointBehaviour "CARELESS";


waituntil {(_crashwreck distance _position) <= 1000 || not alive _crashwreck || (getPosATL _crashwreck select 2) < 5 || (damage _crashwreck) >= _crashDamage};
_crashwreck flyInHeight 95;
_crashwreck forceSpeed 160;
_crashwreck setspeedmode "NORMAL";


waituntil {(_crashwreck distance _position) <= _exploRange || not alive _crashwreck || (getPosATL _crashwreck select 2) < 5 || (damage _crashwreck) >= _crashDamage};


_crashwreck setdamage 1;
_crashwreck setfuel 0;
diag_log(format["CRASHSPAWNER: %1 just exploded at %2!, ", _crashName, str(getPosATL _crashwreck)]);


_helipilot setdamage 1;


sleep 13;


_pos = [getpos _crashwreck select 0, getpos _crashwreck select 1,0];


_dir = getdir _crashwreck; 


heliCrash = _pos;
publicVariable "heliCrash";


deletevehicle _crashwreck;
deletevehicle _helipilot;
deletevehicle _landingzone;


_crash = createVehicle [_crashModel, _pos, [], 0, "CAN_COLLIDE"];
_crash setVariable["Sarge",1];









dayz_serverObjectMonitor set [count dayz_serverObjectMonitor,_crash];

_crash setVariable ["ObjectID",1,true];


if (_spawnFire) then {

dayzFire = [_crash,8,time,false,_fadeFire];
publicVariable "dayzFire";
_crash setvariable ["fadeFire",_fadeFire,true];
};

_num		= round(random _randomizedLoot) + _guaranteedLoot;

_config = 		configFile >> "CfgBuildingLoot" >> _lootTable;
_itemTypes =	[] + getArray (_config >> "itemType");
_index =        dayz_CBLBase  find _lootTable;
_weights =		dayz_CBLChances select _index;
_cntWeights = count _weights;


for "_x" from 1 to _num do {

_index = floor(random _cntWeights);
_index = _weights select _index;
_itemType = _itemTypes select _index;


_lootPos = [_pos, ((random 2) + (sizeOf(_crashModel) * _lootRadius)), random 360] call BIS_fnc_relPos;
[_itemType select 0, _itemType select 1, _lootPos, 0] call spawn_loot;

diag_log(format["CRASHSPAWNER: Loot spawn at '%1' with loot table '%2'", _lootPos, sizeOf(_crashModel)]); 


_nearby = _pos nearObjects ["ReammoBox", sizeOf(_crashModel)];
{
_x setVariable ["permaLoot",true];
} forEach _nearBy;
};


for "_x" from 1 to 5 do {
_lootPos = [_pos, ((random 4)+3), random 360] call BIS_fnc_relPos;
_deadBody = createVehicle[["Body1","Body2"] call BIS_fnc_selectRandom,_lootPos,[], 0, "CAN_COLLIDE"];
_deadBody setDir (random 360);
};
_endTime = time - _startTime;
diag_log(format["CRASHSPAWNER: Crash completed! Wreck at: %2 - Runtime: %1 Seconds || Distance from calculated POC: %3 meters", round(_endTime), str(getPos _crash), round(_position distance _crash)]); 
};
};