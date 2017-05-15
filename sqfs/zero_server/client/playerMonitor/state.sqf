#line 1 "z\addons\zero_server\client\playerMonitor\state.sqf"

private["_vel","_speed","_messTimer","_refObj","_size","_hunger","_thirst","_foodVal","_thirstVal","_result","_isDead","_lowBlood","_blood"];
disableSerialization;

dayz_myLoad = (((count (getMagazineCargo (unitBackpack player))) * 0.2) + (count (getWeaponCargo (unitBackpack player)))) +  (((count dayz_myMagazines) * 0.1) + (count dayz_myWeapons * 0.5));

_vel = 		velocity player;
_speed = 	round((_vel distance [0,0,0]) * 3.5);
_messTimer = 0;

_refObj = 	vehicle player;
_size = 	(sizeOf typeOf _refObj) * 0.6;
dayz_areaAffect = _size;

_hunger = +((((r_player_bloodTotal - r_player_blood) / r_player_bloodTotal) * 5) + _speed + dayz_myLoad) * 3;
if (time - dayz_panicCooldown < 120) then
{
_hunger = _hunger * 2;
};
dayz_hunger = dayz_hunger + (_hunger / 60);

_thirst = 2;
if (_refObj == player) then
{
_thirst = (_speed + 4) * 3;
};
dayz_thirst = dayz_thirst + (_thirst / 60);

_foodVal = 		dayz_statusArray select 0;
_thirstVal = 	dayz_statusArray select 1;
if (_thirstVal <= 0) then
{
_result = r_player_blood - 10;
if (_result < 0) then
{
player setDamage 1;

_isDead = player getVariable ["zero_isDead",false];
if (!_isDead) then
{
player setVariable ["zero_isDead",true,true];
};
[player,"dehyd"] spawn player_zero_death;
}
else
{
r_player_blood = _result;
};
};
if (_foodVal <= 0) then
{
_result = r_player_blood - 10;
if (_result < 0) then
{
player setDamage 1;

_isDead = player getVariable ["zero_isDead",false];
if (!_isDead) then
{
player setVariable ["zero_isDead",true,true];
};
[player,"starve"] spawn player_zero_death;
}
else
{
r_player_blood = _result;
};
};

_lowBlood = player getVariable ["USEC_lowBlood", false];
if ((r_player_blood < r_player_bloodTotal) and !_lowBlood) then
{
player setVariable["USEC_lowBlood",true,true];
};

_blood = player getVariable ["zero_Blood",r_player_blood];
if ((_blood >= 0) and (_blood != r_player_blood)) then
{
player setVariable ["zero_Blood",r_player_blood,true];
};

_messTimer = _messTimer + 1;
if (_messTimer > 10) then
{
_messTimer = 0;
player setVariable ["messing",[dayz_hunger,dayz_thirst],true];
};

"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, (r_player_blood/r_player_bloodTotal)],  [1, 1, 1, 0.0]];
"colorCorrections" ppEffectCommit 0;
