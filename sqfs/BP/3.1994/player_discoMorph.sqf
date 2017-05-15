#line 1 "z\addons\deathly_breakingpoint_server\compile\player_discoMorph.sqf"
private["_updates","_playerUID","_charID","_humanity","_worldspace","_model","_newUnit","_object","_class","_position","_dir","_group","_oldUnit","_currentWpn","_muzzles","_currentAnim","_wounds"];
_playerUID 	= _this select 0;
_charID 	= _this select 1;
_model 		= _this select 2;
_object = _this select 3;


_old = _object;


_object removeEventHandler ["FiredNear",0];
_object removeEventHandler ["HandleDamage",0];
_object removeEventHandler ["Killed",0];
_object removeEventHandler ["Fired",0];

_updates = 		_object getVariable["updatePlayer",[false,false,false,false,false]];
_updates set [0,true];
_object setVariable["updatePlayer",_updates,true];


_medical= _object call player_sumMedical;
diag_log str(_medical);
_worldspace 	= [round(direction _object),getPosATL _object];
_zombieKills 	= _object getVariable ["zombieKills",0];
_headShots 		= _object getVariable ["headShots",0];
_humanKills 	= _object getVariable ["humanKills",0];
_banditKills 	= _object getVariable ["banditKills",0];
_humanity = 	_object getVariable ["humanity",0];



_class 			= _model;

_position 		= getPosATL _object;
_dir 			= getDir _object;
_currentAnim 	= animationState _object;


_object setPosATL [0,0,0];



private ["_weapons","_magazines","_primweapon","_secweapon"];
_weapons 	= weapons _object;
_magazines	= magazines _object;
_primweapon	= primaryWeapon _object;
_secweapon	= secondaryWeapon _object;


if(!(_primweapon in _weapons) && _primweapon != "") then {
_weapons = _weapons + [_primweapon];
};

if(!(_secweapon in _weapons) && _secweapon != "") then {
_weapons = _weapons + [_secweapon];
};

if(count _magazines == 0) then {
_magazines = magazines _object;
};


private ["_newBackpackType","_backpackWpn","_backpackMag"];
_newBackpackType = (typeOf (unitBackpack _object));
if(_newBackpackType != "") then {
_backpackWpn = getWeaponCargo unitBackpack _object;
_backpackMag = getMagazineCargo unitBackpack _object;
};


_currentWpn = "";
_muzzles = getArray(configFile >> "cfgWeapons" >> _currentWpn >> "muzzles");
if (count _muzzles > 1) then {
_currentWpn = currentMuzzle _object;
};


diag_log "Attempting to switch model";
diag_log str(_weapons);
diag_log str(_magazines);
diag_log (str(_backpackWpn));
diag_log (str(_backpackMag));


_oldUnit = _object;








_group 		= createGroup west;
_newUnit 	= _group createUnit [_class,getpos _object,[],0,"NONE"];
_newUnit disableai "anim";

_newUnit 	setPosATL _position;
_newUnit 	setDir _dir;


{_newUnit removeMagazine _x;} forEach  magazines _newUnit;
removeAllWeapons _newUnit;	


{
if (typeName _x == "ARRAY") then {_newUnit addMagazine [_x select 0,_x select 1] } else { _newUnit addMagazine _x };

} forEach _magazines;

{
_newUnit addWeapon _x;

} forEach _weapons;


if(str(_weapons) != str(weapons _newUnit)) then {

{
_weapons = _weapons - [_x];
} forEach (weapons _newUnit);


{
_newUnit addWeapon _x;

} forEach _weapons;
};

if(_primweapon !=  (primaryWeapon _newUnit)) then {
_newUnit addWeapon _primweapon;		
};

if(_secweapon != (secondaryWeapon _newUnit) && _secweapon != "") then {
_newUnit addWeapon _secweapon;		
};


