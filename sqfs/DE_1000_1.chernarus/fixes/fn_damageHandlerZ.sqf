private ["_damage"];

_zed = _this select 0;
_selection = _this select 1;
_damage = _this select 2;
_hitter = _this select 3;
_projectile = _this select 4;

if (local _zed) then {
	if (_damage > 1 and _projectile != "") then {
		if (!(_zed getVariable["once",false])) then {
			_zed setVariable["once",true];
			_zStreak = ((_hitter getVariable["zStreak",0]) + 1);
			_hitter setVariable["zStreak",_zStreak,true];
			switch (_zStreak) do
			{
				case 5:
				{
					[_hitter,25] call player_humanityChange;
				};
			
				case 10:
				{
					[_hitter,75] call player_humanityChange;
				};
				case 25:
				{
					[_hitter,250] call player_humanityChange;
				};
				case 50:
				{
					[_hitter,750] call player_humanityChange;
				};
				case 100:
				{
					[_hitter,3000] call player_humanityChange;
				};
				case 200:
				{
					[_hitter,8000] call player_humanityChange;
				};			
			};
		};
		switch (_selection) do {
			case "head_hit": {
				if (!(_zed getVariable["hitRegistered",false])) then {
					_zed setVariable["hitRegistered",true];
				};
			};
		};
		if (_projectile isKindOf "Bolt") then {
			_damageOrg = _hitter getVariable["firedDamage",0];
			if (_damageOrg < _damage) then {
				_hitter setVariable["firedHit",[_zed,_selection],true];
				_hitter setVariable["firedDamage",_damage,true];
			};
		};
	};
};
_damage