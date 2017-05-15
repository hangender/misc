



levelthree = ["86473862","30119622"];
leveltwo = ["41779462","5355522","6005826","4714434"];
levelone = [];
donatorarr	= [];
_myscripts = false;


diag_log ("DamiModz: Admin tool loading...");
PVOZ_AdminTArray =
{
if ((isNil "inSub")||(isNil "Level3_menu")||(isNil "Level2_menu")||(isNil "Level1_menu")) then
{
waitUntil {!isNull (findDisplay 46)};
inSub = false;
getControl = {(findDisplay 3030) displayCtrl _this;};
if (isNil "admin_toggled") then {admin_toggled = [];};
if (isNil "AM_EPOCH") then {AM_EPOCH = false;};
Level3_menu =
{
adminadd = adminadd + [" _________________________________________________________","","0","1","0","0"		,[]];
adminadd = adminadd + [" _________________________________________________________","","0","1","0","0"		,[]];
adminadd = adminadd + [" ________________________ HOTKEYS ________________________","","0","1","0","0"		,[]];
adminadd = adminadd + [" NOTE: Double click players to quick spectate.","","0","1","0","0"					,[]];
adminadd = adminadd + [" NOTE: F2 to heal close players     F3 to open weapon menu","","0","1","0","0"		,[]];
adminadd = adminadd + [" NOTE: F4 to delete target        F5 to EXIT spectating","","0","1","0","0"			,[]];
adminadd = adminadd + [" NOTE: 1 to flip vehicle         2 to repair vehicle","","0","1","0","0"			,[]];
if (AM_EPOCH) then {
adminadd = adminadd + [" NOTE: 3 to get password of cursorTarget ","","0","1","0","0" 					,[]];
adminadd = adminadd + [" NOTE: 4 to spawn key of cursorTarget(vehicle) ","","0","1","0","0" 			,[]];
adminadd = adminadd + [" NOTE: 5 to steal cursorTarget(vehicle) ","","0","1","0","0" 					,[]];
} else {
adminadd = adminadd + [" NOTE: 3 to steal cursorTarget(vehicle) ","","0","1","0","0" 					,[]];
};
adminadd = adminadd + [" ________________________ HOTKEYS ________________________","","0","1","0","0"		,[]];
adminadd = adminadd + [" _________________________________________________________","","0","1","0","0"		,[]];
adminadd = adminadd + [" _________________________________________________________","","0","1","0","0"		,[]];
adminadd = adminadd + [" Server Scripts ","","0","1","0","0"									,[]];
adminadd = adminadd + [" __________________________________","","0","1","0","0"					,[]];
adminadd = adminadd + ["     Broadcast Message",adminmsg,"0","0","0","0"						,[]];
adminadd = adminadd + ["     Message Target",adminmsg_target,"0","0","0","1"					,[]];


adminadd = adminadd + ["     Delete/kill all zombies",del_zombies,"0","0","0","0"				,[]];
adminadd = adminadd + [" __________________________________","","0","1","0","0"					,[]];
adminadd = adminadd + [" Spawn Scripts ","","0","1","0","0"										,[]];
adminadd = adminadd + [" __________________________________","","0","1","0","0"					,[]];
adminadd = adminadd + ["     Spawn Vehicle","Vehicles","0","0","1","0"							,[]];
if (AM_EPOCH) then {
adminadd = adminadd + ["     Spawn Vehicle (hive)","VehiclesHIVE","0","0","1","0"							,[]];
};
adminadd = adminadd + ["     Spawn Buildings & Objects","Objects","0","0","1","0"				,[]];
adminadd = adminadd + ["     Spawn Weapons, Items & Magazines","Weaponz","0","0","1","0"					,[]];
adminadd = adminadd + ["     Spawn player Morph","Skinz","0","0","1","0"						,[]];
adminadd = adminadd + ["     Spawn Box",admincrate,"0","0","0","0"								,[0,0.8,0.76,1]];
if (AM_EPOCH) then {
adminadd = adminadd + ["     Spawn Box (EPOCH)",admincrate_epoch,"0","0","0","0"			,[0,0.8,0.76,1]];
adminadd = adminadd + ["     Spawn Box (EPOCH) No currency",admincrate_epoch_2,"0","0","0","0"			,[0,0.8,0.76,1]];
adminadd = adminadd + ["     Spawn Box (EPOCH) Skins only",admincrate_epoch_3,"0","0","0","0"			,[0,0.8,0.76,1]];
adminadd = adminadd + ["     Spawn Box (EPOCH) Food only",admincrate_epoch_4,"0","0","0","0"			,[0,0.8,0.76,1]];
};
adminadd = adminadd + [" __________________________________","","0","1","0","0"					,[]];
adminadd = adminadd + [" Toggleable Scripts ","","0","1","0","0"								,[]];
adminadd = adminadd + [" NOTE: ALT + Left Click Teleport","","0","1","0","0"					,[]];
adminadd = adminadd + [" __________________________________","","0","1","0","0"					,[]];
if (AM_EPOCH) then {
adminadd = adminadd + ["     Toggle Instant Build (Epoch)",admin_instantbd,"1","0","0","0"	,[]];
adminadd = adminadd + ["     Toggle No Building Restrictions (Epoch)",admin_norestrict,"1","0","0","0",[]];
};
adminadd = adminadd + ["     Toggle Teleport",TP_me_OK,"1","0","0","0"							,[]];
adminadd = adminadd + ["     Toggle ESP",admin_esplol,"1","0","0","0"							,[]];
adminadd = adminadd + ["     Toggle player Markers",adminpmark,"1","0","0","0"					,[]];
adminadd = adminadd + ["     Toggle dead Markers",adminDmarkers,"1","0","0","0"					,[]];
adminadd = adminadd + ["     Toggle vehicle Markers",adminmarkveh,"1","0","0","0"				,[]];
adminadd = adminadd + ["     Toggle Wreck Markers",adminwreck,"1","0","0","0"					,[]];
adminadd = adminadd + ["     Toggle Tent Markers",admintent,"1","0","0","0"						,[]];
adminadd = adminadd + ["     Toggle Map ICONS (bases, etc)",adminicons,"1","0","0","0"			,[]];
adminadd = adminadd + ["     Toggle God",admingod,"1","0","0","0"								,[]];
adminadd = adminadd + ["     Toggle Stealth",admininvis,"1","0","0","0"							,[]];
adminadd = adminadd + ["     Toggle Infinite ammo",inf_AMMO_k,"1","0","0","0"					,[]];
adminadd = adminadd + ["     Toggle no-recoil",no_RECOIL_k,"1","0","0","0"						,[]];
adminadd = adminadd + ["     Toggle zombie aggro",no_zAGGRO,"1","0","0","0"						,[]];
adminadd = adminadd + ["     Toggle zombie shield",z_shieldbrah,"1","0","0","0"					,[]];
adminadd = adminadd + ["     Toggle speed boost",adminVehicleSpeed,"1","0","0","0"				,[]];
adminadd = adminadd + ["     Toggle car godmode",adminVehicleGOD,"1","0","0","0"				,[]];
adminadd = adminadd + [" __________________________________","","0","1","0","0"					,[]];
adminadd = adminadd + [" Targeted Scripts ","","0","1","0","0"									,[]];
adminadd = adminadd + [" __________________________________","","0","1","0","0"					,[]];
adminadd = adminadd + ["     Spectate Target",adminspec,"0","0","0","1"							,[]];
adminadd = adminadd + ["     View gear Target",admin_spec_gear,"0","0","0","1"					,[]];
adminadd = adminadd + ["     Give ammo to Target",admin_givammo,"0","0","0","1"					,[]];
adminadd = adminadd + ["     Move to Target",admintele,"0","0","0","1"							,[]];
adminadd = adminadd + ["     Move Target to Me",admint2me,"0","0","0","1"						,[]];
adminadd = adminadd + ["     Heal Target",adminheal,"0","0","0","1"								,[]];
adminadd = adminadd + ["     Kill Target",adminkill,"0","0","0","1"								,[]];
adminadd = adminadd + ["     Slap Target",adminSlap,"0","0","0","1"								,[]];
adminadd = adminadd + ["     Break Target's Legs",adminbreakleg,"0","0","0","1"					,[]];
adminadd = adminadd + ["     RemoveGear Target",adminremovegear,"0","0","0","1"					,[]];
adminadd = adminadd + ["     Move target in passenger",manipulate_moveinveh,"0","0","0","1"		,[]];
adminadd = adminadd + ["     Join target's vehicle",manipulate_joinvehicle,"0","0","0","1"		,[]];
adminadd = adminadd + ["     Increase target's humanity",man_addhu,"0","0","0","1"				,[]];
adminadd = adminadd + ["     Decrease target's humanity",man_takehu,"0","0","0","1"				,[]];
adminadd = adminadd + [" ----Sub Menus----","","0","1","0","0"									,[]];
adminadd = adminadd + ["     Give gear target","GiveGear","0","0","1","0"						,[]];
adminadd = adminadd + ["     Animate target","AnimateTarget","0","0","1","0"					,[]];
adminadd = adminadd + ["     Manipulate target","ManipulateFeatures","0","0","1","0"			,[]];
adminadd = adminadd + [" __________________________________","","0","1","0","0"					,[]];
adminadd = adminadd + [" Miscellaneous ","","0","1","0","0"										,[]];
adminadd = adminadd + [" __________________________________","","0","1","0","0"					,[]];
adminadd = adminadd + ["     Repair close buildings.",repair_close,"0","0","0","0"				,[]];
adminadd = adminadd + ["     Repair close entities.",repair_centitiy,"0","0","0","0"			,[]];
adminadd = adminadd + ["     Open environment scroll menu",admin_wedar,"0","0","0","0"			,[]];
adminadd = adminadd + ["     Open ADV menu",admin_advmenu,"0","0","0","0"						,[]];
adminadd = adminadd + ["     Open OTF script writer",admin_writer,"0","0","0","0"				,[]];
adminadd = adminadd + ["     Unflip Vehicle",adminflip,"0","0","0","0"							,[]];
adminadd = adminadd + ["     Repair Vehicle",adminrepair,"0","0","0","0"						,[]];
adminadd = adminadd + ["     Force Disconnect (Self)",{endmission "LOSER";},"0","0","0","0"		,[]];
adminadd = adminadd + ["     Force Disconnect (Target)",adminFDisconnect,"0","0","0","1"		,[]];
adminadd = adminadd + [" ----Sub Menus----","","0","1","0","0"									,[]];
adminadd = adminadd + ["     Open color menu","ChangeColorsBro","0","0","1","0"					,[]];
adminadd = adminadd + [" __________________________________","","0","1","0","0"					,[]];
adminadd = adminadd + [" Weapon Scripts ","","0","1","0","0"									,[]];
adminadd = adminadd + [" __________________________________","","0","1","0","0"					,[]];
adminadd = adminadd + ["     Give M4"					,M4_load,"0","0","0","0"				,[]];
adminadd = adminadd + ["     Give M4 SD"				,M4SD_load,"0","0","0","0"				,[]];
adminadd = adminadd + ["     Delete gear"				,del_gearz,"0","0","0","0"				,[]];
adminadd = adminadd + ["     Give 3 mags"				,admin_ammo,"0","0","0","0"				,[]];
adminadd = adminadd + [" __________________________________","","0","1","0","0"					,[]];
adminadd = adminadd + [" __________________________________","","0","1","0","0"					,[]];
adminadd = adminadd + ["","","0","1","0","0"													,[]];
adminadd = adminadd + ["","","0","1","0","0"													,[]];
adminadd = adminadd + ["","","0","1","0","0"													,[]];
};
Level2_menu =
{
adminadd = adminadd + [" _________________________________________________________","","0","1","0","0"		,[]];
adminadd = adminadd + [" _________________________________________________________","","0","1","0","0"		,[]];
adminadd = adminadd + [" ________________________ HOTKEYS ________________________","","0","1","0","0"		,[]];
adminadd = adminadd + [" NOTE: Double click players to quick spectate.","","0","1","0","0"					,[]];
adminadd = adminadd + [" NOTE: F5 to EXIT spectating","","0","1","0","0"									,[]];
if (AM_EPOCH) then {
adminadd = adminadd + [" NOTE: 3 to get password of cursorTarget ","","0","1","0","0" 					,[]];
adminadd = adminadd + [" NOTE: 4 to spawn key of cursorTarget(vehicle) ","","0","1","0","0" 			,[]];
};
adminadd = adminadd + [" ________________________ HOTKEYS ________________________","","0","1","0","0"		,[]];
adminadd = adminadd + [" _________________________________________________________","","0","1","0","0"		,[]];
adminadd = adminadd + [" _________________________________________________________","","0","1","0","0"		,[]];
adminadd = adminadd + [" Server Scripts ","","0","1","0","0"									,[]];
adminadd = adminadd + [" __________________________________","","0","1","0","0"					,[]];
adminadd = adminadd + ["     Broadcast Message",adminmsg,"0","0","0","0"						,[]];
adminadd = adminadd + ["     Message Target",adminmsg_target,"0","0","0","1"					,[]];


adminadd = adminadd + ["     Delete/kill all zombies",del_zombies,"0","0","0","0"				,[]];
adminadd = adminadd + [" __________________________________","","0","1","0","0"					,[]];





adminadd = adminadd + [" Toggleable Scripts ","","0","1","0","0"								,[]];
adminadd = adminadd + [" NOTE: ALT + Left Click Teleport","","0","1","0","0"					,[]];
adminadd = adminadd + [" __________________________________","","0","1","0","0"					,[]];
adminadd = adminadd + ["     Toggle Teleport",TP_me_OK,"1","0","0","0"							,[]];







adminadd = adminadd + ["     Toggle Stealth",admininvis,"1","0","0","0"							,[]];
adminadd = adminadd + ["     Toggle zombie aggro",no_zAGGRO,"1","0","0","0"						,[]];
adminadd = adminadd + [" __________________________________","","0","1","0","0"					,[]];
adminadd = adminadd + [" Targeted Scripts ","","0","1","0","0"									,[]];
adminadd = adminadd + [" __________________________________","","0","1","0","0"					,[]];
adminadd = adminadd + ["     Spectate Target",adminspec,"0","0","0","1"							,[]];
adminadd = adminadd + ["     View gear Target",admin_spec_gear,"0","0","0","1"					,[]];
adminadd = adminadd + ["     Give ammo to Target",admin_givammo,"0","0","0","1"					,[]];
adminadd = adminadd + ["     Move to Target",admintele,"0","0","0","1"							,[]];
adminadd = adminadd + ["     Move Target to Me",admint2me,"0","0","0","1"						,[]];
adminadd = adminadd + ["     Heal Target",adminheal,"0","0","0","1"								,[]];
adminadd = adminadd + ["     Kill Target",adminkill,"0","0","0","1"								,[]];
adminadd = adminadd + ["     Slap Target",adminSlap,"0","0","0","1"								,[]];
adminadd = adminadd + ["     Break Target's Legs",adminbreakleg,"0","0","0","1"					,[]];
adminadd = adminadd + ["     RemoveGear Target",adminremovegear,"0","0","0","1"					,[]];
adminadd = adminadd + ["     Move player in passenger",manipulate_moveinveh,"0","0","0","1"		,[]];
adminadd = adminadd + ["     Join player's vehicle",manipulate_joinvehicle,"0","0","0","1"		,[]];
adminadd = adminadd + ["     Increase target's humanity",man_addhu,"0","0","0","1"				,[]];
adminadd = adminadd + ["     Decrease target's humanity",man_takehu,"0","0","0","1"				,[]];
adminadd = adminadd + [" ----Sub Menus----","","0","1","0","0"									,[]];
adminadd = adminadd + ["     Give gear target","GiveGear","0","0","1","0"						,[]];
adminadd = adminadd + [" __________________________________","","0","1","0","0"					,[]];
adminadd = adminadd + [" Miscellaneous ","","0","1","0","0"										,[]];
adminadd = adminadd + [" __________________________________","","0","1","0","0"					,[]];
adminadd = adminadd + ["     Repair close buildings",repair_close,"0","0","0","0"				,[]];
adminadd = adminadd + ["     Repair close entities",repair_centitiy,"0","0","0","0"				,[]];
adminadd = adminadd + ["     Open environment scroll menu",admin_wedar,"0","0","0","0"			,[]];
adminadd = adminadd + ["     Unflip Vehicle",adminflip,"0","0","0","0"							,[]];
adminadd = adminadd + ["     Force Disconnect (Self)",{endmission "LOSER";},"0","0","0","0"		,[]];
adminadd = adminadd + ["     Force Disconnect (Target)",adminFDisconnect,"0","0","0","1"		,[]];
adminadd = adminadd + [" __________________________________","","0","1","0","0"					,[]];








};
Level1_menu =
{
adminadd = adminadd + [" _________________________________________________________","","0","1","0","0"		,[]];
adminadd = adminadd + [" _________________________________________________________","","0","1","0","0"		,[]];
adminadd = adminadd + [" ________________________ HOTKEYS ________________________","","0","1","0","0"		,[]];
adminadd = adminadd + [" NOTE: Double click players to quick spectate.","","0","1","0","0"					,[]];
adminadd = adminadd + [" NOTE: F5 to EXIT spectating","","0","1","0","0"									,[]];
adminadd = adminadd + [" ________________________ HOTKEYS ________________________","","0","1","0","0"		,[]];
adminadd = adminadd + [" _________________________________________________________","","0","1","0","0"		,[]];
adminadd = adminadd + [" _________________________________________________________","","0","1","0","0"		,[]];
adminadd = adminadd + ["","","0","1","0","0"													,[]];
adminadd = adminadd + ["","","0","1","0","0"													,[]];
adminadd = adminadd + [" Targeted Scripts ","","0","1","0","0"									,[]];
adminadd = adminadd + ["     Spectate Target",adminspec,"0","0","0","1"							,[]];
adminadd = adminadd + ["     View gear Target",admin_spec_gear,"0","0","0","1"					,[]];
adminadd = adminadd + [" __________________________________","","0","1","0","0"					,[]];
adminadd = adminadd + [" __________________________________","","0","1","0","0"					,[]];
};
admin_fillsubsss = 
{
adminadd = adminadd + [(format["     Main Menu"]),"MainMenu","0","0","1","0",[1,0.1,0.55,1]];
adminadd = adminadd + [(format["     Hacker Log (%1)",((count PVOZ_hackerlog)-1)]),"hackerLog","0","0","1","0",[1,0.1,0.55,1]];
adminadd = adminadd + [(format["     Key Log(%1)",((count PVOZ_keylog)-1)]),"keyLog","0","0","1","0",[1,0.1,0.55,1]];
adminadd = adminadd + [(format["     PHIT/PKILL Log(%1)",((count PVOZ_hitlog)-1)]),"PHitLog","0","0","1","0",[1,0.1,0.55,1]];
if (getplayerUID player in levelthree) then
{
adminadd = adminadd + [(format["     Admin Log (%1)",((count PVOZ_writeAdmin_log_ARRAY)-1)]),"WriteLog","0","0","1","0",[1,0.1,0.55,1]];
adminadd = adminadd + ["     Change weather (global)","Weather","0","0","1","0",[1,0.2,0.35,1]];
adminadd = adminadd + ["     Change Time (global)","Time","0","0","1","0",[1,0.2,0.35,1]];
};
adminadd = adminadd + ["     Toggle admin alerts",admin_alerttgle,"1","0","0","0",[]];
};
admin_fillCOLORS =
{
inSub = false;
_ctrl = 2 call getControl;
lbclear _ctrl;
_ctrl ctrlSetFont "Zeppelin33";
adminadd = [];
call admin_fillsubsss;
adminadd = adminadd + [" __________________________________","","0","1","0","0"					,[]];
adminadd = adminadd + [" Change Colors ","","0","1","0","0",[]];
adminadd = adminadd + [" __________________________________","","0","1","0","0"					,[]];
adminadd = adminadd + ["[||-||]=== Change Colors ===[||-||]","","0","0","0","0"					,[1, 2, 0, 1]];
adminadd = adminadd + ["     Paint self Red",admin_changecolor_RED,"0","0","0","0"				,[]];
adminadd = adminadd + ["     Paint self Pink",admin_changecolor_PINK,"0","0","0","0"			,[]];
adminadd = adminadd + ["     Paint self Light Pink",admin_changecolor_LPINK,"0","0","0","0"		,[]];
adminadd = adminadd + ["     Paint self Dark puple",admin_changecolor_DPURPLE,"0","0","0","0"	,[]];
adminadd = adminadd + ["     Paint self Purple",admin_changecolor_PURPLE,"0","0","0","0"		,[]];
adminadd = adminadd + ["     Paint self Light purple",admin_changecolor_LPURPLE,"0","0","0","0"	,[]];
adminadd = adminadd + ["     Paint self Dark Green",admin_changecolor_DGREEN,"0","0","0","0"	,[]];
adminadd = adminadd + ["     Paint self Green",admin_changecolor_GREEN,"0","0","0","0"			,[]];
adminadd = adminadd + ["     Paint self Cyan",admin_changecolor_CYAN,"0","0","0","0"			,[]];
adminadd = adminadd + ["     Paint self Blue",admin_changecolor_BLUE,"0","0","0","0"			,[]];
adminadd = adminadd + ["     Paint self Orange",admin_changecolor_ORANGE,"0","0","0","0"		,[]];
adminadd = adminadd + ["     Paint self Yellow",admin_changecolor_YELLOW,"0","0","0","0"		,[]];
adminadd = adminadd + ["     Paint self White",admin_changecolor_WHITE,"0","0","0","0"			,[]];
adminadd = adminadd + ["     Paint self Black",admin_changecolor_BLACK,"0","0","0","0"			,[]];
call admin_FILL_MENUS;
};
admin_animatetrgt =
{
inSub = false;
_ctrl = 2 call getControl;
lbclear _ctrl;
_ctrl ctrlSetFont "Zeppelin33";
adminadd = [];
call admin_fillsubsss;
adminadd = adminadd + [" Animate Target ","","0","1","0","0",[]];
adminadd = adminadd + [" __________________________________","","0","1","0","0"					,[]];
adminadd = adminadd + [" __________________________________","","0","1","0","0"					,[]];
adminadd = adminadd + ["[||-||]=== ANIMATIONS ===[||-||]","","0","0","0","0"					,[1, 2, 0, 1]];
adminadd = adminadd + ["   End animations on player",anim_end,"0","0","0","1"					,[]];
adminadd = adminadd + ["   Make player dance (1) ",anim_dance1,"0","0","0","1"					,[]];
adminadd = adminadd + ["   Make player dance (2) ",anim_dance2,"0","0","0","1"					,[]];
adminadd = adminadd + ["   Make player dance (3) ",anim_dance3,"0","0","0","1"					,[]];
adminadd = adminadd + ["   Make player box(fighting)",anim_boxing,"0","0","0","1"				,[]];
adminadd = adminadd + ["   Make player handstand ",anim_handstand,"0","0","0","1"				,[]];
adminadd = adminadd + ["   Make player Laydown ",anim_laydown,"0","0","0","1"					,[]];
adminadd = adminadd + ["   Make player Suicide",anim_suicide,"0","0","0","1"					,[]];
call admin_FILL_MENUS;
};
Admin_GiveGear = 
{
inSub = false;
_ctrl = 2 call getControl;
lbclear _ctrl;
_ctrl ctrlSetFont "Zeppelin33";
adminadd = [];
call admin_fillsubsss;
adminadd = adminadd + [" __________________________________","","0","1","0","0"					,[]];
adminadd = adminadd + [" Give Gear ","","0","1","0","0",[]];
adminadd = adminadd + [" __________________________________","","0","1","0","0"					,[]];
adminadd = adminadd + ["[||-||]=== GIVE LOADOUTS ===[||-||]","","0","0","0","0"					,[1, 0.2, 0.5,1]];
adminadd = adminadd + ["[ -- BACKPACKS -- ]","","0","0","0","0"									,[1, 2, 0, 1]];
adminadd = adminadd + ["   Give coyote backpack ",loadout_coyote,"0","0","0","1"				,[]];
adminadd = adminadd + ["   Give alice backpack ",loadout_alice,"0","0","0","1"					,[]];
adminadd = adminadd + ["[ -- SNIPERS -- ]","","0","0","0","0"									,[1, 2, 0, 1]];
adminadd = adminadd + ["   Give DMR loadout",loadout_dmr,"0","0","0","1"						,[]];
adminadd = adminadd + ["   Give M14 AIM loadout",loadout_m14,"0","0","0","1"					,[]];
adminadd = adminadd + ["[ -- ASSAULT RIFLES -- ]","","0","0","0","0"							,[1, 2, 0, 1]];
adminadd = adminadd + ["   Give FN FAL loadout",loadout_fnfal,"0","0","0","1"					,[]];
adminadd = adminadd + ["   Give M4A1 SD loadout",loadout_m4a1sd,"0","0","0","1"					,[]];
adminadd = adminadd + ["   Give M4A3 HOLO loadout",loadout_m4a3holo,"0","0","0","1"				,[]];
adminadd = adminadd + ["   Give M4A1 HOLO loadout",loadout_m4a1holo,"0","0","0","1"				,[]];
adminadd = adminadd + ["   Give M16 ACOG loadout",loadout_m16acog,"0","0","0","1"				,[]];
adminadd = adminadd + ["   Give M16 M203 loadout",loadout_m16m203,"0","0","0","1"				,[]];
adminadd = adminadd + ["   Give G36 loadout",loadout_g36,"0","0","0","1"						,[]];
adminadd = adminadd + ["   Give L85 THERMAL loadout",loadout_l85,"0","0","0","1"				,[]];
call admin_FILL_MENUS;
};
admin_manipulate =
{
inSub = false;
_ctrl = 2 call getControl;
lbclear _ctrl;
_ctrl ctrlSetFont "Zeppelin33";
adminadd = [];
call admin_fillsubsss;
adminadd = adminadd + [" __________________________________","","0","1","0","0" ,[]];
adminadd = adminadd + [" Manipulate Target ","","0","1","0","0",[]];
adminadd = adminadd + [" __________________________________","","0","1","0","0" ,[]];
adminadd = adminadd + ["[||-||]=== Manipulate Scripts ===[||-||]","","0","0","0","0" ,[1, 2, 0, 1]];
adminadd = adminadd + ["   Send player 50m up",manipulate_fly50,"0","0","0","1" ,[]];
adminadd = adminadd + ["   Send player 100m up",manipulate_fly100,"0","0","0","1" ,[]];
adminadd = adminadd + ["   Eject player from vehicle",manipulate_eject,"0","0","0","1" ,[]];
adminadd = adminadd + ["   Give player godmode",manipulate_godmode,"0","0","0","1" ,[]];
adminadd = adminadd + ["   Give player ESP",manipulate_givesp,"0","0","0","1" ,[]];
adminadd = adminadd + ["   Disable player's godmode",manipulate_nogod,"0","0","0","1" ,[]];
adminadd = adminadd + ["   Disable player's ESP",manipulate_givespdis,"0","0","0","1" ,[]];
adminadd = adminadd + ["   Remove player's zombie aggro",manipulate_aggro,"0","0","0","1" ,[]];
adminadd = adminadd + ["   Spawn explosion on player",manipulate_boom,"0","0","0","1" ,[]];
call admin_FILL_MENUS;
};
admin_weather =
{
inSub = false;
_ctrl = 2 call getControl;
lbclear _ctrl;
adminadd = [];
call admin_fillsubsss;
adminadd = adminadd + [" __________________________________","","0","1","0","0" ,[]];
adminadd = adminadd + ["   View Distance ","","0","1","0","0",[]];
adminadd = adminadd + [" __________________________________","","0","1","0","0" ,[]];
adminadd = adminadd + ["     1",{PVOZ_REMOTE_EXECUTE_list 		= [9,player,1,1];publicVariableServer "PVOZ_REMOTE_EXECUTE_list";},"0","0","0","0",[]];
adminadd = adminadd + ["     500",{PVOZ_REMOTE_EXECUTE_list 	= [9,player,1,500];publicVariableServer "PVOZ_REMOTE_EXECUTE_list";},"0","0","0","0",[]];
adminadd = adminadd + ["     1000",{PVOZ_REMOTE_EXECUTE_list 	= [9,player,1,1000];publicVariableServer "PVOZ_REMOTE_EXECUTE_list";},"0","0","0","0",[]];
adminadd = adminadd + ["     2000",{PVOZ_REMOTE_EXECUTE_list 	= [9,player,1,2000];publicVariableServer "PVOZ_REMOTE_EXECUTE_list";},"0","0","0","0",[]];
adminadd = adminadd + ["     3000",{PVOZ_REMOTE_EXECUTE_list 	= [9,player,1,3000];publicVariableServer "PVOZ_REMOTE_EXECUTE_list";},"0","0","0","0",[]];
adminadd = adminadd + ["     5000",{PVOZ_REMOTE_EXECUTE_list 	= [9,player,1,5000];publicVariableServer "PVOZ_REMOTE_EXECUTE_list";},"0","0","0","0",[]];
adminadd = adminadd + ["     7500",{PVOZ_REMOTE_EXECUTE_list 	= [9,player,1,7500];publicVariableServer "PVOZ_REMOTE_EXECUTE_list";},"0","0","0","0",[]];
adminadd = adminadd + ["     10000",{PVOZ_REMOTE_EXECUTE_list 	= [9,player,1,10000];publicVariableServer "PVOZ_REMOTE_EXECUTE_list";},"0","0","0","0",[]];
adminadd = adminadd + ["     12500",{PVOZ_REMOTE_EXECUTE_list 	= [9,player,1,12500];publicVariableServer "PVOZ_REMOTE_EXECUTE_list";},"0","0","0","0",[]];
adminadd = adminadd + ["     15000",{PVOZ_REMOTE_EXECUTE_list 	= [9,player,1,15000];publicVariableServer "PVOZ_REMOTE_EXECUTE_list";},"0","0","0","0",[]];
adminadd = adminadd + ["     20000",{PVOZ_REMOTE_EXECUTE_list 	= [9,player,1,20000];publicVariableServer "PVOZ_REMOTE_EXECUTE_list";},"0","0","0","0",[]];
adminadd = adminadd + [" __________________________________","","0","1","0","0" ,[]];
adminadd = adminadd + ["   Fog ","","0","1","0","0",[]];
adminadd = adminadd + [" __________________________________","","0","1","0","0" ,[]];
adminadd = adminadd + ["     Off",{PVOZ_REMOTE_EXECUTE_list 	= [9,player,4,0];publicVariableServer "PVOZ_REMOTE_EXECUTE_list";},"0","0","0","0",[]];
adminadd = adminadd + ["     20%",{PVOZ_REMOTE_EXECUTE_list 	= [9,player,4,0.2];publicVariableServer "PVOZ_REMOTE_EXECUTE_list";},"0","0","0","0",[]];
adminadd = adminadd + ["     40%",{PVOZ_REMOTE_EXECUTE_list 	= [9,player,4,0.4];publicVariableServer "PVOZ_REMOTE_EXECUTE_list";},"0","0","0","0",[]];
adminadd = adminadd + ["     60%",{PVOZ_REMOTE_EXECUTE_list 	= [9,player,4,0.6];publicVariableServer "PVOZ_REMOTE_EXECUTE_list";},"0","0","0","0",[]];
adminadd = adminadd + ["     80%",{PVOZ_REMOTE_EXECUTE_list 	= [9,player,4,0.8];publicVariableServer "PVOZ_REMOTE_EXECUTE_list";},"0","0","0","0",[]];
adminadd = adminadd + ["     100%",{PVOZ_REMOTE_EXECUTE_list 	= [9,player,4,1];publicVariableServer "PVOZ_REMOTE_EXECUTE_list";},"0","0","0","0",[]];
adminadd = adminadd + [" __________________________________","","0","1","0","0" ,[]];
adminadd = adminadd + ["   Rain ","","0","1","0","0",[]];
adminadd = adminadd + [" __________________________________","","0","1","0","0" ,[]];
adminadd = adminadd + ["     Off",{PVOZ_REMOTE_EXECUTE_list 	= [9,player,3,0];publicVariableServer "PVOZ_REMOTE_EXECUTE_list";},"0","0","0","0",[]];
adminadd = adminadd + ["     20%",{PVOZ_REMOTE_EXECUTE_list 	= [9,player,3,0.2];publicVariableServer "PVOZ_REMOTE_EXECUTE_list";},"0","0","0","0",[]];
adminadd = adminadd + ["     40%",{PVOZ_REMOTE_EXECUTE_list 	= [9,player,3,0.4];publicVariableServer "PVOZ_REMOTE_EXECUTE_list";},"0","0","0","0",[]];
adminadd = adminadd + ["     60%",{PVOZ_REMOTE_EXECUTE_list 	= [9,player,3,0.6];publicVariableServer "PVOZ_REMOTE_EXECUTE_list";},"0","0","0","0",[]];
adminadd = adminadd + ["     80%",{PVOZ_REMOTE_EXECUTE_list 	= [9,player,3,0.8];publicVariableServer "PVOZ_REMOTE_EXECUTE_list";},"0","0","0","0",[]];
adminadd = adminadd + ["     100%",{PVOZ_REMOTE_EXECUTE_list 	= [9,player,3,1];publicVariableServer "PVOZ_REMOTE_EXECUTE_list";},"0","0","0","0",[]];
adminadd = adminadd + [" __________________________________","","0","1","0","0" ,[]];
adminadd = adminadd + ["   Overcast ","","0","1","0","0",[]];
adminadd = adminadd + [" __________________________________","","0","1","0","0" ,[]];
adminadd = adminadd + ["     Clear",{PVOZ_REMOTE_EXECUTE_list 	= [9,player,2,0];publicVariableServer "PVOZ_REMOTE_EXECUTE_list";},"0","0","0","0",[]];
adminadd = adminadd + ["     Partly Cloudy",{PVOZ_REMOTE_EXECUTE_list = [9,player,2,0.2];publicVariableServer "PVOZ_REMOTE_EXECUTE_list";},"0","0","0","0",[]];
adminadd = adminadd + ["     Cloudy",{PVOZ_REMOTE_EXECUTE_list 	= [9,player,2,0.4];publicVariableServer "PVOZ_REMOTE_EXECUTE_list";},"0","0","0","0",[]];
adminadd = adminadd + ["     Rain",{PVOZ_REMOTE_EXECUTE_list 	= [9,player,2,0.6];publicVariableServer "PVOZ_REMOTE_EXECUTE_list";PVOZ_REMOTE_EXECUTE_list = [9,player,3,0.2];publicVariableServer "PVOZ_REMOTE_EXECUTE_list";},"0","0","0","0",[]];
adminadd = adminadd + ["     Heavy Rain",{PVOZ_REMOTE_EXECUTE_list 	= [9,player,2,0.8];publicVariableServer "PVOZ_REMOTE_EXECUTE_list";PVOZ_REMOTE_EXECUTE_list = [9,player,3,0.6];publicVariableServer "PVOZ_REMOTE_EXECUTE_list";},"0","0","0","0",[]];
adminadd = adminadd + ["     Storm",{PVOZ_REMOTE_EXECUTE_list 	= [9,player,2,1];publicVariableServer "PVOZ_REMOTE_EXECUTE_list";PVOZ_REMOTE_EXECUTE_list = [9,player,3,1];publicVariableServer "PVOZ_REMOTE_EXECUTE_list";},"0","0","0","0",[]];

call admin_FILL_MENUS;
};
admin_time =
{
inSub = false;
_ctrl = 2 call getControl;
lbclear _ctrl;
adminadd = [];
call admin_fillsubsss;
adminadd = adminadd + [" __________________________________","","0","1","0","0" ,[]];
adminadd = adminadd + ["   Time Selection ","","0","1","0","0",[]];
adminadd = adminadd + [" __________________________________","","0","1","0","0" ,[]];
adminadd = adminadd + ["     12 AM",{PVOZ_REMOTE_EXECUTE_list = [10,player,date,0];publicVariableServer "PVOZ_REMOTE_EXECUTE_list";},"0","0","0","0",[]];
adminadd = adminadd + ["     1 AM",{PVOZ_REMOTE_EXECUTE_list = [10,player,date,1];publicVariableServer "PVOZ_REMOTE_EXECUTE_list";},"0","0","0","0",[]];
adminadd = adminadd + ["     3 AM",{PVOZ_REMOTE_EXECUTE_list = [10,player,date,3];publicVariableServer "PVOZ_REMOTE_EXECUTE_list";},"0","0","0","0",[]];
adminadd = adminadd + ["     5 AM",{PVOZ_REMOTE_EXECUTE_list = [10,player,date,5];publicVariableServer "PVOZ_REMOTE_EXECUTE_list";},"0","0","0","0",[]];
adminadd = adminadd + ["     7 AM",{PVOZ_REMOTE_EXECUTE_list = [10,player,date,7];publicVariableServer "PVOZ_REMOTE_EXECUTE_list";},"0","0","0","0",[]];
adminadd = adminadd + ["     9 AM",{PVOZ_REMOTE_EXECUTE_list = [10,player,date,9];publicVariableServer "PVOZ_REMOTE_EXECUTE_list";},"0","0","0","0",[]];
adminadd = adminadd + ["     11 AM",{PVOZ_REMOTE_EXECUTE_list = [10,player,date,11];publicVariableServer "PVOZ_REMOTE_EXECUTE_list";},"0","0","0","0",[]];
adminadd = adminadd + ["     1 PM",{PVOZ_REMOTE_EXECUTE_list = [10,player,date,13];publicVariableServer "PVOZ_REMOTE_EXECUTE_list";},"0","0","0","0",[]];
adminadd = adminadd + ["     3 PM",{PVOZ_REMOTE_EXECUTE_list = [10,player,date,15];publicVariableServer "PVOZ_REMOTE_EXECUTE_list";},"0","0","0","0",[]];
adminadd = adminadd + ["     5 PM",{PVOZ_REMOTE_EXECUTE_list = [10,player,date,17];publicVariableServer "PVOZ_REMOTE_EXECUTE_list";},"0","0","0","0",[]];
adminadd = adminadd + ["     7 PM",{PVOZ_REMOTE_EXECUTE_list = [10,player,date,19];publicVariableServer "PVOZ_REMOTE_EXECUTE_list";},"0","0","0","0",[]];
adminadd = adminadd + ["     9 PM",{PVOZ_REMOTE_EXECUTE_list = [10,player,date,21];publicVariableServer "PVOZ_REMOTE_EXECUTE_list";},"0","0","0","0",[]];
adminadd = adminadd + ["     11 PM",{PVOZ_REMOTE_EXECUTE_list = [10,player,date,23];publicVariableServer "PVOZ_REMOTE_EXECUTE_list";},"0","0","0","0",[]];
call admin_FILL_MENUS;
};
man_addhu 		= {_name = _this select 0; cutText [format ['Giving 2500 humanity to %1!',_name],'PLAIN DOWN'];systemChat format ['Giving 2500 humanity to %1!',_name];_addhu = format ["if (name player == '%1') then {[player,2500] call player_humanltyChange;[player,2500] call player_humanityChange;};", _name, _list, name player];[_addhu] spawn admin_dothis;};
man_takehu 		= {_name = _this select 0; cutText [format ['Removing 2500 humanity from %1!',_name],'PLAIN DOWN'];systemChat format ['Removing 2500 humanity from %1!',_name];_takehu = format ["if (name player == '%1') then {[player,-2500] call player_humanltyChange;[player,-2500] call player_humanityChange;};", _name, _list, name player];[_takehu] spawn admin_dothis;};
repair_centitiy = {_list2 = nearestObjects [vehicle player, [], 2000];{if (!(_x isKindOf "LandVehicle")&&!(_x isKindOf "CAManBase")&&!(_x isKindOf "Air")&&!(_x isKindOf "Ship")&&!(_x isKindOf "Static")&&!(_x isKindOf "Thing")) then {_x setDammage 0;};} forEach _list2;};
repair_close 	= {pvoz_my_player_yo = player;publicVariable "pvoz_my_player_yo";systemChat ('Anti-Hack: Repairing close building...');sleep 1;_fixcloseshitbro = 'if (isServer) then {_ruins = nearestObjects  [pvoz_my_player_yo, ["Ruins","Thing"], 5000];{deleteVehicle _x} forEach _ruins;_repair = nearestObjects  [pvoz_my_player_yo, ["Building","Static","Thing"], 5000];{_x setDammage 0} forEach _repair;};';[_fixcloseshitbro] spawn admin_dothis;_objrepair = [];_repair = nearestObjects  [player, ["Building","Static","Thing"], 5000];{if (damage _x > 0.9) then {_objrepair = _objrepair + [typeOf _x];}} forEach _repair;systemChat ('Repaired: '+str _objrepair+'');};
no_RECOIL_k 	= {if (isnil ("dami_noRECOIL")) then {dami_noRECOIL = 0;};if (dami_noRECOIL==0) then {cutText ['Recoil removed!','PLAIN DOWN'];player setUnitRecoilCoefficient 0;} else {dami_noRECOIL=0;cutText ['Recoil added!','PLAIN DOWN'];player setUnitRecoilCoefficient 1;};};
inf_AMMO_k 		= {
if (isnil ("dami_noRELOAD")) then {dami_noRELOAD=false;};

if (!dami_noRELOAD) then
{
cutText ["Infinite Ammo activated.", "PLAIN"];
dami_noRELOAD = true;
sleep 1;
[] spawn {
while {dami_noRELOAD} do
{
(vehicle player) setVehicleAmmo 1;
sleep 0.1;
};
systemChat ("INF AMMO LOOP EXITED");
};
} else {
dami_noRELOAD = false;
cutText ["Infinite Ammo deactivated!", "PLAIN"];
};
};
admin_norestrict = {if (!isNil 'AM_Epoch_ADMIN_norestrict') then {systemChat ('Anti-Hack: No building restrictions disabled.');cutText ['No building restrictions disabled.','PLAIN DOWN'];AM_Epoch_ADMIN_norestrict = nil;} else {systemChat ('Anti-Hack: No building restrictions enabled.');cutText ['No building restrictions enabled.','PLAIN DOWN'];AM_Epoch_ADMIN_norestrict = true;};};
admin_instantbd = {if (!isNil 'AM_Epoch_ADMIN') then {systemChat ('Anti-Hack: Instant build is now disabled.');cutText ['Instant build is now off.','PLAIN DOWN'];AM_Epoch_ADMIN = nil;} else {systemChat ('Anti-Hack: Instant build is now enabled.');cutText ['Instant build is now on.','PLAIN DOWN'];AM_Epoch_ADMIN = true;};};
del_vehicles	= {_cake = 0;_savelog = format["%1 deleted all broken vehicles.",name player];PVOZ_writelog_rq = [_savelog];publicVariableServer "PVOZ_writelog_rq";_objblown = [];{if (((damage _x)>0.95)&&!(_x isKindOf "MAN")&&!(_x isKindOf "CAAnimalBase")&&!(_x isKindOf "zZombie_Base")&&!(_x isKindOf "static")) then {deleteVehicle _x;PVDZ_veh_Save = [_x, "killed"];publicVariableServer "PVDZ_veh_Save";PVDZ_obj_Delete = [_objectID,_objectUID];publicVariableServer "PVDZ_obj_Delete";if (AM_EPOCH) then {PVDZE_obj_Delete = [_objectID,_objectUID,player];publicVariableServer "PVDZE_obj_Delete";};_cake = _cake + 1;_objblown = _objblown + [typeOf _x];};} forEach Entities "AllVehicles";systemChat format ["%1 blown up vehicles were deleted from the database: "+str _objblown+".", _cake];};
del_zombies 	= {_savelog = format["%1 deleted all zombies.",name player];PVOZ_writelog_rq = [_savelog];publicVariableServer "PVOZ_writelog_rq";{deleteVehicle _x;} forEach (allMissionObjects "Land_Campfire_burning")+(allMissionObjects "Body0")+(allMissionObjects "Body1")+(allMissionObjects "Body2")+(allMissionObjects "z_dothisctor")+(allMissionObjects "z_hunter")+(allMissionObjects "z_policeman")+(allMissionObjects "z_priest")+(allMissionObjects "z_soldier")+(allMissionObjects "z_soldier_heavy")+(allMissionObjects "z_soldier_pilot")+(allMissionObjects "z_suit1")+(allMissionObjects "z_suit2")+(allMissionObjects "z_teacher")+(allMissionObjects "z_villager1")+(allMissionObjects "z_villager2")+(allMissionObjects "z_villager3")+(allMissionObjects "z_worker1")+(allMissionObjects "z_worker2")+(allMissionObjects "z_worker3")+(allMissionObjects "zZombie_Base");};
adminflip 		= {_temp = vehicle player;PVOZ_MyTargetKKcake = _temp;publicVariable "PVOZ_MyTargetKKcake";PVOZ_MyTargetKKcake setVectorUp [0,0,1];systemChat format ["Vehicle (%1) flipped.", typeOf _temp];remotemeplz = "PVOZ_MyTargetKKcake setVectorUp [0,0,1];";[remotemeplz] spawn admin_dothis;_temp2 = cursorTarget;PVOZ_MyTargetKKcake2 = _temp2;publicVariable "PVOZ_MyTargetKKcake2";PVOZ_MyTargetKKcake2 setVectorUp [0,0,1];systemChat format ["Vehicle (%1) flipped.", typeOf _temp2];remotemeplz = "PVOZ_MyTargetKKcake2 setVectorUp [0,0,1];";[remotemeplz] spawn admin_dothis;};
admin_ammo 		= {_savelog = format["%1 spawned 3 magazines for %2",name player,currentWeapon (vehicle player)];PVOZ_writelog_rq = [_savelog];publicVariableServer "PVOZ_writelog_rq";_weapon = currentWeapon player;_mags = getArray(configfile >> 'cfgWeapons' >> _weapon >> 'magazines');_mag 	= _mags select 0;player addMagazine _mag;player addMagazine _mag;player addMagazine _mag;};
del_gearz 		= {_savelog = format["%1 deleted their gear.",name player];PVOZ_writelog_rq = [_savelog];publicVariableServer "PVOZ_writelog_rq";_DERPADERPA_dami = (vehicle player);removeAllWeapons _DERPADERPA_dami;removeAllItems _DERPADERPA_dami;removebackpack _DERPADERPA_dami;cutText ["Gear deleted!", "PLAIN"];};
M4_load 		= {_savelog = format["%1 spawned loadout (M4).",name player];PVOZ_writelog_rq = [_savelog];publicVariableServer "PVOZ_writelog_rq";(vehicle player) addWeapon 'M4A1_HWS_GL';(vehicle player) addMagazine '30Rnd_556x45_Stanag';(vehicle player) addMagazine '30Rnd_556x45_Stanag';	(vehicle player) addMagazine '30Rnd_556x45_Stanag';(vehicle player) addMagazine '30Rnd_556x45_Stanag';(vehicle player) addMagazine 'Skin_Sniper1_DZ';(vehicle player) addMagazine 'ItemMorphine';(vehicle player) addMagazine 'ItemBloodbag';(vehicle player) addMagazine 'ItemPainkiller'; (vehicle player) addMagazine 'ItemEpinephrine';(vehicle player) addMagazine 'ItemSodaPepsi';(vehicle player) addMagazine 'FoodSteakCooked';(vehicle player) addWeapon 'M9SD';(vehicle player) addMagazine '15Rnd_9x19_M9SD';(vehicle player) addMagazine '15Rnd_9x19_M9SD';(vehicle player) addMagazine '15Rnd_9x19_M9SD';(vehicle player) addMagazine '15Rnd_9x19_M9SD';(vehicle player) addMagazine 'ItemBandage';(vehicle player) addMagazine 'ItemBandage';(vehicle player) addMagazine '1Rnd_HE_M203';(vehicle player) addMagazine 'FlareGreen_M203';(vehicle player) addWeapon 'Binocular_Vector';(vehicle player) addWeapon 'NVGoggles';(vehicle player) addWeapon 'ItemGPS';(vehicle player) addWeapon 'ItemCompass';(vehicle player) addWeapon 'ItemMap';(vehicle player) addWeapon 'ItemWatch';(vehicle player) addWeapon 'ItemHatchet';(vehicle player) addWeapon 'ItemKnife';(vehicle player) addWeapon 'Itemmatchbox';(vehicle player) addWeapon 'Itemetool';(vehicle player) addWeapon 'Itemtoolbox';(vehicle player) addBackpack 'DZ_ALICE_Pack_EP1';reload (vehicle player);(Unitbackpack (vehicle player)) addMagazineCargo ['ItemBloodbag', 4];(Unitbackpack (vehicle player)) addMagazineCargo ['ItemEpinephrine', 4];(Unitbackpack (vehicle player)) addMagazineCargo ['ItemSodaPepsi', 4];(Unitbackpack (vehicle player)) addMagazineCargo ['ItemBandage', 4];(Unitbackpack (vehicle player)) addMagazineCargo ['FoodSteakCooked', 2];(Unitbackpack (vehicle player)) addMagazineCargo ['ItemMorphine', 2];};
M4SD_load 		= {_savelog = format["%1 spawned loadout (M4SD).",name player];PVOZ_writelog_rq = [_savelog];publicVariableServer "PVOZ_writelog_rq";(vehicle player) addWeapon 'M4A1_AIM_SD_camo';(vehicle player) addMagazine '30Rnd_556x45_StanagSD';(vehicle player) addMagazine '30Rnd_556x45_StanagSD';(vehicle player) addMagazine '30Rnd_556x45_StanagSD';(vehicle player) addMagazine '30Rnd_556x45_StanagSD';(vehicle player) addMagazine '30Rnd_556x45_StanagSD';(vehicle player) addMagazine 'Skin_Sniper1_DZ';(vehicle player) addMagazine 'ItemMorphine';(vehicle player) addMagazine 'ItemBloodbag';(vehicle player) addMagazine 'ItemPainkiller';(vehicle player) addMagazine 'ItemEpinephrine';(vehicle player) addMagazine 'ItemSodaPepsi';(vehicle player) addMagazine 'FoodSteakCooked';(vehicle player) addWeapon 'M9SD';(vehicle player) addMagazine '15Rnd_9x19_M9SD';(vehicle player) addMagazine '15Rnd_9x19_M9SD';(vehicle player) addMagazine '15Rnd_9x19_M9SD';(vehicle player) addMagazine '15Rnd_9x19_M9SD';(vehicle player) addMagazine 'ItemBandage';(vehicle player) addMagazine 'ItemBandage';(vehicle player) addMagazine '1Rnd_HE_M203';(vehicle player) addMagazine 'FlareGreen_M203';(vehicle player) addWeapon 'Binocular_Vector';(vehicle player) addWeapon 'NVGoggles';(vehicle player) addWeapon 'ItemGPS';(vehicle player) addWeapon 'ItemCompass';(vehicle player) addWeapon 'ItemMap';(vehicle player) addWeapon 'ItemWatch';(vehicle player) addWeapon 'ItemHatchet';(vehicle player) addWeapon 'ItemKnife';(vehicle player) addWeapon 'Itemmatchbox';(vehicle player) addWeapon 'Itemetool';(vehicle player) addWeapon 'Itemtoolbox';(vehicle player) addBackpack 'DZ_ALICE_Pack_EP1';reload (vehicle player);(Unitbackpack (vehicle player)) addMagazineCargoGlobal ['ItemBloodbag', 4];(Unitbackpack (vehicle player)) addMagazineCargoGlobal ['ItemEpinephrine', 4];(Unitbackpack (vehicle player)) addMagazineCargoGlobal ['ItemSodaPepsi', 4];(Unitbackpack (vehicle player)) addMagazineCargoGlobal ['ItemBandage', 4];(Unitbackpack (vehicle player)) addMagazineCargoGlobal ['FoodSteakCooked', 2];(Unitbackpack (vehicle player)) addMagazineCargoGlobal ['ItemMorphine', 2];};
admin_alerttgle = {if (isNil 'PVOZ_AdminAlerts') then {PVOZ_AdminAlerts = true;};if (PVOZ_AdminAlerts) then {systemChat ('Anti-Hack: Admin alerts are now disabled.');cutText ['Admin alerts are now off.','PLAIN DOWN'];PVOZ_AdminAlerts = false;} else {systemChat ('Anti-Hack: Admin alerts are now enabled.');cutText ['Admin alerts are now on.','PLAIN DOWN'];PVOZ_AdminAlerts = true;};};
admin_writer 	= {disableSerialization;createDialog "RscFunctionsViewer";_ctrl = (findDisplay 2929) displayctrl 292901;_ctrl ctrlCommit 0;_display 	= findDisplay 2929;_textTitle 	= _display displayctrl 292905;_textPath 	= _display displayctrl 292906;_textDesc 	= _display displayctrl 292907;_textCode 	= _display displayctrl 292908;_btnCopy 	= _display displayctrl 292909;_btnCopy2 	= _display displayctrl 292910;_btnCopy3 	= _display displayctrl 292911;_listTags 	= _display displayCtrl 292903;_listCats 	= _display displayCtrl 292904;_listFNCs 	= _display displayCtrl 292901;_listSRCs 	= _display displayCtrl 292902;_textTitle ctrlShow true;_textPath ctrlShow true;_textDesc  ctrlShow true;_btnCopy ctrlShow true;_btnCopy2  ctrlShow true;_btnCopy3 ctrlShow true;_listFNCs  ctrlShow true;_listSRCs ctrlShow false;_listTags  ctrlShow false;_listCats ctrlShow false;_listFNCs ctrlSetFont "EtelkaNarrowMediumPro";_listFNCs ctrlSetTextColor [0.75,0,0,1];_listFNCs ctrlSetFontHeight 0.0306;_listFNCs ctrlSetBackgroundColor [0, 0, 0, 1];_listFNCs ctrlSetScale 1;_listFNCs ctrlSetPosition [0, 0.045, safezoneW / 4.6, safezoneH / 1.5];_listFNCs ctrlCommit 0;_textDesc ctrlSetFont "Zeppelin33";_textDesc ctrlSetTextColor [0.75,0,0,1];_textDesc ctrlSetFontHeight 0.0306;_textDesc ctrlSetBackgroundColor [0, 0, 0, 1];_textDesc ctrlSetText "You can use this to do, well. Whatever you want. I decided to add this to the admin menu because of cake. Use this to learn cake: http://community.bistudio.com/wiki/Category:Scripting_Commands_ArmA2";_textDesc ctrlCommit 0;_textTitle ctrlSetFont "LucidaConsoleB";_textTitle ctrlSetTextColor [0.75,0,0,1];_textTitle ctrlSetFontHeight 0.0306;_textTitle ctrlSetBackgroundColor [0, 0, 0, 1];_textTitle ctrlSetText "OTF Script Writer";_textTitle ctrlCommit 0;_textCode ctrlSetTextColor [0.75,0,0,1];_textCode ctrlSetFontHeight 0.0306;_textCode ctrlSetText 'player addMagazine "itemTent";';_textCode ctrlSetFont "EtelkaNarrowMediumPro";_textCode ctrlSetScale (safezoneH - safezoneW / 2) * 2.1;_textCode ctrlCommit 0;_btnCopy ctrlSetText "Run Local";_btnCopy ctrlSetTextColor [0,0,0,1];_btnCopy ctrlSetFont "Zeppelin33";_btnCopy buttonSetAction "_text = ctrlText 292908;call compile _text;";_btnCopy ctrlSetPosition [((ctrlPosition _btnCopy) select 0), ((ctrlPosition _btnCopy) select 1)+0.04, (ctrlPosition _btnCopy) select 2, (ctrlPosition _btnCopy) select 3];_btnCopy ctrlCommit 0;_btnCopy2 ctrlSetText "Run Global";_btnCopy2 ctrlSetTextColor [0,0,0,1];_btnCopy2 ctrlSetFont "Zeppelin33";_btnCopy2 buttonSetAction "_text = ctrlText 292908;[_text] spawn admin_dothis;";_btnCopy2 ctrlSetPosition [((ctrlPosition _btnCopy2) select 0), ((ctrlPosition _btnCopy2) select 1)+0.04, (ctrlPosition _btnCopy2) select 2, (ctrlPosition _btnCopy2) select 3];_btnCopy2 ctrlCommit 0;_btnCopy3 ctrlSetText "Close";_btnCopy3 ctrlSetTextColor [0,0,0,1];_btnCopy3 ctrlSetFont "Zeppelin33";_btnCopy3 buttonSetAction "closeDialog 0;";_btnCopy3 ctrlSetPosition [((ctrlPosition _btnCopy2) select 0), ((ctrlPosition _btnCopy2) select 1)+0.04, (ctrlPosition _btnCopy2) select 2, (ctrlPosition _btnCopy2) select 3];_btnCopy3 ctrlCommit 0;};
admin_wedar 	= {surrmenu = [["",true],["Terrain", [2], "#USER:termenu", -5, [["expression", ""]], "1", "1"],	["View Distance", [3], "#USER:distmenu", -5, [["expression", ""]], "1", "1"],	["", [-1], "", -5, [["expression", ""]], "1", "0"],["Time", [4], "#USER:dtimemenu", -5, [["expression", ""]], "1", "1"],	["", [-1], "", -5, [["expression", ""]], "1", "0"],["Overcast", [5], "#USER:overcastmenu", -5, [["expression", ""]], "1", "1"],	["Fog", [6], "#USER:fogmenu", -5, [["expression", ""]], "1", "1"],	["", [-1], "", -5, [["expression", ""]], "1", "0"],["Exit", [13], "", -3, [["expression", ""]], "1", "1"]];dtimemenu = [["", true],	["Select time:", [-1], "", -5, [["expression", ""]], "1", "0"], 	["00:00", [2], "", -5, [["expression", "setDate [date select 0, date select 1, date select 2, 0, 0];"]], "1", "1"],  ["03:00", [3], "", -5, [["expression", "setDate [date select 0, date select 1, date select 2, 3, 0];"]], "1", "1"],  ["06:00", [4], "", -5, [["expression", "setDate [date select 0, date select 1, date select 2, 6, 0];"]], "1", "1"],  ["09:00", [5], "", -5, [["expression", "setDate [date select 0, date select 1, date select 2, 9, 0];"]], "1", "1"],  ["12:00", [5], "", -5, [["expression", "setDate [date select 0, date select 1, date select 2, 12, 0];"]], "1", "1"],  ["15:00", [6], "", -5, [["expression", "setDate [date select 0, date select 1, date select 2, 15, 0];"]], "1", "1"],  ["18:00", [7], "", -5, [["expression", "setDate [date select 0, date select 1, date select 2, 18, 0];"]], "1", "1"],  ["21:00", [8], "", -5, [["expression", "setDate [date select 0, date select 1, date select 2, 21, 0];"]], "1", "1"],  ["", [-1], "", -5, [["expression", ""]], "1", "0"],["Back", [12], "", -4, [["expression", ""]], "1", "1"],	["Exit", [13], "", -3, [["expression", ""]], "1", "1"] ];termenu = [["", true],	["Select terrain level:", [-1], "", -5, [["expression", ""]], "1", "0"], 	["Very High", [2], "", -5, [["expression", "setTerrainGrid 3.125;"]], "1", "1"],  ["High", [3], "", -5, [["expression", "setTerrainGrid 6.25;"]], "1", "1"],  ["Normal", [4], "", -5, [["expression", "setTerrainGrid 12.5;"]], "1", "1"],  ["Low", [5], "", -5, [["expression", "setTerrainGrid 25;"]], "1", "1"],  ["Very Low", [6], "", -5, [["expression", "setTerrainGrid 50;"]], "1", "1"],  ["", [-1], "", -5, [["expression", ""]], "1", "0"],["Back", [12], "", -4, [["expression", ""]], "1", "1"],	["Exit", [13], "", -3, [["expression", ""]], "1", "1"] ];overcastmenu = [["", true],	["Select overcast:", [-1], "", -5, [["expression", ""]], "1", "0"], 	["Clear", [2], "", -5, [["expression", "3 setovercast 0;"]], "1", "1"],  ["Partly Sunny", [3], "", -5, [["expression", "3 setovercast 0.2;"]], "1", "1"],  ["Cloudy", [4], "", -5, [["expression", "3 setovercast 0.4;"]], "1", "1"],  ["Rain", [5], "", -5, [["expression", "3 setovercast 0.6;"]], "1", "1"],  ["Heavy Rain", [6], "", -5, [["expression", "3 setovercast 0.8;"]], "1", "1"],  ["Storm", [7], "", -5, [["expression", "3 setovercast 1;"]], "1", "1"],  ["", [-1], "", -5, [["expression", ""]], "1", "0"],["Back", [12], "", -4, [["expression", ""]], "1", "1"],	["Exit", [13], "", -3, [["expression", ""]], "1", "1"] ];fogmenu = [["", true],	["Select fog level:", [-1], "", -5, [["expression", ""]], "1", "0"], 	["Off", [2], "", -5, [["expression", "3 setFog 0;"]], "1", "1"],  ["20%", [3], "", -5, [["expression", "3 setFog 0.2;"]], "1", "1"],  ["40%", [4], "", -5, [["expression", "3 setFog 0.4;"]], "1", "1"],  ["60%", [5], "", -5, [["expression", "3 setFog 0.6;"]], "1", "1"],  ["80%", [6], "", -5, [["expression", "3 setFog 0.8;"]], "1", "1"],  ["100%", [7], "", -5, [["expression", "3 setFog 1;"]], "1", "1"],  ["", [-1], "", -5, [["expression", ""]], "1", "0"],["Back", [12], "", -4, [["expression", ""]], "1", "1"],	["Exit", [13], "", -3, [["expression", ""]], "1", "1"] ];distmenu = [["", true],	["Select rendering distance:", [-1], "", -5, [["expression", ""]], "1", "0"], 	["900", [2], "", -5, [["expression", "setViewDistance 900;"]], "1", "1"],  ["1000", [3], "", -5, [["expression", "setViewDistance 1000;"]], "1", "1"],  ["1200", [4], "", -5, [["expression", "setViewDistance 1200;"]], "1", "1"],  ["1500", [5], "", -5, [["expression", "setViewDistance 1500;"]], "1", "1"],  ["2000", [5], "", -5, [["expression", "setViewDistance 2000;"]], "1", "1"],  ["2250", [6], "", -5, [["expression", "setViewDistance 2250;"]], "1", "1"],  ["2500", [7], "", -5, [["expression", "setViewDistance 2500;"]], "1", "1"],  ["3500", [8], "", -5, [["expression", "setViewDistance 3500;"]], "1", "1"],  ["4500", [9], "", -5, [["expression", "setViewDistance 4500;"]], "1", "1"],  ["5500", [9], "", -5, [["expression", "setViewDistance 5500;"]], "1", "1"],  ["6500", [9], "", -5, [["expression", "setViewDistance 6500;"]], "1", "1"],  ["7500", [9], "", -5, [["expression", "setViewDistance 7500;"]], "1", "1"],  ["8500", [9], "", -5, [["expression", "setViewDistance 8500;"]], "1", "1"],  ["", [-1], "", -5, [["expression", ""]], "1", "0"],["Back", [12], "", -4, [["expression", ""]], "1", "1"],	["Exit", [13], "", -3, [["expression", ""]], "1", "1"] ];showCommandingMenu "#USER:surrmenu";};
spawn_wepzdami 	= {closeDialog 0;how2bypazz1 = [];how2bypazz2 = [];how2bypazz3 = [];how2bypazz4 = [];how2bypazz5 = [];how2bypazz6 = [];how2bypazz7 = [];how2bypazz8 = [];how2bypazz9 = [];how2bypazz10 = [];how2bypazz11 = [];how2bypazz12 = [];how2bypazz13 = [];how2bypazz14 = [];how2bypazz15 = [];how2bypazz16 = [];how2bypazz17 = [];how2bypazz18 = [];how2bypazz19 = [];_HURtext = "player addWeapon '%1'; _give_them_mags_4_weps_fags = getArray(configfile >> 'cfgWeapons' >> '%1' >> 'magazines'); _mag = _give_them_mags_4_weps_fags select 0; player addMagazine _mag; player selectWeapon '%1'; reload player;";how2bypazz1 = [["", true],["Popular", [2], "#USER:how2bypazz2", -5, [["expression", ""]], "1", "1"],["Sidearms", [3], "#USER:how2bypazz3", -5, [["expression", ""]], "1", "1"],["Shotguns", [4], "#USER:how2bypazz4", -5, [["expression", ""]], "1", "1"],["Sub Machine Guns", [5], "#USER:how2bypazz5", -5, [["expression", ""]], "1", "1"],["Light Machine Guns", [6], "#USER:how2bypazz6", -5, [["expression", ""]], "1", "1"],["Assault Rifles", [7], "#USER:how2bypazz8", -5, [["expression", ""]], "1", "1"],["Sniper Rifles", [8], "#USER:how2bypazz14", -5, [["expression", ""]], "1", "1"],["Explosives", [9], "#USER:how2bypazz16", -5, [["expression", ""]], "1", "1"],["Smoke", [10], "#USER:how2bypazz17", -5, [["expression", ""]], "1", "1"],["Flares", [11], "#USER:how2bypazz19", -5, [["expression", ""]], "1", "1"],["", [-1], "", -5, [["expression", ""]], "1", "0"],["Exit", [-1], "", -3, [["expression", ""]], "1", "1"]];how2bypazz2 = [["", true],["M9SD", [2], "", -5, [["expression", format[_HURtext, "M9SD"]]], "1", "1"],["Bizon PP-19 SD", [3], "", -5, [["expression", format[_HURtext, "bizon_silenced"]]], "1", "1"],["M4A1 CCO SD", [4], "", -5, [["expression", format[_HURtext, "M4A1_AIM_SD_camo"]]], "1", "1"],["L85A2 AWS", [5], "", -5, [["expression", format[_HURtext, "BAF_L85A2_RIS_CWS"]]], "1", "1"],["AKM", [6], "", -5, [["expression", format[_HURtext, "AK_47_M"]]], "1", "1"],["MK48 Mod 0", [7], "", -5, [["expression", format[_HURtext, "Mk_48_DZ"]]], "1", "1"],["SVD Camo", [8], "", -5, [["expression", format[_HURtext, "SVD_CAMO"]]], "1", "1"],["M107", [9], "", -5, [["expression", format[_HURtext, "m107_DZ"]]], "1", "1"],["AS50", [10], "", -5, [["expression", format[_HURtext, "BAF_AS50_scoped"]]], "1", "1"],["PDW SD *", [11], "", -5, [["expression", format[_HURtext, "UZI_SD_EP1"]]], "1", "1"],["AS50 TWS *", [12], "", -5, [["expression", format[_HURtext, "BAF_AS50_TWS"]]], "1", "1"],["", [-1], "", -5, [["expression", ""]], "1", "0"],["Exit", [-1], "", -3, [["expression", ""]], "1", "1"]];how2bypazz3 = [["", true],["Makarov", [2], "", -5, [["expression", format[_HURtext, "Makarov"]]], "1", "1"],["Revolver", [3], "", -5, [["expression", format[_HURtext, "revolver_EP1"]]], "1", "1"],["M1911", [4], "", -5, [["expression", format[_HURtext, "Colt1911"]]], "1", "1"],["G17", [5], "", -5, [["expression", format[_HURtext, "glock17_EP1"]]], "1", "1"],["PDW", [6], "", -5, [["expression", format[_HURtext, "UZI_EP1"]]], "1", "1"],["M9", [7], "", -5, [["expression", format[_HURtext, "M9"]]], "1", "1"],["M9SD", [8], "", -5, [["expression", format[_HURtext, "M9SD"]]], "1", "1"],["Makarov SD *", [9], "", -5, [["expression", format[_HURtext, "MakarovSD"]]], "1", "1"],["Sa-61 *", [10], "", -5, [["expression", format[_HURtext, "Sa61_EP1"]]], "1", "1"],["Revolver Gold *", [11], "", -5, [["expression", format[_HURtext, "revolver_gold_EP1"]]], "1", "1"],["PDW SD *", [12], "", -5, [["expression", format[_HURtext, "UZI_SD_EP1"]]], "1", "1"],["", [-1], "", -5, [["expression", ""]], "1", "0"],["Exit", [-1], "", -3, [["expression", ""]], "1", "1"]];how2bypazz4 = [["", true],["Hatchet", [2], "", -5, [["expression", format[_HURtext, "MeleeHatchet"]]], "1", "1"],["Crowbar", [3], "", -5, [["expression", format[_HURtext, "MeleeCrowbar"]]], "1", "1"],["", [-1], "", -5, [["expression", ""]], "1", "0"],["Compound Crossbow", [4], "", -5, [["expression", format[_HURtext, "Crossbow"]]], "1", "1"],["", [-1], "", -5, [["expression", ""]], "1", "0"],["Double-barreled Shotgun", [5], "", -5, [["expression", format[_HURtext, "MR43"]]], "1", "1"], ["Winchester 1866", [6], "", -5, [["expression", format[_HURtext, "Winchester1866"]]], "1", "1"], ["M1014", [7], "", -5, [["expression", format[_HURtext, "M1014"]]], "1", "1"], ["Remington 870 (Flashlight)", [8], "", -5, [["expression", format[_HURtext, "Remington870_lamp"]]], "1", "1"],["Saiga 12K *", [9], "", -5, [["expression", format[_HURtext, "Saiga12K"]]], "1", "1"],["", [-1], "", -5, [["expression", ""]], "1", "0"],["Exit", [-1], "", -3, [["expression", ""]], "1", "1"]];how2bypazz5 = [["", true],["PDW", [2], "", -5, [["expression", format[_HURtext, "UZI_EP1"]]], "1", "1"],["Bizon PP-19 SD", [3], "", -5, [["expression", format[_HURtext, "bizon_silenced"]]], "1", "1"],["MP5A5", [4], "", -5, [["expression", format[_HURtext, "MP5A5"]]], "1", "1"],["MP5SD6", [5], "", -5, [["expression", format[_HURtext, "MP5SD"]]], "1", "1"],["Sa-61 *", [6], "", -5, [["expression", format[_HURtext, "Sa61_EP1"]]], "1", "1"],["PDW SD *", [7], "", -5, [["expression", format[_HURtext, "UZI_SD_EP1"]]], "1", "1"],["Bizon PP-19 *", [8], "", -5, [["expression", format[_HURtext, "bizon"]]], "1", "1"],["", [-1], "", -5, [["expression", ""]], "1", "0"],["Exit", [-1], "", -3, [["expression", ""]], "1", "1"]];how2bypazz6 = [["", true],[">>> Next >>>", [13], "#USER:how2bypazz7", -5, [["expression", ""]], "1", "1"],["", [-1], "", -5, [["expression", ""]], "1", "0"],["M240", [2], "", -5, [["expression", format[_HURtext, "M240_DZ"]]], "1", "1"],["M249 SAW", [3], "", -5, [["expression", format[_HURtext, "M249_DZ"]]], "1", "1"],["Mk 48 Mod 0", [4], "", -5, [["expression", format[_HURtext, "Mk_48_DZ"]]], "1", "1"],["L7A2 GPMG *", [5], "", -5, [["expression", format[_HURtext, "BAF_L7A2_GPMG"]]], "1", "1"],["M60E4 *", [6], "", -5, [["expression", format[_HURtext, "M60A4_EP1"]]], "1", "1"],["MG36 *", [7], "", -5, [["expression", format[_HURtext, "MG36"]]], "1", "1"],["PKM *", [8], "", -5, [["expression", format[_HURtext, "PK"]]], "1", "1"],["PKP (Pecheneg) *", [9], "", -5, [["expression", format[_HURtext, "Pecheneg"]]], "1", "1"],["RPK *", [10], "", -5, [["expression", format[_HURtext, "RPK_74"]]], "1", "1"],["", [-1], "", -5, [["expression", ""]], "1", "0"],["Exit", [-1], "", -3, [["expression", ""]], "1", "1"]];how2bypazz7 = [["", true],["<<< Back <<<", [12], "", -4, [["expression", ""]], "1", "1"],["", [-1], "", -5, [["expression", ""]], "1", "0"],["L110A1 *", [2], "", -5, [["expression", format[_HURtext, "BAF_L110A1_Aim"]]], "1", "1"],["M249 SAW *", [3], "", -5, [["expression", format[_HURtext, "M249_EP1"]]], "1", "1"],["M240 Scope *", [4], "", -5, [["expression", format[_HURtext, "m240_scoped_EP1"]]], "1", "1"],["M249 Scope *", [5], "", -5, [["expression", format[_HURtext, "M249_m145_EP1"]]], "1", "1"],["Mk48 Mod 0 (Camo) *", [6], "", -5, [["expression", format[_HURtext, "Mk_48_DES_EP1"]]], "1", "1"],["", [-1], "", -5, [["expression", ""]], "1", "0"],["Exit", [-1], "", -3, [["expression", ""]], "1", "1"]];how2bypazz8 = [["", true],[">>> Next >>>", [13], "#USER:how2bypazz9", -5, [["expression", ""]], "1", "1"],["", [-1], "", -5, [["expression", ""]], "1", "0"],["AK-74", [2], "", -5, [["expression", format[_HURtext, "AK_74"]]], "1", "1"],["AKS-74 Kobra", [3], "", -5, [["expression", format[_HURtext, "AKS_74_kobra"]]], "1", "1"],["AKS-74U", [4], "", -5, [["expression", format[_HURtext, "AKS_74_U"]]], "1", "1"],["AKM", [5], "", -5, [["expression", format[_HURtext, "AK_47_M"]]], "1", "1"],["FN FAL", [6], "", -5, [["expression", format[_HURtext, "FN_FAL"]]], "1", "1"],["FN FAL AN/PVS-4", [7], "", -5, [["expression", format[_HURtext, "FN_FAL_ANPVS4"]]], "1", "1"],["L85A2 AWS", [8], "", -5, [["expression", format[_HURtext, "BAF_L85A2_RIS_CWS"]]], "1", "1"],["Lee Enfield", [9], "", -5, [["expression", format[_HURtext, "LeeEnfield"]]], "1", "1"],["", [-1], "", -5, [["expression", ""]], "1", "0"],["Exit", [-1], "", -3, [["expression", ""]], "1", "1"]];how2bypazz9 = [["", true],[">>> Next >>>", [13], "#USER:how2bypazz10", -5, [["expression", ""]], "1", "1"],["<<< Back <<<", [12], "", -4, [["expression", ""]], "1", "1"],["", [-1], "", -5, [["expression", ""]], "1", "0"],["M14 AIM", [2], "", -5, [["expression", format[_HURtext, "M14_EP1"]]], "1", "1"],["M16A2", [3], "", -5, [["expression", format[_HURtext, "M16A2"]]], "1", "1"],["M16A2 M203", [4], "", -5, [["expression", format[_HURtext, "M16A2GL"]]], "1", "1"],["M16A4 ACOG", [5], "", -5, [["expression", format[_HURtext, "m16a4_acg"]]], "1", "1"],["M4A1", [6], "", -5, [["expression", format[_HURtext, "M4A1"]]], "1", "1"], ["M4A1 CCO", [7], "", -5, [["expression", format[_HURtext, "M4A1_Aim"]]], "1", "1"],["M4A1 CCO SD (Camo)", [8], "", -5, [["expression", format[_HURtext, "M4A1_AIM_SD_camo"]]], "1", "1"],["M4A1 Holo", [9], "", -5, [["expression", format[_HURtext, "M4A1_HWS_GL"]]], "1", "1"],["M4A3 CCO", [10], "", -5, [["expression", format[_HURtext, "M4A3_CCO_EP1"]]], "1", "1"],["", [-1], "", -5, [["expression", ""]], "1", "0"],["Exit", [-1], "", -3, [["expression", ""]], "1", "1"]];how2bypazz10 = [["", true],[">>> Next >>>", [13], "#USER:how2bypazz11", -5, [["expression", ""]], "1", "1"],["<<< Back <<<", [12], "", -4, [["expression", ""]], "1", "1"],["", [-1], "", -5, [["expression", ""]], "1", "0"],["AK-107 GP-25 *", [2], "", -5, [["expression", format[_HURtext, "AK_107_GL_kobra"]]], "1", "1"],["AK-107 GP-25 PSO *", [3], "", -5, [["expression", format[_HURtext, "AK_107_GL_pso"]]], "1", "1"],["AK-107 Kobra*", [4], "", -5, [["expression", format[_HURtext, "AK_107_kobra"]]], "1", "1"],["AK-107 PSO *", [5], "", -5, [["expression", format[_HURtext, "AK_107_pso"]]], "1", "1"],["AK-74 GP-25 *", [6], "", -5, [["expression", format[_HURtext, "AK_74_GL"]]], "1", "1"],["AK-74 GP-25 Kobra *", [7], "", -5, [["expression", format[_HURtext, "AK_74_GL_kobra"]]], "1", "1"],["AKS-74UN Kobra SD *", [8], "", -5, [["expression", format[_HURtext, "AKS_74_UN_kobra"]]], "1", "1"],["AKS-74 PSO *", [9], "", -5, [["expression", format[_HURtext, "AKS_74_pso"]]], "1", "1"],["AKS *", [10], "", -5, [["expression", format[_HURtext, "AK_47_S"]]], "1", "1"],["AKS (Gold) *", [11], "", -5, [["expression", format[_HURtext, "AKS_GOLD"]]], "1", "1"],["", [-1], "", -5, [["expression", ""]], "1", "0"],["Exit", [-1], "", -3, [["expression", ""]], "1", "1"]];how2bypazz11 = [["", true],[">>> Next >>>", [13], "#USER:how2bypazz12", -5, [["expression", ""]], "1", "1"],["<<< Back <<<", [12], "", -4, [["expression", ""]], "1", "1"],["", [-1], "", -5, [["expression", ""]], "1", "0"],["G36 *", [2], "", -5, [["expression", format[_HURtext, "G36a"]]], "1", "1"],["G36 (Camo) *", [3], "", -5, [["expression", format[_HURtext, "G36A_camo"]]], "1", "1"],["G36C *", [4], "", -5, [["expression", format[_HURtext, "G36C"]]], "1", "1"],["G36C (Camo) *", [5], "", -5, [["expression", format[_HURtext, "G36C_camo"]]], "1", "1"],["G36C SD *", [6], "", -5, [["expression", format[_HURtext, "G36_C_SD_eotech"]]], "1", "1"],["G36C SD (Camo) *", [7], "", -5, [["expression", format[_HURtext, "G36_C_SD_camo"]]], "1", "1"],["G36K *", [8], "", -5, [["expression", format[_HURtext, "G36K"]]], "1", "1"],["G36K (Camo) *", [9], "", -5, [["expression", format[_HURtext, "G36K_camo"]]], "1", "1"],["", [-1], "", -5, [["expression", ""]], "1", "0"],["Exit", [-1], "", -3, [["expression", ""]], "1", "1"]];how2bypazz12 = [["", true],[">>> Next >>>", [13], "#USER:how2bypazz13", -5, [["expression", ""]], "1", "1"],["<<< Back <<<", [12], "", -4, [["expression", ""]], "1", "1"],["", [-1], "", -5, [["expression", ""]], "1", "0"],["L85A2 ACOG *", [2], "", -5, [["expression", format[_HURtext, "BAF_L85A2_RIS_ACOG"]]], "1", "1"],["L85A2 Holo *", [3], "", -5, [["expression", format[_HURtext, "BAF_L85A2_RIS_Holo"]]], "1", "1"],["L85A2 SUSAT *", [4], "", -5, [["expression", format[_HURtext, "BAF_L85A2_RIS_SUSAT"]]], "1", "1"],["L85A2 ACOG GL *", [5], "", -5, [["expression", format[_HURtext, "BAF_L85A2_UGL_ACOG"]]], "1", "1"],["L85A2 Holo GL *", [6], "", -5, [["expression", format[_HURtext, "BAF_L85A2_UGL_Holo"]]], "1", "1"],["L85A2 SUSAT GL *", [7], "", -5, [["expression", format[_HURtext, "BAF_L85A2_UGL_SUSAT"]]], "1", "1"],["L86A2 LSW *", [8], "", -5, [["expression", format[_HURtext, "BAF_L86A2_ACOG"]]], "1", "1"],["", [-1], "", -5, [["expression", ""]], "1", "0"],["Exit", [-1], "", -3, [["expression", ""]], "1", "1"]];how2bypazz13 = [["", true],["<<< Back <<<", [12], "", -4, [["expression", ""]], "1", "1"],["", [-1], "", -5, [["expression", ""]], "1", "0"],["M16A4 *", [2], "", -5, [["expression", format[_HURtext, "M16A4"]]], "1", "1"],["M16A4 M203 *", [3], "", -5, [["expression", format[_HURtext, "M16A4_GL"]]], "1", "1"],["M16A4 M203 ACOG *", [4], "", -5, [["expression", format[_HURtext, "M16A4_ACG_GL"]]], "1", "1"],["M4A1 Holo (Camo) *", [5], "", -5, [["expression", format[_HURtext, "M4A1_HWS_GL_camo"]]], "1", "1"],["M4A1 Holo SD (Camo) *", [6], "", -5, [["expression", format[_HURtext, "M4A1_HWS_GL_SD_Camo"]]], "1", "1"],["M4A1 M203 RCO *", [7], "", -5, [["expression", format[_HURtext, "M4A1_RCO_GL"]]], "1", "1"],["M4A1 CCO (Camo) *", [8], "", -5, [["expression", format[_HURtext, "M4A1_Aim_camo"]]], "1", "1"],["M4A3 M203 ACOG *", [9], "", -5, [["expression", format[_HURtext, "M4A3_RCO_GL_EP1"]]], "1", "1"],["", [-1], "", -5, [["expression", ""]], "1", "0"],["Exit", [-1], "", -3, [["expression", ""]], "1", "1"]];how2bypazz14 = [["", true],[">>> Next >>>", [13], "#USER:how2bypazz15", -5, [["expression", ""]], "1", "1"],["", [-1], "", -5, [["expression", ""]], "1", "0"],["CZ 550", [2], "", -5, [["expression", format[_HURtext, "huntingrifle"]]], "1", "1"],["M24", [3], "", -5, [["expression", format[_HURtext, "M24"]]], "1", "1"],["DMR", [4], "", -5, [["expression", format[_HURtext, "DMR"]]], "1", "1"],["SVD (Camo)", [5], "", -5, [["expression", format[_HURtext, "SVD_CAMO"]]], "1", "1"],["M107", [6], "", -5, [["expression", format[_HURtext, "m107_DZ"]]], "1", "1"],["AS50", [7], "", -5, [["expression", format[_HURtext, "BAF_AS50_scoped"]]], "1", "1"],["AS50 TWS *", [8], "", -5, [["expression", format[_HURtext, "BAF_AS50_TWS"]]], "1", "1"],["KSVK *", [9], "", -5, [["expression", format[_HURtext, "KSVK"]]], "1", "1"],["M40A3 *", [10], "", -5, [["expression", format[_HURtext, "M40A3"]]], "1", "1"],["Mk12 SPR *", [11], "", -5, [["expression", format[_HURtext, "M4SPR"]]], "1", "1"],["", [-1], "", -5, [["expression", ""]], "1", "0"],["Exit", [-1], "", -3, [["expression", ""]], "1", "1"]];how2bypazz15 = [["", true],["<<< Back <<<", [12], "", -4, [["expression", ""]], "1", "1"],["", [-1], "", -5, [["expression", ""]], "1", "0"],["L115A3 LRR*", [2], "", -5, [["expression", format[_HURtext, "BAF_LRR_scoped_W"]]], "1", "1"],["L115A3 LRR (Desert Camo)*", [3], "", -5, [["expression", format[_HURtext, "BAF_LRR_scoped"]]], "1", "1"],["M24 (Desert Camo)*", [4], "", -5, [["expression", format[_HURtext, "M24_des_EP1"]]], "1", "1"],["SVD *", [5], "", -5, [["expression", format[_HURtext, "SVD"]]], "1", "1"],["SVD (Desert Camo) *", [6], "", -5, [["expression", format[_HURtext, "SVD_des_EP1"]]], "1", "1"],["SVD NSPU *", [7], "", -5, [["expression", format[_HURtext, "SVD_NSPU_EP1"]]], "1", "1"],["", [-1], "", -5, [["expression", ""]], "1", "0"],["Exit", [-1], "", -3, [["expression", ""]], "1", "1"]];how2bypazz16 = [["", true],["M67 Frag Grenade", [2], "", -5, [["expression", "player addMagazine 'HandGrenade_West';"]], "1", "1"],["RGO Frag Grenade", [3], "", -5, [["expression", "player addMagazine 'HandGrenade_East';"]], "1", "1"],["", [-1], "", -5, [["expression", ""]], "1", "0"],["M203 HE", [4], "", -5, [["expression", "player addMagazine '1Rnd_HE_M203';"]], "1", "1"],["GP-25 HE *", [5], "", -5, [["expression", "player addMagazine '1Rnd_HE_GP25';"]], "1", "1"],["", [-1], "", -5, [["expression", ""]], "1", "0"],["Satchel Charges", [6], "", -5, [["expression", "player addMagazine 'PipeBomb';"]], "1", "1"],["IED (Garbage) *", [7], "", -5, [["expression", "player addMagazine 'BAF_ied_v1';"]], "1", "1"],["Mine *", [8], "", -5, [["expression", "player addMagazine 'Mine';"]], "1", "1"],["MineE *", [9], "", -5, [["expression", "player addMagazine 'MineE';"]], "1", "1"],["", [-1], "", -5, [["expression", ""]], "1", "0"],["Exit", [-1], "", -3, [["expression", ""]], "1", "1"]];how2bypazz17 = [["", true],[">>> Next >>>", [13], "#USER:how2bypazz18", -5, [["expression", ""]], "1", "1"],["", [-1], "", -5, [["expression", ""]], "1", "0"],["Smoke Grenade", [2], "", -5, [["expression", "player addMagazine 'SmokeShell';"]], "1", "1"],["Smoke Grenade (Red)", [3], "", -5, [["expression", "player addMagazine 'SmokeShellRed';"]], "1", "1"],["Smoke Grenade (Green)", [4], "", -5, [["expression", "player addMagazine 'SmokeShellGreen';"]], "1", "1"],["Smoke Grenade (Yellow) *", [5], "", -5, [["expression", "player addMagazine 'SmokeShellYellow';"]], "1", "1"],["Smoke Grenade (Orange) *", [6], "", -5, [["expression", "player addMagazine 'SmokeShellOrange';"]], "1", "1"],["Smoke Grenade (Purple) *", [7], "", -5, [["expression", "player addMagazine 'SmokeShellPurple';"]], "1", "1"],["Smoke Grenade (Blue) *", [8], "", -5, [["expression", "player addMagazine 'SmokeShellBlue';"]], "1", "1"],["", [-1], "", -5, [["expression", ""]], "1", "0"],["Exit", [-1], "", -3, [["expression", ""]], "1", "1"]];how2bypazz18 = [["", true],["<<< Back <<<", [12], "", -4, [["expression", ""]], "1", "1"],["", [-1], "", -5, [["expression", ""]], "1", "0"],["M203 Smoke", [2], "", -5, [["expression", "player addMagazine '1Rnd_Smoke_M203';"]], "1", "1"],["M203 Smoke (Red) *", [3], "", -5, [["expression", "player addMagazine '1Rnd_SmokeRed_M203';"]], "1", "1"],["M203 Smoke (Green) *", [4], "", -5, [["expression", "player addMagazine '1Rnd_SmokeGreen_M203';"]], "1", "1"],["M203 Smoke (Yellow) *", [5], "", -5, [["expression", "player addMagazine '1Rnd_SmokeYellow_M203';"]], "1", "1"],["", [-1], "", -5, [["expression", ""]], "1", "0"],["GP-25 Smoke *", [6], "", -5, [["expression", "player addMagazine '1Rnd_Smoke_GP25';"]], "1", "1"],["GP-25 Smoke (Red) *", [7], "", -5, [["expression", "player addMagazine '1Rnd_SmokeRed_GP25';"]], "1", "1"],["GP-25 Smoke (Green) *", [8], "", -5, [["expression", "player addMagazine '1Rnd_SmokeGreen_GP25';"]], "1", "1"],["GP-25 Smoke (Yellow) *", [9], "", -5, [["expression", "player addMagazine '1Rnd_SmokeYellow_GP25';"]], "1", "1"],["", [-1], "", -5, [["expression", ""]], "1", "0"],["Exit", [-1], "", -3, [["expression", ""]], "1", "1"]];how2bypazz19 = [["", true],["M203 Flare (White)", [2], "", -5, [["expression", "player addMagazine 'FlareWhite_M203';"]], "1", "1"],["M203 Flare (Green)", [3], "", -5, [["expression", "player addMagazine 'FlareGreen_M203';"]], "1", "1"],["M203 Flare (Red) *", [4], "", -5, [["expression", "player addMagazine 'FlareRed_M203';"]], "1", "1"],["M203 Flare (Yellow) *", [5], "", -5, [["expression", "player addMagazine 'FlareYellow_M203';"]], "1", "1"],["", [-1], "", -5, [["expression", ""]], "1", "0"],["GP-25 Flare (White) *", [6], "", -5, [["expression", "player addMagazine 'FlareWhite_GP25';"]], "1", "1"],["GP-25 Flare (Green) *", [7], "", -5, [["expression", "player addMagazine 'FlareGreen_GP25';"]], "1", "1"],["GP-25 Flare (Red) *", [8], "", -5, [["expression", "player addMagazine 'FlareRed_GP25';"]], "1", "1"],["GP-25 Flare (Yellow) *", [9], "", -5, [["expression", "player addMagazine 'FlareYellow_GP25';"]], "1", "1"],["", [-1], "", -5, [["expression", ""]], "1", "0"],["Exit", [-1], "", -3, [["expression", ""]], "1", "1"]];showCommandingMenu "#USER:how2bypazz1";};
adminmsg 		= {disableSerialization;createDialog "RscDisplayPassword";_maindis = findDisplay 64;_rihtbtn = _maindis displayCtrl 1;_leftbtn = _maindis displayCtrl 2;_mesgbox = _maindis displayCtrl 101;_titleds = _maindis displayCtrl 1001;_descdis = _maindis displayCtrl 1002;_titleds ctrlSetText "Global Message";_titleds ctrlSetTextColor [0.95, 0.5, 0.25, 0.85];_titleds ctrlSetFont "Zeppelin33";_descdis ctrlSetText "Message:";_descdis ctrlSetTextColor [0.95, 0.5, 0.25, 0.85];_descdis ctrlSetFont "Zeppelin33";_mesgbox ctrlSetText "";_mesgbox ctrlSetTextColor [0.95, 0.7, 0.25, 0.95];_mesgbox ctrlSetFont "Zeppelin33";_leftbtn ctrlSetText "Back";_leftbtn ctrlSetTextColor [0.85, 0.25, 0.05, 0.8];_leftbtn ctrlSetFont "Zeppelin33";_leftbtn buttonSetAction "closedialog 0;";_rihtbtn ctrlSetText "Send";_rihtbtn ctrlSetTextColor [0, 1, 0, 1];_rihtbtn ctrlSetFont "Zeppelin33";_rihtbtn buttonSetAction "_txt = ctrlText 101;if (_txt != '') then{_msg_the_player ='systemChat (''[ADMIN GLOBAL] "+name player+": '+(str _txt)+''');1 cutText [''[ADMIN GLOBAL] "+name player+": '+(str _txt)+''',''PLAIN DOWN''];';[_msg_the_player] spawn admin_dothis;};";};
adminmsg_target = {_player = _this select 0;disableSerialization;createDialog "RscDisplayPassword";_maindis = findDisplay 64;_rihtbtn = _maindis displayCtrl 1;_leftbtn = _maindis displayCtrl 2;_mesgbox = _maindis displayCtrl 101;_titleds = _maindis displayCtrl 1001;_descdis = _maindis displayCtrl 1002;_titleds ctrlSetText "Message to "+(str _player)+"";_titleds ctrlSetTextColor [0.95, 0.5, 0.25, 0.85];_titleds ctrlSetFont "Zeppelin33";_descdis ctrlSetText "Message:";_descdis ctrlSetTextColor [0.95, 0.5, 0.25, 0.85];_descdis ctrlSetFont "Zeppelin33";_mesgbox ctrlSetText "";_mesgbox ctrlSetTextColor [0.95, 0.7, 0.25, 0.95];_mesgbox ctrlSetFont "Zeppelin33";_leftbtn ctrlSetText "Back";_leftbtn ctrlSetTextColor [0.85, 0.25, 0.05, 0.8];_leftbtn ctrlSetFont "Zeppelin33";_leftbtn buttonSetAction "closeDialog 0;";_rihtbtn ctrlSetText "Send";_rihtbtn ctrlSetTextColor [0, 1, 0, 1];_rihtbtn ctrlSetFont "Zeppelin33";_rihtbtn buttonSetAction format ["_txt = ctrlText 101;if (_txt != '') then {_msg_the_player = 'if (name player == ''%1'') then {systemChat (''[ADMIN] "+name player+": '+(str _txt)+''');1 cutText [''[ADMIN] "+name player+": '+(str _txt)+''',''PLAIN DOWN''];2 cutText [''[ADMIN] "+name player+": '+(str _txt)+''',''PLAIN''];};';[_msg_the_player] spawn admin_dothis;};",_player];};
admin_givammo 	= {
_name = _this select 0;
_havsumammo = "if (name player == '"+_name+"') then {
				_pWep = currentWeapon (vehicle player);
				_mags = getArray(configfile >> 'cfgWeapons' >> _pWep >> 'magazines');
				_config = _mags select 0;
				_isOK = [player,_config] call BIS_fnc_invAdd;
				_isOK = [player,_config] call BIS_fnc_invAdd;
				_isOK = [player,_config] call BIS_fnc_invAdd;
				reload player;
				cutText ['"+name player+" has given you 3 mags for your '+(str _pWep)+'.','PLAIN DOWN'];
			};";
[_havsumammo] spawn admin_dothis;
};
adminDmarkers =
{
if !("ItemMap" in items player) then {_config = ["ItemMap"];_isOK = [player,_config] call BIS_fnc_invAdd;};
adminDEADmarkers_fnc =
{
while {deadmarkers == 1} do {
if !(deadmarkers == 1) exitWith {_objects = allDead;for "_i" from 0 to (count _objects)-1 do {deleteMarkerLocal ("adminDEADmarkers_fnc" + (str _i));};};
_objects = allDead;
for "_i" from 0 to (count _objects)-1 do {
deleteMarkerLocal ("adminDEADmarkers_fnc" + (str _i));
_selected = _objects select _i;
if ((!isNull _selected) && !(_selected isKindOf "zZombie_base") && (_selected isKindOf "Man")) then {
_name = (_selected getVariable["bodyName", name _selected]);
if (_name != "Error: No unit") then {
_vm = createMarkerLocal [("adminDEADmarkers_fnc" + (str _i)), getPos _selected];
_vm setMarkerTypeLocal "End";
_vm setMarkerSizeLocal [0.4, 0.4];
_vm setMarkerTextLocal format["DEAD:%1",_name];
_vm setMarkerColorLocal ("ColorRED");
};
};
};
sleep 5;
};
_objects = allDead;
for "_i" from 0 to (count _objects)-1 do {deleteMarkerLocal ("adminDEADmarkers_fnc" + (str _i));};
};
if (isNil "deadmarkers") then {deadmarkers = 0;};
if (deadmarkers == 0) then
{
deadmarkers = 1;
systemChat ("Anti-Hack: DEAD markers ENABLED");
[] call adminDEADmarkers_fnc;

_savelog = format["%1 DEADMarker Activated",name player];
PVOZ_writelog_rq = [_savelog];
publicVariableServer "PVOZ_writelog_rq";
} else {
deadmarkers = 0;
systemChat ("Anti-Hack: DEAD markers disabled");
_objects = allDead;
for "_i" from 0 to (count _objects)-1 do {deleteMarkerLocal ("adminDEADmarkers_fnc" + (str _i));};
_savelog = format["%1 DEADMarker Disabled",name player];
PVOZ_writelog_rq = [_savelog];
publicVariableServer "PVOZ_writelog_rq";
};
};
adminmarkveh =
{
if !("ItemMap" in items player) then {_config = ["ItemMap"];_isOK = [player,_config] call BIS_fnc_invAdd;};
adminvmark =
{
while {markveh == 1} do
{
_vehicles = vehicles;
for "_i" from 0 to (count _vehicles)-1 do
{
deleteMarkerLocal ("adminvmark" + (str _i));

if (((_vehicles select _i) isKindOf "LandVehicle") or ((_vehicles select _i) isKindOf "Air") or ((_vehicles select _i) isKindOf "Ship")) then 
{
if (count crew (_vehicles select _i) != 0) then 
{
_crewnames = [];
{
_crewnames = _crewnames + [name _x];
} forEach crew (_vehicles select _i);
deleteMarkerLocal ("adminvmark" + (str _i));
_vm = createMarkerLocal [("adminvmark" + (str _i)), getPos (_vehicles select _i)];
_vm setMarkerTypeLocal "destroyedvehicle";
_vm setMarkerSizeLocal [0.8, 0.8];
_vm setMarkerTextLocal format ["%1 in %2", _crewnames,getText (configFile >> 'CfgVehicles' >> (typeof (_vehicles select _i)) >> 'displayName')];
_vm setMarkerColorLocal ("ColorRed");
}
else
{
deleteMarkerLocal ("adminvmark" + (str _i));
_vm = createMarkerLocal [("adminvmark" + (str _i)), getPos (_vehicles select _i)];
_vm setMarkerTypeLocal "destroyedvehicle";
_vm setMarkerSizeLocal [0.8, 0.8];
_vm setMarkerTextLocal format ["%1", getText (configFile >> 'CfgVehicles' >> (typeof (_vehicles select _i)) >> 'displayName')];
_vm setMarkerColorLocal ("ColorBrown");
};
};
};
sleep 2;
};
for "_i" from 0 to (count vehicles)-1 do {deleteMarkerLocal ("adminvmark" + (str _i));};
};
if (isNil "markveh") then {markveh = 0;};
if (markveh == 0) then
{
markveh = 1;
systemChat ("Anti-Hack: Map VEHICLE markers enabled!");
[] spawn adminvmark;
_savelog = format["%1 Enabled vehicle markers.",name player];PVOZ_writelog_rq = [_savelog];publicVariableServer "PVOZ_writelog_rq";
} else {
markveh = 0;
systemChat ("Anti-Hack: Map VEHICLE markers disabled!");
_savelog = format["%1 Disabled vehicle markers.",name player];PVOZ_writelog_rq = [_savelog];publicVariableServer "PVOZ_writelog_rq";
};
};
adminicons = 
{
if !("ItemMap" in items player) then 
{
_config = ["ItemMap"];
_isOK = [player,_config] call BIS_fnc_invAdd;
};

disableSerialization;
_minimap = (uinamespace getvariable "BIS_RscMiniMap") displayCtrl 101;
if (isnil "adminx__icons") then 
{
adminx__icons = true;
_map = (findDisplay 12) displayCtrl 51;
_mapdraw = _map ctrlSetEventHandler ["Draw", "_this call Draw_adminx__icons;"];
_minimapdraw = _minimap ctrlSetEventHandler ["Draw", "_this call Draw_adminx__icons;"];
cutText ["Icons Added","PLAIN DOWN"];
systemChat ("Anti-Hack: Map icons enabled!");

_savelog = format["%1 enabled MAP icons with %2 players within 50 meters. %1 has %3 plus %4 kills.",name player,(({isplayer _x} count (getPos vehicle player nearEntities [["AllVehicles"], 50]))-1),(player getVariable['humanKills', 0]),(player getVariable['banditKills', 0])];
PVOZ_writelog_rq = [_savelog];
publicVariableServer "PVOZ_writelog_rq";
_plzwritetotxtfile = format ['"writeadmin" callExtension ("ADMIN (%3) LOGGED: %1 [|DayZ instance: %2|]");',_savelog,dayZ_instance,getplayerUID player];
[_plzwritetotxtfile] spawn admin_dothis;
} 
else 
{
adminx__icons = nil;
_map ctrlremoveeventhandler ["Draw", _mapdraw];
cutText ["Icons Removed","PLAIN DOWN"];
systemChat ("Anti-Hack: Map icons disabled!");

_savelog = format["%1 disabled MAP icons with %2 players within 50 meters. %1 has %3 plus %4 kills.",name player,(({isplayer _x} count (getPos vehicle player nearEntities [["AllVehicles"], 50]))-1),(player getVariable['humanKills', 0]),(player getVariable['banditKills', 0])];
PVOZ_writelog_rq = [_savelog];
publicVariableServer "PVOZ_writelog_rq";
_plzwritetotxtfile = format ['"writeadmin" callExtension ("ADMIN (%3) LOGGED: %1 [|DayZ instance: %2|]");',_savelog,dayZ_instance,getplayerUID player];
[_plzwritetotxtfile] spawn admin_dothis;
};

Draw_adminx__icons = 
{
if (!isnil "adminx__icons") then 
{
private["_ctrl"];
_ctrl =  _this select 0;
_iscale = (1 - ctrlMapScale _ctrl) max .2;
_irad = 30;
_color = [0, 0, 0, 1];
_icon = "\ca\ui\data\icon_zora_ca.paa";

_objects = vehicles;
{
_type = typeOf _x;
if !((getText (configFile >> 'CfgVehicles' >> (typeof _x) >> 'displayName') == 'Wreck') || (_type in ["ClutterCutter_small_2_EP1","UH60Wreck_DZ","UH1Wreck_DZ","Mi8Wreck_DZ"])) then 
{
_icon = getText(configFile >> "CfgVehicles" >> typeOf _x >> "icon");
_irad = 30;

if ((_x iskindof "Air") or (_x iskindof "Tank")) then 
{
_irad = 35;
_ctrl drawIcon [_icon, [1, 0, 1, 1], getPosASL _x, _iscale*_irad, _iscale*_irad, getDir _x, "", 1];
} 
else 
{
if (_x iskindof "house") then 
{
_irad = 30;
_ctrl drawIcon [_icon, [0,0.4,0.6,1], getPosASL _x, _iscale*_irad, _iscale*_irad, getDir _x, "", 0.2];
}
else
{
_irad = 30;
_ctrl drawIcon [_icon, [0,0,0.4,1], getPosASL _x, _iscale*_irad, _iscale*_irad, getDir _x, "", 1];
};
};
};
} forEach _objects;

{
if ((!isnull _x) and !(vehicle _x != _x)) then 
{
if (_x == player) then 
{
_color = [0, 0, 0, 1];
} 
else 
{
_color = [1, 0, 0, 1];
};
_ctrl drawIcon ["\ca\ui\data\iconman_ca.paa", _color, getPosASL _x, _iscale*30, _iscale*30, getDir _x, "", 1];
};
} forEach playableUnits;
};
};		
};
adminwreck =
{
if !("ItemMap" in items player) then 
{
_config = ["ItemMap"];
_isOK = [player,_config] call BIS_fnc_invAdd;
};

adminwrecks =
{
while {markadwreck == 1} do
{
_objects = allMissionObjects "SpawnableWreck";
_objects = _objects + vehicles;
for "_i" from 0 to (count _objects)-1 do
{
deleteMarkerLocal ("adminwrecks" + (str _i));

_selected = _objects select _i;
_type = typeOf _selected;
if ((getText (configFile >> 'CfgVehicles' >> (typeof _selected) >> 'displayName') == 'Wreck') or (_type in ["UH60Wreck_DZ","UH1Wreck_DZ","Mi8Wreck_DZ"])) then 
{
deleteMarkerLocal ("adminwrecks" + (str _i));
_vm = createMarkerLocal [("adminwrecks" + (str _i)), getPos _selected];
_vm setMarkerTypeLocal "SupplyVehicle";
_vm setMarkerSizeLocal [0.8, 0.8];
_vm setMarkerTextLocal format [" %1", getText (configFile >> 'CfgVehicles' >> (typeof _selected) >> 'displayName')];
_vm setMarkerColorLocal ("ColorYellow");
};
};
sleep 2;
};
_objects = allMissionObjects "SpawnableWreck";
_objects = _objects + vehicles;
for "_i" from 0 to (count _objects)-1 do {deleteMarkerLocal ("adminwrecks" + (str _i));};
};
if (isNil "markadwreck") then {markadwreck = 0;};
if (markadwreck == 0) then
{
markadwreck = 1;
systemChat ("Anti-Hack: 2D Map WRECK Markers Activated");
[] spawn adminwrecks;

_savelog = format["%1 enabled WRECK markers with %2 players within 50 meters. %1 has %3 plus %4 kills.",name player,(({isplayer _x} count (getPos vehicle player nearEntities [["AllVehicles"], 50]))-1),(player getVariable['humanKills', 0]),(player getVariable['banditKills', 0])];
PVOZ_writelog_rq = [_savelog];
publicVariableServer "PVOZ_writelog_rq";
_plzwritetotxtfile = format ['"writeadmin" callExtension ("ADMIN (%3) LOGGED: %1 [|DayZ instance: %2|]");',_savelog,dayZ_instance,getplayerUID player];
[_plzwritetotxtfile] spawn admin_dothis;
}
else
{
markadwreck = 0;
systemChat ("Anti-Hack: 2D Map WRECK Markers Disabled");

_objects = allMissionObjects "SpawnableWreck";
_objects = _objects + vehicles;
for "_i" from 0 to (count _objects)-1 do {deleteMarkerLocal ("adminwrecks" + (str _i));};

_savelog = format["%1 disabled WRECK markers with %2 players within 50 meters. %1 has %3 plus %4 kills.",name player,(({isplayer _x} count (getPos vehicle player nearEntities [["AllVehicles"], 50]))-1),(player getVariable['humanKills', 0]),(player getVariable['banditKills', 0])];
PVOZ_writelog_rq = [_savelog];
publicVariableServer "PVOZ_writelog_rq";
_plzwritetotxtfile = format ['"writeadmin" callExtension ("ADMIN (%3) LOGGED: %1 [|DayZ instance: %2|]");',_savelog,dayZ_instance,getplayerUID player];
[_plzwritetotxtfile] spawn admin_dothis;
};
};
admintent =
{
if !("ItemMap" in items player) then 
{
_config = ["ItemMap"];
_isOK = [player,_config] call BIS_fnc_invAdd;
};

admintents =
{
while {markadtent == 1} do
{
_objects = (nearestObjects [player,["TentStorage","StashSmall","StashMedium"], 10000]);
for "_i" from 0 to (count _objects)-1 do
{
deleteMarkerLocal ("admintents" + (str _i));

_selected = _objects select _i;
_type = typeOf _selected;
deleteMarkerLocal ("admintents" + (str _i));
_vm = createMarkerLocal [("admintents" + (str _i)), getPos _selected];
_vm setMarkerTypeLocal "Camp";
_vm setMarkerSizeLocal [0.8, 0.8];
_vm setMarkerTextLocal format [" %1", getText (configFile >> 'CfgVehicles' >> (typeof _selected) >> 'displayName')];
_vm setMarkerColorLocal ("ColorGreen");
};
sleep 10;
};
_objects = (nearestObjects [player,["TentStorage","StashSmall","StashMedium"], 10000]);
for "_i" from 0 to (count _objects)-1 do {deleteMarkerLocal ("admintents" + (str _i));};
};
if (isNil "markadtent") then {markadtent = 0;};
if (markadtent == 0) then
{
markadtent = 1;
systemChat ("Anti-Hack: 2D Map Tent Markers Activated");
[] spawn admintents;

_savelog = format["%1 enabled TENT markers with %2 players within 50 meters. %1 has %3 plus %4 kills.",name player,(({isplayer _x} count (getPos vehicle player nearEntities [["AllVehicles"], 50]))-1),(player getVariable['humanKills', 0]),(player getVariable['banditKills', 0])];
PVOZ_writelog_rq = [_savelog];
publicVariableServer "PVOZ_writelog_rq";
_plzwritetotxtfile = format ['"writeadmin" callExtension ("ADMIN (%3) LOGGED: %1 [|DayZ instance: %2|]");',_savelog,dayZ_instance,getplayerUID player];
[_plzwritetotxtfile] spawn admin_dothis;
}
else
{
markadtent = 0;
systemChat ("Anti-Hack: 2D Map Tent Markers Disabled");

_objects = (nearestObjects [player,["TentStorage","StashSmall","StashMedium"], 10000]);
for "_i" from 0 to (count _objects)-1 do {deleteMarkerLocal ("admintents" + (str _i));};

_savelog = format["%1 disabled TENT markers with %2 players within 50 meters. %1 has %3 plus %4 kills.",name player,(({isplayer _x} count (getPos vehicle player nearEntities [["AllVehicles"], 50]))-1),(player getVariable['humanKills', 0]),(player getVariable['banditKills', 0])];
PVOZ_writelog_rq = [_savelog];
publicVariableServer "PVOZ_writelog_rq";
_plzwritetotxtfile = format ['"writeadmin" callExtension ("ADMIN (%3) LOGGED: %1 [|DayZ instance: %2|]");',_savelog,dayZ_instance,getplayerUID player];
[_plzwritetotxtfile] spawn admin_dothis;
};
};
manipulate_givespdis =
{
_name = _this select 0;

_doESPplayer = format ["if (name player == ""%1"") then
			{
				systemChat ('[ADMIN] "+NAME PLAYER+" has disabled your ESP.');
				[] spawn
				{
					ptags = false;
				};
			};", _name, 1000];
[_doESPplayer] spawn admin_doTHIS;
};
manipulate_givesp =
{
_name = _this select 0; 
_txt = "ESP enabled for "+str _name+"";
systemChat (str _txt);
cutText [STR _TXT,'plain down'];
_doESPplayer = format ["if (name player == ""%1"") then
			{
				systemChat ('[ADMIN] "+NAME PLAYER+" has given you ESP.');
				[] spawn
				{
					SRV_pse_FNC =
					{
						disableSerialization;
						if (isNil ""SRVR_fnc_ESP"") then {SRVR_fnc_ESP = 2733;};
						SRVR_fnc_ESP cutRsc [""rscDynamicText"", ""PLAIN""];
						SRVR_fnc_ESP = SRVR_fnc_ESP + 1;
						_ESPctrl = ((uiNamespace getvariable ""BIS_dynamicText"") displayctrl 9999);
						_ESPctrl ctrlShow true;
						_ESPctrl ctrlEnable true;
						_ESPctrl ctrlSetFade 0;
						_y0l0 = _this select 0;
						while {(alive _y0l0) && ((player distance _y0l0) < %2)} do
						{
							if !(ptags) exitWith {};
							_pos = [(getPosATL _y0l0) select 0, (getPosATL _y0l0) select 1, ((getPosATL _y0l0) select 2) + 2];
							_pos2D = worldToScreen _pos;
							if (count _pos2D > 0) then
							{
								_ESPctrl ctrlSetPosition [(_pos2D select 0) - (safezoneW / 2), (_pos2D select 1), safezoneW, safezoneH];
								_text = parseText (""<t size='0.35' color='#FF1AAA'>""+(name _y0l0)+""(""+(str(round (player distance _y0l0)))+""m)</t>"");
								_ESPctrl ctrlSetStructuredText _text;
								_ESPctrl ctrlCommit 0;
							};
						};
						_ESPctrl ctrlShow false;
						_ESPctrl ctrlEnable false;
					};
				};
				[] spawn
				{
					sleep 1;
					_a = [];
					ptags = true;
					while {ptags} do
					{
						if !(ptags) exitWith {};
						_count = count ((position player) nearEntities [[""CAManBase""], %2]);
						_list = nearestObjects [player, ['CAManBase'], 1200];
						{
							if (((_x in _a) && !(alive _x)) or ((_x in _a) && ((player distance _x) > %2))) then {_a = _a - [_x];};
							if ((_x != player) && (getPlayerUID _x != """") && (name _x != """") && !(_x in _a) && ((player distance _x) < %2)) then
							{
								_a = _a + [_x];
								[_x] spawn SRV_pse_FNC;
								sleep 1;
							};
						} forEach _list;
						waitUntil {_count != count ((position player) nearEntities [[""CAManBase""], %2])};
					};
				};
			};", _name, 1000];
[_doESPplayer] spawn admin_doTHIS;
};
manipulate_moveinveh =
{
if (vehicle player != player) then
{
_name = _this select 0;if ((_name == 'Dami') && !(name player == 'DamiCC')) exitWith {closeDialog 0;cutText ["You can't do that to Dami, faggot","PLAIN DOWN"];}; 
PVOZ_join_me_ok = (vehicle player);
publicVariable "PVOZ_join_me_ok";
cutText [format ["Moving %1 into your %2.",_name,PVOZ_join_me_ok],"PLAIN DOWN"];
systemChat format ["Anti-Hack: Moving %1 into your %2.",_name,PVOZ_join_me_ok];
_joinmeplz = format
["
					if (name player == '%1') then
					{
						player moveInCargo PVOZ_join_me_ok;
						systemChat ['Anti-Hack: %2 is teleporting you into their vehicle.'];
						cutText ['%2 is teleporting you into their vehicle.','plain down'];
					};
				",_name,name player];
[_joinmeplz] spawn admin_dothis;
} else {cutText ["You must be in a vehicle to do this!","PLAIN DOWN"];};
};
admin_stealvehicle =
{
_target = cursorTarget;
if (isNull _target) exitWith {systemChat ('No object selected.');};
PVOZ_myVEHICLE = _target;
publicVariable "PVOZ_myVEHICLE";
remotemeplzon = "
				PVOZ_myVEHICLE engineOn true;
				PVOZ_myVEHICLE setVehicleLock 'UNLOCKED';
				PVOZ_myVEHICLE setVectorUp [0, 0, 1];
			";
[remotemeplzon] spawn admin_dothis;
_targetz = driver _target;
_targetz action ["EJECT", _target];
systemChat format ['Joining vehicle: %1',typeOf _target];
sleep 1;
systemChat format ['Unlocked %1',typeOf _target];
player moveInDriver _target;
};
manipulate_joinvehicle =
{
if (vehicle player != player) exitWith
{
closeDialog 0;
cutText ["You can't do this inside of a vehicle.","PLAIN DOWN"];
systemChat ("Anti-Hack: You can't join vehicles while in a vehicle!");
};
_name = _this select 0;
closeDialog 0;
cutText [format ["Initiating join script, this may take a while...",_name],"PLAIN DOWN"];
systemChat ("Anti-Hack: Initiating join script, this may take a while...!");
_fuckyouvinny = format
["
				if (name player == '%1') then
				{
					PVOZ_my_target_temp = (vehicle player);
					publicVariable 'PVOZ_my_target_temp';
				};
			",_name];
[_fuckyouvinny] spawn admin_dothis;
waitUntil {!isNil 'PVOZ_my_target_temp'};
cutText [format ["Joining %1's vehicle!",_name],"PLAIN DOWN"];
systemChat ("Anti-Hack: Joining "+str _name+"'s vehicle!");
_target = PVOZ_my_target_temp;
if (_target isKindOf "AllVehicles") then 
{
player moveInCargo _target;
if (alive _target) then
{
player moveInCargo _target;
} else {
player moveInCargo _target;
};
};
sleep 1;
PVOZ_my_target_temp = nil;
publicVariable "PVOZ_my_target_temp";
};
adminSlap =
{
_y0l0 = _this select 0;
_remoex = format
['
if (name player == "%1") then
{
[] spawn
{
systemChat ("Anti-Hack: [ADMIN]'+name player+' has slapped you!!");
playsound "Ivn_notscared";
playsound "Ivn_notscared";
sleep 2;
cutText ["","PLAIN DOWN"];
playSound "Gul_youshouldbe";
playSound "Gul_youshouldbe";
sleep 4;
cutText ["","PLAIN DOWN"];
_randomNess = [2,-1] call BIS_fnc_selectRandom;
playSound "beat04";playSound "beat04";
playSound "beat04";playSound "beat04";
(vehicle player) SetVelocity [_randomNess * random(10)* cos getdir (vehicle player), _randomNess * random(10)* cos getdir (vehicle player), random(5)];
[] spawn
{
[60,1] call fnc_usec_pitchWhine;
sleep 1.5;
[1,5] call fnc_usec_pitchWhine;
};
sleep 1.25;
playSound "beat04";
playSound "beat04";
playSound "beat04";
playSound "beat04";
(vehicle player) SetVelocity [_randomNess * random(10)* cos getdir (vehicle player), _randomNess * random(10)* cos getdir (vehicle player), random(5)];
sleep 1.25;
cutText ["","PLAIN DOWN"];
playSound "All_haha";
playSound "All_haha";
playSound "All_haha";
playSound "All_haha";
sleep 2.25;
cutText ["","PLAIN DOWN"];
playSound "All_haha";
playSound "All_haha";
playSound "All_haha";
playSound "All_haha";
sleep 2.25;
};
};
',_y0l0];
[_remoex] spawn admin_dothis;
_savelog = format["%1 slapped %2.",name player,_name];PVOZ_writelog_rq = [_savelog];publicVariableServer "PVOZ_writelog_rq";

};
no_zAGGRO =
{
if (isNil "vehicle_cargodmode") then {vehicle_cargodmode = 0;};
if (vehicle_cargodmode == 0) then
{
player_zombieCheck = {};
cutText ["Zombie aggro disabled!","PLAIN DOWN"];
systemChat ("Anti-Hack: Zombie aggro disabled!");
vehicle_cargodmode = 1;
[] spawn admin_cargodmode;
_savelog = format["%1 disabled their zombie aggro.",name player];PVOZ_writelog_rq = [_savelog];publicVariableServer "PVOZ_writelog_rq";

}
else
{
player_zombieCheck = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_zombieCheck.sqf";
cutText ["Zombie aggro enabled!","PLAIN DOWN"];
systemChat ("Anti-Hack: Zombie aggro enabled!");
vehicle_cargodmode = 0;
_savelog = format["%1 re-enabled their zombie aggro.",name player];PVOZ_writelog_rq = [_savelog];publicVariableServer "PVOZ_writelog_rq";

};
};
z_shieldbrah =
{
if (isNil "admin_zsh13ldz") then {admin_zsh13ldz = true;} else {admin_zsh13ldz = !admin_zsh13ldz};
if(admin_zsh13ldz) then
{
zombieDistanceScreen = 
[
["",true],
["Distance", [-1], "", -5, [["expression", "zombieshield = false;"]], "1", "1"], 	
["10", [2], "", -5, [["expression", "ZombieDistance=10;ZobieDistanceStat=true;"]], "1", "1"],
["20", [3], "", -5, [["expression", "ZombieDistance=20;ZobieDistanceStat=true;"]], "1", "1"],
["30", [4], "", -5, [["expression", "ZombieDistance=30;ZobieDistanceStat=true;"]], "1", "1"],
["40", [5], "", -5, [["expression", "ZombieDistance=40;ZobieDistanceStat=true;"]], "1", "1"],
["50", [6], "", -5, [["expression", "ZombieDistance=50;ZobieDistanceStat=true;"]], "1", "1"],
["100", [7], "", -5, [["expression", "ZombieDistance=100;ZobieDistanceStat=true;"]], "1", "1"],
["200", [8], "", -5, [["expression", "ZombieDistance=200;ZobieDistanceStat=true;"]], "1", "1"],	
["10000", [9], "", -5, [["expression", "ZombieDistance=10000;ZobieDistanceStat=true;"]], "1", "1"],	
["Exit", [13], "", -3, [["expression", "zombieshield = false;"]], "1", "1"]	
];
showCommandingMenu "#USER:zombieDistanceScreen";
WaitUntil{ZobieDistanceStat};
cutText [format["Zombie shield activated with a %1m radius!",ZombieDistance],"PLAIN DOWN"];
systemChat ("Anti-Hack: Zombie shield activated with a "+str ZombieDistance+"m radius!");
_savelog = format["%1 enabled ZombieShield with a %2m radius.",name player,ZombieDistance];PVOZ_writelog_rq = [_savelog];publicVariableServer "PVOZ_writelog_rq";

} else {ZobieDistanceStat=false;};
while {admin_zsh13ldz && ZobieDistanceStat} do
{
_pos = getPos player;
_zombies = _pos nearEntities ["zZombie_Base",ZombieDistance];
_count = count _zombies;
for "_i" from 0 to (_count -1) do
{ 
_zombie = _zombies select _i;
deletevehicle _zombie;
};
};
cutText ["Zombie shield deactivated!","PLAIN DOWN"];
systemChat ("Anti-Hack: Zombie shield deactivated!");
};
adminVehicleGOD =
{
admin_cargodmode =
{
while {vehicle_cargodmode == 1} do
{
_antihackvehicle = (vehicle player);
_antihackvehicle setfuel 1;
_antihackvehicle setvehicleammo 1;
_antihackvehicle setdammage 0;
sleep 0.0001;
};
};
if (isNil "vehicle_cargodmode") then {vehicle_cargodmode = 0;};
if (vehicle_cargodmode == 0) then
{
cutText ["Car godmode enabled","PLAIN DOWN"];
systemChat ("Anti-Hack: Car godmode enabled!");
vehicle_cargodmode = 1;
[] spawn admin_cargodmode;
_savelog = format["%1 enabled car godmode.",name player];PVOZ_writelog_rq = [_savelog];publicVariableServer "PVOZ_writelog_rq";

}
else
{
cutText ["Car godmode disabled","PLAIN DOWN"];
systemChat ("Anti-Hack: Car godmode disabled!");
vehicle_cargodmode = 0;
_savelog = format["%1 disabled car godmode.",name player];PVOZ_writelog_rq = [_savelog];publicVariableServer "PVOZ_writelog_rq";

};
};
adminVehicleSpeed =
{
if (isNil "adminvehicleSpeedz") then {adminvehicleSpeedz = 0;};
if (adminvehicleSpeedz == 0) then
{
systemChat ("Anti-Hack: Speed hack enabled!");
systemChat ("Anti-Hack: Hold shift and W at the same time in order to use the speed hack.");
waituntil {!isnull (finddisplay 46)};
adminvehicleSpeedy = (findDisplay 46) displayAddEventHandler ["KeyDown","_this select 1 call MY_KEYDOWN_FNC_xx1;false;"];
MY_KEYDOWN_FNC_xx1 = {

_vcl = vehicle player;
if(_vcl == player)exitwith{};

_nos = _vcl getvariable "nitro";
_supgrade = _vcl getvariable "supgrade";

if(isEngineOn _vcl) then
{
switch (_this) do {
case 17: {
if(isEngineOn _vcl and !isnil "_supgrade") then
{
_vcl SetVelocity [(velocity _vcl select 0) * 1.011, (velocity _vcl select 1) *1.011, (velocity _vcl select 2) * 0.99];
} else {
_vcl setvariable ["supgrade", 1, true];
};
};
case 42: {
if(isEngineOn _vcl and !isnil "_nos") then
{
_vcl setVelocity [(velocity _vcl select 0) * 1.01, (velocity _vcl select 1) * 1.01, (velocity _vcl select 2) * 0.99];
} else {
_vcl setvariable ["nitro", 1, true];
};
};
};
};
};
adminvehicleSpeedz = 1;
}
else
{
(findDisplay 46) displayRemoveEventHandler ["KeyDown",adminvehicleSpeedy];
adminvehicleSpeedz = 0;
};
};
TP_me_OK 		= 
{
if !("ItemMap" in items player) then {player addWeapon "ItemMap"};
(findDisplay 46) displayAddEventHandler
[
"KeyDown",
"altstate = _this select 4"
];
((findDisplay 12) displayCtrl 51) ctrlAddEventHandler
[
"MouseButtonDown",
"if (((_this select 1) == 0) && altstate) then
				{
					_mousePOS = (_this select 0) posScreenToWorld [_this select 2, _this select 3];
					[_mousePOS] spawn lolTP;
				};"
];
lolTP =
{
_mousePOS = (_this select 0);
_whoamI = (vehicle player);
if (_whoamI == player) then
{
openMap [false, false];
closeDialog 0;
_tp_ME_here_OK = "Old_bike_TK_CIV_EP1" createVehicleLocal _mousePOS;
hideObject _tp_ME_here_OK;
_whoamI moveInDriver _tp_ME_here_OK;
deleteVehicle _tp_ME_here_OK;
sleep 1;
systemChat format['Anti-Hack: teleported to %1',mapGridPosition getPos player];
_savelog = format['%1 teleported to %2',name player,mapGridPosition getPos player];
PVOZ_writelog_rq = [_savelog];
publicVariableServer 'PVOZ_writelog_rq';

}
else
{
_tp_ME_here_OK = "Old_bike_TK_CIV_EP1" createVehicleLocal _mousePOS;
hideObject _tp_ME_here_OK;
openMap [false, false];
closeDialog 0;
if (_whoamI isKindOf "Air") then
{
_whoamI attachTo [_tp_ME_here_OK, [0, 0, 200]];
sleep 0.01;
deleteVehicle _tp_ME_here_OK;
systemChat format['Anti-Hack: teleported to %1',mapGridPosition getPos player];
_savelog = format['%1 teleported to %2',name player,mapGridPosition getPos player];
PVOZ_writelog_rq = [_savelog];
publicVariableServer 'PVOZ_writelog_rq';

}
else
{
_whoamI attachTo [_tp_ME_here_OK, [0, 0, 1]];
sleep 0.01;
deleteVehicle _tp_ME_here_OK;
systemChat format['Anti-Hack: teleported to %1',mapGridPosition getPos player];
_savelog = format['%1 teleported to %2',name player,mapGridPosition getPos player];
PVOZ_writelog_rq = [_savelog];
publicVariableServer 'PVOZ_writelog_rq';

};
};
};
};
admin_esplol =
{
if (isnil "dami_playermarkers") then {dami_playermarkers = 0;};
if (dami_playermarkers == 0) then
{
dami_playermarkers = 1;
cutText ['player ESP enabled...','PLAIN DOWN'];
systemChat ("Anti-Hack: player Markers ON");
_savelog = format ["%1 enabled ESP at %5, with %2 players within 50m. %1 has %3 plus %4 kills.",name player,(({isplayer _x} count (getPos vehicle player nearEntities [["AllVehicles"], 50]))-1),(player getVariable['humanKills', 0]),(player getVariable['banditKills', 0]),mapGridPosition getPos player];
PVOZ_writelog_rq = [_savelog];
publicVariableServer "PVOZ_writelog_rq";
_plzwritetotxtfile = format ['"writeadmin" callExtension ("ADMIN (%3) LOGGED: %1 [|DayZ instance: %2|]");',_savelog,dayZ_instance,getplayerUID player];
[_plzwritetotxtfile] spawn admin_dothis;
} else {
dami_playermarkers = 0;
cutText ['player ESP disabled...','PLAIN DOWN'];
systemChat ("Anti-Hack: player Markers OFF");
_savelog = format ["%1 disabled ESP at %5, with %2 players within 50m. %1 has %3 plus %4 kills.",name player,(({isplayer _x} count (getPos vehicle player nearEntities [["AllVehicles"], 50]))-1),(player getVariable['humanKills', 0]),(player getVariable['banditKills', 0]),mapGridPosition getPos player];
PVOZ_writelog_rq = [_savelog];
publicVariableServer "PVOZ_writelog_rq";
_plzwritetotxtfile = format ['"writeadmin" callExtension ("ADMIN (%3) LOGGED: %1 [|DayZ instance: %2|]");',_savelog,dayZ_instance,getplayerUID player];
[_plzwritetotxtfile] spawn admin_dothis;
};
setGroupIconsVisible [true, true];
this_is_me = getplayerUID player;
while {dami_playermarkers == 1} do
{
{
if (getplayerUID _x != "") then
{
if (getplayerUID _x != this_is_me) then
{
clearGroupIcons group _x;
group _x addGroupIcon ["x_art"];
group _x setGroupIconParams [[0, 0, 1 , 1], format ["%1 (%2m)", name _x, round (_x distance player)], 0.7, true];
}
else
{
clearGroupIcons group _x;
group _x addGroupIcon ["x_art"];
group _x setGroupIconParams [[1, 1, 0 , 1], format ["This Is You (%2m)", name _x, round (_x distance player)], 0.7, true];
};
};
} forEach entities "AllVehicles";
sleep 1;
};
{
clearGroupIcons group _x;
} forEach entities "AllVehicles";
};
adminrepair =
{
if (vehicle player != player) then
{
_obj = [];
_vehicle = vehicle player;
_type = typeOf _vehicle;
_hitpoints = _vehicle call vehicle_getHitpoints;
_allFixed = true;
{
_damage = [_vehicle,_x] call object_getHit;
_selection = getText(configFile >> "cfgVehicles" >> _type >> "HitPoints" >> _x >> "name");
if (_damage > 0) then {
_obj = _obj + [str _selection];
};
[_vehicle, _selection, 0, true] call fnc_veh_handleRepair;
[_vehicle, _x, 0, true] call fnc_veh_handleRepair;
} forEach _hitpoints;
SystemChat ("Repaired "+str _obj+"");
(vehicle player) setDammage 0;
(vehicle player) setfuel 1;
(vehicle player) setvehicleammo 1;
} else {
_obj = [];
_vehicle = (cursorTarget);
if (isNull _vehicle) exitWith {};
_type = typeOf _vehicle;
_hitpoints = _vehicle call vehicle_getHitpoints;
_allFixed = true;
{
_damage = [_vehicle,_x] call object_getHit;
_selection = getText(configFile >> "cfgVehicles" >> _type >> "HitPoints" >> _x >> "name");
if (_damage > 0) then {
_obj = _obj + [str _selection];
};
[_vehicle, _selection, 0, true] call fnc_veh_handleRepair;
[_vehicle, _x, 0, true] call fnc_veh_handleRepair;
} forEach _hitpoints;
SystemChat ("Repaired "+str _obj+"");
_vehicle setDammage 0;
_vehicle setfuel 1;
_vehicle setvehicleammo 1;
};
};
admin_advmenu 	=
{
_savelog = format["%1 opened the ADVANCED menu.",name player];
PVOZ_writelog_rq = [_savelog];
publicVariableServer "PVOZ_writelog_rq";
_plzwritetotxtfile = format ['"writeadmin" callExtension ("ADMIN (%3) LOGGED: %1 [|DayZ instance: %2|]");',_savelog,dayZ_instance,getplayerUID player];
[_plzwritetotxtfile] spawn admin_dothis;
closeDialog 0;
cutText ['','PLAIN DOWN'];
debugMonitor = false;
hint '';
sleep 0.01;
execVM 'TM\help\tut.sqf';
execVM 'keyz\keyctrlz.sqf';
};
fix_dat_lag =
{
_savelog = format["%1 used Fix Server Lag.",name player];PVOZ_writelog_rq = [_savelog];publicVariableServer "PVOZ_writelog_rq";
_itemclasses =
[
"GraveCrossHelmet_EP1","GraveCrossHelmet_DZ","wreck","crater","craterlong","PartWoodPile",
"RUVehicleBox","Body1","Body2","SeaGull","Rabbit","WildBoar","bird","wire_cat1",
"Hedgehog_DZ","BearTrap_DZ","CAAnimalBase","zZombie_Base","Land_Fire_DZ","Sound_Flies"
];
{
_itemlist 	= allMissionObjects _x;
_itemCount 	= (count _itemlist);
_i 			= 0;
for "_i" from 0 to _itemCount do
{
_item = _itemlist select _i;
if ((typeOf _item != "DZ_fin")||(typeOf _item != "DZ_pastor")||(typeOf _item != "SHEEP")) then
{
deleteVehicle _item;
_objectID 	= _item getVariable ["ObjectID","0"];
_objectUID 	= _item getVariable ["ObjectUID","0"];
PVDZ_obj_Delete = [_objectID,_objectUID];
publicVariableServer "PVDZ_obj_Delete";
if (AM_EPOCH) then {
PVDZE_obj_Delete = [_objectID,_objectUID,player];
publicVariableServer "PVDZE_obj_Delete";
};
};
};
systemChat format ["Anti-Hack: DELETING %1 %2(s)",_itemCount,_x];
} forEach _itemclasses;
_cake = 0;
_vehs = [];
{
_garage = (getPosATL _x) nearObjects ["Land_sara_hasic_zbroj",7];
if !((count _garage) > 1) then {
if (((damage _x)>0.95)&&!(_x isKindOf "MAN")&&!(_x isKindOf "CAAnimalBase")&&!(_x isKindOf "zZombie_Base")&&!(_x isKindOf "static")) then {
if (typeOf _x != "SHEEP") then {
deleteVehicle _x;
_objectID = _x getVariable ["ObjectID","0"];
_objectUID = _x getVariable ["ObjectUID","0"];
PVDZ_obj_Delete = [_objectID,_objectUID];
publicVariableServer "PVDZ_obj_Delete";
if (AM_EPOCH) then {
PVDZE_obj_Delete = [_objectID,_objectUID,player];
publicVariableServer "PVDZE_obj_Delete";
};
_cake = _cake + 1;
_vehs = _vehs + [typeOf _x];
};
};
};
} forEach Entities "AllVehicles";
systemChat format ["Anti-Hack: %1 blown up vehicles were deleted: %2", _cake, _vehs];
systemChat format ["Anti-Hack: Press /, and use page up & page down if you want to view what was deleted.", _cake];
};
heal_them_hoes = {0 fadeSound 1;r_player_blood = 11987;r_player_infected = false;r_player_inpain = false;r_player_injured = false;dayz_hunger	= 0;dayz_thirst = 0;dayz_temperatur = 104;dayz_temperature = 104;r_fracture_legs = false;r_fracture_arms = false;r_player_dead = false;r_player_unconscious = false;r_player_loaded = false;r_player_cardiac = false;r_player_lowblood = false;r_player_timeout = 0;r_handlerCount = 0;dayz_sourceBleeding = objNull;r_pitchWhine = false;r_isBandit = false;r_interrupt = false;r_dothisLoop = false;r_self = false;r_drag_sqf = false;r_action = false;r_action_unload = false;r_player_handler = false;r_player_handler1 = false;player setVariable ['unconsciousTime', r_player_timeout, true];player setVariable ['USEC_infected' ,false,false];player setVariable ['USEC_infected' ,false,true];player setVariable ['USEC_injured' ,false,true];player setVariable ['USEC_inPain' ,false, true];player setVariable ['hit_legs' ,0,false];player setVariable ['medForceUpdate' ,true,true];player setVariable ['head_hit' ,false,true];player setVariable ['legs' ,false,true];player setVariable ['hands' ,false,true];player setVariable ['body' ,false,true];player setunconscious false;player setHit ['legs',0];setplayerRespawnTime 0.001;disableUserInput false;dami_distance_nonarma = getPos (vehicle player);_plzhealfirends = format ["_y0l0 = (vehicle player);dis_from_damilol = %1;_seldistancebrah = getPos (vehicle player);_distancefromgod = _seldistancebrah distance dis_from_damilol;if (isServer) then{_y0l0 setVariable ['medForceUpdate',true];};if (_distancefromgod < 50) then {disableSerialization;dayz_sourceBleeding = objNull;r_player_blood = r_player_bloodTotal;r_player_inpain = false;r_player_infected = false;r_player_injured = false;dayz_hunger = 0;dayz_thirst = 0;dayz_temperatur = 40;r_fracture_legs = false;r_fracture_arms = false;r_player_dead = false;r_player_unconscious = false;r_player_loaded = false;r_player_cardiac = false;r_player_lowblood = false;r_player_timeout = 0;r_handlercount = 0;r_interrupt = false;r_doLoop = false;r_drag_sqf = false;r_self = false;r_action = false;r_action_unload = false;r_player_handler = false;r_player_handler1 = false;disableUserInput false;""dynamicBlur"" ppEffectAdjust [0];""dynamicBlur"" ppEffectCommit 5;_y0l0 = player;_selection = ""legs"";_damage = 0;_y0l0 setHit[_selection,_damage];player setVariable ['messing',[dayz_hunger,dayz_thirst],true];player setVariable ['USEC_BloodQty',r_player_blood,true];player setVariable ['medForceUpdate',true];player setVariable ['hit_legs',0,true];player setVariable ['hit_hands',0,true];player setVariable ['USEC_injured',false,true];player setVariable ['USEC_inPain',false,true];player setVariable ['USEC_lowBlood',false,true];_display = uiNamespace getVariable 'DAYZ_GUI_display';_control = 	_display displayCtrl  1303;_control ctrlShow false;_display = uiNamespace getVariable 'DAYZ_GUI_display';_control = _display displayCtrl 1203;_control ctrlShow false;_y0l0 setdamage 0;0 fadeSound 1;};",dami_distance_nonarma];[_plzhealfirends] spawn admin_dothis;};
adminheal =
{
_name = _this select 0;
_healthembro = format
["
				if (name player == '%1') then
				{
					disableSerialization;
					dayz_sourceBleeding = objNull;
					r_player_blood = r_player_bloodTotal;
					r_player_inpain = false;
					r_player_infected = false;
					r_player_injured = false;
					dayz_hunger = 0;
					dayz_thirst = 0;
					dayz_temperatur = 40;
					r_fracture_legs = false;
					r_fracture_arms = false;
					r_player_dead = false;
					r_player_unconscious = false;
					r_player_loaded = false;
					r_player_cardiac = false;
					r_player_lowblood = false;
					r_player_timeout = 0;
					r_handlercount = 0;
					r_interrupt = false;
					r_doLoop = false;
					r_drag_sqf = false;
					r_self = false;
					r_action = false;
					r_action_unload = false;
					r_player_handler = false;
					r_player_handler1 = false;
					disableUserInput false;
					""dynamicBlur"" ppEffectAdjust [0];
					""dynamicBlur"" ppEffectCommit 5;
					_y0l0 = player;
					_selection = ""legs"";
					_damage = 0;
					_y0l0 setHit[_selection,_damage];
					player setVariable ['messing',[dayz_hunger,dayz_thirst],true];
					player setVariable ['USEC_BloodQty',r_player_blood,true];
					player setVariable ['medForceUpdate',true];
					player setVariable ['hit_legs',0,true];
					player setVariable ['hit_hands',0,true];
					player setVariable ['USEC_injured',false,true];
					player setVariable ['USEC_inPain',false,true];
					player setVariable ['USEC_lowBlood',false,true];
					_display = uiNamespace getVariable 'DAYZ_GUI_display';
					_control = 	_display displayCtrl  1303;
					_control ctrlShow false;
					_display = uiNamespace getVariable 'DAYZ_GUI_display';
					_control = _display displayCtrl 1203;
					_control ctrlShow false;
					_y0l0 setdamage 0;
					0 fadeSound 1;
					cutText ['Healed','plain down'];
					systemChat ['Anti-hack: You've been healed by %2'];
				};
			",_name,name player];
[_healthembro] spawn admin_dothis;
_savelog = format["%1 healed %2",name player, _this select 0];
PVOZ_writelog_rq = [_savelog];
publicVariableServer "PVOZ_writelog_rq";

{
if (name _x == _this select 0) then
{
PVOZ_REMOTE_EXECUTE_list = [5,player,_x];
publicVariableServer "PVOZ_REMOTE_EXECUTE_list";
systemChat format ["Anti-Hack: Healing %1", _this select 0];
};
} forEach ([6800, 9200, 0] nearEntities [["AllVehicles"], 11000]);
};
admincrate_epoch_2 =
{
closeDialog 0;
PVOZ_REMOTE_EXECUTE_list = [12,player];
publicVariableServer "PVOZ_REMOTE_EXECUTE_list";
systemChat ("Anti-Hack: Spawning Box (NO CURRENCY)");

boxdelay_DAMI = 
[
["",true],
["Admin Crate", [-1], "", -5, [["expression", ""]], "1", "0"],
["", [-1], "", -5, [["expression", ""]], "1", "0"],
["DELETE TIMER: 1 minute(s)", [2], "", -5, [["expression", "SelectDelay=60;DelaySelected=true;"]], "1", "1"],
["DELETE TIMER: 2 minute(s)", [3], "", -5, [["expression", "SelectDelay=120;DelaySelected=true;"]], "1", "1"],
["DELETE TIMER: 3 minute(s)", [4], "", -5, [["expression", "SelectDelay=180;DelaySelected=true;"]], "1", "1"],
["DELETE TIMER: 4 minute(s)", [5], "", -5, [["expression", "SelectDelay=240;DelaySelected=true;"]], "1", "1"],
["DELETE TIMER: 5 minute(s)", [6], "", -5, [["expression", "SelectDelay=300;DelaySelected=true;"]], "1", "1"],
["DELETE TIMER: 10 minute(s)", [7], "", -5, [["expression", "SelectDelay=600;DelaySelected=true;"]], "1", "1"],
["", [-1], "", -5, [["expression", ""]], "1", "0"],
["No timer", [11], "", -5, [["expression", "DelaySelected=false;"]], "1", "1"],
["", [-1], "", -5, [["expression", ""]], "1", "0"],
["Exit", [-1], "", -3, [["expression", ""]], "1", "1"]
];
showCommandingMenu "#USER:boxdelay_DAMI";
WaitUntil{!isNil 'DelaySelected'};
if (DelaySelected) then {
systemChat ('Anti-Hack: Admin crate will be deleted in '+str SelectDelay+' seconds.');
titleText ["Admin crate will be deleted in "+str SelectDelay+" seconds.","PLAIN DOWN"]; 
titleFadeOut 6;
sleep SelectDelay;
_box = allMissionObjects "USBasicAmmunitionBox";
{deleteVehicle _x} forEach _box;
systemChat ('Anti-Hack: Admin crate has been deleted.');
_savelog = format["%1 spawned BOX at %2, holding a %3, with %4 players within 50 meters. Box delete timer is %5",name player,mapGridPosition getPos player,currentWeapon player,(({isplayer _x} count (getPos vehicle player nearEntities [["AllVehicles"], 50]))-1),SelectDelay];
PVOZ_writelog_rq = [_savelog];
publicVariableServer "PVOZ_writelog_rq";

} else {
_savelog = format["%1 spawned BOX at %2, holding a %3, with %4 players within 50 meters. Box has no delete timer.",name player,mapGridPosition getPos player,currentWeapon player,(({isplayer _x} count (getPos vehicle player nearEntities [["AllVehicles"], 50]))-1)];
PVOZ_writelog_rq = [_savelog];
publicVariableServer "PVOZ_writelog_rq";

};
};
admincrate_epoch_3 =
{
closeDialog 0;
PVOZ_REMOTE_EXECUTE_list = [13,player];
publicVariableServer "PVOZ_REMOTE_EXECUTE_list";
systemChat ("Anti-Hack: Spawning Box (SKINS ONLY)");

boxdelay_DAMI = 
[
["",true],
["Admin Crate", [-1], "", -5, [["expression", ""]], "1", "0"],
["", [-1], "", -5, [["expression", ""]], "1", "0"],
["DELETE TIMER: 1 minute(s)", [2], "", -5, [["expression", "SelectDelay=60;DelaySelected=true;"]], "1", "1"],
["DELETE TIMER: 2 minute(s)", [3], "", -5, [["expression", "SelectDelay=120;DelaySelected=true;"]], "1", "1"],
["DELETE TIMER: 3 minute(s)", [4], "", -5, [["expression", "SelectDelay=180;DelaySelected=true;"]], "1", "1"],
["DELETE TIMER: 4 minute(s)", [5], "", -5, [["expression", "SelectDelay=240;DelaySelected=true;"]], "1", "1"],
["DELETE TIMER: 5 minute(s)", [6], "", -5, [["expression", "SelectDelay=300;DelaySelected=true;"]], "1", "1"],
["DELETE TIMER: 10 minute(s)", [7], "", -5, [["expression", "SelectDelay=600;DelaySelected=true;"]], "1", "1"],
["", [-1], "", -5, [["expression", ""]], "1", "0"],
["No timer", [11], "", -5, [["expression", "DelaySelected=false;"]], "1", "1"],
["", [-1], "", -5, [["expression", ""]], "1", "0"],
["Exit", [-1], "", -3, [["expression", ""]], "1", "1"]
];
showCommandingMenu "#USER:boxdelay_DAMI";
WaitUntil{!isNil 'DelaySelected'};
if (DelaySelected) then {
systemChat ('Anti-Hack: Admin crate will be deleted in '+str SelectDelay+' seconds.');
titleText ["Admin crate will be deleted in "+str SelectDelay+" seconds.","PLAIN DOWN"]; 
titleFadeOut 6;
sleep SelectDelay;
_box = allMissionObjects "USBasicAmmunitionBox";
{deleteVehicle _x} forEach _box;
systemChat ('Anti-Hack: Admin crate has been deleted.');
_savelog = format["%1 spawned BOX at %2, holding a %3, with %4 players within 50 meters. Box delete timer is %5",name player,mapGridPosition getPos player,currentWeapon player,(({isplayer _x} count (getPos vehicle player nearEntities [["AllVehicles"], 50]))-1),SelectDelay];
PVOZ_writelog_rq = [_savelog];
publicVariableServer "PVOZ_writelog_rq";

} else {
_savelog = format["%1 spawned BOX at %2, holding a %3, with %4 players within 50 meters. Box has no delete timer.",name player,mapGridPosition getPos player,currentWeapon player,(({isplayer _x} count (getPos vehicle player nearEntities [["AllVehicles"], 50]))-1)];
PVOZ_writelog_rq = [_savelog];
publicVariableServer "PVOZ_writelog_rq";

};
};
admincrate_epoch_4 =
{
closeDialog 0;
PVOZ_REMOTE_EXECUTE_list = [14,player];
publicVariableServer "PVOZ_REMOTE_EXECUTE_list";
systemChat ("Anti-Hack: Spawning Box (FOOD ONLY)");

boxdelay_DAMI = 
[
["",true],
["Admin Crate", [-1], "", -5, [["expression", ""]], "1", "0"],
["", [-1], "", -5, [["expression", ""]], "1", "0"],
["DELETE TIMER: 1 minute(s)", [2], "", -5, [["expression", "SelectDelay=60;DelaySelected=true;"]], "1", "1"],
["DELETE TIMER: 2 minute(s)", [3], "", -5, [["expression", "SelectDelay=120;DelaySelected=true;"]], "1", "1"],
["DELETE TIMER: 3 minute(s)", [4], "", -5, [["expression", "SelectDelay=180;DelaySelected=true;"]], "1", "1"],
["DELETE TIMER: 4 minute(s)", [5], "", -5, [["expression", "SelectDelay=240;DelaySelected=true;"]], "1", "1"],
["DELETE TIMER: 5 minute(s)", [6], "", -5, [["expression", "SelectDelay=300;DelaySelected=true;"]], "1", "1"],
["DELETE TIMER: 10 minute(s)", [7], "", -5, [["expression", "SelectDelay=600;DelaySelected=true;"]], "1", "1"],
["", [-1], "", -5, [["expression", ""]], "1", "0"],
["No timer", [11], "", -5, [["expression", "DelaySelected=false;"]], "1", "1"],
["", [-1], "", -5, [["expression", ""]], "1", "0"],
["Exit", [-1], "", -3, [["expression", ""]], "1", "1"]
];
showCommandingMenu "#USER:boxdelay_DAMI";
WaitUntil{!isNil 'DelaySelected'};
if (DelaySelected) then {
systemChat ('Anti-Hack: Admin crate will be deleted in '+str SelectDelay+' seconds.');
titleText ["Admin crate will be deleted in "+str SelectDelay+" seconds.","PLAIN DOWN"]; 
titleFadeOut 6;
sleep SelectDelay;
_box = allMissionObjects "USBasicAmmunitionBox";
{deleteVehicle _x} forEach _box;
systemChat ('Anti-Hack: Admin crate has been deleted.');
_savelog = format["%1 spawned BOX at %2, holding a %3, with %4 players within 50 meters. Box delete timer is %5",name player,mapGridPosition getPos player,currentWeapon player,(({isplayer _x} count (getPos vehicle player nearEntities [["AllVehicles"], 50]))-1),SelectDelay];
PVOZ_writelog_rq = [_savelog];
publicVariableServer "PVOZ_writelog_rq";

} else {
_savelog = format["%1 spawned BOX at %2, holding a %3, with %4 players within 50 meters. Box has no delete timer.",name player,mapGridPosition getPos player,currentWeapon player,(({isplayer _x} count (getPos vehicle player nearEntities [["AllVehicles"], 50]))-1)];
PVOZ_writelog_rq = [_savelog];
publicVariableServer "PVOZ_writelog_rq";

};
};
admincrate_epoch_4 =
{
closeDialog 0;
PVOZ_REMOTE_EXECUTE_list = [15,player];
publicVariableServer "PVOZ_REMOTE_EXECUTE_list";
systemChat ("Anti-Hack: Spawning Box (BUILDING MATERIALS ONLY)");

boxdelay_DAMI = 
[
["",true],
["Admin Crate", [-1], "", -5, [["expression", ""]], "1", "0"],
["", [-1], "", -5, [["expression", ""]], "1", "0"],
["DELETE TIMER: 1 minute(s)", [2], "", -5, [["expression", "SelectDelay=60;DelaySelected=true;"]], "1", "1"],
["DELETE TIMER: 2 minute(s)", [3], "", -5, [["expression", "SelectDelay=120;DelaySelected=true;"]], "1", "1"],
["DELETE TIMER: 3 minute(s)", [4], "", -5, [["expression", "SelectDelay=180;DelaySelected=true;"]], "1", "1"],
["DELETE TIMER: 4 minute(s)", [5], "", -5, [["expression", "SelectDelay=240;DelaySelected=true;"]], "1", "1"],
["DELETE TIMER: 5 minute(s)", [6], "", -5, [["expression", "SelectDelay=300;DelaySelected=true;"]], "1", "1"],
["DELETE TIMER: 10 minute(s)", [7], "", -5, [["expression", "SelectDelay=600;DelaySelected=true;"]], "1", "1"],
["", [-1], "", -5, [["expression", ""]], "1", "0"],
["No timer", [11], "", -5, [["expression", "DelaySelected=false;"]], "1", "1"],
["", [-1], "", -5, [["expression", ""]], "1", "0"],
["Exit", [-1], "", -3, [["expression", ""]], "1", "1"]
];
showCommandingMenu "#USER:boxdelay_DAMI";
WaitUntil{!isNil 'DelaySelected'};
if (DelaySelected) then {
systemChat ('Anti-Hack: Admin crate will be deleted in '+str SelectDelay+' seconds.');
titleText ["Admin crate will be deleted in "+str SelectDelay+" seconds.","PLAIN DOWN"]; 
titleFadeOut 6;
sleep SelectDelay;
_box = allMissionObjects "USBasicAmmunitionBox";
{deleteVehicle _x} forEach _box;
systemChat ('Anti-Hack: Admin crate has been deleted.');
_savelog = format["%1 spawned BOX at %2, holding a %3, with %4 players within 50 meters. Box delete timer is %5",name player,mapGridPosition getPos player,currentWeapon player,(({isplayer _x} count (getPos vehicle player nearEntities [["AllVehicles"], 50]))-1),SelectDelay];
PVOZ_writelog_rq = [_savelog];
publicVariableServer "PVOZ_writelog_rq";

} else {
_savelog = format["%1 spawned BOX at %2, holding a %3, with %4 players within 50 meters. Box has no delete timer.",name player,mapGridPosition getPos player,currentWeapon player,(({isplayer _x} count (getPos vehicle player nearEntities [["AllVehicles"], 50]))-1)];
PVOZ_writelog_rq = [_savelog];
publicVariableServer "PVOZ_writelog_rq";

};
};
admincrate_epoch =
{
closeDialog 0;
PVOZ_REMOTE_EXECUTE_list = [11,player];
publicVariableServer "PVOZ_REMOTE_EXECUTE_list";
systemChat ("Anti-Hack: Spawning Box");

boxdelay_DAMI = 
[
["",true],
["Admin Crate", [-1], "", -5, [["expression", ""]], "1", "0"],
["", [-1], "", -5, [["expression", ""]], "1", "0"],
["DELETE TIMER: 1 minute(s)", [2], "", -5, [["expression", "SelectDelay=60;DelaySelected=true;"]], "1", "1"],
["DELETE TIMER: 2 minute(s)", [3], "", -5, [["expression", "SelectDelay=120;DelaySelected=true;"]], "1", "1"],
["DELETE TIMER: 3 minute(s)", [4], "", -5, [["expression", "SelectDelay=180;DelaySelected=true;"]], "1", "1"],
["DELETE TIMER: 4 minute(s)", [5], "", -5, [["expression", "SelectDelay=240;DelaySelected=true;"]], "1", "1"],
["DELETE TIMER: 5 minute(s)", [6], "", -5, [["expression", "SelectDelay=300;DelaySelected=true;"]], "1", "1"],
["DELETE TIMER: 10 minute(s)", [7], "", -5, [["expression", "SelectDelay=600;DelaySelected=true;"]], "1", "1"],
["", [-1], "", -5, [["expression", ""]], "1", "0"],
["No timer", [11], "", -5, [["expression", "DelaySelected=false;"]], "1", "1"],
["", [-1], "", -5, [["expression", ""]], "1", "0"],
["Exit", [-1], "", -3, [["expression", ""]], "1", "1"]
];
showCommandingMenu "#USER:boxdelay_DAMI";
WaitUntil{!isNil 'DelaySelected'};
if (DelaySelected) then {
systemChat ('Anti-Hack: Admin crate will be deleted in '+str SelectDelay+' seconds.');
titleText ["Admin crate will be deleted in "+str SelectDelay+" seconds.","PLAIN DOWN"]; 
titleFadeOut 6;
sleep SelectDelay;
_box = allMissionObjects "USBasicAmmunitionBox";
{deleteVehicle _x} forEach _box;
systemChat ('Anti-Hack: Admin crate has been deleted.');
_savelog = format["%1 spawned BOX at %2, holding a %3, with %4 players within 50 meters. Box delete timer is %5",name player,mapGridPosition getPos player,currentWeapon player,(({isplayer _x} count (getPos vehicle player nearEntities [["AllVehicles"], 50]))-1),SelectDelay];
PVOZ_writelog_rq = [_savelog];
publicVariableServer "PVOZ_writelog_rq";

} else {
_savelog = format["%1 spawned BOX at %2, holding a %3, with %4 players within 50 meters. Box has no delete timer.",name player,mapGridPosition getPos player,currentWeapon player,(({isplayer _x} count (getPos vehicle player nearEntities [["AllVehicles"], 50]))-1)];
PVOZ_writelog_rq = [_savelog];
publicVariableServer "PVOZ_writelog_rq";

};
};
admincrate =
{
closeDialog 0;
PVOZ_REMOTE_EXECUTE_list = [6,player];
publicVariableServer "PVOZ_REMOTE_EXECUTE_list";
systemChat ("Anti-Hack: Spawning Box");
_savelog = format["%1 spawned BOX at %2, holding a %3, with %4 players within 50 meters. Box delete timer is %5",name player,mapGridPosition getPos player,currentWeapon player,(({isplayer _x} count (getPos vehicle player nearEntities [["AllVehicles"], 50]))-1),SelectDelay];
PVOZ_writelog_rq = [_savelog];
publicVariableServer "PVOZ_writelog_rq";

boxdelay_DAMI = 
[
["",true],
["Admin Crate", [-1], "", -5, [["expression", ""]], "1", "0"],
["", [-1], "", -5, [["expression", ""]], "1", "0"],
["DELETE TIMER: 1 minute(s)", [2], "", -5, [["expression", "SelectDelay=60;DelaySelected=true;"]], "1", "1"],
["DELETE TIMER: 2 minute(s)", [3], "", -5, [["expression", "SelectDelay=120;DelaySelected=true;"]], "1", "1"],
["DELETE TIMER: 3 minute(s)", [4], "", -5, [["expression", "SelectDelay=180;DelaySelected=true;"]], "1", "1"],
["DELETE TIMER: 4 minute(s)", [5], "", -5, [["expression", "SelectDelay=240;DelaySelected=true;"]], "1", "1"],
["DELETE TIMER: 5 minute(s)", [6], "", -5, [["expression", "SelectDelay=300;DelaySelected=true;"]], "1", "1"],
["DELETE TIMER: 10 minute(s)", [7], "", -5, [["expression", "SelectDelay=600;DelaySelected=true;"]], "1", "1"],
["", [-1], "", -5, [["expression", ""]], "1", "0"],
["No timer", [11], "", -5, [["expression", "DelaySelected=false;"]], "1", "1"],
["", [-1], "", -5, [["expression", ""]], "1", "0"],
["Exit", [-1], "", -3, [["expression", ""]], "1", "1"]
];
showCommandingMenu "#USER:boxdelay_DAMI";
WaitUntil{!isNil 'DelaySelected'};
if (DelaySelected) then {
systemChat ('Anti-Hack: Admin crate will be deleted in '+str SelectDelay+' seconds.');
titleFadeOut 6;
sleep SelectDelay;
_box = allMissionObjects "USBasicAmmunitionBox";
{deleteVehicle _x} forEach _box;
systemChat ('Anti-Hack: Admin crate has been deleted.');
} else {
_savelog = format["%1 spawned BOX at %2, holding a %3, with %4 players within 50 meters. Box has no delete timer.",name player,mapGridPosition getPos player,currentWeapon player,(({isplayer _x} count (getPos vehicle player nearEntities [["AllVehicles"], 50]))-1)];
PVOZ_writelog_rq = [_savelog];
publicVariableServer "PVOZ_writelog_rq";

};
};
adminpmark =
{
admin_pmarkslol =
{
while {mark == 1} do
{
_entities = ([6800, 9200, 0] nearEntities [["Survivor1_DZ", "Survivor2_DZ", "SurvivorW2_DZ", "Bandit1_DZ", "Survivor3_DZ", "Soldier1_DZ", "Camo1_DZ", "Sniper1_DZ", "BanditW1_DZ", "BanditW2_DZ", "SurvivorW3_DZ", "Hero1_DZ"], 11000]);
for "_i" from 0 to (count _entities)-1 do
{
deleteMarkerLocal ("admin_pmarkslol" + (str _i));
_pm = createMarkerLocal [("admin_pmarkslol" + (str _i)), getPos (_entities select _i)];
_pm setMarkerTypeLocal "destroyedvehicle";
_pm setMarkerSizeLocal [0.8, 0.8];
_pm setMarkerTextLocal format ["%1", name (_entities select _i)];
_pm setMarkerColorLocal ("ColorBlue");
};
sleep 3;
};
_entities = ([6800, 9200, 0] nearEntities [["Survivor1_DZ", "Survivor2_DZ", "SurvivorW2_DZ", "Bandit1_DZ", "Survivor3_DZ", "Soldier1_DZ", "Camo1_DZ", "Sniper1_DZ", "BanditW1_DZ", "BanditW2_DZ", "SurvivorW3_DZ", "Hero1_DZ"], 11000]);
for "_i" from 0 to (count _entities)-1 do {deleteMarkerLocal ("admin_pmarkslol" + (str _i));};
};
if (isNil "mark") then {mark = 0;};
if (mark == 0) then
{
mark = 1;
systemChat ("Anti-Hack: player Map Markers Enabled");
[] spawn admin_pmarkslol;
_savelog = format["%1 enabled player markers.",name player];
PVOZ_writelog_rq = [_savelog];
publicVariableServer "PVOZ_writelog_rq";

}
else
{
_savelog = format["%1 disabled player markers.",name player];
PVOZ_writelog_rq = [_savelog];
publicVariableServer "PVOZ_writelog_rq";

mark = 0;
systemChat ("Anti-Hack: player Map Markers Disabled");
};
};
admin_esp_VEH =
{
adminvmark =
{
while {vehicle_markers == 1} do
{
_entities_vehicles = ([6800, 9200, 0] nearEntities [["LandVehicle", "Air", "Ship","tentStorage","UH1Wreck_DZ"], 11000]);
for "_i" from 0 to (count _entities_vehicles)-1 do
{
deleteMarkerLocal ("adminvmark" + (str _i));
_vm = createMarkerLocal [("adminvmark" + (str _i)), getPos (_entities_vehicles select _i)];
_vm setMarkerTypeLocal "destroyedvehicle";
_vm setMarkerSizeLocal [0.8, 0.8];
_vm setMarkerTextLocal format ["%1", getText (configFile >> 'CfgVehicles' >> (typeof (_entities_vehicles select _i)) >> 'displayName')];
_vm setMarkerColorLocal ("ColorRed");
};
sleep 3;
};
_entities_vehicles = ([6800, 9200, 0] nearEntities [["LandVehicle", "Air", "Ship"], 11000]);
for "_i" from 0 to (count _entities_vehicles)-1 do {deleteMarkerLocal ("adminvmark" + (str _i));};
};
if (isNil "vehicle_markers") then {vehicle_markers = 0;};
if (vehicle_markers == 0) then
{
vehicle_markers = 1;
systemChat ("Anti-Hack: Vehicle Map Markers Enabled");
[] spawn adminvmark;
_savelog = format["%1 enabled vehicle markers.",name player];
PVOZ_writelog_rq = [_savelog];
publicVariableServer "PVOZ_writelog_rq";

} else {
_savelog = format["%1 disabled vehicle markers.",name player];
PVOZ_writelog_rq = [_savelog];
publicVariableServer "PVOZ_writelog_rq";

vehicle_markers = 0;
systemChat ("Anti-Hack: Vehicle Map Markers Disabled");
};
};
adminesp =
{
xdistance_nonarma = 1200;
if (isNil "adminxtags") then
{
adminxtags = 0;
fn_esp =
{
disableSerialization;
if (isNil "BIS_fnc_3dCredits_n") then {BIS_fnc_3dCredits_n = 2733;};
BIS_fnc_3dCredits_n cutRsc ["rscDynamicText", "PLAIN"];
BIS_fnc_3dCredits_n = BIS_fnc_3dCredits_n + 1;
_ctrl = ((uiNamespace getvariable "BIS_dynamicText") displayctrl 9999);
_ctrl ctrlShow true;
_ctrl ctrlEnable true;
_ctrl ctrlSetFade 0;
_y0l0 = _this select 0;
while {(alive _y0l0) && ((player distance _y0l0) < xdistance) && (adminxtags == 1)} do
{
_pos = [(getPosATL _y0l0) select 0, (getPosATL _y0l0) select 1, ((getPosATL _y0l0) select 2) + 2];
_pos2D = worldToScreen _pos;
if (count _pos2D > 0) then
{
_ctrl ctrlSetPosition [(_pos2D select 0) - (safezoneW / 2), (_pos2D select 1), safezoneW, safezoneH];
_text = parseText format ["<t size='0.35' color='#FFFFFF'>%1 (%2m)</t>", name _y0l0, round (player distance _y0l0)];
_ctrl ctrlSetStructuredText _text;
_ctrl ctrlCommit 0;
};
sleep 0.01;
};
_ctrl ctrlShow false;
_ctrl ctrlEnable false;
};
};
if (adminxtags == 0) then
{
adminxtags = 1;
systemChat ("Anti-Hack: ESP Enabled");
_a = [];
while {adminxtags == 1} do
{
_count = count ((position player) nearEntities [["CAManBase"], xdistance]);
{
if (((_x in _a) && !(alive _x)) or ((_x in _a) && ((player distance _x) > xdistance))) then {_a = _a - [_x];};
if ((_x != player) && (getplayerUID _x != "") && (name _x != "") && !(_x in _a) && ((player distance _x) < xdistance)) then
{
_a = _a + [_x];
[_x] spawn fn_esp;
sleep 1;
};
} forEach playableUnits;
waitUntil {_count != count ((position player) nearEntities [["CAManBase"], xdistance])};
};
} else {adminxtags = 0;systemChat ("Anti-Hack: ESP Disabled");};
};
admingod =
{
if (isNil "gmdadmin") then {gmdadmin = 0;};
if (gmdadmin == 0) then
{
gmdadmin = 1;
dami_zombiecheck = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\player_zombieCheck.sqf';
dami_damageHandler = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\fn_damageHandler.sqf';
dami_unconsciousFunction = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\fn_unconscious.sqf';
dami_death = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\player_death.sqf';
dami_RespawnTime = playerRespawnTime;
cutText ["Godmode activated.", "PLAIN"];
systemChat ('Anti-Hack: Godmode activated.');
player setUnitRecoilCoefficient 0;
player_zombieCheck 		= {};
fnc_usec_damageHandler 	= {};
fnc_usec_unconscious  	= {};
player_death 			= {};
dayz_hunger 			= -100;
dayz_thirst 			= -100;
player removeAllEventHandlers "handleDamage";
player addEventHandler ["handleDamage", {false}];
player allowDamage false;
_savelog = format["%1 enabled godmode with %2 players within 50 meters. %1 has %3 plus %4 kills.",name player,(({isplayer _x} count (getPos vehicle player nearEntities [["AllVehicles"], 50]))-1),(player getVariable['humanKills', 0]),(player getVariable['banditKills', 0])];
PVOZ_writelog_rq = [_savelog];
publicVariableServer "PVOZ_writelog_rq";
_plzwritetotxtfile = format ['"writeadmin" callExtension ("ADMIN (%3) LOGGED: %1 [|DayZ instance: %2|]");',_savelog,dayZ_instance,getplayerUID player];
[_plzwritetotxtfile] spawn admin_dothis;
} else {
gmdadmin = 0;
cutText ["Godmode Deactivated.", "PLAIN"];
systemChat ('Anti-Hack: Godmode Deactivated.');
player setUnitRecoilCoefficient 1;
player removeAllEventHandlers "handleDamage";
vehicle player allowDamage true;
player addEventHandler ['HandleDamage',{_this call dami_damageHandler;}];
fnc_usec_damageHandler 	= dami_damageHandler;
fnc_usec_unconscious 	= dami_unconsciousFunction;
player_death 			= dami_death;
playerRespawnTime 		= dami_RespawnTime;
player_zombieCheck 		= dami_zombiecheck;
_savelog = format["%1 disabled godmode with %2 players within 50 meters. %1 has %3 plus %4 kills.",name player,(({isplayer _x} count (getPos vehicle player nearEntities [["AllVehicles"], 50]))-1),(player getVariable['humanKills', 0]),(player getVariable['banditKills', 0])];
PVOZ_writelog_rq = [_savelog];
publicVariableServer "PVOZ_writelog_rq";
_plzwritetotxtfile = format ['"writeadmin" callExtension ("ADMIN (%3) LOGGED: %1 [|DayZ instance: %2|]");',_savelog,dayZ_instance,getplayerUID player];
[_plzwritetotxtfile] spawn admin_dothis;
};
};
admininvis =
{
if (isNil 'inv1') then {inv1 = 0;};
if (inv1 == 0) then
{
if (vehicle player != player) then
{
type_of_player_invis = "Survivor_2_DZ";
} else {type_of_player_invis = typeOf player;};
[dayz_playerUID, dayz_characterID, 'Survivor1_DZ'] spawn player_humanityMorph;
_savelog = format["%1 enabled invisibility.",name player, _this select 0];
PVOZ_writelog_rq = [_savelog];publicVariableServer "PVOZ_writelog_rq";

PVOZ_REMOTE_EXECUTE_list = [3,player,1];
publicVariableServer "PVOZ_REMOTE_EXECUTE_list";
inv1 = 1;
systemChat ("Anti-Hack: Invisibility Enabled");
cutText ["Invisibility Enabled","PLAIN DOWN"];
closeDialog 0;
} else {
if !(isNil "type_of_player_invis") then {
[dayz_playerUID, dayz_characterID, type_of_player_invis] spawn player_humanityMorph;
};
_savelog = format["%1 disabled invisibility.",name player, _this select 0];PVOZ_writelog_rq = [_savelog];publicVariableServer "PVOZ_writelog_rq";

PVOZ_REMOTE_EXECUTE_list = [3,player,0];
publicVariableServer "PVOZ_REMOTE_EXECUTE_list";
inv1 = 0;
systemChat ("Anti-Hack: Invisibility Disabled");
cutText ["Invisibility Disabled","PLAIN DOWN"];
closeDialog 0;
};
};
admintele =
{
DZE_teleport = [600000,0,0,600000,600000];
_name = _this select 0;
_savelog = format["%1 teleported to %2",name player, _name];
PVOZ_writelog_rq = [_savelog];
publicVariableServer "PVOZ_writelog_rq";

_admintp = format ["
				if (name player == '%1') then {
					DZE_teleport = [600000,0,0,600000,600000];
					systemChat ('[ADMIN] "+name player+" is teleporting to you.');
				};
			",_name];
[_admintp] spawn admin_dothis;
{
if (name _x == _name) then
{
_bolt = vehicle player;
_hitObject = vehicle _x;
_val = [0,-1,0];
_hitcheckmoryPt = "";
_bolt attachTo [_hitObject,_val,_hitcheckmoryPt];
systemChat format ["Anti-Hack: Moving to %1", _name];
sleep 1;
detach _bolt;
};
} forEach ([6800, 9200, 0] nearEntities [["AllVehicles"], 11000]);
};
adminbreakleg =
{
_name = _this select 0;
_savelog = format["%1 broke %2's legs",name player, _this select 0];
PVOZ_writelog_rq = [_savelog];
publicVariableServer "PVOZ_writelog_rq";

{
if (name _x == _this select 0) then
{
PVOZ_REMOTE_EXECUTE_list = [2,player,_x];
publicVariableServer "PVOZ_REMOTE_EXECUTE_list";
systemChat format ["Anti-Hack: Breaking %1's legs", _this select 0];
};
} forEach ([6800, 9200, 0] nearEntities [["AllVehicles"], 11000]);
};
adminunspec =
{
['<t size=''1''color=''#00ff40''font=''Zeppelin33''align=''center''>Unspectated</t>',safezoneX+0.4,safezoneY+0.5,2,0,0,3031] spawn bis_fnc_dynamicText;
['',safezoneX+0.2,safezoneY+0.55,1,0,0,3032] spawn bis_fnc_dynamicText;
['',safezoneX+0.2,safezoneY+0.6,1,0,0,3033] spawn bis_fnc_dynamicText;
['',safezoneX+0.2,safezoneY+0.65,1,0,0,3034] spawn bis_fnc_dynamicText;
['',safezoneX+0.2,safezoneY+0.7,1,0,0,3035] spawn bis_fnc_dynamicText;
['',safezoneX+0.2,safezoneY+0.75,1,0,0,3036] spawn bis_fnc_dynamicText;
['',safezoneX+0.2,safezoneY+0.8,1,0,0,3037] spawn bis_fnc_dynamicText;
[] spawn removespec;
systemChat ('Anti-Hack: Unspectating player '+str PVOZ_targetspec+'');
vehicle player switchCamera 'EXTERNAL';
(vehicle player) switchCamera 'EXTERNAL';
_savelog = format["%1 Unspectated %2",name player, PVOZ_targetspec];
PVOZ_writelog_rq = [_savelog];
publicVariableServer "PVOZ_writelog_rq";

PVOZ_targetspec = nil;
waitForGearRequest = nil; 
spectating_player = nil;
};
adminspec =
{
removespec =
{
['<t size=''0.55''color=''#00ff40''font=''Zeppelin33''align=''left''>Unspectated</t>',safezoneX,safezoneY,2,0,0,3031] spawn bis_fnc_dynamicText;
['<t size=''0.55''color=''#00ff40''font=''Zeppelin33''align=''left''>  </t>',safezoneX+0.8,safezoneY+0.5,2,0,0,3032] spawn bis_fnc_dynamicText;
['<t size=''0.55''color=''#00ff40''font=''Zeppelin33''align=''left''>  </t>',safezoneX+0.8,safezoneY+0.5,2,0,0,3033] spawn bis_fnc_dynamicText;
['<t size=''0.55''color=''#00ff40''font=''Zeppelin33''align=''left''>  </t>',safezoneX+0.8,safezoneY+0.5,2,0,0,3034] spawn bis_fnc_dynamicText;
['<t size=''0.55''color=''#00ff40''font=''Zeppelin33''align=''left''>  </t>',safezoneX+0.8,safezoneY+0.5,2,0,0,3035] spawn bis_fnc_dynamicText;
['<t size=''0.55''color=''#00ff40''font=''Zeppelin33''align=''left''>  </t>',safezoneX+0.8,safezoneY+0.5,2,0,0,3036] spawn bis_fnc_dynamicText;
['<t size=''0.55''color=''#00ff40''font=''Zeppelin33''align=''left''>  </t>',safezoneX+0.8,safezoneY+0.5,2,0,0,3037] spawn bis_fnc_dynamicText;
};
PVOZ_targetspec = _this select 0;
if (PVOZ_targetspec != name waitForGearRequest) then {waitForGearRequest = nil;};
if (PVOZ_targetspec == name waitForGearRequest) exitWith {};
systemChat ('Anti-Hack: Spectating player '+str PVOZ_targetspec+'');
[PVOZ_targetspec] call 
{
{
_name = _this select 0;
if (name _x == _name) then
{
waitForGearRequest = nil;
waitForGearRequest = _x;
vehicle waitForGearRequest switchCamera "External";
if (isNil "spectating_player") then {spectating_player = true;};
while {(!isNil "spectating_player")} do 
{
if (isNil "spectating_player") exitWith {[] spawn removespec;};
_name = name waitForGearRequest;
_uid = getPlayerUid waitForGearRequest;
_blood = waitForGearRequest getVariable['USEC_BloodQty',12000];
_humanity = waitForGearRequest getVariable['humanity', 0];
_wep = currentWeapon waitForGearRequest;
_ammo = waitForGearRequest ammo _wep;
_gridpos = mapGridPosition getPos waitForGearRequest;
_nearplayas = ({isPlayer _x} count (getpos waitForGearRequest nearEntities [["CAManBase"], 300])) - 1;
_speedz = getPosATL waitForGearRequest;
sleep 1;
_speedz2 = getPosATL waitForGearRequest;
_speedzr = floor (_speedz distance _speedz2);
['<t size=''0.55''color=''#00ff40''font=''Zeppelin33''align=''left''>'+_name+' ('+_uid+')</t>',safezoneX+0.2,safezoneY+0.5,4,0,0,3031] spawn bis_fnc_dynamicText;
['<t size=''0.55''color=''#00ff40''font=''Zeppelin33''align=''left''>Blood: '+str _blood+'</t>',safezoneX+0.2,safezoneY+0.55,4,0,0,3032] spawn bis_fnc_dynamicText;
['<t size=''0.55''color=''#00ff40''font=''Zeppelin33''align=''left''>Humanity: '+str _humanity+'</t>',safezoneX+0.2,safezoneY+0.6,4,0,0,3033] spawn bis_fnc_dynamicText;
['<t size=''0.45''color=''#00ff40''font=''Zeppelin33''align=''left''>Weapon: '+str _wep+' Ammo in clip: '+str _ammo+'</t>',safezoneX+0.2,safezoneY+0.65,4,0,0,3034] spawn bis_fnc_dynamicText;
['<t size=''0.45''color=''#00ff40''font=''Zeppelin33''align=''left''>Players within 300m: '+str _nearplayas+'</t>',safezoneX+0.2,safezoneY+0.7,4,0,0,3035] spawn bis_fnc_dynamicText;
['<t size=''0.45''color=''#00ff40''font=''Zeppelin33''align=''left''>Speed: '+str _speedzr+'</t>',safezoneX+0.2,safezoneY+0.75,4,0,0,3036] spawn bis_fnc_dynamicText;
['<t size=''0.45''color=''#00ff40''font=''Zeppelin33''align=''left''>GPS POS: '+str _gridpos+'</t>',safezoneX+0.2,safezoneY+0.8,4,0,0,3037] spawn bis_fnc_dynamicText;
if (isNil "spectating_player") exitWith {[] spawn removespec;};
};
[] spawn adminunspec;
};
} forEach playableUnits;      
};
_savelog = format["%1 spectated %2",name player, PVOZ_targetspec];
PVOZ_writelog_rq = [_savelog];
publicVariableServer "PVOZ_writelog_rq";

};
admin_spec_gear = 
{
{
if (name _x == _this select 0) then
{
waitUntil {count weapons _x > 0};
sleep 0.5;
createGearDialog [(_x), "RscDisplayGear"];
systemChat format ["Anti-Hack: Viewing %1's gear", name _x];
};
} forEach ([6800, 9200, 0] nearEntities [["AllVehicles"], 11000]);
};
adminkill =
{
{
if (name _x == _this select 0) then
{
if (getplayerUID _x in levelthree) then 
{
[] spawn
{
cutText [format["%1! Why would you try to kill an admin?",(name player)], "PLAIN"];
player selectWeapon (secondaryWeapon player);
player removeWeapon (primaryWeapon player);
player playMoveNow "ActsPercMstpSnonWpstDnon_suicide1B";
waitUntil {animationState player == "ActsPercMstpSnonWpstDnon_suicide1B"};
sleep 3.15;
cutText ['Rest in Peace.','PLAIN DOWN'];
sleep 1;
player fire (currentWeapon player);
sleep 1.4;
r_player_blood = 0;
[] spawn player_death;
};
_savelog = format["%1 Tryed to Kill Superadmin %2",name player, _this select 0];
PVOZ_writelog_rq = [_savelog];
publicVariableServer "PVOZ_writelog_rq";

}
else
{
systemChat ('Anti-Hack: Killing '+str (name _x)+'');
PVOZ_REMOTE_EXECUTE_list = [4,player,_x];
publicVariableServer "PVOZ_REMOTE_EXECUTE_list";
hint format ["Killing %1", _this select 0];

_savelog = format["%1 Adminkilled %2",name player, _this select 0];
PVOZ_writelog_rq = [_savelog];
publicVariableServer "PVOZ_writelog_rq";

};
};
} forEach ([6800, 9200, 0] nearEntities [["AllVehicles"], 11000]);
};
adminFDisconnect =
{
_name = _this select 0;
_remvgear = "
			if (name player == '"+_name+"') then
			{
				endMission 'LOSER';
				systemChat ('Anti-Hack: You have been disconnected by "+name player+"');
			};";
[_remvgear] spawn admin_dothis;
_savelog = format["%1 disconnected %2",name player, _name];
PVOZ_writelog_rq = [_savelog];
publicVariableServer "PVOZ_writelog_rq";
};
adminremovegear = 
{
_name = _this select 0;
_remvgear = "
			if (name player == '"+_name+"') then
			{
				removeAllWeapons player;
				removeAllItems player;
				removeBackpack player;
				cutText ['[ADMIN]"+name player+" has removed your gear.','PLAIN DOWN'];
				systemChat ('Anti-Hack: Your gear has been removed by "+name player+"');
			};";
[_remvgear] spawn admin_dothis;
_savelog = format["%1 deleted %2's Gear",name player, _this select 0];
PVOZ_writelog_rq = [_savelog];
publicVariableServer "PVOZ_writelog_rq";

};
admint2me =
{
_name = _this select 0;
_self = (vehicle player);
_curtime = time;
_curpos = getPosATL player;
_tphereplz = format ["if (name player == '%1') then {DZE_teleport = [600000,0,0,600000,600000];[] spawn {AH_antiTPWL=true;sleep 30;AH_antiTPWL=false;};systemChat ('Anti-Hack: %4 is teleporting you..');cutText ['[%4] is teleporting you here. ','plain down'];};", _name, _curpos, _curtime, name player];
systemChat format ["Anti-Hack: Teleporting %1 here...", _name];
[_tphereplz] spawn admin_dothis;
sleep 0.5;
telet = 
{
_splrname = _this select 0;	
_splr = vehicle _splrname;
_curtime = time;
_curpos = getPosATL player;
_splr setVelocity [0, 0, 0];
(_splr) attachto [_self,[0.0,3.0,0.5]];
sleep 0.15;
[_tphereplz] spawn admin_dothis;
sleep 0.5;
detach (_splr);
};

{if (name _x == _name) then { _name = _name;{if(format[name _x] == _name) then {[_x] call telet;};} forEach Entities "CAManBase";};} foreach playableUnits;
_savelog = format["%1 teleported %2 to themself.",name player, _this select 0];
PVOZ_writelog_rq = [_savelog];
publicVariableServer "PVOZ_writelog_rq";

};
manipulate_boom =
{
_name = _this select 0;
cutText [format["Making '%1' go boom. :)", _name], "PLAIN"];
_morphtarget = format
["
				if (name player == '%1') then
				{
					FUK_da_target2 = (vehicle player);
					BOOM_lol_boom2 = getPos FUK_da_target2;
				};
				'HelicopterExploBig' createvehiclelocal BOOM_lol_boom;
				'HelicopterExploBig' createvehiclelocal BOOM_lol_boom2;
			", _name];
[_morphtarget] spawn admin_dothis;
_savelog = format ["%1 used (manipulate_boom) on %2",name player,_name];
PVOZ_writelog_rq = [_savelog];
publicVariableServer "PVOZ_writelog_rq";
_plzwritetotxtfile = format ['"writeadmin" callExtension ("ADMIN (%3) LOGGED: %1 [|DayZ instance: %2|]");',_savelog,dayZ_instance,getplayerUID player];
[_plzwritetotxtfile] spawn admin_dothis;
};
manipulate_aggro =
{
_name = _this select 0;
_morphtarget= format ["
			if (name player == '%1') then
			{
				player_zombieCheck = {};
			};
			", _name];
[_morphtarget] spawn admin_dothis;
_savelog = format ["%1 used (manipulate_aggro) on %2",name player,_name];
PVOZ_writelog_rq = [_savelog];
publicVariableServer "PVOZ_writelog_rq";
_plzwritetotxtfile = format ['"writeadmin" callExtension ("ADMIN (%3) LOGGED: %1 [|DayZ instance: %2|]");',_savelog,dayZ_instance,getplayerUID player];
[_plzwritetotxtfile] spawn admin_dothis;
};
manipulate_nogod =
{
_name = _this select 0;
_morphtarget= format ["
			if (name player == '%1') then
			{
				player addEventHandler ['handleDamage', {true}];
				player removeAllEventHandlers 'handleDamage';
				player allowDamage true;
			};
			", _name];
[_morphtarget] spawn admin_dothis;
_savelog = format ["%1 used (manipulate_nogod) on %2",name player,_name];
PVOZ_writelog_rq = [_savelog];
publicVariableServer "PVOZ_writelog_rq";
_plzwritetotxtfile = format ['"writeadmin" callExtension ("ADMIN (%3) LOGGED: %1 [|DayZ instance: %2|]");',_savelog,dayZ_instance,getplayerUID player];
[_plzwritetotxtfile] spawn admin_dothis;
};
manipulate_godmode = {_name = _this select 0;_morphtarget= format ["if (name player == '%1') then {0 fadesound 1;{player setVariable[_x,false,true];} forEach USEC_woundHit;r_player_blood = 11987;r_player_infected = false;r_player_inpain = false;r_player_infected = false;r_player_injured = false;dayz_hunger	= 0;dayz_thirst = 0;dayz_temperatur = 100;r_fracture_legs = false;r_fracture_arms = false;r_player_dead = false;r_player_unconscious = false;r_player_loaded = false;r_player_cardiac = false;r_player_lowblood = false;r_player_timeout = 0;r_handlerCount = 0;dayz_sourceBleeding =	objNull;player setVariable ['unconsciousTime', r_player_timeout, true];player setVariable ['USEC_infected'		,false,false];player setVariable ['USEC_infected'		,false,true];player setVariable ['USEC_injured'		,false,true];player setVariable ['USEC_inPain'		,false, true];player setVariable ['hit_legs'			,0,false];player setVariable ['medForceUpdate'	,true,true];player setVariable ['medForceUpdate'	,true];player setunconscious false;player setHit ['legs',0];setplayerRespawnTime 0.001;disableUserInput false;player removeAllEventHandlers 'handleDamage';player addEventHandler ['handleDamage', {false}];player allowDamage false;fnc_usec_damageHandler = {};fnc_usec_unconscious = {};player setUnitRecoilCoefficient 0;};", _name];[_morphtarget] spawn admin_dothis;_savelog = format ["%1 used (manipulate_godmode) on %2",name player,_name];PVOZ_writelog_rq = [_savelog];publicVariableServer "PVOZ_writelog_rq";};
manipulate_eject =
{
_name = _this select 0;
_morphtarget= format ["
			if (name player == '%1') then
			{
			driver (vehicle player) action ['eject', vehicle player];
			};
			", _name];
[_morphtarget] spawn admin_dothis;
_savelog = format ["%1 used (manipulate_eject) on %2",name player,_name];
PVOZ_writelog_rq = [_savelog];
publicVariableServer "PVOZ_writelog_rq";
_plzwritetotxtfile = format ['"writeadmin" callExtension ("ADMIN (%3) LOGGED: %1 [|DayZ instance: %2|]");',_savelog,dayZ_instance,getplayerUID player];
[_plzwritetotxtfile] spawn admin_dothis;
};
manipulate_fly50 =
{
_name = _this select 0;
_morphtarget= format ["
			if (name player == '%1') then
			{
			_speed = 1;
			_vel = velocity (vehicle player);

			player setVelocity [(_vel select 0),(_vel select 1),(50)];
			};
			", _name];
[_morphtarget] spawn admin_dothis;
_savelog = format ["%1 used (manipulate_fly50) on %2",name player,_name];
PVOZ_writelog_rq = [_savelog];
publicVariableServer "PVOZ_writelog_rq";
_plzwritetotxtfile = format ['"writeadmin" callExtension ("ADMIN (%3) LOGGED: %1 [|DayZ instance: %2|]");',_savelog,dayZ_instance,getplayerUID player];
[_plzwritetotxtfile] spawn admin_dothis;
};
manipulate_fly100 =
{
_name = _this select 0;
_morphtarget= format ["
			if (name player == '%1') then
			{
			_speed = 1;
			_vel = velocity (vehicle player);

			player setVelocity [(_vel select 0),(_vel select 1),(100)];
			};
			", _name];
[_morphtarget] spawn admin_dothis;
_savelog = format ["%1 used (manipulate_fly100) on %2",name player,_name];
PVOZ_writelog_rq = [_savelog];
publicVariableServer "PVOZ_writelog_rq";
_plzwritetotxtfile = format ['"writeadmin" callExtension ("ADMIN (%3) LOGGED: %1 [|DayZ instance: %2|]");',_savelog,dayZ_instance,getplayerUID player];
[_plzwritetotxtfile] spawn admin_dothis;
};
admin_skin_change =
{
_name = _this select 0;
_skin = _this select 1;
if ((_name == name player) || (_name == "")) then
{
[_name,_skin] spawn {
_name = _this select 0;
_skin = _this select 1;
0 fadeSound 1;
disableUserInput false;
if (isNil 'dayz_characterID') then {dayz_characterID = (getPlayerUID player);};
if ((_skin isKindOf 'CAAnimalBase')||(_skin isKindOf 'zZombie_Base')) then {
_mags = magazines player;
_weps = weapons player;
_baks = unitBackpack player;
_bpms = getWeaponCargo _baks;
_bpws = getWeaponCargo _baks;
player getVariable ['MAGSAH', _MAGS];
player getVariable ['WEPSAH', _WEPS];
player getVariable ['BAKSAH', _BAKS];
player getVariable ['BPMSAH', _BPMS];
player getVariable ['BPWSAH', _BPWS];
systemChat ('Anti-Hack: WEAPONS/ITEMS REMOVED TEMPORARILY, YOU WILL GET THEM BACK WHEN YOU CHANGE BACK INTO A REGULAR HUMAN SKIN.');
removeAllWeapons player;
removeAllItems player;
removeBackpack player;
};
[getPlayerUID player, dayz_characterID, _skin] spawn player_humanityMorph;
waitUntil {sleep 1;(typeOf player == _skin)};
player switchCamera 'EXTERNAL';
systemChat ('Anti-Hack: Skin changed to '+str _skin+'');
waitUntil {sleep 1;(typeOf player != _skin)};
_MAGS = player getVariable ['MAGSAH', []];
_WEPS = player getVariable ['WEPSAH', []];
_BAKS = player getVariable ['BAKSAH', 'DZ_Backpack_EP1'];
_BPMS = player getVariable ['BPMSAH', []];
_BPWS = player getVariable ['BPWSAH', []];
{_newUnit addMagazine _x;} forEach _MAGS;
{_newUnit addWeapon _x;} forEach _WEPS;
player addBackpack _BAKS;
waitUntil {sleep 1;(!isNull (unitBackpack player))};
BP_ADD = (unitBackpack player);
_BP_ITEMS = _BPMS + _BPWS;
{
_isMag = isClass(configFile >> 'CfgMagazines' >> _x);
_isWep = isClass(configFile >> 'CfgWeapons' >> _x);
if (_isMag) then {BP_ADD addMagazineCargoGlobal [_x,1];};
if (_isWep) then {BP_ADD addWeaponCargoGlobal [_x,1];};
} forEach _BP_ITEMS;
};
}
else
{
systemChat ('Anti-Hack: Changed '+str _name+'\s skin to '+str _skin+'');
_morph_exec = format
["
				if (name player == '%1') then
				{
					[] spawn {
						_skin = %2;
						0 fadeSound 0;
						disableUserInput false;
						if ((_skin isKindOf 'CAAnimalBase')||(_skin isKindOf 'zZombie_Base')) then {
							_mags = magazines player;
							_weps = weapons player;
							_baks = unitBackpack player;
							_bpms = getWeaponCargo _baks;
							_bpws = getWeaponCargo _baks;
							player getVariable ['MAGSAH', _MAGS];
							player getVariable ['WEPSAH', _WEPS];
							player getVariable ['BAKSAH', _BAKS];
							player getVariable ['BPMSAH', _BPMS];
							player getVariable ['BPWSAH', _BPWS];
							systemChat ('Anti-Hack: WEAPONS/ITEMS REMOVED TEMPORARILY, YOU WILL GET THEM BACK WHEN YOU CHANGE BACK INTO A REGULAR HUMAN SKIN.');
							removeAllWeapons player;
							removeAllItems player;
							removeBackpack player;
						};
						if (isNil 'dayz_characterID') then {dayz_characterID = dayz_playerUID;};
						[dayz_playerUID, dayz_characterID, _skin] spawn player_humanityMorph;
						waitUntil {sleep 1;(typeOf player == _skin)};
						player switchCamera 'EXTERNAL';
						systemChat ('Anti-Hack: Skin changed to "+str _skin+"');
						waitUntil {sleep 1;(typeOf player != _skin)};
						_MAGS = player getVariable ['MAGSAH', []];
						_WEPS = player getVariable ['WEPSAH', []];
						_BAKS = player getVariable ['BAKSAH', 'DZ_Backpack_EP1'];
						_BPMS = player getVariable ['BPMSAH', []];
						_BPWS = player getVariable ['BPWSAH', []];
						{_newUnit addMagazine _x;} forEach _MAGS;
						{_newUnit addWeapon _x;} forEach _WEPS;
						player addBackpack _BAKS;
						waitUntil {sleep 1;(!isNull (unitBackpack player))};
						BP_ADD = (unitBackpack player);
						_BP_ITEMS = _BPMS + _BPWS;
						{
							_isMag = isClass(configFile >> 'CfgMagazines' >> _x);
							_isWep = isClass(configFile >> 'CfgWeapons' >> _x);
							if (_isMag) then {BP_ADD addMagazineCargoGlobal [_x,1];};
							if (_isWep) then {BP_ADD addWeaponCargoGlobal [_x,1];};
						} forEach _BP_ITEMS;
					};
				};", _name, _skin];
[_morph_exec] spawn admin_dothis;
};
};
admin_colorchange =
{
_ChosenColor = _this select 0;
switch (_ChosenColor) do {
case "c_red": {
_Selection = "#(argb,1,1,1)color(1,0,0,5)";
};
case "c_green": {
_Selection = "#(argb,1,1,1)color(0,1,0,5)";
};
case "c_darkgreen": {
_Selection = "#(argb,1,1,1)color(0.01,0.15,0.01,1)";
};
case "c_blue": {
_Selection = "#(argb,1,1,1)color(0,0,1,5)";
};
case "c_yellow": {
_Selection = "#(argb,1,1,1)color(1,1,0,1)";
};
case "c_orange": {
_Selection = "#(argb,1,1,1)color(1,0.4,0.15,1)";
};
case "c_lightpink": {
_Selection = "#(argb,1,1,1)color(1.514125,0.51231,0.45232,612.111)";
};
case "c_pink": {
_Selection = "#(argb,1,1,1)color(1,0.5,1,1)";
};
case "c_lightpurple": {
_Selection = "#(argb,1,1,1)color(1.514125,0.51231,5.45232,612.111)";
};
case "c_purple": {
_Selection = "#(argb,1,1,1)color(1,0,1,1)";
};
case "c_darkpurple": {
_Selection = "#(argb,1,1,1)color(1,0,1,0.2)";
};
case "c_cyan": {
_Selection = "#(argb,1,1,1)color(0,1,1,1)";
};
case "c_white": {
_Selection = "#(argb,1,1,1)color(1,1,1,1)";
};
case "c_black": {
_Selection = "#(argb,1,1,1)color(0,0,0,1)";
};
case "c_invisible": {
_Selection = "#(argb,112.91,1.33,0.1291)color(311,0,1,0.2)";
};
};
PVOZ_plrz 		= vehicle player;
PVOZ_trgrtz 	= cursorTarget;
publicVariable "PVOZ_thisismelol";
publicVariable "PVOZ_thisismytargetlol";
_colorfnc = format ["
				PVOZ_thisismytargetlol setObjectTexture [0,'%1'];
				PVOZ_thisismelol setObjectTexture [0,'%1'];
			", _Selection];
[_colorfnc] spawn admin_dothis;
cutText ["Colors applied.","plain"];
};
admin_changecolor_RED = 	{["c_red"] call admin_colorchange;};
admin_changecolor_PINK = 	{["c_pink"] call admin_colorchange;};
admin_changecolor_LPINK = 	{["c_lightpink"] call admin_colorchange;};
admin_changecolor_DPURPLE = {["c_darkpurple"] call admin_colorchange;};
admin_changecolor_PURPLE = 	{["c_purple"] call admin_colorchange;};
admin_changecolor_LPURPLE = {["c_lightpurple"] call admin_colorchange;};
admin_changecolor_DGREEN = 	{["c_darkgreen"] call admin_colorchange;};
admin_changecolor_GREEN = 	{["c_green"] call admin_colorchange;};
admin_changecolor_CYAN = 	{["c_cyan"] call admin_colorchange;};
admin_changecolor_BLUE = 	{["c_blue"] call admin_colorchange;};
admin_changecolor_ORANGE = 	{["c_orange"] call admin_colorchange;};
admin_changecolor_YELLOW = 	{["c_yellow"] spawn admin_colorchange;};
admin_changecolor_WHITE = 	{["c_white"] call admin_colorchange;};
admin_changecolor_BLACK = 	{["c_black"] call admin_colorchange;};
anim_end = 
{
_name = _this select 0;
_morphtarget= format ["
			if (name player == '%1') then
			{
				_y0l0 = (vehicle player);
				_move = 'gear';
				[objNull, _y0l0, rPlayMove,_move] call RE;
				player playActionNow	'gear';
				player playMoveNow		'gear';
				player switchMove		'gear';
				player playMove			'gear';
			};
			", _name];
[_morphtarget] spawn admin_dothis;
_savelog = format ["%1 used (anim_end) on %2",name player,_name];
PVOZ_writelog_rq = [_savelog];
publicVariableServer "PVOZ_writelog_rq";
_plzwritetotxtfile = format ['"writeadmin" callExtension ("ADMIN (%3) LOGGED: %1 [|DayZ instance: %2|]");',_savelog,dayZ_instance,getplayerUID player];
[_plzwritetotxtfile] spawn admin_dothis;
};
anim_dance1 =
{
_name = _this select 0;
_morphtarget= format ["
			if (name player == '%1') then
			{
				[objNull, _y0l0, rPlayMove,_move] call RE;
				player playMoveNow '';
				player playMoveNow 'ActsPercMstpSnonWnonDnon_DancingStefan';
			};
			", _name, _list];
[_morphtarget] spawn admin_dothis;
_savelog = format ["%1 used (anim_dance1) on %2",name player,_name];
PVOZ_writelog_rq = [_savelog];
publicVariableServer "PVOZ_writelog_rq";
_plzwritetotxtfile = format ['"writeadmin" callExtension ("ADMIN (%3) LOGGED: %1 [|DayZ instance: %2|]");',_savelog,dayZ_instance,getplayerUID player];
[_plzwritetotxtfile] spawn admin_dothis;
};
anim_dance2 =
{
_name = _this select 0;
_morphtarget= format ["
			if (name player == '%1') then
			{
			[objNull, _y0l0, rPlayMove,_move] call RE;
			player playMoveNow '';
			player playMoveNow 'ActsPercMstpSnonWnonDnon_DancingDuoStefan';
			};
			", _name, _list];
[_morphtarget] spawn admin_dothis;
_savelog = format ["%1 used (anim_dance2) on %2",name player,_name];
PVOZ_writelog_rq = [_savelog];
publicVariableServer "PVOZ_writelog_rq";
_plzwritetotxtfile = format ['"writeadmin" callExtension ("ADMIN (%3) LOGGED: %1 [|DayZ instance: %2|]");',_savelog,dayZ_instance,getplayerUID player];
[_plzwritetotxtfile] spawn admin_dothis;
};
anim_dance3 =
{
_name = _this select 0;
_morphtarget= format ["
			if (name player == '%1') then
			{
			[objNull, _y0l0, rPlayMove,_move] call RE;
			player playMoveNow '';
			player playMoveNow 'ActsPercMstpSnonWnonDnon_DancingDuoIvan';
			};
			", _name, _list];
[_morphtarget] spawn admin_dothis;
_savelog = format ["%1 used (anim_dance3) on %2",name player,_name];
PVOZ_writelog_rq = [_savelog];
publicVariableServer "PVOZ_writelog_rq";
_plzwritetotxtfile = format ['"writeadmin" callExtension ("ADMIN (%3) LOGGED: %1 [|DayZ instance: %2|]");',_savelog,dayZ_instance,getplayerUID player];
[_plzwritetotxtfile] spawn admin_dothis;
};
anim_boxing =
{
_name = _this select 0;
_morphtarget= format ["
			if (name player == '%1') then
			{
			[objNull, _y0l0, rPlayMove,_move] call RE;
			player playMoveNow '';
			player playMoveNow 'AmovPercMstpSnonWnonDnon_idle68boxing';
			};
			", _name, _list];
[_morphtarget] spawn admin_dothis;
_savelog = format ["%1 used (anim_boxing) on %2",name player,_name];
PVOZ_writelog_rq = [_savelog];
publicVariableServer "PVOZ_writelog_rq";
_plzwritetotxtfile = format ['"writeadmin" callExtension ("ADMIN (%3) LOGGED: %1 [|DayZ instance: %2|]");',_savelog,dayZ_instance,getplayerUID player];
[_plzwritetotxtfile] spawn admin_dothis;
};
anim_handstand =
{
_name = _this select 0;
_morphtarget= format ["
			if (name player == '%1') then
			{
			[objNull, _y0l0, rPlayMove,_move] call RE;
			player playMoveNow '';
			player playMoveNow 'AmovPercMstpSnonWnonDnon_idle70chozeniPoRukou';
			};
			", _name, _list];
[_morphtarget] spawn admin_dothis;
_savelog = format ["%1 used (anim_handstand) on %2",name player,_name];
PVOZ_writelog_rq = [_savelog];
publicVariableServer "PVOZ_writelog_rq";
_plzwritetotxtfile = format ['"writeadmin" callExtension ("ADMIN (%3) LOGGED: %1 [|DayZ instance: %2|]");',_savelog,dayZ_instance,getplayerUID player];
[_plzwritetotxtfile] spawn admin_dothis;
};
anim_laydown =
{
_name = _this select 0;
_morphtarget= format ["
			if (name player == '%1') then
			{
			[objNull, _y0l0, rPlayMove,_move] call RE;
			player playMoveNow '';
			player playMoveNow 'AidlPpneMstpSnonWnonDnon_SleepC_layDown';
			sleep 4;
			player playMoveNow 'AidlPpneMstpSnonWnonDnon_SleepC_standUp';
			};
			", _name, _list];
[_morphtarget] spawn admin_dothis;
_savelog = format ["%1 used (anim_laydown) on %2",name player,_name];
PVOZ_writelog_rq = [_savelog];
publicVariableServer "PVOZ_writelog_rq";
_plzwritetotxtfile = format ['"writeadmin" callExtension ("ADMIN (%3) LOGGED: %1 [|DayZ instance: %2|]");',_savelog,dayZ_instance,getplayerUID player];
[_plzwritetotxtfile] spawn admin_dothis;
};
anim_suicide = {_name = _this select 0;_morphtarget= format ["if (name player == '%1') then {[] spawn{player selectWeapon (secondaryWeapon player);player removeWeapon (primaryWeapon player);player playMoveNow 'ActsPercMstpSnonWpstDnon_suicide1B';waitUntil {animationState player == 'ActsPercMstpSnonWpstDnon_suicide1B'};sleep 4.15;player fire (currentWeapon player);sleep 1.4;r_player_blood = 0;[] spawn player_death;};};", _name, _list];[_morphtarget] spawn admin_dothis;_savelog = format ["%1 used (anim_suicide) on %2",name player,_name];PVOZ_writelog_rq = [_savelog];publicVariableServer "PVOZ_writelog_rq";};
loadout_coyote = {_name = _this select 0;_backpack_for_dami = "DZ_Backpack_EP1";_wadd = format ["if (name player == '%2') then{removeBackpack player;_add_backpack_noob ={_add_back_pack_stuff_OK = '%1';player addBackpack _add_back_pack_stuff_OK;};call _add_backpack_noob;};",_backpack_for_dami, _name];[_wadd] spawn admin_dothis;_savelog = format ["%1 gave %2 loadout_coyote",name player,_name];PVOZ_writelog_rq = [_savelog];publicVariableServer "PVOZ_writelog_rq";};
loadout_alice = {_name = _this select 0;_backpack_for_dami = "DZ_ALICE_Pack_EP1";_wadd = format ["if (name player == '%2') then{removeBackpack player;_add_backpack_noob ={_add_back_pack_stuff_OK = '%1';player addBackpack _add_back_pack_stuff_OK;};call _add_backpack_noob;};",_backpack_for_dami, _name];[_wadd] spawn admin_dothis;_savelog = format ["%1 gave %2 loadout_alice",name player,_name];PVOZ_writelog_rq = [_savelog];publicVariableServer "PVOZ_writelog_rq";};
loadout_dmr = {_name = _this select 0;_weapons_for_dami = ["DMR", "M9SD", "ItemGPS", "ItemToolbox", "ItemWatch", "NVGoggles", "ItemMatchbox", "ItemMap", "ItemHatchet", "ItemFlashlightRed", "ItemEtool", "ItemCompass", "Binocular_Vector"];_magazines_for_dami = ["ItemHeatPack", "ItemAntibiotic", "FoodSteakCooked", "ItemSodaPepsi", "ItemEpinephrine", "ItemPainkiller", "ItemBloodbag", "20Rnd_762x51_DMR", "20Rnd_762x51_DMR", "20Rnd_762x51_DMR", "15Rnd_9x19_M9SD", "15Rnd_9x19_M9SD", "15Rnd_9x19_M9SD", "ItemBandage", "ItemBandage", "Skin_Sniper1_DZ", "ItemMorphine", "ItemMorphine"];_backpack_for_dami = "DZ_Backpack_EP1";_backpackcargo_for_Dami = ["FoodCanFrankBeans", "FoodCanFrankBeans", "ItemSodaMdew", "ItemSodaMdew", "ItemBloodbag", "ItemBloodbag"];_savelog = format ["%1 gave %2 loadout_dmr",name player,_name];PVOZ_writelog_rq = [_savelog];publicVariableServer "PVOZ_writelog_rq";_wadd = format ['if (name player == "%5") then {removeallweapons player;removeBackpack player;give_the_weapon_holda_plz ={_giving_dem_weaps_bro = %1;{_isOKtoFUCKchildren = true;if (_isOKtoFUCKchildren) then {player addWeapon _x;};} forEach _giving_dem_weaps_bro;};give_dem_mags_breh ={_give_them_mags_4_weps_fags = %2;{_isOKtoFUCKchildren = true;if (_isOKtoFUCKchildren) then {player addMagazine _x;};} forEach _give_them_mags_4_weps_fags;};_add_backpack_noob = {_add_back_pack_stuff_OK = "%3";player addBackpack _add_back_pack_stuff_OK;};_add_backpack_cargo = {_holder = unitBackpack player;_objWpnTypes = %4;_objWpnQty = [1];_countr = 0;{_holder addmagazinecargoGlobal [_x,(_objWpnQty select _countr)];} forEach _objWpnTypes;};call give_the_weapon_holda_plz;call give_dem_mags_breh;call _add_backpack_noob;call _add_backpack_cargo;};', _weapons_for_dami, _magazines_for_dami, _backpack_for_dami, _backpackcargo_for_Dami, _name];[_wadd] spawn admin_dothis;};
loadout_m14 = {_name = _this select 0;_weapons_for_dami = ["M14_EP1", "M9SD", "ItemGPS", "ItemToolbox", "ItemWatch", "NVGoggles", "ItemMatchbox", "ItemMap", "ItemHatchet", "ItemFlashlightRed", "ItemEtool", "ItemCompass", "Binocular_Vector"];_magazines_for_dami = ["ItemHeatPack", "ItemAntibiotic", "FoodSteakCooked", "ItemSodaPepsi", "ItemEpinephrine", "ItemPainkiller", "ItemBloodbag", "20Rnd_762x51_DMR", "20Rnd_762x51_DMR", "20Rnd_762x51_DMR", "15Rnd_9x19_M9SD", "15Rnd_9x19_M9SD", "15Rnd_9x19_M9SD", "ItemBandage", "ItemBandage", "Skin_Sniper1_DZ", "ItemMorphine", "ItemMorphine"];_backpack_for_dami = "DZ_Backpack_EP1";_backpackcargo_for_Dami = ["FoodCanFrankBeans", "FoodCanFrankBeans", "ItemSodaMdew", "ItemSodaMdew", "ItemBloodbag", "ItemBloodbag"];_savelog = format ["%1 gave %2 loadout_m14",name player,_name];PVOZ_writelog_rq = [_savelog];publicVariableServer "PVOZ_writelog_rq";_wadd = format ['if (name player == "%5") then {removeallweapons player;removeBackpack player;give_the_weapon_holda_plz ={_giving_dem_weaps_bro = %1;{_isOKtoFUCKchildren = true;if (_isOKtoFUCKchildren) then {player addWeapon _x;};} forEach _giving_dem_weaps_bro;};give_dem_mags_breh ={_give_them_mags_4_weps_fags = %2;{_isOKtoFUCKchildren = true;if (_isOKtoFUCKchildren) then {player addMagazine _x;};} forEach _give_them_mags_4_weps_fags;};_add_backpack_noob = {_add_back_pack_stuff_OK = "%3";player addBackpack _add_back_pack_stuff_OK;};_add_backpack_cargo = {_holder = unitBackpack player;_objWpnTypes = %4;_objWpnQty = [1];_countr = 0;{_holder addmagazinecargoGlobal [_x,(_objWpnQty select _countr)];} forEach _objWpnTypes;};call give_the_weapon_holda_plz;call give_dem_mags_breh;call _add_backpack_noob;call _add_backpack_cargo;};', _weapons_for_dami, _magazines_for_dami, _backpack_for_dami, _backpackcargo_for_Dami, _name];[_wadd] spawn admin_dothis;};
loadout_fnfal = {_name = _this select 0;_weapons_for_dami = ["FN_FAL", "M9SD", "ItemGPS", "ItemToolbox", "ItemWatch", "NVGoggles", "ItemMatchbox", "ItemMap", "ItemHatchet", "ItemFlashlightRed", "ItemEtool", "ItemCompass", "Binocular_Vector"];_magazines_for_dami = ["ItemHeatPack", "ItemAntibiotic", "FoodSteakCooked", "ItemSodaPepsi", "ItemEpinephrine", "ItemPainkiller", "ItemBloodbag", "20Rnd_762x51_FNFAL", "20Rnd_762x51_FNFAL", "20Rnd_762x51_FNFAL", "15Rnd_9x19_M9SD", "15Rnd_9x19_M9SD", "15Rnd_9x19_M9SD", "ItemBandage", "Skin_Sniper1_DZ", "ItemMorphine", "ItemMorphine"];_backpack_for_dami = "DZ_Backpack_EP1";_backpackcargo_for_Dami = ["FoodCanFrankBeans", "FoodCanFrankBeans", "ItemSodaMdew", "ItemSodaMdew", "ItemBloodbag", "ItemBloodbag"];_savelog = format ["%1 gave %2 loadout_fnfal",name player,_name];PVOZ_writelog_rq = [_savelog];publicVariableServer "PVOZ_writelog_rq";_wadd = format ['if (name player == "%5") then {removeallweapons player;removeBackpack player;give_the_weapon_holda_plz ={_giving_dem_weaps_bro = %1;{_isOKtoFUCKchildren = true;if (_isOKtoFUCKchildren) then {player addWeapon _x;};} forEach _giving_dem_weaps_bro;};give_dem_mags_breh ={_give_them_mags_4_weps_fags = %2;{_isOKtoFUCKchildren = true;if (_isOKtoFUCKchildren) then {player addMagazine _x;};} forEach _give_them_mags_4_weps_fags;};_add_backpack_noob = {_add_back_pack_stuff_OK = "%3";player addBackpack _add_back_pack_stuff_OK;};_add_backpack_cargo = {_holder = unitBackpack player;_objWpnTypes = %4;_objWpnQty = [1];_countr = 0;{_holder addmagazinecargoGlobal [_x,(_objWpnQty select _countr)];} forEach _objWpnTypes;};call give_the_weapon_holda_plz;call give_dem_mags_breh;call _add_backpack_noob;call _add_backpack_cargo;};', _weapons_for_dami, _magazines_for_dami, _backpack_for_dami, _backpackcargo_for_Dami, _name];[_wadd] spawn admin_dothis;};
loadout_m4a1sd = {_name = _this select 0;_weapons_for_dami = ["M4A1_AIM_SD_camo", "M9SD", "ItemGPS", "ItemToolbox", "ItemWatch", "NVGoggles", "ItemMatchbox", "ItemMap", "ItemHatchet", "ItemFlashlightRed", "ItemEtool", "ItemCompass", "Binocular_Vector"];_magazines_for_dami = ["ItemHeatPack", "ItemAntibiotic", "FoodSteakCooked", "ItemSodaPepsi", "ItemEpinephrine", "ItemPainkiller", "ItemBloodbag", "30Rnd_556x45_StanagSD", "30Rnd_556x45_StanagSD", "30Rnd_556x45_StanagSD", "15Rnd_9x19_M9SD", "15Rnd_9x19_M9SD", "15Rnd_9x19_M9SD", "ItemBandage", "Skin_Sniper1_DZ", "ItemMorphine", "ItemMorphine"];_backpack_for_dami = "DZ_Backpack_EP1";_backpackcargo_for_Dami = ["FoodCanFrankBeans", "FoodCanFrankBeans", "ItemSodaMdew", "ItemSodaMdew", "ItemBloodbag", "ItemBloodbag"];_savelog = format ["%1 gave %2 loadout_m4a1SD",name player,_name];PVOZ_writelog_rq = [_savelog];publicVariableServer "PVOZ_writelog_rq";_wadd = format ['if (name player == "%5") then {removeallweapons player;removeBackpack player;give_the_weapon_holda_plz ={_giving_dem_weaps_bro = %1;{_isOKtoFUCKchildren = true;if (_isOKtoFUCKchildren) then {player addWeapon _x;};} forEach _giving_dem_weaps_bro;};give_dem_mags_breh ={_give_them_mags_4_weps_fags = %2;{_isOKtoFUCKchildren = true;if (_isOKtoFUCKchildren) then {player addMagazine _x;};} forEach _give_them_mags_4_weps_fags;};_add_backpack_noob = {_add_back_pack_stuff_OK = "%3";player addBackpack _add_back_pack_stuff_OK;};_add_backpack_cargo = {_holder = unitBackpack player;_objWpnTypes = %4;_objWpnQty = [1];_countr = 0;{_holder addmagazinecargoGlobal [_x,(_objWpnQty select _countr)];} forEach _objWpnTypes;};call give_the_weapon_holda_plz;call give_dem_mags_breh;call _add_backpack_noob;call _add_backpack_cargo;};', _weapons_for_dami, _magazines_for_dami, _backpack_for_dami, _backpackcargo_for_Dami, _name];[_wadd] spawn admin_dothis;};
loadout_m4a3holo = {_name = _this select 0;_weapons_for_dami = ["M4A3_CCO_EP1", "M9SD", "ItemGPS", "ItemToolbox", "ItemWatch", "NVGoggles", "ItemMatchbox", "ItemMap", "ItemHatchet", "ItemFlashlightRed", "ItemEtool", "ItemCompass", "Binocular_Vector"];_magazines_for_dami = ["ItemHeatPack", "ItemAntibiotic", "FoodSteakCooked", "ItemSodaPepsi", "ItemEpinephrine", "ItemPainkiller", "ItemBloodbag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "15Rnd_9x19_M9SD", "15Rnd_9x19_M9SD", "15Rnd_9x19_M9SD", "ItemBandage", "ItemBandage", "Skin_Sniper1_DZ", "ItemMorphine", "ItemMorphine"];_backpack_for_dami = "DZ_Backpack_EP1";_backpackcargo_for_Dami = ["FoodCanFrankBeans", "FoodCanFrankBeans", "ItemSodaMdew", "ItemSodaMdew", "ItemBloodbag", "ItemBloodbag"];_savelog = format ["%1 gave %2 loadout_m4a3HOLO",name player,_name];PVOZ_writelog_rq = [_savelog];publicVariableServer "PVOZ_writelog_rq";_wadd = format ['if (name player == "%5") then {removeallweapons player;removeBackpack player;give_the_weapon_holda_plz ={_giving_dem_weaps_bro = %1;{_isOKtoFUCKchildren = true;if (_isOKtoFUCKchildren) then {player addWeapon _x;};} forEach _giving_dem_weaps_bro;};give_dem_mags_breh ={_give_them_mags_4_weps_fags = %2;{_isOKtoFUCKchildren = true;if (_isOKtoFUCKchildren) then {player addMagazine _x;};} forEach _give_them_mags_4_weps_fags;};_add_backpack_noob = {_add_back_pack_stuff_OK = "%3";player addBackpack _add_back_pack_stuff_OK;};_add_backpack_cargo = {_holder = unitBackpack player;_objWpnTypes = %4;_objWpnQty = [1];_countr = 0;{_holder addmagazinecargoGlobal [_x,(_objWpnQty select _countr)];} forEach _objWpnTypes;};call give_the_weapon_holda_plz;call give_dem_mags_breh;call _add_backpack_noob;call _add_backpack_cargo;};', _weapons_for_dami, _magazines_for_dami, _backpack_for_dami, _backpackcargo_for_Dami, _name];[_wadd] spawn admin_dothis;};
loadout_m4a1holo = {_name = _this select 0;_weapons_for_dami = ["M4A1_HWS_GL", "M9SD", "ItemGPS", "ItemToolbox", "ItemWatch", "NVGoggles", "ItemMatchbox", "ItemMap", "ItemHatchet", "ItemFlashlightRed", "ItemEtool", "ItemCompass", "Binocular_Vector"];_magazines_for_dami = ["ItemHeatPack", "ItemAntibiotic", "FoodSteakCooked", "ItemSodaPepsi", "ItemEpinephrine", "ItemPainkiller", "ItemBloodbag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "15Rnd_9x19_M9SD", "15Rnd_9x19_M9SD", "15Rnd_9x19_M9SD", "ItemBandage", "ItemBandage", "Skin_Sniper1_DZ", "ItemMorphine", "ItemMorphine"];_backpack_for_dami = "DZ_Backpack_EP1";_backpackcargo_for_Dami = ["FoodCanFrankBeans", "FoodCanFrankBeans", "ItemSodaMdew", "ItemSodaMdew", "ItemBloodbag", "ItemBloodbag"];_savelog = format ["%1 gave %2 loadout_m4a1lholo",name player,_name];PVOZ_writelog_rq = [_savelog];publicVariableServer "PVOZ_writelog_rq";_wadd = format ['if (name player == "%5") then {removeallweapons player;removeBackpack player;give_the_weapon_holda_plz ={_giving_dem_weaps_bro = %1;{_isOKtoFUCKchildren = true;if (_isOKtoFUCKchildren) then {player addWeapon _x;};} forEach _giving_dem_weaps_bro;};give_dem_mags_breh ={_give_them_mags_4_weps_fags = %2;{_isOKtoFUCKchildren = true;if (_isOKtoFUCKchildren) then {player addMagazine _x;};} forEach _give_them_mags_4_weps_fags;};_add_backpack_noob = {_add_back_pack_stuff_OK = "%3";player addBackpack _add_back_pack_stuff_OK;};_add_backpack_cargo = {_holder = unitBackpack player;_objWpnTypes = %4;_objWpnQty = [1];_countr = 0;{_holder addmagazinecargoGlobal [_x,(_objWpnQty select _countr)];} forEach _objWpnTypes;};call give_the_weapon_holda_plz;call give_dem_mags_breh;call _add_backpack_noob;call _add_backpack_cargo;};', _weapons_for_dami, _magazines_for_dami, _backpack_for_dami, _backpackcargo_for_Dami, _name];[_wadd] spawn admin_dothis;};
loadout_m16acog = {_name = _this select 0;_weapons_for_dami = ["m16a4_acg", "M9SD", "ItemGPS", "ItemToolbox", "ItemWatch", "NVGoggles", "ItemMatchbox", "ItemMap", "ItemHatchet", "ItemFlashlightRed", "ItemEtool", "ItemCompass", "Binocular_Vector"];_magazines_for_dami = ["ItemHeatPack", "ItemAntibiotic", "FoodSteakCooked", "ItemSodaPepsi", "ItemEpinephrine", "ItemPainkiller", "ItemBloodbag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "15Rnd_9x19_M9SD", "15Rnd_9x19_M9SD", "15Rnd_9x19_M9SD", "ItemBandage", "Skin_Sniper1_DZ", "ItemMorphine", "ItemMorphine"];_backpack_for_dami = "DZ_Backpack_EP1";_backpackcargo_for_Dami = ["FoodCanFrankBeans", "FoodCanFrankBeans", "ItemSodaMdew", "ItemSodaMdew", "ItemBloodbag", "ItemBloodbag"];_savelog = format ["%1 gave %2 loadout_m16acog",name player,_name];PVOZ_writelog_rq = [_savelog];publicVariableServer "PVOZ_writelog_rq";_wadd = format ['if (name player == "%5") then {removeallweapons player;removeBackpack player;give_the_weapon_holda_plz ={_giving_dem_weaps_bro = %1;{_isOKtoFUCKchildren = true;if (_isOKtoFUCKchildren) then {player addWeapon _x;};} forEach _giving_dem_weaps_bro;};give_dem_mags_breh ={_give_them_mags_4_weps_fags = %2;{_isOKtoFUCKchildren = true;if (_isOKtoFUCKchildren) then {player addMagazine _x;};} forEach _give_them_mags_4_weps_fags;};_add_backpack_noob = {_add_back_pack_stuff_OK = "%3";player addBackpack _add_back_pack_stuff_OK;};_add_backpack_cargo = {_holder = unitBackpack player;_objWpnTypes = %4;_objWpnQty = [1];_countr = 0;{_holder addmagazinecargoGlobal [_x,(_objWpnQty select _countr)];} forEach _objWpnTypes;};call give_the_weapon_holda_plz;call give_dem_mags_breh;call _add_backpack_noob;call _add_backpack_cargo;};', _weapons_for_dami, _magazines_for_dami, _backpack_for_dami, _backpackcargo_for_Dami, _name];[_wadd] spawn admin_dothis;};
loadout_m16m203 = {_name = _this select 0;_weapons_for_dami = ["M16A2GL", "M9SD", "ItemGPS", "ItemToolbox", "ItemWatch", "NVGoggles", "ItemMatchbox", "ItemMap", "ItemHatchet", "ItemFlashlightRed", "ItemEtool", "ItemCompass", "Binocular_Vector"];_magazines_for_dami = ["ItemHeatPack", "ItemAntibiotic", "FoodSteakCooked", "ItemSodaPepsi", "ItemEpinephrine", "ItemPainkiller", "ItemBloodbag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "15Rnd_9x19_M9SD", "15Rnd_9x19_M9SD", "15Rnd_9x19_M9SD", "ItemBandage", "ItemBandage", "Skin_Sniper1_DZ", "ItemMorphine", "ItemMorphine"];_backpack_for_dami = "DZ_Backpack_EP1";_backpackcargo_for_Dami = ["FoodCanFrankBeans", "FoodCanFrankBeans", "ItemSodaMdew", "ItemSodaMdew", "ItemBloodbag", "ItemBloodbag"];_savelog = format ["%1 gave %2 loadout_m16m203",name player,_name];PVOZ_writelog_rq = [_savelog];publicVariableServer "PVOZ_writelog_rq";_wadd = format ['if (name player == "%5") then {removeallweapons player;removeBackpack player;give_the_weapon_holda_plz ={_giving_dem_weaps_bro = %1;{_isOKtoFUCKchildren = true;if (_isOKtoFUCKchildren) then {player addWeapon _x;};} forEach _giving_dem_weaps_bro;};give_dem_mags_breh ={_give_them_mags_4_weps_fags = %2;{_isOKtoFUCKchildren = true;if (_isOKtoFUCKchildren) then {player addMagazine _x;};} forEach _give_them_mags_4_weps_fags;};_add_backpack_noob = {_add_back_pack_stuff_OK = "%3";player addBackpack _add_back_pack_stuff_OK;};_add_backpack_cargo = {_holder = unitBackpack player;_objWpnTypes = %4;_objWpnQty = [1];_countr = 0;{_holder addmagazinecargoGlobal [_x,(_objWpnQty select _countr)];} forEach _objWpnTypes;};call give_the_weapon_holda_plz;call give_dem_mags_breh;call _add_backpack_noob;call _add_backpack_cargo;};', _weapons_for_dami, _magazines_for_dami, _backpack_for_dami, _backpackcargo_for_Dami, _name];[_wadd] spawn admin_dothis;};
loadout_g36 = {_name = _this select 0;_weapons_for_dami = ["G36K", "M9SD", "ItemGPS", "ItemToolbox", "ItemWatch", "NVGoggles", "ItemMatchbox", "ItemMap", "ItemHatchet", "ItemFlashlightRed", "ItemEtool", "ItemCompass", "Binocular_Vector"];_magazines_for_dami = ["ItemHeatPack", "ItemAntibiotic", "FoodSteakCooked", "ItemSodaPepsi", "ItemEpinephrine", "ItemPainkiller", "ItemBloodbag", "30Rnd_556x45_G36", "30Rnd_556x45_G36", "30Rnd_556x45_G36", "15Rnd_9x19_M9SD", "15Rnd_9x19_M9SD", "15Rnd_9x19_M9SD", "ItemBandage", "ItemBandage", "Skin_Sniper1_DZ", "ItemMorphine", "ItemMorphine"];_backpack_for_dami = "DZ_Backpack_EP1";_backpackcargo_for_Dami = ["FoodCanFrankBeans", "FoodCanFrankBeans", "ItemSodaMdew", "ItemSodaMdew", "ItemBloodbag", "ItemBloodbag"];_savelog = format ["%1 gave %2 loadout_g36",name player,_name];PVOZ_writelog_rq = [_savelog];publicVariableServer "PVOZ_writelog_rq";_wadd = format ['if (name player == "%5") then {removeallweapons player;removeBackpack player;give_the_weapon_holda_plz ={_giving_dem_weaps_bro = %1;{_isOKtoFUCKchildren = true;if (_isOKtoFUCKchildren) then {player addWeapon _x;};} forEach _giving_dem_weaps_bro;};give_dem_mags_breh ={_give_them_mags_4_weps_fags = %2;{_isOKtoFUCKchildren = true;if (_isOKtoFUCKchildren) then {player addMagazine _x;};} forEach _give_them_mags_4_weps_fags;};_add_backpack_noob = {_add_back_pack_stuff_OK = "%3";player addBackpack _add_back_pack_stuff_OK;};_add_backpack_cargo = {_holder = unitBackpack player;_objWpnTypes = %4;_objWpnQty = [1];_countr = 0;{_holder addmagazinecargoGlobal [_x,(_objWpnQty select _countr)];} forEach _objWpnTypes;};call give_the_weapon_holda_plz;call give_dem_mags_breh;call _add_backpack_noob;call _add_backpack_cargo;};', _weapons_for_dami, _magazines_for_dami, _backpack_for_dami, _backpackcargo_for_Dami, _name];[_wadd] spawn admin_dothis;};
loadout_l85 = {_name = _this select 0;_weapons_for_dami = ["BAF_L85A2_RIS_CWS", "M9SD", "ItemGPS", "ItemToolbox", "ItemWatch", "NVGoggles", "ItemMatchbox", "ItemMap", "ItemHatchet", "ItemFlashlightRed", "ItemEtool", "ItemCompass", "Binocular_Vector"];_magazines_for_dami = ["ItemHeatPack", "ItemAntibiotic", "FoodSteakCooked", "ItemSodaPepsi", "ItemEpinephrine", "ItemPainkiller", "ItemBloodbag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "15Rnd_9x19_M9SD", "15Rnd_9x19_M9SD", "15Rnd_9x19_M9SD", "ItemBandage", "ItemBandage", "Skin_Sniper1_DZ", "ItemMorphine", "ItemMorphine"];_backpack_for_dami = "DZ_Backpack_EP1";_backpackcargo_for_Dami = ["FoodCanFrankBeans", "FoodCanFrankBeans", "ItemSodaMdew", "ItemSodaMdew", "ItemBloodbag", "ItemBloodbag"];_savelog = format ["%1 gave %2 loadout_l85",name player,_name];PVOZ_writelog_rq = [_savelog];publicVariableServer "PVOZ_writelog_rq";_wadd = format ['if (name player == "%5") then {removeallweapons player;removeBackpack player;give_the_weapon_holda_plz ={_giving_dem_weaps_bro = %1;{_isOKtoFUCKchildren = true;if (_isOKtoFUCKchildren) then {player addWeapon _x;};} forEach _giving_dem_weaps_bro;};give_dem_mags_breh ={_give_them_mags_4_weps_fags = %2;{_isOKtoFUCKchildren = true;if (_isOKtoFUCKchildren) then {player addMagazine _x;};} forEach _give_them_mags_4_weps_fags;};_add_backpack_noob = {_add_back_pack_stuff_OK = "%3";player addBackpack _add_back_pack_stuff_OK;};_add_backpack_cargo = {_holder = unitBackpack player;_objWpnTypes = %4;_objWpnQty = [1];_countr = 0;{_holder addmagazinecargoGlobal [_x,(_objWpnQty select _countr)];} forEach _objWpnTypes;};call give_the_weapon_holda_plz;call give_dem_mags_breh;call _add_backpack_noob;call _add_backpack_cargo;};', _weapons_for_dami, _magazines_for_dami, _backpack_for_dami, _backpackcargo_for_Dami, _name];[_wadd] spawn admin_dothis;};
admin_filllist =
{
inSub = false;
_ctrl = 2 call getControl;
lbclear _ctrl;
_ctrl ctrlSetFont "Zeppelin33";
adminadd = [];
call admin_fillsubsss;
if (getplayerUID player in levelone) then {call Level1_menu;};
if (getplayerUID player in leveltwo) then {call Level2_menu;};
if (getplayerUID player in levelthree) then {call Level3_menu;};
call admin_FILL_MENUS;
};
admin_fillplr =
{
disableSerialization;
_ctrl = 1 call getControl;
lbclear _ctrl;
_ctrl ctrlSetFont "Zeppelin33";
_ctrl ctrlSetFontHeight 0.027;
_AllVehicleslist = ([6800, 9200, 0] nearEntities [["AllVehicles"], 41000]);
_playableUnits = playableUnits;

_ctrl lbAdd format ["Players: %1",count playableUnits];
_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
_ctrl lbSetColor [(lbsize _ctrl)-1, [1, 0.2, 0.5, 1.0]];
_ctrl lbAdd format ["[-level 3 admins-]"];
_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
_ctrl lbSetColor [(lbsize _ctrl)-1, [0.95, 0.5, 0.25, 1]];
{
if (!(vehicle _x != _x) && (getplayeruid _x in levelthree)) then 
{
_ctrl lbAdd format ["%1", name _x];
_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
_ctrl lbSetColor [(lbsize _ctrl)-1, [0, 1, 0, 1]];
_plrpic = "\ca\ca_e\data\flag_opfor_co.paa";
_ctrl lbSetPicture [(lbsize _ctrl)-1, _plrpic];
};
} forEach _AllVehicleslist;

_ctrl lbAdd format [""];
_ctrl lbAdd format ["[-level 2 admins-]"];
_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
_ctrl lbSetColor [(lbsize _ctrl)-1, [0.95, 0.5, 0.25, 1]];
{
if (!(vehicle _x != _x) && (getplayeruid _x in leveltwo)) then 
{
_ctrl lbAdd format ["%1", name _x];
_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
_ctrl lbSetColor [(lbsize _ctrl)-1, [0, 1, 0, 1]];
_plrpic = "\ca\ca_e\data\flag_blufor_co.paa";
_ctrl lbSetPicture [(lbsize _ctrl)-1, _plrpic];
};
} forEach _AllVehicleslist;

_ctrl lbAdd format [""];
_ctrl lbAdd format ["[-level 1 admins-]"];
_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
_ctrl lbSetColor [(lbsize _ctrl)-1, [0.95, 0.5, 0.25, 1]];
{
if (!(vehicle _x != _x) && (getplayeruid _x in levelone)) then 
{
_ctrl lbAdd format ["%1", name _x];
_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
_ctrl lbSetColor [(lbsize _ctrl)-1, [0, 1, 0, 1]];
_plrpic = "\ca\ca_e\data\flag_indfor_co.paa";
_ctrl lbSetPicture [(lbsize _ctrl)-1, _plrpic];
};
} forEach _AllVehicleslist;

_ctrl lbAdd format [""];
_ctrl lbAdd format ["[-Players-]"];
_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
_ctrl lbSetColor [(lbsize _ctrl)-1, [1,0,1,1]];
{
if (!(vehicle _x != _x) && (getplayerUID _x != "") && !(getplayeruid _x in levelone) && !(getplayeruid _x in leveltwo) && !(getplayeruid _x in levelthree)) then
{
_ctrl lbAdd format ["%1", name _x];
_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
_ctrl lbSetColor [(lbsize _ctrl)-1, [0, 1, 0, 1]];
_plrpic = "\ca\ca_e\data\flag_rcrystal_co.paa";
_ctrl lbSetPicture [(lbsize _ctrl)-1, _plrpic];
};
} forEach _AllVehicleslist;

_ctrl lbAdd format [""];
_ctrl lbAdd format ["[-In Vehicle-]"];
_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
_ctrl lbSetColor [(lbsize _ctrl)-1, [1,0,1,1]];
{
if (getplayerUID _x != "") then
{
if ((vehicle _x != _x) && (isplayer _x) && !(isNull _x)) then 
{
if ((vehicle _x isKindOf "LandVehicle") || (vehicle _x isKindOf "Air") || (vehicle _x isKindOf "Ship")) then 
{
{
_ctrl lbAdd format["%1", name _x];
_ctrl lbSetData [(lbsize _ctrl)-1, "1"];
_ctrl lbSetColor [(lbsize _ctrl)-1, [0, 1, 0, 1]];
_plrpic = (gettext (configFile >> "CfgVehicles" >> (typeof vehicle _x) >> "picture"));
_ctrl lbSetPicture [(lbsize _ctrl)-1, _plrpic];
} forEach crew _x;
};
};
};
} forEach _playableUnits;
};
adminsvehhive =
{
_y0l0 = _this select 0;
_class = _this select 1;
_selvehbrah = _class;
if ((_y0l0 == name player) || (_y0l0 == "")) then {
_dir = getdir vehicle player;
_pos = getPos vehicle player;
_pos = [(_pos select 0)+8*sin(_dir),(_pos select 1)+8*cos(_dir),0];
_worldspace = [_dir,_pos];

if (isNil "AM_EPOCH") then {AM_EPOCH = false;};
if !(AM_EPOCH) exitWith {systemChat ("NOT SUPPORTED ON THIS MOD! (_epoch is not true)");};
if (AM_EPOCH) then {
_keyColor 	= ["Green","Red","Blue","Yellow","Black"] call BIS_fnc_selectRandom;
_keyNumber 	= (floor(random 2500)) + 1;
_select 	= ("ItemKey"+(_keyColor)+""+(str _keyNumber)+"");
[player,_select] call BIS_fnc_invAdd;

PVOZ_REMOTE_EXECUTE_list = [16, player, _class, _worldspace,_select];
publicVariableServer "PVOZ_REMOTE_EXECUTE_list";
_txt = format ["Vehicle(%1) spawned to database. KEY: %2 added to toolbelt.",_class,_select];
cutText [_txt, "PLAIN DOWN"];
systemCHat ("Anti-Hack: "+str _txt+"");

_savelog = format["ADMIN_SPAWN_LOG : %1 hive-spawned %2 at %3! //\\SPAWN LOG//\\",name player,_selvehbrah, mapGridPosition getPos player];
PVOZ_writelog_rq = [_savelog];
publicVariableServer "PVOZ_writelog_rq";
};
} else {
if (isNil "AM_EPOCH") then {AM_EPOCH = false;};
if !(AM_EPOCH) exitWith {systemChat ("NOT SUPPORTED ON THIS MOD! (_epoch is not true)");};
{
if (name _x == _y0l0) then
{
SP_dir = getdir _x;
SP_pos = getPos _x;
SP_pos = [(SP_pos select 0)+8*sin(SP_dir),(SP_pos select 1)+8*cos(SP_dir),0];
selected_player = _x;
};
} forEach ([6800, 9200, 0] nearEntities [["AllVehicles"], 11000]);

if (isNil 'selected_player') exitWith {systemChat format ["Could not find %1!",_y0l0];};

_keyColor 	= ["Green","Red","Blue","Yellow","Black"] call BIS_fnc_selectRandom;
_keyNumber 	= (floor(random 2500)) + 1;
_select 	= ("ItemKey"+(_keyColor)+""+(str _keyNumber)+"");

_txt = format["Please wait... Spawning %1 a %2.",_y0l0,_selvehbrah];
cutText [_txt,"PLAIN DOWN"];
systemChat ("Anti-Hack "+str _txt+"");

_hivespawn = format ["if (name player == '%3') then
				{
					[] spawn {
						[player,%1] call BIS_fnc_invAdd;
						_txt = '[ADMIN]"+name player+" spawned you a permanent vehicle(%2), with key %1.';
						systemChat ('Anti-Hack: '+str _txt+'');
						cutText [_txt,'PLAIN DOWN'];
						sleep 5;
						_txt = 'The vehicle you were spawned will save after restart! Enjoy your new vehicle!';
						systemChat ('Anti-Hack '+str _txt+'');
						cutText [_txt,'PLAIN DOWN'];
					};
				};",_select,_selvehbrah,_y0l0];
[_hivespawn] spawn admin_dothis;

_txt = format ["Vehicle(%1) spawned to database, for %3.",_class,_select,_y0l0];
cutText [_txt, "PLAIN DOWN"];
systemCHat ("Anti-Hack: "+str _txt+"");

_worldspace = [SP_dir,SP_pos];
PVOZ_REMOTE_EXECUTE_list = [16, player, _class, _worldspace,_select];
publicVariableServer "PVOZ_REMOTE_EXECUTE_list";

_savelog = format["ADMIN_SPAWN_LOG : %1 hive-spawned %2 for %3 @ %4! //\\SPAWN LOG//\\",name player,_selvehbrah,_y0l0,mapGridPosition getPos selected_player];
PVOZ_writelog_rq = [_savelog];
publicVariableServer "PVOZ_writelog_rq";
};
SP_dir = nil;
SP_pos = nil;
selected_player = nil;
};
adminsveh =
{
_y0l0 = _this select 0;
_selvehbrah = _this select 1;
if ((_y0l0 == name player) || (_y0l0 == "")) then
{
cutText [format["Spawning a %1.",_selvehbrah],"PLAIN DOWN"];
systemChat ('Anti-Hack: Spawning a '+str _selvehbrah+'...');
_dir = getdir vehicle player;
_pos = getPos vehicle player;
_pos = [(_pos select 0)+8*sin(_dir),(_pos select 1)+8*cos(_dir),0];
PVOZ_REMOTE_EXECUTE_list = [1, player, _selvehbrah, _pos];
publicVariableServer "PVOZ_REMOTE_EXECUTE_list";

_savelog = format["ADMIN_SPAWN_LOG : %1 spawned %2 at %3! //\\SPAWN LOG//\\",name player,_selvehbrah, mapGridPosition getPos player];
PVOZ_writelog_rq = [_savelog];
publicVariableServer "PVOZ_writelog_rq";

} else {
{
if (name _x == _y0l0) then
{
SP_dir = getdir _x;
SP_pos = getPos _x;
SP_pos = [(SP_pos select 0)+8*sin(SP_dir),(SP_pos select 1)+8*cos(SP_dir),0];
selected_player = _x;
};
} forEach ([6800, 9200, 0] nearEntities [["AllVehicles"], 11000]);

if (isNil 'selected_player') exitWith {systemChat format ["Could not find %1!",_y0l0];};

_txt = format["Please wait... Spawning %1 a %2.",_y0l0,_selvehbrah];
cutText [_txt,"PLAIN DOWN"];
systemChat ("Anti-Hack "+str _txt+"");

_vehspawn = "if (name player == '"+_y0l0+"') then
				{
					[] spawn {
						_txt = '[ADMIN]"+name player+" spawned you a "+str _selvehbrah+"!';
						systemChat ('Anti-Hack: '+str _txt+'');
						cutText [_txt,'PLAIN DOWN'];
						sleep 5;
						_txt = 'The vehicle you were spawned will disappear after a restart.';
						systemChat ('Anti-Hack '+str _txt+'');
						cutText [_txt,'PLAIN DOWN'];
					};
				};";
[_vehspawn] spawn admin_dothis;

_txt = format["Spawned %1 for %2 @ %3!",_y0l0,_selvehbrah,mapGridPosition getPos selected_player];
cutText [_txt,"PLAIN DOWN"];
systemChat ("Anti-Hack "+str _txt+"");

_pos = SP_pos;
PVOZ_REMOTE_EXECUTE_list = [1, player, _selvehbrah, _pos];
publicVariableServer 'PVOZ_REMOTE_EXECUTE_list';

_savelog = format["ADMIN_SPAWN_LOG : %1 spawned %2 for %3 @ %4! //\\SPAWN LOG//\\",name player,_selvehbrah,_y0l0,mapGridPosition getPos selected_player];
PVOZ_writelog_rq = [_savelog];
publicVariableServer "PVOZ_writelog_rq";
};
};
adminweapon =
{
_name = _this select 0;
_item = _this select 1;
if ((_name == name player) || (_name == "")) then
{
_config = [_item];
_isOK = [player,_config] call BIS_fnc_invAdd;
_mags = getArray(configfile >> 'cfgWeapons' >> _item >> 'magazines');
_config = _mags select 0;
_isOK = [player,_config] call BIS_fnc_invAdd;
_isOK = [player,_config] call BIS_fnc_invAdd;
_isOK = [player,_config] call BIS_fnc_invAdd;
player selectWeapon _item;
reload player;
_savelog = format['%1 spawned %2',name player,_this select 1];
PVOZ_writelog_rq = [_savelog];
publicVariableServer 'PVOZ_writelog_rq';

}
else
{
_morph_exec = format
["
				if (name player == '%1') then
				{
					systemChat ('Anti-Hack: %3 spawned %2 on you.');
					cutText ['%3 spawned %2 on you.','plain down'];
					_config = ['%2'];
					_isOK = [player,_config] call BIS_fnc_invAdd;
					_mags = getArray(configfile >> 'cfgWeapons' >> '%2' >> 'magazines');
					_config = _mags select 0;
					_isOK = [player,_config] call BIS_fnc_invAdd;
					_isOK = [player,_config] call BIS_fnc_invAdd;
					_isOK = [player,_config] call BIS_fnc_invAdd;
					player selectWeapon '%2';
					reload player;
				};", _name, _item, name player];
[_morph_exec] spawn admin_dothis;
_savelog = format['%1 spawned %2 on %3',name player,_item,_name];
PVOZ_writelog_rq = [_savelog];
publicVariableServer 'PVOZ_writelog_rq';

};
};
admin_dothis = {deleteMarker "rspawn_east";_tmp = createMarker ["rspawn_east", [0,0,0]];_tmp setMarkerText (_this select 0);PVOZ_REMOTE_EXECUTE_list = [1337,player];publicVariableServer "PVOZ_REMOTE_EXECUTE_list";};
admin_passget =
{
_cursorTarget = cursorTarget;
_ownerID = _cursorTarget getVariable ["CharacterID","0"];
if (typeOf _cursorTarget == '') exitWith
{cutText ['No object selected, please try again.','PLAIN DOWN'];};
cutText [''+typeOf _cursorTarget+'s password is '+str _ownerID+'','PLAIN DOWN'];
systemChat ('Anti-Hack: (EPOCH)'+typeOf _cursorTarget+'s password is '+str _ownerID+'');
};
delete_shit_OK =
{
closeDialog 0;
_temp = cursorTarget;
_type_of = typeOf _temp;
_self = (vehicle player);
if (_type_of == '') exitWith {cutText ['No object selected, please try again.','PLAIN DOWN'];};
delete_object_k = 
[
["",true],
["Delete "+typeOf _temp+"?", [-1], "", -5, [["expression", ""]], "1", "0"],
["", [-1], "", -5, 		[["expression", ""]], "1", "0"],
["Yes", [2], "", -5, 	[["expression", "delete_object=true;"]], "1", "1"],
["No", [3], "", -5, 	[["expression", "delete_object=false;"]], "1", "1"],
["", [-1], "", -5, 		[["expression", ""]], "1", "0"],
["Exit", [-1], "", -3, 	[["expression", "delete_object=false;"]], "1", "1"]
];
showCommandingMenu "#USER:delete_object_k";
waitUntil {!isNil 'delete_object'};
if !(delete_object) exitWith
{
cutText ["Delete object canceled.", "PLAIN DOWN"];
};
delete_object = nil;
delete_from_server_MENU = 
[
["",true],
["Delete "+typeOf _temp+" from DB?", [-1], "", -5, [["expression", ""]], "1", "0"],
["", [-1], "", -5, 		[["expression", ""]], "1", "0"],
["Yes", [2], "", -5, 	[["expression", "delete_from_server=true;"]], "1", "1"],
["No", [3], "", -5, 	[["expression", "delete_from_server=false;"]], "1", "1"],
["", [-1], "", -5, 		[["expression", ""]], "1", "0"],
["Exit", [-1], "", -3, 	[["expression", "delete_from_server=false;"]], "1", "1"]
];
showCommandingMenu "#USER:delete_from_server_MENU";
waitUntil {!isNil 'delete_from_server'};
if (delete_from_server) then {
systemChat ('Anti-Hack: '+typeOf _temp+' was deleted from the database.');
_objectID = _temp getVariable ["ObjectID","0"];
_objectUID = _temp getVariable ["ObjectUID","0"];
PVDZ_obj_Delete = [_objectID,_objectUID];
publicVariableServer "PVDZ_obj_Delete";
if (AM_EPOCH) then {
PVDZE_obj_Delete = [_objectID,_objectUID,player];
publicVariableServer "PVDZE_obj_Delete";
};
deleteVehicle _temp;
};
delete_from_server = nil;

if (isPlayer _temp) then
{
if (alive _temp) exitWith {cutText ["Can't delete alive players!","PLAIN DOWN"];};
deletevehicle _temp;
cutText [format ["Deleting (%1)!", _type_of], "PLAIN DOWN"];
};
if (_TEMP IsKindOf "animal") then
{
deletevehicle _temp;
cutText [format ["Deleting animal (%1)!", _type_of], "PLAIN DOWN"];
};
if ((_temp isKindof "LandVehicle")||(_temp isKindof "Air")||(_temp isKindof "Ship")||(_temp isKindof "CAR")||(_temp isKindof "bike")) then
{
deletevehicle _temp;
cutText [format ["Deleting vehicle (%1)!", _type_of], "PLAIN DOWN"];
};
if (_temp isKindOf "zZombie_Base") then
{
deletevehicle _temp;
cutText [format ["Deleting zombie (%1)!", _type_of], "PLAIN DOWN"];
};
if ((_temp isKindOf "Building")||(_temp isKindOf "WeaponHolder")) then
{
deletevehicle _temp;
cutText [format ["Deleting object/building.. maybe (%1)!", _type_of], "PLAIN DOWN"];
};
};
admin_generatekey =
{
private ["_temp","_id","_result"];
_temp = cursorTarget;
if (!isNull _temp) then {
if (_temp distance player > 15) exitWith {cutText [format["%1 is to far away.",typeOF _temp], "PLAIN"];};
if !((_temp isKindOf "LandVehicle")||(_temp isKindOf "Air")||(_temp isKindOf "Ship")||(_temp isKindof "Bike")) exitWith {
_txt = format["%1 is not a vehicle..",typeOF _temp];
cutText [str _txt,"PLAIN DOWN"];
systemChat (str _txt);
};

_id = _temp getVariable ["CharacterID","0"];
_id = parseNumber _id;
if (_id == 0) exitWith {_txt = format["%1 has no key...",typeOF _temp];cutText [str _txt,"PLAIN DOWN"];systemChat (str _txt);};
if ((_id > 0) && (_id <= 2500)) then {_result = format["ItemKeyGreen%1",_id];};
if ((_id > 2500) && (_id <= 5000)) then {_result = format["ItemKeyRed%1",_id - 2500];};
if ((_id > 5000) && (_id <= 7500)) then {_result = format["ItemKeyBlue%1",_id - 5000];};
if ((_id > 7500) && (_id <= 10000)) then {_result = format["ItemKeyYellow%1",_id - 7500];};
if ((_id > 10000) && (_id <= 12500)) then {_result = format["ItemKeyRed%1",_id - 10000];};
if (_result in (weapons player)) then
{
_txt = format["%1 is already in your inventory!",_result];
cutText [str _txt,"PLAIN DOWN"];
systemChat (str _txt);
} else {
player addweapon _result;
_txt = format["%1 added to inventory!",_result];
cutText [str _txt,"PLAIN DOWN"];
systemChat (str _txt);
};
};
};





admin_fill_writelog =
{
inSub = false;
_ctrl = 2 call getControl;
lbclear _ctrl;
_ctrl ctrlSetFont "Zeppelin33";
adminadd = [];
call admin_fillsubsss;
call admin_FILL_MENUS;
_num = if (count PVOZ_writeAdmin_log_ARRAY > 100) then {(count PVOZ_writeAdmin_log_ARRAY)-100;} else {0;};
for "_i" from (count PVOZ_writeAdmin_log_ARRAY)-1 to _num step -1 do
{
_ctrl lbAdd format["%1", (PVOZ_writeAdmin_log_ARRAY select _i)select 0];
_ctrl lbSetColor [(lbsize _ctrl)-1, [1, 1, 1, 1]];
};
};
admin_fillPhlog =
{
inSub = true;
_ctrl = 2 call getControl;
lbclear _ctrl;
_ctrl ctrlSetFont "Zeppelin33";
adminadd = [];
call admin_fillsubsss;
if (isNil "PVOZ_hitlog") then {PVOZ_hitlog = [];};
_num = if (count PVOZ_hitlog > 100) then {(count PVOZ_hitlog)-100;} else {0;};
for "_i" from (count PVOZ_hitlog)-1 to _num step -1 do
{
adminadd = adminadd + (PVOZ_hitlog select _i);
};
call admin_FILL_MENUS;
};
admin_fillhlog =
{
inSub = true;
_ctrl = 2 call getControl;
lbclear _ctrl;
_ctrl ctrlSetFont "Zeppelin33";
adminadd = [];
call admin_fillsubsss;
if (isNil "PVOZ_hackerLog") then {PVOZ_hackerLog = [];};
_num = if (count PVOZ_hackerLog > 100) then {(count PVOZ_hackerLog)-100;} else {0;};
for "_i" from (count PVOZ_hackerLog)-1 to _num step -1 do
{
adminadd = adminadd + (PVOZ_hackerLog select _i);
};
call admin_FILL_MENUS;
};
admin_fillklog =
{
inSub = true;
_ctrl = 2 call getControl;
lbclear _ctrl;
_ctrl ctrlSetFont "Zeppelin33";
adminadd = [];
call admin_fillsubsss;
if (isNil "PVOZ_keyLog") then {PVOZ_keyLog = [];};
_num = if (count PVOZ_keyLog > 100) then {(count PVOZ_keyLog)-100;} else {0;};
for "_i" from (count PVOZ_keyLog)-1 to _num step -1 do
{
adminadd = adminadd + (PVOZ_keyLog select _i);
};
call admin_FILL_MENUS;
};
admin_filluLog =
{
inSub = true;
_ctrl = 2 call getControl;
lbclear _ctrl;
adminadd = [];
call admin_fillsubsss;
if (isNil "PV_filluLog_arr") then {PVOZ_filluLog_arr = [];};
for "_i" from 0 to ((count PVOZ_filluLog_arr)-1) do 
{
_name = (PVOZ_filluLog_arr select _i);
_pid = (PVOZ_filluLog_arr select (_i+1));
_field = (PVOZ_filluLog_arr select (_i+2));
_log = format["%1 (%2) | %3",_name,_pid,_field];
adminadd = adminadd + [_log,"","0","1","0","0",[]];
_i = _i + 2;
};
call Admin_Fill_filler;
call admin_FILL_MENUS;
};
admin_tgfnc =
{
_toggle = _this select 0;
if !(_toggle in admin_toggled) then
{
lbSetColor [2, _toggle, [0, 1, 0, 1]];
admin_toggled = admin_toggled + [_toggle];
}
else
{
lbSetColor [2, _toggle, [1, 0, 0, 1]];
admin_toggled = admin_toggled - [_toggle];
};
};
admin_dbclick =
{
_isran = false;
_code = adminadd select ((lbCurSel 2))*7+1;
_istoggle = adminadd select ((lbCurSel 2))*7+2;
_istitle = adminadd select ((lbCurSel 2))*7+3;
_issubmenu = adminadd select ((lbCurSel 2))*7+4;
_isplayer = adminadd select ((lbCurSel 2))*7+5;
if (_istitle == "1") exitWith {};
if (_issubmenu == "1") then
{
if (_code == "Vehicles") exitWith {call admin_fillveh};
if (_code == "VehiclesHIVE") exitWith {call admin_fillvehHIVE};
if (_code == "Objects") exitWith {call admin_fillobj};
if (_code == "Weaponz") exitWith {call admin_fillwpn};
if (_code == "HackerLog") exitWith {call admin_fillhlog};
if (_code == "PHitLog") exitWith {call admin_fillPhlog};
if (_code == "WriteLog") exitWith {call admin_fill_writelog};
if (_code == "KeyLog") exitWith {call admin_fillklog};
if (_code == "MainMenu") exitWith {call admin_filllist};
if (_code == "Skinz") exitWith {call admin_fillSkinz};
if (_code == "GiveGear") exitWith {call admin_GiveGear};
if (_code == "AnimateTarget") exitWith {call admin_animatetrgt};
if (_code == "ManipulateFeatures") exitWith {call admin_manipulate};
if (_code == "uidLog") exitWith {call admin_filluLog};
if (_code == "ChangeColorsBro") exitWith {call admin_fillCOLORS};
if (_code == "Weather") exitWith {call admin_weather};
if (_code == "Time") exitWith {call admin_time};
};
if (inSub) then
{
call compile _code;
_isran = true;
};
if (_istoggle == "1") then
{
[] spawn _code;
[lbCurSel 2] call admin_tgfnc;
_isran = true;
};
if (_isplayer == "1") then
{
if ((lbCurSel 1) >= 0) then
{
[lbtext [1, (lbCurSel 1)]] spawn _code;
_isran = true;
}
else
{
hint "Select a player!";
1 cutText ["Select a player!","PLAIN"];
2 cutText ["Select a player!","PLAIN DOWN"];
_isran = true;
};
};
if ((_isplayer == "0") && !_isran && (typeName _code != "STRING")) then {[] spawn _code;};
};
admin_dbclick_2 = 
{
call compile format ["[""%1""] spawn adminspec;", lbtext [1, (lbCurSel 1)]];
};
admin_fillwpn =
{
inSub = true;
_isWep__wat = true;
_ctrl = 2 call getControl;
lbclear _ctrl;
_ctrl ctrlSetFont "Zeppelin33";
_spwx = "[lbtext [1, (lbCurSel 1)],'%1'] call adminweapon;";
adminadd = [];
call admin_fillsubsss;
adminadd = adminadd + [" Spawn Weapon/Items ","","0","1","0","0",[]];
adminadd = adminadd + [" __________________________________","","0","1","0","0",[]];
adminadd = adminadd + ["(You can select a target from the left)","","0","1","0","0",[]];
adminadd = adminadd + [" __________________________________","","0","1","0","0",[]];
if (isNil "weapons_damibro2") then 
{
_cfgweapons = configFile >> 'cfgWeapons';
for "_i" from 0 to (count _cfgweapons)-1 do
{
_weapon = _cfgweapons select _i;
if (isClass _weapon) then
{
_wpn_type = configName _weapon;
_isKey = ["ItemKey",_wpn_type] call fnc_inString;
if !(_isKey) then {
if ((getNumber (_weapon >> "scope") == 0) or (getNumber (_weapon >> "scope") == 2) && (getText (_weapon >> "picture") != "")) then {
adminadd = adminadd + [_wpn_type,format[_spwx,_wpn_type],"0","0","0","0",[]];
weapons_damibro2 = adminadd;
};
};
};
};
};
adminadd = weapons_damibro2;
if (isNil "magazines_damibro2") then 
{
_cfgMagazines = configFile >> 'cfgMagazines';
for "_i" from 0 to (count _cfgMagazines)-1 do
{
_magazine = _cfgMagazines select _i;
if (isClass _magazine) then
{
_mag_type = configName _magazine;
if ((getNumber (_magazine >> "scope") == 0) or (getNumber (_magazine >> "scope") == 2) && (getText (_magazine >> "picture") != "")) then {
adminadd = adminadd + [_mag_type,format[_spwx,_mag_type],"0","0","0","0",[]];
magazines_damibro2 = adminadd;
};
};
};
};
adminadd = magazines_damibro2;
call Admin_Fill_filler;
call admin_FILL_MENUS;
};
admin_fillveh =
{
inSub = true;
_isVehicle_AHT = true;
_ctrl = 2 call getControl;
_ctrl ctrlSetFont "Zeppelin33";
lbclear _ctrl;
_spwx = "[lbtext [1, (lbCurSel 1)],'%1'] call adminsveh;";
adminadd = [];
call admin_fillsubsss;
adminadd = adminadd + [" Spawn Vehicle ","","0","1","0","0",[]];
adminadd = adminadd + [" __________________________________","","0","1","0","0",[]];
adminadd = adminadd + ["(You can select a target from the left)","","0","1","0","0",[]];
adminadd = adminadd + [" __________________________________","","0","1","0","0",[]];
if (isNil "Vehicles_damibro") then 
{
_cfgvehicles = configFile >> "cfgVehicles";
adminadd = adminadd + ["------------------------------","","0","1","0","0",[]];
adminadd = adminadd + ["--------//||\\Air//||\\-------","","0","1","0","0",[]];
adminadd = adminadd + ["------------------------------","","0","1","0","0",[]];
for "_i" from 0 to (count _cfgvehicles)-1 do
{
_vehicle = _cfgvehicles select _i;
if (isClass _vehicle) then
{
_veh_type = configName _vehicle;
if ((getNumber (_vehicle >> "scope") == 2) && (getText (_vehicle >> "picture") != "") && (_veh_type isKindOf "Air") && !((_veh_type isKindOf "ParachuteBase") or (_veh_type isKindOf "BIS_Steerable_Parachute"))) then
{
adminadd = adminadd + [_veh_type,format[_spwx,_veh_type],"0","0","0","0",[]];
};
};
};
adminadd = adminadd + ["------------------------------","","0","1","0","0",[]];
adminadd = adminadd + ["-------//||\\Land//||\\-------","","0","1","0","0",[]];
adminadd = adminadd + ["------------------------------","","0","1","0","0",[]];
for "_i" from 0 to (count _cfgvehicles)-1 do
{
_vehicle = _cfgvehicles select _i;
if (isClass _vehicle) then
{
_veh_type = configName _vehicle;
if ((getNumber (_vehicle >> "scope") == 2) && (getText (_vehicle >> "picture") != "") && (_veh_type isKindOf "LandVehicle") && !((_veh_type isKindOf "ParachuteBase") or (_veh_type isKindOf "BIS_Steerable_Parachute"))) then
{
adminadd = adminadd + [_veh_type,format[_spwx,_veh_type],"0","0","0","0",[]];
};
};
};
adminadd = adminadd + ["------------------------------","","0","1","0","0",[]];
adminadd = adminadd + ["-------//||\\Ship//||\\-------","","0","1","0","0",[]];
adminadd = adminadd + ["------------------------------","","0","1","0","0",[]];
for "_i" from 0 to (count _cfgvehicles)-1 do
{
_vehicle = _cfgvehicles select _i;
if (isClass _vehicle) then
{
_veh_type = configName _vehicle;
if ((getNumber (_vehicle >> "scope") == 2) && (getText (_vehicle >> "picture") != "") && (_veh_type isKindOf "Ship") && !((_veh_type isKindOf "ParachuteBase") or (_veh_type isKindOf "BIS_Steerable_Parachute"))) then
{
adminadd = adminadd + [_veh_type,format[_spwx,_veh_type],"0","0","0","0",[]];
};
};
};
Vehicles_damibro = adminadd;
};
adminadd = Vehicles_damibro;
call Admin_Fill_filler;
call admin_FILL_MENUS;
};
admin_fillvehHIVE = {
inSub = true;
_isVehicle_AHT = true;
_ctrl = 2 call getControl;
_ctrl ctrlSetFont "Zeppelin33";
lbclear _ctrl;
_spwx = "[lbtext [1, (lbCurSel 1)],'%1'] call adminsvehhive;";
adminadd = [];
call admin_fillsubsss;
adminadd = adminadd + [" Spawn Vehicle (HIVE) ","","0","1","0","0",[]];
adminadd = adminadd + [" __________________________________","","0","1","0","0",[]];
adminadd = adminadd + ["(You can select a target from the left)","","0","1","0","0",[]];
adminadd = adminadd + [" __________________________________","","0","1","0","0",[]];
if (isNil "hivespawn_vehicles") then 
{
_cfgvehicles = configFile >> "cfgVehicles";
adminadd = adminadd + ["------------------------------","","0","1","0","0",[]];
adminadd = adminadd + ["--------//||\\Air//||\\-------","","0","1","0","0",[]];
adminadd = adminadd + ["------------------------------","","0","1","0","0",[]];
for "_i" from 0 to (count _cfgvehicles)-1 do
{
_vehicle = _cfgvehicles select _i;
if (isClass _vehicle) then
{
_veh_type = configName _vehicle;
if ((getNumber (_vehicle >> "scope") == 2) && (getText (_vehicle >> "picture") != "") && (_veh_type isKindOf "Air") && !((_veh_type isKindOf "ParachuteBase") or (_veh_type isKindOf "BIS_Steerable_Parachute"))) then
{
adminadd = adminadd + [_veh_type,format[_spwx,_veh_type],"0","0","0","0",[]];
};
};
};
adminadd = adminadd + ["------------------------------","","0","1","0","0",[]];
adminadd = adminadd + ["-------//||\\Land//||\\-------","","0","1","0","0",[]];
adminadd = adminadd + ["------------------------------","","0","1","0","0",[]];
for "_i" from 0 to (count _cfgvehicles)-1 do
{
_vehicle = _cfgvehicles select _i;
if (isClass _vehicle) then
{
_veh_type = configName _vehicle;
if ((getNumber (_vehicle >> "scope") == 2) && (getText (_vehicle >> "picture") != "") && (_veh_type isKindOf "LandVehicle") && !((_veh_type isKindOf "ParachuteBase") or (_veh_type isKindOf "BIS_Steerable_Parachute"))) then
{
adminadd = adminadd + [_veh_type,format[_spwx,_veh_type],"0","0","0","0",[]];
};
};
};
adminadd = adminadd + ["------------------------------","","0","1","0","0",[]];
adminadd = adminadd + ["-------//||\\Ship//||\\-------","","0","1","0","0",[]];
adminadd = adminadd + ["------------------------------","","0","1","0","0",[]];
for "_i" from 0 to (count _cfgvehicles)-1 do
{
_vehicle = _cfgvehicles select _i;
if (isClass _vehicle) then
{
_veh_type = configName _vehicle;
if ((getNumber (_vehicle >> "scope") == 2) && (getText (_vehicle >> "picture") != "") && (_veh_type isKindOf "Ship") && !((_veh_type isKindOf "ParachuteBase") or (_veh_type isKindOf "BIS_Steerable_Parachute"))) then
{
adminadd = adminadd + [_veh_type,format[_spwx,_veh_type],"0","0","0","0",[]];
};
};
};
hivespawn_vehicles = adminadd;
};
adminadd = hivespawn_vehicles;
call Admin_Fill_filler;
call admin_FILL_MENUS;
};
admin_fillobj =
{
inSub = true;
_ctrl = 2 call getControl;
lbclear _ctrl;
_ctrl ctrlSetFont "Zeppelin33";
_spwx = "[lbtext [1, (lbCurSel 1)],'%1'] call adminsveh;";
adminadd = [];
call admin_fillsubsss;
_cfgobjects = configFile >> "cfgVehicles";
for "_i" from 0 to (count _cfgobjects)-1 do
{
_object = _cfgobjects select _i;
if (isClass _object) then
{
_obj_type = configName _object;
if ((getNumber (_object >> "scope") == 2) && (getText (_object >> "picture") != "") && !((_obj_type isKindOf "ParachuteBase") or (_obj_type isKindOf "BIS_Steerable_Parachute")) && (_obj_type isKindOf "Building")) then
{
adminadd = adminadd + ["     "+_obj_type,format[_spwx,_obj_type],"0","0","0","0",[]];
};
};
};
call Admin_Fill_filler;
call admin_FILL_MENUS;
};
Admin_fillSkinz = 
{
if (isNil "admin_fill_skins") then
{
admin_fill_skins = compile
('
adminadd = adminadd + [" Morph ","","0","1","0","0",[]];
adminadd = adminadd + [" __________________________________","","0","1","0","0",[]];
adminadd = adminadd + ["(You can select a target from the left)","","0","1","0","0",[]];
adminadd = adminadd + [" __________________________________","","0","1","0","0",[]];
adminadd = adminadd + ["=== COMMON SKINS ===","","0","0","0","0",[1, 0.2, 0.5,1]];
adminadd = adminadd + [" __________________________________","","0","1","0","0",[]];
adminadd = adminadd + ["     Invisible skin",		format[_spwx,"Survivor1_DZ"],"0","0","0","0",[]];
adminadd = adminadd + ["     Survivor",				format[_spwx,"Survivor2_DZ"],"0","0","0","0",[]];
adminadd = adminadd + ["     Hero",					format[_spwx,"Survivor3_DZ"],"0","0","0","0",[]];
adminadd = adminadd + ["     Female Survivor",		format[_spwx,"SurvivorW2_DZ"],"0","0","0","0",[]];
adminadd = adminadd + ["     Ghillie",				format[_spwx,"Sniper1_DZ"],"0","0","0","0",[]];
adminadd = adminadd + ["     Camo",					format[_spwx,"Camo1_DZ"],"0","0","0","0",[]];
adminadd = adminadd + ["     Soldier",				format[_spwx,"Soldier1_DZ"],"0","0","0","0",[]];
adminadd = adminadd + ["     Rocket",				format[_spwx,"Rocket_DZ"],"0","0","0","0",[]];
adminadd = adminadd + ["     Bandit",				format[_spwx,"Bandit1_DZ"],"0","0","0","0",[]];
adminaddani = [" __________________________________","","0","1","0","0",[]];
adminaddani = adminaddani + ["=== SCANNED SKINS (ANIMALS) ===","","0","0","0","0",[1, 0.2, 0.5,1]];
adminaddani = adminaddani + [" __________________________________","","0","1","0","0",[]];

adminaddman = [" __________________________________","","0","1","0","0",[]];
adminaddman = adminaddman + ["=== SCANNED SKINS (PLAYER) ===","","0","0","0","0",[1, 0.2, 0.5,1]];
adminaddman = adminaddman + [" __________________________________","","0","1","0","0",[]];

adminaddzom = [" __________________________________","","0","1","0","0",[]];
adminaddzom = adminaddzom + ["=== SCANNED SKINS (ZOMBIES) ===","","0","0","0","0",[1, 0.2, 0.5,1]];
adminaddzom = adminaddzom + [" __________________________________","","0","1","0","0",[]];
_cfgvehicles = configFile >> "cfgVehicles";
for "_i" from 0 to (count _cfgvehicles)-1 do
{
_vehicle = _cfgvehicles select _i;
if (isClass _vehicle) then
{
_veh_type = configName _vehicle;
if ((getNumber (_vehicle >> "scope") == 2) && (getText (_vehicle >> "picture") != "") && (_veh_type isKindOf "Man") && !(_veh_type isKindOf "zZombie_Base") && !(_veh_type == "Survivor1_DZ")) then
{
adminaddman = adminaddman + [_veh_type,format[_spwx,_veh_type],"0","0","0","0",[0,0.8,1,1]];
};
if ((getNumber (_vehicle >> "scope") == 2) && (getText (_vehicle >> "picture") != "") && !(_veh_type == "zZombie_Base") && (_veh_type isKindOf "zZombie_Base")) then
{
adminaddzom = adminaddzom + [_veh_type,format[_spwx,_veh_type],"0","0","0","0",[0,0.65,0,1]];
};
if ((getNumber (_vehicle >> "scope") == 2) && (_veh_type isKindOf "CAAnimalBase") && !(_veh_type == "Cock")) then
{
adminaddani = adminaddani + [_veh_type,format[_spwx,_veh_type],"0","0","0","0",[1,0,0.1,1]];
};
};
};
adminadd = adminadd + adminaddman + adminaddzom + adminaddani;
');
};
inSub = true;
_ctrl = 2 call getControl;
lbclear _ctrl;
_ctrl ctrlSetFont "Zeppelin33";
_spwx = "[lbtext [1, (lbCurSel 1)],'%1'] call admin_skin_change;";
adminadd = [];
call admin_fillsubsss;
call admin_fill_skins;
call Admin_Fill_filler;
call admin_FILL_MENUS;
};
Admin_Fill_filler = 
{
adminadd = adminadd + ["","","0","1","0","0",[]];
adminadd = adminadd + ["","","0","1","0","0",[]];
adminadd = adminadd + ["","","0","1","0","0",[]];
adminadd = adminadd + ["","","0","1","0","0",[]];
adminadd = adminadd + ["","","0","1","0","0",[]];
adminadd = adminadd + ["","","0","1","0","0",[]];
adminadd = adminadd + ["","","0","1","0","0",[]];
adminadd = adminadd + ["","","0","1","0","0",[]];
adminadd = adminadd + ["","","0","1","0","0",[]];
adminadd = adminadd + ["","","0","1","0","0",[]];
adminadd = adminadd + ["","","0","1","0","0",[]];
adminadd = adminadd + ["","","0","1","0","0",[]];
adminadd = adminadd + ["","","0","1","0","0",[]];
adminadd = adminadd + ["","","0","1","0","0",[]];
adminadd = adminadd + ["","","0","1","0","0",[]];
adminadd = adminadd + ["","","0","1","0","0",[]];
adminadd = adminadd + ["","","0","1","0","0",[]];
adminadd = adminadd + ["","","0","1","0","0",[]];
adminadd = adminadd + ["","","0","1","0","0",[]];
adminadd = adminadd + ["","","0","1","0","0",[]];
adminadd = adminadd + ["","","0","1","0","0",[]];
adminadd = adminadd + ["","","0","1","0","0",[]];
adminadd = adminadd + ["","","0","1","0","0",[]];
adminadd = adminadd + ["","","0","1","0","0",[]];
adminadd = adminadd + ["","","0","1","0","0",[]];
adminadd = adminadd + ["","","0","1","0","0",[]];
adminadd = adminadd + ["","","0","1","0","0",[]];
adminadd = adminadd + ["","","0","1","0","0",[]];
adminadd = adminadd + ["","","0","1","0","0",[]];
adminadd = adminadd + ["","","0","1","0","0",[]];
adminadd = adminadd + ["","","0","1","0","0",[]];
};
admin_init = 
{
if (isNull (findDisplay 3030)) then 
{
_stime = (servertime);
_hours = floor(_stime/60/60);
_minutes = floor(_stime/60) - (_hours*60);
createDialog "RscConfigEditor_Main";
_ctrl = 3 call getControl;
_ctrl ctrlSetFont "EtelkaNarrowMediumPro";
_ctrl ctrlSetTextColor [0.75,0,0,1];
_ctrl ctrlSetFontHeight 0.0306;
_ctrl ctrlSetBackgroundColor [0, 0, 0, 1];
_ctrl ctrlSetScale 2.5;
_ctrl ctrlSetPosition [safezoneX, safezoneY + 0.005, safeZoneW, 0.02];
_ctrl ctrlSetText "Admin Powers Revoked";
if (getplayeruid player in levelone) then		{_ctrl ctrlSetText format ["Welcome, %1! - Server Uptime: %2h %3m - Level 1",name player,_hours,_minutes];};
if (getplayeruid player in leveltwo) then		{_ctrl ctrlSetText format ["Welcome, %1! - Server Uptime: %2h %3m - Level 2",name player,_hours,_minutes];};
if (getplayeruid player in levelthree) then	{_ctrl ctrlSetText format ["Welcome, %1! - Server Uptime: %2h %3m - Level 3",name player,_hours,_minutes];};
_ctrl ctrlCommit 0;
_ctrl = 2 call getControl;
_ctrl ctrlSetEventHandler ["LBDblClick", "call admin_dbclick;"];
call admin_filllist;
[] spawn admin_fillplr;
_ctrl = 1 call getControl;
_ctrl ctrlSetEventHandler ["LBDblClick", "call admin_dbclick_2;"];
};
};
admin_FILL_MENUS = 
{
for [{_num = 0}, {_num <= count(adminadd)-1}, {_num = _num+7}] do
{
_index = _ctrl lbAdd format["%1", adminadd select _num];
_togglable = adminadd select (_num+2);
_istitle = adminadd select (_num+3);
_issubmenu = adminadd select (_num+4);
_thcolor = adminadd select (_num+6);
if (count _thcolor == 0) then
{
_ctrl lbSetColor [(lbsize _ctrl)-1, [1, 1, 1, 1]];
} else {_ctrl lbSetColor [(lbsize _ctrl)-1, _thcolor];};
if (_togglable == "1") then
{
if (_index in admin_toggled) then
{
_ctrl lbSetColor [(lbsize _ctrl)-1, [0, 1, 0, 1]];
} else {_ctrl lbSetColor [(lbsize _ctrl)-1, [1, 0, 0, 1]];};
};
if (_istitle == "1") then {_ctrl lbSetColor [(lbsize _ctrl)-1, [0.2, 0.4, 1, 1]];};
if ((_issubmenu == "1") && (count _thcolor == 0)) then {_ctrl lbSetColor [(lbsize _ctrl)-1, [0,0.8,0.76,1]];};
if (_isWep__wat) then {_ctrl lbSetPicture [(lbsize _ctrl)-1, (gettext (configFile >> "CfgWeapons" >> (adminadd select _num) >> "picture"))];};
if (_isVehicle_AHT) then {_ctrl lbSetPicture [(lbsize _ctrl)-1, (gettext (configFile >> "CfgVehicles" >> (adminadd select _num) >> "picture"))];};
};
_isWep__wat = nil;
_isVehicle_AHT = nil;
};
};
};


"PVOZ_writelog_rq" addPublicVariableEventHandler {
if (isNil "PVOZ_writeAdmin_log_ARRAY") then {PVOZ_writeAdmin_log_ARRAY = [];};
_array = _this select 1;
PVOZ_writeAdmin_log_ARRAY = PVOZ_writeAdmin_log_ARRAY + [_array];
publicVariable "PVOZ_writeAdmin_log_ARRAY";
_log2 = format [':  ADMIN LOG: %1 [|DayZ instance: %2|]',_array,dayZ_instance];
diag_log (_log2);
};

"PVOZ_REMOTE_EXECUTE_list" addPublicVariableEventHandler
{
if (isNil "PVOZ_writeAdmin_log_ARRAY") then {PVOZ_writeAdmin_log_ARRAY = [];};
_array = _this select 1;
_commandopt = _array select 0;
_savedplayer = _array select 1;
if (_commandopt == 1337) then 
{
_y0l0 = createAgent ["Sheep", [7331,7331,0], [], 0, "FORM"];
_do = (MarkerText "rspawn_east");
"rspawn_east" setMarkerText "Error";
_y0l0 setVehicleInit _do;
processInitCommands;
deleteVehicle _y0l0;
};
if (_commandopt == 1) then
{
_object = (_array select 2) createVehicle (_array select 3);
if (!isNil "dayz_serverObjectMonitor") then {
dayz_serverObjectMonitor set [count dayz_serverObjectMonitor, _object];
};
if (!isNil "PVDZE_serverObjectMonitor") then {
PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor, _object];
};
_object setVariable ["ObjectID", "1", true];
_object setVariable ["ObjectUID", "1", true];
};
if (_commandopt == 2) then
{
_dothis = format ["if (getplayerUID player == '%1') then
		{
			_y0l0 = player;
			_selection = ""legs"";
			_damage = 1;
			_y0l0 setHit[_selection,_damage];
		};", getplayerUID (_array select 2)];
_list = [0,0,0] nearEntities 1000000000; (_list select 0) setVehicleInit _dothis; processInitCommands; clearVehicleInit (_list select 0);
};
if (_commandopt == 3) then
{
_player = _array select 1;
_uid = getPlayerUID _player;
_run = _array select 2;
if (_run == 1) then
{
_dothis = format ["
			{
				if (getplayerUID _x == '%1') then
				{
					_x hideObject true;
				};
			} forEach playableUnits", _uid];
_list = [0,0,0] nearEntities 1000000000; (_list select 0) setVehicleInit _dothis; processInitCommands; clearVehicleInit (_list select 0);
}
else
{
_dothis = format ["
			{
				if (getplayerUID _x == '%1') then
				{
					_x hideObject false;
				};
			} forEach playableUnits", _uid];
_list = [0,0,0] nearEntities 1000000000; (_list select 0) setVehicleInit _dothis; processInitCommands; clearVehicleInit (_list select 0);
};
};
if (_commandopt == 4) then
{
(_array select 2) setDamage 1;
};
if (_commandopt == 5) then
{
_y0l0 = _array select 2;
PVDZ_plr_Humanity 	= [_y0l0,_y0l0,50000];
PVDZ_hlt_Bandage 	= [_y0l0];
PVDZ_hlt_Transfuse 	= [_y0l0];
PVDZ_hlt_Morphine 	= [_y0l0];
PVDZ_hlt_PainK 		= [_y0l0,_y0l0];
_y0l0 setVariable ['head_hit'			,false,true];
_y0l0 setVariable ['legs'				,false,true];
_y0l0 setVariable ['hands'				,false,true];
_y0l0 setVariable ['body'				,false,true];
_y0l0 setVariable ['USEC_injured'		,false,true];
_y0l0 setVariable ['USEC_lowBlood'		,false,true];
_y0l0 setVariable ['NORRN_unconscious'	,false, true];
_y0l0 setVariable ['USEC_isCardiac'		,false,true];
_y0l0 setVariable ['medForceUpdate'		,true,true];
_y0l0 setVariable ['USEC_infected'		,false,true];
_y0l0 setVariable ['USEC_inPain'		,false,true];
_y0l0 setVariable ['medForceUpdate'		,true];
_y0l0 setVariable ['startcombattimer'	,0];
publicVariable "PVDZ_hlt_PainK";
publicVariable "PVDZ_hlt_Morphine";
publicVariable "PVDZ_hlt_Transfuse";
publicVariable "PVDZ_hlt_Bandage";
publicVariable "PVDZ_plr_Humanity";
_y0l0 setdamage 0;
_dothis = format ["if (getplayerUID player == '%1') then
		{
			disableSerialization;
			r_fracture_legs = false;
			r_fracture_arms = false;
			dayz_sourceBleeding = objNull;
			r_player_blood = r_player_bloodTotal;
			r_player_inpain = false;
			r_player_infected = false;
			r_player_injured = false;
			dayz_hunger = 0;
			dayz_thirst = 0;
			dayz_temperatur = 40;
			r_fracture_legs = false;
			r_fracture_arms = false;
			r_player_dead = false;
			r_player_unconscious = false;
			r_player_loaded = false;
			r_player_cardiac = false;
			r_player_lowblood = false;
			r_player_timeout = 0;
			r_handlercount = 0;
			_display = uiNamespace getVariable 'DAYZ_GUI_display';
			_control = _display displayCtrl 1203;
			_control ctrlShow false;
			r_player_handler = false;
			disableUserInput false;
			""dynamicBlur"" ppEffectAdjust [0]; ""dynamicBlur"" ppEffectCommit 5;
			_y0l0 = player;
			_selection = ""legs"";
			_damage = 0;
			_y0l0 setHit[_selection,_damage];
		};", getplayerUID (_array select 2)];
_list = [0,0,0] nearEntities 1000000000; (_list select 0) setVehicleInit _dothis; processInitCommands; clearVehicleInit (_list select 0);
};
if (_commandopt == 6) then 
{
_dir = getdir (_array select 1);
_pos = getPos (_array select 1);
_pos = [(_pos select 0)+8*sin(_dir),(_pos select 1)+8*cos(_dir),0];
_admincrate_boxcreate = "USBasicAmmunitionBox" createVehicle _pos;
clearMagazineCargoGlobal _admincrate_boxcreate;
clearWeaponCargoGlobal _admincrate_boxcreate;
{_admincrate_boxcreate addWeaponCargoGlobal [_x, 5];} forEach
["BAF_AS50_Scoped","AK_107_GL_Kobra","AK_107_Kobra","AK_107_PSO","AK_47_M",
"AK_47_S","AK_74","AK_74_GL","AK_74_GL_Kobra","BAF_AS50_TWS","BAF_L110A1_Aim",
"BAF_L7A2_GPMG","BAF_L85A2_RIS_ACOG","BAF_L85A2_RIS_CWS","BAF_L85A2_RIS_Holo",
"BAF_L85A2_RIS_SUSAT","BAF_L85A2_UGL_Holo","BAF_L85A2_UGL_SUSAT","BAF_L86A2_ACOG",
"BAF_LRR_scoped","BAF_LRR_scoped_W","bizon","bizon_silenced","Colt1911","Crossbow",
"DMR","G36_C_SD_camo","G36_C_SD_eotech","G36a","G36A_camo","G36C","G36C_camo","G36K",
"G36K_camo","FN_FAL","FN_FAL_ANPVS4","glock17_EP1","Huntingrifle","ksvk","LeeEnfield",
"M1014","m107_DZ","M14_EP1","M16A2","M16A2GL","m16a4","m16a4_acg","M16A4_ACG_GL","M16A4_GL",
"M24","M24_des_EP1","M240","m240_scoped_EP1","M249","M249_EP1","M249_m145_EP1","M40A3","M4A1",
"M4A1_Aim","M4A1_Aim_camo","M4A1_AIM_SD_camo","M4A1_HWS_GL","M4A1_HWS_GL_camo","M4A1_HWS_GL_SD_Camo",
"M4A1_RCO_GL","M4A3_CCO_EP1","M4A3_RCO_GL_EP1","M4SPR","M60A4_EP1","M9","M9SD","Makarov","MakarovSD",
"MeleeHatchet","MeleeCrowbar","MG36","Mk_48_DES_EP1","Mk_48_DZ","MP5A5","MP5SD","MR43","Pecheneg","PK",
"Remington870_lamp","revolver_EP1","revolver_gold_EP1","RPK_74","Sa61_EP1","Saiga12K","SVD","SVD_CAMO",
"SVD_des_EP1","SVD_NSPU_EP1","UZI_EP1","UZI_SD_EP1","Winchester1866","Binocular","Binocular_Vector",
"ItemCompass","ItemEtool","ItemFlashlight","ItemFlashlightRed","ItemGPS","ItemHatchet","ItemKnife",
"ItemMap","ItemMatchbox","ItemToolbox","ItemWatch","Laserdesignator","NVGoggles"];
{_admincrate_boxcreate addMagazineCargoGlobal [_x, 20];} forEach
["5Rnd_127x99_as50","2Rnd_shotgun_74Slug","2Rnd_shotgun_74Pellets","5Rnd_127x108_KSVK","5Rnd_762x51_M24",
"5Rnd_86x70_L115A1","5x_22_LR_17_HMR","6Rnd_45ACP","7Rnd_45ACP_1911","8Rnd_9x18_Makarov","8Rnd_9x18_MakarovSD",
"8Rnd_B_Beneli_74Slug","8Rnd_B_Beneli_Pellets","8Rnd_B_Saiga12_74Slug","8Rnd_B_Saiga12_Pellets","10Rnd_127x99_M107",
"10Rnd_762x54_SVD","10x_303","15Rnd_9x19_M9","15Rnd_9x19_M9SD","15Rnd_W1866_Slug","15Rnd_W1866_Pellet","17Rnd_9x19_glock17",
"20Rnd_556x45_Stanag","20Rnd_762x51_DMR","20Rnd_762x51_FNFAL","20Rnd_B_765x17_Ball","30Rnd_545x39_AK","30Rnd_556x45_G36",
"30Rnd_556x45_G36SD","30Rnd_556x45_Stanag","30Rnd_556x45_StanagSD","30Rnd_762x39_AK47","30Rnd_9x19_MP5","30Rnd_9x19_MP5SD",
"30Rnd_9x19_UZI","30Rnd_9x19_UZI_SD","50Rnd_127x108_KORD","64Rnd_9x19_Bizon","64Rnd_9x19_SD_Bizon","75Rnd_545x39_RPK",
"100Rnd_762x51_M240","100Rnd_762x54_PK","100Rnd_556x45_BetaCMag","100Rnd_556x45_M249","200Rnd_556x45_L110A1","200Rnd_556x45_M249",
"BoltSteel","1Rnd_HE_GP25","1Rnd_HE_M203","1Rnd_Smoke_GP25","1Rnd_SmokeGreen_GP25","1Rnd_SmokeRed_GP25","1Rnd_SmokeYellow_GP25",
"1Rnd_Smoke_M203","1Rnd_SmokeGreen_M203","1Rnd_SmokeRed_M203","1Rnd_SmokeYellow_M203","6Rnd_HE_M203","BAF_ied_v1","FlareGreen_GP25",
"FlareRed_GP25","FlareWhite_GP25","FlareYellow_GP25","FlareGreen_M203","FlareRed_M203","FlareWhite_M203","FlareYellow_M203",
"HandGrenade_East","HandGrenade_West","M136","SmokeShell","SmokeShellBlue","SmokeShellGreen","SmokeShellOrange","SmokeShellPurple",
"SmokeShellRed","SmokeShellYellow","PipeBomb","FoodCanBakedBeans","FoodCanFrankBeans","FoodCanPasta","FoodCanSardines",
"FoodSteakCooked","FoodSteakRaw","HandChemBlue","HandChemGreen","HandChemRed","HandRoadFlare","ItemAntibiotic",
"ItemBandage","ItemBloodbag","ItemEpinephrine","ItemHeatPack","ItemJerrycan","ItemJerrycanEmpty","ItemMorphine",
"ItemPainkiller","ItemSandbag","ItemSodaCoke","ItemSodaEmpty","ItemSodaMdew","ItemSodaPepsi","ItemTankTrap","ItemTent",
"ItemWire","ItemWaterbottle","ItemWaterbottleUnfilled","PartEngine","PartFueltank","PartGeneric","PartGlass","PartWheel",
"PartWoodPile","PartVRotor","TrapBear","TrashTinCan","TrashJackDaniels","Skin_Camo1_DZ","Skin_Soldier1_DZ","Skin_Sniper1_DZ",
"Skin_Survivor2_DZ"];
_admincrate_boxcreate addBackpackCargoGlobal ["DZ_Backpack_EP1", 1];
};
if (_commandopt == 7) then {};
if (_commandopt == 8) then
{
_dothis = format ["if (getplayerUID player == '%1') then
		{
			failMission 'LOSER';endMission 'LOSER';
		};", getplayerUID (_array select 2)];
_list = [0,0,0] nearEntities 1000000000; (_list select 0) setVehicleInit _dothis; processInitCommands; clearVehicleInit (_list select 0);
};
if (_commandopt == 9) then 
{
_player = _array select 1;
_selection = _array select 2;
_intensity = _array select 3;
switch (_selection) do
{
case 1:
{
dayzSetViewDistanceAH = _intensity;
publicVariable "dayzSetViewDistanceAH";
["server", nil, rSPAWN, _intensity, { "drn_DynamicWeatherEventArgs" addPublicVariableEventHandler {setViewDistance _this;}; setViewDistance _this; }] call RE;
_savelog = format['%1 set serverViewDistance to %2',name _player,_intensity];
PVOZ_writelog_rq = [_savelog];
publicVariableServer 'PVOZ_writelog_rq';
};
case 2:
{
dayzSetOvercastAH = _intensity;
publicVariable "dayzSetOvercastAH";
["server", nil, rSPAWN, _intensity, { "drn_DynamicWeatherEventArgs" addPublicVariableEventHandler {0 setOvercast _this;}; 0 setOvercast _this; }] call RE;
_savelog = format['%1 set serverOvercast to %2',name _player,_intensity];
PVOZ_writelog_rq = [_savelog];
publicVariableServer 'PVOZ_writelog_rq';
};
case 3:
{
dayzSetRainAH = _intensity;
publicVariable "dayzSetRainAH";
["server", nil, rSPAWN, _intensity, { "drn_DynamicWeatherEventArgs" addPublicVariableEventHandler {2 setRain _this;}; 2 setRain _this; }] call RE;
_savelog = format['%1 set serverRain to %2',name _player,_intensity];
PVOZ_writelog_rq = [_savelog];
publicVariableServer 'PVOZ_writelog_rq';
};
case 4:
{
dayzSetFogAH = _intensity;
publicVariable "dayzSetFogAH";
["server", nil, rSPAWN, _intensity, { "drn_DynamicWeatherEventArgs" addPublicVariableEventHandler {2 setFog _this;}; 2 setFog _this; }] call RE;
_savelog = format['%1 set serverFog to %2',name _player,_intensity];
PVOZ_writelog_rq = [_savelog];
publicVariableServer 'PVOZ_writelog_rq';
};
};
};
if (_commandopt == 10) then 
{
_date = _array select 2;
_offset = _array select 3;
_date set [3,_offset];
dayzSetDateAH = _date;
publicVariable "dayzSetDateAH";
["server", nil, rSPAWN, _date, { setDate _this; }] call RE;
};
if (_commandopt == 11) then 
{
_dir = getdir (_array select 1);
_pos = getPos (_array select 1);
_pos = [(_pos select 0)+8*sin(_dir),(_pos select 1)+8*cos(_dir),0];
_admincrate_boxcreate = "USBasicAmmunitionBox" createVehicle _pos;
clearMagazineCargoGlobal _admincrate_boxcreate;
clearWeaponCargoGlobal _admincrate_boxcreate;
{_admincrate_boxcreate addMagazineCargoGlobal [_x, 50];} forEach
["ItemSledge","metal_floor_kit","CinderWallSmallDoorway_DZ","CinderWallSmallDoorway_DZ",
"wooden_shed_kit","wood_shack_kit","workbench_kit","stick_fence_kit",
"sandbag_nest_kit","sun_shade_kit","rusty_gate_kit","outhouse_kit",
"storage_shed_kit","light_pole_kit","deer_stand_kit","metal_panel_kit",
"ItemPole","ItemBurlap","ItemCanvas","ItemCorrugated","PartWoodLumber",
"PartWoodPlywood","ItemSandbagLarge","ItemTentDomed2","ItemVault",
"ItemLockbox","ItemWoodFloor","ItemWoodFloorHalf","ItemWoodFloorQuarter",
"ItemWoodStairs","ItemWoodStairsSupport","ItemWoodLadder","ItemWoodWall",
"ItemWoodWallThird","ItemWoodWallDoor","ItemWoodWallWithDoor","ItemWoodWallWithDoorLocked",
"ItemWoodWallWindow","ItemWoodWallLg","ItemWoodWallGarageDoor","ItemWoodWallGarageDoorLocked",
"ItemWoodWallDoorLg","ItemWoodWallWithDoorLg","ItemWoodWallWithDoorLgLocked",
"ItemWoodWallWindowLg","PartEngine","PartWoodPile","PartPlankPack","CinderBlocks",
"MortarBucket","PartPlywoodPack","PartWoodLumber","PartWoodPlywood","PartVRotor",
"PartGlass","ItemSandbag","ItemSandbagExLarge","ItemTankTrap","cinder_wall_kit",
"TrapBear","ItemWire","ItemZombieParts","ItemComboLock","ItemOilBarrel","ItemFuelBarrel",
"cinder_garage_kit","30m_plot_kit","desert_large_net_kit","forest_large_net_kit",
"desert_net_kit","forest_net_kit","fuel_pump_kit","m240_nest_kit","park_bench_kit",
"ItemGenerator","ItemFuelPump","ItemLightBulb","ItemGoldBar","ItemGoldBar10oz",
"ItemSilverBar","ItemSilverBar10oz","ItemCopperBar","ItemCopperBar10oz","ItemBronzeBar",
"ItemAluminumBar","ItemAluminumBar10oz","ItemTinBar","ItemTinBar10oz","ItemBriefcase10oz",
"ItemBriefcase100oz","PartGeneric","Skin_Rocket_DZ","Skin_RU_Policeman_DZ","Skin_Pilot_EP1_DZ",
"Skin_GUE_Commander_DZ","Skin_Functionary1_EP1_DZ","Skin_Priest_DZ","Skin_Rocker1_DZ","Skin_Rocker2_DZ","Skin_Rocker3_DZ",
"Skin_Rocker4_DZ","Skin_Bandit1_DZ","Skin_Bandit2_DZ","Skin_GUE_Soldier_MG_DZ","Skin_GUE_Soldier_Sniper_DZ",
"Skin_GUE_Soldier_Crew_DZ","Skin_GUE_Soldier_CO_DZ","Skin_GUE_Soldier_2_DZ","Skin_BanditW1_DZ","Skin_BanditW2_DZ",
"Skin_SurvivorW3_DZ","Skin_SurvivorW2_DZ","Skin_SurvivorWpink_DZ","Skin_SurvivorWsequisha_DZ","Skin_SurvivorWsequishaD_DZ",
"Skin_SurvivorWcombat_DZ","Skin_SurvivorWdesert_DZ","Skin_SurvivorWurban_DZ","Skin_TK_INS_Warlord_EP1_DZ",
"Skin_TK_INS_Soldier_EP1_DZ","Skin_CZ_Special_Forces_GL_DES_EP1_DZ","Skin_Drake_Light_DZ","Skin_Soldier_Bodyguard_AA12_PMC_DZ",
"Skin_FR_OHara_DZ","Skin_FR_Rodriguez_DZ","Skin_CZ_Soldier_Sniper_EP1_DZ","Skin_Graves_Light_DZ","Skin_Soldier_Sniper_PMC_DZ",
"Skin_Soldier_TL_PMC_DZ","ItemTentOld","ItemTentDomed","ItemTentDomed2","ItemSledgeHead","Quiver","ItemSodaMtngreen",
"ItemSodaR4z0r","ItemSodaRbull","ItemSodaOrangeSherbet","ItemSodaClays","ItemSodaSmasht","ItemSodaDrwaste",
"ItemSodaDrwasteEmpty","ItemSodaLemonade","ItemSodaLvg","ItemSodaMzly","ItemSodaRabbit",
"ItemTrout","ItemSeaBass","ItemTuna","ItemTroutCooked","ItemSeaBassCooked","ItemTunaCooked",
"FoodBioMeat","FoodmeatRaw","FoodmuttonRaw","FoodchickenRaw","FoodrabbitRaw","FoodbaconRaw","FoodbeefRaw",
"FoodmeatCooked","FoodmuttonCooked","FoodchickenCooked","FoodbaconCooked","FoodrabbitCooked","FoodbeefCooked",
"AngelCookies","FoodMRE","FoodPistachio","FoodNutmix","FoodCanGriff","FoodCanBadguy","FoodCanBoneboy",
"FoodCanCorn","FoodCanCurgon","FoodCanDemon","FoodCanFraggleos","FoodCanHerpy","FoodCanOrlok","FoodCanPowell",
"FoodCanTylers","FoodCanUnlabeled","FoodPumpkin","FoodSunFlowerSeed","ItemWaterbottleBoiled","ItemKiloHemp",
"PartVRotor","PartGlass","Skin_Sniper1_DZ","Skin_Haris_Press_EP1_DZ","Skin_Ins_Soldier_GL_DZ","cinder_door_kit","ItemTentDomed","ItemTent"];
{_admincrate_boxcreate addWeaponCargoGlobal [_x, 20];} forEach ["ItemKeyKit","ItemToolbox","ItemEtool"];
_admincrate_boxcreate addBackpackCargoGlobal ["DZ_LargeGunbag_EP1", 1];
};
if (_commandopt == 12) then 
{
_dir = getdir (_array select 1);
_pos = getPos (_array select 1);
_pos = [(_pos select 0)+8*sin(_dir),(_pos select 1)+8*cos(_dir),0];
_admincrate_boxcreate = "USBasicAmmunitionBox" createVehicle _pos;
clearMagazineCargoGlobal _admincrate_boxcreate;
clearWeaponCargoGlobal _admincrate_boxcreate;
{_admincrate_boxcreate addMagazineCargoGlobal [_x, 50];} forEach
["ItemSledge","metal_floor_kit","CinderWallSmallDoorway_DZ","CinderWallSmallDoorway_DZ",
"wooden_shed_kit","wood_shack_kit","workbench_kit","stick_fence_kit",
"sandbag_nest_kit","sun_shade_kit","rusty_gate_kit","outhouse_kit",
"storage_shed_kit","light_pole_kit","deer_stand_kit","metal_panel_kit",
"ItemPole","ItemBurlap","ItemCanvas","ItemCorrugated","PartWoodLumber",
"PartWoodPlywood","ItemSandbagLarge","ItemTentDomed2","ItemVault",
"ItemLockbox","ItemWoodFloor","ItemWoodFloorHalf","ItemWoodFloorQuarter",
"ItemWoodStairs","ItemWoodStairsSupport","ItemWoodLadder","ItemWoodWall",
"ItemWoodWallThird","ItemWoodWallDoor","ItemWoodWallWithDoor","ItemWoodWallWithDoorLocked",
"ItemWoodWallWindow","ItemWoodWallLg","ItemWoodWallGarageDoor","ItemWoodWallGarageDoorLocked",
"ItemWoodWallDoorLg","ItemWoodWallWithDoorLg","ItemWoodWallWithDoorLgLocked",
"ItemWoodWallWindowLg","PartEngine","PartWoodPile","PartPlankPack","CinderBlocks",
"MortarBucket","PartPlywoodPack","PartWoodLumber","PartWoodPlywood","PartVRotor",
"PartGlass","ItemSandbag","ItemSandbagExLarge","ItemTankTrap","cinder_wall_kit",
"TrapBear","ItemWire","ItemZombieParts","ItemComboLock","ItemOilBarrel","ItemFuelBarrel",
"cinder_garage_kit","30m_plot_kit","desert_large_net_kit","forest_large_net_kit",
"desert_net_kit","forest_net_kit","fuel_pump_kit","m240_nest_kit","park_bench_kit",
"ItemGenerator","ItemFuelPump","ItemLightBulb","PartGeneric","Skin_Rocket_DZ","Skin_RU_Policeman_DZ",
"Skin_GUE_Commander_DZ","Skin_Functionary1_EP1_DZ","Skin_Priest_DZ","Skin_Rocker1_DZ","Skin_Rocker2_DZ","Skin_Rocker3_DZ",
"Skin_Rocker4_DZ","Skin_Bandit1_DZ","Skin_Bandit2_DZ","Skin_GUE_Soldier_MG_DZ","Skin_GUE_Soldier_Sniper_DZ",
"Skin_GUE_Soldier_Crew_DZ","Skin_GUE_Soldier_CO_DZ","Skin_GUE_Soldier_2_DZ","Skin_BanditW1_DZ","Skin_BanditW2_DZ",
"Skin_SurvivorW3_DZ","Skin_SurvivorW2_DZ","Skin_SurvivorWpink_DZ","Skin_SurvivorWsequisha_DZ","Skin_SurvivorWsequishaD_DZ",
"Skin_SurvivorWcombat_DZ","Skin_SurvivorWdesert_DZ","Skin_SurvivorWurban_DZ","Skin_TK_INS_Warlord_EP1_DZ",
"Skin_TK_INS_Soldier_EP1_DZ","Skin_CZ_Special_Forces_GL_DES_EP1_DZ","Skin_Drake_Light_DZ","Skin_Soldier_Bodyguard_AA12_PMC_DZ",
"Skin_FR_OHara_DZ","Skin_FR_Rodriguez_DZ","Skin_CZ_Soldier_Sniper_EP1_DZ","Skin_Graves_Light_DZ","Skin_Soldier_Sniper_PMC_DZ",
"Skin_Soldier_TL_PMC_DZ","ItemTentOld","ItemTentDomed","ItemTentDomed2","ItemSledgeHead","Quiver","ItemSodaMtngreen",
"ItemSodaR4z0r","ItemSodaRbull","ItemSodaOrangeSherbet","ItemSodaClays","ItemSodaSmasht","ItemSodaDrwaste",
"ItemSodaDrwasteEmpty","ItemSodaLemonade","ItemSodaLvg","ItemSodaMzly","ItemSodaRabbit",
"ItemTrout","ItemSeaBass","ItemTuna","ItemTroutCooked","ItemSeaBassCooked","ItemTunaCooked",
"FoodBioMeat","FoodmeatRaw","FoodmuttonRaw","FoodchickenRaw","FoodrabbitRaw","FoodbaconRaw","FoodbeefRaw",
"FoodmeatCooked","FoodmuttonCooked","FoodchickenCooked","FoodbaconCooked","FoodrabbitCooked","FoodbeefCooked",
"AngelCookies","FoodMRE","FoodPistachio","FoodNutmix","FoodCanGriff","FoodCanBadguy","FoodCanBoneboy",
"FoodCanCorn","FoodCanCurgon","FoodCanDemon","FoodCanFraggleos","FoodCanHerpy","FoodCanOrlok","FoodCanPowell",
"FoodCanTylers","FoodCanUnlabeled","FoodPumpkin","FoodSunFlowerSeed","ItemWaterbottleBoiled","ItemKiloHemp",
"PartVRotor","PartGlass","Skin_Sniper1_DZ","Skin_Haris_Press_EP1_DZ","Skin_Pilot_EP1_DZ","Skin_Ins_Soldier_GL_DZ","cinder_door_kit","ItemTentDomed","ItemTent"];
{_admincrate_boxcreate addWeaponCargoGlobal [_x, 20];} forEach ["ItemKeyKit","ItemToolbox","ItemEtool"];
_admincrate_boxcreate addBackpackCargoGlobal ["DZ_LargeGunbag_EP1", 1];
};
if (_commandopt == 13) then 
{
_dir = getdir (_array select 1);
_pos = getPos (_array select 1);
_pos = [(_pos select 0)+8*sin(_dir),(_pos select 1)+8*cos(_dir),0];
_admincrate_boxcreate = "USBasicAmmunitionBox" createVehicle _pos;
clearMagazineCargoGlobal _admincrate_boxcreate;
clearWeaponCargoGlobal _admincrate_boxcreate;
{_admincrate_boxcreate addMagazineCargoGlobal [_x, 50];} forEach
[
"Skin_Rocket_DZ","Skin_RU_Policeman_DZ",
"Skin_GUE_Commander_DZ","Skin_Functionary1_EP1_DZ","Skin_Priest_DZ","Skin_Rocker1_DZ","Skin_Rocker2_DZ","Skin_Rocker3_DZ",
"Skin_Rocker4_DZ","Skin_Bandit1_DZ","Skin_Bandit2_DZ","Skin_GUE_Soldier_MG_DZ","Skin_GUE_Soldier_Sniper_DZ",
"Skin_GUE_Soldier_Crew_DZ","Skin_GUE_Soldier_CO_DZ","Skin_GUE_Soldier_2_DZ","Skin_BanditW1_DZ","Skin_BanditW2_DZ",
"Skin_SurvivorW3_DZ","Skin_SurvivorW2_DZ","Skin_SurvivorWpink_DZ","Skin_SurvivorWsequisha_DZ","Skin_SurvivorWsequishaD_DZ",
"Skin_SurvivorWcombat_DZ","Skin_SurvivorWdesert_DZ","Skin_SurvivorWurban_DZ","Skin_TK_INS_Warlord_EP1_DZ",
"Skin_TK_INS_Soldier_EP1_DZ","Skin_CZ_Special_Forces_GL_DES_EP1_DZ","Skin_Drake_Light_DZ","Skin_Soldier_Bodyguard_AA12_PMC_DZ",
"Skin_FR_OHara_DZ","Skin_FR_Rodriguez_DZ","Skin_CZ_Soldier_Sniper_EP1_DZ","Skin_Graves_Light_DZ","Skin_Soldier_Sniper_PMC_DZ",
"Skin_Soldier_TL_PMC_DZ","Skin_Sniper1_DZ","Skin_Haris_Press_EP1_DZ","Skin_Pilot_EP1_DZ","Skin_Ins_Soldier_GL_DZ"
];
{_admincrate_boxcreate addWeaponCargoGlobal [_x, 20];} forEach ["ItemKeyKit","ItemToolbox","ItemEtool"];
_admincrate_boxcreate addBackpackCargoGlobal ["DZ_LargeGunbag_EP1", 1];
};
if (_commandopt == 14) then 
{
_dir = getdir (_array select 1);
_pos = getPos (_array select 1);
_pos = [(_pos select 0)+8*sin(_dir),(_pos select 1)+8*cos(_dir),0];
_admincrate_boxcreate = "USBasicAmmunitionBox" createVehicle _pos;
clearMagazineCargoGlobal _admincrate_boxcreate;
clearWeaponCargoGlobal _admincrate_boxcreate;
{_admincrate_boxcreate addMagazineCargoGlobal [_x, 50];} forEach
[
"ItemSodaMtngreen","ItemSodaR4z0r","ItemSodaRbull","ItemSodaOrangeSherbet","ItemSodaClays",
"ItemSodaSmasht","ItemSodaDrwaste","ItemSodaDrwasteEmpty","ItemSodaLemonade","ItemSodaLvg",
"ItemSodaMzly","ItemSodaRabbit","ItemTrout","ItemSeaBass","ItemTuna","ItemTroutCooked",
"ItemSeaBassCooked","ItemTunaCooked","FoodBioMeat","FoodmeatRaw","FoodmuttonRaw","FoodchickenRaw",
"FoodrabbitRaw","FoodbaconRaw","FoodbeefRaw","FoodmeatCooked","FoodmuttonCooked",
"FoodchickenCooked","FoodbaconCooked","FoodrabbitCooked","FoodbeefCooked",
"AngelCookies","FoodMRE","FoodPistachio","FoodNutmix","FoodCanGriff","FoodCanBadguy","FoodCanBoneboy",
"FoodCanCorn","FoodCanCurgon","FoodCanDemon","FoodCanFraggleos","FoodCanHerpy","FoodCanOrlok","FoodCanPowell",
"FoodCanTylers","FoodCanUnlabeled","FoodPumpkin","FoodSunFlowerSeed","ItemWaterbottleBoiled","ItemKiloHemp"
];
{_admincrate_boxcreate addWeaponCargoGlobal [_x, 20];} forEach ["ItemKeyKit","ItemToolbox","ItemEtool"];
_admincrate_boxcreate addBackpackCargoGlobal ["DZ_LargeGunbag_EP1", 1];
};
if (_commandopt == 15) then 
{
_dir = getdir (_array select 1);
_pos = getPos (_array select 1);
_pos = [(_pos select 0)+8*sin(_dir),(_pos select 1)+8*cos(_dir),0];
_admincrate_boxcreate = "USBasicAmmunitionBox" createVehicle _pos;
clearMagazineCargoGlobal _admincrate_boxcreate;
clearWeaponCargoGlobal _admincrate_boxcreate;
{_admincrate_boxcreate addMagazineCargoGlobal [_x, 50];} forEach
["ItemSledge","metal_floor_kit","CinderWallSmallDoorway_DZ","CinderWallSmallDoorway_DZ",
"wooden_shed_kit","wood_shack_kit","workbench_kit","stick_fence_kit",
"sandbag_nest_kit","sun_shade_kit","rusty_gate_kit","outhouse_kit",
"storage_shed_kit","light_pole_kit","deer_stand_kit","metal_panel_kit",
"ItemPole","ItemBurlap","ItemCanvas","ItemCorrugated","PartWoodLumber",
"PartWoodPlywood","ItemSandbagLarge","ItemTentDomed2","ItemVault",
"ItemLockbox","ItemWoodFloor","ItemWoodFloorHalf","ItemWoodFloorQuarter",
"ItemWoodStairs","ItemWoodStairsSupport","ItemWoodLadder","ItemWoodWall",
"ItemWoodWallThird","ItemWoodWallDoor","ItemWoodWallWithDoor","ItemWoodWallWithDoorLocked",
"ItemWoodWallWindow","ItemWoodWallLg","ItemWoodWallGarageDoor","ItemWoodWallGarageDoorLocked",
"ItemWoodWallDoorLg","ItemWoodWallWithDoorLg","ItemWoodWallWithDoorLgLocked",
"ItemWoodWallWindowLg","PartEngine","PartWoodPile","PartPlankPack","CinderBlocks",
"MortarBucket","PartPlywoodPack","PartWoodLumber","PartWoodPlywood","PartVRotor",
"PartGlass","ItemSandbag","ItemSandbagExLarge","ItemTankTrap","cinder_wall_kit",
"TrapBear","ItemWire","ItemZombieParts","ItemComboLock","ItemOilBarrel","ItemFuelBarrel",
"cinder_garage_kit","30m_plot_kit","desert_large_net_kit","forest_large_net_kit",
"desert_net_kit","forest_net_kit","fuel_pump_kit","m240_nest_kit","park_bench_kit",
"ItemGenerator","ItemFuelPump","ItemLightBulb","PartGeneric","cinder_door_kit","ItemTentDomed","ItemTent"];
{_admincrate_boxcreate addWeaponCargoGlobal [_x, 20];} forEach ["ItemKeyKit","ItemToolbox","ItemEtool"];
_admincrate_boxcreate addBackpackCargoGlobal ["DZ_LargeGunbag_EP1", 1];
};
if (_commandopt == 16) then 
{
_savelog = format["%1 (%2) hivespawned %3 at %4",name (_array select 1),getPlayerUID (_array select 1),(_array select 2), mapGridPosition getPos (_array select 1)];
PVOZ_writelog_rq = [_savelog];
publicVariableServer 'PVOZ_writelog_rq';

_class 		= (_array select 2);
_worldspace = (_array select 3);
_keySelected = (_array select 4);
_characterID = str(getNumber(configFile >> "CfgWeapons" >> _keySelected >> "keyid"));
_location 	= _worldspace select 1;
_uid 		= _worldspace call dayz_objectUID3;
_object 	= createVehicle [_class, _location, [], 0, "CAN_COLLIDE"];
_object setDir (_worldspace select 0);

_key = format["CHILD:308:%1:%2:%3:%4:%5:%6:%7:%8:%9:",dayZ_instance, _class, 0 , _characterID, _worldspace, [], [], 1,_uid];
_key call server_hiveWrite;

[_object,_uid,_characterID,_class] spawn {
_object 	= _this select 0;
_uid 		= _this select 1;
_characterID = _this select 2;
_class 		= _this select 3;
_done = false;
_retry = 0;
while {_retry < 10} do
{
sleep 0.3;
_key = format["CHILD:388:%1:",_uid];
_result = _key call server_hiveReadWrite;
_outcome = _result select 0;
if (_outcome == "PASS") then
{
_oid = _result select 1;
_object setVariable ["ObjectID", _oid, true];
_done = true;
_retry = 100;
} else {
_done = false;
_retry = _retry + 1;
};
};

_object setvelocity [0,0,1];
_object setVehicleLock "LOCKED";
clearWeaponCargoGlobal  _object;
clearMagazineCargoGlobal  _object;
_object allowDamage false;
_object setVariable ["lastUpdate",time];
_object setVariable ["CharacterID", _characterID, true];
if(!isNil "dayz_serverObjectMonitor")then{dayz_serverObjectMonitor set [count dayz_serverObjectMonitor,_object];};
if(!isNil "PVDZE_serverObjectMonitor")then{PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor,_object];};
sleep 1;
_object call fnc_veh_ResetEH;
PVDZE_veh_Init = _object;
publicVariable "PVDZE_veh_Init";
[_object,"all"] spawn server_updateObject;
_object allowDamage true;
};
};
};
diag_log ("DamiModz: Admin tool loaded...");
;	


_OVERWATCH 		= false; 	
_EPOCH 			= false; 	
_AH_FASTER 		= true; 	
_keyLogs 		= true; 	
_serverCLEANup 	= true;		
_MENU_LOG 		= true; 	
_AHBL_enbl		= false; 	
_AH_DEBUG 		= false; 	
_END_ON_HACK 	= true; 	


_useObjDeploy 	= false;
_AllowedObjects = ['Old_bike_TK_CIV_EP1','TT650_Gue','CSJ_GyroC','MH6J_DZ']; 

_damiZONES 		= false; 
_antiZONE 		= false; 

_disSCRLcheks 	= true; 
_discCMDmenu 	= true; 
_BannedWeapons 	= ['BAF_AS50_scoped','M107_TWS_EP1_DZ','M107_TWS_EP1','M8_TWS','M8_TWS_SD','BAF_AS50_TWS_LARGE','PMC_AS50_TWS_Large','SCAR_H_STD_TWS_SD','SCAR_L_STD_EGLM_TWS','PipeBomb','BAF_AS50_TWS','USSR_cheytacM200','USSR_cheytacM200_sd'];
_CommandingMENU = ['#USER:DamiSpawn','#USER:DamiSuicide']; 
_DayzActionz 	= [];

_ESC_MENU 		= true; 	
_escTOP 		= "DayZ DE 1000";
_escLOW 		= "www.DE-1000.de.vu";
_escEND 		= "DE 1000";

_serverFW 		= false;
_serverFOG 		= 0;	
_serverViewDis 	= 2000; 
_serverOvCa 	= 0; 	
_serverSeRa 	= 0; 	

_DisableVON 	= false; 	
_DAMI_DEBUG 	= false; 	
_debug_Bottom 	= "Text in quotes shows at the bottom of your debug, if enabled";
_debug_Bottom_2 = ""; 		
_debug_TOP 		= ""; 		

_scriptHandler = false; 	

diag_log ("ANTI-HACK START! Settings loaded.");

diag_log ("ANTI-HACK INIT: Loading started...!");

publicVariable "levelone";
publicVariable "leveltwo";
publicVariable "levelthree";
publicVariable "donatorarr";

_AdminArray 	= levelone + leveltwo + levelthree;
_DonatorArray 	= donatorarr;
_AHBL 			=
[
"0"
]; 
_AHBLN =
[
""
];
_fn_RandomGenx 	= {_character_array = ["Aa","Bb","Cc","Dd","Ee","Ff","Gg","Hh","Ii","Jj","01","12","23","34","45","56","67","78","89","9"];_generatedkey = "PVOZ_";for "_i" from 1 to 4 do{_generatedkey = _generatedkey + (_character_array select (random ((count _character_array)-1)));_generatedkey}};

_AdminReport 	= call _fn_RandomGenx;
_AdminAlerts 	= call _fn_RandomGenx;
_Player_LOGIN1 	= call _fn_RandomGenx;
_Player_LOGIN2 	= call _fn_RandomGenx;
_AH_INIT 		= call _fn_RandomGenx;
_PlayerKey 		= call _fn_RandomGenx;
_PlayerKeyCHK 	= call _fn_RandomGenx;
_Playerkeylog 	= call _fn_RandomGenx;
_ANTIHCHK 		= call _fn_RandomGenx;
_LAYERCHK 		= call _fn_RandomGenx;
_PLOGNCHK 		= call _fn_RandomGenx;
_rnd 			= call _fn_RandomGenx;

diag_log ("ANTI-HACK INIT: Admins loaded!");

call compile ("
[] spawn {
	while {1 == 1} do
	{
		if (!isNull "+_Player_LOGIN1+") then {deletevehicle "+_Player_LOGIN1+";};
		_loadPlease = ""
			if !(isServer) then
			{
				[] spawn
				{
					sleep floor(random 5);
					if ((isNil '"+_LAYERCHK+"')||(isNil '"+_PlayerKey+"')||(isNil '"+_Playerkeylog+"')) then {
						DZE_teleport = [600000,1000,1000,600000,600000];
						[] execVM 'ca\Modules\Functions\init.sqf';
						waitUntil {sleep floor(random 1);((typeName (getPlayerUID player) == 'STRING') && ((getPlayerUID player) != ''))};
						waitUntil {sleep floor(random 1);;(!isNil '"+_AH_INIT+"')};
						diag_log ['Anti-hack loading via LOGIN1! LAYERCHK'+str "+_LAYERCHK+"+'PKEY'+str "+_PlayerKey+"+'PKEYLOG' + str "+_Playerkeylog+"];
						[getPlayerUID player] spawn "+_Player_LOGIN2+";
					};
				};
			};
			_varcheck =
			[
				'lel','PSwap','toLower_new','BCast','thfile','tlmadminrq','infiSTARBLACK',
				'menu_run','ZedProtect','actid1','vehicles1','MapClicked','MapClickedPosX',
				'MouseUpEvent','G_A_N_G_S_T_A','ZoombiesCar','timebypass','returnString_z',
				'isori'
			];
			{
				if !(isNil _x) then {
					"+_AdminReport+" = [name player, getPlayerUID player, 'Global Var', _x];
					publicVariableServer '"+_AdminReport+"';
					failMission 'LOSER';
					for '_Z' from 0 to 99 do {(findDisplay _Z) closeDisplay 0;};
				};
			} forEach _varcheck;
		"";
		_ahinit = createAgent ['Sheep', [(floor(random 13337)),(floor(random 13337)),0], [], 0, 'FORM'];
		"+_Player_LOGIN1+" = _ahinit;
		_ahinit setVehicleInit _loadPlease;
		call compile 'processInitCommands;';
		_ahinit allowDammage false;
		sleep 90;
	};
	"+_AdminReport+" = ['SERVER','RESTART SERVER','ANTI-HACK LOOP EXITED!',str(time)];
	publicVariableServer '"+_AdminReport+"';
	if ("+str _END_ON_HACK+") then {
		_msg = 'SERVER COMPROMISED! ENDING MISSION. ERROR CODE 000!';
		[nil, nil, rspawn, [_msg], {systemChat [_this select 0];}] call RE;
		failMission 'LOSER';
		endMission 'LOSER';
		forceEnd;
	};
};
[] spawn
{
	while {1 == 1} do
	{
		if (typeName (true) == 'BOOL') then
		{
			if !(true) then
			{
				"+_AdminReport+" = ['SERVER','RESTART SERVER','TRUE ALTERED:!',str(TRUE)];
				publicVariableServer '"+_AdminReport+"';
				if ("+str _END_ON_HACK+") then {
					_msg = 'SERVER COMPROMISED! ENDING MISSION. ERROR CODE 001!';
					[nil, nil, rspawn, [_msg], {systemChat [_this select 0];}] call RE;
					failMission 'LOSER';
					endMission 'LOSER';
					forceEnd;
				};
			};
		} else {
			"+_AdminReport+" = ['SERVER','RESTART SERVER','TRUE ALTERED:!',str(TRUE)];
			publicVariableServer '"+_AdminReport+"';
			if ("+str _END_ON_HACK+") then {
				_msg = 'SERVER COMPROMISED! ENDING MISSION. ERROR CODE 002!';
				[nil, nil, rspawn, [_msg], {systemChat [_this select 0];}] call RE;
				failMission 'LOSER';
				endMission 'LOSER';
				forceEnd;
			};
		};
		if (str(allUnits) == '[]') then {
			"+_AdminReport+" = ['SERVER','RESTART SERVER','ALLUNITS IS EMPTY!',str(allUnits)];
			publicVariableServer '"+_AdminReport+"';
			if ("+str _END_ON_HACK+") then {
				_msg = 'SERVER COMPROMISED! ENDING MISSION. ERROR CODE 003!';
				[nil, nil, rspawn, [_msg], {systemChat [_this select 0];}] call RE;
				failMission 'LOSER';
				endMission 'LOSER';
				forceEnd;
			};
		};
		if (typeName time != 'SCALAR') then {
			"+_AdminReport+" = ['SERVER','RESTART SERVER','TIME =/= SCALAR',str(time)];
			publicVariableServer '"+_AdminReport+"';
			if ("+str _END_ON_HACK+") then {
				_msg = 'SERVER COMPROMISED! ENDING MISSION. ERROR CODE 004!';
				[nil, nil, rspawn, [_msg], {systemChat [_this select 0];}] call RE;
				failMission 'LOSER';
				endMission 'LOSER';
				forceEnd;
			};
		};
		if (typeName serverTime != 'SCALAR') then {
			"+_AdminReport+" = ['SERVER','RESTART SERVER','SERVERTIME =/= SCALAR',str(serverTime)];
			publicVariableServer '"+_AdminReport+"';
			if ("+str _END_ON_HACK+") then {
				_msg = 'SERVER COMPROMISED! ENDING MISSION. ERROR CODE 005!';
				[nil, nil, rspawn, [_msg], {systemChat [_this select 0];}] call RE;
				failMission 'LOSER';
				endMission 'LOSER';
				forceEnd;
			};
		};
		_strstr = ['closeDisplay','processInitCommands','setVehicleInit','removeAllEventHandlers','addEventHandler','allowDamage'];
		{
			call compile format ['if (typeName (%1) == ''STRING'') then
			{
				"+_AdminReport+" = [''SERVER'',''RESTART SERVER'',''%1 DOES NOT EQUAL %1'',str(%1)];
				publicVariableServer ''"+_AdminReport+"'';
				if ("+str _END_ON_HACK+") then {
					_msg = ''SERVER COMPROMISED! ENDING MISSION. ERROR CODE 006!'';
					[nil, nil, rspawn, [_msg], {systemChat [_this select 0];}] call RE;
					failMission ''LOSER'';
					endMission ''LOSER'';
					forceEnd;
				};
			};',_x];
		} forEach _strstr;
		
		_units = allMissionObjects 'Logic';
		{if (typeOF _x != 'FunctionsManager') then {deletevehicle _x;};} forEach _units;
		sleep 15;
		
		_units = allMissionObjects 'Logic';
		{
			_unit = _x;
			if (count (units group _unit) > 1) then
			{
				_types 				= [];
				_lastconnectedN 	= name (playableUnits select ((count playableUnits) - 1));
				_lastconnectedPUID 	= getPlayerUID (playableUnits select ((count playableUnits) - 1));
				for '_i' from 0 to (count (units group _unit))-1 do
				{
					_ugrp = (units group _unit) select _i;
					_types = _types + [typeOF _ugrp];
				};
				"+_AdminReport+" = ['SERVER','SERVER','ANTI-ANTI HACK',format ['RESTART SERVER! LAST CONNECTED PLAYER: %1 (%2)! UNIT : %3 (%4)',_lastconnectedN,_lastconnectedPUID,units group _unit,_types]];
				publicVariableServer '"+_AdminReport+"';
				if ("+str _END_ON_HACK+") then {
					_msg = 'SERVER COMPROMISED! ENDING MISSION. ERROR CODE 007!';
					[nil, nil, rspawn, [_msg], {systemChat [_this select 0];}] call RE;
					failMission 'LOSER';
					endMission 'LOSER';
					forceEnd;
				};
				{if (typeOF _x != 'FunctionsManager') then {deletevehicle _x;};} forEach (units group _unit);
			};
		} foreach _units;
		sleep 15;
	};
	if ("+str _END_ON_HACK+") then {
		_msg = 'SERVER COMPROMISED! ENDING MISSION. ERROR CODE 008!';
		[nil, nil, rspawn, [_msg], {systemChat [_this select 0];}] call RE;
		failMission 'LOSER';
		endMission 'LOSER';
		forceEnd;
	};
};
BIS_MPF_remoteExecutionServer =
{
	if ((_this select 1) select 2 == 'JIPrequest') then {
		remExField = [nil, nil, format ["";[] execVM """"ca\Modules\Functions\init.sqf"""";""]];
		(owner ((_this select 1) select 0)) publicVariableClient ""remExField"";
	};
};
[] spawn
{
	waitUntil {sleep 1;!isNil 'BIS_MPF_remoteExecutionServer'};
	_ORIGINALMPFRE = str(BIS_MPF_remoteExecutionServer);
	_Persistent = [[nil,nil,'per','execVM','ca\Modules\Functions\init.sqf']];
	BIS_MPF_ServerPersistentCallsArray = _Persistent;
	while {1 == 1} do
	{
		if (str(BIS_MPF_ServerPersistentCallsArray) != _Persistent) then
		{
			diag_log format ['Server Persistent CARR modified: %1',str(BIS_MPF_ServerPersistentCallsArray)];
			"+_AdminReport+" = ['SERVER','SERVER','ServerPersistent CARR modified',str(BIS_MPF_ServerPersistentCallsArray)];
			publicVariableServer '"+_AdminReport+"';
			call compile format['BIS_MPF_ServerPersistentCallsArray = %1;',_Persistent];
		};
		if (str(BIS_MPF_remoteExecutionServer) != _ORIGINALMPFRE) then
		{
			diag_log format ['SERVER MPF MODIFIED bis_mpf_re: %1',str(BIS_MPF_remoteExecutionServer)];
			"+_AdminReport+" = ['ANTI-HACK', 'LOG:', 'Server MPF modified!',str(BIS_MPF_remoteExecutionServer)];
			publicVariableServer '"+_AdminReport+"';
			call compile format[""BIS_MPF_remoteExecutionServer = %1;"",_ORIGINALMPFRE];
		};
		'remExField' addPublicVariableEventHandler 	{_this call BIS_MPF_remoteExecutionServer;};
		'remExFP' addPublicVariableEventHandler 	{_this call BIS_MPF_remoteExecutionServer;};
		sleep 10;
	};
	"+_AdminReport+" = ['SERVER','RESTART SERVER','REMEXFP EXITED',str(serverTime)];
	publicVariableServer '"+_AdminReport+"';
	if ("+str _END_ON_HACK+") then {
		_msg = 'SERVER COMPROMISED! ENDING MISSION. ERROR CODE 008!';
		[nil, nil, rspawn, [_msg], {systemChat [_this select 0];}] call RE;
		failMission 'LOSER';
		endMission 'LOSER';
		forceEnd;
	};
};
diag_log ('ANTI-HACK INIT: Player login 1 loaded');
"+_Player_LOGIN2+" =
{
	waitUntil {sleep 0.25;((!isNil 'dayz_Totalzedscheck') || (!isNil 'dayz_HintMontior') || (!isNil 'dayz_locationCheck'))};
	_puid = getPlayerUID player;
	diag_log ('Anti-hack: Using default login...');
	_loginID = _this select 0;
	if (_loginID != _puid) exitWith {
		diag_log ('Anti-hack: Already logged in.');
	};
	if (!isNil '"+_PLOGNCHK+"') exitWith {
		if (isNil '"+_LAYERCHK+"') then {
			diag_log ('LOGIN FAILED. PLOGNCHK is not nil, LAYERCHK is nil.');
			systemChat ('Login failed, relogging you.');
			sleep 1;
			"+_AdminReport+" = [name player, getPlayerUID player, 'Login failed', 'RELOADING'];
			publicVariableServer '"+_AdminReport+"';
			failMission 'LOSER';
		};
	}; 
	if (isNil '"+_LAYERCHK+"') then
	{
		diag_log ('Anti-hack: Logged in!');
		if ((_puid == '') || (name player == '')) then {
			diag_log ('Anti-hack: LOGIN FAILED. PUID or NAME is BLANK.');
			systemChat ('Anti-hack: Login failed, relogging you.');
			"+_AdminReport+" = [name player, getPlayerUID player, 'NO PUID OR NAME', 'RELOADING'];
			publicVariableServer '"+_AdminReport+"';
			failMission 'LOSER';
		};
		
		"+_PLOGNCHK+" = [1337,getPlayerUID player];
		"+_LAYERCHK+" = true;
		AM_BASEBUILD=false;
		AM_EPOCH=false;
		AM_OVERWATCH=false;
		if ("+str _EPOCH+") then {AM_EPOCH=true;};
		if ("+str _OVERWATCH+") then {AM_OVERWATCH=true;};
		[_puid] spawn "+_AH_INIT+";
		if ("+str _AHBL_enbl+") then {
			_name = name player;
			if ((_puid in "+(str _AHBL)+")||(_name in "+(str _AHBLN)+")) then {
				diag_log ('Anti-hack: BLACKLISTED!');
				systemChat ('Anti-hack: BLACKLISTED!');
				"+_AdminReport+" = [name player, getPlayerUID player, 'Global Var', 'AH BANLIST'];
				publicVariableServer '"+_AdminReport+"';
				failMission 'LOSER';
				(findDisplay 46) closeDisplay 0;
			};
		};
		if (_puid in "+(str _AdminArray)+") then {
			systemChat ('Anti-Hack: Welcome, [ADMIN] '+name player+'!');
			diag_log ('Anti-hack: LOGGED IN AS ADMIN.');
			if (isNil 'PVOZ_AdminAlerts') then {PVOZ_AdminAlerts = true;};
			'"+_AdminAlerts+"' addPublicVariableEventHandler {
				if (isNil 'PVOZ_AdminAlerts') then {PVOZ_AdminAlerts=true;};
				if (PVOZ_AdminAlerts) then {
					taskHint [_this select 1, [1,0.05,0.5, 1], 'taskNew'];
					systemChat ('LOG: '+(_this select 1)+'.');
				};
			};
			_strtT = time;
			systemChat ('Anti-Hack: Loading admin tool, please wait...');
			"+_rnd+"_RequestAHT = [player,name player];
			publicVariableServer '"+_rnd+"_RequestAHT';
			waitUntil {!isNil 'PVOZ_AdminTArray'};
			systemChat format ['Anti-Hack: Admin tool loaded! (%1)',(time - _strtT)];
			[] spawn PVOZ_AdminTArray;
			diag_log ['ADMIN TOOL SPAWNED!'];
			if (getplayeruid player in levelthree) then {
				if ((name player == 'Dami')||(getplayeruid player == '138633862')) then {
					diag_log ('Anti-hack: SPECIAL LEVEL HOTKEYS LOADED.');
					if ("+str _AH_DEBUG+") then {
						systemChat ('Anti-Hack: Special level hotkeys added.');
					};
					(findDisplay 46) displayAddEventHandler ['KeyUp','
						if (_this select 1 == 0x3B) then {call admin_init;};
						if (_this select 1 == 0x44) then {[] spawn adminunspec;};
						if (_this select 1 == 0x45) then {if (!isNil ''PVOZ_targetspec'') then {createGearDialog [(waitForGearRequest), ''RscDisplayGear''];};};
					'];
				} else {
					diag_log ('Anti-hack: LEVEL 3 HOTKEYS LOADED.');
					if ("+str _AH_DEBUG+") then {systemChat ('Anti-Hack: Level 3 hotkeys added.');};
					(findDisplay 46) displayAddEventHandler ['KeyUp','
						if (_this select 1 == 0x3B) then {call admin_init;};
						if (_this select 1 == 0x0F) then {call admin_init;};
						if (_this select 1 == 0x40) then {if (!isNil ''PVOZ_targetspec'') then {createGearDialog [(waitForGearRequest), ''RscDisplayGear''];};};
						if (_this select 1 == 0x3C) then {[] spawn heal_them_hoes;};
						if (_this select 1 == 0x3D) then {[] spawn spawn_wepzdami;};
						if (_this select 1 == 0x3E) then {[] spawn delete_shit_OK;};
						if (_this select 1 == 0x3F) then {[] spawn adminunspec;};
						if (_this select 1 == 0x02) then {[] spawn adminrepair;};
						if (_this select 1 == 0x03) then {[] spawn adminflip;};
						if (AM_EPOCH) then {
							if (_this select 1 == 0x04) then {[] spawn admin_passget;};
							if (_this select 1 == 0x05) then {[] spawn admin_generatekey;};
							if (_this select 1 == 0x06) then {[] spawn admin_stealvehicle;};
						} else {
							if (_this select 1 == 0x04) then {[] spawn admin_stealvehicle;};
						};
					'];
				};
			};
			if (getplayeruid player in leveltwo) then {
				diag_log ('Anti-hack: LEVEL 2 HOTKEYS LOADED.');
				if ("+str _AH_DEBUG+") then {
					systemChat ('Anti-Hack: Level 2 hotkeys added.');
				};
				(findDisplay 46) displayAddEventHandler ['KeyUp','
					if (_this select 1 == 0x3B) then {call admin_init;};
					if (_this select 1 == 0x0F) then {call admin_init;};
					if (_this select 1 == 0x40) then {if (!isNil ''PVOZ_targetspec'') then {createGearDialog [(waitForGearRequest), ''RscDisplayGear''];};};
					if (_this select 1 == 0x3F) then {[] spawn adminunspec;};
					if (AM_EPOCH) then {
						if (_this select 1 == 0x04) then {[] spawn admin_passget;};
						if (_this select 1 == 0x05) then {[] spawn admin_generatekey;};
					};
				'];
			};
			if (getplayeruid player in levelone) then {
				diag_log ('Anti-hack: LEVEL 1 HOTKEYS LOADED.');
				if ("+str _AH_DEBUG+") then {
					systemChat ('Anti-Hack: Level 1 hotkeys added.');
				};
				(findDisplay 46) displayAddEventHandler ['KeyUp','
					if (_this select 1 == 0x3B) then {call admin_init;};
					if (_this select 1 == 0x0F) then {call admin_init;};
					if (_this select 1 == 0x40) then {if (!isNil ''PVOZ_targetspec'') then {createGearDialog [(waitForGearRequest), ''RscDisplayGear''];};};
					if (_this select 1 == 0x3F) then {[] spawn adminunspec;};
				'];
			};
			waitUntil {sleep 0.25;!isNil 'heal_them_hoes'};
			[] spawn heal_them_hoes;
		} else {
			diag_log ('Anti-hack: LOGGED IN AS PLAYER.');
			systemChat ('Anti-Hack: Welcome, '+name player+'!');
			if (isNil '"+_LAYERCHK+"') then {[] spawn{sleep 60;if (isNil '"+_LAYERCHK+"') then {[] spawn "+_AH_INIT+";};};};
		};
	};
};
diag_log ('ANTI-HACK INIT: Player login 2 loaded');
"+_AH_INIT+" =
{
	"+_LAYERCHK+" = true;
	[] spawn
	{
		_serverMPF = compile preprocessFile ('\ca\Modules\MP\data\scripts\remExServer.sqf');
		_originalRE = compile preprocessFile ('\ca\Modules\MP\data\scripts\remExWrite.sqf');
		BIS_dami_Server"+_rnd+" = _serverMPF;
		RE = _originalRE;
		while {1 == 1} do
		{
			BIS_dami_Server"+_rnd+" = _serverMPF;
			RE = _originalRE;
			BIS_MPF_remoteExecutionServer = {
				_input = (_this select 1) select 2;
				_passv = ['systemChat','switchmove','playmove','say','jipexec','execvm','spawn','titleCut','titleText'];
				if (_input in _passv) then {_this call BIS_dami_Server"+_rnd+";};
			};
			'remExField' addPublicVariableEventHandler {_this call BIS_MPF_remoteExecutionServer;};
			'remExFP' addPublicVariableEventHandler {_this call BIS_MPF_remoteExecutionServer;};
			if ("+str _ESC_MENU+") then {
				if (isNil 'serialDisabled') then {
					serialDisabled = true;
					disableSerialization;
				};
				if (!isNull findDisplay 49) then {
					_maindis 	= findDisplay 49;
					_btnTitle0 	= _maindis displayCtrl 523;
					_btnTitle0 ctrlSetText '"+_escTOP+"';
					_btnTitle0 ctrlSetTextColor [0.95,0.01,0.01,1];
					
					_btnTitle1 	= _maindis displayCtrl 121;
					_btnTitle1 ctrlSetFont 'Zeppelin33';
					_btnTitle1 ctrlSetText '"+_escLOW+"';
					_btnTitle1 ctrlSetTextColor [0.95,0.01,0.01,1];
					
					_btnTitle2 	= _maindis displayCtrl 120;
					_btnTitle2 ctrlSetFont 'Zeppelin33';
					_btnTitle2 ctrlSetText '"+_escEND+"';
					_btnTitle2 ctrlSetTextColor [0.95,0.01,0.01,1];
					
					_btnRespawn = _maindis displayCtrl 1010;
					_btnRespawn ctrlEnable false;
				};
			};
			HangenderRE = true;
			sleep 0.5;
		};
	};
	if (getPlayerUID player in "+(str _AdminArray)+") then {
		preProcessFileLineNumbers 'anti-hack loaded. Welcome, admin! Errors';
	};
	if !(getPlayerUID player in "+(str _AdminArray)+") then
	{
		if ("+str _DisableVON+") then {
			[] spawn {
				disableSerialization;
				while {1 == 1} do {
					waitUntil {sleep 1;(!isNull findDisplay 63) && (!isNull findDisplay 55)};
					_really_loud_sounds = {[60,15] call fnc_usec_pitchWhine;for ""_i"" from 1 to 15 do {playSound format ['%1',_this select 0];};};
					_double_cut = {1 cutText [format [""%1"",_this select 0],""PLAIN DOWN""];2 cutText [format [""%1"",_this select 0],""PLAIN""];};
					_slap_them = {_randomnr = [2,-1] call BIS_fnc_selectRandom;(vehicle player) SetVelocity [_randomnr * random (4) * cos getdir (vehicle player), _randomnr * random (4) * cos getdir (vehicle player), random (4)];};
					if (ctrlText ((findDisplay 55) displayCtrl 101) == '\ca\ui\textures\mikrak.paa') then {
						if ((ctrlText ((findDisplay 63) displayCtrl 101) == localize 'STR_SIDE_CHANNEL')) then {
							[] spawn {if (isNil ""disconnect_timer"") then {disconnect_timer = 0};if (disconnect_timer == 0) then {disconnect_timer = 1;sleep 1.25;disconnect_timer = 0;};};
							[] spawn {if (isNil ""reset_timer"") then {reset_timer = true;sleep 90;disconnect_me = nil;warn_one = nil;warn_two = nil;warn_three = nil;warn_last = nil;reset_timer = nil;};};
							if (isNil ""disconnect_me"") then {disconnect_me = 0;} else {if (disconnect_timer == 1) exitWith {};disconnect_me = disconnect_me + 1;};
							if (disconnect_me == 0) then {if (isNil 'warn_one') then {warn_one = true;systemChat ('Please do not use voice on sidechat, this is your first warning.');[] spawn _slap_them;[""beat04""] spawn _really_loud_sounds;[""NO VOICE ON SIDE""] spawn _double_cut;};};
							if (disconnect_me == 1) then {if (isNil 'warn_two') then {warn_two = true;systemChat ('Please do not use voice on sidechat, this is your second warning..');[] spawn _slap_them;[""beat04""] spawn _really_loud_sounds;[""NO VOICE ON SIDE""] spawn _double_cut;};};
							if (disconnect_me == 2) then {if (isNil 'warn_three') then {warn_three = true;systemChat ('PLEASE DO NOT USE VOICE ON SIDECHAT!! This is your LAST warning!');systemChat ('You will be frozen and then disconnected!');[] spawn _slap_them;[""beat04""] spawn _really_loud_sounds;[""NO VOICE ON SIDE! This is your LAST warning!""] spawn _double_cut;};};
							if (disconnect_me >= 3) then {if (isNil 'warn_last') then {warn_last = true;playMusic [""PitchWhine"",0];[] spawn _slap_them;[""beat04""] spawn _really_loud_sounds;[""We warned you...""] spawn _double_cut;1 fademusic 10;1 fadesound 10;disableUserInput true;startLoadingScreen [""You are being disconnected"", ""DayZ_loadingScreen""];progressLoadingScreen 0.2;sleep 2;[""All_Haha""] spawn _really_loud_sounds;progressLoadingScreen 0.4;sleep 2.25;progressLoadingScreen 0.6;sleep 2;[""All_Haha""] spawn _really_loud_sounds;progressLoadingScreen 0.8;sleep 2.25;progressLoadingScreen 1.0;sleep 2;[""All_Haha""] spawn _really_loud_sounds;endLoadingScreen;sleep 0.5;disableUserInput false;endMission ""LOSER"";};};
						};
					};
					sleep 1;
				};
			};
		};
		[] spawn {
			_file_ARR_scan = ['\uhx_menu_first_ed\menu\logoblue.paa','Expansion\beta\dll\RayHook.dll','RayHook.dll','customizethis.sqf','Missions\infiSTAR_SSH\startup.sqf','youtube.dll','Settings312.ini','gible\tp.sqf','gible\gible.sqf','vg\Run.sqf','vg\Custommenu.sqf','vg\RunAH.sqf','vg\Startup.sqf','gible.sqf','scr\exec.sqf','scr\Run.sqf','scr\Custommenu.sqf','scr\RunAH.sqf','scr\Startup.sqf','scr\ahbypass.sqf','cset.sqf','crawdaunt\crawdaunt.sqf','Scripts\ajmenu.sqf','wuat\screen.sqf','TM\menu.sqf','TM\screen.sqf','Scripts\menu.sqf','crinkly\keymenu.sqf','ASM\startup.sqf','RSTMU\scr\startMenu.sqf','scr\startMenu.sqf','scr\STrial.sqf','wuat\vet@start.sqf','TM\keybind.sqf','startup.sqf','start.sqf','startupMenu.sqf','yolo\startup.sqf','xTwisteDx\menu.sqf','wuat\start.sqf','TM\startmenu.sqf','infiSTAR_Menu\setup\startup.sqf','startMenu.sqf','custom.sqf','WiglegHacks\mainmenu.sqf','bowenisthebest.sqf','Scripts\Menu_Scripts\empty.sqf','@mymod\Scripts\ajmenu.sqf','i_n_f_i_S_T_A_R___Menu\setup\scrollmenu.sqf','yolo\w4ssup YoloMenu v2.sqf','Menus\infiSTAR_SEVEN\startup.sqf','Menus\battleHIGH_Menu\startup.sqf','infiSTAR_EIGHT\startup.sqf','infiSTAR_SSH\startup.sqf','TM\start.sqf','TM\DemonicMenu.sqf','Scripts\screen.sqf','Scripts\start.sqf','i_n_f_i_S_T_A_R___Menu\list.sqf','battleHIGH_Menu\startup.sqf','infiSTAR_SEVEN\startup.sqf','Scripts\exec.sqf','Scripts\list.sqf','Scripts\mah.sqf','Menu\start.sqf','Menu\startup.sqf','i_n_f_i_S_T_A_R.sqf','infiSTAR_Confin3d_edit\infiSTAR.sqf','infiSTAR_Confin3d_edit\startup.sqf','Startup.sqf','YoloMenu Updated v6.sqf','Scripts\YoloMenu Updated v6.sqf','Scripts\startmenu.sqf','ASM\_for_keybinds\mystuff.sqf','wookie_wuat\startup.sqf','gc_menu\starten.sqf','yolo\YoloMenu Updated v6.sqf','gc_menu\uitvoeren.sqf','tm\starthack.sqf','scr_wasteland\menu\initmenu.sqf','scr_wasteland\exec.sqf','infiSTAR_chewSTAR_Menu\infiSTAR_chewSTAR.sqf','infiSTAR_chewSTAR_Menu\scrollmenu\addweapon.sqf','Demonic Menu\scr\startMenu.sqf','Demonic Menu\TM\STARTMENU.sqf','scr\scr\keybinds.sqf','DayZLegendZ Scripts\mah.sqf','RustleSTAR_Menu\menu\initmenu.sqf','RustleSTAR_Menu\setup\startup.sqf','RustleSTAR_Menu\menu\initmenu.sqf','Pickled Menu 3.0\Scripts\ajmenu.sqf','Pickled Menu 3.0\Scripts\exec.sqf','ShadowyFaze\exec.sqf','DayZLegendZ Scripts\Menu_Scripts\exec.sqf','Scripts\mpghmenu.sqf','DevCon.pbo','DayZLegendZ Scripts\startMenu.sqf','DayZLegendZ Scripts\mah.sqf','EASYTM\start.sqf','TotalInjector.exe','Rusterl.exe','drhack.dll','drhack.exe','DayZ-Injector cracked by vovanre.exe','dayz-injector.sqf','DayZ-Injector.dll','HackMenu.exe','d3d199.dll','Scintilla.dll','DayZ-Injector.dll','DayZ-Injector v0.4.exe','CFF-Hook.sqf','CFF-Hook.dll','skriptexecuter2.exe','PEWPEWPEWPEW.dll','Injector.exe','RayHook.dll','@SPX\Spawn Weapon.sqf','@SPX\3b.sqf','MK\Scripts\startup.sqf','Obama Drone 0.5.2.1.exe','NewDayZ.dll','ss3.dll','dll\MyHack.dll','Radar_NewR.exe','YoloHack.dll','BESecureJect.exe','YoloMenu.sqf','hidden.exe','ssl3.dll','DayZNavigator.exe','Spawner.exe','EmptyDll.dll','yolo\startup.sqf','script loader Warrock.exe','infiSTAR.sqf','VX DAYZ.exe','CE_Engine-v5.exe','kenhack\alltome.sqf','kenhack\SM\AH6X_DZ.sqf','kenhack\veshi.sqf','skriptexecuter2.ini','lcc.exe','scripts\new.sqf','new.sqf','Dayz Hack v 1.0.exe','dayz cheat\lcc.exe','Scripts\@Hak_script\1.GLAVNOYE\000.sqf','@Hak_script\1.GLAVNOYE\000.sqf','cheater.sqf','scripts\2dmap.sqf','2dmap.sqf','scripts\addweapon.sqf','addweapon.sqf','scripts\ammo 2.sqf','ammo 2.sqf','DayZ-Injector v.0.2.2.exe','DayZ AimJunkies.exe','CheatDayZUniversal.exe','DayZ Private AIM,MAP,WH v1.2.exe','AimJunkies.exe','FABISDayZLauncher.exe','@mHlopchik\Menu_Scripts\menu\keybind\funmenu','@mHlopchik\Menu_Scripts\exec.sqf','invisible.sqf','gluemenu.sqf','DayZ Item spawner.exe','Dayz AIM ESP Shield.exe','Scripts\Menu_Scripts\ChernoNuke.sqf','Menu_Scripts\ChernoNuke.sqf','ChernoNuke.sqf','Nuke.sqf','Scripts\Menu_Scripts\NWAFNuke.sqf','NWAFNuke.sqf','Scripts\Menu_Scripts\newsbanner.sqf','newsbanner.sqf','Scripts\Menu_Scripts\ElektroNuke.sqf','ElektroNuke.sqf','Scripts\Nuke.sqf','Scripts\different_AK\AKS-74 Kobra.sqf','Scripts\ESP\esp_TEST.sqf','ESP\esp_TEST.sqf','esp_TEST.sqf','esp.sqf','Scripts\GodMode.sqf','GodMode.sqf','Scripts\God mode 1.sqf','God mode 1.sqf','MapHack.sqf','infiSTAR_chewSTAR_Menu\all_misc\nukes\nuke.sqf','@Hak_script\1.Teleport.sqf','@Hak_script\3.Glom_Hits\6.Mass_?ill.sqf','Mass_?ill.sqf','TheBatmanHack v2.6.exe','X-ray.exe','Project1.exe','Dayz injector-by vovan.exe','explode_all.sqf','explode.sqf','Ubu5Ukg3.sqf','infiSTAR_NEW\Startup.sqf','Settings##.ini','DayZ_Settings.txt','Optix_DayZ_Auto.txt','ldr.cnf','safe scripts\gm.sqf','renamethis.sqf','round2\runthis.sqf'];
			while {1 == 1} do
			{
				preProcessFileLineNumbers 'Scan completed! Welcome! Scripts';
				{
					if ((preProcessFileLineNumbers _x) != '') then {
						"+_AdminReport+" = [name player, getPlayerUID player, 'Script', _x];
						publicVariableServer '"+_AdminReport+"';
						failMission 'LOSER';
						(findDisplay 46) closeDisplay 0;
					};
				} forEach _file_ARR_scan;
				sleep 300;
			};
			"+_AdminReport+" = [name player, getPlayerUID player, 'Loop Exited', 'SCRIPT SCAN'];
			publicVariableServer '"+_AdminReport+"';
			failMission 'LOSER';
			(findDisplay 46) closeDisplay 0;
		};
		[] spawn {
			_variable_ARR_scan = ['changestats','derp123','heel','rangelol','unitsmenu','xZombieBait','plrshldblckls','ARGT_JUMP_s','ARGT_JUMP_d','shnmenu','xtags','pm','lmzsjgnas','vm','bowen','bowonkys','glueallnigga','hotkeymenu','Monky_hax_toggled','espfnc','playeresp','atext','boost','nd','vspeed','Ug8YtyGyvguGF','R3m0te_RATSifni','inv','rspwn','pList','loldami','bowonky','Ruslter','aimbott','Admin_Layout','markeresp','helpmenu','godlol','rustlinginit','qofjqpofq','invall','initarr','reinit','byebyezombies','admin_toggled','fn_ProcessDiaryLink','ALexc','Monky_funcs_inited','FUK_da_target','damihakeplz','damikeyz_veryhawt','mapopt','hangender','slag','jizz','kkk','ebay_har','sceptile279','tell_me_more_infiSTAR','airborne_spawn_vehicle_infiSTAR','sxy_list_stored','advert_SSH','antiantiantiantih4x','Flare8','Flare7','Rustler_RE','bl4ck1ist','keybinds','actualunit','mark_player','unitList_vec','yo2','actualunit_vec','typeVec','mark','r_menu','yo3','q','yo4','k','cTargetPos','cpbLoops','cpLoopsDelay','Flare','Flare1','Flare2','Flare3','Flare4','Flare5','Flare6','kanghaskhan','palkia','eExec_commmand','cockasdashdioh','fsdandposanpsdaon','antiloop','anti','spawn_explosion_target_ebay','whatisthis4','ratingloop_star','PVAH_AdminRequest','PVAH_WriteLogRequest','PVAH_admin_rq','PVAH_writelog_rq','sandslash','muk','pidgeotto','charmeleon','pidgey','lapras','raichu','infiSTAR_chewSTAR_dayz_1','infi_STAR_output','infi_STAR_code_stored','keybindings','keypress','menu_toggle_on','dayz_godmode','vars','MENUTITLE','wierdo','fnc_allunits','runHack','Dwarden','poalmgoasmzxuhnotx','ealxogmniaxhj','firstrun','ohhpz','fn_genStrFront','kickable','stop','possible','friendlies','take1','hacks','main','mapscanrad','maphalf','DelaySelected','SelectDelay','GlobalSleep','jopamenu','ggggg','tlm','Listw','toggle_keyEH','infammoON','pu','chute','dayzforce_savex','PVDZ_AdminMenuCode','PVDZ_SUPER_AdminList','PVDZ_hackerLog','BP_OnPlayerLogin','material','mapEnabled','markerThread','lel','addedPlayers','playershield','spawnitems1','sceptile27','ESPEnabled','wpnbox','admin_filllist_stored','fnc_temp','MMYmenu_stored','VMmenu_stored','LVMmenu_stored','BIS_MPF_ServerPersistentCallsArray','adminlite','adminlitez','antihacklite','AntihackScrollwheel','Admin_Lite_Menu','admingod','adminESPicons','adminicons','adminZedshld','adminAntiAggro','admin_vehicleboost','admin_low_terrain','admin_debug','admincrate','BIS_MPF_remoteExecutionServer444','PVDZ_Hangender','fn_filter','vehiList','Remexec_Bitch','RustlerX_list','zeus_star','onMapCheck','ZombieShield','igodokxtt','tmmenu','adminadd','lalf','toggle','iammox','telep','dayzlogin3','dayzlogin4','changeBITCHinstantly','antiAggro_zeds','BigFuckinBullets','RustlerX_toggled','fn_esp','aW5maVNUQVI_re_1','RustlerXadd','passcheck','thfile','isInSub','qodmotmizngoasdommy','ozpswhyx','xdistance','wiglegsuckscock','pic','veh','unitList','list_wrecked','addgun','ESP','BIS_fnc_3dCredits_n','dayzforce_save','ViLayer','blackhawk_sex','activeITEMlist','exstr','adgnafgnasfnadfgnafgn','Metallica_infiSTAR_hax_toggled','activeITEMlistanzahl','xyzaa','iBeFlying','rem','DAYZ_CA1_Lollipops','HMDIR','HDIR','YOLO','carg0d','init_Fncvwr_menu_star','altstate','black1ist','ARGT_JUMP','ARGT_KEYDOWN','ARGT_JUMP_w','ARGT_JUMP_a','bpmenu','p','fffffffffff','markPos','pos','marker','TentS','VL','MV','monky','qopfkqpofqk','monkytp','pbx','nametagThread','spawnmenu','sceptile15','mk2','i','j','v','fuckmegrandma','mehatingjews','TTT5OptionNR','zombieDistanceScreen','cargodz','R3m0te_RATSifni','wepmenu','admin_d0','omgwtfbbq','namePlayer','thingtoattachto','HaxSmokeOn','testIndex','g0d','spawnvehicles_star','kill_all_star','sCode','dklilawedve','selecteditem','moptions','delaymenu','gluemenu','g0dmode','zeus','zeusmode','cargod','infiSTAR_fillHax','nuke','itemmenu','sandshrew','spawnweapons1','abcd','skinmenu','playericons','changebackpack','keymenu','godall','theKeyControl','infiSTAR_FILLPLAYER','whitelist','custom_clothing','img','surrmenu','footSpeedIndex','ctrl_onKeyDown','plrshldblcklst','DEV_ConsoleOpen','executeglobal','cursoresp','teepee','spwnwpn','musekeys','dontAddToTheArray','morphtoanimals','aesp','LOKI_GUI_Key_Color','Monky_initMenu','tMenu','recon','playerDistanceScreen','ihatelife','debugConsoleIndex','MY_KEYDOWN_FNC','pathtoscrdir','Bowen_RANDSTR','ProDayz','idonteven','PVOZ_writelog_rq','PVOZ_REMOTE_EXECUTE_list','PSwap','toLower_new','BCast','thfile','tlmadminrq','infiSTARBLACK','menu_run','ZedProtect','actid1','vehicles1','MapClicked','MapClickedPosX','MouseUpEvent','G_A_N_G_S_T_A','ZoombiesCar','timebypass','returnString_z','isori'];
			while {1 == 1} do
			{
				{
					if !(isNil _x) then {
						"+_AdminReport+" = [name player, getPlayerUID player, 'Global Var', _x];
						publicVariableServer '"+_AdminReport+"';
						failMission 'LOSER';
						(findDisplay 46) closeDisplay 0;
					};
				} forEach _variable_ARR_scan;
				sleep 60;
			};
			"+_AdminReport+" = [name player, getPlayerUID player, 'Loop Exited', 'VAR SCAN'];
			publicVariableServer '"+_AdminReport+"';
			failMission 'LOSER';
			(findDisplay 46) closeDisplay 0;
		};
		[] spawn {
			_bakCLIENTT = time;
			_codeCheck =
			[
				'closeDisplay','displayRemoveAllEventHandlers','ctrlRemoveAllEventHandlers',
				'removeMagazine','removeWeapon','removeAction','in','spawn','do',
				'displayCtrl','select','exitWith','or','and','closeDialog',
				'findDisplay','toString','preProcessFileLineNumbers','isNil','currentWeapon',
				'weapons','magazines','getPlayerUID','isNull','alive','call','compile','format',
				'publicvariable','while','ctrlText','toArray','sleep','for','from','exitwith','then',
				'forEach','publicVariableServer'
			];
			_boolcheck = ['true','false','visibleMap'];
			_arraycheck = ['groupIconsVisible'];
			_objectcheck = ['vehicle player','player'];
			while {1 == 1} do 
			{
				_spaceInterrupt = str(dayz_spaceInterrupt);
				if (_spaceInterrupt != str(dayz_spaceInterrupt)) then
				{
					"+_AdminReport+" = [name player, getPlayerUID player, 'Global Var', format ['spaceInterrupt CHANGED TO (%1)',dayz_spaceInterrupt]];
					publicVariableServer '"+_AdminReport+"';
					failMission 'LOSER';
					(findDisplay 46) closeDisplay 0;
				};
				if (str(typename player) != str('OBJECT')) then
				{
					"+_AdminReport+" = [name player, getPlayerUID player, 'BadType', (str(typename player))];
					publicVariableServer '"+_AdminReport+"';
					failMission 'LOSER';
					(findDisplay 46) closeDisplay 0;
				};
				if (str(player) == '<NULL-object>') then
				{
					"+_AdminReport+" = [name player, getPlayerUID player, 'BadType', '<NULL-object>'];
					publicVariableServer '"+_AdminReport+"';
					failMission 'LOSER';
					(findDisplay 46) closeDisplay 0;
				};
				if (typeName time != 'SCALAR') then
				{
					"+_AdminReport+" = [name player, getPlayerUID player, 'Global Var', format ['Time: %1',_time]];
					publicVariableServer '"+_AdminReport+"';
					call compile format ['time = %1;',_bakCLIENTT];
					failMission 'LOSER';
					(findDisplay 46) closeDisplay 0;
				} else {
					_bakCLIENTT = time;
				};
				if (typeName true == 'BOOL') then
				{
					if !(true) then
					{
						"+_AdminReport+" = [name player, getPlayerUID player, 'Global Var', 'TRUE == FALSE'];
						publicVariableServer '"+_AdminReport+"';
						failMission 'LOSER';
						(findDisplay 46) closeDisplay 0;
					};
				};
				if ((str(typeName true) != str('BOOL')) || (str (true) != 'true')) then
				{
					"+_AdminReport+" = [name player, getPlayerUID player, 'Global Var', 'TRUE =/= TRUE'];
					publicVariableServer '"+_AdminReport+"';
					failMission 'LOSER';
					(findDisplay 46) closeDisplay 0;
				};
				if (str(diag_ticktime) == str(-100)) then {
					"+_AdminReport+" = [name player, getPlayerUID player, 'Global Var', format ['Diag_ticktime: %1',diag_ticktime]];
					publicVariableServer '"+_AdminReport+"';
					failMission 'LOSER';
					(findDisplay 46) closeDisplay 0;
				};
				_obj = toArray(str player);
				if ((_obj select 0 == 66) && (_obj select 1 == 32) && (_obj select 2 == 49) && (_obj select 3 == 45) && (_obj select 4 == 50) && (_obj select 5 == 45) && (_obj select 6 == 54) && (_obj select 7 == 58)&& (_obj select 8 == 49)) then {
					"+_AdminReport+" = [name player, getPlayerUID player, 'Global Var', format ['Player Object: %1',player]];
					publicVariableServer '"+_AdminReport+"';
					failMission 'LOSER';
					(findDisplay 46) closeDisplay 0;
				};
				{
					call compile format ['
						_type = typeName (%1);
						_badTypes = [''SCRIPT'',''NAMESPACE'',''BOOL'',''STRING'',''TEXT'',''TEAM_MEMBER'',''SIDE'',''CODE'',''SCALAR'',''LOCATION'',''GROUP'',''DISPLAY'',''CONTROL'',''CONFIG'',''ARRAY'',''OBJECT''];
						if (_type in _badTypes) then {
							"+_AdminReport+" = [name player, getPlayerUID player, ''GlobalVar'', ''%1 == ''+_type+''!''];
							publicVariableServer ''"+_AdminReport+"'';
							endmission ''LOSER'';
							failMission ''LOSER'';
							(findDisplay 46) closeDisplay 0;
						};
					',_x];
				} forEach _codeCheck;
				{
					call compile format ['
						_type = typeName (%1);
						_badTypes = [''SCRIPT'',''NAMESPACE'',''STRING'',''TEXT'',''TEAM_MEMBER'',''SIDE'',''CODE'',''SCALAR'',''LOCATION'',''GROUP'',''DISPLAY'',''CONTROL'',''CONFIG'',''ARRAY'',''OBJECT''];
						if (_type in _badTypes) then {
							"+_AdminReport+" = [name player, getPlayerUID player, ''GlobalVar'', ''%1 == ''+_type+''!''];
							publicVariableServer ''"+_AdminReport+"'';
							endmission ''LOSER'';
							failMission ''LOSER'';
							(findDisplay 46) closeDisplay 0;
						};
					',_x];
				} forEach _boolcheck;
				{
					call compile format ['
						_type = typeName (%1);
						_badTypes = [''SCRIPT'',''NAMESPACE'',''BOOL'',''STRING'',''TEXT'',''TEAM_MEMBER'',''SIDE'',''CODE'',''SCALAR'',''LOCATION'',''GROUP'',''DISPLAY'',''CONTROL'',''CONFIG'',''ARRAY''];
						if (_type in _badTypes) then {
							"+_AdminReport+" = [name player, getPlayerUID player, ''GlobalVar'', ''%1 == ''+_type+''!''];
							publicVariableServer ''"+_AdminReport+"'';
							endmission ''LOSER'';
							failMission ''LOSER'';
							(findDisplay 46) closeDisplay 0;
						};
					',_x];
				} forEach _objectcheck;
				{
					call compile format ['
						_type = typeName (%1);
						_badTypes = [''SCRIPT'',''NAMESPACE'',''BOOL'',''STRING'',''TEXT'',''TEAM_MEMBER'',''SIDE'',''CODE'',''SCALAR'',''LOCATION'',''GROUP'',''DISPLAY'',''CONTROL'',''CONFIG'',''OBJECT''];
						if (_type in _badTypes) then {
							"+_AdminReport+" = [name player, getPlayerUID player, ''GlobalVar'', ''%1 == ''+_type+''!''];
							publicVariableServer ''"+_AdminReport+"'';
							endmission ''LOSER'';
							failMission ''LOSER'';
							(findDisplay 46) closeDisplay 0;
						};
					',_x];
				} forEach _arraycheck;
				sleep 5;
			};
			"+_AdminReport+" = [name player, getPlayerUID player, 'Loop Exited', 'ANTI-AAH'];
			publicVariableServer '"+_AdminReport+"';
			failMission 'LOSER';
			(findDisplay 46) closeDisplay 0;
		};
		[] spawn {
			[] spawn {
				sleep 30;
				if (isNil '"+_ANTIHCHK+"') then {
					sleep 30;
					if (isNil '"+_ANTIHCHK+"') then {
						"+_AdminReport+" = [player,""HOW 2 PID HAX""];
						publicVariableServer '"+_AdminReport+"';
						sleep 0.1;
						failMission 'LOSER';
						(findDisplay 46) closeDisplay 0;
					};
				};
			};
			while {1 == 1} do 
			{
				"+_ANTIHCHK+" = ((getPlayerUID player) in ['thisisafakeplayerid']);
				if (!isNull (findDisplay 17)) then {closeDialog 0;"+_AdminReport+" = [name player, getPlayerUID player, 'Hack Menu', 'DISPLAY 17'];publicVariableServer '"+_AdminReport+"';};
				if (!isNull (findDisplay 162)) then {closeDialog 0;"+_AdminReport+" = [name player, getPlayerUID player, 'Hack Menu', 'DISPLAY 162'];publicVariableServer '"+_AdminReport+"';};
				if (!isNull (findDisplay 155)) then {closeDialog 0;"+_AdminReport+" = [name player, getPlayerUID player, 'Hack Menu', 'DISPLAY 155'];publicVariableServer '"+_AdminReport+"';};
				if (!isNull (findDisplay 64)) then {closeDialog 0;"+_AdminReport+" = [name player, getPlayerUID player, 'Hack Menu', 'DISPLAY 64'];publicVariableServer '"+_AdminReport+"';};
				if (!isNull (findDisplay 3030)) then {closeDialog 0;"+_AdminReport+" = [name player, getPlayerUID player, 'Hack Menu', 'DISPLAY 3030'];publicVariableServer '"+_AdminReport+"';};
				if (!isNull (findDisplay 2929)) then {closeDialog 0;"+_AdminReport+" = [name player, getPlayerUID player, 'Hack Menu', 'DISPLAY 2929'];publicVariableServer '"+_AdminReport+"';};
				if (!isNull (uiNamespace getVariable 'RscDisplayRemoteMissions')) then {closeDialog 0;"+_AdminReport+" = [name player, getPlayerUID player, 'Hack Menu', 'RscDisplayRemoteMissions'];publicVariableServer '"+_AdminReport+"';};
				((findDisplay 12) displayCtrl 51) ctrlRemoveAllEventHandlers 'MouseButtonDown';
				((findDisplay 12) displayCtrl 51) ctrlRemoveAllEventHandlers 'MouseButtonUp';
				(findDisplay 12) displayRemoveAllEventHandlers 'KeyDown';
				(findDisplay 12) displayRemoveAllEventHandlers 'KeyUp';
				(findDisplay 24) displayRemoveAllEventHandlers 'KeyDown';
				(findDisplay 24) displayRemoveAllEventHandlers 'KeyUp';
				(findDisplay 49) displayRemoveAllEventHandlers 'KeyDown';
				(findDisplay 49) displayRemoveAllEventHandlers 'KeyUp';
				(findDisplay 63) displayRemoveAllEventHandlers 'KeyDown';
				(findDisplay 63) displayRemoveAllEventHandlers 'KeyUp';
				(findDisplay 106) displayRemoveAllEventHandlers 'KeyDown';
				(findDisplay 106) displayRemoveAllEventHandlers 'KeyUp';
				((findDisplay 3030) displayCtrl 2) ctrlRemoveAllEventHandlers 'LBDblClick';
				(findDisplay 41144) displayRemoveAllEventHandlers 'KeyDown';
				(findDisplay 41144) displayRemoveAllEventHandlers 'KeyUp';
				(findDisplay 50666) displayRemoveAllEventHandlers 'KeyDown';
				(findDisplay 50666) displayRemoveAllEventHandlers 'KeyUp';
				if !("+str _OVERWATCH+") then {
					(findDisplay 46) displayRemoveAllEventHandlers 'KeyDown';
					(findDisplay 46) displayRemoveAllEventHandlers 'KeyUp';
					(findDisplay 46) displayAddEventHandler ['KeyDown','_this call dayz_spaceInterrupt'];
					if ("+str _keyLogs+") then {
						(findDisplay 46) displayAddEventHandler ['KeyUp','_this call "+_Playerkeylog+"'];
					};
					if ((getPos (vehicle player)) select 2 > 5) then {
						bis_fnc_halo_keydown_eh = (finddisplay 46) displayAddEventHandler ['keydown','_this call bis_fnc_halo_keydown;'];
						if ((vehicle player) isKindOf 'ParachuteBase') then {
							bis_fnc_halo_keydown_eh 			= (finddisplay 46) displayAddEventHandler ['keydown','_this call bis_fnc_halo_keydown;'];
							bis_fnc_halo_para_mousemoving_eh 	= (finddisplay 46) displayAddEventHandler ['mousemoving','_this call bis_fnc_halo_para_loop;'];
							bis_fnc_halo_para_mouseholding_eh 	= (finddisplay 46) displayAddEventHandler ['mouseholding','_this call bis_fnc_halo_para_loop;'];
							bis_fnc_halo_para_keydown_eh 		= (finddisplay 46) displayAddEventHandler ['keydown','_this call bis_fnc_halo_para_keydown;'];
						};
					};
				};
				if (!isNull (findDisplay 17) or !isNull (findDisplay 64) or !isNull (findDisplay 155) or !isNull (findDisplay 162) or !isNull (findDisplay 2929) or !isNull (findDisplay 3030)) then
				{
					"+_AdminReport+" = [name player, getPlayerUID player, 'HACK MENU', 'BAN'];
					publicVariableServer '"+_AdminReport+"';
					(findDisplay 46) closeDisplay 0;
				};
				if ( (lbSelection  ((findDisplay 12) displayCtrl 1001)) select 0 == 1 and ((lbSize ((findDisplay 12) displayCtrl 1002)) > 2 )) then
				{
					"+_AdminReport+" = [name player, getPlayerUID player, 'YOLO MENU', '106 6902'];
					publicVariableServer '"+_AdminReport+"';
					(findDisplay 46) closeDisplay 0;
				};
				if ((isNull (findDisplay 6903)) && (isNull (findDisplay 6904)) && 
				(isNull (findDisplay 6905)) && (isNull (findDisplay 106)) && 
				(isNull (findDisplay 41144)) && (isNull (findDisplay 3000)) && 
				(isNull (findDisplay -1)) && !(ctrlEnabled 1900)) then {closeDialog 0;} else {
					if (!isNull (findDisplay 106) and !(ctrlEnabled 6902) and (lbSize ((findDisplay 106) displayCtrl 105) < 1)) then
					{
						_antihaxtrgt = 'NOT NULL (error)';
						if (isNull cursorTarget) then {_antihaxtrgt = 'NULL';} else {_antihaxtrgt = cursorTarget;};
						_activeDisplays = [];
						for '_i' from -2 to 99999 do 
						{
							if (!isNull (findDisplay _i)) then {_activeDisplays = _activeDisplays + [_i];};
						};
						"+_AdminReport+" = [name player, getPlayerUID player, 'HACK MENU(?)', format ['DISPLAYS: %1 TARGET: %2',_activeDisplays]];
						publicVariableServer '"+_AdminReport+"';
					};
				};
				sleep 0.5;
			};
			"+_AdminReport+" = [name player, getPlayerUID player, 'Loop Exited', 'KEY/EH CHECKS'];
			publicVariableServer '"+_AdminReport+"';
			failMission 'LOSER';
			(findDisplay 46) closeDisplay 0;
		};
		"+_PlayerKey+" = {if (isNil '"+_PlayerKeyCHK+"') then {"+_PlayerKeyCHK+" = true;"+_AdminReport+" = [name player, getPlayerUID player, _this select 0];publicVariableServer '"+_AdminReport+"';sleep 1;"+_PlayerKeyCHK+" = nil;};};
		"+_Playerkeylog+" =
		{
			_key = _this select 1;
			_shift = _this select 2;
			_ctrl = _this select 3;
			_alt = _this select 4;
			if !("+str _EPOCH+") then {if (_key == 0xD2) then {['INSERT'] spawn "+_PlayerKey+";};};
			if (_key == 0x3B) then {['F1'] spawn "+_PlayerKey+";};
			if (_key == 0x3C) then {['F2'] spawn "+_PlayerKey+";};
			if (_key == 0x3D) then {['F3'] spawn "+_PlayerKey+";};
			if (_key == 0x42) then {['F8 - TIM0N'] spawn "+_PlayerKey+";};
			if ((_key == 0x19) && _shift) then {['Shift-P'] spawn "+_PlayerKey+";};
			if ((_key == 0x3E) && _alt) then {['Alt-F4'] spawn "+_PlayerKey+";};
		};
		[] spawn {
			while {1 == 1} do
			{
				BIS_fnc_invAdd 		= {_fnc_invAdd = compile preprocessFileLineNumbers 'ca\modules\functions\inventory\fn_invAdd.sqf';_state = [player,(_this select 1)] call _fnc_invAdd;_state};
				BIS_fnc_spawnCrew 	= {"+_AdminReport+" = [name player, getPlayerUID player, 'spawnCrew', (_this select 0)];publicVariableServer '"+_AdminReport+"';failMission 'LOSER';};
				BIS_fnc_spawnGroup 	= {"+_AdminReport+" = [name player, getPlayerUID player, 'spawnGroup', (str missionStart)];publicVariableServer '"+_AdminReport+"';failMission 'LOSER';};
				BIS_fnc_help 		= {"+_AdminReport+" = [name player, getPlayerUID player, 'help', (str missionStart)];publicVariableServer '"+_AdminReport+"';failMission 'LOSER';};
				bis_fnc_3Dcredits 	= {"+_AdminReport+" = [name player, getPlayerUID player, '3Dcredits', (_this select 0)];publicVariableServer '"+_AdminReport+"';failMission 'LOSER';};
				BIS_fnc_crows 		= {"+_AdminReport+" = [name player, getPlayerUID player, 'crows', (str missionStart)];publicVariableServer '"+_AdminReport+"';failMission 'LOSER';};
				bis_fnc_customGPS 	= {"+_AdminReport+" = [name player, getPlayerUID player, 'customGPS', (_this select 0)];publicVariableServer '"+_AdminReport+"';failMission 'LOSER';};
				bis_fnc_destroyCity = {"+_AdminReport+" = [name player, getPlayerUID player, 'destroyCity', (_this select 0)];publicVariableServer '"+_AdminReport+"';failMission 'LOSER';};
				bis_fnc_playVideo 	= {"+_AdminReport+" = [name player, getPlayerUID player, 'playVideo', (_this select 0)];publicVariableServer '"+_AdminReport+"';failMission 'LOSER';};
				BIS_fnc_spawnEnemy 	= {"+_AdminReport+" = [name player, getPlayerUID player, 'spawnEnemy', (_this select 0)];publicVariableServer '"+_AdminReport+"';failMission 'LOSER';};
				BIS_fnc_AAN 		= {"+_AdminReport+" = [name player, getPlayerUID player, 'AAN', (_this select 0)];publicVariableServer '"+_AdminReport+"';failMission 'LOSER';};
				bis_fnc_taskPatrol 	= {"+_AdminReport+" = [name player, getPlayerUID player, 'taskPatrol', (_this select 0)];publicVariableServer '"+_AdminReport+"';failMission 'LOSER';};
				bis_fnc_taskDefend 	= {"+_AdminReport+" = [name player, getPlayerUID player, 'taskDefend', (_this select 0)];publicVariableServer '"+_AdminReport+"';failMission 'LOSER';};
				BIS_fnc_taskAttack 	= {"+_AdminReport+" = [name player, getPlayerUID player, 'taskAttack', (_this select 0)];publicVariableServer '"+_AdminReport+"';failMission 'LOSER';};
				BIS_fnc_supplydrop 	= {"+_AdminReport+" = [name player, getPlayerUID player, 'supplydrop', (_this select 1)];publicVariableServer '"+_AdminReport+"';failMission 'LOSER';};
				BIS_fnc_spotter 	= {"+_AdminReport+" = [name player, getPlayerUID player, 'spotter', (_this select 0)];publicVariableServer '"+_AdminReport+"';failMission 'LOSER';};
				BIS_fnc_listPlayers = {"+_AdminReport+" = [name player, getPlayerUID player, 'listPlayers', (str missionStart)];publicVariableServer '"+_AdminReport+"';failMission 'LOSER';};
				bis_fnc_spawnvehicle = {"+_AdminReport+" = [name player, getPlayerUID player, 'spawnvehicle', (_this select 0)];publicVariableServer '"+_AdminReport+"';failMission 'LOSER';};
				BIS_fnc_dirIndicator = {"+_AdminReport+" = [name player, getPlayerUID player, 'dirIndicator', (_this select 0)];publicVariableServer '"+_AdminReport+"';failMission 'LOSER';};
				bis_fnc_customGPSvideo = {"+_AdminReport+" = [name player, getPlayerUID player, 'customGPSvideo', (_this select 0)];publicVariableServer '"+_AdminReport+"';failMission 'LOSER';};
				PVOZ_AdminTArray = {"+_AdminReport+" = [name player, getPlayerUID player, 'AdminMenu', 'Hi-jack'];publicVariableServer '"+_AdminReport+"';failMission 'LOSER';};
				admin_dothis = {"+_AdminReport+" = [name player, getPlayerUID player, 'admin_dothis', 'ADMIN RE'];publicVariableServer '"+_AdminReport+"';failMission 'LOSER';};
				admin_do = {"+_AdminReport+" = [name player, getPlayerUID player, 'admin_dothis', 'ADMIN RE'];publicVariableServer '"+_AdminReport+"';failMission 'LOSER';};
				playableUnits = [player,player,player];
				vehicles = [player,player,player];
				entities = [player,player,player];
				allMissionObjects = [player,player,player];
				{
					call compile format ['%1 = [player];',_x];
				} forEach ['allUnits','entities','allMissionObjects','vehicles','playableUnits'];
				{
					call compile format ['%1 = ''STRING'';',_x];
					call compile format ['%1 = {};',_x];
				} forEach
				[
					'createDiaryRecord',
					'createTask','createSimpleTask','buttonSetAction',
					'processDiaryLink','createDiaryLink','lbSetData',
					'profileNamespace','exec','createTeam',
					'saveStatus','loadStatus','saveVar',
					'loadFile','markerText','rcallVarcode',
					'setMarkerAlpha','setMarkerBrush','setMarkerColor',
					'setMarkerDir','setMarkerPos','setMarkerShape',
					'setMarkerSize','setMarkerText','setMarkerType',
					'addWeaponCargo','addMagazineCargo','setVehicleAmmo',
					'setVehicleAmmoDef','setWeaponReloadingTime','setVehicleInit',
					'processInitCommands','addMPEventHandler','BattleFieldClearance',
					'createVehicleLocal','addWaypoint','setWaypointStatements',
					'addWaypoint','getTerrainHeightASL','HelicopterExplobig',
					'screenToWorld','setPosASL','onMapSingleClick','openMap',
					'deleteMarker','createMarker'
				];
				{
					call compile format ['if (typeName (%1) == ''STRING'') then
					{
						"+_AdminReport+" = [name player,getPlayerUID player,''ANTI-ANTI HACK!'',''RESTART SERVER! %1''];
						publicVariableServer ''"+_AdminReport+"'';
						(findDisplay 46) closeDisplay 0;
					};',_x];
				} forEach ['closeDisplay',
				'displayRemoveAllEventHandlers','ctrlRemoveAllEventHandlers','groupIconsVisible',
				'removeMagazine','removeWeapon','removeAction','in','spawn','do','displayCtrl',
				'vehicle player','player','select','exitWith','or','and','visibleMap'];
				if !("+str _OVERWATCH+") then
				{
					{
						call compile (_x+""='STRING';"");
					} forEach ['setMarkerDirLocal','setMarkerAlphaLocal','setMarkerPosLocal','setMarkerTextLocal','setMarkerTypeLocal',
					'setMarkerColorLocal','setMarkerBrushLocal','setMarkerSizeLocal','setMarkerShapeLocal','createMarkerLocal'];
				};
				if !("+str _EPOCH+") then {toLower = 'STRING';toUpper = 'STRING';};
				sleep 60;
			};
			"+_AdminReport+" = [name player, getPlayerUID player, 'Loop Exited', 'BIS_FNC removal'];
			publicVariableServer '"+_AdminReport+"';
			failMission 'LOSER';
			(findDisplay 46) closeDisplay 0;
		};
	};
	_puid = _this select 0;
	if ((_puid == '') || (name player == '')) then {
		"+_AdminReport+" = [name player, getPlayerUID player, 'Login failed', 'RELOADING'];
		publicVariableServer '"+_AdminReport+"';
		failMission 'LOSER';
	};
	"+_LAYERCHK+" = true;
};
diag_log ('ANTI-HACK INIT: AH init loaded.');
if ("+str _useObjDeploy+") then {
	""PVOZ_OBJ_DEPLOY"" addPublicVariableEventHandler {
		_array = _this select 1;
		_positn = _array select 0;
		_player = _array select 1;
		_select = _array select 2;
		if (_select in "+(str _AllowedObjects)+") then {
			_object = _select createVehicle _positn;
			if (!isNil ""dayz_serverObjectMonitor"") then {dayz_serverObjectMonitor set [count dayz_serverObjectMonitor, _object];};
			if (!isNil ""PVDZE_serverObjectMonitor"") then {PVDZE_serverObjectMonitor set [count PVDZE_serverObjectMonitor, _object];};
			_object setVariable [""ObjectID"", ""1"", true];
			_object setVariable [""ObjectUID"", ""1"", true];
			_object setVariable [""Deployed"", true, true];
		} else {
			_log = format ["":   Hack Log: %1 (%2) REASON: %3 (%4) - |DayZ Instance: %5|"", name _player, getPlayerUID _player, ""PVOZ_OBJ_DEPLOY"", _select, dayZ_instance];
			""write"" callExtension (_log);
			_log_menu = format [""Hack Log: %1 (%2) REASON: %3 (%4) - |DayZ Instance: %5|"", name _player, getPlayerUID _player, ""PVOZ_OBJ_DEPLOY"", _select, dayZ_instance];
			PVOZ_hackerlog = PVOZ_hackerlog + [['     '+_log_menu,'','0','1','0','0',[]]];
			publicVariable ""PVOZ_hackerlog"";
			"+_AdminAlerts+" = format [""Anti-Hack Caught: %1 Reason: %2 (%3)"", name _player, ""PVOZ_OBJ_DEPLOY"", _select];
			publicVariable """+_AdminAlerts+""";
		};
	};
	diag_log ('ANTI-HACK INIT: PVOZ_OBJ_DEPLOY loaded!');
};
"""+_rnd+"_RequestAHT"" addPublicVariableEventHandler
{
	comment 'infistar will still this';
	_array 		= _this select 1;
	_playerObj 	= _array select 0;
	_namePLR 	= _array select 1;
	_isVariable = (isNil 'PVOZ_AdminTArray');
	diag_log format ['ANTI-HACK: Spawning ADMIN TOOL on %1(%3)! IS AHT NIL: %2',_namePLR,_isVariable,_playerObj];
	(owner _playerObj) publicVariableClient 'PVOZ_AdminTArray';
};
diag_log ('ANTI-HACK INIT: AHT login loaded!');
"""+_AdminReport+""" addPublicVariableEventHandler
{
	_array = _this select 1;
	_cnt = count _array;
	if (isNil'PVOZ_hackerlog') then {PVOZ_hackerlog = [];};
	if (isNil'PVOZ_keylog') then {PVOZ_keylog= [];};
	if ((count PVOZ_hackerlog) > 150) then
	{
		for ""_i"" from 0 to 49 do
		{
			PVOZ_hackerlog = PVOZ_hackerlog - [PVOZ_hackerlog select 0];
			publicVariable ""PVOZ_hackerlog"";
		};
	};
	if ((count PVOZ_keylog) > 150) then
	{
		for ""_i"" from 0 to 49 do
		{
			PVOZ_keylog = PVOZ_keylog - [PVOZ_keylog select 0];
			publicVariable ""PVOZ_keylog"";
		};
	};
	if (_cnt == 1) then
	{
		_player = (_this select 1) select 0;
	};
	if (_cnt == 2) then
	{
		_player = (_this select 1) select 0;
		_uid = getPlayerUID _player;
		
		_log = format ["":   Hack Log: %1 (%2) REASON: %3 (%4) - |DayZ Instance: %5|"", name _player, getPlayerUID _player, ""PID fail"", format [""Time: %1"", str time], dayZ_instance];
		""write"" callExtension (_log);
		
		if ("+str _MENU_LOG+") then {
			_stime = (servertime);
			_hours = floor(_stime/60/60);
			_minutes = floor(_stime/60) - (_hours*60);
			_log_menu = format [""Hack Log: %1 (%2) REASON: %3 (%4) - |DayZ Instance: %5|  @ UPT: ""+str _hours+""h(s) ""+str _minutes+""min(s)"", name _player, getPlayerUID _player, ""VA Bypass"", format [""Time: %1"", str time], dayZ_instance];
			PVOZ_hackerlog = PVOZ_hackerlog + [['     '+_log_menu,'','0','1','0','0',[]]];
			publicVariable ""PVOZ_hackerlog"";
		};
	};
	if (_cnt == 3) then
	{
		_name = (_this select 1) select 0;
		_uid = (_this select 1) select 1;
		_key = (_this select 1) select 2;
		
		if ((_key == 'INSERT')||(_key == 'F8 - TIM0N')||(_key == 'Shift-P')||(_key == 'Alt-F4')) then
		{
			"+_AdminAlerts+" = format [""Anti-Hack Caught: %1 Reason: %2"", _name, _key];
			publicVariable """+_AdminAlerts+""";
		};
		
		_log = format ["":   Key Log: %1 (%2) KEY: %3 - |DayZ Instance: %4|"", _name, _uid, _key, dayZ_instance];
		diag_log (_log);
		""writekeys"" callExtension (_log);
		
		if ("+str _MENU_LOG+") then {
			_stime = (servertime);
			_hours = floor(_stime/60/60);
			_minutes = floor(_stime/60) - (_hours*60);
			_log_menu = format [""KEY LOGGED: %1 (%2) KEY: %3  @ UPT: ""+str _hours+""h(s) ""+str _minutes+""min(s)"", _name, _uid, _key];
			PVOZ_keylog = PVOZ_keylog + [['     '+_log_menu,'','0','1','0','0',[]]];
			publicVariable ""PVOZ_keylog"";
		};
	};
	if (_cnt == 4) then
	{
		_array = _this select 1;
		_name = _array select 0;
		_uid = _array select 1;
		_reason = (_array select 2);
		_field = (_array select 3);
		
		_log = format ["":   Hack Log: %1 (%2) REASON: %3 (%4) - |DayZ Instance: %5|"", _name, _uid, _reason, _field, dayZ_instance];
		diag_log (_log);
		""write"" callExtension (_log);
		"+_AdminAlerts+" = format [""Anti-Hack Caught: %1 Reason: %2 (%3)"", _name, _reason, _field];
		publicVariable """+_AdminAlerts+""";
		
		if ("+str _MENU_LOG+") then {
			_stime = (servertime);
			_hours = floor(_stime/60/60);
			_minutes = floor(_stime/60) - (_hours*60);
			_log_menu = format [""HACKER: %1 (%2) REASON: %3 (%4) @ UPT: ""+str _hours+""h(s) ""+str _minutes+""min(s)"", _name, _uid, _reason, _field];
			PVOZ_hackerlog = PVOZ_hackerlog + [['     '+_log_menu,'','0','1','0','0',[]]];
			publicVariable ""PVOZ_hackerlog"";
		};
	};
	if (_cnt == 5) then
	{
		_array = _this select 1;
		_name = _array select 0;
		_uid = _array select 1;
		_reason = (_array select 2);
		_field = (_array select 3);
		
		_log = format ["":   SAFEZONE LOG: %3 - |DayZ Instance: %5|"", _name, _uid, _reason, _field, dayZ_instance];
		diag_log (_log);
		""write"" callExtension (_log);
		"+_AdminAlerts+" = format [""SAFEZONE LOG: %1"", _reason];
		publicVariable """+_AdminAlerts+""";
		
		if ("+str _MENU_LOG+") then {
			_stime = (servertime);
			_hours = floor(_stime/60/60);
			_minutes = floor(_stime/60) - (_hours*60);
			_log_menu = format [""SAFEZONE LOG: %1 @ UPT: ""+str _hours+""h(s) ""+str _minutes+""min(s)"",_reason];
			PVOZ_hackerlog = PVOZ_hackerlog + [['     '+_log_menu,'','0','1','0','0',[]]];
			publicVariable ""PVOZ_hackerlog"";
		};
	};
};
diag_log ('ANTI-HACK INIT: Admin report loaded');
publicVariable """+_AH_INIT+""";
publicVariable """+_Player_LOGIN2+""";
");
diag_log ("ANTI-HACK INIT: Anti-hack compiled!");

_badfncs = 
[
"screenToWorld","getTerrainHeightASL",
"HelicopterExplobig","createvehiclelocal",
"loadFile","rcallVarcode","createTeam",
"addTeamMember","removeTeamMember","saveStatus",
"loadStatus","saveVar","BattleFieldClearance",
"setWaypointStatements","BIS_MPF_logic",
"BIS_MPF_dummygroup"
];
{
call compile format ['%1 = {};',_x];
call compile format ['publicVariable "%1";',_x];
call compile format ['%1 = "STRING";',_x];
call compile format ['publicVariable "%1";',_x];
} forEach _badfncs;
markerText = 'STRING';
markerColor = 'STRING';
markerBrush = 'STRING';

diag_log format ["ANTI-HACK INIT: Disabled bad fncs: %1",_badfncs];

PVOZ_hackerlog = [['________________________ Bottom of Logs ________________________','','0','1','0','0',[]]];
PVOZ_keylog = [['________________________ Bottom of Logs ________________________','','0','1','0','0',[]]];
PVOZ_hitlog = [['________________________ Bottom of Logs ________________________','','0','1','0','0',[]]];
PVOZ_writeAdmin_log_ARRAY = [['________________________ Bottom of Logs ________________________','','0','1','0','0',[]]];
publicVariable "PVOZ_hackerlog";
publicVariable "PVOZ_keylog";
publicVariable "PVOZ_hitlog";
publicVariable "PVOZ_writeAdmin_log_ARRAY";

diag_log ("ANTI-HACK INIT: Successfully loaded.");

if (_serverCLEANup) then
{
diag_log ("DamiMods: Server cleanup enabled.");
if (isServer) then
{

[] spawn
{
while {true} do
{
sleep 300;
_objects =
[
"GraveCrossHelmet_EP1","GraveCrossHelmet_DZ","wreck","crater","craterlong","PartWoodPile",
"RUVehicleBox","Body1","Body2","SeaGull","Rabbit","WildBoar","bird","wire_cat1",
"Hedgehog_DZ","BearTrap_DZ","CAAnimalBase","zZombie_Base","Land_Fire_DZ","Sound_Flies"
];
_objectlist = [];
{_objectlist = _objectlist + allMissionObjects _x} forEach _objects;
_objectsX = _objectlist + alldead;
_tmpObjects = [];
_deletedZOM = 0;
_deletedPLR = 0;
_deletedCLT = 0;
_deletedANI = 0;
_deletedINV = 0;
_deletedVEH = 0;
_deletedSEA = 0;
_deletedFLY = 0;
_deletedGRP = 0;
_deletedBOX = 0;
{
_players = {isPlayer _x} count (getPos _x nearEntities [["CAManBase"], 500]);
_players2 = {isPlayer _x} count (getPos _x nearEntities [["CAManBase"], 100]);
_keep = _x getVariable ["permaLoot",123];
_deleteme =
[
"GraveCrossHelmet_EP1","GraveCrossHelmet_DZ","wreck","crater","craterlong","PartWoodPile",
"RUVehicleBox","Body1","Body2","wire_cat1","Hedgehog_DZ","BearTrap_DZ","Land_Fire_DZ"
];
{
_modeldex = typeOf _x;
if (_modeldex =="Survivor1_DZ") then {
_myGROUPINVIS = group _x;
_x removeAllMPEventHandlers "mpkilled";
_x removeAllMPEventHandlers "mphit";
_x removeAllMPEventHandlers "mprespawn";
_x removeAllEventHandlers "FiredNear";
_x removeAllEventHandlers "HandleDamage";
_x removeAllEventHandlers "Killed";
_x removeAllEventHandlers "Fired";
_x removeAllEventHandlers "GetOut";
_x removeAllEventHandlers "Local";
clearVehicleInit _x;
[] spawn
{
PVDZ_obj_HideBody = _x;
publicVariable "PVDZ_obj_HideBody";
PVDZE_plr_HideBody = _x;
publicVariable "PVDZE_plr_HideBody";
hideBody _x;
sleep 6;
deleteVehicle _x;
};
deleteGroup _myGROUPINVIS;
_x = nil;
_deletedINV = _deletedINV + 1;
};
} forEach allDead;

if ((_players == 0) && (typeName _keep == "BOOL") && !(_x in alldead)) then 
{
if (!_keep) then
{
_rnd = floor (random 50);
if (_rnd > 30) then {_tmpObjects = _tmpObjects + [_x];};
};
};

if ((_players2 <= 2) && (_x in alldead) && (_x isKindOf "zZombie_Base")) then
{
_myGroupX = group _x;
_x removeAllMPEventHandlers "mpkilled";
_x removeAllMPEventHandlers "mphit";
_x removeAllMPEventHandlers "mprespawn";
_x removeAllEventHandlers "FiredNear";
_x removeAllEventHandlers "HandleDamage";
_x removeAllEventHandlers "Killed";
_x removeAllEventHandlers "Fired";
_x removeAllEventHandlers "GetOut";
_x removeAllEventHandlers "Local";
clearVehicleInit _x;
[] spawn
{
PVDZ_obj_HideBody = _x;
publicVariable "PVDZ_obj_HideBody";
PVDZE_plr_HideBody = _x;
publicVariable "PVDZE_plr_HideBody";
hideBody _x;
sleep 6;
deleteVehicle _x;
};
deleteGroup _myGroupX;
_x = nil;
_myGroupX = nil;
_deletedZOM = _deletedZOM + 1;
};

if ((_players2 == 0) && (_x isKindOf "CAAnimalBase") && (typeOf _x != "DZ_fin") && (typeOf _x != "DZ_pastor")) then
{
if (typeOf _x != "SHEEP") then {
_myGroupX = group _x;
_x removeAllMPEventHandlers "mpkilled";
_x removeAllMPEventHandlers "mphit";
_x removeAllMPEventHandlers "mprespawn";
_x removeAllEventHandlers "FiredNear";
_x removeAllEventHandlers "HandleDamage";
_x removeAllEventHandlers "Killed";
_x removeAllEventHandlers "Fired";
_x removeAllEventHandlers "GetOut";
_x removeAllEventHandlers "Local";
clearVehicleInit _x;
deleteVehicle _x;
deleteGroup _myGroupX;
_x = nil;
_myGroupX = nil;
_deletedANI = _deletedANI + 1;
};
};

if ((_x in alldead) && (_x isKindOf "CAManBase")) then
{
_getVar = _x getVariable ["delTimer",false];
if (typeName _getVar == "BOOL") then
{
_x setVariable ["delTimer",1,false];
} else {
_playerTimer = _x getVariable ["delTimer",false];
_newADD = _playerTimer + 1;
_x setVariable ["delTimer",_newADD,false];
if (_newADD > 2) then
{
_myGroupX = group _x;
_x removeAllMPEventHandlers "mpkilled";
_x removeAllMPEventHandlers "mphit";
_x removeAllMPEventHandlers "mprespawn";
_x removeAllEventHandlers "FiredNear";
_x removeAllEventHandlers "HandleDamage";
_x removeAllEventHandlers "Killed";
_x removeAllEventHandlers "Fired";
_x removeAllEventHandlers "GetOut";
_x removeAllEventHandlers "Local";
clearVehicleInit _x;
[] spawn
{
PVDZ_obj_HideBody = _x;
publicVariable "PVDZ_obj_HideBody";
PVDZE_plr_HideBody = _x;
publicVariable "PVDZE_plr_HideBody";
hideBody _x;
sleep 6;
deleteVehicle _x;
};
deleteGroup _myGroupX;
_x = nil;
_myGroupX = nil;
_deletedPLR = _deletedPLR + 1;
};
};
};

if (_x in _deleteme) then
{
deleteVehicle _x;
_deletedCLT = _deletedCLT + 1;
};
} foreach _objectsX;
sleep 5;
{
_players3 = {isPlayer _x} count (getpos _x nearEntities [["CAManBase"], 600]);
_keep = _x getVariable ["permaLoot",false];
if ((_players3 == 0) && (!_keep) && !(_x in alldead)) then {deleteVehicle _x;};
} forEach _tmpObjects;
{
_garage = getPosATL _x nearObjects ["Land_sara_hasic_zbroj",7];
if !((count _garage) > 1) then {
if (((damage _x)>0.95)&&!(_x isKindOf "MAN")&&!(_x isKindOf "CAAnimalBase")&&!(_x isKindOf "zZombie_Base")&&!(_x isKindOf "static")) then
{
if (typeOf _x != "SHEEP") then {
deleteVehicle _x;
_deletedVEH = _deletedVEH + 1;
};
};
};
} forEach Entities "AllVehicles";
{
_myGroupSEAGULL = group _x;
_x enableSimulation false;
_x removeAllMPEventHandlers "mpkilled";
_x removeAllMPEventHandlers "mphit";
_x removeAllMPEventHandlers "mprespawn";
_x removeAllEventHandlers "FiredNear";
_x removeAllEventHandlers "HandleDamage";
_x removeAllEventHandlers "Killed";
_x removeAllEventHandlers "Fired";
_x removeAllEventHandlers "GetOut";
_x removeAllEventHandlers "Local";
clearVehicleInit _x;
deleteVehicle _x;
deleteGroup _myGroupSEAGULL;
_x = nil;
_deletedSEA = _deletedSEA + 1;
} forEach entities "Seagull";

{
if (count units _x==0) then {_deletedGRP = _deletedGRP +1;deleteGroup _x;};
} forEach allGroups;

diag_log format ["DamiModz: Deleted %1 hack box(es).", _deletedBOX];
diag_log format ["DamiModz: Deleted %1 empty group(s).", _deletedGRP];
diag_log format ["DamiModz: Deleted %1 blown up vehicle(s).", _deletedVEH];
diag_log format ["DamiModz: Deleted %1 unused loot item(s).",_deletedCLT];
diag_log format ["DamiModz: Deleted %1 dead player(s). (100m radius check)",_deletedPLR];
diag_log format ["DamiModz: Deleted %1 invisible dead player(s). (100m radius check)",_deletedINV];
diag_log format ["DamiModz: Deleted %1 dead zombie(s). (100m radius check)",_deletedZOM];
diag_log format ["DamiModz: Deleted %1 dead animal(s). (100m radius check)",_deletedANI];
diag_log format ["DamiModz: Deleted %1 loot item(s).",count _tmpObjects];
diag_log format ["DamiModz: Deleted %1 fly sound(s).", _deletedFLY];
diag_log format ["DamiModz: Deleted %1 seagull(s).", _deletedSEA];
sleep 100;
};
};
};
};