_obj = 			_this select 0;
_type = 		typeOf _obj;
_config = 		missionConfigFile >> "CfgBuildingLoot" >> _type;
_canLoot = 		isClass (_config);
_originalPos = 	getPosATL _obj;
_fastRun = false;
_maxControlledZombies = round(dayz_maxLocalZombies);
_enabled = false;

if (_canLoot) then {
	//Get zombie class
	_unitTypes = 	getArray (_config >> "zombieClass");
	_min = 			getNumber (_config >> "maxRoaming");
	_max = 			getNumber (_config >> "minRoaming");
	_zombieChance =	getNumber (_config >> "zombieChance");

	_num = (round(random _max)) max _min; // + round(_max / 3);
	for "_i" from 0 to _num do
	{
		//_iPos = _obj modelToWorld _originalPos;
		if ((dayz_spawnZombies < _maxControlledZombies) and (dayz_CurrentNearByZombies < dayz_maxNearByZombies) and (dayz_currentGlobalZombies < dayz_maxGlobalZeds)) then {
			[_originalPos,true,_unitTypes] call zombie_generate;
			if (!_fastRun) then {
				sleep 0.1;
			};
		};
	};

	//Add Internal Zombies
	if (_zombieChance > 0) then {
		_clean = {alive _x} count ((getPosATL _obj) nearEntities ["zZombie_Base",(sizeOf _type)]) == 0;
		if (_clean) then {
			_positions =	getArray (_config >> "zedPos");
			{
				_Pos = [_x select 0, _x select 1, 0];
				_rnd = random 1;
				if (_rnd < _zombieChance) then {
					_iPos = _obj modelToWorld _Pos;
					_nearByZed = {alive _x} count (_iPos nearEntities ["zZombie_Base",(((sizeOf _type) * 2) + 10)]) > 0;
					_nearByPlayer = ({isPlayer _x} count (_iPos nearEntities ["CAManBase",30])) > 0;
					//diag_log ("BUILDING: " + _type + " / " + str(_nearByZed) + " / " + str(_nearByPlayer));
					if ((dayz_spawnZombies < _maxControlledZombies) and (dayz_CurrentNearByZombies < dayz_maxNearByZombies) and (dayz_currentGlobalZombies < dayz_maxGlobalZeds)) then {
						if (!_nearByPlayer and !_nearByZed) then {
							[_iPos,false,_unitTypes] call zombie_generate;
						};
					};
				};
			} forEach _positions;
		};
	};
};
