
private ["_position","_doLoiter","_unitTypes","_array","_agent","_type","_radius","_method","_rndx","_rndy","_counter","_amount","_wildsdone"];
_unitTypes = _this select 0;
_amount = _this select 1;

_wildsdone = true;
_counter = 0;

while {_counter < _amount} do {


_agent = 	objNull;
_type = _unitTypes call BIS_fnc_selectRandom;




_method = "CAN_COLLIDE";


_rndx = floor(random 15000);
_rndy = floor(random 16000);
_position = [_rndx, _rndy, 0];


_agent = createAgent [_type, _position, [], 1, _method];

_agent setDir floor(random 360);

_agent setVariable ["doLoiter",true]; 

if (random 1 > 0.7) then {
_agent setUnitPos "Middle";
};

_position = getPosATL _agent;
_agent setVariable ["homePos",_position,true];

_agent setVariable["agentObject",_agent,true];


_counter = _counter + 1;


_id = [_position,_agent] execFSM "\z\AddOns\dayz_code\system\zombie_wildagent.fsm";
_agent setVariable [ "fsmid", _id ];


_agent enableSimulation false;


};

_wildsdone