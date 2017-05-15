private ["_playerUid", "_playerName", "_adminList", "_cheatScripts", "_cheatVariables"];

_playerUid = getPlayerUID player;
_playerName = name player;

_adminList = ["4175042"];

_cheatScripts =
[
	"scr\exec.sqf","Scripts\ajmenu.sqf","wuat\screen.sqf","TM\menu.sqf","TM\screen.sqf","Scripts\menu.sqf","crinkly\keymenu.sqf","ASM\startup.sqf",
	"RSTMU\scr\startMenu.sqf","scr\startMenu.sqf","scr\STrial.sqf","wuat\vet@start.sqf","TM\keybind.sqf","startup.sqf","start.sqf","startupMenu.sqf","yolo\startup.sqf",
	"xTwisteDx\menu.sqf","wuat\start.sqf","TM\startmenu.sqf","infiSTAR_Menu\setup\startup.sqf","startMenu.sqf","custom.sqf","WiglegHacks\mainmenu.sqf",
	"TM\98. Enable hotkeys --------------------------------------------------.sqf","TM\98. Enable hotkeys --------------------------------------------------.sqf",
	"97. Secret hakez -----------------------------------------------------.sqf","0------------------------------------------------------------------------------.sqf",
	"bowenisthebest.sqf","Scripts\Menu_Scripts\empty.sqf","Missions\Scripts\ajmenu.sqf","@mymod\Scripts\ajmenu.sqf","i_n_f_i_S_T_A_R___Menu\setup\scrollmenu.sqf",
	"yolo\w4ssup YoloMenu v2.sqf","Menus\infiSTAR_SEVEN\startup.sqf","Menus\battleHIGH_Menu\startup.sqf","battleHIGH_Menu\startup.sqf","infiSTAR_SEVEN\startup.sqf",
	"infiSTAR_EIGHT\startup.sqf","infiSTAR_SSH\startup.sqf","TM\start.sqf","TM\DemonicMenu.sqf","Scripts\screen.sqf","Scripts\start.sqf","Scripts\startmenu.sqf",
	"Rustler v4\startup.sqf","Rustler v5\startup.sqf","Rustler v4\exec.sqf","Rustler v5\exec.sqf","Missions\battleHIGH_Menu\startup.sqf",
	"Scripts\exec.sqf","Scripts\list.sqf","Scripts\mah.sqf","Menu\start.sqf","Menu\startup.sqf","i_n_f_i_S_T_A_R.sqf","i_n_f_i_S_T_A_R___Menu\list.sqf",
	"infiSTAR_Confin3d_edit\infiSTAR.sqf","infiSTAR_Confin3d_edit\startup.sqf","RustlerV5\startup.sqf",
	"Rustlerv5\exec.sqf.sqf","Rustlerv4\startup.sqf","Rustlerv4\exec.sqf","YoloMenu Updated v6.sqf","Scripts\YoloMenu Updated v6.sqf","yolo\YoloMenu Updated v6.sqf",
	"Common\scr\exec.sqf","Common\Scripts\ajmenu.sqf","Common\wuat\screen.sqf","Common\TM\menu.sqf","Common\TM\screen.sqf","Common\Scripts\menu.sqf","Common\crinkly\keymenu.sqf","Common\ASM\startup.sqf",
	"Common\RSTMU\scr\startMenu.sqf","Common\scr\startMenu.sqf","Common\scr\STrial.sqf","Common\wuat\vet@start.sqf","Common\TM\keybind.sqf","Common\startup.sqf","Common\start.sqf","Common\startupMenu.sqf","Common\yolo\startup.sqf",
	"Common\xTwisteDx\menu.sqf","Common\wuat\start.sqf","Common\TM\startmenu.sqf","Common\infiSTAR_Menu\setup\startup.sqf","Common\startMenu.sqf","Common\custom.sqf","Common\WiglegHacks\mainmenu.sqf",
	"Common\TM\98. Enable hotkeys --------------------------------------------------.sqf","Common\TM\98. Enable hotkeys --------------------------------------------------.sqf",
	"Common\97. Secret hakez -----------------------------------------------------.sqf","Common\0------------------------------------------------------------------------------.sqf",
	"Common\bowenisthebest.sqf","Common\Scripts\Menu_Scripts\empty.sqf","Common\@mymod\Scripts\ajmenu.sqf","Common\i_n_f_i_S_T_A_R___Menu\setup\scrollmenu.sqf",
	"Common\yolo\w4ssup YoloMenu v2.sqf","Common\Menus\infiSTAR_SEVEN\startup.sqf","Common\Menus\battleHIGH_Menu\startup.sqf","Common\battleHIGH_Menu\startup.sqf","Common\infiSTAR_SEVEN\startup.sqf",
	"Common\infiSTAR_EIGHT\startup.sqf","Common\infiSTAR_SSH\startup.sqf","Common\TM\start.sqf","Common\TM\DemonicMenu.sqf","Common\Scripts\screen.sqf","Common\Scripts\start.sqf","Common\Scripts\startmenu.sqf",
	"Common\Rustler v4\startup.sqf","Common\Rustler v5\startup.sqf","Common\Rustler v4\exec.sqf","Common\Rustler v5\exec.sqf",
	"Common\Scripts\exec.sqf","Common\Scripts\list.sqf","Common\Scripts\mah.sqf","Common\Menu\start.sqf","Common\Menu\startup.sqf","Common\i_n_f_i_S_T_A_R.sqf","Common\i_n_f_i_S_T_A_R___Menu\list.sqf",
	"Common\infiSTAR_Confin3d_edit\infiSTAR.sqf","Common\infiSTAR_Confin3d_edit\startup.sqf","Common\RustlerV5\startup.sqf",
	"Common\Rustlerv5\exec.sqf.sqf","Common\Rustlerv4\startup.sqf","Common\Rustlerv4\exec.sqf","Common\YoloMenu Updated v6.sqf","Common\Scripts\YoloMenu Updated v6.sqf","Common\yolo\YoloMenu Updated v6.sqf",
	"Missions\scr\exec.sqf","Missions\wuat\screen.sqf","Missions\TM\menu.sqf","Missions\TM\screen.sqf","Missions\Scripts\menu.sqf","Missions\crinkly\keymenu.sqf","Missions\ASM\startup.sqf",
	"Missions\RSTMU\scr\startMenu.sqf","Missions\scr\startMenu.sqf","Missions\scr\STrial.sqf","Missions\wuat\vet@start.sqf","Missions\TM\keybind.sqf","Missions\startup.sqf",
	"Missions\start.sqf","Missions\startupMenu.sqf","Missions\yolo\startup.sqf",
	"Missions\xTwisteDx\menu.sqf","Missions\wuat\start.sqf","Missions\TM\startmenu.sqf","Missions\infiSTAR_Menu\setup\startup.sqf","Missions\startMenu.sqf","Missions\custom.sqf","Missions\WiglegHacks\mainmenu.sqf",
	"Missions\TM\98. Enable hotkeys --------------------------------------------------.sqf","Missions\TM\98. Enable hotkeys --------------------------------------------------.sqf",
	"Missions\97. Secret hakez -----------------------------------------------------.sqf","Missions\0------------------------------------------------------------------------------.sqf",
	"Missions\bowenisthebest.sqf","Missions\Scripts\Menu_Scripts\empty.sqf","Missions\@mymod\Scripts\ajmenu.sqf","Missions\i_n_f_i_S_T_A_R___Menu\setup\scrollmenu.sqf",
	"Missions\yolo\w4ssup YoloMenu v2.sqf","Missions\Menus\infiSTAR_SEVEN\startup.sqf","Missions\Menus\battleHIGH_Menu\startup.sqf","Missions\infiSTAR_SEVEN\startup.sqf",
	"Missions\infiSTAR_EIGHT\startup.sqf","Missions\infiSTAR_SSH\startup.sqf","Missions\TM\start.sqf","Missions\TM\DemonicMenu.sqf","Missions\Scripts\screen.sqf","Missions\Scripts\start.sqf","Missions\Scripts\startmenu.sqf",
	"Missions\Rustler v4\startup.sqf","Missions\Rustler v5\startup.sqf","Missions\Rustler v4\exec.sqf","Missions\Rustler v5\exec.sqf",
	"Missions\Scripts\exec.sqf","Missions\Scripts\list.sqf","Missions\Scripts\mah.sqf","Missions\Menu\start.sqf","Missions\Menu\startup.sqf","Missions\i_n_f_i_S_T_A_R.sqf","Missions\i_n_f_i_S_T_A_R___Menu\list.sqf",
	"Missions\infiSTAR_Confin3d_edit\infiSTAR.sqf","Missions\infiSTAR_Confin3d_edit\startup.sqf","Missions\RustlerV5\startup.sqf",
	"Missions\Rustlerv5\exec.sqf.sqf","Missions\Rustlerv4\startup.sqf","Missions\Rustlerv4\exec.sqf","Missions\YoloMenu Updated v6.sqf","Missions\Scripts\YoloMenu Updated v6.sqf","Missions\yolo\YoloMenu Updated v6.sqf",
	"ASM\_for_keybinds\mystuff.sqf","wookie_wuat\startup.sqf","gc_menu\starten.sqf",
	"gc_menu\uitvoeren.sqf","tm\starthack.sqf","scr_wasteland\menu\initmenu.sqf","scr_wasteland\exec.sqf",
	"infiSTAR_chewSTAR_Menu\infiSTAR_chewSTAR.sqf","infiSTAR_chewSTAR_Menu\scrollmenu\addweapon.sqf",
	"Demonic Menu\scr\startMenu.sqf","Demonic Menu\TM\STARTMENU.sqf","scr\scr\keybinds.sqf",
	"RustleSTAR_Menu\menu\initmenu.sqf","RustleSTAR_Menu\setup\startup.sqf","RustleSTAR_Menu\menu\initmenu.sqf",
	"Pickled Menu 3.0\Scripts\ajmenu.sqf","Pickled Menu 3.0\Scripts\exec.sqf","ShadowyFaze\exec.sqf","DayZLegendZ Scripts\Menu_Scripts\exec.sqf","DayZLegendZ Scripts\mah.sqf",
	"Scripts\mpghmenu.sqf","DevCon.pbo","DayZLegendZ Scripts\startMenu.sqf","DayZLegendZ Scripts\mah.sqf","EASYTM\start.sqf","Rustler v6\startup.sqf"
];

