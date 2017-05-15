waitUntil {sleep 0.25;(!isNil "PVDZ_plr_LoginRecord")};

waitUntil {sleep 0.25;(!isNil 'dayz_Totalzedscheck') || (!isNil 'dayz_locationCheck') || (!isNil 'dayzplayerlogin') || (!isNil 'dayz_animalcheck')};

update_tags = {

	{

		clearGroupIcons group _x;

		if (((getPlayerUID _x) in tag_friendlies)) then {

			group _x addGroupIcon ["x_art"];

			group _x setGroupIconParams [[1, 0, 1 , 1], format ["%1", name _x], 0.7, true];

		};

	} forEach entities "AllVehicles";

	systemChat("DE 1000 > Updating tags...");

};

setGroupIconsVisible [true, true];

tag_friendlies = [];

tag_req = [];

tag_rec = [];

"PVCDZ_tagFriend"		addPublicVariableEventHandler {

	_uid = ((_this select 1) select 0);

	_name = ((_this select 1) select 1);

	_oid = ((_this select 1) select 2);

	if (_uid in tag_friendlies) then {

		titleText [format["%1 has tagged you again",_name], "PLAIN DOWN", 3];

		_myoid = ((_this select 1) select 3);

		PVCDZ_tagFriend = [(getPlayerUID player), (name player), _myoid];

		_oid publicVariableClient "PVCDZ_tagFriend";

	}

	else {

		if (_uid in tag_req) then {

			titleText [format["%1 is now tagged as friend",_name], "PLAIN DOWN", 3];

			tag_friendlies = tag_friendlies + [_uid];

			[] spawn update_tags;

		} else {

				titleText [format["%1 wants to tag you as friend",_name], "PLAIN DOWN", 3];

				tag_rec = tag_rec + [_uid];

		};

	};

};

iamanowner = false;

ownerpos = [];

private["_safes","_safeowner","_found","_myuid"];

_safes = ([6800, 9200, 0] nearObjects ["TKOrdnanceBox_EP1", 15000]);

_found = false;

{

	_safeowner = [];

	_safeowner = _x getVariable "YouSuck";

	if (!((getPlayerUID player) in _safeowner)) then {

		_x hideObject true;

	}

	else {

		tag_friendlies = tag_friendlies + _safeowner;

		if (!_found) then {

			iamanowner = true;

			ownerpos = (getPos _x);

			systemChat("DE 1000 > VIP System > Safe Access granted");

			_found = true;

		};

	}; 

} forEach _safes;

if (_found) then {

	_myuid = (getPlayerUID player);

	while {(_myuid in tag_friendlies)} do {

		tag_friendlies = tag_friendlies - [_myuid];

	}; 

};

if (iamanowner) then {

	[] spawn update_tags;

};

[] spawn {

	private["_allsafes","_nearsafes","_safeowners"];

	waitUntil { sleep 0.5; !isNull (findDisplay 106) };

	_nearsafes = nearestObjects [(getPos player), ["TKOrdnanceBox_EP1"], 15];

	if (count _nearsafes >= 1) then {

		_safeowners = (_nearsafes select 0) getVariable "YouSuck";

		if !((getPlayerUID player) in _safeowners) then {

			(findDisplay 106) closeDisplay 1;

			(findDisplay 106) closeDisplay 2;

			(_nearsafes select 0) hideObject true;

		};

	};

	_allsafes = ([6800, 9200, 0] nearObjects ["TKOrdnanceBox_EP1", 15000]);

	{

		_safeowners = [];

		_safeowners = _x getVariable "YouSuck";

		if (!((getPlayerUID player) in _safeowners)) then {_x hideObject true;};

	} forEach _allsafes;

};

private["_allveh"];

_allveh = ([6800, 9200, 0] nearEntities ["AllVehicles", 15000]);

{

	if (_x isKindOf "SUV_TK_CIV_EP1") then {

		_x setobjecttexture [0,'#(argb,1,1,1)color(1,1,1,1)'];	

	};

	if (_x isKindOf "datsun1_civil_1_open") then {

		_x setobjecttexture [0,'#(argb,1,1,1)color(0.01,0.15,0.01,1)'];	

	};

	if (_x isKindOf "hilux1_civil_1_open") then {

		_x setobjecttexture [0,'#(argb,1,1,1)color(1,1,0,1)'];	

	};

} forEach _allveh;



[] spawn {

	private["_tag","_humEnemy","_prevTarget"];

	sleep 5;

	if ((player getVariable["humanity",0]) > -2500) then {

		while{true} do {

			if ((isPlayer cursorTarget) && (alive cursorTarget) && (side cursorTarget == side player)) then {

				_humEnemy = (cursorTarget getVariable["humanity",0]);

				if (_humEnemy != 0) then {

					if (_humEnemy <= -2500) then {_tag = "Bandit";} 

					else {if (_humEnemy >= 5000) then {_tag = "Hero";} 

					else {_tag = "Survivor";};};

					if (_prevTarget == cursorTarget) then {cutText [_tag,"PLAIN",0.05];};

					_prevTarget = cursorTarget;	

				};

			} else {_prevTarget = nil;};

		sleep 0.5;

		};

	};

};



