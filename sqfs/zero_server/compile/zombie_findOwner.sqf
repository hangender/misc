#line 1 "z\addons\zero_server\compile\zombie_findOwner.sqf"

private ["_agent","_origin","_players","_client","_clientID"];

_agent = _this select 0;
_origin = owner _agent;

_players = (getPosATL _agent) nearEntities [["CAManBase"],200];

{
if ((isPlayer _x) && (_origin != owner _x)) exitWith
{
_client = _x;

};
} forEach _players;

if (!isNil "_client") then
{
_clientID = owner _client;
_agent setOwner _clientID;
diag_log (format["DEBUG: Transferring zombie %1 to %2!",_agent,_client]);
}
else
{
deleteVehicle _agent;

};
