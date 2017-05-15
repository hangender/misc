#line 1 "z\addons\zero_server\compile\server_playerLogin.sqf"

private ["_playerID","_playerName","_message","_playerObj","_inventory","_backpack","_model","_clientID","_primary","_doLoop","_key","_newPlayer","_charID","_humanity"];


if (count _this < 2) exitWith
{
_playerID = getPlayerUID _this;
_playerName = name _this;
_message = format["%1 - [1337][%2] trustissue [playerLogin]",_playerName,_playerID];
diag_log("Hacker detected: " + _message + " - AUTO BAN");
};


_playerID =		_this select 0;
_playerObj =	_this select 1;

_playerName = "UNKNOWN/DEAD";

if (alive _playerObj) then
{
_playerName = name _playerObj;
};

waitUntil { allowConnection };


_inventory =	[];
_backpack = 	[];
_model =		"";

if (_playerID == "") then
{
_playerID = getPlayerUID _playerObj;
};

if ((_playerID == "") or (isNil "_playerID")) exitWith
{
_clientID = owner _playerObj;
_message = "LOGIN FAILED: You had no player ID, please reconnect!";
dayzPlayerLogin = [_message];
_clientID publicVariableClient "dayzPlayerLogin";
};



_primary = [];


_doLoop = 0;
while {_doLoop < 5} do
{
_key = format["CHILD:101:%1:%2:",_playerID,_playerName];
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
_clientID = owner _playerObj;
_message = "LOGIN RESULT: Exiting, player object null, please reconnect!";
dayzPlayerLogin = [_message];
_clientID publicVariableClient "dayzPlayerLogin";
};



_newPlayer =	_primary select 1;
_charID =		_primary select 2;
_inventory =	_primary select 3;
_backpack =		_primary select 4;
_model =		_primary select 5;
_humanity =		_primary select 6;

if ((_charID == "") or (_charID == "0") or (isNil "_charID")) exitWith
{
_clientID = owner _playerObj;
_message ="LOGIN FAILED: You had no character ID, please reconnect!";
dayzPlayerLogin = [_message];
_clientID publicVariableClient "dayzPlayerLogin";
};

if (!(_model in ["Survivor2_DZ","SurvivorW2_DZ","Hero1_DZ","Hero2_DZ","Sniper1_DZ","Sniper2_DZ","Camo1_DZ","Soldier1_DZ","Bandit1_DZ","Bandit2_DZ","BanditW1_DZ","Hunter1_DZ","ZERO_FSB1","ZERO_FSB2","ZERO_FSB3","ZERO_FSB4","ZERO_GRU1","ZERO_GRU2","ZERO_GRU3","ZERO_NICE1","ZERO_MEAN1"])) then
{
_model = "Survivor2_DZ";
};

if (isNull _playerObj or !isPlayer _playerObj) exitWith
{
_clientID = owner _playerObj;
_message = "LOGIN RESULT: Exiting, could not obtain humanity";
dayzPlayerLogin = [_message];
_clientID publicVariableClient "dayzPlayerLogin";
};

_playerObj setVariable ["loginTime",diag_tickTime];

_clientID = owner _playerObj;
_clientID publicVariableClient "botPlayers";
dayzPlayerLogin = [_charID,_inventory,_backpack,_model,_humanity,_newPlayer];
_clientID publicVariableClient "dayzPlayerLogin";
