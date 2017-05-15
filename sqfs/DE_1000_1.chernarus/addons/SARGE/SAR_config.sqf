
SAR_DEBUGMONITOR= false;

// maximum number of groups / grid
SAR_max_grps_bandits = 0;
SAR_max_grps_soldiers = 1;
SAR_max_grps_survivors = 1;

// chance for a group to spawn (1-100)
SAR_chance_bandits = 75;
SAR_chance_soldiers = 30;
SAR_chance_survivors = 50;

// maximum size of group (including Leader)
SAR_max_grpsize_bandits = 4;
SAR_max_grpsize_soldiers = 5;
SAR_max_grpsize_survivors = 4;


SAR_FIX_VEHICLE_ISSUE = false;


// disable UPSMON AI behaviour - this means there will be no evasive/flanking, AI WILL follow players around the map outside of grids etc. EXPERIMENTAL
SAR_AI_disable_UPSMON_AI = false;

// enable / disable AI stealing vehicles - if you enable this, be sure to check KRON_UPS_searchVehicledist value below
SAR_AI_STEAL_VEHICLE = false;

// -----------------------------------------------
// Humanity values 
// -----------------------------------------------

// Humanity Value that gets substracted for a survivor or soldier AI kill
SAR_surv_kill_value = 0;

// Humanity Value that gets ADDED for a bandit AI kill
SAR_band_kill_value = 0;

// the humanity value below which a player will be considered hostile
SAR_HUMANITY_HOSTILE_LIMIT = 0;

// Log AI kills
SAR_log_AI_kills = true;

// Send AI kills to sidechat
SAR_KILL_MSG = false;

// Enable / disable AI xp system
SAR_AI_XP_SYSTEM = false;

// xp needed to reach this level
SAR_AI_XP_LVL_1 = 0;
// name of the level range
SAR_AI_XP_NAME_1 = "Rookie";
// armor specific for this level
SAR_AI_XP_ARMOR_1 = 0.5;        // values: 0.1 - 1, 1 = no change, 0.5 = damage taken reduced by 50%, 0.1 = damage taken reduced by 90%

// xp needed to reach this level
SAR_AI_XP_LVL_2 = 1;
// name of the level range
SAR_AI_XP_NAME_2 = "Veteran";
// armor specific for this level
SAR_AI_XP_ARMOR_2 = 0.5;        // values: 0.1 - 1, 1 = no change, 0.5 = damage taken reduced by 50%, 0.1 = damage taken reduced by 90% 

// xp needed to reach this level
SAR_AI_XP_LVL_3 = 2;
// name of the level range
SAR_AI_XP_NAME_3 = "Legendary";
// armor specific for this level
SAR_AI_XP_ARMOR_3 = 0.5;        // values: 0 - 1, 1 = no change, 0.5 = damage taken reduced by 50%, 0.1 = damage taken reduced by 90% 


// values: 0.1 - 1, 1 = no change, 0.5 = damage taken reduced by 50%, 0.1 = damage taken reduced by 90% -  EXPERIMENTAL
SAR_leader_health_factor = 0.5;

// enable this for near invincible helicopters 
SAR_heli_shield = false;

SAR_dynamic_group_respawn = false;

// time after which AI are respawned if configured (can be overwritten in the static AI calls)
SAR_respawn_waittime = 90; // default 30 seconds


// time after which DYNAMIC units and groups despawn after players have left the area/ dynamic grid
SAR_DESPAWN_TIMEOUT = 120; // 2 minutes

// time after which dead AI bodies are deleted 
SAR_DELETE_TIMEOUT = 5; // 2 minutes

// the max range in meters within AI is detecting Zombies and player bandits and makes them hostile - the bigger this value, the more CPU needed
SAR_DETECT_HOSTILE = 200;

// the max range in meters within AI is detecting player bandits from a vehicle, e.g. heli or land vehicle and makes them hostile - the bigger this value, the more CPU needed
SAR_DETECT_HOSTILE_FROM_VEHICLE = 500;

