#line 1 "z\deathlyrage\breakingpoint_server\compile\server_playerDied.sqf"
private ["_characterID","_minutes","_newObject","_playerID","_key","_playerName","_victim","_killer","_weapon","_message","_distance","_victimName","_killerName","_log_message"];

_characterID = 	_this select 0;
_minutes =	_this select 1;
_newObject = 	_this select 2;
_playerID = 	_this select 3;
_playerName = 	_this select 4;

_victim removeAllEventHandlers "MPHit";


_newObject setVariable["processedDeath",time];
_newObject setVariable ["bodyName", _playerName, true];








if (typeName _minutes == "STRING") then 
{
_minutes = parseNumber _minutes;
};

if (_characterID != "0") then 
{
_key = format["CHILD:202:%1:%2:",_characterID,_minutes];
_key call server_hiveWrite;
} 
else 
{
deleteVehicle _newObject;
};

diag_log ("PDEATH: Player Died " + _playerID);

anti_disconnect set [count anti_disconnect,_playerID];
sleep 30;
anti_disconnect = anti_disconnect - [_playerID];












