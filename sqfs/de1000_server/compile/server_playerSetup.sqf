private ["_characterID","_playerObj","_playerID","_dummy","_worldspace","_state","_doLoop","_key","_primary","_medical","_stats","_humanity","_randomSpot","_position","_debug","_distance","_fractures","_score","_findSpot","_mkr","_j","_isIsland","_w","_clientID"];


_characterID = _this select 0;
_playerObj = _this select 1;
_spawnSelection = _this select 3;
_playerID = getPlayerUID _playerObj;






if (isNull _playerObj) exitWith {
diag_log ("SETUP INIT FAILED: Exiting, player object null: " + str(_playerObj));
};


_playerObj addMPEventHandler ["MPHit", {_this spawn fnc_plyrHit;}];

if (_playerID == "") then {
_playerID = getPlayerUID _playerObj;
};

if (_playerID == "") exitWith {
diag_log ("SETUP INIT FAILED: Exiting, no player ID: " + str(_playerObj));
};

private["_dummy"];
_dummy = getPlayerUID _playerObj;
if ( _playerID != _dummy ) then { 
diag_log format["DEBUG: _playerID miscompare with UID! _playerID:%1",_playerID]; 
_playerID = _dummy;
};


_worldspace = [];


_state = [];


_doLoop = 0;
while {_doLoop < 5} do {
_key = format["CHILD:102:%1:",_characterID];
_primary = _key call server_hiveReadWrite;
if (count _primary > 0) then {
if ((_primary select 0) != "ERROR") then {
_doLoop = 9;
};
};
_doLoop = _doLoop + 1;
};

if (isNull _playerObj or !isPlayer _playerObj) exitWith {
diag_log ("SETUP RESULT: Exiting, player object null: " + str(_playerObj));
};




_medical = _primary select 1;
_stats = _primary select 2;
_state = _primary select 3;
_worldspace = _primary select 4;
_humanity = _primary select 5;


_randomSpot = false;



if (count _worldspace > 0) then {

_position = _worldspace select 1;
if (count _position < 3) then {

_randomSpot = true;
};
_debug = getMarkerpos "respawn_west";
_distance = _debug distance _position;
if (_distance < 2000) then {
_randomSpot = true;
};

_distance = [0,0,0] distance _position;
if (_distance < 500) then {
_randomSpot = true;
};


} else {
_randomSpot = true;
};




if (count _medical > 0) then {
_playerObj setVariable["USEC_isDead",(_medical select 0),true];
_playerObj setVariable["NORRN_unconscious", (_medical select 1), true];
_playerObj setVariable["USEC_infected",(_medical select 2),true];
_playerObj setVariable["USEC_injured",(_medical select 3),true];
_playerObj setVariable["USEC_inPain",(_medical select 4),true];
_playerObj setVariable["USEC_isCardiac",(_medical select 5),true];
_playerObj setVariable["USEC_lowBlood",(_medical select 6),true];
_playerObj setVariable["USEC_BloodQty",(_medical select 7),true];

_playerObj setVariable["unconsciousTime",(_medical select 10),true];









{
_playerObj setVariable["hit_"+_x,true, true];
} forEach (_medical select 8);


_fractures = (_medical select 9);
_playerObj setVariable ["hit_legs",(_fractures select 0),true];
_playerObj setVariable ["hit_hands",(_fractures select 1),true];

if (count _medical > 11) then {

_playerObj setVariable ["messing",(_medical select 11),true];
};

} else {

call fnc_usec_resetWoundPoints;

_playerObj setVariable ["hit_legs",0,true];
_playerObj setVariable ["hit_hands",0,true];
_playerObj setVariable ["USEC_injured",false,true];
_playerObj setVariable ["USEC_inPain",false,true];
_playerObj setVariable ["messing",[0,0],true];
};

if (count _stats > 0) then { 

_playerObj setVariable["zombieKills",(_stats select 0),true];
_playerObj setVariable["headShots",(_stats select 1),true];
_playerObj setVariable["humanKills",(_stats select 2),true];
_playerObj setVariable["banditKills",(_stats select 3),true];
_playerObj addScore (_stats select 1);


_score = score _playerObj;
_playerObj addScore ((_stats select 0) - _score);


_playerObj setVariable["zombieKills_CHK",(_stats select 0)];
_playerObj setVariable["headShots_CHK",(_stats select 1)];


if (count _stats > 4) then {
if (!(_stats select 3)) then {
_playerObj setVariable["selectSex",true,true];
};
} else {
_playerObj setVariable["selectSex",true,true];
};
} else {


_playerObj setVariable["zombieKills",0,true];
_playerObj setVariable["humanKills",0,true];
_playerObj setVariable["banditKills",0,true];
_playerObj setVariable["headShots",0,true];


_playerObj setVariable["zombieKills_CHK",0];


_playerObj setVariable["headShots_CHK",0];
};

if (_randomSpot) then {
private["_counter","_position","_isNear","_isZero","_mkr"];
if (!isDedicated) then {
endLoadingScreen;
};


_findSpot = true;
_mkr = [];
_position = [0,0,0];
for [{_j=0},{_j<=1000 AND _findSpot},{_j=_j+1}] do {
_mkr = [3441.083, 14218.603, 0];
_position = ([_mkr,0,50,1,0,999,0] call BIS_fnc_findSafePos);
if ((count _position >= 2) 
AND {(_position distance _mkr < 50)}) then { 
_position set [2, 0];
if (((ATLtoASL _position) select 2 > 2.5)) then { 
_findSpot = false;
};
};
};
if (_findSpot) exitWith {
diag_log format["***** HUGE ERROR ********** %1: Error, failed to find a suitable spawn spot for player. area:%2","z\addons\dayz_server\compile\server_playerSetup.sqf", _mkr];
};
_worldspace = [0,_position];
};

private["_garage","_houseowner"];
_garage = _position nearObjects ["Land_sara_hasic_zbroj",20];
if ((count _garage) > 1) then {
_houseowner = (_garage select 0) getVariable "diff";
if (!((getPlayerUID _playerObj) in _houseowner)) then {
_garagespot = true;
_garagemkr = _position;
for [{_j=0},{_j<=100 AND _garagespot},{_j=_j+1}] do {
_mkr = _garagemkr;
_position = ([_mkr,0,150,5,0,999,0] call BIS_fnc_findSafePos);
if ((count _position >= 2) 
AND {(_position distance _mkr < 150) AND (_position distance _mkr > 35)}) then { 
_position set [2, 0];
if (((ATLtoASL _position) select 2 > 2.5) 
AND {({alive _x} count (_position nearEntities ["Man",1]) == 0)}) then { 
_pos = +(_position);
_isIsland = false;		

for [{_w = 0}, {_w != 809}, {_w = ((_w + 17) % 811)}] do {

_pos = [((_pos select 0) - _w),((_pos select 1) + _w),(_pos select 2)];
if(surfaceisWater _pos) exitWith {
_isIsland = true;
};
};
if (!_isIsland) then {_garagespot = false};
};
};
};
_worldspace = [0, _position];
};
};




dayz_players set [count dayz_players,_playerObj];


_playerObj setVariable["characterID",_characterID,true];
_playerObj setVariable["humanity",_humanity,true];
_playerObj setVariable["humanity_CHK",_humanity];


_playerObj setVariable["lastPos",getPosATL _playerObj];

PVCDZ_plr_Login2 = [_worldspace,_state];
_clientID = owner _playerObj;
_clientID publicVariableClient "PVCDZ_plr_Login2";


_playerObj setVariable ["lastTime",time];






PVDZ_plr_Login1 = null;
PVDZ_plr_Login2 = null;