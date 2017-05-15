#line 1 "z\addons\zero_server\server\zero_logging.sqf"

server_gumdropsAndLollipops =
{
private["_playerUnit","_playerUID","_eventType","_message","_key"];

_playerUnit =	_this select 0;
_playerUID = 	_this select 1;
_eventType =	_this select 2;

[_playerUnit] call server_destroyHacker;

_message = format["Detected illegally modified [%1]",_eventType];
_key = format["CHILD:600:%1:%2:%3:","HACK",_playerUID,_message];
_key call server_hiveWrite;
};


server_reportKillEvent =
{
private["_this","_victimUID","_killerUID","_weaponUsed","_sourceUnit","_sourceEvent","_message","_key"];

_victimUID =	_this select 0;
_killerUID =	_this select 1;
_weaponUsed =	_this select 2;
_sourceUnit =	_this select 3;
_sourceEvent =	_this select 4;

if (count _this > 3) then
{
_message = format["Killed by [%1] using weapon [%2] || CAUSE [%3]",_killerUID,_weaponUsed,_sourceEvent];
_key = format["CHILD:600:%1:%2:%3:","DEATH",_victimUID,_message];
_key call server_hiveWrite;
}
else
{
_message = format["Killed by [%1] using weapon [%2] || CAUSE [unknown]",_killerUID,_weaponUsed];
_key = format["CHILD:600:%1:%2:%3:","DEATH",_victimUID,_message];
_key call server_hiveWrite;
};
};

server_reportDamageEvent =
{
private["_this","_victimUID","_killerUID","_weaponUsed","_sourceUnit","_sourceEvent","_message","_key"];

_victimUID =	_this select 0;
_killerUID =	_this select 1;
_weaponUsed =	_this select 2;
_damage =		_this select 3;
_scale =		_this select 4;
_ammo =			_this select 5;

_message = format["Hit by [%1] using weapon [%2] for [%3] || RAW [%4] SCALE [%5] AMMO [%6] ",_killerUID,_weaponUsed,(_damage * _scale),_damage,_scale,_ammo];
_key = format["CHILD:600:%1:%2:%3:","DAMAGE",_victimUID,_message];
_key call server_hiveWrite;
};

server_playerManagement =
{
private ["_character","_distanceFoot","_charPos","_lastPos","_isInVehicle"];

_distanceFoot =	0;
_character =	_this select 0;
_charPos =		_this select 1;
_lastPos = _character getVariable ["oldPos",_charPos];

[_charPos] call server_updateNearby;
[_character,_charPos] call server_outsideMap;

_isInVehicle = (vehicle _character) != _character;

if ((count _lastPos > 2) and (count _charPos > 2)) then
{
if (!_isInVehicle) then
{
_distanceFoot = round(_charPos distance _lastPos);
};
};

_character setVariable ["oldPos",_charPos];	

_distanceFoot
};
