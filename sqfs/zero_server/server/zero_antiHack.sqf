#line 1 "z\addons\zero_server\server\zero_antiHack.sqf"

server_destroyHacker =
{
private["_character","_vehicle","_clientID"];

_character = _this select 0;

if (vehicle _character != _character) then
{
_vehicle = vehicle _character;
_character setDamage 1;
_vehicle setPosATL [-2500,17500,250];
_vehicle setDamage 1;

_clientID = (owner _character);

zeroPlayerNilID = ["hax"];
_clientID publicVariableClient "zeroPlayerNilID";
}
else
{
_character setDamage 1;

_clientID = (owner _character);

zeroPlayerNilID = ["hax"];
_clientID publicVariableClient "zeroPlayerNilID";
}; 
};


server_outsideMap =
{
private["_character","_charPos","_posX","_posY","_side","_playerUID","_message","_key"];

_character = _this select 0;
_charPos = _this select 1;

_posX = (_charPos select 0);
_posY = (_charPos select 1);

_side = "";

if ((_posX < -50 and _posX > -18000) or (_posX < -19000)) then
{
_side = "west side";
};
if (_posX > 15400) then
{
_side = "east side";
};
if ((_posY > 15400 and _posY < 25000) or (_posY > 26000)) then
{
_side = "north side";
};
if (_posY < -50) then
{
_side = "south side";
};

if(_side != "") then
{
_playerUID = getPlayerUID _character;

_message = format["Out of bounds at [%1, %2], destroying...",str(_posX),str(_posY)];
_key = format["CHILD:600:%1:%2:%3:","OOB",_playerUID,_message];
_key call server_hiveWrite;

[_character] call server_destroyHacker;
};
};
