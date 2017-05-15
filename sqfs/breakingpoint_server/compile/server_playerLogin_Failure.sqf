private ["_playerID","_playerObj","_playerName","_clientID"];
_playerID = _this select 0;
_playerObj = _this select 1;
_playerName = name _playerObj;
_clientID = owner _playerObj;

if (_playerName == '__SERVER__' || _playerID == '' || local player) exitWith {};
if (_playerName == '__HC__' || _playerName == "HC") exitWith {};

diag_log format ["LOGIN FAILURE: Player %1 (%2) Critical Server Failure!",_playerName,_playerID];
dayzPlayerLogin = [_playerID,"ERROR","Login Error: Critical Server Failure."];
_clientID publicVariableClient "dayzPlayerLogin";
