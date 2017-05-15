#line 1 "z\addons\zero_server\client\events\event_functions.sqf"

client_hasNilId =
{
private ["_debug"];

_debug = getMarkerPos "respawn_west";
player setPos _debug;

terminate dayz_gui;
terminate dayz_musicH;
terminate dayz_player_animalCheck;
terminate dayz_player_spawnCheck;
terminate dayz_player_locationCheck;
terminate dayz_player_zombieAggro;

terminate dayz_player_spawn_zero_statecheck;
terminate dayz_player_spawn_zero_varcheck;
terminate dayz_player_spawn_zero_savecheck;
terminate dayz_player_spawn_zero_medcheck;

player removeAllEventHandlers "HandleDamage";
player removeAllEventHandlers "Killed";
player removeAllEventHandlers "Fired";
player removeAllEventHandlers "FiredNear";

endMission "END1";
};


client_attachEventHandlers =
{
player addEventHandler ["Respawn", {player setDamage 1; player setVariable ["zero_isDead",true,true]; [player,"suicide"] spawn player_zero_death;}];

"zeroPlayerNilID" addPublicVariableEventHandler { (_this select 1) spawn client_hasNilId; };

{ _x call fnc_vehicleEventHandler; } forEach vehicles;
};

player_zero_death =
{
private ["_body","_array","_source","_method","_wasBandit","_humanity","_playerGroup"];

if (deathHandled) exitWith {};
deathHandled = true;
disableUserInput true;

_body =	player;
_array = _this;

zeroReportDeath = [dayz_characterID,dayz_playerUID];
publicVariableServer "zeroReportDeath";

if (count _array > 0) then
{
_source = _array select 0;
_method = _array select 1;
zeroReportKill = [zero_playerUID,gotHitUID,gotHitWeapon,_source,_method];
publicVariableServer "zeroReportKill";
_body setVariable ["deathType",_method,true];
if ((isPlayer _source) and (player != _source)) then
{
_wasBandit = ((_body getVariable ["humanity",0]) < -5000);
_humanity = 0;

if(_wasBandit) then
{
_humanity = 1000;
}
else
{
if ((currentWeapon _body) == "") then
{
_humanity = -2500;
}
else
{
_humanity = -1000;
};
};
dayzHumanity = [_source,_humanity,0];
publicVariable "dayzHumanity";
};
}
else
{
zeroReportKill = [zero_playerUID,gotHitUID,gotHitWeapon];
publicVariableServer "zeroReportKill";
_body setVariable ["deathType",wounds,true];
};

_body setVariable ["killPlayerUID",gotHitUID,true];
_body setVariable ["bodyName",dayz_playerName,true];

[player,50,true,(getPosATL player)] spawn player_alertZombies;
player spawn spawn_flies;

sleep 0.5;

0.1 fadeSound 0;

terminate dayz_gui;
terminate dayz_musicH;
terminate dayz_player_animalCheck;
terminate dayz_player_spawnCheck;
terminate dayz_player_locationCheck;
terminate dayz_player_zombieAggro;

terminate dayz_player_spawn_zero_statecheck;
terminate dayz_player_spawn_zero_varcheck;
terminate dayz_player_spawn_zero_savecheck;
terminate dayz_player_spawn_zero_medcheck;

"dynamicBlur" ppEffectEnable true;"dynamicBlur" ppEffectAdjust [4]; "dynamicBlur" ppEffectCommit 0.2;

"colorCorrections" ppEffectEnable true;
"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 0.01],  [1, 1, 1, 0.0]];
"colorCorrections" ppEffectCommit 1;

3 fadeSound 0;
0 cutText ["", "BLACK",10];

sleep 1;

TitleText[localize "str_player_12","PLAIN DOWN",5];

dayz_originalPlayer enableSimulation true;

addSwitchableUnit dayz_originalPlayer;
setPlayable dayz_originalPlayer;
selectPlayer dayz_originalPlayer;

_playerGroup = group _body;
[_body] joinSilent dayz_firstGroup;
deleteGroup _playerGroup;

_body removeAllEventHandlers "HandleDamage";
_body removeAllEventHandlers "Killed";
_body removeAllEventHandlers "Fired";
_body removeAllEventHandlers "FiredNear";

r_player_dead = true;

3 cutRsc ["default", "PLAIN",3];
4 cutRsc ["default", "PLAIN",3];

sleep 2;

1 cutRsc ["DeathScreen","BLACK OUT",3];

playMusic "dayz_track_death_1";

"dynamicBlur" ppEffectAdjust [0]; "dynamicBlur" ppEffectCommit 5;
"colorCorrections" ppEffectAdjust [1, 1, 0, [1, 1, 1, 0.0], [1, 1, 1, 1],  [1, 1, 1, 1]];"colorCorrections" ppEffectCommit 5;

sleep 2;
disableUserInput false;
endMission "END1";
};
