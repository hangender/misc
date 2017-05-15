#line 1 "z\addons\zero_server\client\zero_studyBody.sqf"

zero_studyBody =
{
private["_body","_name","_method","_methodStr","_wasBandit","_killedByYouString","_inspectingPlayer","_killPlayer","_humanityClaimed","_killsV","_kills","_message"];

_body = 	_this select 3;
_name = 	_body getVariable["bodyName","Unknown"];
_method = 	_body getVariable["deathType","unknown"];
_methodStr = localize format ["str_death_%1",_method];

_killedByYouString = "";

_inspectingPlayer = dayz_playerUID;
_killPlayer = _body getVariable ["killPlayerUID","0"];

if(_inspectingPlayer == _killPlayer) then
{
_killedByYouString = ". You caused the fatal wound.";

_humanityClaimed = _body getVariable ["humanityClaimed",false];
if (!_humanityClaimed) then
{
_body setVariable ["humanityClaimed",true,true];

_wasBandit = ((_body getVariable ["humanity",0]) < -5000);

if(_wasBandit) then
{
_killsV = player getVariable ["banditKills",0];
player setVariable ["banditKills",(_killsV + 1),true];
}
else
{

_kills = player getVariable ["humanKills",0];
player setVariable ["humanKills",(_kills + 1),true];
};
};
};
_message = format[(localize  "str_player_studybody"),_name,_methodStr];
_message = _message + _killedByYouString;
cutText [_message, "PLAIN DOWN"];
};