// the interval in seconds that an AI scans for new hostiles. The lower this value, the more accurate, but your server will see an impact. Recommended value: 15 
SAR_DETECT_INTERVAL = 15;

// the interval in seconds that an AI scans for new hostiles from WITHIN a vehicle. The lower this value, the more accurate, but your server will see an impact. Recommended value: 5 
SAR_DETECT_FROM_VEHICLE_INTERVAL = 5;

// the interval in seconds after that AI and AI in vehicles get new ammo and new fuel if needed
SAR_REAMMO_INTERVAL = 30;

// Show AI hits and kills by players in the rpt
SAR_HITKILL_DEBUG = false;

// Shows extra debug info in .rpt
SAR_DEBUG = false;

// careful with setting this, this shows a LOT, including the grid properties and definitions for every spawn and despawn event
SAR_EXTREME_DEBUG = false;

//
// SET THIS TO 0 to hide the group markers on the map and see the UPSMON group debug messages
// Possible values: 1 = enabled, 0 = disabled
KRON_UPS_Debug = 0;

//
// SET THIS TO 1 to see waypoints and pathfinding information in your rpt
// Possible values: 1 = enabled, 0 = disabled

KRON_UPS_WP_Debug = 0;

//
// SET THIS TO 1 to enable AI debugging in the rpt. You will be able to debug targets / enemy handling
// Possible values: 1 = enabled, 0 = disabled
KRON_UPS_AI_Debug = 0;


// Show AI ingame markers to see their xplevel, and logs to the rpt 
SAR_SHOW_XP_LVL = false;


//Efective distance for doing perfect ambush (max distance is this x2)
KRON_UPS_ambushdist = 100;

//Frequency for doing calculations for each squad.
KRON_UPS_Cycle = 30; //org 20 , try to adjust for server performance

//Time that leader waits until doing another movement, this time reduced dynamically under fire, and on new targets
KRON_UPS_react = 60;

//Min time to wait for doing another reaction
KRON_UPS_minreact = 40; // org 30

//Max waiting is the maximum time patrol groups will wait when arrived to target for doing another target.
KRON_UPS_maxwaiting = 60;

//Max waiting is the maximum time infantry patrol groups will wait when arrived at a waypoint before moving to the next waypoint. Air and land vehicles will move instantly to a new one.
KRON_UPS_wp_maxwaiting = 120;

// how long AI units should be in alert mode after initially spotting an enemy
KRON_UPS_alerttime = 300;

// how close unit has to be to target to generate a new one target or to enter stealth mode
KRON_UPS_closeenough = 100; // if you have vast plain areas, increase this to sth around 150-300 

// if you are spotted by AI group, how close the other AI group have to be to You , to be informed about your present position. over this, will lose target
KRON_UPS_sharedist = 300;

// If enabled IA communication between them with radio defined sharedist distance, 0/2 
// (must be set to 2 in order to use reinforcement !R)
KRON_UPS_comradio = 0;

// Distance from destination for searching vehicles. (Search area is about 200m), 
// If your destination point is further than KRON_UPS_searchVehicledist, AI will try to find a vehicle to go there.
KRON_UPS_searchVehicledist = 600; // 700, 900  

//Sides that are enemies of resistance // DO NOT CHANGE THIS
KRON_UPS_Res_enemy = [east];

R_knowsAboutEnemy = 0.4;

// military AI
SAR_leader_sold_list = ["Bandit1_DZ"];
SAR_sniper_sold_list = ["Bandit1_DZ"];
SAR_soldier_sold_list = ["Bandit1_DZ"];


