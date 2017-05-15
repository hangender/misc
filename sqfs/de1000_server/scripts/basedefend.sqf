
private["_initsleep","_iteration","_maxIteration","_offset","_base","_bases","_basesChance","_baseWeights","_baseIndex","_timeStart","_waitUntil","_notiOffset","_notiInterval"];
diag_log("RUNNING BASEDEFEND SCRIPT");
baseMarkerPos 	= [];
publicVariable "baseMarkerPos";


_initSleep = 400; 
sleep _initSleep;

_iteration 		= 1;
_maxIteration 	= 1;
_offset 		= 30; 
_notiOffset 	= 5; 

while {(_iteration <= _maxIteration)} do {


_notiInterval 	= 1;

_waitUntil = ((serverTime + (((_offset) * _iteration) * 60)) - _initSleep);
waitUntil{sleep 30; (serverTime > _waitUntil)};

_bases 			= ["ships_freight", "gas", "the_lost_frigate", "hopeless_undertaking", "forgotten_camp", "cabine_in_the_woods", "no_way_out", "trouble_in_electro", "hunt_or_be_hunted", "hidden_in_the_woods"];
_basesChance 	= [1,				1,			1,						1,					1,					1,					1,				1,						1, 					1];
_baseWeights 	= [];
_baseWeights 	= [_bases,_basesChance] call fnc_buildWeightedArray;
_baseIndex 		= _baseWeights call BIS_fnc_selectRandom;
_base 			= _bases select _baseIndex;



theBase = [] execVM format["\z\addons\dayz_server\bases\%1.sqf",_base];


waitUntil { sleep 2; ((count baseMarkerPos) > 1)};
baseCrate setVariable ["Sarge",1,true];
baseCrate setVariable ["permaLoot",true,true];
baseCrate addEventHandler ["HandleDamage", {false}];
clearWeaponCargoGlobal baseCrate;
clearMagazineCargoGlobal baseCrate;


publicVariable "baseMarkerPos";
baseColor = "ColorGreen";
publicVariable "baseColor";
baseMarker = createMarker ["BaseMarker", baseMarkerPos];
baseMarker setMarkerColor baseColor;
baseMarker setMarkerShape "ELLIPSE";
baseMarker setMarkerBrush "Grid";
baseMarker setMarkerSize [200,200];

baseMarkerCrate = createMarker ["BaseMarkerCrate", baseMarkerPos];
baseMarkerCrate setMarkerColor "ColorBlack";
baseMarkerCrate setMarkerType "InfantryTeam";
baseMarkerCrate setMarkerSize [0.45,0.45];


[nil, nil, rspawn, [baseName], {
_baseName = _this select 0;
taskhint [format["BaseBattle:\n%1",_baseName], [0, 1, 0, 1], "taskNew"];
systemChat("BaseBattle Beta: A new BaseBattle is live. Check the map for the location.");
}] call RE;
sleep 5;



waitUntil{sleep 3; {isPlayer _x && _x distance baseMarkerPos < baseRadius } count playableunits > 0}; 
sleep 3;


_timeStart = serverTime;
baseColor = "ColorRed";
publicVariable "baseColor";
baseMarker setMarkerColor baseColor;

[nil, nil, rspawn, [baseName], {
_baseName = _this select 0;
systemChat(format["BaseBattle Beta: %1 is now captured by players. Try to conquer it.",_baseName]);
taskhint [format["BaseBattle Beta: %1\nis now captured",_baseName], [1, 0, 0, 1], "taskNew"];
sleep 6;
systemChat("BaseBattle Beta: The crate will be filled in 15 minutes.");
taskhint ["BaseBattle\nLootspawn in \n15 min", [1, 1, 0, 1], "taskNew"];
}] call RE;


_waitUntil = (_timeStart + (_notiInterval * _notiOffset * 60));
waitUntil { sleep 5; (serverTime > _waitUntil)};
_notiInterval = _notiInterval + 1;
[nil, nil, rspawn, [], {
_baseName = _this select 0;
taskhint ["BaseBattle Beta:\nLootspawn in 10 min", [1, 0.66, 0, 1], "taskCurrent"];
systemChat("BaseBattle Beta: The crate will be filled in 10 minutes.");
}] call RE;


_waitUntil = (_timeStart + (_notiInterval * _notiOffset * 60));
waitUntil { sleep 5; (serverTime > _waitUntil)};
_notiInterval = _notiInterval + 1;
[nil, nil, rspawn, [], {
_baseName = _this select 0;
taskhint ["BaseBattle Beta:\nLootspawn in 5 min", [1, 0.33, 0, 1], "taskCurrent"];
systemChat("BaseBattle Beta: The crate will be filled in 5 minutes.");
}] call RE;


_waitUntil = (_timeStart + (_notiInterval * _notiOffset * 60));
waitUntil { sleep 5; (serverTime > _waitUntil)};
[baseCrate] execVM "\z\addons\dayz_server\scripts\ammocrate.sqf";
[nil, nil, rspawn, [], {
_baseName = _this select 0;
taskhint ["BaseBattle Beta:\nThe loot is spawned", [1, 0, 0, 1], "taskDone"];
systemChat("BaseBattle Beta: The crate is now filled with loot.");
}] call RE;

sleep 30;


deleteMarker "BaseMarker";
deleteMarker "BaseMarkerCrate";
baseMarkerPos 	= [];
publicVariable "baseMarkerPos";
_iteration = _iteration + 1;
};