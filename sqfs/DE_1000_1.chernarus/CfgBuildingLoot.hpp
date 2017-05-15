#include "CfgLoot.hpp"

class CfgBuildingLoot {
	class Default {
		zombieChance = 0.05;
		minRoaming = 0;
		maxRoaming = 2;
		zombieClass[] = {"zZombie_Base","z_hunter","z_teacher","z_suit1","z_suit2","z_worker1","z_worker2","z_worker3","z_villager1","z_villager2","z_villager3"};
		lootChance = 0;
		lootPos[] = {};
		lootType[] = {};
		hangPos[] = {};
		vehPos[] = {};
	};
	class Church: Default {
		zombieChance = 0.15;
		minRoaming = 1;
		maxRoaming = 3;
		zombieClass[] = {"z_priest","z_priest","z_priest"};
		lootChance = 0.7;
		lootPos[] = {};
		lootType[] = {
		//one spawn
		//tools
			{"ItemMatchbox","weapon",0.04},
			{"ItemKnife","weapon",0.04},
			{"ItemMap","generic",0.02},
			{"ItemCompass","weapon",0.04},
			{"ItemFlashlight","weapon",0.05},
			{"ItemWatch","generic",0.05},
			{"Binocular","weapon",0.03},
			{"ItemBookBible","magazine",0.5},
		//weapons
			{"MeleeMachete","weapon",0.03},
			{"WeaponHolder_ItemCrowbar","object",0.03},
			{"WeaponHolder_ItemHatchet","object",0.03},
			{"MeleeBaseBallBat","weapon",0.03},
			{"Makarov","weapon",0.02},
			{"MakarovSD","weapon",0.02},
			{"M9SD","weapon",0.02},
			{"M9","weapon",0.02},
			{"revolver_EP1","weapon",0.02},
			{"Colt1911","weapon",0.02},
		//rifles
			{"Crossbow_DZ","weapon",0.03},
			{"LeeEnfield","weapon",0.02},
			{"Winchester1866","weapon",0.02},
			{"MR43","weapon",0.02},
		//special
			{"WeaponHolder_ItemTent","object",0.01},
			{"ItemSandbag","magazine",0.01},
		//mags special
			{"PartWoodPile","magazine",0.04},
		//bags
			{"DZ_Patrol_Pack_EP1","object",0.04},
			{"DZ_Assault_Pack_EP1","object",0.03},
			{"DZ_ALICE_Pack_EP1","object",0.03},
		//multiple spawns
			{"","trash",0.50},
			{"","Church",0.20},
			{"","generic",0.40}
		};
	};
	class Castle: Default {
		zombieChance = 0.3;
		maxRoaming = 3;
		zombieClass[] = {"z_suit1","z_suit2","z_villager1","z_villager2","z_villager3"};
		lootChance = 0.5;
		lootPos[] = {};
		lootType[] = {
		//tools
			{"ItemMatchbox","weapon",0.04},
			{"ItemKnife","weapon",0.04},
			{"ItemCompass","weapon",0.04},
			{"ItemFlashlight","weapon",0.05},
			{"ItemWatch","generic",0.05},
			{"Binocular","weapon",0.03},
			{"NVGoggles","weapon",0.02},
			{"ItemRadio","weapon",0.05},
			{"ItemGPS","weapon",0.01},
		//weapons
			{"MeleeMachete","weapon",0.03},
			{"WeaponHolder_ItemCrowbar","object",0.03},
			{"WeaponHolder_ItemHatchet","object",0.03},
			{"MeleeBaseBallBat","weapon",0.03},
			{"Makarov","weapon",0.02},
			{"MakarovSD","weapon",0.02},
			{"M9SD","weapon",0.02},
			{"M9","weapon",0.02},
			{"revolver_EP1","weapon",0.02},
			{"Colt1911","weapon",0.02},
		//rifles
			{"Crossbow_DZ","weapon",0.03},
			{"LeeEnfield","weapon",0.04},
			{"Winchester1866","weapon",0.04},
			{"MR43","weapon",0.05},
			{"huntingrifle","weapon",0.01},
			{"Remington870_lamp","weapon",0.02},
			{"bizon","weapon",0.02},
			{"bizon_silenced","weapon",0.02},
			{"MP5A5","weapon",0.02},
			{"MP5SD","weapon",0.01},
			{"M4A1_RCO_GL","weapon",0.005},
			{"AK_107_kobra","weapon",0.005},
			{"AK_107_pso","weapon",0.005},
			{"G36C","weapon",0.005},
			{"G36a","weapon",0.005},
			{"G36K","weapon",0.005},
			{"Sa58P_EP1","weapon",0.005},
			{"Sa58V_CCO_EP1","weapon",0.005},
			{"M16A2","weapon",0.01},
			{"AK_74","weapon",0.01},
			{"M4A1_Aim","weapon",0.005},
			{"AKS_74_kobra","weapon",0.005},
			{"AKS_74_U","weapon",0.01},
			{"AK_47_M","weapon",0.005},
			{"M1014","weapon",0.015},
			{"M4A1","weapon",0.01},
			{"M16A4_ACG","weapon",0.005},
			{"M4A3_CCO_EP1","weapon",0.005},
		//skins
			{"Skin_Sniper1_DZ","magazine",0.02},
			{"Skin_Camo1_DZ","magazine",0.02},
			{"Skin_Soldier1_DZ","magazine",0.02},
		//special
			{"WeaponHolder_ItemTent","object",0.01},
			{"ItemSandbag","magazine",0.01},
		//mags special
			{"PartWoodPile","magazine",0.04},
		//bags
			{"DZ_Patrol_Pack_EP1","object",0.04},
			{"DZ_Assault_Pack_EP1","object",0.03},
			{"DZ_ALICE_Pack_EP1","object",0.03},
			{"DZ_British_ACU","object",0.01}, 
			{"DZ_Backpack_EP1","object",0.01},
			{"DZ_CivilBackpack_EP1","object",0.01}, 
		//multiple spawns
			{"","military",0.50},
			{"","trash",0.50},
			{"","Residential",0.30},
			{"","generic",0.30}
		};
	};	
	class Residential: Default {
		zombieChance = 0.3;
		maxRoaming = 2;
		zombieClass[] = {"zZombie_Base","z_hunter","z_teacher","z_villager1","z_villager2","z_villager3","z_new_villager2","z_new_villager3","z_new_villager4"};
		lootChance = 0.5;
		lootPos[] = {};
		lootType[] = {
		//tools
			{"ItemMatchbox","weapon",0.04},
			{"ItemKnife","weapon",0.04},
			{"ItemCompass","weapon",0.04},
			{"ItemWatch","generic",0.05},
			{"Binocular","weapon",0.03},
		//weapons
			{"MeleeMachete","weapon",0.03},
			{"WeaponHolder_ItemCrowbar","object",0.03},
			{"WeaponHolder_ItemHatchet","object",0.03},
			{"MeleeBaseBallBat","weapon",0.03},
			{"Makarov","weapon",0.02},
			{"MakarovSD","weapon",0.02},
			{"M9SD","weapon",0.02},
			{"M9","weapon",0.02},
			{"revolver_EP1","weapon",0.02},
			{"Colt1911","weapon",0.02},
		//rifles
			{"Crossbow_DZ","weapon",0.03},
			{"LeeEnfield","weapon",0.03},
			{"Winchester1866","weapon",0.03},
			{"MR43","weapon",0.04},
		//skins
			{"Skin_Sniper1_DZ","magazine",0.01},
		//special
			{"WeaponHolder_ItemTent","object",0.01},
			{"ItemSandbag","magazine",0.01},
		//mags special
			{"PartWoodPile","magazine",0.04},
		//bags
			{"DZ_Patrol_Pack_EP1","object",0.06},
			{"DZ_Assault_Pack_EP1","object",0.04},
			{"DZ_ALICE_Pack_EP1","object",0.04},
		//multiple spawns	
			{"","trash",0.50},
			{"","Residential",0.40},
			{"","generic",0.30}
		};
	};
	class Industrial: Default { //254
		zombieChance = 0.2;
		zombieClass[] = {"z_worker1","z_worker2","z_worker3","z_new_worker2","z_new_worker3","z_new_worker4"};
		maxRoaming = 2;
		lootChance = 0.5;
		lootPos[] = {};
		lootType[] = {
		//one spawn
		//tools
			{"ItemKnife","weapon",0.04},
			{"ItemToolbox","weapon",0.06},
			{"ItemFlashlight","weapon",0.02},
			{"ItemEtool","weapon",0.03},
		//weapons
			{"MeleeMachete","weapon",0.03},
			{"WeaponHolder_ItemCrowbar","object",0.08},
			{"WeaponHolder_ItemHatchet","object",0.05},
			{"Crossbow_DZ","weapon",0.02},
		//special
			{"WeaponHolder_PartGeneric","object",0.06},
			{"WeaponHolder_PartWheel","object",0.07},
			{"WeaponHolder_PartFueltank","object",0.04},
			{"WeaponHolder_PartEngine","object",0.03},
			{"WeaponHolder_PartGlass","object",0.05},
			{"WeaponHolder_PartVRotor","object",0.04},
			{"WeaponHolder_ItemJerrycan","object",0.06},
			{"WeaponHolder_ItemFuelcan","object",0.06},
		//mags special
			{"ItemWire","magazine",0.03},
			{"ItemTankTrap","magazine",0.04},
			{"ItemSandbag","magazine",0.04},
		//bags
		//multiple spawns
			{"","trash",0.40},
			{"","Industrial",0.50},
			{"","generic",0.40}
		};
	};
	class Farm: Default {
		zombieChance = 0.2;
		maxRoaming = 3;
		zombieClass[] = {"zZombie_Base","z_hunter","z_hunter","z_hunter","z_villager1","z_villager2","z_villager3","z_new_villager2","z_new_villager3","z_new_villager4"};
		lootChance = 0.6;
		lootPos[] = {};
		lootType[] = {
		//tools
			{"ItemMatchbox","weapon",0.04},
			{"ItemKnife","weapon",0.03},			
			{"Binocular","weapon",0.02},
		//weapons
			{"WeaponHolder_ItemHatchet","object",0.05},
			{"Crossbow_DZ","weapon",0.03},
			{"Remington870_lamp","weapon",0.02},
			{"M1014","weapon",0.015},
			{"LeeEnfield","weapon",0.03},
			
		// rifles
			{"huntingrifle","weapon",0.01},
			{"LeeEnfield","weapon",0.03},
			{"Winchester1866","weapon",0.03},
			{"MR43","weapon",0.05},
			{"MeleeMachete","weapon",0.04},
		//skins
			{"Skin_Sniper1_DZ","magazine",0.01},
		//special
			{"WeaponHolder_ItemJerrycan","object",0.03},
		//mags special
			{"TrapBear","magazine",0.04},
			{"PartWoodPile","magazine",0.06},
		//multiple spawns	
			{"","trash",0.35},
			{"","Farm",0.40},
			{"","generic",0.40}
		};
	};
	class Supermarket: Default {
		lootChance = 0.7;
		minRoaming = 2;
		maxRoaming = 6;
		zombieChance = 0.3;
		zombieClass[] = {"zZombie_Base","zZombie_Base","z_teacher","z_suit1","z_suit2","z_new_villager2","z_new_villager3","z_new_villager4"};
		lootType[] = {
		//tools
			{"ItemMatchbox","weapon",0.04},
			{"ItemKnife","weapon",0.04},
			{"ItemCompass","weapon",0.04},
			{"ItemWatch","generic",0.05},
			{"Binocular","weapon",0.03},
		//weapons
			{"MeleeMachete","weapon",0.03},
			{"WeaponHolder_ItemCrowbar","object",0.03},
			{"WeaponHolder_ItemHatchet","object",0.03},
			{"MeleeBaseBallBat","weapon",0.03},
			{"Makarov","weapon",0.02},
			{"MakarovSD","weapon",0.02},
			{"M9SD","weapon",0.02},
			{"M9","weapon",0.02},
			{"revolver_EP1","weapon",0.02},
			{"Colt1911","weapon",0.02},
			{"glock17_EP1","weapon",0.02},
		//rifles
			{"Crossbow_DZ","weapon",0.03},
		//skins
			{"Skin_Sniper1_DZ","magazine",0.01},
			{"Skin_Camo1_DZ","magazine",0.01},
		//special
			{"WeaponHolder_ItemTent","object",0.015},
			{"ItemSandbag","magazine",0.015},
		//mags special
			{"PartWoodPile","magazine",0.04},
		//bags
			{"DZ_Patrol_Pack_EP1","object",0.06},
			{"DZ_Assault_Pack_EP1","object",0.04},
			{"DZ_ALICE_Pack_EP1","object",0.04},
			{"FoodBox0","object",0.04},
		//multiple spawns
			{"","medical",0.06},
			{"","trash",0.50},
			{"","food",0.05},
			{"","Supermarket",0.60},
			{"","generic",0.30}
		};
	};	
	class Office: Residential {
		maxRoaming = 3;
		lootChance = 0.7;
		zombieClass[] = {"z_suit1","z_suit2"};
		lootType[] = {
		//tools
			{"ItemMatchbox","weapon",0.04},
			{"ItemKnife","weapon",0.04},
			{"ItemCompass","weapon",0.04},
			{"ItemWatch","generic",0.05},
			{"Binocular","weapon",0.04},
		//weapons
			{"MeleeMachete","weapon",0.03},
			{"WeaponHolder_ItemCrowbar","object",0.03},
			{"WeaponHolder_ItemHatchet","object",0.03},
			{"MeleeBaseBallBat","weapon",0.03},
			{"Makarov","weapon",0.02},
			{"MakarovSD","weapon",0.02},
			{"M9SD","weapon",0.02},
			{"M9","weapon",0.02},
			{"revolver_EP1","weapon",0.02},
			{"Colt1911","weapon",0.02},
		//rifles
			{"Crossbow_DZ","weapon",0.03},
			{"LeeEnfield","weapon",0.03},
			{"Winchester1866","weapon",0.03},
			{"MR43","weapon",0.04},
		//skins
			{"Skin_Sniper1_DZ","magazine",0.02},
			{"Skin_Camo1_DZ","magazine",0.02},
		//special
			{"WeaponHolder_ItemTent","object",0.01},
			{"ItemSandbag","magazine",0.01},
		//mags special
			{"PartWoodPile","magazine",0.04},
		//bags
			{"DZ_Patrol_Pack_EP1","object",0.06},
			{"DZ_Assault_Pack_EP1","object",0.04},
			{"DZ_ALICE_Pack_EP1","object",0.04},
		//multiple spawns
			{"","trash",0.30},
			{"","Residential",0.50},
			{"","generic",0.30}
		};
	};
	class Hospital: Default {
		zombieChance = 0.5;
		minRoaming = 2;
		maxRoaming = 6;
		zombieClass[] = {"z_doctor","z_doctor","z_doctor"};
		lootChance = 0.7;
		lootPos[] = {};
		lootType[] = {
		//special
			{"MedBox0","object",0.05},
			{"MedBox1","object",0.10},
		//multiple spawns
			{"","trash",0.40},
			{"","hospital",0.70}
		};
	};
	class Military: Default {
		zombieChance = 0.4;
		maxRoaming = 6;
		zombieClass[] = {"z_soldier","z_soldier_heavy","z_policeman","z_new_worker2","z_new_worker3","z_new_worker4"};
		lootChance = 0.6;
		lootPos[] = {};
		lootType[] = {
		//one spawn
		//tools
			{"Binocular","weapon",0.05},
			{"Binocular_Vector","military",0.03},
			{"ItemFlashlightRed","generic",0.06},
			{"ItemKnife","generic",0.06},
			{"ItemGPS","weapon",0.01},
			{"ItemEtool","weapon",0.03},
			{"ItemRadio","weapon",0.05},
			{"NVGoggles","weapon",0.03},
		//pistols
			{"glock17_EP1","weapon",0.025},
			{"Makarov","weapon",0.02},
			{"MakarovSD","weapon",0.02},
			{"M9SD","weapon",0.02},
			{"M9","weapon",0.02},
			{"UZI_EP1","weapon",0.02},	
		//rifles
			{"Remington870_lamp","weapon",0.02},
			{"bizon","weapon",0.02},
			{"bizon_silenced","weapon",0.02},
			{"MP5A5","weapon",0.02},
			{"MP5SD","weapon",0.01},
			{"M4SPR","weapon",0.02},
			{"M4A1_RCO_GL","weapon",0.02},
			{"M4A1_HWS_GL_SD_Camo","weapon",0.02},
			{"AK_107_GL_kobra","weapon",0.02},
			{"AK_107_kobra","weapon",0.02},
			{"AK_107_pso","weapon",0.02},
			{"BAF_L85A2_RIS_Holo","weapon",0.02},
			{"Sa61_EP1","weapon",0.015},
			{"G36C","weapon",0.015},
			{"G36a","weapon",0.015},
			{"G36K","weapon",0.015},
			{"Sa58P_EP1","weapon",0.015},
			{"Sa58V_EP1","weapon",0.015},
			{"Sa58V_RCO_EP1","weapon",0.015},
			{"Sa58V_CCO_EP1","weapon",0.015},
			{"M16A2","weapon",0.015},
			{"M16A2GL","weapon",0.015},
			{"AK_74","weapon",0.015},
			{"M4A1_Aim","weapon",0.015},
			{"AKS_74_kobra","weapon",0.015},
			{"AKS_74_U","weapon",0.015},
			{"AK_47_M","weapon",0.015},
			{"M1014","weapon",0.015},
			{"M4A1","weapon",0.005},
			{"M14_EP1","weapon",0.005},
			{"FN_FAL","weapon",0.01},
			{"PK","weapon",0.01},
			{"FN_FAL_ANPVS4","weapon",0.015},
			{"M4A1_AIM_SD_camo","weapon",0.015},
			{"M16A4_ACG","weapon",0.02},
			{"M4A1_HWS_GL_camo","weapon",0.015},
			{"M4A3_CCO_EP1","weapon",0.02},
		//skins
			{"Skin_Sniper1_DZ","magazine",0.015},
			{"Skin_Camo1_DZ","magazine",0.015},
			{"Skin_Soldier1_DZ","magazine",0.015},
		//mags special
			{"WeaponHolder_ItemCamoNet","object",0.04},
			{"PipeBomb","magazine",0.03},
			{"ItemSandbag","magazine",0.02},
			{"AmmoBoxSmall_556","object",0.02},
			{"AmmoBoxSmall_762","object",0.02},
		//bags
			{"DZ_ALICE_Pack_EP1","object",0.05},
			{"DZ_British_ACU","object",0.04}, 
			{"DZ_Backpack_EP1","object",0.03},
			{"DZ_CivilBackpack_EP1","object",0.03}, 		
		//multiple spawns
			{"","medical",0.08},
			{"","trash",0.60},
			{"","military",0.90},
			{"","generic",0.60}
		};
	};
	class MilitarySpecial: Default {
		zombieChance = 0.7;
		minRoaming = 2;
		maxRoaming = 6;
		zombieClass[] = {"z_soldier_heavy","z_new_worker2","z_new_worker3","z_new_worker4"};
		lootChance = 0.7;
		lootPos[] = {};
		lootType[] = {
		//one spawn
		//tools
			{"Binocular","weapon",0.03},
			{"ItemFlashlightRed","generic",0.05},
			{"ItemKnife","generic",0.05},
			{"ItemGPS","weapon",0.01},
			{"Binocular_Vector","generic",0.01},
		//pistols
			{"glock17_EP1","weapon",0.03},
			{"UZI_EP1","weapon",0.03},
		//rifles
			{"bizon","weapon",0.02},
			{"bizon_silenced","weapon",0.02},
			{"PK","weapon",0.01},
			{"M4A1_RCO_GL","weapon",0.02},
			{"M4SPR","weapon",0.02},
			{"M4A1_RCO_GL","weapon",0.02},
			{"M4A1_HWS_GL_SD_Camo","weapon",0.02},
			{"AK_107_GL_kobra","weapon",0.02},
			{"AK_107_kobra","weapon",0.02},
			{"AK_107_pso","weapon",0.02},
			{"RPK_74","weapon",0.02},
			{"BAF_L85A2_RIS_Holo","weapon",0.02},
			{"Sa61_EP1","weapon",0.02},
			{"SVD_des_EP1","weapon",0.015},
			{"FN_FAL","weapon",0.025},
			{"FN_FAL_ANPVS4","weapon",0.02},
			{"G36C_camo","weapon",0.015},
			{"G36A_camo","weapon",0.015},
			{"G36K_camo","weapon",0.02},
			{"G36C","weapon",0.015},
			{"G36a","weapon",0.015},
			{"G36K","weapon",0.015},
			{"m240_scoped_EP1","weapon",0.01},
			{"M60A4_EP1","weapon",0.01},
			{"Sa58P_EP1","weapon",0.025},
			{"Sa58V_EP1","weapon",0.025},
			{"Sa58V_RCO_EP1","weapon",0.015},
			{"Sa58V_CCO_EP1","weapon",0.015},
			{"M16A2","weapon",0.02},
			{"M16A2GL","weapon",0.02},
			{"M249_DZ","weapon",0.02},
			{"AK_74","weapon",0.025},
			{"M4A1_Aim","weapon",0.025},
			{"AKS_74_kobra","weapon",0.03},
			{"AKS_74_U","weapon",0.03},
			{"AK_47_M","weapon",0.03},
			{"M24","weapon",0.015},
			{"M24_des_EP1","weapon",0.015},
			{"SVD","weapon",0.015},
			{"SVD_CAMO_DZ","weapon",0.01},
			{"SVD_NSPU_EP1","weapon",0.01},
			{"SVD_des_EP1","weapon",0.01},
			{"M1014","weapon",0.03},
			{"DMR","weapon",0.01},
			{"M4A1","weapon",0.03},
			{"M14_EP1","weapon",0.02},
			{"M40A3","weapon",0.015},
			{"M240_DZ","weapon",0.015},
			{"M4A1_AIM_SD_camo","weapon",0.02},
			{"M16A4_ACG","weapon",0.03},
			{"M4A1_HWS_GL_camo","weapon",0.025},
			{"Mk_48_DZ","weapon",0.01},
			{"M4A3_CCO_EP1","weapon",0.02},
		//special
			{"ItemSandbag","magazine",0.02},
			{"AmmoBoxSmall_556","object",0.04},
			{"AmmoBoxSmall_762","object",0.03},
			{"WeaponHolder_ItemCamoNet","object",0.03},
		//mags special
			{"PipeBomb","magazine",0.03},
		//bags
			{"DZ_ALICE_Pack_EP1","object",0.05},
			{"DZ_British_ACU","object",0.04}, 
			{"DZ_CivilBackpack_EP1","object",0.03}, // 24
			{"DZ_Backpack_EP1","object",0.03}, // 24
		//skins
			{"Skin_Sniper1_DZ","magazine",0.02},
			{"Skin_Camo1_DZ","magazine",0.02},
			{"Skin_Soldier1_DZ","magazine",0.02},
		//multiple spawns
			{"","medical",0.10},
			{"","trash",0.60},
			{"","military",0.90},
			{"","generic",0.50}
		};
	};
	class Hunting: Default {
		zombieChance = 0.6;
		minRoaming = 1;
		maxRoaming = 3;
		zombieClass[] = {"z_hunter","z_hunter","z_hunter"};
		lootChance = 0.8;
		lootPos[] = {};
		lootType[] = {
		//one spawn
		//tools
			{"ItemFlashlight","generic",0.06},
			{"ItemKnife","generic",0.05},
			{"ItemMatchbox","generic",0.07},
		//weapons
			{"Crossbow_DZ","weapon",0.04},
			{"MeleeMachete","weapon",0.04},
			{"huntingrifle","weapon",0.05},
			{"MR43","weapon",0.08}, 			
			{"Winchester1866","weapon",0.06},		
		//special
			{"WeaponHolder_ItemTent","object",0.02},
		//mags special
			{"TrapBear","magazine",0.01},
		//bags
			{"DZ_British_ACU","object",0.04}, 
			{"DZ_Backpack_EP1","object",0.02},
			{"DZ_CivilBackpack_EP1","object",0.02}, 	
		//multiple spawns
			{"","trash",0.30},
			{"","hunter",0.10},
			{"","generic",0.50}
		};
	};
#include "CfgBuildingPos.hpp"
};
