fn_printKillMsg =
{
	[nil, nil, rspawn, [_this select 0, _this select 1], { (_this select 0) globalChat (_this select 1) }] call RE;
};

clientSendKillMsg = [];
"clientSendKillMsg" addPublicVariableEventHandler { (_this select 1) call fn_printKillMsg; };