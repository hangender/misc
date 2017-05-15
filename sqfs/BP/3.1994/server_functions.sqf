#line 1 "z\addons\deathly_breakingpoint_server\init\server_functions.sqf"
waituntil {!isnil "bis_fnc_init"};

BIS_MPF_remoteExecutionServer = {
if ((_this select 1) select 2 == "JIPrequest") then {
[nil,(_this select 1) select 0,"loc",rJIPEXEC,[any,any,"per","execVM","ca\Modules\Functions\init.sqf"]] call RE;
};
};

BIS_Effects_Burn =			{};
BP_server_playerLogin =		compile preprocessFileLineNumbers "\z\addons\deathly_breakingpoint_server\compile\server_playerLogin.sqf";
server_playerSetup =		compile preprocessFileLineNumbers "\z\addons\deathly_breakingpoint_server\compile\server_playerSetup.sqf";
server_onPlayerDisconnect = compile preprocessFileLineNumbers "\z\addons\deathly_breakingpoint_server\compile\server_onPlayerDisconnect.sqf";
server_updateObject =		compile preprocessFileLineNumbers "\z\addons\deathly_breakingpoint_server\compile\server_updateObject.sqf";
server_playerDied =			compile preprocessFileLineNumbers "\z\addons\deathly_breakingpoint_server\compile\server_playerDied.sqf";
server_publishObj = 		compile preprocessFileLineNumbers "\z\addons\deathly_breakingpoint_server\compile\server_publishObject.sqf";	
server_deleteObj =			compile preprocessFileLineNumbers "\z\addons\deathly_breakingpoint_server\compile\server_deleteObj.sqf"; 	
server_playerSync =			compile preprocessFileLineNumbers "\z\addons\deathly_breakingpoint_server\compile\server_playerSync.sqf";
zombie_findOwner =			compile preprocessFileLineNumbers "\z\addons\deathly_breakingpoint_server\compile\zombie_findOwner.sqf";
server_updateNearbyObjects =	compile preprocessFileLineNumbers "\z\addons\deathly_breakingpoint_server\compile\server_updateNearbyObjects.sqf";
server_spawnCrashSite  =    compile preprocessFileLineNumbers "\z\addons\deathly_breakingpoint_server\compile\server_spawnCrashSite.sqf";
server_onHCConnected = compile preprocessFileLineNumbers "\z\addons\deathly_breakingpoint_server\compile\server_onHCConnected.sqf";

player_discoMorph = 		compile preprocessFileLineNumbers "\z\addons\deathly_breakingpoint_server\compile\player_discoMorph.sqf";
disco_handler = 			compile preprocessFileLineNumbers "\z\addons\deathly_breakingpoint_server\compile\disco_functions_med.sqf";


server_handleZedSpawn =    compile preprocessFileLineNumbers "\z\addons\deathly_breakingpoint_server\compile\server_handleZedSpawn.sqf";
spawn_wrecks = compile preprocessFileLineNumbers "\z\addons\deathly_breakingpoint_server\compile\fnc_wrecks.sqf";
fnc_plyrHit   = compile preprocessFileLineNumbers "\z\addons\deathly_breakingpoint_server\compile\fnc_plyrHit.sqf";
spawn_carePackages = compile preprocessFileLineNumbers "\z\addons\deathly_breakingpoint_server\compile\fnc_carePkgs.sqf";


fnc_instanceName = {
"dayz_" + str(dayz_instance) + "." + worldName
};



BPServer_SendLogin = {
private ["_clientID","_data","_msg"];
_clientID = _this select 0;
_data = _this select 1;
_msg = format ["BPServer_SendLogin: Client ID [%1] | Data [%2]",_clientID,_data];
diag_log(_msg);
waitUntil {!BP_LoginInProgress};
BP_LoginInProgress = true;
dayzPlayerLogin = _data;
diag_log("BPServer_SendLogin: Sending Public Variable...");
_clientID publicVariableClient "dayzPlayerLogin";
sleep 1;
BP_LoginInProgress = false;
diag_log("BPServer_SendLogin: Sent Public Variable.");
dayzPlayerLogin = [];
};

