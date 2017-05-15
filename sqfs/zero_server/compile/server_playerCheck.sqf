#line 1 "z\addons\zero_server\compile\server_playerCheck.sqf"

private["_debug","_charPos","_playerPos","_distance","_characterID","_forceUpdate","_setUpdate","_currentState","_key","_playerUID"];

_debug = getMarkerpos "respawn_west";

{
if (isPlayer _x) then
{
_charPos = 		getPosATL _x;
_playerPos = 	[round(direction _x),_charPos];
_distance = _debug distance _charPos;
_characterID =	_x getVariable ["CharacterID","0"];

if (_distance > 2000) then
{
if (_characterID != "0") then
{
_forceUpdate = _x getVariable ["p8aYu",0];
_setUpdate = _forceUpdate + 1;
_x setVariable ["p8aYu",_setUpdate,false];
_currentState = ["","",_setUpdate];

if (_setUpdate > 2) then
{
_key = format["CHILD:201:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10:%11:%12:%13:",_characterID,_playerPos,"","","","","","",_currentState,"","","",""];
_key call server_hiveWrite;
_playerUID = getPlayerUID _x;
diag_log ("IGEVENT: ALERT: " + str(_playerUID) + " had forced update, might be cheater!");
};
}
else
{
_playerUID = getPlayerUID _x;
diag_log ("IGEVENT: ALERT: " + str(_playerUID) + " has no CharacterID, might be cheater!");
};
};
};
} forEach playableUnits;
