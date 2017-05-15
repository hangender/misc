private["_safe","_itemCount"];
_safe = (_this select 3);
_itemCount = ((count ((getWeaponCargo _safe) select 1)) + (count ((getMagazineCargo _safe) select 1)));

if (_itemCount > 50) then {
	titleText [format["Different Items: %1/50 - If you dont remove items, you will lose everything",_itemCount], "PLAIN DOWN", 3];
} else {
	titleText [format["Different Items: %1/50 - Dont exceed this limit!",_itemCount], "PLAIN DOWN", 3];
};
player removeAction s_safecargo;
s_safecargo = -1;