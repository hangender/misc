#line 1 "z\deathlyrage\breakingpoint_server\system\antihax.sqf"






loadFile = "STRING;";
markerText = "STRING;";
createTeam = "STRING;";
addTeamMember = "STRING;";
removeTeamMember = "STRING;";
profileNamespace = "STRING;";
saveProfileNamespace = "STRING;";
saveStatus = "STRING;";
loadStatus = "STRING;";
saveVar = "STRING;";
setVelocity = "STRING;";
exec = "STRING;";
createDiaryRecord = "STRING;";
rcallVarcode = "STRING;";

publicVariable "loadFile";
publicVariable "setVelocity";
publicVariable "createTeam";
publicVariable "addTeamMember";
publicVariable "removeTeamMember";
publicVariable "profileNamespace";
publicVariable "saveProfileNamespace";
publicVariable "saveStatus";
publicVariable "loadStatus";
publicVariable "saveVar";

Deathly_PlayerLoginInit =
{

BIS_Effects_EH_Killed = compile preprocessFileLineNumbers "\z\addons\dayz_code\system\BIS_Effects\killed.sqf";
BIS_Effects_AirDestruction = compile preprocessFileLineNumbers "\z\addons\dayz_code\system\BIS_Effects\AirDestruction.sqf";
BIS_Effects_AirDestructionStage2 = compile preprocessFileLineNumbers "\z\addons\dayz_code\system\BIS_Effects\AirDestructionStage2.sqf";

BIS_Effects_globalEvent = {
BIS_effects_gepv = _this;
publicVariable "BIS_effects_gepv";
_this call BIS_Effects_startEvent;
};

BIS_Effects_startEvent = {
switch (_this select 0) do {
case "AirDestruction": {
[_this select 1] spawn BIS_Effects_AirDestruction;
};
case "AirDestructionStage2": {
[_this select 1, _this select 2, _this select 3] spawn BIS_Effects_AirDestructionStage2;
};
case "Burn": {
[_this select 1, _this select 2, _this select 3, false, true] spawn BIS_Effects_Burn;
};
};
};

"BIS_effects_gepv" addPublicVariableEventHandler {
(_this select 1) call BIS_Effects_startEvent;
};

player setVariable ["53tewrgwr56ewrtgwe5wrtt", 1, true];

_Devs = ["58224198","30175302"];
_Admins = ["21224326","101522950","74885702","24352902","30175302","75090694","73008070","72799238","28288582","17653318","65405318","52993030","78779718","81217670","17146118","94800774","25297478"];

if (getPlayerUID player in _Devs) then
{
[] execVM "deathlyrage\radio\commsMenu.sqf";
};

if ((getPlayerUID player in _Admins) or (getPlayerUID player in _Devs)) exitWith
{
_spec_thread = [] spawn {
fnc_keyDown = 
{
private["_handled", "_ctrl", "_dikCode", "_shift", "_ctrlKey", "_alt"];
_ctrl = _this select 0;
_dikCode = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_handled = false;
if (!_shift && !_ctrlKey && !_alt) then
{
if (_dikCode == 24 ) then
{
GCamKill = false;
handle = [] execVM "gcam\gcam.sqf";
_handled = true;
};
if (_dikCode == 25 ) then
{
GCamKill = true;
_handled = true;
};
};
_handled;
};
waitUntil {(dayz_ClientPreload)};
waitUntil {(!isNull Player) and (alive Player)};
waituntil {!(IsNull (findDisplay 46))};
(findDisplay 46) displayAddEventHandler ["keyDown", "_this call fnc_keyDown"];
};
};

if (!(getPlayerUID player in _Admins) && (getPlayerUID player == (_this select 0))) then
{
preProcessFileLineNumbers " ";
BIS_fnc_swapVars = {};
BIS_MPF_remoteExecutionServer7 = compile preprocessFile (BIS_MP_Path + BIS_PATH_SQF + "remExServer.sqf");
BIS_MPF_remoteExecutionServer =
{
_input = (_this select 1) select 2;
if (_input in ["switchmove", "playmove", "say", "jipexec", "execvm"]) then {_this call BIS_MPF_remoteExecutionServer7;};
};
playableUnits = [player];
allUnits = [player];
allMissionObjects = [player];
entities = [player];
vehicles = [player];
{[] spawn _x;} forEach
[{
while {true} do
{
sleep 30;
for "_i" from 0 to (count Deathly_HackVar)-1 do
{
_var = (Deathly_HackVar select _i);
_test = format ["%1",_var];
if (!(isNil _test)) then
{

_world = toUpper(worldName); 
_nearestCity = (nearestLocations [getPos player, ["NameCityCapital","NameCity","NameVillage","NameLocal"],1000] select 0);
_town = "Wilderness";
if (!isNull _nearestCity) then {_town = text _nearestCity};

_x = format ["%1",_i];
Deathly_OnPlayerLogin = [true, name player, getPlayerUID player, 'Global Var', _x, _world, _town];
publicVariableServer 'Deathly_OnPlayerLogin';
for "_j" from 0 to 100 do {(findDisplay _j) closeDisplay 0;};
};
};
};
},{
while {true} do
{
(findDisplay 46) displayRemoveAllEventHandlers 'KeyDown';
(findDisplay 46) displayAddEventHandler ["KeyDown","_this call dayz_spaceInterrupt"];
sleep 0.1;
for '_i' from 0 to 100 do
{
_dayzActions = s_player_repairActions + s_player_removeActions + r_player_actions + [null] + [NORRN_dropAction, s_player_studybody, s_player_grabflare, s_player_removeflare, s_player_dropflare, s_player_boil, s_player_deleteBuild, s_player_forceSave, s_player_fillfuel, s_player_butcher, s_player_cook, s_player_fireout, s_player_packtent,s_player_flipveh,s_player_dogstay,s_player_dogfollow,s_player_dogfind,s_player_igniteTent,R3F_LOG_objet_addAction,_action_menu];
if !(_i in _dayzActions) then {player removeAction _i};
};
_cMenuDefault = ["","#GET_IN","RscMainMenu","RscMoveHigh","#WATCH","#WATCH0","RscWatchDir","RscWatchMoreDir","#GETIN","RscStatus","RscCallSupport","#ACTION","RscCombatMode","RscFormations","RscTeam","RscSelectTeam","RscReply","#CUSTOM_RADIO","RscRadio","RscGroupRootMenu"];
if !(commandingMenu in _cMenuDefault) then {
showCommandingMenu "";

_world = toUpper(worldName); 
_nearestCity = (nearestLocations [getPos player, ["NameCityCapital","NameCity","NameVillage","NameLocal"],1000] select 0);
_town = "Wilderness";
if (!isNull _nearestCity) then {_town = text _nearestCity};

_input = toArray commandingMenu;
_output = [];
_removeA = toArray ":";
_remove = _removeA select 0;
_replaceA = toArray "!";
_replace = _replaceA select 0;
{
if (_x != _remove) then
{
_output set [count _output, _x];
}
else
{
_output set [count _output, _replace];
};
} foreach _input;
_output = toString _output;


};

(findDisplay 46) displayRemoveAllEventHandlers "KeyDown";
(findDisplay 46) displayRemoveAllEventHandlers "KeyUp";
(finddisplay 106) displayRemoveAllEventHandlers 'KeyDown';
(finddisplay 106) displayRemoveAllEventHandlers 'KeyUp';
(findDisplay 46) displayAddEventHandler ["KeyDown","_this call dayz_spaceInterrupt"];
((findDisplay 12) displayCtrl 51) ctrlRemoveAllEventHandlers 'MouseButtonDown';
((findDisplay 12) displayCtrl 51) ctrlRemoveAllEventHandlers 'MouseButtonUp';
((findDisplay 3030) displayCtrl 2) ctrlRemoveAllEventHandlers 'LBDblClick';

_MainDisplay = isNull (findDisplay 106);
_R3F = isNull (findDisplay R3F_LOG_IDD_dlg_contenu_vehicule);
_Journal0 = isNull (findDisplay 1140);
_Journal1 = isNull (findDisplay 1141);
_Journal2 = isNull (findDisplay 1142);
_Journal3 = isNull (findDisplay 1143);
_Journal4 = isNull (findDisplay 1144);
_Journal5 = isNull (findDisplay 1145);
_Journal6 = isNull (findDisplay 1146);
if (_MainDisplay and _R3F and _Journal0 and _Journal1 and _Journal2 and _Journal3 and _Journal4 and _Journal5 and _Journal6) then {closeDialog 0;};
player allowDamage true;
buttonSetAction [104, ''];
if ((typeName player != "OBJECT") or (typeName true != "BOOL")) then
{

_world = toUpper(worldName); 
_nearestCity = (nearestLocations [getPos player, ["NameCityCapital","NameCity","NameVillage","NameLocal"],1000] select 0);
_town = "Wilderness";
if (!isNull _nearestCity) then {_town = text _nearestCity};

_type = (typeName player);
_x = format ["%1",_type];
Deathly_OnPlayerLogin = [false, name player, getPlayerUID player, 'Anti-Anti Hack', _x, _world, _town];
publicVariableServer 'Deathly_OnPlayerLogin';
for "_j" from 0 to 100 do {(findDisplay _j) closeDisplay 0;};
};
sleep 0.8;
};
},{
while {true} do
{
_items = weapons player;
{
if (_x in _items) then
{
player removeWeapon _x;
_world = toUpper(worldName);
_nearestCity = (nearestLocations [getPos player, ["NameCityCapital","NameCity","NameVillage","NameLocal"],1000] select 0);
_town = "Wilderness";
if (!isNull _nearestCity) then {_town = text _nearestCity};
Deathly_OnPlayerLogin = [false, name player, getPlayerUID player, 'Bad Item', _x, _world, _town];
publicVariableServer 'Deathly_OnPlayerLogin';
for "_j" from 0 to 100 do {(findDisplay _j) closeDisplay 0;};
};
} forEach ['MakarovSD'];
sleep 60;
};
},{
disableSerialization;
while {true} do
{
waitUntil {!isNull (findDisplay 49)};
call dayz_forceSave;
[] spawn dayz_disableRespawn;
waitUntil {isNull (findDisplay 49)};
if (!(isNull findDisplay 3030) || !(isNull findDisplay 155)) then 
{

_world = toUpper(worldName);
_nearestCity = (nearestLocations [getPos player, ["NameCityCapital","NameCity","NameVillage","NameLocal"],1000] select 0);
_town = "Wilderness";
if (!isNull _nearestCity) then {_town = text _nearestCity};
Deathly_OnPlayerLogin = [true, name player, getPlayerUID player, 'Hack Menu', '', _world, _town];
publicVariableServer 'Deathly_OnPlayerLogin';
for "_j" from 0 to 100 do {(findDisplay _j) closeDisplay 0;};
}
};
},{
private["_sleepGodModeCheck", "_terrainGrid","_recoilSettings","_zombieCheck","_damageHandler","_unconsciousFunction"];


_sleepGodModeCheck = 30;

_terrainGrid = 25;


_recoilSettings = unitRecoilCoefficient player;


_zombieCheck = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_zombieCheck.sqf";
_damageHandler = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_damageHandler.sqf";
_unconsciousFunction = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_unconscious.sqf";

while {true} do
{

player_zombieCheck = _zombieCheck;
fnc_usec_damageHandler = _damageHandler;
fnc_usec_unconscious = _unconsciousFunction;

if (viewDistance > 1600 and (alive player)) exitWith
{
_world = toUpper(worldName);
_nearestCity = (nearestLocations [getPos player, ["NameCityCapital","NameCity","NameVillage","NameLocal"],1000] select 0);
_town = "Wilderness";
if (!isNull _nearestCity) then {_town = text _nearestCity};
_info = format ["%1",viewDistance];
Deathly_OnPlayerLogin = [true, name player,getPlayerUID player, 'ViewDistance Hack', _info, _world, _town];
publicVariableServer 'Deathly_OnPlayerLogin';
for "_j" from 0 to 100 do {(findDisplay _j) closeDisplay 0;};
};

_recoil = unitRecoilCoefficient player;
if ((_recoil < 1) and (alive player)) exitWith
{
_world = toUpper(worldName);
_nearestCity = (nearestLocations [getPos player, ["NameCityCapital","NameCity","NameVillage","NameLocal"],1000] select 0);
_town = "Wilderness";
if (!isNull _nearestCity) then {_town = text _nearestCity};
_info = format ["%1",_recoil];
Deathly_OnPlayerLogin = [true, name player,getPlayerUID player, 'Recoil Hack', _info, _world, _town];
publicVariableServer 'Deathly_OnPlayerLogin';
for "_j" from 0 to 100 do {(findDisplay _j) closeDisplay 0;};
};

if ((groupIconsVisible select 0) or (groupIconsVisible select 1))exitWith
{
_world = toUpper(worldName);
_nearestCity = (nearestLocations [getPos player, ["NameCityCapital","NameCity","NameVillage","NameLocal"],1000] select 0);
_town = "Wilderness";
if (!isNull _nearestCity) then {_town = text _nearestCity};
Deathly_OnPlayerLogin = [true, name player,getPlayerUID player, 'Group Icons', str groupIconsVisible, _world, _town];
publicVariableServer 'Deathly_OnPlayerLogin';
for "_j" from 0 to 100 do {(findDisplay _j) closeDisplay 0;};
};


setTerrainGrid _terrainGrid;


playableUnits = [player];
allUnits = [player];
allMissionObjects = [player];
entities = [player];

rcallVarcode = "STRING";

sleep _sleepGodModeCheck;
};
},{
_fileArray = Deathly_HackScript;
while {true} do
{

for "_i" from 0 to (count _fileArray)-1 do
{
if ((preProcessFileLineNumbers (_fileArray select _i)) != "") then
{
_world = toUpper(worldName);
_nearestCity = (nearestLocations [getPos player, ["NameCityCapital","NameCity","NameVillage","NameLocal"],1000] select 0);
_town = "Wilderness";
if (!isNull _nearestCity) then {_town = text _nearestCity};
_caughtScript = format ['%1', _i];
Deathly_OnPlayerLogin = [true, name player, getPlayerUID player, 'Script', _caughtScript, _world, _town];
publicVariableServer 'Deathly_OnPlayerLogin';
for "_j" from 0 to 100 do {(findDisplay _j) closeDisplay 0;};
};
sleep 0.2;
};
sleep 120;

for "_i" from 0 to (count _fileArray)-1 do
{
_a = (_fileArray select _i);
_scan = format ["Missions\%1",_a];
if ((preProcessFileLineNumbers _scan) != "") then
{
_world = toUpper(worldName);
_nearestCity = (nearestLocations [getPos player, ["NameCityCapital","NameCity","NameVillage","NameLocal"],1000] select 0);
_town = "Wilderness";
if (!isNull _nearestCity) then {_town = text _nearestCity};
_caughtScript = format ['%1', _i];
Deathly_OnPlayerLogin = [true, name player, getPlayerUID player, 'ScriptM', _caughtScript, _world, _town];
publicVariableServer 'Deathly_OnPlayerLogin';
for "_j" from 0 to 100 do {(findDisplay _j) closeDisplay 0;};
};
sleep 0.2;
};
sleep 120;

for "_i" from 0 to (count _fileArray)-1 do
{
_a = (_fileArray select _i);
_scan = format ["MPMissions\%1",_a];
if ((preProcessFileLineNumbers _scan) != "") then
{
_world = toUpper(worldName);
_nearestCity = (nearestLocations [getPos player, ["NameCityCapital","NameCity","NameVillage","NameLocal"],1000] select 0);
_town = "Wilderness";
if (!isNull _nearestCity) then {_town = text _nearestCity};
_caughtScript = format ['%1', _i];
Deathly_OnPlayerLogin = [true, name player, getPlayerUID player, 'ScriptMP', _caughtScript, _world, _town];
publicVariableServer 'Deathly_OnPlayerLogin';
for "_j" from 0 to 100 do {(findDisplay _j) closeDisplay 0;};
};
sleep 0.2;
};
sleep 120;
};
}];
};
};

publicVariable "Deathly_PlayerLoginInit";

BIS_MPF_remoteExecutionServer =
{
if ((_this select 1) select 2 == "JIPrequest") then
{
_callType = (_this select 0);
_playerID = getPlayerUID ((_this select 1) select 0);
_playerObj = (_this select 1) select 0;
_playerName = name _playerObj;
_clientID = owner _playerObj;
[nil,(_this select 1) select 0,"loc",rJIPEXEC,[any,any,"per","execVM","ca\Modules\Functions\init.sqf"]] call RE;
[nil,(_this select 1) select 0,"loc",rCallVar,[_playerID],"Deathly_PlayerLoginInit"] call RE;
};
};