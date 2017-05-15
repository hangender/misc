#line 1 "z\addons\zero_server\client\infiniteLoops\dayzGui.sqf"

private ["_array"];

while {true} do
{
_array = player call world_surfaceNoise;
dayz_surfaceNoise = _array select 1;
dayz_surfaceType = 	_array select 0;
call player_checkStealth;
dayz_statusArray = [] call player_updateGui;
sleep 0.3;
};