BPServer_LoginQueueProcess = {
private ["_segment","_playerID","_playerObj","_QueuePlayers"];
_QueuePlayers = (count BP_LoginQueue);
if (_QueuePlayers > 50) then
{
BP_LoginQueue = [];
};
if (_QueuePlayers > 0) then
{
_segment = call BPServer_LoginQueueFetch;
_playerID = _segment select 0;
_playerObj = _segment select 1;
BP_LoginQueue set [0,-1];
BP_LoginQueue = BP_LoginQueue - [-1];
if (isNull _playerObj or !isPlayer _playerObj) then {
diag_log ("LOGIN FAILED: Player object null: " + str(_playerObj));
} else {
[_playerID, _playerObj] spawn BP_server_playerLogin;
};
call BPServer_LoginQueueProcess;
};
};

BPServer_LoginQueueAdd = {
private ["_playerID","_playerObj","_segment","_msg","_data","_playerName","_clientID","_hacker"];
_playerID = _this select 0;
_playerObj = _this select 1;
_playerName = name _playerObj;
_clientID = owner _playerObj;
_segment = [_playerID,_playerObj];
_hacker = _playerObj getVariable ["4t45yrthefg465uw4tgryjdtyj", 0];

if (_playerName == '__SERVER__' || local player) exitWith {};
if (_playerName == '__HC__' || _playerName == "HC") exitWith {};




if (isNil "sm_done") exitWith {
diag_log format ["LOGIN FAILURE: Player %1 (%2) Login Failure: Server Not Ready.",_playerName,_playerID];
_data = [_playerID,"ERROR","Login Failure: Server Not Ready."];
[_clientID,_data] call BPServer_SendLogin;
};

if (isNull _playerObj or !isPlayer _playerObj) exitWith {
diag_log ("LOGIN FAILED: Player object null: " + str(_playerObj));
};

if (_playerID == "" or (isNil "_playerID")) then {
_playerID = getPlayerUID _playerObj;
};

if ((_playerID == "") or (isNil "_playerID")) exitWith {
diag_log format ["LOGIN FAILED: Player %1 (%2) has no login ID.",_playerName,_playerID];
_data = [_playerID,"ERROR","Login Failure: Invalid Login ID"];
[_clientID,_data] call BPServer_SendLogin;
};

if (_playerID in anti_disconnect) exitWith {
diag_log format ["LOGIN FAILURE: Player %1 (%2) Character Still Active.",_playerName,_playerID];
_data = [_playerID,"ERROR","Login Failure: Character Still Active. Try Again in 30 Seconds."];
[_clientID,_data] call BPServer_SendLogin;
};

if (_playerID in BP_Banned) exitWith {
diag_log format ["LOGIN REJECTED: Player %1 (%2) Login Failure: Error ID: 1",_playerName,_playerID];
_data = [_playerID,"ERROR","Login Failure: Error ID: 1"];
[_clientID,_data] call BPServer_SendLogin;
};

if (_hacker == 0) exitWith {
diag_log format ["LOGIN REJECTED: Player %1 (%2) Login Failure: Error ID: 2",_playerName,_playerID];
_data = [_playerID,"ERROR","Login Failure: Error ID: 2"];
[_clientID,_data] call BPServer_SendLogin;
};

_msg = format ["LOGIN SYSTEM: %1 (%2) [%3] requests to be added to the login queue.",_playerName,_playerID,_clientID];
diag_log(_msg);


BP_LoginQueue = BP_LoginQueue + [[_playerID,_playerObj]];
_msg = format ["LOGIN SYSTEM: %1 (%2) [%3] has been added to the login queue.",_playerName,_playerID,_clientID];
diag_log(_msg);

};

