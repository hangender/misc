#line 1 "z\addons\zero_server\server\zero_eventHandlers.sqf"

if (isServer) then
{
"zeroSpawnFire" addPublicVariableEventHandler
{
(_this select 1) call server_sendData;
};

"zeroVariable" addPublicVariableEventHandler
{
_array = _this select 1;
_player = _array select 0;
_player setVariable ["abortTime",diag_tickTime];
};

"zeroReportOne" addPublicVariableEventHandler
{
(_this select 1) call server_gumdropsAndLollipops;
};

"zeroReportKill" addPublicVariableEventHandler
{
(_this select 1) call server_reportKillEvent;
};

"zeroReportDamage" addPublicVariableEventHandler
{
(_this select 1) call server_reportDamageEvent;
};

"zeroDeleteObject" addPublicVariableEventHandler
{
(_this select 1) call server_deleteObj;
};

"zeroChangeOwner" addPublicVariableEventHandler
{
(_this select 1) call zombie_findOwner;
};

"dayzPublishDebugPlainsSpawn" addPublicVariableEventHandler
{
(_this select 1) call server_handleDebugPlainsSpawn;
};
};
