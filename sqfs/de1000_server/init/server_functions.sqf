waituntil {!isnil "bis_fnc_init"};

BIS_MPF_remoteExecutionServer = {
if ((_this select 1) select 2 == "JIPrequest") then {
[nil,(_this select 1) select 0,"loc",rJIPEXEC,[any,any,"per","execVM","ca\Modules\Functions\init.sqf"]] call RE;
};
};

serverN = 1;

BIS_Effects_Burn =			{};
server_playerLogin =		compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_playerLogin.sqf";
server_playerSetup =		compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_playerSetup.sqf";
server_onPlayerDisconnect = compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_onPlayerDisconnect.sqf";
server_updateObject =		compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_updateObject.sqf";
server_playerDied =			compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_playerDied.sqf";
server_publishObj = 		compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_publishObject.sqf";	
server_deleteObj =			compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_deleteObj.sqf"; 	
server_playerSync =			compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_playerSync.sqf";
zombie_findOwner =			compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\zombie_findOwner.sqf";
server_updateNearbyObjects =	compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_updateNearbyObjects.sqf";
server_sendToClient =		compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_sendToClient.sqf";
server_Wildgenerate =		compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\zombie_Wildgenerate.sqf";
server_plantSpawner =		compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_plantSpawner.sqf";
server_basedefend =			compile preprocessFileLineNumbers "\z\addons\dayz_server\scripts\basedefend.sqf";







spawnComposition = compile preprocessFileLineNumbers "ca\modules\dyno\data\scripts\objectMapper.sqf"; 



spawn_spawnbase = compile preprocessFileLineNumbers "\z\addons\dayz_server\buildings\spawnbase.sqf";












spawn_bridge = compile preprocessFileLineNumbers "\z\addons\dayz_server\buildings\bridge.sqf";





spawn_base1 = compile preprocessFileLineNumbers "\z\addons\dayz_server\buildings\milbase_toffi.sqf";
spawn_base2 = compile preprocessFileLineNumbers "\z\addons\dayz_server\buildings\milbase_murdock.sqf";
spawn_base3 = compile preprocessFileLineNumbers "\z\addons\dayz_server\buildings\milbase_freddy.sqf";
spawn_base4 = compile preprocessFileLineNumbers "\z\addons\dayz_server\buildings\milbase_freddy2.sqf";
spawn_devil = compile preprocessFileLineNumbers "\z\addons\dayz_server\buildings\devil.sqf";
spawn_house_klen = compile preprocessFileLineNumbers "\z\addons\dayz_server\buildings\house_klen.sqf";
spawn_hidden = compile preprocessFileLineNumbers "\z\addons\dayz_server\buildings\hidden.sqf";

fnc_plyrHit = compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\fnc_plyrHit.sqf";

server_spawnCrashSiteMission1 = compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_spawnCrashSiteMission1.sqf";
server_spawnCrashSiteMission2 = compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_spawnCrashSiteMission2.sqf";
server_spawnCrashSiteMission3 = compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\server_spawnCrashSiteMission3.sqf";

vehicle_handleServerKilled = {
private["_unit","_killer"];
_unit = _this select 0;
_killer = _this select 1;

[_unit, "killed"] call server_updateObject;

_unit removeAllMPEventHandlers "MPKilled";
_unit removeAllEventHandlers "Killed";
_unit removeAllEventHandlers "HandleDamage";
_unit removeAllEventHandlers "GetIn";
_unit removeAllEventHandlers "GetOut";
};

check_publishobject = {
private ["_allowed","_allowedObjects","_object","_playername"];

_object = _this select 0;
_playername = _this select 1;
_allowedObjects = ["TentStorage", "Hedgehog_DZ", "Sandbag1_DZ", "BearTrap_DZ", "Wire_cat1", "StashSmall", "StashMedium", "DomeTentStorage", "CamoNet_DZ", "Trap_Cans", "TrapTripwireFlare", "TrapBearTrapSmoke", "TrapTripwireGrenade", "TrapTripwireSmoke", "TrapBearTrapFlare"];
_allowed = false;


diag_log format ["DEBUG: Checking if Object: %1 is allowed published by %2", _object, _playername];


if ((typeOf _object) in _allowedObjects) then {

diag_log format ["DEBUG: Object: %1 published by %2 is Safe",_object, _playername];

_allowed = true;
};

_allowed;
};