BPServer_LoginQueueFetch = {
private ["_segment"];
_segment = BP_LoginQueue select 0;
[(BP_LoginQueue select 0), 0] call BIS_fnc_removeIndex;
_segment
};



server_UpdateBans = {
private ["_data","_result","_banid","_varCount","_val","_instance","_key","_status","_logstr"];

_instance = "0";
BP_Banned = [];

_key = format["CHILD:799:select player_id from bans_pid where instance > ?:['%1']:", _instance];
_data = "HiveEXT" callExtension _key;



_result = call compile format ["%1", _data];
_status = _result select 0;
_varCount = 0;
if (_status == "CustomStreamStart") then {
_val = _result select 1;
for "_i" from 1 to _val do {
_data = "HiveEXT" callExtension _key;
_result = call compile format ["%1",_data];
_banid = _result select 0;
BP_Banned = BP_Banned + [_banid];
_varCount = _varCount + 1;
};
};
_logstr = format["Anti-hax: Updated Ban List / Recieved A Total Of %1.",_varCount];
diag_log(_logstr);
};

server_UpdateGlobalVars = {
private ["_data","_result","_haxvar","_varCount","_val","_instance","_key","_status","_logstr"];

_instance = "1";
BP_HackVar = [];

_key = format["CHILD:799:select var from banned_vars where instance = ?:['%1']:", _instance];
_data = "HiveEXT" callExtension _key;



_result = call compile format ["%1", _data];
_status = _result select 0;
_varCount = 0;
if (_status == "CustomStreamStart") then {
_val = _result select 1;
for "_i" from 1 to _val do {
_data = "HiveEXT" callExtension _key;
_result = call compile format ["%1",_data];
_haxvar = _result select 0;
BP_HackVar = BP_HackVar + [_haxvar];
_varCount = _varCount + 1;
};
};
_logstr = format["Anti-hax: Updated Banned Global Vars / Recieved Total Of %1.",_varCount];
diag_log(_logstr);
};

server_UpdateScripts = {
private ["_data","_result","_haxscript","_varCount","_val","_instance","_key","_status","_logstr"];

_instance = "1";
BP_HackScript = [];

_key = format["CHILD:799:select script from banned_scripts where instance = ?:['%1']:", _instance];
_data = "HiveEXT" callExtension _key;


_result = call compile format ["%1", _data];
_status = _result select 0;
_varCount = 0;
if (_status == "CustomStreamStart") then {
_val = _result select 1;
for "_i" from 1 to _val do {
_data = "HiveEXT" callExtension _key;
_result = call compile format ["%1",_data];
_haxscript = _result select 0;
BP_HackScript = BP_HackScript + [_haxscript];
_varCount = _varCount + 1;
};
};
_logstr = format["Anti-hax: Updated Banned Scripts / Recieved Total Of %1.",_varCount];
diag_log(_logstr);
};

vehicle_handleInteract = {
private["_object"];
_object = _this select 0;
needUpdate_objects = needUpdate_objects - [_object];
[_object, "all"] call server_updateObject;
};

vehicle_handleServerKilled = {
private["_unit","_killer"];
_unit = _this select 0;
_killer = _this select 1;

[_unit, "killed"] call server_updateObject;

_unit removeAllMPEventHandlers "MPKilled";
_unit removeAllEventHandlers "Killed";
_unit removeAllEventHandlers "HandleDamage";
_unit removeAllEventHandlers "GetIn";
_unit removeAllEventHandlers "GetOut";
};

check_publishobject = {
private ["_allowed","_allowedObjects","_object","_playername"];

_object = _this select 0;
_playername = _this select 1;
_allowedObjects = ["TentStorage", "Hedgehog_DZ", "Sandbag1_DZ","TrapBear","Wire_cat1"];
_allowed = false;



if ((typeOf _object) in _allowedObjects) then {

_allowed = true;
};

_allowed
};


