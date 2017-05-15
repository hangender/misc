#line 1 "z\addons\zero_server\client\login\login_functions.sqf"

player_login =		compile preprocessFileLineNumbers "\z\addons\zero_server\client\login\player_login.sqf";
zero_login_phase2 =	compile preprocessFileLineNumbers "\z\addons\zero_server\client\login\player_login_phase2.sqf";
zero_login_phase3 =	compile preprocessFileLineNumbers "\z\addons\zero_server\client\login\player_login_phase3.sqf";
zero_login_phase4 =	compile preprocessFileLineNumbers "\z\addons\zero_server\client\login\player_login_phase4.sqf";
zero_login_phase5 =	compile preprocessFileLineNumbers "\z\addons\zero_server\client\login\player_login_phase5.sqf";
zero_login_phase6 =	compile preprocessFileLineNumbers "\z\addons\zero_server\client\login\player_login_phase6.sqf";
zero_login_phase7 =	compile preprocessFileLineNumbers "\z\addons\zero_server\client\login\player_login_phase7.sqf";


client_initializeGlobals =
{

"dayzSetFuel"		addPublicVariableEventHandler {(_this select 1) call local_setFuel};
"dayzSetFix"		addPublicVariableEventHandler {(_this select 1) call object_setFixServer};
"dayzGutBody"		addPublicVariableEventHandler {(_this select 1) spawn local_gutObject};

if (isServer) then
{
"zeroReportDeath"	addPublicVariableEventHandler {(_this select 1) call server_playerDied};
"zeroScheduledSave"	addPublicVariableEventHandler {(_this select 1) call server_playerSync;};
"zeroCreateObject"	addPublicVariableEventHandler {(_this select 1) call server_publishObj};
"zeroUpdateVehicle"	addPublicVariableEventHandler {(_this select 1) call server_updateObject};
"zeroLoginOne"		addPublicVariableEventHandler {(_this select 1) call server_playerLogin};
"zeroLoginTwo"		addPublicVariableEventHandler {(_this select 1) call server_playerSetup};
"zeroForceSave"		addPublicVariableEventHandler {(_this select 1) call server_characterSync};

"medMorphine"		addPublicVariableEventHandler {(_this select 1) select 0 setVariable["hit_legs",0];(_this select 1) select 0 setVariable["hit_hands",0];};
};

if (!isDedicated) then
{
"norrnRaDrag"		addPublicVariableEventHandler {[_this select 1] execVM "\z\addons\zero_code\medical\publicEH\animDrag.sqf"};
"norrnRaLW"   		addPublicVariableEventHandler {[_this select 1] execVM "\z\addons\zero_code\medical\publicEH\load_wounded.sqf"};
"norrnRLact"		addPublicVariableEventHandler {[_this select 1] execVM "\z\addons\zero_code\medical\load\load_wounded.sqf"};
"medMorphine"		addPublicVariableEventHandler {(_this select 1) call player_medMorphine};
"medBleed"			addPublicVariableEventHandler {(_this select 1) spawn fnc_usec_damageBleed};
"medBandage"		addPublicVariableEventHandler {(_this select 1) call player_medBandage};
"medEpiPen"			addPublicVariableEventHandler {(_this select 1) call player_medEpi};
"medTransfuse"		addPublicVariableEventHandler {(_this select 1) call player_medTransfuse};
"medPainkiller"		addPublicVariableEventHandler {(_this select 1) call player_medPainkiller};
"dayzHideBody"		addPublicVariableEventHandler {hideBody (_this select 1)};
"dayzHumanity"		addPublicVariableEventHandler {(_this select 1) spawn player_humanityChange};
"dayzHitV"			addPublicVariableEventHandler {(_this select 1) call fnc_usec_damageVehicle};
"dayzSetDate"		addPublicVariableEventHandler {setDate (_this select 1)};
"dayzFlies"			addPublicVariableEventHandler {(_this select 1) call spawn_flies};
"zeroCreateLight"	addPublicVariableEventHandler {(_this select 1) spawn object_roadFlare};
"dayzFire"			addPublicVariableEventHandler {nul=(_this select 1) spawn BIS_Effects_Burn};
};

zeroWrecks = ["ZERO_UH1YWreck","ZERO_UH60Wreck","ZERO_CH47FWreck","ZERO_MV22Wreck","ZERO_HC3Wreck","ZERO_Mi8Wreck","ZERO_Mi24Wreck"];

objectsThatSpawnZombies = ["Church","Grave","HouseBase","Camp_base"];
objectsThatSpawnZombies = objectsThatSpawnZombies + zeroWrecks;

botPlayers = [];

loginWaitCount =		0;
loginInterval =			30;
loginPingCheckPoint =	30;
loginReplyCheckPoint =	30;

dayzPlayerLogin = [];
dayzPlayerStillConnected = [];

dayz_maxLocalZombies =		25;
dayz_nearbyZombies =		0;
dayz_maxNearbyZombies =		25;
dayz_currentGlobalZombies =	0;
dayz_maxGlobalZombies =		500;
dayz_currentGlobalAnimals =	0;
dayz_maxGlobalAnimals =		100;

gotHitUID = "0";
gotHitWeapon = "Unknown";

arbiter = false;
stalker = false;


zero_crew = ["11907462","17551494","7414214","29062982","15449222","79945542","65760518","47366726","47039686","29310662","23667526"];
zero_playerUID = getPlayerUID player;

if (zero_playerUID in zero_crew) then
{
arbiter = true;


zero_admin = ["11907462","17551494","15449222","79945542","65760518"];

if (zero_playerUID in zero_admin) then
{
stalker = true;
};
};

AdminEmail = "tansien@zombies.nu";
};


