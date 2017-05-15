//intrntbrn
systemChat ("DE 1000 > VIP System > Profi Access granted");
titleText ["Select your Weapon", "PLAIN", 3];
titleFadeOut 5;
sleep 1;

if (!("ItemFlashlight" in weapons player)) 		then { player addWeapon 'ItemFlashlight'; };
if (!("binocular" in weapons player))			then { player addWeapon 'binocular';};
if (!("ItemMap" in weapons player)) 			then { player addWeapon 'ItemMap'; };
if (!("ItemCompass" in weapons player)) 		then { player addWeapon 'ItemCompass'; };
if (!("ItemWatch" in weapons player)) 			then { player addWeapon 'ItemWatch'; };
if (!("ItemRadio" in weapons player)) 			then { player addWeapon 'ItemRadio'; };
if (!("ItemHatchet" in weapons player)) 		then { player addWeapon 'ItemHatchet'; };
if (!("ItemKnife" in weapons player)) 			then { player addWeapon 'ItemKnife'; };
if (!("ItemToolbox" in weapons player)) 		then { player addWeapon 'ItemToolbox'; };
if (!("ItemMatchbox" in weapons player)) 		then { player addWeapon 'ItemMatchbox'; };

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

player addBackpack "DZ_British_ACU";
clearMagazineCargo (unitBackpack player);

donator_profi_menu =
[
	["",true],
		["MK12 SPR", [2],  "", -5, [["expression", 				"['M4SPR','30Rnd_556x45_Stanag', 3, 'M9SD','15Rnd_9x19_M9SD', 4, 4, nil, 0] execVM 'startup\addweapon.sqf'"]], "1", "1"],
		["G36C Camo", [3],  "", -5, [["expression", 			"['G36C_camo','30Rnd_556x45_G36', 3, 'M9SD','15Rnd_9x19_M9SD', 4, 4, nil, 0] execVM 'startup\addweapon.sqf'"]], "1", "1"],
		["G36K Camo", [4],  "", -5, [["expression", 			"['G36K_camo','30Rnd_556x45_G36', 3, 'M9SD','15Rnd_9x19_M9SD', 4, 4, nil, 0] execVM 'startup\addweapon.sqf'"]], "1", "1"],
		["G36A Camo", [5],  "", -5, [["expression", 			"['G36A_camo','30Rnd_556x45_G36', 3, 'M9SD','15Rnd_9x19_M9SD', 4, 4, nil, 0] execVM 'startup\addweapon.sqf'"]], "1", "1"],
		["M4A1 CCO SD", [6],  "", -5, [["expression", 			"['M4A1_AIM_SD_camo','30Rnd_556x45_StanagSD', 3, 'M9SD','15Rnd_9x19_M9SD', 4, 4, nil, 0] execVM 'startup\addweapon.sqf'"]], "1", "1"],
		["M16A4 ACOG", [7],  "", -5, [["expression", 			"['M16A4_ACG','30Rnd_556x45_Stanag', 3, 'M9SD','15Rnd_9x19_M9SD', 4, 4, nil, 0] execVM 'startup\addweapon.sqf'"]], "1", "1"],
		["M4A3 CCO", [8],  "", -5, [["expression", 				"['M4A3_CCO_EP1','30Rnd_556x45_Stanag', 3, 'M9SD','15Rnd_9x19_M9SD', 4, 4, nil, 0] execVM 'startup\addweapon.sqf'"]], "1", "1"],
		["L85A2 Holo", [9],  "", -5, [["expression",			"['BAF_L85A2_RIS_Holo','30Rnd_556x45_Stanag', 3, 'M9SD','15Rnd_9x19_M9SD', 4, 4, nil, 0] execVM 'startup\addweapon.sqf'"]], "1", "1"],
		["AK 107 PSO", [10],  "", -5, [["expression", 			"['AK_107_pso','30Rnd_545x39_AK', 3, 'M9SD','15Rnd_9x19_M9SD', 4, 4, nil, 0] execVM 'startup\addweapon.sqf'"]], "1", "1"]
];

showCommandingMenu "#USER:donator_profi_menu";