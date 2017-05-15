
private["_pos"];
_pos = _this select 0;























{
[_x, "gear"] call server_updateObject;

diag_log(format["Updating nearby object at %1",_pos]);

} forEach nearestObjects [_pos, ["Car", "Helicopter", "Motorcycle", "Ship", "TentStorage", "StashSmall", "StashMedium", "TKOrdnanceBox_EP1"], 10];