client_applyEffects =
{
"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";
};


client_blockUntilMissionLoaded =
{
private["_sleep","_count"];

_sleep = 0;
waitUntil
{
sleep 1;
_sleep = _sleep + 1;

_count = 0;
_count = (count allMissionObjects "CampEast");

if (_sleep > 60) then { _count = 8; };

_count == 8
};
};


client_performInitializationAndLogin =
{
call client_initializeGlobals;
call client_startLogin;
call client_blockUntilMissionLoaded;
call client_spawnWreckEffects;
};


client_endLoading =
{
private ["_message"];

_message = _this select 0;
endLoadingScreen;
selectNoPlayer;
0 cutText [_message, "BLACK FADED",15];
};


client_showLocation =
{
private ["_town","_world","_nearestCity"];

_world = toUpper(worldName);
_nearestCity = (nearestLocations [getPos player, ["NameCityCapital","NameCity","NameVillage","NameLocal"],1000] select 0);
_town = "Wilderness";
if (!isNil "_nearestCity") then { _town = text _nearestCity };

[_world,_town] spawn BIS_fnc_infoText;
};


client_resetAliveCheck =
{
dayzPlayerStillConnected = [];
loginWaitCount = 0;
loginInterval = 30;
loginPingCheckPoint = 30;
loginReplyCheckPoint = 30;
};


client_startLogin =
{
0 spawn player_login;
};


client_checkAlive =
{
private ["_alive","_error"];

_alive = true;
loginWaitCount = loginWaitCount + 1;

if(loginWaitCount == loginPingCheckPoint) then
{
endLoadingScreen;
startLoadingScreen ["Checking if still connected...","DayZ_loadingScreen"];
zeroCheckServer = player;
publicVariableServer "zeroCheckServer";
loginReplyCheckPoint = loginPingCheckPoint + loginInterval;
};
if(loginWaitCount == loginReplyCheckPoint) then
{
if(count (dayzPlayerStillConnected) == 0) then
{
_alive = false;
_error	= "The server is under heavy load or your client is no longer connected to the server. You may wish to reconnect.";
[_error] call client_endLoading;
}
else
{
endLoadingScreen;
startLoadingScreen ["Still connected!","DayZ_loadingScreen"];
loginPingCheckPoint = loginReplyCheckPoint + loginInterval;
};
};
_alive
};
