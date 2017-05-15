/*
	  Breaking Point Login Thread & Cleanup
		Created By Deathlyrage
*/
private ["_myGroupX","_safety","_lastUpdate","_lastZombieCheck","_lastNeedUpdate","_lastDeadCheck","_lastFPSCleanup","_lastBanUpdate","_lastItemCheck"];

if (hasInterface) exitWith {};
if (!isDedicated) exitWith {};
if (!isServer) exitWith {};

waitUntil {!(isNil "sm_done")};

/*
	Inital Variables
*/
_safety = dayz_serverObjectMonitor;
_lastUpdate = diag_tickTime;
_lastZombieCheck = diag_tickTime;
_lastNeedUpdate = diag_tickTime;
_lastDeadCheck = diag_tickTime;
_lastFPSCleanup = diag_tickTime;
_lastBanUpdate = diag_tickTime;
_lastItemCheck = diag_tickTime;

while {isServer} do {
	/*
			Time Sync
	*/
	if (((diag_tickTime - _lastUpdate) > 300)) then
	{
		_lastUpdate = diag_tickTime;
		private ["_date","_dateNum","_diff","_result","_outcome"];
		_result = "CHILD:307:" call server_hiveReadWrite;
		_outcome = _result select 0;
		if(_outcome == "PASS") then {
			_date = _result select 1; 
			_dateNum = dateToNumber(_date); 
			_diff = ( _dateNum - dateToNumber (date) )*365*24*60;
			if ( abs(_diff)>5 ) then {
				setDate _date;
				dayzSetDate = _date;
				publicVariable "dayzSetDate";
			};
		};
	};
	/*
			Update Objects
	*/
	if ((count needUpdate_objects) > 0 && (diag_tickTime -_lastNeedUpdate>40)) then
	{
		_lastNeedUpdate = diag_tickTime;
		{
			needUpdate_objects = needUpdate_objects - [_x];
			[_x,"all"] call server_updateObject;

		} forEach needUpdate_objects;
	};
	/*
			Update Banned Players
	*/
	if (((diag_tickTime - _lastBanUpdate) > 300)) then
	{
		_lastBanUpdate = diag_tickTime;
		call server_UpdateBans;
	};
	/*
			Dead Body Cleanup
	*/
	if ((diag_tickTime - _lastDeadCheck) > 60) then {
		_lastDeadCheck = _diag_tickTime;
		private ["_modeldex","_myGroupX"];
		
		//Cleanup Dead Bodies
		{
			_modeldex = typeOf _x;
			_myGroupX = group _x;

			if (_x isKindOf "zZombie_Base") then {
				_x removeAllMPEventHandlers "mpkilled";
				_x removeAllMPEventHandlers "mphit";
				_x removeAllMPEventHandlers "mprespawn";
				_x removeAllEventHandlers "FiredNear";
				_x removeAllEventHandlers "HandleDamage";
				_x removeAllEventHandlers "Killed";
				_x removeAllEventHandlers "Fired";
				_x removeAllEventHandlers "GetOut";
				_x removeAllEventHandlers "Local";
				 clearVehicleInit _x; //let's clear all PICs
				deleteVehicle _x;
				deleteGroup _myGroupX;
				_x = nil;
			};

			if (_modeldex =="Survivor1_DZ") then { 
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
		} forEach allDead;
	};

	/*
			Entity Cleanup and Deletion
	*/
	if ((diag_tickTime - _lastZombieCheck) > 180) then {
		//Disable Animal Server Side Simulation
		_lastZombieCheck = diag_tickTime;
		{
			if (!(isPlayer _x)) then {
				_x enableSimulation false;
			} else {
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
		} forEach allMissionObjects "Animal";

		//Fix Players who are birds.
		{
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
		} forEach entities "Seagull";

		//Delete Hacker Boxes
		 {
			 if (((count ((getWeaponCargo _x) select 1))+(count ((getMagazineCargo _x) select 1))) > 80) then {
				clearVehicleInit _x;
				deleteVehicle _x;
				_x = nil;
			 };
		 } forEach allMissionObjects "All";

		//Disable Zombie Server Side Simulation
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
			} else {
				_x enableSimulation false;
			};

		} forEach entities "zZombie_Base";

		//Disable Bloodsucker Server Side Simulation
		{
			_x enableSimulation false;
			if ((local _x) or (isPlayer _x)) then {
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
		} forEach entities "Bloodsucker_Base";

		//Disable Infected Hound Server Side Simulation + Cleanup
		{
			_x enableSimulation false;
			if ((local _x) or (isPlayer _x)) then {
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
		} forEach entities "DZ_Pastor_Infected";
	};
	
	/*
			30 Min Cleanup
	*/
	if (((diag_tickTime - _lastItemCheck) > 1800)) then
	{
		_lastItemCheck = diag_tickTime;
		private ["_delQty","_keep","_nearby","_myGroupX","_delQtyAnimalR","_delQtyAnimal","_xtypeanimal","_missionObjs","_qty","_animaltype"];

		//Server Cleanup
		_missionObjs = allMissionObjects "WeaponHolder";
		_qty = count _missionObjs;
		{
			if (local _x) then {
				_keep = _x getVariable ["permaLoot",false];
						_nearby = {isPlayer _x} count (_x nearEntities [["CAManBase"], 100]);
				if ( (!_keep) && (_nearby==0) ) then {
					deleteVehicle _x;
					_x = nil;
				};
			};
		} forEach _missionObjs;

		_animaltype = [];
		{
			_xtypeanimal = typeof _x;
			if(_xtypeanimal=="Rabbit") then {
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
							clearVehicleInit _x; //let's clear all PICs
							deleteVehicle _x;
							deleteGroup _myGroupX;
							_x = nil;
			} else {
				_nearby = {isPlayer _x} count (_x nearEntities [AllPlayers, 100]);
				
				if (!(_xtypeanimal in _animaltype)) then { _animaltype set [(count _animaltype),(typeOf _x)]; };

				if (_nearby==0) then {
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
			};
		} forEach allMissionObjects "Animal";
	};
	/*
			Low Preformance Cleanup
	*/
	if (( diag_fps < 2) and (diag_tickTime-_lastFPSCleanup > 1800)) then
	{
		_lastFPSCleanup = diag_tickTime;
		private ["_myGroupX","_missionObjs"];
		//Clean All Dead
		{
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
			_myGroupX = nil;
		} forEach allDead;

		//Clean Up All Flies Sounds
		{
			deleteVehicle _x;
			_x = nil;
		} forEach allMissionObjects "Sound_Flies";

		//Clean All Local Zombies
		{
			if (local _x) then {
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
				_myGroupX = nil;
			};
		} forEach entities "zZombie_Base";

		//Clean All Local Bloodsuckers
		{
			if (local _x) then {
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
				_myGroupX = nil;
			};
		} forEach entities "Bloodsucker_Base";

		//Clean All Animals
		{
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
			_myGroupX = nil;
		} forEach allMissionObjects "Animal";

		_missionObjs = allMissionObjects "WeaponHolder";
		{
			deleteVehicle _x;
			_x = nil;
		} forEach _missionObjs;

		//Update Objects
		{
			needUpdate_objects = needUpdate_objects - [_x];
			[_x,"all"] call server_updateObject;

		} forEach needUpdate_objects;
	};
	/*
			Login Fixes
	*/
	//Player Groups Cleanup
	{
		if (count units _x==0) then {
			deleteGroup _x;
			_x = nil;
		};
	} forEach allGroups;
	
	//Process Login Queue
	call BPServer_LoginQueueProcess;
	
	dayz_serverObjectMonitor = _safety;

	sleep 5;
};