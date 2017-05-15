#line 1 "z\addons\zero_server\compile\server_playerSetup.sqf"

private ["_characterID","_playerObj","_playerUID","_message","_clientID","_worldspace","_state","_doLoop","_key","_primary","_medical","_stats","_humanity","_randomSpot","_position","_debug","_distance","_fractures","_findSpot","_mkr","_center","_zero","_centerDistance","_zeroDistance"];



_characterID = _this select 0;
_playerObj = _this select 1;
_playerUID = _this select 2;

if (isNull _playerObj) exitWith
{
diag_log ("SETUP INIT FAILED: Exiting, player object null: " + str(_playerObj));

_message = "SETUP INIT FAILED: Exiting, player object null, please reconnect!";
_clientID = owner _playerObj;
dayzPlayerLogin2 = [_message];
_clientID publicVariableClient "dayzPlayerLogin2";
};

if (_playerUID == "") then
{
_playerUID = getPlayerUID _playerObj;
};

if (_playerUID == "") exitWith
{
_message ="SETUP INIT FAILED: Exiting, playerID empty, please reconnect!";
diag_log (_message);
_clientID = owner _playerObj;
dayzPlayerLogin2 = [_message];
_clientID publicVariableClient "dayzPlayerLogin2";
};


_worldspace =	[];
_state =		[];


_doLoop = 0;
while {_doLoop < 5} do
{
_key = format["CHILD:102:%1:",_characterID];
_primary = _key call server_hiveReadWrite;
if (count _primary > 0) then
{
if ((_primary select 0) != "ERROR") then
{
_doLoop = 9;
};
};
_doLoop = _doLoop + 1;
};

if (isNull _playerObj or !isPlayer _playerObj) exitWith
{
diag_log ("SETUP RESULT: Exiting, player object null: " + str(_playerObj));

_message ="SETUP INIT FAILED: Exiting, player object null";
_clientID = owner _playerObj;
dayzPlayerLogin2 = [_message];
_clientID publicVariableClient "dayzPlayerLogin2";
};




_medical =		_primary select 1;
_stats =		_primary select 2;
_state =		_primary select 3;
_worldspace = 	_primary select 4;
_humanity =		_primary select 5;


_randomSpot = false;

if (count _worldspace > 0) then
{
_position = _worldspace select 1;
if (count _position < 3) then
{

_randomSpot = true;
};
_debug = getMarkerPos "respawn_west";
_distance = _debug distance _position;
if (_distance < 2000) then
{
_randomSpot = true;
};

_distance = [0,0,0] distance _position;
if (_distance < 500) then
{
_randomSpot = true;
};
}
else
{
_randomSpot = true;
};



if (count _medical > 0) then
{
_playerObj setVariable ["zero_isDead",(_medical select 0),true];
_playerObj setVariable ["NORRN_unconscious", (_medical select 1), true];
_playerObj setVariable ["USEC_infected",(_medical select 2),true];
_playerObj setVariable ["USEC_injured",(_medical select 3),true];
_playerObj setVariable ["USEC_inPain",(_medical select 4),true];
_playerObj setVariable ["USEC_isCardiac",(_medical select 5),true];
_playerObj setVariable ["USEC_lowBlood",(_medical select 6),true];
_playerObj setVariable ["zero_Blood",(_medical select 7),true];
_playerObj setVariable ["messing",(_medical select 11),true];

if (count _medical > 9) then
{
_playerObj setVariable["unconsciousTime",((_medical select 10) min 300),true];
}
else
{
_playerObj setVariable["unconsciousTime",30,true];
};


{
_playerObj setVariable[_x,true,true];
medBleed = [_playerObj,_x,0];
publicVariable "medBleed";
} forEach (_medical select 8);


_fractures = (_medical select 9);
_playerObj setVariable ["hit_legs",(_fractures select 0),true];
_playerObj setVariable ["hit_hands",(_fractures select 1),true];
}
else
{

_playerObj setVariable ["hit_legs",0,true];
_playerObj setVariable ["hit_hands",0,true];
_playerObj setVariable ["USEC_injured",false,true];
_playerObj setVariable ["USEC_inPain",false,true];
_playerObj setVariable ["messing",[0,0],true];
};

if (count _stats > 0) then
{

_playerObj setVariable["zombieKills",(_stats select 0),true];
_playerObj setVariable["headShots",(_stats select 1),true];
_playerObj setVariable["humanKills",(_stats select 2),true];
_playerObj setVariable["banditKills",(_stats select 3),true];


_playerObj setVariable["zombieKills_CHK",(_stats select 0)];
_playerObj setVariable["headShots_CHK",(_stats select 1)];
_playerObj setVariable["humanKills_CHK",(_stats select 2)];
_playerObj setVariable["banditKills_CHK",(_stats select 3)];

if (count _stats > 4) then
{
if (!(_stats select 3)) then
{
_playerObj setVariable["selectSex",true,true];
};
}
else
{
_playerObj setVariable["selectSex",true,true];
};
}
else
{

_playerObj setVariable["zombieKills",0,true];
_playerObj setVariable["humanKills",0,true];
_playerObj setVariable["banditKills",0,true];
_playerObj setVariable["headShots",0,true];


_playerObj setVariable["zombieKills_CHK",0];
_playerObj setVariable["humanKills_CHK",0,true];
_playerObj setVariable["banditKills_CHK",0,true];
_playerObj setVariable["headShots_CHK",0];
};

if (_randomSpot) then
{
if (!isDedicated) then
{
endLoadingScreen;
};


_findSpot = true;
_mkr = "";
_center = getMarkerPos "center";
_zero =	[0,0,0];

while {_findSpot} do
{
_mkr = "spawn" + str(round(random 8));
_position = ([(getMarkerPos _mkr),0,1500,10,0,2000,1] call BIS_fnc_findSafePos);

_centerDistance = _center distance _position;
_zeroDistance =	_zero distance _position;

if (_centerDistance > 500 && _zeroDistance > 1000) exitWith
{
_findSpot = false
};
};

_position = [_position select 0,_position select 1,0];
_worldspace = [0,_position];
};

_playerObj setVariable["CharacterID",_characterID,true];
_playerObj setVariable["humanity",_humanity,true];
_playerObj setVariable["humanity_CHK",_humanity];

dayzPlayerLogin2 = [_worldspace,_state];
_clientID = owner _playerObj;
_clientID publicVariableClient "dayzPlayerLogin2";

_key = format["CHILD:103:%1:%2:%3:",_playerUID,_characterID,0];
_key call server_hiveWrite;
