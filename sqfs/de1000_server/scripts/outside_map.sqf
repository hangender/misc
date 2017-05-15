
private["_allvec","_charPos"];

diag_log("CHECK FOR VEHICLES OUTSIDE MAP");
_allvec = [6800, 9200, 0] nearEntities ["AllVehicles", 100000];
{
if ((_x isKindOf "LandVehicle") or (_x isKindOf "Air") or (_x isKindOf "Ship") or (_x isKindOf "Motorcycle")) then {
_charPos = (getPosATL _x);
if ((_charPos select 0) < -500) then {
_x setDamage 1;
needUpdate_objects = needUpdate_objects + [_x];
diag_log(format["DESTROYED VEHICLE: %1 OUTSIDE MAP",_x]);
}
else {
if ((_charPos select 1) > 15700) then {
_x setDamage 1;
needUpdate_objects = needUpdate_objects + [_x];
diag_log(format["DESTROYED VEHICLE: %1 OUTSIDE MAP",_x]);
};	
};
};
} forEach _allvec;