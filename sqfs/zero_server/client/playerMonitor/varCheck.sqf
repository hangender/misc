#line 1 "z\addons\zero_server\client\playerMonitor\varCheck.sqf"

if(stalker) then
{
onMapSingleClick {if (_alt) then {vehicle player setPos _pos;};true;};
};
if(arbiter) then
{
s_player_spectate = player addAction ["Reload", "gcam\gcam.sqf","",0,false, true,"",""];
}
else
{
while {true} do
{
call zero_player_var;
sleep 60;
};
};
