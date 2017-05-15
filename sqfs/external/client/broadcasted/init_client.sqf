// wait for player init
waitUntil {!isNull player};
waitUntil {player == player};
waitUntil {typeName (getPlayerUID player) == "STRING"};
waitUntil {alive player};

// init both
waitUntil {!(isNil "init_both")};
call init_both;

// set overrides
waitUntil {!(isNil "player_eat")};
player_eat = compile preprocessFileLineNumbers "external\override\player_eat.sqf";

waitUntil {!(isNil "player_drink")};
player_drink = compile preprocessFileLineNumbers "external\override\player_drink.sqf";

waitUntil {!(isNil "player_switchModel")};
player_switchModel = compile preprocessFileLineNumbers "external\override\player_switchModel.sqf";

waitUntil {!(isNil "fnc_usec_selfActions")};
fnc_usec_selfActions = compile preprocessFileLineNumbers "external\override\fn_selfActions.sqf";

waitUntil {!(isNil "player_death")};
player_death = compile preprocessFileLineNumbers "external\override\player_death.sqf";

//This is still needed but the fsm should terminate if any errors pop up.
[] spawn {
	private["_timeOut","_display","_control1","_control2"];
	disableSerialization;
	_timeOut = 0;
	dayz_loadScreenMsg = "";
	_display = uiNameSpace getVariable "BIS_loadingScreen";
	_control1 = _display displayctrl 8400;
	_control2 = _display displayctrl 102;
	// 120 sec timeout
	while { _timeOut < 180 && !dayz_clientPreload && !dayz_authed } do {

		if ( isNull _display ) then {
			waitUntil { !dialog; };
			startLoadingScreen ["","RscDisplayLoadCustom"];
			_display = uiNameSpace getVariable "BIS_loadingScreen";
			_control1 = _display displayctrl 8400;
			_control2 = _display displayctrl 102;
		};

		if ( dayz_loadScreenMsg != "" ) then {
			_control1 ctrlSetText dayz_loadScreenMsg;
			dayz_loadScreenMsg = "";
		};
		_control2 ctrlSetText format["%1",round(_timeOut*1)];
		_timeOut = _timeOut + 1;
		sleep 1;
		if ( _timeOut > 4 ) then { startPlayerMonitor = true; };
	};
	endLoadingScreen;
};

// disable some stuff
//enableRadio false;
enableSentences false;
player setVariable ["BIS_noCoreConversations", true];
0 fadeSound 0;
0 fadeRadio 0;

// set tone mapping
"Filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4];
setToneMapping "Filmic";

// needs to be started before the player monitor
waitUntil {!(isNil "cl_killmsg_client")}; call cl_killmsg_client;

// start player monitor
waitUntil {!isNil "dayz_loadScreenMsg"};
dayz_loadScreenMsg = (localize "STR_AUTHENTICATING");
player addEventHandler ["Respawn", {[] spawn player_death;}];
startPlayerMonitor = false;
execFSM "external\client\player_monitor.fsm";

// wait for player init 2
waituntil {!(isNull(findDisplay 46))};
waitUntil {(player distance getMarkerPos "respawn_west") > 250};

// init 3rd party stuff
execVM "\z\addons\dayz_code\system\antihack.sqf";
execVM "\ddopp_taserpack\scripts\init_Taser.sqf";

waitUntil {!(isNil "cl_autorefuel_do")}; waitUntil {!(isNil "cl_autorefuel_action")}; [] spawn cl_autorefuel_action;
waitUntil {!(isNil "cl_miniah")}; [] spawn cl_miniah;
waitUntil {!(isNil "cl_dac_client")}; [] spawn cl_dac_client;
waitUntil {!(isNil "cl_dbgmon")}; [] spawn cl_dbgmon;

// fade in position text
0 cutText ["", "BLACK IN", 3];
_world = toUpper(worldName);
_nearestCity = nearestLocations [getPos player, ["NameCityCapital","NameCity","NameVillage","NameLocal"],1500];
Dayz_logonTown = "Wilderness";
if (count _nearestCity > 0) then {Dayz_logonTown = text (_nearestCity select 0)};
_first = [_world,Dayz_logonTown,localize ("str_player_06") + " " + str(dayz_Survived)] spawn BIS_fnc_infoText;

// fps fix
[] spawn
{
	sleep 15;
	
	listSimDisabled = [];

	while {alive player} do
	{
		private ["_i", "_obj"];
				
		{
			if !((isNull _x) || (alive _x) || (!(simulationEnabled _x))) then
			{
				_x enableSimulation false;
			};

		}forEach entities "Animal";
		
		{
			if !((isPlayer _x) || (_x isKindOf "LandVehicle") || (_x isKindOf "Air") || (_x isKindOf "Boat") || ((_x isKindOf "CAManBase") && (!(_x isKindOf "zZombie_Base")))) then
			{
				if ((simulationEnabled _x) && ((_x distance player) > 2000) && (!(isNull _x))) then
				{
					listSimDisabled set [count listSimDisabled, _x];
					_x enableSimulation false;
				};

			};
		}forEach entities "All";
		
		for "_i" from 0 to ((count listSimDisabled) - 1) do
		{
			_obj = listSimDisabled select _i;
			
			if !(isNull _obj) then
			{
				if ((_obj distance player) < 2000) then
				{
					listSimDisabled set [_i, -1];
					_obj enableSimulation true;
				};
			}
			else
			{
				listSimDisabled set [_i, -1];
			};
		};
		listSimDisabled = listSimDisabled - [-1];
		
		sleep 2;
	};
};