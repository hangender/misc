#line 1 "z\addons\zero_server\client\playerMonitor\monitor_functions.sqf"

player_spawn_zero_savecheck =	compile preprocessFileLineNumbers "\z\addons\zero_server\client\playerMonitor\saveCheck.sqf";
player_spawn_zero_statecheck =	compile preprocessFileLineNumbers "\z\addons\zero_server\client\playerMonitor\stateCheck.sqf";
player_spawn_zero_varcheck =	compile preprocessFileLineNumbers "\z\addons\zero_server\client\playerMonitor\varCheck.sqf";

zero_player_save =				compile preprocessFileLineNumbers "\z\addons\zero_server\client\playerMonitor\save.sqf";
zero_player_state =				compile preprocessFileLineNumbers "\z\addons\zero_server\client\playerMonitor\state.sqf";
zero_player_var =				compile preprocessFileLineNumbers "\z\addons\zero_server\client\playerMonitor\var.sqf";
