#line 1 "z\addons\zero_server\compile\server_onPlayerDisconnect.sqf"

private["_object","_playerName","_dir","_pos","_playerUID","_abortTime","_zombies","_characterID","_key","_message","_isDead","_inventory","_lastSync","_nearby","_humanity","_model"];

_object =		_this select 0;
_playerUID =	_this select 1;
_playerName =	_this select 2;
_dir =			getDir _object;
_pos =			getPosATL _object;

if (vehicle _object != _object) then
{
_object action ["eject", vehicle _object];
};

_characterID = _object getVariable ["CharacterID","0"];
_key = format["CHILD:103:%1:%2:%3:",_playerUID,_characterID,2];
_key call server_hiveWrite;

if ((!isNull _object) and (alive _object)) then
{
_abortTime = diag_tickTime - (_object getVariable ["abortTime",0]) > 2;
if (_abortTime) then
{
_zombies = ({alive _x} count (_pos nearEntities ["zZombie_Base",5]) > 0);
if (_zombies) then
{
if (_characterID != "0") then
{

_object setDamage 1;
_object setVariable ["zero_isDead",true];

_key = format["CHILD:202:%1:%2:",_characterID,0];
_key call server_hiveWrite;

_message = format["Killed by [%1] [%2] using weapon [%3] || CAUSE [%4]","Zombie","0","Hands","zombiedisco"];
_key = format["CHILD:600:%1:%2:%3:","DEATH",_playerUID,_message];
_key call server_hiveWrite;
};
};

_isDead = _object getVariable ["zero_isDead",false];
if(!_isDead) then
{
_inventory = magazines _object;

_lastSync = diag_tickTime - (_object getVariable ["lastSync",0]) > 2;
if (_lastSync) then
{
[_object,_inventory] call server_playerSync;
};

_nearby = ({isPlayer _x} count (_pos nearEntities ["CAManBase",500]) > 1);

if (_nearby) then
{
_humanity =		_object getVariable ["humanity",0];
_model =		_object getVariable ["PlayerModel",typeOf _object];

if (_characterID != "0") then
{
diag_log ("DISCOMORPH START: " + str(_playerUID) + " AT " + str(_pos));
[_playerUID,_characterID,_model,_object,_pos,_dir,_playerName,(animationState _object),_humanity,_inventory] call player_discoMorph;
};
}
else
{
deleteVehicle _object;
};
};

_message = format["Unexpected disconnect at %1",_pos];
_key = format["CHILD:600:%1:%2:%3:","LOGOUT",_playerUID,_message];
_key call server_hiveWrite;
}
else
{
_message = format["Safe disconnect at %1",_pos];
_key = format["CHILD:600:%1:%2:%3:","LOGOUT",_playerUID,_message];
_key call server_hiveWrite;
deleteVehicle _object;
};

{
[_x, "all"] call server_updateObject;
} forEach nearestObjects [_pos, ["LandVehicle","Air","Boat","TentStorage"], 50];
};
