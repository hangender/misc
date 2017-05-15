/*
		Breaking Point - Server Init
			Created By Deathlyrage
*/
private ["_LoadThread"];

if (hasInterface) exitWith {};
if (!isDedicated) exitWith {};
if (!isServer) exitWith {};

_LoadThread = [] spawn {
	waituntil {!isnil "bis_fnc_init"};

	//Config
	dayz_versionNo = getText(configFile >> "CfgMods" >> "DayZ" >> "version");
	dayz_hiveVersionNo = getNumber(configFile >> "CfgMods" >> "DayZ" >> "hiveVersion");
	
	//Vars
	Deathly_HackVar = [];
	Deathly_HackScript = [];
	Deathly_Banned = [];
	BP_serverObjectMonitor = [];
	BP_Saftey = [];
	BP_LoginQueue = [];
	allowConnection = 		false;
	isSinglePlayer =		false;
	dayz_players = [];
	dayz_serverObjectMonitor = [];
	dead_bodyCleanup = [];
	needUpdate_objects = [];
	key_player = [];
	dayzPlayerLogin = [];
	dogOwner = [];

	//Functions
	call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\variables.sqf";				//Initilize the Variables (IMPORTANT: Must happen very early)
	call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\publicEH.sqf";				//Initilize the publicVariable event handlers
	call compile preprocessFileLineNumbers "\z\deathlyrage\breakingpoint_server\init\publicEH_server.sqf";
	call compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\setup_functions_med.sqf";	//Functions used by CLIENT for medical
	call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\compiles.sqf";				//Compile regular functions
	call compile preprocessFileLineNumbers "\z\deathlyrage\breakingpoint_server\init\server_functions.sqf";
	call compile preprocessFileLineNumbers "\z\deathlyrage\breakingpoint_server\system\server_monitor.sqf";
	call compile preprocessFileLineNumbers "\z\deathlyrage\breakingpoint_server\system\antihax.sqf";
	
	
	BP_CleanupMgr = [] spawn
	{
		while {isServer} do 
		{
			_Cleanup = [] execVM "\z\deathlyrage\breakingpoint_server\system\login_thread.sqf";
			waitUntil {scriptDone _Cleanup};
		};

	};

	//onPlayerConnected 			"[_uid,_name] call server_onPlayerConnect;";
	onPlayerDisconnected 		"[_uid,_name] call server_onPlayerDisconnect;";

	"Deathly_OnPlayerLogin" addPublicVariableEventHandler
	{
		_array = _this select 1;
		_sp = _array select 0;
		_name = _array select 1;
		_uid = _array select 2;
		_reason = _array select 3;
		_field = _array select 4;
		_world = _array select 5;
		_town = _array select 6;
		_fullreason = _reason + " (" + _field + ")";
		serverCommand format ["#kick + %1", _name];
		if (_uid in Deathly_Banned) exitWith {};
		_key = format["CHILD:799:INSERT INTO deathly_bans_pid (`player_id`, `name`, `reason`, `world`, `town`, `instance`) VALUES ('%1','%2','%3','%4','%5',%6):[]:", _uid,_name,_fullreason,_world,_town,dayZ_instance];
		_key call server_hiveWrite;
		Deathly_Banned = Deathly_Banned + [_uid];
	};

	"Deathly_OnPlayerLogout" addPublicVariableEventHandler
	{
		_array = _this select 1;
		_sp = _array select 0;
		_name = _array select 1;
		_uid = _array select 2;
		_reason = _array select 3;
		_field = _array select 4;
		_world = _array select 5;
		_town = _array select 6;
		_fullreason = _reason + " (" + _field + ")";
		serverCommand format ["#kick + %1", _name];
		if (_uid in Deathly_Banned) exitWith {};
		_key = format["CHILD:799:INSERT INTO hacker_log (`player_id`, `name`, `reason`, `world`, `town`, `instance`) VALUES ('%1','%2','%3','%4','%5',%6):[]:", _uid,_name,_fullreason,_world,_town,dayZ_instance];
		_key call server_hiveWrite;
		Deathly_Banned = Deathly_Banned + [_uid];
	};
	
	//"debug_console" callExtension format [ "-= Breaking Point Arma 2 (Server) By Deathlyrage v%1 =-#0100",dayz_versionNo];
	
	sm_done = true;
	publicVariable "sm_done";
};