

private ["_playerObj","_myGroup","_playerUID","_playerPos","_playerName"];
_playerUID = _this select 0;
_playerName = _this select 1;
_playerObj = nil;
_playerPos = [];
{
if ((getPlayerUID _x) == _playerUID) exitWith { _playerObj = _x; _playerPos = getPosATL _playerObj;};
} forEach 	playableUnits;

if (isNil "_playerObj") exitWith {
diag_log format["%1: nil player object, _this:%2", "z\addons\dayz_server\compile\server_onPlayerDisconnect.sqf", _this];
};

diag_log format["get: %1 (%2), sent: %3 (%4)",typeName (getPlayerUID _playerObj), getPlayerUID _playerObj, typeName _playerUID, _playerUID];

if (!isNull _playerObj) then {


_characterID = _playerObj getVariable["characterID", "?"];
_lastDamage = _playerObj getVariable["noatlf4",0];
_Sepsis = _playerObj getVariable["USEC_Sepsis",false];

if (_Sepsis) then {
_playerObj setVariable["USEC_infected",true,true];
};
_lastDamage = round(diag_ticktime - _lastDamage);
diag_log format["Player UID#%1 CID#%2 %3 as %4, logged off at %5%6", 
getPlayerUID _playerObj, _characterID, _playerObj call fa_plr2str, typeOf _playerObj, 
(getPosATL _playerObj) call fa_coor2str,
if ((_lastDamage > 5 AND {(_lastDamage < 30)}) AND {((alive _playerObj) AND {(_playerObj distance (getMarkerpos "respawn_west") >= 2000)})}) then {" while in combat ("+str(_lastDamage)+" seconds left)"} else {""}
]; 


if (vehicle _playerObj != _playerObj) then {
_playerObj action ["eject", vehicle _playerObj];
};
if (alive _playerObj) then {

[_playerObj,nil,true] call server_playerSync;
_myGroup = group _playerObj;
deleteVehicle _playerObj;
deleteGroup _myGroup;
};
{ [_x,"gear"] call server_updateObject } foreach 
(nearestObjects [_playerPos, ["Car", "Helicopter", "Motorcycle", "Ship", "TentStorage", "StashSmall", "StashMedium","TKOrdnanceBox_EP1"], 10]);
};