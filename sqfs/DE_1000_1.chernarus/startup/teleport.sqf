// intrntbrn
private["_pos","_posStr","_radius","_newPos"];
_pos = (_this select 0);
_posStr = (_this select 1);
_radius = (_this select 2);
_newPos = [_pos, 0, _radius, 5, 0, 999, 0] call BIS_fnc_findSafePos;
player setPos _newPos;
teleported = true;
sleep 1;
[_posStr] spawn bis_fnc_infotext;
titleText [_posStr, "PLAIN DOWN", 3];
titleFadeOut 3;
reload player;

private["_uid","_master", "_elite","_profi"];
_uid = getPlayerUID player;
if (_uid in donator_master) then {
	[] execVM "startup\loadout\master.sqf";
} else {
	if (_uid in  donator_elite) then {
		[] execVM "startup\loadout\elite.sqf";
	} else {
		if (_uid in donator_profi) then {
			[] execVM "startup\loadout\profi.sqf";
		};
	};
};
