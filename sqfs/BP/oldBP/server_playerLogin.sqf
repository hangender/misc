//line 1 "z\addons\deathly_breakingpoint_server\compile\server_playerLogin.sqf"
private ["_LoginThread","_botActive","_doLoop","_hiveVer","_isHiveOk","_worldspace","_clientID","_playerID","_randomSpot","_primary","_key","_charID","_playerObj","_playerName","_items","_magazines","_weapons","_backpack","_direction","_newUnit","_isNew","_inventory","_survival","_state","_model","_tent","_medicalStats","_newPlayer","_dayzPlayerLogin","_config","_mags","_wpns","_bcpk","_hacker","_ModelArray","_SelectedModel"];


diag_log ("STARTING LOGIN: " + str(_this));

_playerID = _this select 0;
_playerObj = _this select 1;
_playerName = name _playerObj;
_clientID = owner _playerObj;
_worldspace = [];
_hacker = _playerObj getVariable ["4t45yrthefg465uw4tgryjdtyj", 0];

if (_playerName == '__SERVER__' || _playerID == '' || local player) exitWith {};
if (_playerName == '__HC__' || _playerName == "HC") exitWith {};




if (isNil "sm_done") exitWith {
diag_log format ["LOGIN FAILURE: Player %1 (%2) Login Failure: Server Not Ready.",_playerName,_playerID];
dayzPlayerLogin = [_playerID,"ERROR","Login Failure: Server Not Ready."];
_clientID publicVariableClient "dayzPlayerLogin";
dayzPlayerLogin = nil;
};

if (count _this > 2) then {
dayz_players = dayz_players - [_this select 2];
};


_inventory =	[];
_backpack = 	[];
_items = 		[];
_magazines = 	[];
_weapons = 		[];
_medicalStats =	[];
_survival =		[0,0,0];
_tent =			[];
_state = 		[];
_direction =	0;
_model =		"";
_newUnit =		objNull;
_botActive = false;

if (_playerID == "" or (isNil "_playerID")) then {
_playerID = getPlayerUID _playerObj;
};

if ((_playerID == "") or (isNil "_playerID")) exitWith {
diag_log format ["LOGIN FAILED: Player %1 (%2) has no login ID.",_playerName,_playerID];
dayzPlayerLogin = [_playerID,"ERROR","Login Failure: Invalid Login ID"];
_clientID publicVariableClient "dayzPlayerLogin";
dayzPlayerLogin = nil;
};


if (_playerID in BP_Banned) exitWith {
diag_log format ["LOGIN REJECTED: Player %1 (%2) Login Failure: Error ID: 1",_playerName,_playerID];
dayzPlayerLogin = [_playerID,"ERROR","Login Failure: Error ID: 1"];
_clientID publicVariableClient "dayzPlayerLogin";
dayzPlayerLogin = nil;
};

if (_hacker == 0) exitWith {
diag_log format ["LOGIN REJECTED: Player %1 (%2) Login Failure: Error ID: 2",_playerName,_playerID];
dayzPlayerLogin = [_playerID,"ERROR","Login Failure: Error ID: 2"];
_clientID publicVariableClient "dayzPlayerLogin";
dayzPlayerLogin = nil;
};

if (_playerID in anti_disconnect) exitWith {
diag_log format ["LOGIN FAILURE: Player %1 (%2) Character Still Alive.",_playerName,_playerID];
dayzPlayerLogin = [_playerID,"ERROR","Login Failure: Character Still Active. Try Again in 30 Seconds."];
_clientID publicVariableClient "dayzPlayerLogin";
dayzPlayerLogin = nil;
};


diag_log ("LOGIN ATTEMPT: " + str(_playerID) + " " + _playerName);


_doLoop = 0;
while {_doLoop < 5} do {
_key = format["CHILD:101:%1:%2:%3:",_playerID,dayZ_instance,_playerName];
_primary = _key call server_hiveReadWrite;
if (count _primary > 0) then {
if ((_primary select 0) != "ERROR") then {
_doLoop = 9;
};
};
_doLoop = _doLoop + 1;
};

if (isNull _playerObj or !isPlayer _playerObj) exitWith {
diag_log ("LOGIN FAILED: Player object null: " + str(_playerObj));
};

if ((_primary select 0) == "ERROR") exitWith {	
diag_log format ["LOGIN FAILED: %3 (%2) Unable to load _primary: %1 ",_primary,_playerID,_playerName];
dayzPlayerLogin = [_playerID,"ERROR","Login Failure: Critical Hive Failure #1"];
_clientID publicVariableClient "dayzPlayerLogin";
dayzPlayerLogin = nil;
};


_newPlayer = 	_primary select 1;
_isNew = 		count _primary < 6; 
_charID = 		_primary select 2;
_randomSpot = false;




_hiveVer = 0;



_ModelArray = ["Survivor2_DZ"];
_SelectedModel =  (_ModelArray select floor(random(count _ModelArray)));

