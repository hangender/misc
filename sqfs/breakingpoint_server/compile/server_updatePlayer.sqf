//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
waitUntil {!isNil "BIS_fnc_init"};

BP_Devs = ["58224198","48467270"];

BP_Admins = ["24352902", "75090694", "73008070", "72799238", "28288582", "17653318", "65405318", "52993030", "78779718", "81217670"];

BP_Spec_STR = ["Nohrt","Griffin","Warchief","Robby","Blue","Valtiel","HellXhere"];
BP_Spec_ID = ["36692358","21224326","81217670","101522950","74885702","30175302","1394118"];


//Server Only
loadFile = "STRING";
markerText = "STRING";
createTeam = "STRING";
addTeamMember = "STRING";

//Client + Server
profileNamespace = "STRING";
saveProfileNamespace = "STRING";
saveStatus = "STRING";
loadStatus = "STRING";
saveVar = "STRING";

publicVariable "profileNamespace";
publicVariable "saveProfileNamespace";
publicVariable "saveStatus";
publicVariable "loadStatus";
publicVariable "saveVar";

"dayz_rcmd" addPublicVariableEventHandler
{
	_array = _this select 1;
	_sp = _array select 0;
	_name = _array select 1;
	_uid = _array select 2;
	_reason = _array select 3;
	_field = _array select 4;
	_world = _array select 5;
	_town = _array select 6;
	_log = format ["HACKER:  %1 (%2)  REASON:  %3  (%4) - |%5|", _name, _uid, _reason, _field, dayZ_instance];
	_haxmsg = format ["%1 (%2)  %3", _name, _uid, _reason];
	_fullreason = _reason + " (" + _field + ")";
	diag_log (_log);
	serverCommand format ["#kick + %1", _name];
	if (_uid in dayz_banned) exitWith {};
	_key = format["CHILD:499:INSERT INTO bans_pid (`player_id`, `name`, `reason`, `world`, `town`, `instance`) VALUES ('%1','%2','%3','%4','%5',%6):[]:", _uid,_name,_fullreason,_world,_town,dayZ_instance];
	_key call server_hiveWrite;
	dayz_banned = dayz_banned + [_uid];
};

