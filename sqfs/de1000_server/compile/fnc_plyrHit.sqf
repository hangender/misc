
private ["_victim", "_attacker","_weapon","_distance","_victimPlayerID","_attakerPlayerID","_wpst"];
_victim = _this select 0;
_attacker = _this select 1;

diag_log(format["VICTIM: %1 - ATTACKER: %2", _victim, _attacker]);


if (!isPlayer _victim) exitWith {};
if ((name _victim) == (name _attacker)) exitWith {};

_wpst = weaponState _attacker;
_weapon = switch (true) do {
case ((vehicle _attacker) != _attacker) : { format ["%1",getText(configFile >> "CfgVehicles" >> (typeOf (vehicle _attacker)) >> "displayName")] };
case (_wpst select 0 == "Throw") : { format ["%1", _wpst select 3] };
case (["Horn", currentWeapon _attacker] call fnc_inString) : {str((getposATL _attacker) nearEntities [["Air", "LandVehicle", "Ship"],5])};
case ((_wpst select 0 == "") AND {(_wpst select 4 == 0)}) : { format ["%1", primaryWeapon _attacker] };
case (_wpst select 0 != "") : { format ["%1", _wpst select 0] };
default { format ["%1",(typeOf (vehicle _attacker))] };
};

_distance = _victim distance _attacker;

_victim setVariable["AttackedBy", _attacker, true];
_victim setVariable["AttackedByName", (name _attacker), true];
_victim setVariable["AttackedByWeapon", _weapon, true];
_victim setVariable["AttackedFromDistance", _distance, true];
