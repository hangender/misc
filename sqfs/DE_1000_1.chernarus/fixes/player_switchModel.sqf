private ["_class","_position","_dir","_currentAnim","_currentCamera","_playerUID","_weapons","_magazines","_primweapon","_secweapon","_newBackpackType","_backpackWpn","_backpackMag","_currentWpn","_muzzles","_display","_oldUnit","_newUnit","_oldBackpack","_backpackWpnTypes","_backpackWpnQtys","_countr","_backpackmagTypes","_backpackmagQtys","_backpackmag","_createSafePos","_rndx","_rndy","_playerObjName","_wpnType","_ismelee"];
_class = _this;

disableSerialization;
_position = getPosATL player;
_dir = getDir player;
_currentAnim = animationState player;
player removeAction s_ccmenu;

	_playerUID = getPlayerUID player;

	_weapons = weapons player;
	_magazines = call player_countMagazines; //magazines player;

	if ( (_playerUID == dayz_playerUID) && (count _magazines == 0) && (count (magazines player) > 0 )) exitWith {cutText [localize "str_actions_switchmodel_fail", "PLAIN DOWN"]};

	_primweapon = primaryWeapon player;
	_secweapon = secondaryWeapon player;

	if(!(_primweapon in _weapons) && _primweapon != "") then {
		_weapons set [(count _weapons), _primweapon];
	};

	if(!(_secweapon in _weapons) && _secweapon != "") then {
		_weapons set [(count _weapons), _secweapon];
	};

	dayz_myBackpack = unitBackpack player;
	_newBackpackType = (typeOf dayz_myBackpack);
	if(_newBackpackType != "") then {
		_backpackWpn = getWeaponCargo unitBackpack player;
		_backpackMag = getMagazineCargo unitBackpack player;
	};

	_currentWpn = currentWeapon player;
	_muzzles = getArray(configFile >> "cfgWeapons" >> _currentWpn >> "muzzles");
	if (count _muzzles > 1) then {
		_currentWpn = currentMuzzle player;
	};

	_display = findDisplay 106;
	_display closeDisplay 0;

	_oldUnit = player;

	_group = createGroup west;
	_newUnit = _group createUnit [_class,getMarkerPos "respawn_west",[],0,"NONE"];

	_newUnit setDir _dir;

	{_newUnit removeMagazine _x;} forEach magazines _newUnit;
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

	if(_primweapon != (primaryWeapon _newUnit)) then {
		_newUnit addWeapon _primweapon;
	};

	if(_secweapon != (secondaryWeapon _newUnit) && _secweapon != "") then {
		_newUnit addWeapon _secweapon;
	};

	if (!isNil "_newBackpackType") then {
		if (_newBackpackType != "") then {
			_newUnit addBackpack _newBackpackType;
			dayz_myBackpack = unitBackpack _newUnit;

			_backpackWpnTypes = [];
			_backpackWpnQtys = [];
			if (count _backpackWpn > 0) then {
				_backpackWpnTypes = _backpackWpn select 0;
				_backpackWpnQtys = _backpackWpn select 1;
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
				_backpackmagQtys = _backpackMag select 1;
			};
			_countr = 0;
			{
				dayz_myBackpack addmagazineCargoGlobal [_x,(_backpackmagQtys select _countr)];
				_countr = _countr + 1;
			} forEach _backpackmagTypes;
		};
	};

	addSwitchableUnit _newUnit;
	setPlayable _newUnit;
	selectPlayer _newUnit;
	_createSafePos = getMarkerPos "respawn_west";
	_rndx = floor(random 100);
	_rndy = floor(random 100);
	_oldUnit setPosATL [(_createSafePos select 0) + _rndx, (_createSafePos select 1) + _rndy, 0];
	_newUnit setPosATL _position;
	removeAllWeapons _oldUnit;
	{_oldUnit removeMagazine _x;} forEach magazines _oldUnit;
	if !(isNull _oldUnit) then {deleteVehicle _oldUnit;};
	if(_currentWpn != "") then {_newUnit selectWeapon _currentWpn;};
	[objNull, player, rSwitchMove,_currentAnim] call RE;
	player disableConversation true;
	call dayz_meleeMagazineCheck;
	{player reveal _x} forEach (nearestObjects [getPosATL player, ["AllVehicles","WeaponHolder","Land_A_tent","BuiltItems"], 75]);
	 player addMPEventHandler ["MPHit", {_this spawn fnc_plyrHit;}];
	 s_ccmenu = player addaction ["Command Menu","menu\showmenu.sqf","",5,false,true,"",""];