#line 1 "z\addons\zero_server\compile\server_playerDied.sqf"

private["_characterID","_playerUID","_key"];

_characterID = 	_this select 0;
_playerUID = 	_this select 1;

if !(isNil "_characterID") then
{
if (_characterID != "0") then
{
_key = format["CHILD:202:%1:%2:",_characterID,0];
_key call server_hiveWrite;

}
else
{
diag_log (format["IGEVENT: DEATH: (%1) died with characterID 0.",_playerUID]);
};
}
else
{
diag_log (format["IGEVENT: DEATH: (%1) died without sending characterID.",_playerUID]);
};