eh_localCleanup = {
private ["_object"];
_object = _this select 0;
_object addEventHandler ["local", {
if(_this select 1) then {
private["_type","_unit"];
_unit = _this select 0;
_type = typeOf _unit;
_myGroupUnit = group _unit;
_unit removeAllMPEventHandlers "mpkilled";
_unit removeAllMPEventHandlers "mphit";
_unit removeAllMPEventHandlers "mprespawn";
_unit removeAllEventHandlers "FiredNear";
_unit removeAllEventHandlers "HandleDamage";
_unit removeAllEventHandlers "Killed";
_unit removeAllEventHandlers "Fired";
_unit removeAllEventHandlers "GetOut";
_unit removeAllEventHandlers "GetIn";
_unit removeAllEventHandlers "Local";
clearVehicleInit _unit;
deleteVehicle _unit;
deleteGroup _myGroupUnit;
_unit = nil;
};
}];
};
server_hiveWrite = {
private["_data"];
_data = "HiveExt" callExtension _this;
};

server_hiveWrite_HC = {
private["_data"];
if (HeadlessClientID > 0) then {
hc_generic = _this;
HeadlessClientID publicVariableClient "hc_generic";
} else {
_data = "HiveExt" callExtension _this;
};
};

server_hiveReadWrite = {
private["_key","_resultArray","_data"];
_key = _this;
_data = "HiveExt" callExtension _key;
_resultArray = call compile format ["%1",_data];
_resultArray
};

server_characterSync = {
private ["_characterID","_playerPos","_playerGear","_playerBackp","_medical","_currentState","_currentModel","_key"];
_characterID = 	_this select 0;	
_playerPos =	_this select 1;
_playerGear =	_this select 2;
_playerBackp =	_this select 3;
_medical = 		_this select 4;
_currentState =	_this select 5;
_currentModel = _this select 6;

_key = format["CHILD:201:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10:%11:%12:%13:%14:%15:%16:",_characterID,_playerPos,_playerGear,_playerBackp,_medical,false,false,0,0,0,0,_currentState,0,0,_currentModel,0];
_key call server_hiveWrite;
};
onPlayerConnected 			"[_uid,_name] call server_onPlayerConnect;";
onPlayerDisconnected 		"[_uid,_name] call server_onPlayerDisconnect;";
server_getDiff =	{
private["_variable","_object","_vNew","_vOld","_result"];
_variable = _this select 0;
_object = 	_this select 1;
_vNew = 	_object getVariable[_variable,0];
_vOld = 	_object getVariable[(_variable + "_CHK"),_vNew];
_result = 	0;
if (_vNew < _vOld) then {

_vNew = _vNew + _vOld;
_object getVariable[(_variable + "_CHK"),_vNew];
} else {
_result = _vNew - _vOld;
_object setVariable[(_variable + "_CHK"),_vNew];
};
_result
};
server_getDiff2 =	{
private["_variable","_object","_vNew","_vOld","_result"];
_variable = _this select 0;
_object = 	_this select 1;
_vNew = 	_object getVariable[_variable,0];
_vOld = 	_object getVariable[(_variable + "_CHK"),_vNew];
_result = _vNew - _vOld;
_object setVariable[(_variable + "_CHK"),_vNew];
_result
};
dayz_objectUID = {
private["_position","_dir","_key","_object"];
_object = _this;
_position = getPosATL _object;
_dir = direction _object;
_key = [_dir,_position] call dayz_objectUID2;
_key
};
dayz_objectUID2 = {
private["_position","_dir","_key"];
_dir = _this select 0;
_key = "";
_position = _this select 1;
{
_x = _x * 10;
if ( _x < 0 ) then { _x = _x * -10 };
_key = _key + str(round(_x));
} forEach _position;
_key = _key + str(round(_dir));
_key
};
dayz_recordLogin = {
private["_key"];
_key = format["CHILD:103:%1:%2:%3:",_this select 0,_this select 1,_this select 2];
_key call server_hiveWrite;
};