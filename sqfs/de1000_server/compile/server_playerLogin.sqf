
private ["_botActive","_doLoop","_hiveVer","_isHiveOk","_playerID","_playerObj","_randomSpot","_primary","_key","_charID","_playerName","_items","_magazines","_weapons","_backpack","_worldspace","_direction","_newUnit","_isNew","_inventory","_survival","_state","_model","_config","_mags","_wpns","_bcpk","_medicalStats","_tent","_newPlayer"];






diag_log ("STARTING LOGIN: " + str(_this));


_playerID = _this select 0;
_playerObj = _this select 1;
_playerName = name _playerObj;
_worldspace = [];

if (_playerName == '__SERVER__' || _playerID == '' || local player) exitWith {};




if (isNil "sm_done") exitWith { diag_log ("Login cancelled, server is not ready. " + str(_playerObj)); };


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

if (_playerID == "") then {
_playerID = getPlayerUID _playerObj;
};

if ((_playerID == "") or (isNil "_playerID")) exitWith {
diag_log ("LOGIN FAILED: Player [" + _playerName + "] has no login ID");
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
diag_log ("LOGIN RESULT: Exiting, player object null: " + str(_playerObj));
};

if ((_primary select 0) == "ERROR") exitWith {	
diag_log format ["LOGIN RESULT: Exiting, failed to load _primary: %1 for player: %2 ",_primary,_playerID];
};


_newPlayer = 	_primary select 1;
_isNew = 		count _primary < 6; 
_charID = 		_primary select 2;
_randomSpot = false;




_hiveVer = 0;

if (!_isNew) then {

_inventory = 	_primary select 4;
_backpack = 	_primary select 5;
_survival =		_primary select 6;
_model =		_primary select 7;
_hiveVer =		_primary select 8;







} else {
_model =		_primary select 3;
_hiveVer =		_primary select 4;
if (isNil "_model") then {
_model = "Survivor2_DZ";
} else {
if (_model == "") then {
_model = "Survivor2_DZ";
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




([4654,9595,0] nearestObject 145259) setDamage 1;
([4654,9595,0] nearestObject 145260) setDamage 1;

PVCDZ_plr_Login = [_charID,_inventory,_backpack,_survival,_isNew,dayz_versionNo,_model,_isHiveOk,_newPlayer];
(owner _playerObj) publicVariableClient "PVCDZ_plr_Login";