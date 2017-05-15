
private["_crate","_weapons","_element"];
_crate = _this select 0;

_weapons = ["M4A1_RCO_GL","M4A1_HWS_GL_camo","M16A4_ACG","M9SD","ksvk","m240_scoped_EP1","M60A4_EP1","SVD_des_EP1","SVD_DZ","DMR_DZ","M24_des_EP1","M24","RPK_74","G36K_camo","G36A_camo","G36C_camo","Mk_48_DZ","M249_DZ","SVD_CAMO","Sa58V_CCO_EP1","Sa58V_RCO_EP1","M40A3","FN_FAL","M14_EP1","m240_dz","SVD_NSPU_EP1","FN_FAL_ANPVS4","Binocular_Vector","ItemRadio","NVGoggles"]; 
_items = ["Skin_Camo1_DZ","Skin_Sniper1_DZ","Skin_Soldier1_DZ","PipeBomb","TrapBear","ItemBandage","ItemBloodbag","ItemPainkiller","ItemMorphine","ItemEpinephrine","ItemAntibiotic","ItemAntibacterialWipe","FoodCanBakedBeans","FoodCanPasta","FoodCanFrankBeans","FoodCanPasta","FoodCanSardines","FoodMRE","ItemSodaMtngreen","ItemSodaR4z0r","ItemSodaCoke","ItemWaterbottle","ItemSodaLemonade","30Rnd_556x45_Stanag","30Rnd_556x45_StanagSD","75Rnd_545x39_RPK","20Rnd_762x51_DMR","10Rnd_762x54_SVD","20Rnd_762x51_FNFAL","5Rnd_127x108_KSVK","30Rnd_762x39_AK47","30Rnd_545x39_AK","5Rnd_762x51_M24","1Rnd_HE_M203","1Rnd_HE_GP25","30Rnd_556x45_G36","30Rnd_556x45_G36SD","30Rnd_762x39_SA58","100Rnd_762x54_PK"];


for "_i" from 0 to 20 do {
_element = _weapons call BIS_fnc_selectRandom;
_crate addWeaponCargoGlobal [_element, 1];
};


for "_i" from 0 to 30 do {
_element = _items call BIS_fnc_selectRandom;
_crate addMagazineCargoGlobal [_element, 5];
};