#line 1 "z\addons\zero_server\client\medical\medical_functions.sqf"

zero_playerDamage =
{
private["_unit"];

_unit = _this;
zerodamage_eh1 = _unit addEventHandler ["HandleDamage",{_this call zero_damageHandler;}];
zerodamage_eh2 = _unit addEventHandler ["Fired", {_this call player_fired;}];
zerodamage_eh3 = _unit addEventHandler ["Killed", {[_this select 1,"killeh"] spawn player_zero_death;}];
zerodamage_eh4 = _unit addEventHandler ["FiredNear", {_this call player_weaponFiredNear;}];
};

zero_damageHandler =
{
private ["_hit","_damage","_source","_ammo","_isMinor","_isHeadHit","_scale","_wound","_isHit","_rndPain","_hitPain","_bloodLost","_isDead","_isInjured","_lowBlood","_blood"];

_hit = _this select 1;
_damage = _this select 2;
_source = _this select 3;
_ammo = _this select 4;
_isMinor = (_hit in USEC_MinorWounds);
_isHeadHit = (_hit == "head_hit");
_scale = 200;

if (_isMinor) then
{
[player,_hit,(_damage / 2)] call object_processHit;

if (_ammo == "") then
{
[player,_hit,_damage] call object_processHit;
};
};

if (_damage > 0.1) then
{
1 call fnc_usec_bulletHit;

_wound = _hit call fnc_usec_damageGetWound;
_isHit = player getVariable [_wound,false];
_rndPain = (random 10);
_hitPain = (_rndPain < _damage);

if (_isHit) then
{
r_player_blood = r_player_blood - 50;
};

if ((_isHeadHit) or (_damage > 1.2 and _hitPain)) then
{
_hitPain = true;
_scale = _scale + 500;
};

if ((isPlayer _source) and (player != _source)) then
{
_scale = _scale + 800;
gotHitUID = getPlayerUID _source;
gotHitWeapon = currentWeapon _source;

if (_isHeadHit) then
{
_scale = _scale + 500;
};
};

_bloodLost = (_damage * _scale);
r_player_blood = r_player_blood - _bloodLost;
if (_bloodLost > 10000) then
{
zeroReportDamage = [zero_playerUID,gotHitUID,gotHitWeapon,_damage,_scale,_ammo];
publicVariableServer "zeroReportDamage";
};

if (_hitPain) then
{
r_player_inpain = true;
player setVariable["USEC_inPain",true,true];
};

if ((_damage > 1.5) and _isHeadHit) then
{
player setDamage 1;
[_source,"shothead"] spawn player_zero_death;

_isDead = player getVariable ["zero_isDead",false];
if (!_isDead) then
{
player setVariable ["zero_isDead",true,true];
};
};

if(!_isHit) then
{
player setVariable [_wound,true,true];
[player,_wound,_hit] spawn fnc_usec_damageBleed;
medBleed = [player,_wound,_hit];
publicVariable "medBleed";

_isInjured = player getVariable ["USEC_injured",false];
if (!_isInjured) then
{
player setVariable["USEC_injured",true,true];
dayz_sourceBleeding = _source;
};

_lowBlood = player getVariable ["USEC_lowBlood",false];
if (!_lowBlood) then
{
player setVariable["USEC_lowBlood",true,true];
};
r_player_injured = true;
};
};

if (!r_player_unconscious and !_isMinor and ((_damage > 2) or ((_damage > 0.5) and _isHeadHit))) then
{
[player,_damage] call fnc_usec_damageUnconscious;
};

if (r_player_blood <= 0) then
{
player setDamage 1;
[_source,"wound"] spawn player_zero_death;

_isDead = player getVariable ["zero_isDead",false];
if (!_isDead) then
{
player setVariable ["zero_isDead",true,true];
};

_blood = player getVariable ["zero_Blood",r_player_blood];
if ((_blood >= 0) and (_blood != r_player_blood)) then
{
player setVariable ["zero_Blood",r_player_blood,true];
};
};
};
