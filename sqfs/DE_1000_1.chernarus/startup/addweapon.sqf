//intrntbrn
private["_weapon", "_mag", "_magX", "_pistol", "_pistolMag", "_pistolMagX", "_bandageX", "_special", "_specialX","_uid"];
_weapon = (_this select 0);
_mag = (_this select 1);
_magX = (_this select 2);
_pistol = (_this select 3);
_pistolMag = (_this select 4);
_pistolMagX = (_this select 5);
_bandageX = (_this select 6);
_special = (_this select 7);
_specialX = (_this select 8);
_uid = (getPlayerUID player);

player addWeapon _pistol;
player addWeapon _weapon;
player selectWeapon _weapon;

while { (_magX > 0) } do {
	player addMagazine _mag;
	_magX = _magX - 1;
};

while { (_pistolMagX > 0) } do {
	player addMagazine _pistolMag;
	_pistolMagX = _pistolMagX - 1;
};

while { (_bandageX > 0) } do {
	player addMagazine 'ItemBandage';
	_bandageX = _bandageX - 1;
};

while { _specialX > 0 } do {
	player addMagazine _special;
	_specialX = _specialX - 1;
};
reload player;

titleText ["Select your Skin", "PLAIN", 5];
titleFadeOut 3;

sleep 1;


if (_uid in donator_skin) then {
	[] execVM "skins\showmenu.sqf";
} else {
	if (_uid in donator_master) then {
		[] execVM "startup\loadout\master_skins.sqf";
	} else {
		if (_uid in  donator_elite) then {
			[] execVM "startup\loadout\elite_skins.sqf";
		} else {
			[] execVM "startup\loadout\profi_skins.sqf";
		};
	};
};
