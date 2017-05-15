fn_sendToAdmin =
{
	private "_adminList";
	
	serverSendDacMessage = _this;
	_adminList = ["4175042"];
	
	{
		if ((getPlayerUID _x) in _adminList) then
		{
			(owner _x) publicVariableClient "serverSendDacMessage";
		};
	}forEach playableUnits;
};


fn_handleDacMessage =
{
	private ["_playerName", "_playerUid", "_reason", "_message"];
	
	// log the cheater
	_playerName = _this select 0;
	_playerUid = _this select 1;
	_reason = _this select 2;
	
	_message = format["CHEATER DETECTED - player: %1 - uid: %2 - reason: %3", _playerName, _playerUid, _reason];
	
	//"Arma2Net.Unmanaged" callExtension ("AppendLog " + _message);
	
	// notify an admin
	_this call fn_sendToAdmin;	
};

// [name,uid,reason]
clientSendDacMessage = [];
"clientSendDacMessage" addPublicVariableEventHandler { (_this select 1) call fn_handleDacMessage; };