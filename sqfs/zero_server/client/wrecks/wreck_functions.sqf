#line 1 "z\addons\zero_server\client\wrecks\wreck_functions.sqf"

client_spawnWreckEffects =
{
[] spawn local_spawnFire;
};

local_spawnFire =
{
{
[_x, 2] call local_spawnFireForObject;
} forEach zeroWrecks;
};

local_spawnFireForObject =
{
private ["_type","_intensity","_crashes"];

_type = _this select 0;
_intensity = _this select 1;

_crashes = allMissionObjects _type;

{
dayzFire = [_x,_intensity,0,false,false];
dayzFire spawn BIS_Effects_Burn;
} forEach _crashes;
};
