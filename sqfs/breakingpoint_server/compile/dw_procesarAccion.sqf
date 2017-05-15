private ["_tipo","_estado","_accion"];
_accion = _this select 0;
//acciones para luz
if(_accion == "luz") then {
	_estado= _this select 1;
	_tipo= "OFF";	
	if(_estado == "S") then {
		_tipo="AUTO";
	};
	diag_log ("luz accionada a " + str(_tipo));
	{		
		_x switchLight str(_tipo);	
	} forEach (allMissionObjects "StreetLamp");	
};