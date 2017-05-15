#line 1 "z\addons\zero_server\compile\server_playerSync.sqf"

private["_character","_magazines","_characterID","_charPos","_isInVehicle","_humanity","_clientID","_debug","_distance","_isNewGear","_playerPos","_playerGear","_playerBackp","_medical","_distanceFoot","_backpack","_kills","_killsB","_killsH","_headShots","_currentWpn","_currentAnim","_config","_onLadder","_isTerminal","_currentModel","_modelChk","_muzzles","_currentState","_array","_key"];

if ( typeName(_this) == "OBJECT" ) then
{
_this = [_this,[]];
};

_character = 	_this select 0;
_magazines =	_this select 1;
_characterID =	_character getVariable ["CharacterID","0"];
_charPos = 		getPosATL _character;
_isInVehicle = 	vehicle _character != _character;
_humanity =		0;

if (_character isKindOf "Animal") exitWith
{
diag_log ("ERROR: Cannot Sync Character " + (name _character) + " is an Animal class");
};

if (isNil "_characterID") exitWith
{
_clientID = (owner _character);
zeroPlayerNilID = ["nil"];
_clientID publicVariableClient "zeroPlayerNilID";
diag_log ("ERROR: Cannot Sync Character " + str(_clientID) + " has nil characterID");
};

if (_characterID == "0") exitWith
{
_clientID = (owner _character);
zeroPlayerNilID = ["0"];
_clientID publicVariableClient "zeroPlayerNilID";
diag_log ("ERROR: Cannot Sync Character " + (name _character) + " has no characterID");
};

_debug = getMarkerPos "respawn_west";
_distance = _debug distance _charPos;
if (_distance < 2000) exitWith
{
diag_log format["ERROR: server_playerSync: Cannot Sync Player %1 [%2]. Position in debug! %3",name _character,_characterID,_charPos];
};



_isNewGear = (count _magazines) > 0;

if (_characterID != "0") then
{
_playerPos =	[];
_playerGear =	[];
_playerBackp =	[];
_medical =		[];
_distanceFoot =	0;


_distanceFoot = [_character,_charPos] call server_playerManagement;

_playerPos = 	[round(direction _character),_charPos];
if (count _charPos < 3) then
{
_playerPos =	[];
};

if (_isNewGear) then
{
_playerGear = [weapons _character,_magazines];
_backpack = unitBackpack _character;
_playerBackp = [typeOf _backpack,getWeaponCargo _backpack,getMagazineCargo _backpack];
};

_medical = _character call player_sumMedical;

_kills = 		["zombieKills",_character] call server_getDiff;
_killsB = 		["banditKills",_character] call server_getDiff;
_killsH = 		["humanKills",_character] call server_getDiff;
_headShots = 	["headShots",_character] call server_getDiff;
_humanity = 	["humanity",_character] call server_getDiff2;

_currentWpn = 	currentMuzzle _character;
_currentAnim =	animationState _character;
_config = 		configFile >> "CfgMovesMaleSdr" >> "States" >> _currentAnim;
_onLadder =		(getNumber (_config >> "onLadder")) == 1;
_isTerminal = 	(getNumber (_config >> "terminal")) == 1;

_currentModel = _character getVariable ["PlayerModel",typeOf _character];
_modelChk = 	_character getVariable ["model_CHK",""];
if (_currentModel == _modelChk) then
{
_currentModel = "";
}
else
{
_currentModel = str(_currentModel);
_character setVariable ["model_CHK",typeOf _character];
};

if (_onLadder or _isInVehicle or _isTerminal) then
{
_currentAnim = "";

if ((count _playerPos > 0) and !_isTerminal) then
{
_charPos set [2,0];
_playerPos set[1,_charPos];
};
};
if (_isInVehicle) then
{
_currentWpn = "";
}
else
{
if ( typeName(_currentWpn) == "STRING" ) then
{
_muzzles = getArray(configFile >> "cfgWeapons" >> _currentWpn >> "muzzles");
if (count _muzzles > 1) then
{
_currentWpn = currentMuzzle _character;
};
}
else
{
_currentWpn = "";
};
};

_currentState = [_currentWpn,_currentAnim,0];

if (count _playerPos > 0) then
{
_array = [];
{
if (_x > -50 and _x < 30000) then
{
_array set [count _array,_x];
};
} forEach (_playerPos select 1);
_playerPos set [1,_array];
};

if (!isNull _character and alive _character) then
{
_key = format["CHILD:201:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10:%11:%12:%13:",_characterID,_playerPos,_playerGear,_playerBackp,_medical,_kills,_headShots,_distanceFoot,_currentState,_killsH,_killsB,_currentModel,_humanity];
_key call server_hiveWrite;
_character setVariable ["lastSync",diag_tickTime];
};
};
