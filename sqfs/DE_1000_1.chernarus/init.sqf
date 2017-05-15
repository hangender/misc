// intrntbrn
// hey noobs - hows it going?

startLoadingScreen ["","RscDisplayLoadCustom"];
cutText ["","BLACK OUT"];
enableSaving [false, false];
dayZ_instance = 1;
dayz_antihack = 0;
dayz_REsec = 0;
dayz_spawnselection = 0; 
dayz_spawnCrashSite_clutterCutter = 0; 
dayz_spawnInfectedSite_clutterCutter = 0; 
initialized = false;
dayzHiveRequest = [];
dayz_previousID = 0;
0 fadeSound 0;
player setVariable ["BIS_noCoreConversations", true];

call compile preprocessFileLineNumbers "fixes\variables.sqf";
progressLoadingScreen 0.1;
call compile preprocessFileLineNumbers "fixes\publicEH.sqf";
progressLoadingScreen 0.2;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\setup_functions_med.sqf";
progressLoadingScreen 0.4;
call compile preprocessFileLineNumbers "fixes\compiles.sqf";
progressLoadingScreen 1.0;
stream_locationCheck = {};
"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";

if ((!isServer) && (isNull player) ) then
{
	waitUntil {!isNull player};
	waitUntil {time > 3};
};

if ((!isServer) && (player != player)) then
{
	waitUntil {player == player};
	waitUntil {time > 3};
};

if (isServer) then {
	_serverMonitor = [] execVM "\z\addons\dayz_code\system\server_monitor.sqf";
};


if (!isDedicated) then {
	waitUntil {!isNil "dayz_loadScreenMsg"};
	dayz_loadScreenMsg = (localize "STR_AUTHENTICATING");
	_id = player addEventHandler ["Respawn", {_id = [] spawn player_death;}];
	_playerMonitor = [] execVM "\z\addons\dayz_code\system\player_monitor.sqf";
	[] execVM "startup\login.sqf";
	[] execVM "ui\debug.sqf";
	[] execVM "skins\addaction.sqf";
	if ((count marker1) > 1) then {
		[] execVM "marker\marker_1.sqf";
	};
	if ((count marker2) > 1) then {
		[] execVM "marker\marker_2.sqf";
	};
	if ((count marker3) > 1) then {
		[] execVM "marker\marker_3.sqf";
	};
	if ((count baseMarkerPos) > 1) then {
		[] execVM "marker\basebattle.sqf";
	};
};

call compile preprocessFileLineNumbers "addons\UPSMON\scripts\Init_UPSMON.sqf";
call compile preprocessFileLineNumbers "addons\SHK_pos\shk_pos_init.sqf";
[] execVM "addons\SARGE\SAR_AI_init.sqf";