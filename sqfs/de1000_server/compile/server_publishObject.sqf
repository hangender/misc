
private ["_class","_uid","_charID","_object","_worldspace","_key"];

_charID =		_this select 0;
_object = 		_this select 1;
_worldspace = 	_this select 2;
_class = 		_this select 3;



if (!(_object isKindOf "Building")) exitWith {
deleteVehicle _object;
};
_allowed = [_object, "Server"] call check_publishobject;
if (!_allowed) exitWith { };




_uid = _worldspace call dayz_objectUID2;


if (_object isKindOf "TrapItems") then {
_key = format["CHILD:308:%1:%2:%3:%4:%5:%6:%7:%8:%9:",dayZ_instance, _class, 0 , _charID, _worldspace, [_object getVariable ["armed", false]], [], 0,_uid];
} else {
_key = format["CHILD:308:%1:%2:%3:%4:%5:%6:%7:%8:%9:",dayZ_instance, _class, 0 , _charID, _worldspace, [], [], 0,_uid];
};

_key call server_hiveWrite;

_object setVariable ["ObjectUID", _uid,true];

if (_object isKindOf "TentStorage" || _object isKindOf "CamoNet_DZ") then {
_object addMPEventHandler ["MPKilled",{_this call vehicle_handleServerKilled;}];
};

dayz_serverObjectMonitor set [count dayz_serverObjectMonitor,_object];


diag_log ("PUBLISH: Created " + (_class) + " with ID " + _uid);