// bandit AI
SAR_leader_band_list = ["BAF_Soldier_Officer_MTP", "BAF_Soldier_Officer_DDPM"];
SAR_sniper_band_list = ["BAF_Soldier_Sniper_MTP","BAF_Soldier_SniperH_MTP","BAF_Soldier_SniperN_MTP"]; 
SAR_soldier_band_list = ["BAF_Soldier_MTP","BAF_Soldier_DDPM","BAF_Soldier_L_MTP","BAF_Soldier_L_DDPM"];

// survivor AI
SAR_leader_surv_list = ["Survivor2_DZ","SurvivorW2_DZ","Villager1", "Citizen3", "Worker1", "Survivor3_DZ"]; // the potential classes of the leaders of a survivor group
SAR_sniper_surv_list = ["Survivor2_DZ","SurvivorW2_DZ","Villager1", "Citizen3", "Worker1", "Survivor3_DZ"]; // the potential classes of the snipers of a survivor group
SAR_soldier_surv_list = ["Survivor2_DZ","SurvivorW2_DZ","Villager1", "Citizen3", "Worker1", "Survivor3_DZ"]; // the potential classes of the riflemen of a soldier group





// Leader
SAR_leader_sold_skills = [

    ["aimingAccuracy",0.35, 0.10], // skilltype, <min value>, <random value added to min>;
    ["aimingShake",   0.35, 0.10],
    ["aimingSpeed",   0.80, 0.20],
    ["spotDistance",  0.70, 0.30],
    ["spotTime",      0.65, 0.20],
    ["endurance",     0.80, 0.20],
    ["courage",       0.80, 0.20],
    ["reloadSpeed",   0.80, 0.20],
    ["commanding",    0.80, 0.20],
    ["general",       0.80, 0.20]

];

// rifleman
SAR_soldier_sold_skills  = [

    ["aimingAccuracy",0.25, 0.10], // skilltype, <min value>, <random value added to min>;
    ["aimingShake",   0.25, 0.10],
    ["aimingSpeed",   0.70, 0.20],
    ["spotDistance",  0.55, 0.30],
    ["spotTime",      0.30, 0.20],
    ["endurance",     0.60, 0.20],
    ["courage",       0.60, 0.20],
    ["reloadSpeed",   0.60, 0.20],
    ["commanding",    0.60, 0.20],
    ["general",       0.60, 0.20]

];

// Sniper
SAR_sniper_sold_skills = [

    ["aimingAccuracy",0.80, 0.10], // skilltype, <min value>, <random value added to min>;
    ["aimingShake",   0.90, 0.10],
    ["aimingSpeed",   0.70, 0.20],
    ["spotDistance",  0.70, 0.30],
    ["spotTime",      0.75, 0.20],
    ["endurance",     0.70, 0.20],
    ["courage",       0.70, 0.20],
    ["reloadSpeed",   0.70, 0.20],
    ["commanding",    0.70, 0.20],
    ["general",       0.70, 0.20]

];


// Leader
SAR_leader_band_skills = [

    ["aimingAccuracy",0.80, 0.20], // skilltype, <min value>, <random value added to min>;
    ["aimingShake",   0.80, 0.20],
    ["aimingSpeed",   0.80, 0.20],
    ["spotDistance",  0.99, 0.00],
    ["spotTime",      0.99, 0.00],
    ["endurance",     0.80, 0.20],
    ["courage",       0.80, 0.20],
    ["reloadSpeed",   0.80, 0.20],
    ["commanding",    0.80, 0.20],
    ["general",       0.80, 0.20]

];
// Rifleman
SAR_soldier_band_skills = [

    ["aimingAccuracy",0.80, 0.20], // skilltype, <min value>, <random value added to min>;
    ["aimingShake",   0.80, 0.20],
    ["aimingSpeed",   0.80, 0.20],
    ["spotDistance",  0.80, 0.20],
    ["spotTime",      0.80, 0.20],
    ["endurance",     0.80, 0.20],
    ["courage",       0.80, 0.20],
    ["reloadSpeed",   0.80, 0.20],
    ["commanding",    0.80, 0.20],
    ["general",       0.80, 0.20]

];
// Sniper
SAR_sniper_band_skills = [

    ["aimingAccuracy",0.90, 0.10], // skilltype, <min value>, <random value added to min>;
    ["aimingShake",   0.90, 0.10],
    ["aimingSpeed",   0.90, 0.10],
    ["spotDistance",  0.99, 0.00],
    ["spotTime",      0.99, 0.00],
    ["endurance",     0.90, 0.10],
    ["courage",       0.90, 0.10],
    ["reloadSpeed",   0.90, 0.10],
    ["commanding",    0.90, 0.10],
    ["general",       0.90, 0.10]

];

