// intrntbrn
private ["_EH_Fired","_spawnMenuThread","_sleepThread","_hideThread"];
waitUntil {(!isNil "PVDZ_plr_LoginRecord")};
waitUntil {(!isNil 'dayz_Totalzedscheck') || (!isNil 'dayz_locationCheck') || (!isNil 'dayzplayerlogin') || (!isNil 'dayz_animalcheck')};
teleported = false;
hiddenPlayers = [];
sleepSpawn = 1;

_sleepThread = [] spawn {
	sleep 300;
	sleepSpawn = 15;
};

while {true} do {
	waitUntil {sleep sleepSpawn;inSpawnBase};
	player_zombieCheck = {};
	fnc_usec_damageHandler = {};
	fnc_usec_unconscious  = {};
	_EH_Fired = player addEventHandler ["Fired", {nearestObject [_this select 0,_this select 4] setPos[0,0,0]; titleText ["www.DE-1000.de.vu","PLAIN DOWN"]; titleFadeOut 4; }];
	player_fired = {};
	systemChat("DE 1000 > Spawn Protection enabled");
	
	_hideThread = [] spawn {
		while {inSpawnBase} do {
			_playersInBase = [3441.083,14218.603,0] nearEntities ["CAManBase", 150];
			{
				if (!((_x in hiddenPlayers) && (_x != player))) then {
					hiddenPlayers = hiddenPlayers + [_x];
					_x hideObject true;
				};
			} forEach _playersInBase;
			sleep 1;
		};
	};

	_spawnMenuThread = [] spawn {
		sleep 1;
		if (iamanowner) then {
			YOLO_menu =
			[
				["",true],
					["Home Sweet Home", [11],  "", -5, [["expression", 	"[ownerpos, 					'Home Sweet Home', 1750] execVM 'startup\teleport.sqf'"]], "1", "1"],
					["Kamenka", [2],  "", -5, [["expression", 			"[[1893.55,2210.85,0.001], 		'Kamenka', 800] execVM 'startup\teleport.sqf'"]], "1", "1"],
					["Cherno", [3],  "", -5, [["expression", 			"[[6743.8853, 2581.1865], 		'Cherno', 1400] execVM 'startup\teleport.sqf'"]], "1", "1"],
					["Elektro", [4],  "", -5, [["expression", 			"[[10480.69, 2217.8027, 0], 	'Elektro', 1000] execVM 'startup\teleport.sqf'"]], "1", "1"],
					["Solnichniy", [5],  "", -5, [["expression", 		"[[13454.279, 6233.647, 0], 	'Solnichniy', 1000] execVM 'startup\teleport.sqf'"]], "1", "1"],
					["Berezino", [6],  "", -5, [["expression", 			"[[12954.624, 9783.1533, 0], 	'Berezino', 1200] execVM 'startup\teleport.sqf'"]], "1", "1"],
					["Zelenogorsk", [7],  "", -5, [["expression", 		"[[2758.7144, 5304.3457, 0], 	'Zelenogorsk', 1000] execVM 'startup\teleport.sqf'"]], "1", "1"],
					["Guglovo", [8],  "", -5, [["expression", 			"[[8517.8682, 6676.3276, 0], 	'Guglovo', 700] execVM 'startup\teleport.sqf'"]], "1", "1"],
					["Lopatino", [9],  "", -5, [["expression", 			"[[2780.3135, 10018.82, 0], 	'Lopatino', 1100] execVM 'startup\teleport.sqf'"]], "1", "1"],
					["Devil's Castle", [10],  "", -5, [["expression", 	"[[6892.49,11434.8,0.001], 		'Devils Castle', 1500] execVM 'startup\teleport.sqf'"]], "1", "1"]
			];			
		}
		else {
			YOLO_menu =
			[
				["",true],
					["Random", [11],  "", -5, [["expression", 			"[[7074.4854, 7683.4883, 0], 	'Random', 4500] execVM 'startup\teleport.sqf'"]], "1", "1"],
					["Kamenka", [2],  "", -5, [["expression", 			"[[1893.55,2210.85,0.001], 		'Kamenka', 800] execVM 'startup\teleport.sqf'"]], "1", "1"],
					["Cherno", [3],  "", -5, [["expression", 			"[[6743.8853, 2581.1865], 		'Cherno', 1400] execVM 'startup\teleport.sqf'"]], "1", "1"],
					["Elektro", [4],  "", -5, [["expression", 			"[[10480.69, 2217.8027, 0], 	'Elektro', 1000] execVM 'startup\teleport.sqf'"]], "1", "1"],
					["Solnichniy", [5],  "", -5, [["expression", 		"[[13454.279, 6233.647, 0], 	'Solnichniy', 1000] execVM 'startup\teleport.sqf'"]], "1", "1"],
					["Berezino", [6],  "", -5, [["expression", 			"[[12954.624, 9783.1533, 0], 	'Berezino', 1200] execVM 'startup\teleport.sqf'"]], "1", "1"],
					["Zelenogorsk", [7],  "", -5, [["expression", 		"[[2758.7144, 5304.3457, 0], 	'Zelenogorsk', 1000] execVM 'startup\teleport.sqf'"]], "1", "1"],
					["Guglovo", [8],  "", -5, [["expression", 			"[[8517.8682, 6676.3276, 0], 	'Guglovo', 700] execVM 'startup\teleport.sqf'"]], "1", "1"],
					["Lopatino", [9],  "", -5, [["expression", 			"[[2780.3135, 10018.82, 0], 	'Lopatino', 1100] execVM 'startup\teleport.sqf'"]], "1", "1"],
					["Devil's Castle", [10],  "", -5, [["expression", 	"[[6892.49,11434.8,0.001], 		'Devils Castle', 1500] execVM 'startup\teleport.sqf'"]], "1", "1"]
			];		
		};

		while {!teleported} do {
			waitUntil {sleep 1; inSpawnBase};
			sleep 1;
			if (!teleported) then {
				["Spawn Base"] spawn bis_fnc_infotext;
				titleText ["Select your Spawnlocation", "PLAIN DOWN", 3];
				titleFadeOut 3;
				showCommandingMenu "#USER:YOLO_menu";
				sleep 15;
			};
		};
	};


	waitUntil {sleep 1;!inSpawnBase};
	sleep 3;
	player removeEventHandler ["Fired", _EH_Fired];
	player_zombieCheck = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_zombieCheck.sqf";
	fnc_usec_damageHandler = compile preprocessFileLineNumbers "fixes\fn_damageHandler.sqf";
	fnc_usec_unconscious = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_unconscious.sqf";
	player_fired = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_fired.sqf";
	terminate _spawnMenuThread;
	terminate _hideThread;
	sleepSpawn = 15;
	terminate _sleepThread;
	sleep 1;
	{_x hideObject false;} forEach hiddenPlayers;
	hiddenPlayers = [];
	systemChat("DE 1000 > Spawn Protection disabled");
}; 