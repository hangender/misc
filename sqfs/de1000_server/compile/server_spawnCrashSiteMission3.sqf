


private["_crashwreck","_crashModel","_vehicleModel","_vehicleRadius","_vehicleKind","_missionKind","_missionKinds","_missionChance","_missionWeights","_missionIndex","_misssionColor","_pos","_crash","_num","_itemTypes","_itemChance","_weights","_cntWeights","_index","_itemType","_lootPos","_nearBy","_lootRadius","_deadBody","_messageStart", "_messageEnd"];




marker3 = [];
publicVariable "marker3";

missionMode = 0;
publicVariable "missionMode";

missionArray = [];
publicVariable "missionArray";

sleep (round(random 120) + 60);

while {true} do {


_crashModel = ["UH1Wreck_DZ","Mi8Wreck","UralWreck","HMMWVWreck","C130JWreck","MV22Wreck","BMP2Wreck"] call BIS_fnc_selectRandom;

switch (_crashModel) do {
case "UH1Wreck_DZ": {
_vehicleModel = "UH1H_DZ";
_vehicleKind = "air";
_vehicleRadius = 10;
};
case "Mi8Wreck": {
_vehicleModel = "Mi17_DZ";
_vehicleKind = "air";
_vehicleRadius = 10;
};
case "UralWreck": {
_vehicleModel = "UralCivil";
_vehicleKind = "car";
_vehicleRadius = 10;
};
case "HMMWVWreck": {
_vehicleModel = "HMMWV_DZ";
_vehicleKind = "car";
_vehicleRadius = 10;
};
case "C130JWreck": {
_vehicleModel = "C130J";
_vehicleKind = "noexplosion";
_vehicleRadius = 50;
};
case "MV22Wreck": {
_vehicleModel = "MV22";
_vehicleKind = "noexplosion";
_vehicleRadius = 15;
};
case "BMP2Wreck": {
_vehicleModel = "BMP3";
_vehicleKind = "noexplosion";
_vehicleRadius = 12;
};
};


_pos = [[7074.4854, 7683.4883, 0],0,6000,_vehicleRadius,0,2000,0] call BIS_fnc_findSafePos;



switch (_vehicleKind) do {
case "air": {
_crashwreck = createVehicle [_vehicleModel,_pos, [], 0, "FLY"];
_crashwreck setVariable["Sarge",1];
_crashwreck engineOn true;
_crashwreck flyInHeight 5;
sleep 1;
_crashwreck setdamage 1;
_crashwreck setfuel 0;
sleep 6;
deletevehicle _crashwreck;
sleep 2;
};
case "car": {
_crashwreck = createVehicle [_vehicleModel,_pos, [], 0, "CAN_COLLIDE"];
_crashwreck setVariable["Sarge",1];
_crashwreck engineOn true;
sleep 1;
_crashwreck setdamage 1;
_crashwreck setfuel 0;
sleep 6;
deletevehicle _crashwreck;
sleep 2;
};
case "noexplosion": {
sleep 1;
};
};




_crash = createVehicle [_crashModel, _pos, [], 0, "CAN_COLLIDE"];
_crash setVariable["Sarge",1];
_crash setVariable ["dontclean",1,true];
dayz_serverObjectMonitor set [count dayz_serverObjectMonitor,_crash];
_crash setVariable ["ObjectID",1,true];

_config = configFile >> "CfgBuildingLoot" >> _lootTable;


_missionKinds = ["Military", "Medic", "Sniper", "MG", "KSVK", "DMR", "Repair", "Skin", "Tool", "Tent", "Backpack", "Bomb", "Radio", "Night", "AS50"];
_missionChance = [0.60,		0.25,		0.25,	0.25,	0.05,	0.05,	0.15, 	0.15,	0.15, 	0.10,		0.15, 	0.10,	0.10,	0.15,	  0.025];
_missionWeights = [];
_missionWeights = [_missionKind,_missionChance] call fnc_buildWeightedArray;
_missionIndex = _missionWeights call BIS_fnc_selectRandom;
_missionKind = _missionKinds select _missionIndex;

switch (_missionKind) do {
case "Military": {
_num        = round(random 3) + 2;
_itemTypes = [["m240_scoped_EP1","weapon"], ["M60A4_EP1","weapon"], ["SVD_des_EP1","weapon"], ["SVD","weapon"], ["DMR","weapon"], ["M24_des_EP1","weapon"], ["M24","weapon"], ["RPK_74","weapon"], ["G36K_camo","weapon"], ["G36A_camo","weapon"], ["G36C_camo","weapon"], ["Mk_48_DZ","weapon"], ["M249_DZ","weapon"], ["SVD_CAMO","weapon"], ["Sa58V_CCO_EP1","weapon"], ["Sa58V_RCO_EP1","weapon"], ["M40A3","weapon"], ["FN_FAL","weapon"], ["M14_EP1","weapon"], ["AmmoBoxSmall_556","object"],  ["AmmoBoxSmall_762","object"], ["DZ_CivilBackpack_EP1","object"], ["DZ_Backpack_EP1","object"], ["Binocular_Vector","military"], ["m240_dz","weapon"], ["PipeBomb","magazine"], ["ItemRadio","weapon"], ["SVD_NSPU_EP1","weapon"], ["FN_FAL_ANPVS4","weapon"]];
_itemChance = [0.05, 								0.05,					0.05,					0.05,			0.05,				0.05,					0.05,				0.05,				0.05,					0.05,					0.05,					0.05,					0.05,					0.05,					0.05,						0.05,					0.05,				0.05,				0.05,					0.05,								0.05,							0.05,							0.05,							0.05,							0.05,				0.05,					0.05,						0.05,					0.05];
_weights = [];
_weights = [_itemType,_itemChance] call fnc_buildWeightedArray;
_cntWeights = count _weights;
_index = _weights call BIS_fnc_selectRandom;	
};
case "Medic": {
_num        = round(random 5) + 3;
_itemTypes = [["MedBox0","object"], ["ItemAntibiotic","magazine"]];
_itemChance = [0.7, 							0.3];
_weights = [];
_weights = [_itemType,_itemChance] call fnc_buildWeightedArray;
_cntWeights = count _weights;
_index = _weights call BIS_fnc_selectRandom;
};
case "Sniper": {
_num        = round(random 2) + 2;
_itemTypes = [["SVD_des_EP1","weapon"], ["SVD","weapon"], ["DMR","weapon"], ["M24_des_EP1","weapon"], ["M24","weapon"], ["SVD_CAMO","weapon"], ["M40A3","weapon"], ["ksvk","weapon"], ["Binocular_Vector","military"], ["huntingrifle", "weapon"], ["SVD_NSPU_EP1","weapon"]];
_itemChance = [0.1,						0.1,				0.1,				0.1,						0.1,			0.1,					0.1,					0.1,			0.1,								0.1,						0.1];
_weights = [];
_weights = [_itemType,_itemChance] call fnc_buildWeightedArray;
_cntWeights = count _weights;
_index = _weights call BIS_fnc_selectRandom;	
};
case "MG": {
_num        = round(random 2) + 2;
_itemTypes = [["m240_scoped_EP1","weapon"], ["M60A4_EP1","weapon"], ["RPK_74","weapon"], ["Mk_48_DZ","weapon"], ["M249_DZ","weapon"], ["m240_DZ","weapon"]];
_itemChance = [0.1,										0.1,				0.1,				0.1,					0.1,				0.1];
_weights = [];
_weights = [_itemType,_itemChance] call fnc_buildWeightedArray;
_cntWeights = count _weights;
_index = _weights call BIS_fnc_selectRandom;	
};
case "KSVK": {
_num        = round(random 2) + 2;
_itemTypes = [["ksvk","weapon"]];
_itemChance = [1];
_weights = [];
_weights = [_itemType,_itemChance] call fnc_buildWeightedArray;
_cntWeights = count _weights;
_index = _weights call BIS_fnc_selectRandom;	
};
case "AS50": {
_num        = round(random 1) + 1;
_itemTypes = [["BAF_AS50_scoped_large","weapon"]];
_itemChance = [1];
_weights = [];
_weights = [_itemType,_itemChance] call fnc_buildWeightedArray;
_cntWeights = count _weights;
_index = _weights call BIS_fnc_selectRandom;	
};
case "Repair": {
_num        = round(random 10) + 10;
_itemTypes = [["WeaponHolder_PartGeneric", "object"], ["WeaponHolder_PartWheel", "object"], ["WeaponHolder_PartFueltank", "object"], ["WeaponHolder_PartEngine", "object"], ["WeaponHolder_PartGlass", "object"], ["WeaponHolder_PartVRotor", "object"]];
_itemChance = [0.10,													0.25,								0.10,									0.15,									0.25,								0.10];
_weights = [];
_weights = [_itemType,_itemChance] call fnc_buildWeightedArray;
_cntWeights = count _weights;
_index = _weights call BIS_fnc_selectRandom;	
};
case "Skin": {
_num        = round(random 5) + 5;
_itemTypes = [["Skin_Camo1_DZ", "magazine"], ["Skin_Sniper1_DZ", "magazine"], ["Skin_Soldier1_DZ", "magazine"]];
_itemChance = [0.2,									0.2,								0.2];
_weights = [];
_weights = [_itemType,_itemChance] call fnc_buildWeightedArray;
_cntWeights = count _weights;
_index = _weights call BIS_fnc_selectRandom;	
};
case "Tool": {
_num        = round(random 5) + 10;
_itemTypes = [["ItemMap", "weapon"], ["ItemCompass", "generic"], ["ItemKnife", "generic"], ["ItemMatchbox", "generic"], ["Binocular", "weapon"], ["Binocular_Vector","military"], ["ItemEtool","weapon"], ["ItemToolbox","weapon"], ["ItemBookBible","magazine"], ["ItemRadio","weapon"], ["ItemFlashlightRed", "generic"], ["NVGoggles","weapon"]];
_itemChance = [0.1,								0.1,						0.1,					0.1,						0.1,						0.1,						0.1,						0.1,					0.15,							0.15,					0.1,							0.1];
_weights = [];
_weights = [_itemType,_itemChance] call fnc_buildWeightedArray;
_cntWeights = count _weights;
_index = _weights call BIS_fnc_selectRandom;	
};
case "Tent": {
_num        = round(random 3) + 3;
_itemTypes = [["WeaponHolder_ItemTent", "object"], ["ItemSandbag","magazine"]];
_itemChance = [0.4,											0.2];
_weights = [];
_weights = [_itemType,_itemChance] call fnc_buildWeightedArray;
_cntWeights = count _weights;
_index = _weights call BIS_fnc_selectRandom;	
};
case "Backpack": {
_num        = round(random 3) + 4;
_itemTypes = [["DZ_Backpack_EP1", "object"], ["DZ_CivilBackpack_EP1", "object"], ["DZ_British_ACU", "object"], ["DZ_ALICE_Pack_EP1", "object"]];
_itemChance = [0.2,										0.2,								0.2,						0.2];
_weights = [];
_weights = [_itemType,_itemChance] call fnc_buildWeightedArray;
_cntWeights = count _weights;
_index = _weights call BIS_fnc_selectRandom;	
};
case "DMR": {
_num        = round(random 2) + 2;
_itemTypes = [["DMR","weapon"]];
_itemChance = [1];
_weights = [];
_weights = [_itemType,_itemChance] call fnc_buildWeightedArray;
_cntWeights = count _weights;
_index = _weights call BIS_fnc_selectRandom;	
};
case "Bomb": {
_num        = round(random 4) + 2;
_itemTypes = [["PipeBomb","magazine"]];
_itemChance = [1];
_weights = [];
_weights = [_itemType,_itemChance] call fnc_buildWeightedArray;
_cntWeights = count _weights;
_index = _weights call BIS_fnc_selectRandom;	
};
case "Radio": {
_num        = round(random 3) + 3;
_itemTypes = [["ItemRadio","weapon"]];
_itemChance = [1];
_weights = [];
_weights = [_itemType,_itemChance] call fnc_buildWeightedArray;
_cntWeights = count _weights;
_index = _weights call BIS_fnc_selectRandom;	
};
case "Night": {
_num        = round(random 4) + 3;
_itemTypes = [["NVGoggles","weapon"], ["FN_FAL_ANPVS4","weapon"], ["SVD_NSPU_EP1","weapon"]]; 
_itemChance = [0.8, 							0.1, 						0.1];
_weights = [];
_weights = [_itemType,_itemChance] call fnc_buildWeightedArray;
_cntWeights = count _weights;
_index = _weights call BIS_fnc_selectRandom;	
};
};
_lootRadius = 0.35;


for "_x" from 1 to _num do {
_index = floor(random _cntWeights);
_index = _weights select _index;
_itemType = _itemTypes select _index;

_lootPos = [_pos, ((random 2) + (sizeOf(_crashModel) * _lootRadius)), random 360] call BIS_fnc_relPos;
[_itemType select 0, _itemType select 1, _lootPos, 0] call spawn_loot;

_nearBy = _pos nearObjects ["ReammoBox", sizeOf(_crashModel)];
{
_x setVariable ["permaLoot",true];
} forEach _nearBy;
};


if(daytime<6||daytime>21)then {
for "_x" from 1 to 5 do {
_lootPos = [_pos, ((random 10)+5), random 360] call BIS_fnc_relPos;
_deadBody = createVehicle["Land_Fire_barrel_burning",_lootPos,[], 0, "CAN_COLLIDE"];
_deadBody setDir (random 360);
};
};


missionArray = [_vehicleModel, ((getPosATL _crash) call fa_coor2str), _missionKind];
publicVariable "missionArray";

marker3 = _pos;
publicVariable "marker3";

missionMode = 1;
publicVariable "missionMode";
[] execVM "marker\marker_3.sqf";
if ((count playableUnits) > 49) then {
sleep 6;
}
else {
if ((count playableUnits) > 40) then {
sleep 10;
}
else {
sleep 20;
};
};
missionMode = 0;
publicVariable "missionMode";



waitUntil{sleep 3;{isPlayer _x && _x distance _crash < 10  } count playableunits > 0}; 
marker3 = [];
publicVariable "marker3";

missionArray = [_vehicleModel, ((getPosATL _crash) call fa_coor2str), _missionKind];
publicVariable "missionArray";

missionMode = 2;
publicVariable "missionMode";

[] execVM "marker\removemarker_3.sqf";

if ((count playableUnits) > 49) then {
sleep 6;
}
else {
if ((count playableUnits) > 40) then {
sleep 10;
}
else {
sleep 20;
};
};
missionMode = 0;
publicVariable "missionMode";


if ((count playableUnits) > 49) then {
sleep ((round(random 90)) + 130);
}
else {
if ((count playableUnits) > 40) then {
sleep ((round(random 200)) + 280);
}
else {
sleep ((round(random 400)) + 550);
};
};

};