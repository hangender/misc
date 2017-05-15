#line 1 "z\addons\zero_server\init\server_functions.sqf"

waitUntil { !isNil "BIS_fnc_init" };


BIS_Effects_Burn = {};

if (isNil "totalSessionConnections") then { totalSessionConnections = 0; };
if (isNil "botPlayers") then { botPlayers = []; };

call compile preprocessFileLineNumbers "\z\addons\zero_server\client\zero_client_functions.sqf";
call compile preprocessFileLineNumbers "\z\addons\zero_server\server\zero_server_functions.sqf";
call client_initializeGlobals;

server_maintenance =		compile preprocessFileLineNumbers "\z\addons\zero_server\system\server_maintenance.sqf";
server_playerLogin =		compile preprocessFileLineNumbers "\z\addons\zero_server\compile\server_playerLogin.sqf";
server_playerSetup =		compile preprocessFileLineNumbers "\z\addons\zero_server\compile\server_playerSetup.sqf";
server_playerCheck =		compile preprocessFileLineNumbers "\z\addons\zero_server\compile\server_playerCheck.sqf";
server_onPlayerConnect =	compile preprocessFileLineNumbers "\z\addons\zero_server\compile\server_onPlayerConnect.sqf";
server_onPlayerDisconnect = compile preprocessFileLineNumbers "\z\addons\zero_server\compile\server_onPlayerDisconnect.sqf";
server_updateObject =		compile preprocessFileLineNumbers "\z\addons\zero_server\compile\server_updateObject.sqf";
server_playerDied =			compile preprocessFileLineNumbers "\z\addons\zero_server\compile\server_playerDied.sqf";
server_updateNearby =		compile preprocessFileLineNumbers "\z\addons\zero_server\compile\server_updateNearby.sqf";
server_spawnLoot =			compile preprocessFileLineNumbers "\z\addons\zero_server\compile\server_spawnLoot.sqf";
server_spawnCrashSite =		compile preprocessFileLineNumbers "\z\addons\zero_server\compile\server_spawnCrashSite.sqf";
server_publishObj = 		compile preprocessFileLineNumbers "\z\addons\zero_server\compile\server_publishObject.sqf";
server_playerSync =			compile preprocessFileLineNumbers "\z\addons\zero_server\compile\server_playerSync.sqf";
zombie_findOwner =			compile preprocessFileLineNumbers "\z\addons\zero_server\compile\zombie_findOwner.sqf";
onPlayerConnected 			{[_uid,_name] call server_onPlayerConnect;};
onPlayerDisconnected 		{[call compile format["player%1",_uid],_uid,_name] call server_onPlayerDisconnect;};


eh_localCleanup =
{
private ["_object","_unit"];

_object = _this select 0;
_object addEventHandler ["local",
{
if(_this select 1) then
{
_unit = _this select 0;
[_unit] call server_Delete;
};
}];
};

server_characterSync =
{
private["_characterID","_character","_worldspace","_charPos","_debug","_distance","_posX","_posY","_playerGear","_playerBackpack","_medical","_currentState","_currentModel","_key"];

_characterID = _this select 0;
_character = _this select 7;

if (!isNull _character) then
{
_character setVariable ["lastSync",diag_tickTime];
};

if (isNil "_characterID") exitWith
{
diag_log ("ERROR: Cannot server_characterSync Character has nil characterID");
};

if (_characterID == "0") exitWith
{
diag_log ("ERROR: Cannot server_characterSync Character has no characterID");
};

_worldspace = _this select 1;
if(count _worldspace > 0) then
{
_charPos = _worldspace select 1;

if(count _charPos > 0) then
{
_debug = getMarkerPos "respawn_west";
_distance = _debug distance _charPos;

if (_distance < 2000) exitWith
{
diag_log ("ERROR: Cannot Sync Character " + str(_characterID) + " in debug plains");
};

_posX = _charPos select 0;
_posY = _charPos select 1;

if(_posX > -50 and _posY < 15500) then
{
_playerGear =  _this select 2;

if(count _playerGear > 0) then
{
_playerBackpack =  _this select 3;

if((str(_playerBackpack) == "["""",[[],[]],[[],[]]]") and (str(_playerGear) == "[[],[]]")) then
{
_playerGear = [];
_playerBackpack = [];
};

_medical =		_this select 4;
_currentState =	_this select 5;
_currentModel =	_this select 6;

_key = format["CHILD:201:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10:%11:%12:%13:",_characterID,_worldspace,_playerGear,_playerBackpack,_medical,"","","",_currentState,"","",_currentModel,""];
_key call server_hiveWrite;
};
};
};
};
};

server_hiveWrite =
{
"HiveEXT" callExtension _this;
};

server_hiveReadWrite =
{
private ["_resultArray", "_key","_resultArray","_data"];

_resultArray = [];

_key = _this;

_data = "HiveEXT" callExtension _key;

_resultArray = call compile format ["%1;",_data];

_resultArray
};

server_getDiff =
{
private ["_variable","_object","_vNew","_vOld","_result"];

_result = 	0;

_variable = _this select 0;
_object = 	_this select 1;
_vNew = 	_object getVariable[_variable,0];
_vOld = 	_object getVariable[(_variable + "_CHK"),_vNew];

if (_vNew < _vOld) then {

_vNew = _vNew + _vOld;
_object getVariable[(_variable + "_CHK"),_vNew];
} else {
_result = _vNew - _vOld;
_object setVariable[(_variable + "_CHK"),_vNew];
};

_result
};

server_getDiff2 =
{
private ["_variable","_object","_vNew","_vOld","_result"];

_result = 0;

_variable = _this select 0;
_object = 	_this select 1;
_vNew = 	_object getVariable[_variable,0];
_vOld = 	_object getVariable[(_variable + "_CHK"),_vNew];
_result = _vNew - _vOld;
_object setVariable[(_variable + "_CHK"),_vNew];

_result
};

dayz_objectUID =
{
private ["_position","_p1","_p2","_p3","_dir","_key","_object"];

_key = "0";

_object = _this;
_position = getPosATL _object;
_p1 = round((_position select 0) * 10);
_p2 = round((_position select 1) * 10);
_p3 = round((_position select 2) * 10);

_dir = round(getDir _object);
_key = format["%1%2%3%4",_p1,_p2,_p3,_dir];

_key
};

dayz_objectUID2 =
{
private ["_position","_p1","_p2","_p3","_dir","_key"];

_key = "0";

_dir = round(_this select 0);
_position = _this select 1;
_p1 = round((_position select 0) * 10);
_p2 = round((_position select 1) * 10);
_p3 = round((_position select 2) * 10);
_key = format["%1%2%3%4",_p1,_p2,_p3,_dir];

_key

};
