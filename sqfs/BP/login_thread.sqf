#line 1 "z\deathlyrage\breakingpoint_server\system\login_thread.sqf"




private ["_myGroupX","_safety","_diag_tickTime"];

if (hasInterface) exitWith {};
if (!isDedicated) exitWith {};
if (!isServer) exitWith {};

waitUntil {!(isNil "sm_done")};





_safety = dayz_serverObjectMonitor;
BP_Time_lastUpdate = diag_tickTime;
BP_Time_lastZombieCheck = diag_tickTime;
BP_Time_lastNeedUpdate = diag_tickTime;
BP_Time_lastDeadCheck = diag_tickTime;
BP_Time_lastFPSCleanup = diag_tickTime;
BP_Time_lastBanUpdate = diag_tickTime;
BP_Time_lastItemCheck = diag_tickTime;

while {isServer} do {



if (((diag_tickTime - BP_Time_lastUpdate) > 300)) then
{
BP_Time_lastUpdate = diag_tickTime;
private ["_date","_dateNum","_diff","_result","_outcome"];
_result = "CHILD:307:" call server_hiveReadWrite;
_outcome = _result select 0;
if(_outcome == "PASS") then {
_date = _result select 1; 
_dateNum = dateToNumber(_date); 
_diff = ( _dateNum - dateToNumber (date) )*365*24*60;
if ( abs(_diff)>5 ) then {
setDate _date;
dayzSetDate = _date;
publicVariable "dayzSetDate";
};
};
};



if ((count needUpdate_objects) > 0 && (diag_tickTime -BP_Time_lastNeedUpdate>40)) then
{
BP_Time_lastNeedUpdate = diag_tickTime;
{
needUpdate_objects = needUpdate_objects - [_x];
[_x,"all"] call server_updateObject;

} forEach needUpdate_objects;
};



if (((diag_tickTime - BP_Time_lastBanUpdate) > 300)) then
{
BP_Time_lastBanUpdate = diag_tickTime;
call server_UpdateBans;
};



if ((diag_tickTime - BP_Time_lastDeadCheck) > 60) then {
BP_Time_lastDeadCheck = _diag_tickTime;
private ["_modeldex","_myGroupX"];


{
_modeldex = typeOf _x;
_myGroupX = group _x;

if (_x isKindOf "zZombie_Base") then {
_x removeAllMPEventHandlers "mpkilled";
_x removeAllMPEventHandlers "mphit";
_x removeAllMPEventHandlers "mprespawn";
_x removeAllEventHandlers "FiredNear";
_x removeAllEventHandlers "HandleDamage";
_x removeAllEventHandlers "Killed";
_x removeAllEventHandlers "Fired";
_x removeAllEventHandlers "GetOut";
_x removeAllEventHandlers "Local";
clearVehicleInit _x; 
deleteVehicle _x;
deleteGroup _myGroupX;
_x = nil;
};

if (_modeldex =="Survivor1_DZ") then { 
_x removeAllMPEventHandlers "mpkilled";
_x removeAllMPEventHandlers "mphit";
_x removeAllMPEventHandlers "mprespawn";
_x removeAllEventHandlers "FiredNear";
_x removeAllEventHandlers "HandleDamage";
_x removeAllEventHandlers "Killed";
_x removeAllEventHandlers "Fired";
_x removeAllEventHandlers "GetOut";
_x removeAllEventHandlers "Local";
clearVehicleInit _x;
deleteVehicle _x;
deleteGroup _myGroupX;
_x = nil;			
};
} forEach allDead;
};




if ((diag_tickTime - BP_Time_lastZombieCheck) > 180) then {

BP_Time_lastZombieCheck = diag_tickTime;
{
if (!(isPlayer _x)) then {
_x enableSimulation false;
} else {
_myGroupX = group _x;
_x removeAllMPEventHandlers "mpkilled";
_x removeAllMPEventHandlers "mphit";
_x removeAllMPEventHandlers "mprespawn";
_x removeAllEventHandlers "FiredNear";
_x removeAllEventHandlers "HandleDamage";
_x removeAllEventHandlers "Killed";
_x removeAllEventHandlers "Fired";
_x removeAllEventHandlers "GetOut";
_x removeAllEventHandlers "Local";
clearVehicleInit _x;
deleteVehicle _x;
deleteGroup _myGroupX;
_x = nil;
};
} forEach allMissionObjects "Animal";


{
if (((count ((getWeaponCargo _x) select 1))+(count ((getMagazineCargo _x) select 1))) > 80) then {
clearVehicleInit _x;
deleteVehicle _x;
_x = nil;
};
} forEach allMissionObjects "All";


{
if (isPlayer _x) then {
_myGroupX = group _x;
_x removeAllMPEventHandlers "mpkilled";
_x removeAllMPEventHandlers "mphit";
_x removeAllMPEventHandlers "mprespawn";
_x removeAllEventHandlers "FiredNear";
_x removeAllEventHandlers "HandleDamage";
_x removeAllEventHandlers "Killed";
_x removeAllEventHandlers "Fired";
_x removeAllEventHandlers "GetOut";
_x removeAllEventHandlers "Local";
clearVehicleInit _x;
deleteVehicle _x;
deleteGroup _myGroupX;
_x = nil;
} else {
_x enableSimulation false;
};

} forEach entities "zZombie_Base";


{
_x enableSimulation false;
if ((local _x) or (isPlayer _x)) then {
_myGroupX = group _x;
_x removeAllMPEventHandlers "mpkilled";
_x removeAllMPEventHandlers "mphit";
_x removeAllMPEventHandlers "mprespawn";
_x removeAllEventHandlers "FiredNear";
_x removeAllEventHandlers "HandleDamage";
_x removeAllEventHandlers "Killed";
_x removeAllEventHandlers "Fired";
_x removeAllEventHandlers "GetOut";
_x removeAllEventHandlers "Local";
clearVehicleInit _x;
deleteVehicle _x;
deleteGroup _myGroupX;
_x = nil;
};
} forEach entities "Bloodsucker_Base";


{
_x enableSimulation false;
if ((local _x) or (isPlayer _x)) then {
_myGroupX = group _x;
_x removeAllMPEventHandlers "mpkilled";
_x removeAllMPEventHandlers "mphit";
_x removeAllMPEventHandlers "mprespawn";
_x removeAllEventHandlers "FiredNear";
_x removeAllEventHandlers "HandleDamage";
_x removeAllEventHandlers "Killed";
_x removeAllEventHandlers "Fired";
_x removeAllEventHandlers "GetOut";
_x removeAllEventHandlers "Local";
clearVehicleInit _x;
deleteVehicle _x;
deleteGroup _myGroupX;
_x = nil;
};
} forEach entities "DZ_Pastor_Infected";
};




if (((diag_tickTime - BP_Time_lastItemCheck) > 1800)) then
{
BP_Time_lastItemCheck = diag_tickTime;
private ["_delQty","_keep","_nearby","_myGroupX","_delQtyAnimalR","_delQtyAnimal","_xtypeanimal","_missionObjs","_qty","_animaltype"];


_missionObjs = allMissionObjects "WeaponHolder";
_qty = count _missionObjs;
{
if (local _x) then {
_keep = _x getVariable ["permaLoot",false];
_nearby = {isPlayer _x} count (_x nearEntities [["CAManBase"], 100]);
if ( (!_keep) && (_nearby==0) ) then {
deleteVehicle _x;
_x = nil;
};
};
} forEach _missionObjs;

_animaltype = [];
{
_xtypeanimal = typeof _x;
if(_xtypeanimal=="Rabbit") then {
_myGroupX = group _x;
_x removeAllMPEventHandlers "mpkilled";
_x removeAllMPEventHandlers "mphit";
_x removeAllMPEventHandlers "mprespawn";
_x removeAllEventHandlers "FiredNear";
_x removeAllEventHandlers "HandleDamage";
_x removeAllEventHandlers "Killed";
_x removeAllEventHandlers "Fired";
_x removeAllEventHandlers "GetOut";
_x removeAllEventHandlers "Local";
clearVehicleInit _x; 
deleteVehicle _x;
deleteGroup _myGroupX;
_x = nil;
} else {
_nearby = {isPlayer _x} count (_x nearEntities [AllPlayers, 100]);

if (!(_xtypeanimal in _animaltype)) then { _animaltype set [(count _animaltype),(typeOf _x)]; };

if (_nearby==0) then {
_myGroupX = group _x;
_x removeAllMPEventHandlers "mpkilled";
_x removeAllMPEventHandlers "mphit";
_x removeAllMPEventHandlers "mprespawn";
_x removeAllEventHandlers "FiredNear";
_x removeAllEventHandlers "HandleDamage";
_x removeAllEventHandlers "Killed";
_x removeAllEventHandlers "Fired";
_x removeAllEventHandlers "GetOut";
_x removeAllEventHandlers "Local";
clearVehicleInit _x;
deleteVehicle _x;
deleteGroup _myGroupX;
_x = nil;
};
};
} forEach allMissionObjects "Animal";
};



if (( diag_fps < 2) and (diag_tickTime-BP_Time_lastFPSCleanup > 1800)) then
{
BP_Time_lastFPSCleanup = diag_tickTime;
private ["_myGroupX","_missionObjs"];

{
_myGroupX = group _x;
_x removeAllMPEventHandlers "mpkilled";
_x removeAllMPEventHandlers "mphit";
_x removeAllMPEventHandlers "mprespawn";
_x removeAllEventHandlers "FiredNear";
_x removeAllEventHandlers "HandleDamage";
_x removeAllEventHandlers "Killed";
_x removeAllEventHandlers "Fired";
_x removeAllEventHandlers "GetOut";
_x removeAllEventHandlers "Local";
clearVehicleInit _x;
deleteVehicle _x;
deleteGroup _myGroupX;
_x = nil;
_myGroupX = nil;
} forEach allDead;


{
deleteVehicle _x;
_x = nil;
} forEach allMissionObjects "Sound_Flies";


{
if (local _x) then {
_myGroupX = group _x;
_x removeAllMPEventHandlers "mpkilled";
_x removeAllMPEventHandlers "mphit";
_x removeAllMPEventHandlers "mprespawn";
_x removeAllEventHandlers "FiredNear";
_x removeAllEventHandlers "HandleDamage";
_x removeAllEventHandlers "Killed";
_x removeAllEventHandlers "Fired";
_x removeAllEventHandlers "GetOut";
_x removeAllEventHandlers "Local";
clearVehicleInit _x;
deleteVehicle _x;
deleteGroup _myGroupX;
_x = nil;
_myGroupX = nil;
};
} forEach entities "zZombie_Base";


{
if (local _x) then {
_myGroupX = group _x;
_x removeAllMPEventHandlers "mpkilled";
_x removeAllMPEventHandlers "mphit";
_x removeAllMPEventHandlers "mprespawn";
_x removeAllEventHandlers "FiredNear";
_x removeAllEventHandlers "HandleDamage";
_x removeAllEventHandlers "Killed";
_x removeAllEventHandlers "Fired";
_x removeAllEventHandlers "GetOut";
_x removeAllEventHandlers "Local";
clearVehicleInit _x;
deleteVehicle _x;
deleteGroup _myGroupX;
_x = nil;
_myGroupX = nil;
};
} forEach entities "Bloodsucker_Base";


{
_myGroupX = group _x;
_x removeAllMPEventHandlers "mpkilled";
_x removeAllMPEventHandlers "mphit";
_x removeAllMPEventHandlers "mprespawn";
_x removeAllEventHandlers "FiredNear";
_x removeAllEventHandlers "HandleDamage";
_x removeAllEventHandlers "Killed";
_x removeAllEventHandlers "Fired";
_x removeAllEventHandlers "GetOut";
_x removeAllEventHandlers "Local";
clearVehicleInit _x;
deleteVehicle _x;
deleteGroup _myGroupX;
_x = nil;
_myGroupX = nil;
} forEach allMissionObjects "Animal";

_missionObjs = allMissionObjects "WeaponHolder";
{
deleteVehicle _x;
_x = nil;
} forEach _missionObjs;


{
needUpdate_objects = needUpdate_objects - [_x];
[_x,"all"] call server_updateObject;

} forEach needUpdate_objects;
};
dayz_serverObjectMonitor = _safety;
sleep 5;
};