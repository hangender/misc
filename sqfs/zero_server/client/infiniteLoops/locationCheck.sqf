#line 1 "z\addons\zero_server\client\infiniteLoops\locationCheck.sqf"

while {true} do
{
{
private ["_location","_distCfg","_configClass","_distAct","_config","_locHdr","_position"];

_location = 	_x select 0;
_distCfg = 		(_x select 2) + 500;
_configClass =  _x select 1;
_distAct = player distance position _location;

if ((_distAct < _distCfg) and !(_location in dayz_locationsActive)) then
{

dayz_locationsActive set [count dayz_locationsActive,_location];

_config = 	configFile >> "CfgTownGenerator" >> _configClass;
_locHdr = 	configName _config;
_position = []+ getArray	(_config >> "position");

_config call stream_locationFill;
};
} forEach dayz_Locations;
sleep 5;
};
