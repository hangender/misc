//intrntbrn
systemChat ("DE 1000 > VIP System > Elite Access granted");
titleText ["Select your Weapon", "PLAIN", 3];
titleFadeOut 5;
sleep 1;

if (!("ItemFlashlight" in weapons player)) 		then { player addWeapon 'ItemFlashlight'; };
if (!("binocular" in weapons player))			then { player addWeapon 'binocular';};
if (!("ItemMap" in weapons player)) 			then { player addWeapon 'ItemMap'; };
if (!("ItemCompass" in weapons player)) 		then { player addWeapon 'ItemCompass'; };
if (!("ItemWatch" in weapons player)) 			then { player addWeapon 'ItemWatch'; };
if (!("ItemGPS" in weapons player)) 			then { player addWeapon 'ItemGPS'; };
if (!("ItemRadio" in weapons player)) 			then { player addWeapon 'ItemRadio'; };
if (!("ItemHatchet" in weapons player)) 		then { player addWeapon 'ItemHatchet'; };
if (!("ItemKnife" in weapons player)) 			then { player addWeapon 'ItemKnife'; };
if (!("ItemToolbox" in weapons player)) 		then { player addWeapon 'ItemToolbox'; };
if (!("ItemMatchbox" in weapons player)) 		then { player addWeapon 'ItemMatchbox'; };
if (!("ItemEtool" in weapons player)) 			then { player addWeapon 'ItemEtool'; };

// remove general startgear
removeBackpack player;

while {"ItemBandage" in magazines player} do {
	player removeMagazines 'ItemBandage';
};

if ("MakarovSD" in weapons player) then {
	player removeWeapon 'MakarovSD';
};
while {"8Rnd_9x18_MakarovSD" in magazines player} do {
	player removeMagazines '8Rnd_9x18_MakarovSD';
};

player addMagazine 'ItemBloodbag';

player addBackpack "DZ_CivilBackpack_EP1";
clearMagazineCargo (unitBackpack player);
(unitBackpack player) addMagazineCargo ["ItemPainkiller",1];
(unitBackpack player) addMagazineCargo ["ItemMorphine",1];
(unitBackpack player) addMagazineCargo ["ItemAntibiotic",1];
(unitBackpack player) addMagazineCargo ["FoodrabbitCooked",1];
(unitBackpack player) addMagazineCargo ["ItemSodaMdew",1];

donator_elite_menu =
[
	["",true],
		["M249 SAW", [2],  "", -5, [["expression", 				"['M249_DZ','200Rnd_556x45_M249', 2, 'M9SD','15Rnd_9x19_M9SD', 4, 4, nil, 0] execVM 'startup\addweapon.sqf'"]], "1", "1"],
		["M4A1 Holo", [3],  "", -5, [["expression", 			"['M4A1_HWS_GL_camo','30Rnd_556x45_Stanag', 3, 'M9SD','15Rnd_9x19_M9SD', 3, 3, '1Rnd_HE_M203', 2] execVM 'startup\addweapon.sqf'"]], "1", "1"],
		["M4A1 Holo SD", [4],  "", -5, [["expression", 			"['M4A1_HWS_GL_SD_Camo','30Rnd_556x45_StanagSD', 3, 'M9SD','15Rnd_9x19_M9SD', 3, 3, '1Rnd_HE_M203', 2] execVM 'startup\addweapon.sqf'"]], "1", "1"],
		["Bizon PP-19 SD", [5],  "", -5, [["expression", 		"['bizon_silenced','64Rnd_9x19_SD_Bizon', 3, 'M9SD','15Rnd_9x19_M9SD', 4, 4, nil, 0] execVM 'startup\addweapon.sqf'"]], "1", "1"],
		["SA58 ACOG", [6],  "", -5, [["expression", 			"['Sa58V_RCO_EP1','30Rnd_762x39_SA58', 3, 'M9SD','15Rnd_9x19_M9SD', 4, 4, nil, 0] execVM 'startup\addweapon.sqf'"]], "1", "1"],
		["SA58 CCO", [7],  "", -5, [["expression", 				"['Sa58V_CCO_EP1','30Rnd_762x39_SA58', 3, 'M9SD','15Rnd_9x19_M9SD', 4, 4, nil, 0] execVM 'startup\addweapon.sqf'"]], "1", "1"],
		["G36A camo", [8],  "", -5, [["expression", 			"['G36A_camo','30Rnd_556x45_G36', 3, 'M9SD','15Rnd_9x19_M9SD', 4, 4, nil, 0] execVM 'startup\addweapon.sqf'"]], "1", "1"],
		["MK12 SPR", [9],  "", -5, [["expression",				"['M4SPR','30Rnd_556x45_Stanag', 3, 'M9SD','15Rnd_9x19_M9SD', 4, 4, nil, 0] execVM 'startup\addweapon.sqf'"]], "1", "1"],
		["M4A1 CCO SD", [10],  "", -5, [["expression", 			"['M4A1_AIM_SD_camo','30Rnd_556x45_StanagSD', 3, 'M9SD','15Rnd_9x19_M9SD', 4, 4, nil, 0] execVM 'startup\addweapon.sqf'"]], "1", "1"]
];

showCommandingMenu "#USER:donator_elite_menu";