private ["_npcCount","_fortress","_ambush","_x64"];
_fortress = (_this select 0);
_x64 = [];
_npcCount = 1;
while { (_npcCount > 0) } do {
_ambush = getPos _fortress nearEntities [["Motorcycle","Car","LandVehicle"],9];	
{
if (_x  != (vehicle player)) then {
if (!(_x in _x64)) then {
_x hideObject true;
_x64 = _x64 + [_x];
};
};
} forEach _ambush;
											
{
if ((_x distance _fortress) > 8) then {
_x hideObject false;
_x64 = _x64 - [_x];
};
} forEach _x64;

											
_npcCount = (count _ambush);
											
if ((player distance _fortress) > 150) then {
	_npcCount = 0;
};
sleep 10;
};
{
_x hideObject false;
} forEach _x64;
handledGarages = handledGarages - [_fortress];						

