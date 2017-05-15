//intrntbrn
systemChat ("DE 1000 > VIP System > Master Access granted");
titleText ["Select your Weapon", "PLAIN", 3];
titleFadeOut 5;
sleep 1;

if (("ItemFlashlight" in weapons player)) 		then { player removeWeapon 'ItemFlashlight'; };
if (("binocular" in weapons player))			then { player removeWeapon 'binocular';};

if (!("ItemFlashlightRed" in weapons player))  	then { player addWeapon 'ItemFlashlightRed'; };
if (!("ItemMap" in weapons player)) 			then { player addWeapon 'ItemMap'; };
if (!("ItemCompass" in weapons player)) 		then { player addWeapon 'ItemCompass'; };
if (!("ItemWatch" in weapons player)) 			then { player addWeapon 'ItemWatch'; };
if (!("ItemGPS" in weapons player)) 			then { player addWeapon 'ItemGPS'; };
if (!("ItemRadio" in weapons player)) 			then { player addWeapon 'ItemRadio'; };
if (!("ItemHatchet" in weapons player)) 		then { player addWeapon 'ItemHatchet'; };
if (!("ItemKnife" in weapons player)) 			then { player addWeapon 'ItemKnife'; };
if (!("ItemToolbox" in weapons player)) 		then { player addWeapon 'ItemToolbox'; };
if (!("ItemMatchbox" in weapons player)) 		then { player addWeapon 'ItemMatchbox'; };
if (!("binocular_vector" in weapons player)) 	then { player addWeapon 'binocular_vector'; };
if (!("NVGoggles" in weapons player)) 			then { player addWeapon 'NVGoggles'; };
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

// master specific

player addMagazine 'ItemBloodbag';
player addMagazine 'ItemBloodbag';

player addBackpack "DZ_CivilBackpack_EP1";
clearMagazineCargo (unitBackpack player);
(unitBackpack player) addMagazineCargo ["ItemPainkiller",1];
(unitBackpack player) addMagazineCargo ["ItemMorphine",1];
(unitBackpack player) addMagazineCargo ["ItemAntibiotic",1];
(unitBackpack player) addMagazineCargo ["FoodrabbitCooked",1];
(unitBackpack player) addMagazineCargo ["ItemSodaMdew",1];

donator_master_menu =
[
	["",true],
		["M24", [2],  "", -5, [["expression", 					"['M24','5Rnd_762x51_M24', 4, 'M9SD','15Rnd_9x19_M9SD', 4, 4, nil, 0] execVM 'startup\addweapon.sqf'"]], "1", "1"],
		["M24 Desert", [3],  "", -5, [["expression", 			"['M24_des_ep1','5Rnd_762x51_M24', 4, 'M9SD','15Rnd_9x19_M9SD', 4, 4, nil, 0] execVM 'startup\addweapon.sqf'"]], "1", "1"],
		["SVD Camo", [4],  "", -5, [["expression", 				"['SVD_CAMO_DZ','10Rnd_762x54_SVD', 3, 'M9SD','15Rnd_9x19_M9SD', 4, 4, nil, 0] execVM 'startup\addweapon.sqf'"]], "1", "1"],
		["SVD Desert", [5],  "", -5, [["expression", 			"['SVD_des_ep1','10Rnd_762x54_SVD', 3, 'M9SD','15Rnd_9x19_M9SD', 4, 4, nil, 0] execVM 'startup\addweapon.sqf'"]], "1", "1"],
		["M240", [6],  "", -5, [["expression", 					"['M240_DZ','100Rnd_762x51_M240', 2, 'M9SD','15Rnd_9x19_M9SD', 4, 4, nil, 0] execVM 'startup\addweapon.sqf'"]], "1", "1"],
		["M4A1 Holo SD", [7],  "", -5, [["expression", 			"['M4A1_HWS_GL_SD_Camo','30Rnd_556x45_StanagSD', 3, 'M9SD','15Rnd_9x19_M9SD', 3, 3, '1Rnd_HE_M203', 2] execVM 'startup\addweapon.sqf'"]], "1", "1"],
		["G36A camo", [8],  "", -5, [["expression", 			"['G36A_camo','30Rnd_556x45_G36', 3, 'M9SD','15Rnd_9x19_M9SD', 4, 4, nil, 0] execVM 'startup\addweapon.sqf'"]], "1", "1"],
		["MK12 SPR", [9],  "", -5, [["expression",				"['M4SPR','30Rnd_556x45_Stanag', 3, 'M9SD','15Rnd_9x19_M9SD', 4, 4, nil, 0] execVM 'startup\addweapon.sqf'"]], "1", "1"],
		["M249 SAW", [10],  "", -5, [["expression", 			"['M249_DZ','200Rnd_556x45_M249', 2, 'M9SD','15Rnd_9x19_M9SD', 4, 4, nil, 0] execVM 'startup\addweapon.sqf'"]], "1", "1"]
];

showCommandingMenu "#USER:donator_master_menu";