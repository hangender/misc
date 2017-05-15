// reliable killmessages 8/7/2013 by darn
fn_onDamage =
{
	if (isNil "kmsg_victimName") then
	{
		kmsg_victimName = name (_this select 0);
	};
	kmsg_killer = _this select 3;
};

fn_onKilledSleep =
{	
	sleep 1;
	
	private ["_victim", "_killer", "_isVehicle", "_vehicle", "_victimName", "_message", "_killedWithName", "_weapon"];

	_victim = _this select 0;
	_killer = kmsg_killer;
	
	if (_killer isKindOf "Air" || _killer isKindOf "LandVehicle" || _killer isKindOf "Boat") then
	{
		_isVehicle = true;
		_vehicle = _killer;
		_killer = gunner _vehicle;
	}
	else
	{
		_isVehicle = false;
	};

	if (isPlayer(_killer)) then
	{
		if (isNil "kmsg_victimName") then
		{
			_victimName = name _victim;
		}
		else
		{
			_victimName = kmsg_victimName;
		};
		
		if (_killer == _victim) then
		{
			_message = "killed himself";
		}
		else
		{
			_killedWithName = "";
			
			if (_isVehicle) then
			{
				_killedWithName = getText(configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");
				
				if (_killedWithName == "") then
				{
					_killedWithName = typeOf _vehicle;
				};
			}
			else
			{
				_weapon = _killer getVariable ["currentWeapon", ""];	
				_killedWithName = getText(configFile >> "CfgWeapons" >> _weapon >> "displayName");
				
				if (_killedWithName == "") then
				{
					_killedWithName = _weapon;
				};
			};
			
			_message = format["killed %1 with %2", _victimName, _killedWithName];
		};
		
		clientSendKillMsg = [_killer, _message];
		publicVariableServer "clientSendKillMsg";	
	};
};

fn_onKilled =
{	
	_this spawn fn_onKilledSleep;
};

waitUntil {!(isNil "fnc_usec_damageHandle")};
fnc_usec_damageHandle =
{
	private["_unit","_eh"];
	_unit = _this select 0;
	mydamage_eh1 = _unit addEventHandler ["HandleDamage",{_this call fnc_usec_damageHandler;_this call DDOPP_taser_handleHit;_this call fn_onDamage;0} ];
	mydamage_eh2 = _unit addEventHandler ["Fired", {_this call player_fired;}];
	mydamage_eh3 = _unit addEventHandler ["Killed", {_this call fn_onKilled;_id = [] spawn player_death;}];
};

fn_getCurrentWeapon =
{
	private ["_ret", "_weaponState"];
	
	_ret = "";
	
	_weaponState = weaponState player;
	sleep 1;
	
	if (_weaponState select 0 == "Throw") then 
	{
		_ret = _weaponState select 3;
	}
	else
	{
		_ret = _weaponState select 0;
	};
	
	_ret;
};

fn_trackWeapon =
{
	private ["_currentWeapon", "_lastValidWeapon"];
		
	_currentWeapon = "";
	_lastValidWeapon = "";
		
	while {alive player} do
	{
		_currentWeapon = "";
		
		// try method 1
		_currentWeapon = call fn_getCurrentWeapon;	

		// try method 2
		if (_currentWeapon == "") then
		{
			_currentWeapon = currentWeapon player;
		};
		sleep 1;
		
		if (_currentWeapon != "") then
		{	
			if(_lastValidWeapon != _currentWeapon) then
			{
				_lastValidWeapon = _currentWeapon;
				player setVariable ["currentWeapon", _currentWeapon, true];
			};
		};	
		sleep 1;
	};
};

[] spawn fn_trackWeapon;