#line 1 "z\addons\deathly_breakingpoint_server\compile\disco_functions_med.sqf"
scriptName "Functions\misc\fn_damageHandler.sqf";





private ["_unit","_humanityHit","_myKills","_isBandit","_hit","_damage","_isPlayer","_unconscious","_wound","_isHit","_isInjured","_type","_hitPain","_isCardiac","_evType","_recordable","_inVehicle","_isHeadHit","_isMinor","_scale","_canHitFree","_id","_key","_rndPain","_rndInfection","_hitInfection","_lowBlood","_source","_ammo","_characterID"];
diag_log ("DAMAGE: " + str(_this));
_unit = (_this select 0) select 0;
_hit = (_this select 0) select 1;
_damage = (_this select 0) select 2;
_unconscious = _unit getVariable ["NORRN_unconscious", false];
_source = (_this select 0) select 3;
_ammo = (_this select 0) select 4;
_type = [_damage,_ammo] call fnc_usec_damageType;
_isMinor = (_hit in USEC_MinorWounds);
_isHeadHit = (_hit == "head_hit");
_inVehicle = (vehicle _unit != _unit);
_evType = "";
_recordable = false;
_isPlayer = true;
_humanityHit = 0;
_myKills = 0;
_characterID = _unit getVariable ["CharacterID","0"];

if (_characterID == "0") exitWith
{
diag_log("handleDamage EH: CharacterID is 0");
};







if (_hit == "") then {
if (_source != _unit) then {
_canHitFree = 	_unit getVariable ["freeTarget",false];
_isBandit = 	(typeOf _unit) == "Bandit1_DZ" or (typeOf _unit) == "SuperBandit_DZ";
if (!_canHitFree and !_isBandit) then {
_myKills = 		200 - (((_unit getVariable ["humanKills",0]) / 30) * 100);

_humanityHit = -(_myKills * _damage);
_id = [_source,_humanityHit] spawn {					
dayzHumanity = [_this select 0,_this select 1,30];
publicVariable "dayzHumanity";
};
};
};
};


_scale = 200;
if (_damage > 0.4) then {
if (_ammo != "zombie") then {
_scale = _scale + 50;
};
if (_isHeadHit) then {
_scale = _scale + 500;
};
if (_source == _unit) then {
_scale = _scale + 800;
if (_isHeadHit) then {
_scale = _scale + 500;
};
};
switch (_type) do {
case 1: {_scale = _scale + 200};
case 2: {_scale = _scale + 200};
};




r_player_blood = r_player_blood - (_damage * _scale);

};


if (_hit in USEC_MinorWounds) then {
if (_ammo == "zombie") then {
if (_hit == "legs") then {
[_unit,_hit,(_damage / 6)] call object_processHit;
} else {
[_unit,_hit,(_damage / 4)] call object_processHit;
};
} else {;
[_unit,_hit,(_damage / 2)] call object_processHit;
};
if (_ammo == "") then {
[_unit,_hit,_damage] call object_processHit;
};
};






if (_damage > 0.1) then {
_unit setVariable["medForceUpdate",true,true];
};
if (_damage > 0.4) then {	


		
_wound = _hit call fnc_usec_damageGetWound;
_isHit = _unit getVariable[_wound,false];
_rndPain = 		(random 10);
_rndInfection = (random 1000);
_hitPain = 		(_rndPain < _damage);
if ((_isHeadHit) or (_damage > 1.2 and _hitPain)) then {
_hitPain = true;
};
_hitInfection = (_rndInfection < 1);

if (_isHit) then {

r_player_blood = r_player_blood - 50;
};
if (_hitInfection) then {

r_player_infected = true;
player setVariable["USEC_infected",true,true];

};
if (_hitPain) then {

r_player_inpain = true;
player setVariable["USEC_inPain",true,true];
};
if ((_damage > 0.5) and _isHeadHit) then {
if (_characterID != "0") then 
{
_key = format["CHILD:202:%1:%2:",_characterID,0];
_key call server_hiveWrite;
} 
else 
{
deleteVehicle _newObject;
};
};
};
if(!_isHit) then {

_unit setVariable[_wound,true,true];
[_unit,_wound,_hit] spawn fnc_usec_damageBleed;
usecBleed = [_unit,_wound,_hit];
publicVariable "usecBleed";


_isInjured = _unit getVariable["USEC_injured",false];
if (!_isInjured) then {
_unit setVariable["USEC_injured",true,true];
if (_ammo != "zombie") then {
dayz_sourceBleeding = _source;
};
};

_lowBlood = _unit getVariable["USEC_lowBlood",false];
if (!_lowBlood) then {
_unit setVariable["USEC_lowBlood",true,true];
};
r_player_injured = true;
};
if (_type == 1) then {


		
if (_damage > 0.01) then {

[20,45] call fnc_usec_pitchWhine; 
};
if (_damage > 1) then {

if (_characterID != "0") then 
{
_key = format["CHILD:202:%1:%2:",_characterID,0];
_key call server_hiveWrite;
} 
else 
{
deleteVehicle _newObject;
};
} else {
if (_damage > 2) then {
_isCardiac = _unit getVariable["USEC_isCardiac",false];
if (!_isCardiac) then {
_unit setVariable["USEC_isCardiac",true,true];
r_player_cardiac = true;
};
};
};
};
if (_type == 2) then {



if (_damage > 1) then {

if (_characterID != "0") then 
{
_key = format["CHILD:202:%1:%2:",_characterID,0];
_key call server_hiveWrite;
} 
else 
{
deleteVehicle _newObject;
};
} else {
if (_damage > 2) then {
_isCardiac = _unit getVariable["USEC_isCardiac",false];
if (!_isCardiac) then {
_unit setVariable["USEC_isCardiac",true,true];
r_player_cardiac = true;
};
};
};
};

if (!_unconscious and !_isMinor and ((_damage > 2) or ((_damage > 0.5) and _isHeadHit))) then {

[_unit,_damage] call fnc_usec_damageUnconscious;
};