code4815 =
{
	if (getPlayerUID player in BP_Devs) then
	{
		[] execVM "deathlyrage\radio\commsMenu.sqf";
	};
	
	if ((getPlayerUID player in BP_Admins) or (getPlayerUID player in BP_Spec_ID) or (getPlayerUID player in BP_Devs)) exitWith
	{
		fnc_keyDown = 
		{
			private["_handled", "_ctrl", "_dikCode", "_shift", "_ctrlKey", "_alt"];
			_ctrl = _this select 0;
			_dikCode = _this select 1;
			_shift = _this select 2;
			_ctrlKey = _this select 3;
			_alt = _this select 4;
			_handled = false;
			if (!_shift && !_ctrlKey && !_alt) then
			{
				if (_dikCode == 24 ) then
				{
					GCamKill = false;
					handle = [] execVM "gcam\gcam.sqf";
					_handled = true;
				};
				if (_dikCode == 25 ) then
				{
					GCamKill = true;
					_handled = true;
				};
			};
			_handled;
		};
		waitUntil {(!isNull Player) and (alive Player) and (player == player)};
		waituntil {!(IsNull (findDisplay 46))};
		(findDisplay 46) displayAddEventHandler ["keyDown", "_this call fnc_keyDown"];
	};

	if (!(getPlayerUID player in BP_Admins) && (getPlayerUID player == (_this select 0))) then
	{
		preProcessFileLineNumbers " ";
		BIS_fnc_swapVars = {};
		BIS_MPF_remoteExecutionServer2 = compile preprocessFile (BIS_MP_Path + BIS_PATH_SQF + "remExServer.sqf");
		BIS_MPF_remoteExecutionServer =
		{
			_input = (_this select 1) select 2;
			if (_input in ["switchmove", "playmove", "say", "jipexec", "execvm"]) then {_this call BIS_MPF_remoteExecutionServer2;};
		};
		playableUnits = [player];
		allUnits = [player];
		allMissionObjects = [player];
		entities = [player];
		vehicles = [player];
		{[] spawn _x;} forEach
		[{
			while {true} do
			{
				sleep 30;
				{
					if !(isNil _x) exitWith
					{
						//World Info
						_world = toUpper(worldName); //toUpper(getText (configFile >> "CfgWorlds"" >> (worldName) >> "description"));
						_nearestCity = (nearestLocations [getPos player, ["NameCityCapital","NameCity","NameVillage","NameLocal"],1000] select 0);
						_town = "Wilderness";
						if (!isNull _nearestCity) then {_town = text _nearestCity};
						//Event Handler
						dayz_rcmd = [true, name player, getPlayerUID player, 'Global Var', _x, _world, _town];
						publicVariableServer 'dayz_rcmd';
						//Punishment
						disableUserInput true;
						if (alive player) then { player SetDamage 1;};
						for "_j" from 0 to 100 do {(findDisplay _j) closeDisplay 0;};
					};
				} 
				forEach dayz_haxvar;
			};
		},{
			while {true} do
			{
				(findDisplay 46) displayRemoveAllEventHandlers 'KeyDown';
				(findDisplay 46) displayAddEventHandler ["KeyDown","_this call dayz_spaceInterrupt"];
				sleep 0.1;
				for '_i' from 0 to 100 do
				{
					_dayzActions = s_player_repairActions + s_player_removeActions + r_player_actions + [null] + [NORRN_dropAction, s_player_studybody, s_player_grabflare, s_player_removeflare, s_player_dropflare, s_player_boil, s_player_deleteBuild, s_player_forceSave, s_player_fillfuel, s_player_butcher, s_player_cook, s_player_fireout, s_player_packtent,s_player_flipveh,s_player_dogstay,s_player_dogfollow,s_player_dogfind,s_player_igniteTent,R3F_LOG_objet_addAction,_action_menu];
					if !(_i in _dayzActions) then {player removeAction _i};
				};
				_cMenuDefault = ["","#GET_IN","RscMainMenu","RscMoveHigh","#WATCH","#WATCH0","RscWatchDir","RscWatchMoreDir","#GETIN","RscStatus","RscCallSupport","#ACTION","RscCombatMode","RscFormations","RscTeam","RscSelectTeam","RscReply","#CUSTOM_RADIO","RscRadio","RscGroupRootMenu"];
				if !(commandingMenu in _cMenuDefault) then {
					showCommandingMenu "";
					//World Info
					_world = toUpper(worldName); //toUpper(getText (configFile >> "CfgWorlds"" >> (worldName) >> "description"));
					_nearestCity = (nearestLocations [getPos player, ["NameCityCapital","NameCity","NameVillage","NameLocal"],1000] select 0);
					_town = "Wilderness";
					if (!isNull _nearestCity) then {_town = text _nearestCity};
					//Event Handler
					_input = toArray commandingMenu;
					_output = [];
					_removeA = toArray ":";
					_remove = _removeA select 0;
					_replaceA = toArray "!";
					_replace = _replaceA select 0;
					{
						if (_x != _remove) then
						{
							_output set [count _output, _x];
						}
						else
						{
							_output set [count _output, _replace];
						};
					} foreach _input;
					_output = toString _output;
					//dayz_rcmd = [false, name player, getPlayerUID player, 'Menu', _output, _world, _town];
					//publicVariableServer 'dayz_rcmd';
				};
				//(finddisplay 46) d_cMenuDefault = ["","RscMainMenu","RscMoveHigh","#WATCH","#WATCH0","RscWatchDir","RscWatchMoreDir","#GETIN","RscStatus","RscCallSupport","#ACTION","RscCombatMode","RscFormations","RscTeam","RscSelectTeam","RscReply","#CUSTOM_RADIO","RscRadio","RscGroupRootMenu"];
				(findDisplay 46) displayRemoveAllEventHandlers "KeyDown";
				(findDisplay 46) displayRemoveAllEventHandlers "KeyUp";
				(finddisplay 106) displayRemoveAllEventHandlers 'KeyDown';
				(finddisplay 106) displayRemoveAllEventHandlers 'KeyUp';
				(findDisplay 46) displayAddEventHandler ["KeyDown","_this call dayz_spaceInterrupt"];
				((findDisplay 12) displayCtrl 51) ctrlRemoveAllEventHandlers 'MouseButtonDown';
				((findDisplay 12) displayCtrl 51) ctrlRemoveAllEventHandlers 'MouseButtonUp';
				((findDisplay 3030) displayCtrl 2) ctrlRemoveAllEventHandlers 'LBDblClick';
				if (isNull (findDisplay 106)) then {closeDialog 0;};
				player allowDamage true;
				buttonSetAction [104, ''];
				if ((typeName player != "OBJECT") or (typeName true != "BOOL")) then
				{
					//World Info
					_world = toUpper(worldName); //toUpper(getText (configFile >> "CfgWorlds"" >> (worldName) >> "description"));
					_nearestCity = (nearestLocations [getPos player, ["NameCityCapital","NameCity","NameVillage","NameLocal"],1000] select 0);
					_town = "Wilderness";
					if (!isNull _nearestCity) then {_town = text _nearestCity};
					//Event Handler
					_type = (typeName player);
					_x = format ["%1",_type];
					dayz_rcmd = [false, name player, getPlayerUID player, 'Anti-Anti Hack', _x, _world, _town];
					publicVariableServer 'dayz_rcmd';
					//Punishment
					disableUserInput true;
					if (alive player) then { player SetDamage 1;};
					for "_j" from 0 to 100 do {(findDisplay _j) closeDisplay 0;};
				};
				sleep 0.8;
			};
		},{
			while {true} do
			{
				_items = weapons player;
				{
					if (_x in _items) then
					{
						player removeWeapon _x;
						//World Info
						_world = toUpper(worldName); //toUpper(getText (configFile >> "CfgWorlds"" >> (worldName) >> "description"));
						_nearestCity = (nearestLocations [getPos player, ["NameCityCapital","NameCity","NameVillage","NameLocal"],1000] select 0);
						_town = "Wilderness";
						if (!isNull _nearestCity) then {_town = text _nearestCity};
						//Event Handler
						dayz_rcmd = [false, name player, getPlayerUID player, 'Bad Item', _x, _world, _town];
						publicVariableServer 'dayz_rcmd';
						//Punishment
						disableUserInput true;
						if (alive player) then { player SetDamage 1;};
						for "_j" from 0 to 100 do {(findDisplay _j) closeDisplay 0;};
					};
				} forEach ['MakarovSD'];
				sleep 60;
				//BAF_L85A2_RIS_Holo
			};
		},{
			disableSerialization;
			while {true} do
			{
				waitUntil {!isNull (findDisplay 49)};
				call dayz_forceSave;
				[] spawn dayz_disableRespawn;
				waitUntil {isNull (findDisplay 49)};
				if (!(isNull findDisplay 3030) || !(isNull findDisplay 155)) then 
				{
					//World Info
					_world = toUpper(worldName); //toUpper(getText (configFile >> "CfgWorlds"" >> (worldName) >> "description"));
					_nearestCity = (nearestLocations [getPos player, ["NameCityCapital","NameCity","NameVillage","NameLocal"],1000] select 0);
					_town = "Wilderness";
					if (!isNull _nearestCity) then {_town = text _nearestCity};
					//Event Handler
					dayz_rcmd = [true, name player, getPlayerUID player, 'Hack Menu', '', _world, _town];
					publicVariableServer 'dayz_rcmd';
					//Punishment
					disableUserInput true;
					if (alive player) then { player SetDamage 1;};
					for "_j" from 0 to 100 do {(findDisplay _j) closeDisplay 0;};
				}
			};
		},{
			private["_sleepGodModeCheck", "_terrainGrid","_recoilSettings","_zombieCheck","_damageHandler","_unconsciousFunction"];

			// How many seconds to wait between checks
			_sleepGodModeCheck = 30;
			// http://community.bistudio.com/wiki/setTerrainGrid
			_terrainGrid = 25;
			
			// Default recoil settings
			_recoilSettings = unitRecoilCoefficient player;
			
			// Load original functions for damage handling
			_zombieCheck = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_zombieCheck.sqf";
			_damageHandler = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_damageHandler.sqf";
			_unconsciousFunction = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_unconscious.sqf";

			while {true} do
			{
				// Re-add functions
				player_zombieCheck = _zombieCheck;
				fnc_usec_damageHandler = _damageHandler;
				fnc_usec_unconscious = _unconsciousFunction;
					
				if (unitRecoilCoefficient player != _recoilSettings) exitWith
				{
					//World Info
					//_world = toUpper(worldName); //toUpper(getText (configFile >> "CfgWorlds"" >> (worldName) >> "description"));
					//_nearestCity = (nearestLocations [getPos player, ["NameCityCapital","NameCity","NameVillage","NameLocal"],1000] select 0);
					//_town = "Wilderness";
					//if (!isNull _nearestCity) then {_town = text _nearestCity};
					//Recoil Setting Info
					//_beforeRecoil = unitRecoilCoefficient player;
					//_afterRecoil = _recoilSettings;
					//_recoilMsg = format["%1|%2",_beforeRecoil,_afterRecoil];
					//Event Handler
					//dayz_rcmd = [true, name player, getPlayerUID player, 'Recoil Hack', _recoilMsg, _world, _town];
					//publicVariableServer 'dayz_rcmd';
					//Punishment
					//disableUserInput true;
					//if (alive player) then { player SetDamage 1;};
					//for "_j" from 0 to 100 do {(findDisplay _j) closeDisplay 0;};
				};
					
				if ((groupIconsVisible select 0) or (groupIconsVisible select 1))exitWith
				{
					//World Info
					_world = toUpper(worldName); //toUpper(getText (configFile >> "CfgWorlds"" >> (worldName) >> "description"));
					_nearestCity = (nearestLocations [getPos player, ["NameCityCapital","NameCity","NameVillage","NameLocal"],1000] select 0);
					_town = "Wilderness";
					if (!isNull _nearestCity) then {_town = text _nearestCity};
					dayz_rcmd = [true, name player,getPlayerUID player, 'Group Icons', str groupIconsVisible, _world, _town];
					publicVariableServer 'dayz_rcmd';
					//Punishment
					disableUserInput true;
					if (alive player) then { player SetDamage 1;};
					for "_j" from 0 to 100 do {(findDisplay _j) closeDisplay 0;};
				};

				// Block grasshack (like in survival hack)
				setTerrainGrid _terrainGrid;
					
				// Spoof arrays for ESP
				playableUnits = [player];
				allUnits = [player];
				allMissionObjects = [player];
				entities = [player];
	
				sleep _sleepGodModeCheck;
			};
		},{
			_fileArray = dayz_haxscript;
			while {true} do
			{
				for "_i" from 0 to (count _fileArray)-1 do
				{
					if ((preProcessFileLineNumbers (_fileArray select _i)) != "") then
					{
						//World Info
						_world = toUpper(worldName); //toUpper(getText (configFile >> "CfgWorlds"" >> (worldName) >> "description"));
						_nearestCity = (nearestLocations [getPos player, ["NameCityCapital","NameCity","NameVillage","NameLocal"],1000] select 0);
						_town = "Wilderness";
						if (!isNull _nearestCity) then {_town = text _nearestCity};
						//Event Handler
						_caughtScript = format ['%1', _i];
						dayz_rcmd = [true, name player, getPlayerUID player, 'Script', _caughtScript, _world, _town];
						publicVariableServer 'dayz_rcmd';
						//Punishment
						disableUserInput true;
						if (alive player) then { player SetDamage 1;};
						sleep 1;
						for "_j" from 0 to 100 do {(findDisplay _j) closeDisplay 0;};
					};
					sleep 0.2;
				};
				sleep 120;
			};
		}];
	};
};