// Leader
SAR_leader_surv_skills = [

    ["aimingAccuracy",0.35, 0.10], // skilltype, <min value>, <random value added to min>;
    ["aimingShake",   0.35, 0.10],
    ["aimingSpeed",   0.60, 0.20],
    ["spotDistance",  0.40, 0.30],
    ["spotTime",      0.45, 0.20],
    ["endurance",     0.40, 0.20],
    ["courage",       0.50, 0.20],
    ["reloadSpeed",   0.60, 0.20],
    ["commanding",    0.50, 0.20],
    ["general",       0.50, 0.20]

];
// Rifleman
SAR_soldier_surv_skills = [

    ["aimingAccuracy",0.15, 0.10], // skilltype, <min value>, <random value added to min>;
    ["aimingShake",   0.15, 0.10],
    ["aimingSpeed",   0.60, 0.20],
    ["spotDistance",  0.45, 0.30],
    ["spotTime",      0.20, 0.20],
    ["endurance",     0.40, 0.20],
    ["courage",       0.40, 0.20],
    ["reloadSpeed",   0.40, 0.20],
    ["commanding",    0.40, 0.20],
    ["general",       0.40, 0.20]

];
// Sniper
SAR_sniper_surv_skills = [

    ["aimingAccuracy",0.70, 0.10], // skilltype, <min value>, <random value added to min>;
    ["aimingShake",   0.80, 0.10],
    ["aimingSpeed",   0.70, 0.20],
    ["spotDistance",  0.70, 0.30],
    ["spotTime",      0.65, 0.20],
    ["endurance",     0.70, 0.20],
    ["courage",       0.70, 0.20],
    ["reloadSpeed",   0.70, 0.20],
    ["commanding",    0.50, 0.20],
    ["general",       0.60, 0.20]

];

// military

// potential weapon list for leaders
SAR_sold_leader_weapon_list = ["M4A1","M4A3_CCO_EP1","AK_47_M"];
SAR_sold_leader_pistol_list = [];   

// potential item list for leaders -> Item / Chance 1 - 100
SAR_sold_leader_items = [["ItemSodaCoke",75],["FoodCanBakedBeans",60]];
SAR_sold_leader_tools =  [["ItemMap",50],["ItemCompass",30],["Binocular_Vector",5],["NVGoggles",5],["ItemRadio",100]];

//potential weapon list for riflemen
SAR_sold_rifleman_weapon_list = ["M16A2","Winchester1866","AK_74","LeeEnfield","M1014"];
SAR_sold_rifleman_pistol_list = [];    

// potential item list for riflemen
SAR_sold_rifleman_items = [["ItemSodaCoke",75],["FoodCanBakedBeans",60]];
SAR_sold_rifleman_tools = [["ItemMap",50],["ItemCompass",30]];

//potential weapon list for snipers
SAR_sold_sniper_weapon_list = ["M4A1_Aim","SVD_CAMO","Huntingrifle"];
SAR_sold_sniper_pistol_list = [];   

// potential item list for snipers
SAR_sold_sniper_items = [["ItemSodaCoke",75],["FoodCanBakedBeans",60],["Skin_Sniper1_DZ",10]];
SAR_sold_sniper_tools = [["ItemMap",50],["ItemCompass",30]];

//
// survivors
//

