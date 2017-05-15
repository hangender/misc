player removeAction s_clothes;
s_clothes = -1;
if ({alive _x} count ((getPosATL player) nearEntities ["CAManBase",7]) == 1) then {
private["_body","_result","_model","_myModel"];
    _body = _this select 3;
	_myModel = typeOf player;
    _model = typeOf _body;
	if (_model != _myModel) then {
		if(_model in ["TK_INS_Soldier_EP1","Soldier1_DZ","Survivor2_DZ","US_Soldier_EP1","BanditW1_DZ","Bandit1_DZ","Camo1_DZ","CZ_Soldier_DES_EP1","BAF_Soldier_Sniper_MTP","BAF_Soldier_MTP","BAF_Soldier_Officer_DDPM","BAF_Soldier_DDPM","Sniper1_DZ","Survivor3_DZ","Rocket_DZ","SurvivorW2_DZ"]) then 
		{
			[dayz_playerUID,dayz_characterID,_model] spawn player_humanityMorph;
			player playActionNow "PutDown";
			private["_name","_method","_methodStr"];
			_name = _body getVariable["bodyName","unknown"];
			_method = _body getVariable["deathType","unknown"];
			_methodStr = localize format ["str_death_%1",_method];
			_class = _myModel;
			_position = getPosATL _body;
			_dir = getDir _body;
			_currentAnim = animationState
			_body; private ["_weapons","_magazines","_primweapon","_secweapon"];
			_weapons = weapons _body;
			_primweapon = primaryWeapon _body;
			_secweapon = secondaryWeapon _body;
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
			_body setPosATL dayz_spawnPos;
			_oldUnit = _body;
			_group = createGroup west;
			_newUnit = _group createUnit [_class,position player,[],0,"NONE"];
			_newUnit setPosATL _position;
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
			removeAllWeapons _oldUnit; {_oldUnit removeMagazine _x;
			} forEach magazines _oldUnit; deleteVehicle _oldUnit;
			_newUnit setDamage 1;
			_newUnit setVariable["bodyName",_name,true];
			_newUnit setVariable["deathType",_method,true];
		};
		}
	else {
		titleText ["You are already wearing this skin.", "PLAIN DOWN", 3];
		titleFadeOut 3;
	};
} else {
	titleText ["Other players are near [Anti-Dupe]", "PLAIN DOWN", 3];
	titleFadeOut 3;
};