if (!isNil "_newBackpackType") then {
if (_newBackpackType != "") then {
_newUnit addBackpack _newBackpackType;
_oldBackpack = dayz_myBackpack;
dayz_myBackpack = unitBackpack _newUnit;




_backpackWpnTypes = [];
_backpackWpnQtys = [];
if (count _backpackWpn > 0) then {
_backpackWpnTypes = _backpackWpn select 0;
_backpackWpnQtys = 	_backpackWpn select 1;
};
_countr = 0;
{
dayz_myBackpack addWeaponCargoGlobal [_x,(_backpackWpnQtys select _countr)];
_countr = _countr + 1;
} forEach _backpackWpnTypes;

_backpackmagTypes = [];
_backpackmagQtys = [];
if (count _backpackmag > 0) then {
_backpackmagTypes = _backpackMag select 0;
_backpackmagQtys = 	_backpackMag select 1;
};
_countr = 0;
{
dayz_myBackpack addmagazineCargoGlobal [_x,(_backpackmagQtys select _countr)];
_countr = _countr + 1;
} forEach _backpackmagTypes;
};
};

diag_log "Swichtable Unit Created. Equipment:";
diag_log str(weapons _newUnit);
diag_log str(magazines _newUnit);
diag_log str(getWeaponCargo unitBackpack _newUnit);
diag_log str(getMagazineCargo unitBackpack _newUnit);


addSwitchableUnit _newUnit;
setPlayable _newUnit;

_newUnit disableConversation true;
_newUnit setVariable ["BIS_noCoreConversations", true];
_newUnit disableAI "TARGET";
_newUnit disableAI "AUTOTARGET"; 
_newUnit setBehaviour "CARELESS";


if(_currentWpn != "") then {_newUnit selectWeapon _currentWpn;};	





if (count _medical > 0) then {
_newunit setVariable["USEC_isDead",(_medical select 0),true];
_newunit setVariable["NORRN_unconscious", (_medical select 1), true];
_newunit setVariable["USEC_infected",(_medical select 2),true];
_newunit setVariable["USEC_injured",(_medical select 3),true];
_newunit setVariable["USEC_inPain",(_medical select 4),true];
_newunit setVariable["USEC_isCardiac",(_medical select 5),true];
_newunit setVariable["USEC_lowBlood",(_medical select 6),true];
_newunit setVariable["USEC_BloodQty",(_medical select 7),true];
_newunit setVariable["unconsciousTime",(_medical select 10),true];
_newunit setVariable["messing",(_medical select 11),true];




{
_newunit setVariable[_x,true,true];
[_newunit,_x,_hit] spawn fnc_usec_damageBleed;
usecBleed = [_newunit,_x,0];
publicVariable "usecBleed";
} forEach (_medical select 8);


_fractures = (_medical select 9);
_newunit setVariable ["hit_legs",(_fractures select 0),true];
_newunit setVariable ["hit_hands",(_fractures select 1),true];
} else {

_newunit setVariable ["hit_legs",0,true];
_newunit setVariable ["hit_hands",0,true];
_newunit setVariable ["USEC_injured",false,true];
_newunit setVariable ["USEC_inPain",false,true];	
};


_newunit setVariable["characterID",str(_charID),true];
_newunit setVariable["worldspace",_worldspace,true];
_newunit setVariable["zombieKills",_zombieKills,true];
_newunit setVariable["headShots",_headShots,true];
_newunit setVariable["humanKills",_humanKills,true];
_newunit setVariable["banditKills",_banditKills,true];
_newunit setVariable["humanity",_humanity,true];

dayzPlayerMorph = [_charID,_newunit,_playerUID,[_zombieKills,_headShots,_humanKills,_banditKills],_humanity];

if (isServer) then {
dayzPlayerMorph call server_playerMorph;
}else{
publicVariable "dayzPlayerMorph";
};
call dayz_resetSelfActions;



_mydamage_eh1 = _newunit addeventhandler ["HandleDamage",{[_this] call disco_handler;}];


_newunit allowDamage true;

_newunit addWeapon "Loot";
_newunit addWeapon "Flare";

sleep 0.1;
deleteVehicle _old;
if(!(_playerUID in anti_disconnect)) then {
anti_disconnect set [count anti_disconnect,_playerUID];
};

sleep 30;

_newunit removeAllEventHandlers "handleDamage";
[_newunit,[],true,true] call server_playerSync;





if (alive _newunit) then {
_myGroup = group _newunit;
deleteVehicle _newunit;
deleteGroup group _newunit;
};
anti_disconnect = anti_disconnect - [_playerUID];