_cheatVariables =
[
	"monkyProRE","pic","veh","wuat_fpsMonitor","unitList","list_wrecked","addgun","ESP","BIS_fnc_3dCredits_n",
	"ViLayer","maphalf","activeITEMlist","activeITEMlistanzahl","xyzaa","iBeFlying","rem","DAYZ_CA1_Lollipops","HMDIR",
	"HDIR","YOLO","carg0d","p","fffffffffff","markPos","pos","marker","TentS","VL","MV","monky","qopfkqpofqk","monkytp",
	"pbx","mk2","j","fuckmegrandma","mehatingjews","scode","TTT5OptionNR","zombieDistanceScreen","cargodz",
	"igodokxtt","omgwtfbbq","namePlayer","thingtoattachto","HaxSmokeOn","v","testIndex","g0d",
	"antiloop","ARGT_JUMP","selecteditem","moptions","delaymenu","gluemenu","g0dmode","zeus","zeusmode","cargod",
	"spawnweapons1","abcd","skinmenu","playericons","changebackpack","keymenu","godall","theKeyControl",
	"custom_clothing","img","surrmenu","footSpeedIndex","ctrl_onKeyDown","plrshldblcklst","DEV_ConsoleOpen",
	"teepee","spwnwpn","xtags","musekeys","dontAddToTheArray","morphtoanimals","aesp","LOKI_GUI_Key_Color",
	"playerDistanceScreen","monkytp","ihatelife","debugConsoleIndex","MY_KEYDOWN_FNC","pathtoscrdir",
	"TAG_onKeyDown","changestats","derp123","heel","rangelol","unitsmenu","xZombieBait","plrshldblckls",
	"shnmenu","xtags","pm","lmzsjgnas","vm","bowen","bowonkys","glueallnigga","hotkeymenu","Monky_hax_toggled",
	"atext","boost","nd","vspeed","Ug8YtyGyvguGF","inv","rspwn","pList","loldami","bowonky","dwarden","aimbott",
	"helpmenu","godlol","rustlinginit","qofjqpofq","invall","initarr","reinit","byebyezombies","dayz_godmode",
	"Monky_funcs_inited","FUK_da_target","damihakeplz","damikeyz_veryhawt","mapopt","hangender","slag","maphalf",
	"tell_me_more_infiSTAR","airborne_spawn_vehicle_infiSTAR","sxy_list_stored","scrl_list_stored","mainmenu_stored","specificmenu_stored",
	"ammenu_stored","MDmenu_stored","Fmenu_stored","CASHmenu_stored","SMmenu_stored","MMYmenu_stored","VMmenu_stored","LVMmenu_stored",
	"SVMmenu_stored","OBJmenu_stored","WEPmenu_stored","advert_SSH","antiantiantiantih4x","Ruslter",	
	"Rustler_RE","bl4ck1ist","keybinds"
];

