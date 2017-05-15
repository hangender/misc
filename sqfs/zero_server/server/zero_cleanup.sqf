#line 1 "z\addons\zero_server\server\zero_cleanup.sqf"

server_Delete =
{
private["_body","_pos","_sfx"];

_body = _this select 0;
_pos = getPosATL _body;
_sfx = nearestObject [_pos,"Sound_Flies"];

deleteVehicle _body;

if ((!isNull _sfx) and ((_sfx distance _pos) < 10)) then
{
deleteVehicle _sfx;
};
};

server_cleanDead =
{
private ["_deletedZombies","_deletedBodies","_timeStamp","_backpack","_magazines","_backpackMagazines"];

_deletedZombies = 0;
_deletedBodies = 0;

{
if (_x isKindOf "zZombie_Base") then
{
deleteVehicle _x;
_deletedZombies = _deletedZombies + 1;
}
else
{
_timeStamp = _x getVariable ["timeStamp",0];

if (_timeStamp == 0) then
{
_x enableSimulation false;
_backpack = unitBackpack _x;

if (!isNull _backpack) then
{
_magazines = magazines _x;
_backpackMagazines = getMagazineCargo _backpack;

if ((count _magazines < 4) and (count _backpackMagazines < 3)) then
{
[_x] call server_Delete;
_deletedBodies = _deletedBodies + 1;
}
else
{
_x setVariable ["timeStamp",diag_tickTime];

};
}
else
{
_magazines = magazines _x;

if (count _magazines < 4) then
{
[_x] call server_Delete;
_deletedBodies = _deletedBodies + 1;
}
else
{
_x setVariable ["timeStamp",diag_tickTime];

};
};
}
else
{
if ((diag_tickTime - _timeStamp) > 2400) then
{
[_x] call server_Delete;
_deletedBodies = _deletedBodies + 1;
};
};
};
} forEach allDead;

{
if (count units _x == 0) then
{
deleteGroup _x;
};
} forEach allGroups;

diag_log (format["CLEANUP: DELETED %1 PLAYERS AND %2 ZOMBIES",_deletedBodies,_deletedZombies]);
};

server_cleanLoot =
{
private ["_deletedLoot","_startTime","_looted","_objectPos","_noPlayerNear","_nearObj"];

_deletedLoot = 0;
_startTime = diag_tickTime;

{
_looted = (_x getVariable ["looted",-0.1]);
if (_looted != -0.1) then
{
_objectPos = getPosATL _x;
_noPlayerNear = {isPlayer _x} count (_objectPos nearEntities ["CAManBase",35]) == 0;

if (_noPlayerNear) then
{
_nearObj = nearestObjects [_objectPos,["ReammoBox","WeaponHolder","WeaponHolderBase"],((sizeOf (typeOf _x)) + 5)];
{
deleteVehicle _x;
_deletedLoot = _deletedLoot + 1;
} forEach _nearObj;
_x setVariable ["looted",-0.1,true];
};
};
} forEach zero_cleanThis;

_endTime = diag_tickTime;

diag_log (format["CLEANUP: DELETED %1 ITEMS, RUNTIME: %2",_deletedLoot,(_endTime - _startTime)]);
};
