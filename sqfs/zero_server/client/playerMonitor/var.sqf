#line 1 "z\addons\zero_server\client\playerMonitor\var.sqf"

private["_playerUID","_zeroNull"];

_playerUID = getPlayerUID player;

_zeroNull = ["pic","ESP","mapmarkers","Called","veh","index","take1","god","firstrun","bowen","veh_autoMenu",
"tracker","wuat_fpsMonitor","unitList","list_wrecked","f6546544sssh","unitList_wrecked","totalunits_wrecked",
"CM","p","yo3",	"actualunit_wrecked","mark_wrecked","BIS_fnc_3dCredits_n","fffffffffff","markPos","unit",
"pos","marker","list_tents","gay","unitList_tents","totalunits_tents","TentS","qp","dayz_temperatur",
"yo4","actualunit_tents","mark_tents","ggggggggggggggggggg","VL","MV","mk2","i","j","telegps",
"TKC__MedicDevString_command","TKC_MedicDevString","Armor1","planeGroup","pilot","m1aark1Pods3",
"Ug8YtyGyvguGF","fuckmegrandma","mehatingjews","unfreeze","scode","TTT5OptionNR","thfile",
"hijExecString","igodokxtt","omgwtfbbq","v","marker_mapesp","list_vec","unitList_player",
"totalunits","o","yo","actualunit","namePlayer","mark_player","unitList_vec","yo2","markeresp",
"actualunit_vec","typeVec","mark","p","yo3","q","yo4","k","cTargetPos","cpbLoops","playeresp",
"cpLoopsDelay","HaxSmokeOn","Flare","Flare1","Flare2","Flare3","Flare4","Flare5","Flare6",
"Flare7","Flare8","eExec_commmand","cockasdashdioh","fsdandposanpsdaon","antiloop",
"anti","ARGT_JUMP","ARGT_KEYDOWN","ARGT_JUMP_w","ARGT_JUMP_a","ARGT_JUMP_s","ARGT_JUMP_d",
"mrmedic_fpsMonitor","SprM_mapesp","TTT5NamePl","TTT5Exec","TTT5derCode","hacks","vehcra",
"dsadsaidbosa","cxzonsasd","items1","items2","medical","playershield","skinmenu","abcd","zombieshield","markers",
"weaponsidearms","weaponmachineguns","weaponassaultrifles","weaponassaultrifles2","weaponsniperrifles","weaponshotguns",
"playericons","dbmon","keyp","infammoON","xZombieBait","wl","dontAddToTheArray","theKeyControl","dayz_godmode",
"spectate","musekeys","shz","sha","shd","sht","spi","mgpsm","sci","tpe","tpa","uvb","mapm","hotkeymenu","vars",
"changebackpack","sList","dList","pList","morphtoanimals","morphtoplayers","Monky_funcs_inited",
"morphtozombies","bp","delaymenu","ExceptionsPlayers","playerDistanceScreen","friends","spawnitems1",
"spawnitems2","spawnitems3","spawnitems4","spawnitems5","spawnitems6","spawnitems7","spawnitems8",
"spawnitems9","footSpeedKeys","spawnweapons1","spawnweapons2","spawnweapons3","spawnweapons4",
"spawnweapons8","spawnweapons9","spawnweapons10","bInvisibleOn","zombieShieldIndex","zombieProofIndex",
"spawnweapons14","espIndex","footSpeedIndex","testIndex","gmIndex","key_menu","img",
"SelectUnits","unitsmenu","distancemenu","heightmenu","Stats","changestats","addzombiekillsmenu",
"addzombieheadshotsmenu","addhumankillsmenu","addbanditkillsmenu","addhumanitymenu","surrmenu","dtimemenu",
"termenu","overcastmenu","fogmenu","distmenu","suicide","zombieDistanceScreen","zombiekills",
"selecteditem","F2","ALT","mautoaddmap","mautoaddgps","ptxt","zmc","amc","pmc","pdmc","vmc","wmc",
"tmc","moptions","mapopt","vlist","cList","tents","keyctrl","drawic","aList","keymenu","keymenu2",
"keymenu3","keymenu4","keymenu5","keymenu6","keymenu7","keymenu8","keymenu9","keymenu10","HDIR","HMDIR",
"option","imgnum","num","exstr","helpmenu","nlist","ssdfsdhsdfh","sdgsnhs","shnmenu",
"shnext","ViLayer","startanzahlITEMs","startITEMlist","countlocalspawnedshitxyz","activeITEMlistanzahl",
"telet","teletoplr","byebyezombies","givebox","pathtoscrdir"];

{
if !(isNil _x) then
{
zeroReportOne = [player,_playerUID,_x];
publicVariableServer "zeroReportOne";
};
} forEach _zeroNull;

if ((typeName player != "OBJECT") or (typeName true != "BOOL")) then
{
zeroReportOne = [player,_playerUID,"OBJECT or BOOL illegal!"];
publicVariableServer "zeroReportOne";
};

if ((unitRecoilCoefficient player) != 1) then
{
zeroReportOne = [player,_playerUID,"unitRecoilCoefficient != 1"];
publicVariableServer "zeroReportOne";
};

if ((currentVisionMode player) == 2) then
{
zeroReportOne = [player,_playerUID,"currentVisionMode = THERMAL!"];
publicVariableServer "zeroReportOne";
};

if (viewDistance != 1600) then
{
zeroReportOne = [player,_playerUID,"viewDistance != 1600"];
publicVariableServer "zeroReportOne";
};