//_fn_getRandomString =
//{
//	private ["_arr","_gen","_i"];
//	
//	_arr = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","0","1","2","3","4","5","6","7","8","9"];
//	_gen = "DAC_";
//	
//	for "_i" from 0 to 3 do
//	{
//		_gen = _gen + (_arr select (floor random (count _arr)));
//	};
//	
//	_gen
//};

_fn_handleCheater =
{
	private "_reason";
	
	_reason = _this;
	
	clientSendDacMessage = [_playerName, _playerUid, _reason];
	publicVariableServer "clientSendDacMessage";
	
	[] spawn
	{
		private "_i";
		for "_i" from 0 to 9999 do
		{
			findDisplay _i closeDisplay 0;
		};
	};
	
	[] spawn
	{
		forceEnd;
	};
	
	[] spawn
	{
		endMission "END1";
	};
};

_fn_findGroupIcons =
{
	private "_groupIconStatus";
	
	_groupIconStatus = groupIconsVisible;
	
	if ((_groupIconStatus select 0) || (_groupIconStatus select 1)) exitWith
	{
		(format ["GROUPICONS %1", _groupIconStatus]) call _fn_handleCheater;
	};
};

_fn_findCheatScripts =
{	
	preprocessFileLineNumbers "[IGNORE THIS MESSAGE]";
	
	{
		if (preprocessFileLineNumbers _x != "") exitWith
		{					
			(format ["CHEATSCRIPT %1", _x]) call _fn_handleCheater;
		};
	}forEach _cheatScripts;
};

