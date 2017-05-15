#line 1 "z\addons\zero_server\compile\server_updateNearby.sqf"

private["_pos"];

_pos = _this select 0;

{
[_x, "all"] call server_updateObject;
} forEach nearestObjects [_pos, ["LandVehicle","Air","Boat","TentStorage"], 50];