BIS_MPF_remoteExecutionServer =
{
	if ((_this select 1) select 2 == "JIPrequest") then
	{
		_callType = (_this select 0);
		_playerID = getPlayerUID ((_this select 1) select 0);
		_playerObj = (_this select 1) select 0;
		_playerName = name _playerObj;
		_clientID = owner _playerObj;

		[nil,(_this select 1) select 0,"loc",rJIPEXEC,[any,any,"per","execVM","ca\Modules\Functions\init.sqf"]] call RE;
		
		//_id = [_playerID,_playerObj] call server_playerLogin;
		
		[nil,(_this select 1) select 0,"loc",rCallVar,[_playerID],"code4815"] call RE;
	};
};

publicVariable "BP_Devs";
publicVariable "BP_Admins";
publicVariable "BP_Spec_ID";
publicVariable "code4815";

_ah_thread = [] spawn {
	while {isServer} do {
		BIS_MPF_remoteExecutionServer =
		{
			if ((_this select 1) select 2 == "JIPrequest") then
			{
				_callType = (_this select 0);
				_playerID = getPlayerUID ((_this select 1) select 0);
				_playerObj = (_this select 1) select 0;
				_playerName = name _playerObj;
				_clientID = owner _playerObj;

				[nil,(_this select 1) select 0,"loc",rJIPEXEC,[any,any,"per","execVM","ca\Modules\Functions\init.sqf"]] call RE;
				
				//_id = [_playerID,_playerObj] call server_playerLogin;
				
				[nil,(_this select 1) select 0,"loc",rCallVar,[_playerID],"code4815"] call RE;
			};
		};
		sleep 120;
	};
};