// potential weapon list for leaders
SAR_surv_leader_weapon_list = ["M4A1","M4A3_CCO_EP1","AK_47_M"];
SAR_surv_leader_pistol_list = [];   

// potential item list for leaders -> Item / Chance 1 - 100
SAR_surv_leader_items = [["ItemSodaCoke",75],["FoodCanBakedBeans",60]];
SAR_surv_leader_tools =  [["ItemMap",50],["ItemCompass",30],["Binocular_Vector",5],["NVGoggles",5],["ItemRadio",100]];

//potential weapon list for riflemen
SAR_surv_rifleman_weapon_list = ["M16A2","Winchester1866","AK_74","LeeEnfield","M1014"];
SAR_surv_rifleman_pistol_list = [];    

// potential item list for riflemen
SAR_surv_rifleman_items = [["ItemSodaCoke",75],["FoodCanBakedBeans",60]];
SAR_surv_rifleman_tools = [["ItemMap",50],["ItemCompass",30]];

//potential weapon list for snipers
SAR_surv_sniper_weapon_list = ["M4A1_Aim","SVD_CAMO","Huntingrifle"];
SAR_surv_sniper_pistol_list = [];   

// potential item list for snipers
SAR_surv_sniper_items = [["ItemSodaCoke",75],["FoodCanBakedBeans",60],["Skin_Sniper1_DZ",10]];
SAR_surv_sniper_tools = [["ItemMap",50],["ItemCompass",30]];

//
// bandits
//

// potential weapon list for leaders
SAR_band_leader_weapon_list = ["M60A4_EP1","m240_scoped_EP1","Sa58V_CCO_EP1","Sa58V_RCO_EP1","M240_DZ","M249_DZ","Mk_48_DZ","FN_FAL","M4A1_HWS_GL_SD_Camo","M4A1_HWS_GL","M4A1_HWS_GL_camo","G36K","G36a","M4A1_AIM_SD_camo","G36C_camo","G36K_camo"];
SAR_band_leader_pistol_list = [];  // do NOT populate, Arma still has a bug that renders AI unresponsive after switching to the sidearm

// potential item list for leaders -> Item / Chance 1 - 100
SAR_band_leader_items = [["ItemSodaCoke",1]];
SAR_band_leader_tools = [["ItemGPS",1],["ItemRadio",100]];

//potential weapon list for riflemen
SAR_band_rifleman_weapon_list = ["M60A4_EP1","m240_scoped_EP1","Sa58V_CCO_EP1","Sa58V_RCO_EP1","M240_DZ","M249_DZ","Mk_48_DZ","FN_FAL","M4A1_HWS_GL_SD_Camo","M4A1_HWS_GL","M4A1_HWS_GL_camo","G36K","G36a","M4A1_AIM_SD_camo","G36C_camo","G36K_camo"];
SAR_band_rifleman_pistol_list = [];   // do NOT populate, Arma still has a bug that renders AI unresponsive after switching to the sidearm

// potential item list for riflemen
SAR_band_rifleman_items = [["ItemSodaCoke",1]];
SAR_band_rifleman_tools = [["ItemGPS",1],["ItemRadio",100]];

//potential weapon list for snipers
SAR_band_sniper_weapon_list = ["SVD_CAMO","SVD_des_EP1","M40A3","M24_des_EP1","DMR"];
SAR_band_sniper_pistol_list = [];  // do NOT populate, Arma still has a bug that renders AI unresponsive after switching to the sidearm

// potential item list for snipers
SAR_band_sniper_items = [["ItemSodaCoke",1]];
SAR_band_sniper_tools = [["ItemGPS",1],["ItemRadio",100]];


// define the type of heli(s) you want to use here for the heli patrols - make sure you include helis that have minimum 2 gunner positions, anything else might fail
SAR_heli_type=["UH1H_DZ","Mi17_DZ"];
//SAR_heli_type=["UH1H_DZ"];