if (!_isNew) then {

_inventory = 	_primary select 4;
_backpack = 	_primary select 5;
_survival =		_primary select 6;
_model =		_primary select 7;
_hiveVer =		_primary select 8;

if (!(_model in ["ValtielGhillie_BP","UrbanStoneGhillie_BP","UrbanConcreteGhillie_BP","FarmGhillie_BP","TreeBarkGhillie_BP","ForestGhillie_BP","Survivor3_DZ","Bandit1_DZ","Soldier_Crew_PMC","Sniper1_DZ","Sniper2_DZ","Camo1_DZ","Camo2_DZ","Camo3_DZ","Camo4_DZ","Camo5_DZ","Camo6_DZ","Camo7_DZ","Camo8_DZ","Camo9_DZ","Camo10_DZ","Camo11_DZ","Camo12_DZ","Camo13_DZ","Soldier1_DZ","CIV_EuroMan01_DZ","CIV_EuroMan02_DZ","Citizen2_DZ","Citizen3_DZ","Pilot_DZ, INS_Lopotev_DZ","Rocker3_DZ","Survivor2_DZ","Survivor1_DZ"])) then {
_model = _SelectedModel;
};

} else {
_model =		_primary select 3;
_hiveVer =		_primary select 4;
if (isNil "_model") then {
_model = _SelectedModel;
} else {
if (_model == "") then {
_model = _SelectedModel;
};
};


_config = (configFile >> "CfgSurvival" >> "Inventory" >> "Default");
_mags = getArray (_config >> "magazines");
_wpns = getArray (_config >> "weapons");
_bcpk = getText (_config >> "backpack");
_randomSpot = true;


_key = format["CHILD:203:%1:%2:%3:",_charID,[_wpns,_mags],[_bcpk,[],[]]];
_key call server_hiveWrite;

};
diag_log ("LOGIN LOADED: " + str(_playerObj) + " Type: " + (typeOf _playerObj));

_isHiveOk = false;	
if (_hiveVer >= dayz_hiveVersionNo) then {
_isHiveOk = true;
};

_dayzPlayerLogin = [_playerID,_charID,_inventory,_backpack,_survival,_isNew,dayz_versionNo,_model,_isHiveOk,_newPlayer];

_LoginThread = [_clientID,_charID,_playerObj,_dayzPlayerLogin] spawn {

private ["_characterID","_doLoop","_playerID","_playerObj","_randomSpot","_primary","_key","_worldspace","_score","_position","_pos","_isIsland","_medical","_stats","_state","_dummy","_debug","_distance","_hit","_fractures","_w","_findSpot","_humanity","_clientID"];



_clientID = _this select 0;
_characterID = _this select 1;
_playerObj = _this select 2;
dayzPlayerLogin = _this select 3;

if (_clientID != (owner _playerObj)) exitWith {	
dayzPlayerLogin = [_playerID,"ERROR","Login Failure: Client ID Mismatch."];
_clientID publicVariableClient "dayzPlayerLogin";
};

if (_playerID != (getPlayerUID _playerObj)) exitWith {	
dayzPlayerLogin = [_playerID,"ERROR","Login Failure: Player ID Mismatch."];
_clientID publicVariableClient "dayzPlayerLogin";
};



_doLoop = 0;
while {_doLoop < 5} do {
_key = format["CHILD:102:%1:",_characterID];
_primary = _key call server_hiveReadWrite;
if (count _primary > 0) then {
if ((_primary select 0) != "ERROR") then {
_doLoop = 9;
};
};
_doLoop = _doLoop + 1;
};

if ((_primary select 0) == "ERROR") exitWith {	
diag_log format ["LOGIN FAILED: %3 (%2) Critical Hive Failure #2: %1 ",_primary,_playerID,_playerName];
dayzPlayerLogin = [_playerID,"ERROR","Login Failure: Critical Hive Failure #2"];
_clientID publicVariableClient "dayzPlayerLogin";
dayzPlayerLogin = nil;
};

_model = "Survivor2_DZ";
_model = dayzPlayerLogin select 7;
if (_model == "Survivor2_DZ") then
{
_humanity = _primary select 5;

if (_humanity > 5000) then
{
_model = "Survivor3_DZ";
};

if (_humanity < 0) then
{
_model = "Bandit1_DZ";
};
dayzPlayerLogin set [7, _model];
};


dayz_players set [count dayz_players,_playerObj];

dayzPlayerLogin set [count dayzPlayerLogin, _primary];
_clientID publicVariableClient "dayzPlayerLogin";
diag_log ("LOGIN PUBLISHING: is " + str(dayzPlayerLogin));
diag_log ("LOGIN PUBLISHING: " + str(_playerObj) + " Type: " + (typeOf _playerObj));

_dayzPlayerLogin = nil;
dayzPlayerLogin = nil;
dayzLogin = nil;
dayzLogin2 = nil;
};