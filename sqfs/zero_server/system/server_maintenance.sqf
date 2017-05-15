#line 1 "z\addons\zero_server\system\server_maintenance.sqf"

private ["_message","_key","_time"];

zero_cleanThis = [];

{
if (isClass (configFile >> "CfgBuildingLoot" >> (typeOf _x))) then
{
zero_cleanThis set [count zero_cleanThis,_x];
};
} forEach nearestObjects [(getMarkerPos "center"),["building"],20000];

_message = format["COMPLETED AT %1",diag_tickTime];
_key = format["CHILD:600:%1:%2:%3:","STARTUP",0,_message];
_key call server_hiveWrite;

allowConnection = true;

zero_lastLoop = diag_tickTime;
zero_cleanDead = diag_tickTime;
zero_cleanLoot = diag_tickTime;

while {true} do
{
_time = diag_tickTime;

if ((_time - zero_lastLoop) > 180) then
{
_key = format["CHILD:602:%1:%2:%3:%4:",diag_fps,(playersNumber west),totalSessionConnections,(count entities "zZombie_Base")];
_key call server_hiveWrite;

if ((_time - zero_cleanDead) > 600) then
{
call server_cleanDead;
zero_cleanDead = _time;
};

if ((_time - zero_cleanLoot) > 2400) then
{
call server_cleanLoot;
zero_cleanLoot = _time;
};

zero_lastLoop = _time;
};

sleep 31;
};
