/*

*/
private ["_object","_myGroup","_playerID","_playerName","_characterID","_playerIDtoarray","_timeout","_id"];
_playerID = _this select 0;
_playerName = _this select 1;

if (_playerName == '__SERVER__' || _playerID == '' || local player) exitWith {};

if (_playerName == '__HC__' || _playerName == 'HC') then {
	HeadlessClientID = 0;
};

_object = call compile format["player%1",_playerID];
_characterID =	_object getVariable ["characterID","0"];
_timeout = _object getVariable["combattimeout",0];

_playerIDtoarray = [];
_playerIDtoarray = toArray _playerID;

if (vehicle _object != _object) then {
	_inVehicle = true;
	_object action ["eject", vehicle _object];
};

if (59 in _playerIDtoarray) exitWith { };

if ((_timeout - time) > 0) then {
	diag_log format["PLAYER HAS COMBAT LOGGED: %1 (%2)", _playerName,_timeout];
};

if (_characterID != "0") then {
    if (alive _object) then {
        [_playerID,_characterID,typeof _object,_object] spawn player_discoMorph;
		[_object,[],true,true] call server_playerSync;
		_id = [_playerID, _characterID, 2] spawn dayz_recordLogin;
    };
};

diag_log format["DISCONNECT: %1 (%2) Object: %3, _characterID: %4", _playerName,_playerID,_object,_characterID];

dayz_disco = dayz_disco - [_playerID];

if (!isNull _object) then {
	//Update Vehicle
	{ [_x,"gear"] call server_updateObject } foreach
	(nearestObjects [getPosATL _object, ["Car", "Helicopter", "Motorcycle", "Ship", "TentStorage"], 10]);
	if (alive _object) then {
		//[_object,(magazines _object),true,(unitBackpack _object)] call server_playerSync;
		[_object,[],true] call server_playerSync;
		_myGroup = group _object;
		deleteVehicle _object;
		deleteGroup _myGroup;
	};
};
