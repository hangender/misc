/*
	server_onPlayerConnect.sqf By Deathlyrage
	//_playerIDtoarray = toArray _playerID;
*/
private ["_playerID","_playerName"];
_playerID = _this select 0;
_playerName = _this select 1;

if (_playerName == '__SERVER__' || _playerID == '' || local player) exitWith {};
if (_playerName == '__HC__' || _playerName == 'HC') exitWith {};

if (_playerID in Deathly_Banned) then {
	serverCommand format ["#kick + %1", _playerName];
};