// init both
init_both = compile preprocessFile "external\init_both.sqf";
call init_both;
publicVariable "init_both";

// overwrite server funcs
waitUntil {!(isNil "server_playerLogin")};
server_playerLogin = compile preprocessFile "external\override\server\server_playerLogin.sqf";

waitUntil {!(isNil "server_playerSetup")};
server_playerSetup = compile preprocessFile "external\override\server\server_playerSetup.sqf";

// overwrite server vars
waitUntil {!(isNil "dayz_spawnCrashSite_clutterCutter")};
dayz_spawnCrashSite_clutterCutter = 2;

// exec server code
execVM "external\override\server\server_monitor.sqf";
execVM "external\server\killmsg_server.sqf";
execVM "external\server\dac_server.sqf";

// send to client
cl_init_client = compile preprocessFile "external\client\broadcasted\init_client.sqf";
publicVariable "cl_init_client";

cl_dbgmon = compile preprocessFile "external\client\broadcasted\dbgmon.sqf";
publicVariable "cl_dbgmon";

cl_autorefuel_action = compile preprocessFile "external\client\broadcasted\autorefuel_action.sqf";
publicVariable "cl_autorefuel_action";

cl_autorefuel_do = compile preprocessFile "external\client\broadcasted\autorefuel_do.sqf";
publicVariable "cl_autorefuel_do";

cl_killmsg_client = compile preprocessFile "external\client\broadcasted\killmsg_client.sqf";
publicVariable "cl_killmsg_client";

cl_miniah = compile preprocessFile "external\client\broadcasted\miniah.sqf";
publicVariable "cl_miniah";

cl_dac_client = compile preprocessFile "external\client\broadcasted\dac_client.sqf";
publicVariable "cl_dac_client";

//  group cleaner (now in owcleanup.sqf)
/*while { true } do
{
	_allGroups = allGroups;
	{
		deleteGroup _x;
	}forEach _allGroups;
	sleep 60;
};*/

waitUntil {!(isNil "initialized")};
waitUntil {initialized};
call compile preprocessFile "external\server\pipeline.sqf";
execVM "external\server\enhanced_loot.sqf";