eh_localCleanup = {

private ["_object","_type","_unit"];
_object = _this select 0;
_object addEventHandler ["local", {
if(_this select 1) then {
_unit = _this select 0;
_type = typeOf _unit;
_myGroupUnit = group _unit;
_unit removeAllMPEventHandlers "mpkilled";
_unit removeAllMPEventHandlers "mphit";
_unit removeAllMPEventHandlers "mprespawn";
_unit removeAllEventHandlers "FiredNear";
_unit removeAllEventHandlers "HandleDamage";
_unit removeAllEventHandlers "Killed";
_unit removeAllEventHandlers "Fired";
_unit removeAllEventHandlers "GetOut";
_unit removeAllEventHandlers "GetIn";
_unit removeAllEventHandlers "Local";
clearVehicleInit _unit;
deleteVehicle _unit;
deleteGroup _myGroupUnit;
_unit = nil;
diag_log ("CLEANUP: DELETED A " + str(_type) );
};
}];
};

server_hiveWrite = {
private["_data"];

_data = "HiveExt" callExtension _this;

};

server_hiveReadWrite = {
private["_key","_resultArray","_data"];
_key = _this;

_data = "HiveExt" callExtension _key;

_resultArray = call compile format ["%1",_data];
_resultArray;
};

onPlayerDisconnected 		"[_uid,_name] call server_onPlayerDisconnect;";

server_getDiff =	{
private["_variable","_object","_vNew","_vOld","_result"];
_variable = _this select 0;
_object = 	_this select 1;
_vNew = 	_object getVariable[_variable,0];
_vOld = 	_object getVariable[(_variable + "_CHK"),_vNew];
_result = 	0;
if (_vNew < _vOld) then {

_vNew = _vNew + _vOld;
_object getVariable[(_variable + "_CHK"),_vNew];
} else {
_result = _vNew - _vOld;
_object setVariable[(_variable + "_CHK"),_vNew];
};
_result;
};

server_getDiff2 =	{
private["_variable","_object","_vNew","_vOld","_result"];
_variable = _this select 0;
_object = 	_this select 1;
_vNew = 	_object getVariable[_variable,0];
_vOld = 	_object getVariable[(_variable + "_CHK"),_vNew];
_result = _vNew - _vOld;
_object setVariable[(_variable + "_CHK"),_vNew];
_result;
};

dayz_objectUID2 = {
private["_position","_dir","_key"];
_dir = _this select 0;
_key = "";
_position = _this select 1;
{
_x = _x * 10;
if ( _x < 0 ) then { _x = _x * -10 };
_key = _key + str(round(_x));
} forEach _position;
_key = _key + str(round(_dir));
_key;
};

dayz_recordLogin = {
private["_key"];
_key = format["CHILD:103:%1:%2:%3:",_this select 0,_this select 1,_this select 2];
_key call server_hiveWrite;
};

call compile preprocessFileLineNumbers "\z\addons\dayz_server\compile\fa_hiveMaintenance.sqf";


[] execVM "\z\addons\dayz_server\ah\dami.sqf";

line0 = 0;
line1 = 0;
line2 = 0;
line3 = 0;
line4 = 0;



































































































































donator_master = ["86473862","88711238","126421574","47793030","41779462","6005826","4714434","138531718","586818AX","5368962","36722438","81681414","83393094","147515654","149409606",
"81593350","151172678","91862150","61241094","137399366","46774086","129238278","10957056","82068358","22575238","142455494","128720646","80986950","152015046","125231110","78592390","135864262",
"5304066","151464902","44186054","28994054","94723846","151548614","43789958","62832582","78101510","128335366","67416198","92484486","92424774","67360646","93390726",
"102520006","22944838","59860678","4393986","6791042","137949638","15374662","146321606","152951366","129379398","148421766","88967110","152842886","149687238","151799494","130769926","127679814","112410566",
"79770054","5363780","79769286","154705670","88488198","112440454","125220806","27363846","123417222","56077574","91451590","127101958","154804742","155116422","138524870","31602374","106063494","155023238",
"155334086","110527750","149598534","9799492","6744384","124408390","94167686","146951366","67301126","153249158","154814534","134776262","9942020","135366918","150533830",
"122853126","153083078","74188102","155373126","113719302","101523398","7601156","80232646","129216966","128102150","122570502","4921538","36717062","110587526","51068166","10128196","13371462","13406598","155499718","130089030","33979654","72586758"];
publicVariable "donator_master";


































