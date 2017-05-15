private ["_vehicle", "_vehicle_refuel_id"];
_vehicle = objNull;
while {alive player} do
{
	private ["_currentVehicle", "_isNearFeed"];

	_currentVehicle = vehicle player;
	_isNearFeed = count ((position _currentVehicle) nearObjects ["Land_A_FuelStation_Shed", 15]) > 0;

	if (_vehicle != _currentVehicle) then
	{
		if (!isNull _vehicle) then
		{
			_vehicle removeAction _vehicle_refuel_id;
			_vehicle = objNull;
			_vehicle_refuel_id = nil;
		};

		if (_currentVehicle != player && _isNearFeed) then
		{
			_vehicle = _currentVehicle;

			_vehicle_refuel_id = _vehicle addAction ["Refuel", "external\client\autorefuel_do.sqf", [], -1, false, false, "",
			"vehicle _this == _target && local _target"];
		};
	};

	if (!_isNearFeed) then
	{
		if (!(isNil "_vehicle_refuel_id")) then
		{
			_vehicle removeAction _vehicle_refuel_id;
		};
		
		_vehicle = objNull;
	};
	sleep 5;
};