[] spawn {

	private["_debug","_charPos","_debugThread","_debugThread2","_DEBUG_EH","_mrkr"];

	private["_garages","_gates","_owners","_found"];

	private["_owner","_vec","_crew","_dontmove"];

	private ["_currentVehicle", "_isNearFeed", "_countFuel"];

	private ["_vehicle", "_vehicle_refuel_id"];



	_vehicle = objNull;

	_distance = 15; 

	_amount = 0.05; 



	onceInDebug = false;

	_found = false;

	handledGarages = [];

	while {true} do {

		sleep 5;

		_charPos = getPosATL (vehicle player);

		_debug = getMarkerpos "respawn_west";

		deleteMarkerLocal "You";

		_mrkr = createMarkerLocal ["You", (getPos player)];

		_mrkr setMarkerTypeLocal "DestroyedVehicle";

		_mrkr setMarkerColorLocal "ColorRed";

		_mrkr setMarkerSizeLocal [1.8, 1.8];

		

		if ((_debug distance _charPos) < 2500) then {

			if (!onceInDebug) then {

				onceInDebug = true;

				_debugThread = [] spawn {

					while { true } do {

						waitUntil { !isNull (findDisplay 106) };

						(findDisplay 106) closeDisplay 1;

						(findDisplay 106) closeDisplay 2;

						waitUntil { isNull (findDisplay 106) };		

					};

				};

				_debugThread2 = [] spawn {

					sleep 10;

					_charPos = getPosATL (vehicle player);

					_debug = getMarkerpos "respawn_west";

					if ((_debug distance _charPos) < 2500) then {

						endMission 'END1';

					};

				};

			_DEBUG_EH = player addEventHandler ["Fired", {nearestObject [_this select 0,_this select 4] setPos[0,0,0];}];			

			};

		} else {

			if (onceInDebug) then {

				terminate _debugThread; 

				terminate _debugThread2; 

				player removeEventHandler ["Fired", _DEBUG_EH];

				onceInDebug = false;

			};

		};

		

		_garages = getPos player nearObjects ["Land_sara_hasic_zbroj",150];

		if (count _garages > 1) then {

			_gates = [];

			{if ((_x getVariable "h3h3") == 1) then { _gates = _gates + [_x];}; } forEach _garages;

			{

			_owners = (_x getVariable "diff");

			if ((getPlayerUID player) in _owners) then {

				_x hideObject true;

				_zombies = (getpos player) nearEntities ["zZombie_Base",25];

				{deleteVehicle _x;} forEach _zombies;

				if (!_found) then {

					systemChat("DE 1000 > VIP System > House Access granted");

					_found = true;

				};

			} else {

				if (!(_x in handledGarages)) then {

					handledGarages = handledGarages + [_x];

					[_x] execVM "addons\SHK_pos\shk_pos_fnc_getposrotate.sqf";

				};

			};

			} forEach _gates;

		};

		if (vehicle player != player) then {

			_vec = (vehicle player);

			if (_vec isKindOf "UH1H_DZ2") then {

				_owner = [];

				_owner = _vec getVariable "owner";

				if ((count _owner) > 0) then {

					if (!((getPlayerUID player) in _owner)) then {

						_crew = crew _vec;

						_dontmove = false;

						{ if ((getPlayerUID _x) in _owner) then { _dontmove = true;}; } forEach _crew;

						if (!_dontmove) then {

							cutText ["You are not allowed to enter this vehicle","PLAIN",3];

							systemChat("DE 1000 > VIP System > Get your own private chopper at www.DE-1000.de.vu");

							moveOut player;

						};

					}; 

				};

			};	

		};

		_currentVehicle = vehicle player;

		_countFuel = (count ((position _currentVehicle) nearObjects ["Land_Fuel_tank_big", _distance]));

		_countFuel = _countFuel + (count ((position _currentVehicle) nearObjects ["Land_A_FuelStation_Feed", _distance]));

		_countFuel = _countFuel + (count ((position _currentVehicle) nearObjects ["Land_Ind_TankSmall", _distance]));

		_countFuel = _countFuel + (count ((position _currentVehicle) nearObjects ["Land_Ind_TankSmall2", _distance]));

		_countFuel = _countFuel + (count ((position _currentVehicle) nearObjects ["Land_Ind_TankSmall2_EP1", _distance]));

		_countFuel = _countFuel + (count ((position _currentVehicle) nearObjects ["Land_fuel_tank_stairs", _distance]));

		_isNearFeed = _countFuel > 0;

		if (_vehicle != _currentVehicle) then {

			if (!isNull _vehicle) then {

			_vehicle removeAction _vehicle_refuel_id;

			_vehicle = objNull;

			};

		 if (_currentVehicle != player && _isNearFeed && !(_currentVehicle isKindof "Bicycle")) then {

				_vehicle = _currentVehicle;

				_vehicle_refuel_id = _vehicle addAction ["Refuel", "actions\kh_vehicle_refuel.sqf", [_amount], -1, false, true, "", "vehicle _this == _target && local _target"];

			};

		};

		if (!_isNearFeed) then {

			_vehicle removeAction _vehicle_refuel_id;

			_vehicle = objNull;

		};

	}; 



};