donator_elite = ["6014530","470466","135179782","127889478","110957830","885762AX","25673350","39447558","20854982","129709126","5387778","153065158","118709318","153064710","6310214",
"148592838","120703430","5830594","4122562","127914374","144250118","51068166","137948294","8568260","91337158","3331842","94766342","155766214","8240390","5839170"];
publicVariable "donator_elite";




















































































































donator_profi = ["148073862","19930886","149292870","149515334","89034950","127022982","30931526","149316230","149713094","40785862","135179782","29794374","101460486","150314566","71934086","83393094",
"149050438","144580870","74637574","6784326","129896134","143308038","143389702","117192838","119611974","6379906","16115526","5931202","152220550","149299654",
"20266694","470468","141788294","139994310","44221254","152487238","154372678","81374150","152196166","27555398","78415046","5569410","41443270","120695110","121308422",
"60144774","149909894","153124678","152510406","24378054","150379334","83572934","119827718","36762566","7189508","32530374","23112710","106311302","153246022","1533119494","154713222","127966342",
"128960390","146403206","108525190","29118150","120329414","123291014","148766598","134606022","59436038","91936774","146711942","96628422","127647878","80138182","57465286","110754566","117571974",
"116771846","147583686","138312902","93087622","76332678","58832262","130268998","121797702","33229510","27859078","154400518","109086662","151060806","73049606","150533830","103247046",
"130130822","93394054","36934598","87119558","4467332","161928454","22214150","8221380","44331334","41706118","148703814","61947206","125028678"];
publicVariable "donator_profi";

































































































donator_skin = ["86473862","41779462","31296134","88711238","126421574","111724614","47793030","67416198","36722438","12627078","88706758","4714434","69625926","108524486","94723846","118645702","139951814","109346310","70083014","5335938","146724614","154388934","149316230","6338242","129709126","5368962","62832582","149713094","89034950","127779398","150431622","127016134","130016710","101460486","6005826","3505600","106768646","93603782","10957056","143308038","5394754","36525958","9445188","107363846","6379906","16115526","121265158","129238278","128300294",
"36921734","7792838","5387778","57205574","7477318","119611974","6791042","56077574","128335366","153065158","41443270","120695110","92424774","152951366","83572934","36762566","144745478","88967110","6310214","22187718","148739014","152208326","88900870",
"123417222","94167686","31602374","23629702","110754566","147583686","138312902","155113222","147377350","5569410","134776262","110587526","4921538","113719302","3331842","87185926","7601156","72586758",
"149598534","130130822","111273990","110527750","130089030"];
publicVariable "donator_skin";

"PV_RequestTag" addPublicVariableEventHandler {
Query =  ((_this select 1) select 0);
Request = (owner ((_this select 1) select 1));
PVCDZ_tagFriend = [(getPlayerUID Query),(name Query), (owner Query), Request]; 
Request publicVariableClient "PVCDZ_tagFriend";
}; 


