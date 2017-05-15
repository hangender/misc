private ["_characterID","_minutes","_newObject","_playerID","_key","_playerName","_victim","_killer","_weapon","_message","_distance","_victimName","_killerName","_log_message"];
//[unit, weapon, muzzle, mode, ammo, magazine, projectile]
_characterID = 	_this select 0;
_minutes =	_this select 1;
_newObject = 	_this select 2;
_playerID = 	_this select 3;
_playerName = 	_this select 4;

_victim removeAllEventHandlers "MPHit";

//dayz_disco = dayz_disco - [_playerID];
_newObject setVariable["processedDeath",time];
_newObject setVariable ["bodyName", _playerName, true];

/*
diag_log ("DW_DEBUG: (isnil _characterID): " + str(isnil "_characterID"));
if (isnil "_characterID") then {
diag_log ("DW_DEBUG: _newObject: " + str(_newObject));	
	};
*/

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

/*
_eh = [_newObject] spawn {
	_body = _this select 0;
	_method = _body getVariable["deathType","unknown"];
	_name = _body getVariable["bodyName","unknown"];
	waitUntil{!isPlayer _body;sleep 1};
	_body setVariable["deathType",_method,true];
	_body setVariable["bodyName",_name,true];
	diag_log ("PDEATH: Player Left Body " + _name);
};
*/
//dead_bodyCleanup set [count dead_bodyCleanup,_newObject];