_fn_findCheatCrates =
{
	private "_objectList";
	
	_objectList = position player nearObjects 15;
	
	{
		if (!(_x isKindOf "TentStorage") && !(_x isKindOf "AllVehicles") && !(_x isKindOf "Man")) then
		{
			if ((((count((getWeaponCargo _x) select 1)) + (count((getMagazineCargo _x) select 1))) > 50) || (count([currentWeapon _x] + (weapons _x) + (magazines _x)) > 50)) exitWith
			{
				deleteVehicle _x;
				(format ["CHEATCRATE %1", _x]) call _fn_handleCheater;
			};
		};	
	}forEach _objectList;
};

_fn_findCheatVariables =
{
	{
		if (!(isNil _x)) exitWith
		{	
			(format ["CHEATVAR %1", _x]) call _fn_handleCheater;
		};
	}forEach _cheatVariables;
};

// run dac on clients
if (!isServer && !(_playerUid in _adminList)) then
{
	private ["_waitScripts", "_waitVariables"];
	
	_waitScripts = 180;
	_waitVariables = 60;
	
	while {alive player} do
	{	
		if (_waitScripts == 180) then
		{
			call _fn_findCheatScripts;			
			_waitScripts = 0;
		};
		
		if (_waitVariables == 60) then
		{
			call _fn_findCheatVariables;		
			_waitVariables = 0;
		};
		
		call _fn_findCheatCrates;
		call _fn_findGroupIcons;
		
		sleep 15;
		_waitScripts = _waitScripts + 15;
		_waitVariables = _waitVariables + 15;
	};
};

// run dac on admin
if (_playerUid in _adminList) then
{	
	// add event handler for the admin
	fn_handleDacMessage =
	{
		private ["_playerName", "_playerUid", "_reason", "_message"];
		
		_playerName = _this select 0;
		_playerUid = _this select 1;
		_reason = _this select 2;
		
		_message = format["CHEATER DETECTED - player: %1 - uid: %2 - reason: %3", _playerName, _playerUid, _reason];
		
		cutText [_message, "PLAIN"];
	};

	// [name,uid,reason]
	serverSendDacMessage = [];
	"serverSendDacMessage" addPublicVariableEventHandler {(_this select 1) call fn_handleDacMessage;};
};