if (isServer) then {
"PVDZ_plr_Death"		addPublicVariableEventHandler {_id = (_this select 1) spawn server_playerDied};
"PVDZ_plr_Save"			addPublicVariableEventHandler {_id = (_this select 1) call server_playerSync;};
"PVDZ_obj_Publish"		addPublicVariableEventHandler {(_this select 1) call server_publishObj};
"PVDZ_veh_Save" 		addPublicVariableEventHandler {(_this select 1) call server_updateObject};
"PVDZ_plr_Login1"		addPublicVariableEventHandler {_id = (_this select 1) call server_playerLogin};
"PVDZ_plr_Login2"		addPublicVariableEventHandler {(_this select 1) call server_playerSetup};
"PVDZ_plr_LoginRecord"	addPublicVariableEventHandler {_id = (_this select 1) spawn dayz_recordLogin};
"PVDZ_obj_Delete"		addPublicVariableEventHandler {(_this select 1) spawn server_deleteObj};
"PVDZ_send" addPublicVariableEventHandler {(_this select 1) call server_sendToClient};

"PVDZ_objgather_Delete" addPublicVariableEventHandler {
_obj = ((_this select 1) select 0);
_player = ((_this select 1) select 1);
_type = typeOf _obj;
_dis = _player distance _obj;

if (_dis < 3) then {
if (_type in Dayz_plants) then {
deleteVehicle _obj;
};
};	
};

"PVDZ_serverStoreVar" addPublicVariableEventHandler {
_obj = ((_this select 1) select 0);
_name = ((_this select 1) select 1);
_value = 0;

switch (_name) do {
case "looted": {
_obj =  ((_this select 1) select 0);
_name = "looted";
_value = ((_this select 1) select 2);

_obj setVariable [_name, _value];
};
case "zombieSpawn": {
_obj = ((_this select 1) select 0);
_name = "zombieSpawn";
_value = ((_this select 1) select 2);

_obj setVariable [_name, _value];
};
case "USEC_BloodQty": {
_obj = ((_this select 1) select 0);
_name = ((_this select 1) select 1);
_value = ((_this select 1) select 2);

if (isPlayer _obj) then {
_obj setVariable [_name, _value];
};
};
};
};

"PVDZ_receiveVar" addPublicVariableEventHandler {
_owner = ((_this select 1) select 0);
_object = ((_this select 1) select 1);
_name = ((_this select 1) select 2);
_value = ((_this select 1) select 3);

switch (_name) do {
case "looted": {
diag_log format ["%4 - %1, %2, %3", _object, _name, _value, "receive looted"]; 
};
case "zombieSpawn": {

};
};

_ownerID = owner _owner;
_return = _object getVariable [_name,_value];
a=0;
b=5;
while {a<b} do {a=a+1};

diag_log format ["%1", _return];	

PVCDZ_SetVar = [_object,_name,_return];
_ownerID publicVariableClient "PVCDZ_SetVar";
};

"PVDZ_getTickTime" addPublicVariableEventHandler {
_owner = owner (_this select 1);

PVCDZ_setServerTickTimeOffset = diag_TickTime;
_owner publicVariableClient "PVCDZ_setServerTickTimeOffset";
};
};

"PVDZ_drg_RaLW"   		addPublicVariableEventHandler {[_this select 1] execVM "\z\addons\dayz_code\medical\publicEH\load_wounded.sqf"};
"PVDZ_drg_RLact"		addPublicVariableEventHandler {[_this select 1] execVM "\z\addons\dayz_code\medical\load\load_wounded.sqf"};
"PVDZ_hlt_Bleed"		addPublicVariableEventHandler {_id = (_this select 1) spawn fnc_usec_damageBleed};
"PVCDZ_veh_SH" 			addPublicVariableEventHandler {(_this select 1) call fnc_veh_handleDam}; 
"PVDZ_veh_SF"			addPublicVariableEventHandler {(_this select 1) call fnc_veh_handleRepair}; 
"PVCDZ_obj_HideBody"	addPublicVariableEventHandler {hideBody (_this select 1)};
"PVCDZ_obj_GutBody"		addPublicVariableEventHandler {(_this select 1) spawn local_gutObject};
"PVCDZ_veh_SetFuel"		addPublicVariableEventHandler {(_this select 1) spawn local_setFuel};
"dayzInfectedCamps"		addPublicVariableEventHandler {(_this select 1) call infectedcamps};

"PVDZ_Server_changeOwner" addPublicVariableEventHandler {		
_agent = ((_this select 1) select 0);
_reciever = ((_this select 1) select 1);
_ownerID = owner _agent;
_newownerID = 1; 

if (typeName _reciever == "OBJECT") then {
_newownerID = owner _reciever;
};
if (isnil ("Owner")) then {
_agent setVariable ["Owner",_ownerID];
};

_agent setOwner _newownerID;
diag_log ("TRANSFER OWNERSHIP: " + (typeOf _agent) + " OF _unit: " + str(_agent) + " TO _client: " + str(_reciever) );
};

"PVDZ_Server_Simulation" addPublicVariableEventHandler {
_agent = ((_this select 1) select 0);
_control = ((_this select 1) select 1);

_agent enableSimulation _control;
};
