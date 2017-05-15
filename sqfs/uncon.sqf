testIndex  = _this select 1;
_thePlayer = _this select 2;
hint format ["%1 is now unconscious", _theplayer];
_unc = format ["if (name player == '%1') then
{
	[player, 9001] spawn {
			private[""_unit"",""_damage""];
			_unit = _this select 0;
			_damage = _this select 1;
			_inVehicle = (vehicle _unit != _unit);
			if (_unit == player) then {
				r_player_timeout = 999999999999;
				if (_type == 1) then {r_player_timeout = r_player_timeout + 90};
				if (_type == 2) then {r_player_timeout = r_player_timeout + 60};
				r_player_unconscious = true;
				player setVariable[""medForceUpdate"",true,true];
				player setVariable [""unconsciousTime"", r_player_timeout, true];
			};
			if (_inVehicle) then {
				_unit spawn {
					private[""_veh"",""_unit""];
					_veh = vehicle _this;
					_unit = _this;
					waitUntil{(((position _veh select 2 < 1) and (speed _veh < 1)) or (!r_player_unconscious))};
					if (r_player_unconscious) then {
						_unit action [""eject"", _veh];
						waitUntil{((vehicle _this) != _this)};
						sleep 1;
						_unit setVariable [""NORRN_unconscious"", true, true];
						_unit playActionNow ""Die"";
					};
				};
			} else {
				_unit setVariable [""NORRN_unconscious"", true, true];
				_unit playActionNow ""Die"";
			};
		};
};", _theplayer];
[_unc] execVM "Scripts\exec.sqf";