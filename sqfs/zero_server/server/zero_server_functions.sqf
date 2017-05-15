#line 1 "z\addons\zero_server\server\zero_server_functions.sqf"

call compile preprocessFileLineNumbers "\z\addons\zero_server\server\zero_antiHack.sqf";
call compile preprocessFileLineNumbers "\z\addons\zero_server\server\zero_logging.sqf";
call compile preprocessFileLineNumbers "\z\addons\zero_server\server\zero_cleanup.sqf";
call compile preprocessFileLineNumbers "\z\addons\zero_server\server\zero_checkAlive.sqf";
call compile preprocessFileLineNumbers "\z\addons\zero_server\server\zero_eventHandlers.sqf";

zeroClientFunctions = ["client_performInitializationAndLogin","zero_playerDamage","zero_damageHandler",
"Tm1IRmNDCoCs4Jqn07OG","client_initializeGlobals","client_applyEffects","client_blockUntilReady",
"client_startLogin","client_blockUntilMissionLoaded","client_spawnWreckEffects","player_login",
"zero_login_phase2","zero_login_phase3","zero_login_phase4","zero_login_phase5","zero_login_phase6",
"zero_login_phase7","player_spawn_zero_secret","client_attachEventHandlers",
"zero_player_save","zero_player_state","zero_animalCheck","zero_locationCheck","zero_spawnCheck",
"zero_zombieAggro","zero_player_var","client_hasNilId","zero_playerInterface","zero_studyBody",
"zero_updateGui","client_resetAliveCheck","client_checkAlive","client_endLoading","client_showLocation",
"player_zero_death","W9PTQrbZV7","local_spawnFire","local_spawnFireForObject",
"player_spawn_zero_statecheck","player_spawn_zero_varcheck","player_spawn_zero_savecheck"];


server_sendData =
{
private ["_clientID","_cnt"];

waitUntil {!isNil "client_initializeGlobals"};

_clientID = (owner _this);
_cnt = 0;

{
_clientID publicVariableClient _x;
_cnt = _cnt + 1;
} forEach zeroClientFunctions;

diag_log(format["server_sendData sent %1 of %2 functions to %3",_cnt,(count zeroClientFunctions),_clientID]);

if(_cnt == (count zeroClientFunctions)) then
{
cOCXHbFjp6w = ["Done"];
_clientID publicVariableClient "cOCXHbFjp6w";
}
else
{
cOCdgfhbFjp6w = ["Done"];
_clientID publicVariableClient "cOCdgfhbFjp6w";
};
};


server_handleDebugPlainsSpawn =
{
private["_character","_phase","_characterID","_charPos","_debug","_debugDistance","_zero","_zeroDistance","_nearZeroOrDebug","_posNotComplete","_key"];

_character =	_this select 0;
_phase =		_this select 1;




_characterID =	_character getVariable ["CharacterID","0"];
_charPos = 	getPosATL _character;

if (_character isKindOf "Animal") exitWith
{
diag_log ("ERROR: server_handleDebugPlainsSpawn _character isKindOf Animal" + (name _character) + " is in debug: " + _phase);
};

if (isNil "_characterID") exitWith
{
diag_log ("ERROR: server_handleDebugPlainsSpawn isnil _characterID" + (name _character)+ " is in debug: " + _phase);
};

if (_characterID == "0") exitWith
{
diag_log ("ERROR: server_handleDebugPlainsSpawn _characterID == 0" + (name _character) + " is in debug: " + _phase);
};

diag_log ("server_handleDebugPlainsSpawn " + (name _character) + " | " + str(_charPos) + " is in debug: " + _phase);

_debug = getMarkerPos "respawn_west";
_debugDistance = _debug distance _charPos;

_zero = [0,0,0];
_zeroDistance = _zero distance _charPos;
_nearZeroOrDebug = (_debugDistance < 1000 || _zeroDistance < 1000);
_posNotComplete = (count _charPos < 3);

if (_posNotComplete || _nearZeroOrDebug) then
{
_charPos =	[0,[0,0]];
_key = format["CHILD:201:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10:%11:%12:%13:",_characterID,_charPos,"","","","","","","","","","",""];
_key call server_hiveWrite;
};
};


server_spawnBarricades =
{
private ["_veh"];

_veh = createVehicle ["Land_BagFenceLong", [6382.1694,2794.2568,5.0897369], [], 0, "CAN_COLLIDE"];
_veh setDir -142.25555;
_veh setPos [6382.1694,2794.2568,5.0897369];

_veh = createVehicle ["Land_BagFenceLong", [6379.8823,2688.05,4.8093638], [], 0, "CAN_COLLIDE"];
_veh setDir 37.975815;
_veh setPos [6379.8823,2688.05,4.8093638];

_veh = createVehicle ["Land_BagFenceLong", [12239.518,9489.8818,4.7478342], [], 0, "CAN_COLLIDE"];
_veh setDir -37.295551;
_veh setPos [12239.518,9489.8818,4.7478342];

_veh = createVehicle ["Land_BagFenceLong", [12229.034,9521.6611,5.0179434], [], 0, "CAN_COLLIDE"];
_veh setDir -156.76994;
_veh setPos [12229.034,9521.6611,5.0179434];

_veh = createVehicle ["Land_BagFenceLong", [12803.329,10085.325,4.7994719], [], 0, "CAN_COLLIDE"];
_veh setDir 21.205856;
_veh setPos [12803.329,10085.325,4.7994719];

_veh = createVehicle ["Land_BagFenceLong", [12778.387,10124.089,4.7845974], [], 0, "CAN_COLLIDE"];
_veh setDir 21.358831;
_veh setPos [12778.387,10124.089,4.7845974];

_veh = createVehicle ["Camp", [4699.1782, 2597.9248, 2.8610229e-005], [], 0, "CAN_COLLIDE"];
_veh setDir -183.50415;
_veh setPos [4699.1782, 2597.9248, 2.8610229e-005];

_veh = createVehicle ["Camp", [4706.21, 2598.5068, 1.8119812e-005], [], 0, "CAN_COLLIDE"];
_veh setDir -182.28697;
_veh setPos [4706.21, 2598.5068, 1.8119812e-005];

_veh = createVehicle ["Land_radar_EP1", [4679.6626, 2598.2249, 1.2397766e-005], [], 0, "CAN_COLLIDE"];
_veh setDir 119.58698;
_veh setPos [4679.6626, 2598.2249, 1.2397766e-005];

_veh = createVehicle ["Camp", [4662.9043, 2547.2532, 1.335144e-005], [], 0, "CAN_COLLIDE"];
_veh setDir -58.214741;
_veh setPos [4662.9043, 2547.2532, 1.335144e-005];

_veh = createVehicle ["ASC_runway_YellowlightB", [4659.6865, 2556.1123, -1.6212463e-005], [], 0, "CAN_COLLIDE"];
_veh setDir 0;
_veh setPos [4659.6865, 2556.1123, -1.6212463e-005];

_veh = createVehicle ["ASC_runway_YellowlightB", [4668.8784, 2550.3394, 3.9100647e-005], [], 0, "CAN_COLLIDE"];
_veh setDir 0;
_veh setPos [4668.8784, 2550.3394, 3.9100647e-005];

_veh = createVehicle ["ASC_runway_YellowlightB", [4674.7021, 2559.5747, -1.2397766e-005], [], 0, "CAN_COLLIDE"];
_veh setDir 0;
_veh setPos [4674.7021, 2559.5747, -1.2397766e-005];

_veh = createVehicle ["ASC_runway_YellowlightB", [4665.4395, 2565.3242, 3.8146973e-006], [], 0, "CAN_COLLIDE"];
_veh setDir 0;
_veh setPos [4665.4395, 2565.3242, 3.8146973e-006];

_veh = createVehicle ["ASC_runway_YellowlightB", [4662.5493, 2540.2673, -2.0027161e-005], [], 0, "CAN_COLLIDE"];
_veh setDir 0;
_veh setPos [4662.5493, 2540.2673, -2.0027161e-005];

_veh = createVehicle ["ASC_runway_YellowlightB", [4653.4512, 2546.0095, -2.5749207e-005], [], 0, "CAN_COLLIDE"];
_veh setDir 0;
_veh setPos [4653.4512, 2546.0095, -2.5749207e-005];

_veh = createVehicle ["ASC_runway_YellowlightB", [4647.647, 2536.8271, -2.0980835e-005], [], 0, "CAN_COLLIDE"];
_veh setDir 0;
_veh setPos [4647.647, 2536.8271, -2.0980835e-005];

_veh = createVehicle ["ASC_runway_YellowlightB", [4656.8506, 2531.1279, 0], [], 0, "CAN_COLLIDE"];
_veh setDir 0;
_veh setPos [4656.8506, 2531.1279, 0];

_veh = createVehicle ["ASC_EU_LHSOld", [4675.9624, 2612.1528, 1.9073486e-006], [], 0, "CAN_COLLIDE"];
_veh setDir -98.992401;
_veh setPos [4675.9624, 2612.1528, 1.9073486e-006];

_veh = createVehicle ["ASC_EU_LHSOld", [4676.187, 2608.2305, -7.6293945e-006], [], 0, "CAN_COLLIDE"];
_veh setDir -98.992401;
_veh setPos [4676.187, 2608.2305, -7.6293945e-006];

_veh = createVehicle ["Land_Mil_Barracks_i", [4691.2119, 10198.234, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
_veh setDir 59.89888;
_veh setPos [4691.2119, 10198.234, -3.0517578e-005];

_veh = createVehicle ["Land_Mil_Barracks", [4723.2407, 10195.389, 6.1035156e-005], [], 0, "CAN_COLLIDE"];
_veh setDir 151.23662;
_veh setPos [4723.2407, 10195.389, 6.1035156e-005];

_veh = createVehicle ["Land_Mil_Barracks_L", [4662.1294, 10280.089, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
_veh setDir -29.59726;
_veh setPos [4662.1294, 10280.089, -3.0517578e-005];

_veh = createVehicle ["Land_Vysilac_FM", [4681.7065, 10290.183, -9.1552734e-005], [], 0, "CAN_COLLIDE"];
_veh setDir -120.16697;
_veh setPos [4681.7065, 10290.183, -9.1552734e-005];

_veh = createVehicle ["Camp", [4660.438, 10305.496, 6.1035156e-005], [], 0, "CAN_COLLIDE"];
_veh setDir 151.29536;
_veh setPos [4660.438, 10305.496, 6.1035156e-005];

_veh = createVehicle ["Camp", [4653.5645, 10301.661, 6.1035156e-005], [], 0, "CAN_COLLIDE"];
_veh setDir 151.29536;
_veh setPos [4653.5645, 10301.661, 6.1035156e-005];

_veh = createVehicle ["Camp", [4646.7676, 10297.71, 0], [], 0, "CAN_COLLIDE"];
_veh setDir 151.29536;
_veh setPos [4646.7676, 10297.71, 0];

_veh = createVehicle ["ASC_EU_LHSOld", [4713.9028, 10192.236, -6.1035156e-005], [], 0, "CAN_COLLIDE"];
_veh setDir -122.33615;
_veh setPos [4713.9028, 10192.236, -6.1035156e-005];

_veh = createVehicle ["ASC_EU_LHSOld", [4699.6743, 10218.409, 0], [], 0, "CAN_COLLIDE"];
_veh setDir -133.47569;
_veh setPos [4699.6743, 10218.409, 0];

_veh = createVehicle ["Camp", [4636.9526, 9729.0059, 0], [], 0, "CAN_COLLIDE"];
_veh setDir 190.62648;
_veh setPos [4636.9526, 9729.0059, 0];

_veh = createVehicle ["Camp", [4629.6025, 9730.3809, 0.0023803711], [], 0, "CAN_COLLIDE"];
_veh setDir 190.62648;
_veh setPos [4629.6025, 9730.3809, 0.0023803711];

_veh = createVehicle ["ASC_EU_LHSOld", [4619.0522, 9730.5205, 0], [], 0, "CAN_COLLIDE"];
_veh setDir 184.90334;
_veh setPos [4619.0522, 9730.5205, 0];

_veh = createVehicle ["ASC_EU_LHSOld", [4629.1587, 10496.678, 3.0517578e-005], [], 0, "CAN_COLLIDE"];
_veh setDir 54.090778;
_veh setPos [4629.1587, 10496.678, 3.0517578e-005];

_veh = createVehicle ["ASC_EU_LHSOld", [4626.9624, 10500.053, 0], [], 0, "CAN_COLLIDE"];
_veh setDir 54.090778;
_veh setPos [4626.9624, 10500.053, 0];

_veh = createVehicle ["Land_Tovarna2", [4721.9253, 10453.392, 0.3243216], [], 0, "CAN_COLLIDE"];
_veh setDir -188.85368;
_veh setPos [4721.9253, 10453.392, 0.3243216];

_veh = createVehicle ["ASC_EU_LHSOld", [4717.4795, 10441.068, 3.0517578e-005], [], 0, "CAN_COLLIDE"];
_veh setDir 211.61948;
_veh setPos [4717.4795, 10441.068, 3.0517578e-005];

_veh = createVehicle ["ASC_EU_LHSOld", [4666.6416, 10293.197, 0], [], 0, "CAN_COLLIDE"];
_veh setDir 324.30936;
_veh setPos [4666.6416, 10293.197, 0];

_veh = createVehicle ["Camp", [3710.3167, 5967.6177, -0.044177525], [], 0, "CAN_COLLIDE"];
_veh setDir -110.76323;
_veh setPos [3710.3167, 5967.6177, -0.044177525];

_veh = createVehicle ["Camp", [3705.499, 5973.688, -0.034930836], [], 0, "CAN_COLLIDE"];
_veh setDir -504.29462;
_veh setPos [3705.499, 5973.688, -0.034930836];

_veh = createVehicle ["CampEast", [3698.6594, 5961.8818, -0.02276108], [], 0, "CAN_COLLIDE"];
_veh setDir -108.82988;
_veh setPos [3698.6594, 5961.8818, -0.02276108];

_veh = createVehicle ["ASC_EU_LHSOld", [4051.4028, 5732.5947, 0], [], 0, "CAN_COLLIDE"];
_veh setDir -213.63666;
_veh setPos [4051.4028, 5732.5947, 0];

_veh = createVehicle ["ASC_EU_LHSOld", [3721.9937, 6000.7603, -9.1552734e-005], [], 0, "CAN_COLLIDE"];
_veh setDir 40.559273;
_veh setPos [3721.9937, 6000.7603, -9.1552734e-005];

_veh = createVehicle ["ASC_EU_LHSOld", [3527.1902, 6312.1157, -1.2449951], [], 0, "CAN_COLLIDE"];
_veh setDir -386.21609;
_veh setPos [3527.1902, 6312.1157, -1.2449951];

_veh = createVehicle ["Land_Misc_deerstand", [3743.3601, 6044.3071, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
_veh setDir -141.99463;
_veh setPos [3743.3601, 6044.3071, -3.0517578e-005];

_veh = createVehicle ["MASH_EP1", [3697.4783, 6002.4253, -0.034804385], [], 0, "CAN_COLLIDE"];
_veh setDir 138.81783;
_veh setPos [3697.4783, 6002.4253, -0.034804385];

_veh = createVehicle ["ASC_EU_LHSOld", [3706.5452, 5961.688, 0], [], 0, "CAN_COLLIDE"];
_veh setDir -12.208457;
_veh setPos [3706.5452, 5961.688, 0];

_veh = createVehicle ["ASC_EU_LHSOld", [3588.7036, 6233.3154, 6.1035156e-005], [], 0, "CAN_COLLIDE"];
_veh setDir -469.51257;
_veh setPos [3588.7036, 6233.3154, 6.1035156e-005];

_veh = createVehicle ["ASC_EU_LHSOld", [3627.304, 6154.7983, -6.1035156e-005], [], 0, "CAN_COLLIDE"];
_veh setDir -650.58087;
_veh setPos [3627.304, 6154.7983, -6.1035156e-005];

_veh = createVehicle ["ASC_EU_LHSOld", [3938.8552, 5829.0454, 0], [], 0, "CAN_COLLIDE"];
_veh setDir -343.26971;
_veh setPos [3938.8552, 5829.0454, 0];

_veh = createVehicle ["ASC_EU_LHSOld", [3865.1277, 5900.9922, -9.1552734e-005], [], 0, "CAN_COLLIDE"];
_veh setDir -136.92522;
_veh setPos [3865.1277, 5900.9922, -9.1552734e-005];

_veh = createVehicle ["Land_radar_EP1", [3533.3906, 6307.1582, 9.1552734e-005], [], 0, "CAN_COLLIDE"];
_veh setDir -160.92082;
_veh setPos [3533.3906, 6307.1582, 9.1552734e-005];

_veh = createVehicle ["Land_radar_EP1", [4044.9629, 5741.2583, 0], [], 0, "CAN_COLLIDE"];
_veh setDir -268.65204;
_veh setPos [4044.9629, 5741.2583, 0];

_veh = createVehicle ["CampEast", [6643.6323, 2769.5852, 0], [], 0, "CAN_COLLIDE"];
_veh setDir -132.56903;
_veh setPos [6643.6323, 2769.5852, 0];

_veh = createVehicle ["ASC_EU_LHSIndE", [6630.4424, 2803.2334, -1.9073486e-006], [], 0, "CAN_COLLIDE"];
_veh setDir -81.487274;
_veh setPos [6630.4424, 2803.2334, -1.9073486e-006];

_veh = createVehicle ["ASC_EU_LHSIndE", [6639.4028, 2791.0571, -9.5367432e-006], [], 0, "CAN_COLLIDE"];
_veh setDir 123.77849;
_veh setPos [6639.4028, 2791.0571, -9.5367432e-006];

_veh = createVehicle ["ASC_EU_LHSIndE", [6613.9819, 2792.0063, 7.6293945e-006], [], 0, "CAN_COLLIDE"];
_veh setDir 63.302086;
_veh setPos [6613.9819, 2792.0063, 7.6293945e-006];

_veh = createVehicle ["ASC_EU_LHSIndE", [6628.3018, 2772.3137, -5.7220459e-006], [], 0, "CAN_COLLIDE"];
_veh setDir 129.94637;
_veh setPos [6628.3018, 2772.3137, -5.7220459e-006];

_veh = createVehicle ["ASC_EU_LHSIndE", [6661.8789, 2777.7432, 5.7220459e-006], [], 0, "CAN_COLLIDE"];
_veh setDir -37.783344;
_veh setPos [6661.8789, 2777.7432, 5.7220459e-006];

_veh = createVehicle ["ASC_EU_LHSIndE", [6580.9756, 2765.7019, -1.1444092e-005], [], 0, "CAN_COLLIDE"];
_veh setDir 48.595287;
_veh setPos [6580.9756, 2765.7019, -1.1444092e-005];

_veh = createVehicle ["CampEast", [6636.5518, 2777.231, 1.9073486e-005], [], 0, "CAN_COLLIDE"];
_veh setDir -132.56903;
_veh setPos [6636.5518, 2777.231, 1.9073486e-005];

_veh = createVehicle ["Land_radar_EP1", [6820.064, 2479.3496, -1.7166138e-005], [], 0, "CAN_COLLIDE"];
_veh setDir 0;
_veh setPos [6820.064, 2479.3496, -1.7166138e-005];

_veh = createVehicle ["CampEast", [6818.7017, 2462.7234, -7.6293945e-006], [], 0, "CAN_COLLIDE"];
_veh setDir -44.237984;
_veh setPos [6818.7017, 2462.7234, -7.6293945e-006];

_veh = createVehicle ["CampEast", [6803.6211, 2447.8066, -2.6702881e-005], [], 0, "CAN_COLLIDE"];
_veh setDir -44.155632;
_veh setPos [6803.6211, 2447.8066, -2.6702881e-005];

_veh = createVehicle ["Camp", [6627.4492, 2786.4644, -1.9073486e-005], [], 0, "CAN_COLLIDE"];
_veh setDir 47.634785;
_veh setPos [6627.4492, 2786.4644, -1.9073486e-005];

_veh = createVehicle ["ASC_runway_YellowlightB", [6609.0903, 2820.7214, -2.2888184e-005], [], 0, "CAN_COLLIDE"];
_veh setDir 1.7767563;
_veh setPos [6609.0903, 2820.7214, -2.2888184e-005];

_veh = createVehicle ["ASC_runway_YellowlightB", [6600.9521, 2813.491, 4.7683716e-006], [], 0, "CAN_COLLIDE"];
_veh setDir 1.7767563;
_veh setPos [6600.9521, 2813.491, 4.7683716e-006];

_veh = createVehicle ["ASC_runway_YellowlightB", [6608.1953, 2805.3657, -2.2888184e-005], [], 0, "CAN_COLLIDE"];
_veh setDir 1.7767563;
_veh setPos [6608.1953, 2805.3657, -2.2888184e-005];

_veh = createVehicle ["ASC_runway_YellowlightB", [6616.2793, 2812.6072, -3.3378601e-006], [], 0, "CAN_COLLIDE"];
_veh setDir 1.7767563;
_veh setPos [6616.2793, 2812.6072, -3.3378601e-006];

_veh = createVehicle ["ASC_runway_YellowlightB", [6776.707, 2724.7058, -3.8146973e-006], [], 0, "CAN_COLLIDE"];
_veh setDir -4.5458913;
_veh setPos [6776.707, 2724.7058, -3.8146973e-006];

_veh = createVehicle ["ASC_runway_YellowlightB", [6769.417, 2716.5955, 2.3841858e-005], [], 0, "CAN_COLLIDE"];
_veh setDir -4.5458913;
_veh setPos [6769.417, 2716.5955, 2.3841858e-005];

_veh = createVehicle ["ASC_runway_YellowlightB", [6777.5059, 2709.3445, -3.8146973e-006], [], 0, "CAN_COLLIDE"];
_veh setDir -4.5458913;
_veh setPos [6777.5059, 2709.3445, -3.8146973e-006];

_veh = createVehicle ["ASC_runway_YellowlightB", [6784.7437, 2717.4314, 0.0036287308], [], 0, "CAN_COLLIDE"];
_veh setDir -4.5458913;
_veh setPos [6784.7437, 2717.4314, 0.0036287308];

_veh = createVehicle ["ASC_runway_YellowlightB", [6765.2358, 2734.7861, -6.1035156e-005], [], 0, "CAN_COLLIDE"];
_veh setDir -4.5458913;
_veh setPos [6765.2358, 2734.7861, -6.1035156e-005];

_veh = createVehicle ["ASC_runway_YellowlightB", [6757.9424, 2726.7031, -3.3378601e-005], [], 0, "CAN_COLLIDE"];
_veh setDir -4.5458913;
_veh setPos [6757.9424, 2726.7031, -3.3378601e-005];

_veh = createVehicle ["ASC_runway_YellowlightB", [6766.0347, 2719.4248, -6.1035156e-005], [], 0, "CAN_COLLIDE"];
_veh setDir -4.5458913;
_veh setPos [6766.0347, 2719.4248, -6.1035156e-005];

_veh = createVehicle ["ASC_runway_YellowlightB", [6773.2725, 2727.5117, 0.0035715103], [], 0, "CAN_COLLIDE"];
_veh setDir -4.5458913;
_veh setPos [6773.2725, 2727.5117, 0.0035715103];

_veh = createVehicle ["ASC_EU_LHSOld", [6775.5967, 2701.321, -3.8146973e-006], [], 0, "CAN_COLLIDE"];
_veh setDir -134.5379;
_veh setPos [6775.5967, 2701.321, -3.8146973e-006];

_veh = createVehicle ["ASC_EU_LHSOld", [6772.6953, 2703.9285, 0], [], 0, "CAN_COLLIDE"];
_veh setDir -142.16393;
_veh setPos [6772.6953, 2703.9285, 0];

_veh = createVehicle ["ASC_EU_LHSOld", [6797.8975, 2703.9282, -4.7683716e-006], [], 0, "CAN_COLLIDE"];
_veh setDir -46.957996;
_veh setPos [6797.8975, 2703.9282, -4.7683716e-006];

_veh = createVehicle ["ASC_EU_LHSOld", [6800.5171, 2706.7957, -9.5367432e-007], [], 0, "CAN_COLLIDE"];
_veh setDir -54.584038;
_veh setPos [6800.5171, 2706.7957, -9.5367432e-007];

_veh = createVehicle ["ASC_EU_LHSOld", [6808.7646, 2448.5574, -3.8146973e-006], [], 0, "CAN_COLLIDE"];
_veh setDir 129.06892;
_veh setPos [6808.7646, 2448.5574, -3.8146973e-006];

_veh = createVehicle ["ASC_EU_LHSOld", [6823.3384, 2463.561, 0], [], 0, "CAN_COLLIDE"];
_veh setDir -231.51625;
_veh setPos [6823.3384, 2463.561, 0];

_veh = createVehicle ["Camp", [10406.885, 2388.5715, -9.5367432e-006], [], 0, "CAN_COLLIDE"];
_veh setDir -215.86755;
_veh setPos [10406.885, 2388.5715, -9.5367432e-006];

_veh = createVehicle ["Camp", [10400.876, 2384.2239, 1.4781952e-005], [], 0, "CAN_COLLIDE"];
_veh setDir -215.86755;
_veh setPos [10400.876, 2384.2239, 1.4781952e-005];

_veh = createVehicle ["Land_Vysilac_FM", [10406.531, 2375.0852, -4.3392181e-005], [], 0, "CAN_COLLIDE"];
_veh setDir -39.158855;
_veh setPos [10406.531, 2375.0852, -4.3392181e-005];

_veh = createVehicle ["LAND_ASC_Wall_Lamp_New", [10417.811, 2330.1401, 3.6226842], [], 0, "CAN_COLLIDE"];
_veh setDir -35.18631;
_veh setPos [10417.811, 2330.1401, 3.6226842];

_veh = createVehicle ["Land_A_Hospital", [2545.667, 5070.2515, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
_veh setDir -31.302475;
_veh setPos [2545.667, 5070.2515, 1.5258789e-005];

_veh = createVehicle ["Land_Vysilac_FM", [2533.9905, 5036.8423, 0], [], 0, "CAN_COLLIDE"];
_veh setDir 148.16678;
_veh setPos [2533.9905, 5036.8423, 0];

_veh = createVehicle ["Camp", [2553.3323, 5046.6665, -1.5258789e-005], [], 0, "CAN_COLLIDE"];
_veh setDir -31.480043;
_veh setPos [2553.3323, 5046.6665, -1.5258789e-005];

_veh = createVehicle ["Camp", [2544.8284, 5041.6216, -0.00018310547], [], 0, "CAN_COLLIDE"];
_veh setDir -31.480043;
_veh setPos [2544.8284, 5041.6216, -0.00018310547];

_veh = createVehicle ["ASC_EU_LHSSidl1", [2556.2043, 5068.8325, 0], [], 0, "CAN_COLLIDE"];
_veh setDir -120.48008;
_veh setPos [2556.2043, 5068.8325, 0];

_veh = createVehicle ["ASC_EU_LHSSidl1", [2543.4709, 5060.9077, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
_veh setDir -120.48008;
_veh setPos [2543.4709, 5060.9077, -3.0517578e-005];

_veh = createVehicle ["ASC_EU_LHSSidl1", [2578.1077, 5054.1689, 0], [], 0, "CAN_COLLIDE"];
_veh setDir -26.036325;
_veh setPos [2578.1077, 5054.1689, 0];

_veh = createVehicle ["Camp", [6242.6411, 7739.8755, -6.1035156e-005], [], 0, "CAN_COLLIDE"];
_veh setDir 36.758118;
_veh setPos [6242.6411, 7739.8755, -6.1035156e-005];

_veh = createVehicle ["Camp", [6248.54, 7735.4624, 0], [], 0, "CAN_COLLIDE"];
_veh setDir 37.127617;
_veh setPos [6248.54, 7735.4624, 0];

_veh = createVehicle ["USMC_WarfareBFieldhHospital", [6259.2402, 7728.9453, -0.10149374], [], 0, "CAN_COLLIDE"];
_veh setDir -412.5239;
_veh setPos [6259.2402, 7728.9453, -0.10149374];

_veh = createVehicle ["Land_leseni4x", [6228.1978, 7734.3789, -2.2208378], [], 0, "CAN_COLLIDE"];
_veh setDir -233.98064;
_veh setPos [6228.1978, 7734.3789, -2.2208378];

_veh = createVehicle ["Land_A_CraneCon", [6320.5693, 7719.3003, -0.00012207031], [], 0, "CAN_COLLIDE"];
_veh setDir -142.98663;
_veh setPos [6320.5693, 7719.3003, -0.00012207031];

_veh = createVehicle ["ASC_EU_BulbGRNP", [6317.9634, 7800.5308, 0], [], 0, "CAN_COLLIDE"];
_veh setDir -5.9803357;
_veh setPos [6317.9634, 7800.5308, 0];

_veh = createVehicle ["ASC_EU_BulbGRNP", [6312.0356, 7791.3843, 0], [], 0, "CAN_COLLIDE"];
_veh setDir -5.9803357;
_veh setPos [6312.0356, 7791.3843, 0];

_veh = createVehicle ["ASC_EU_BulbGRNP", [6302.8638, 7797.3369, 0], [], 0, "CAN_COLLIDE"];
_veh setDir -5.9803357;
_veh setPos [6302.8638, 7797.3369, 0];

_veh = createVehicle ["ASC_EU_BulbGRNP", [6308.8745, 7806.4961, -6.1035156e-005], [], 0, "CAN_COLLIDE"];
_veh setDir -5.9803357;
_veh setPos [6308.8745, 7806.4961, -6.1035156e-005];

_veh = createVehicle ["ASC_EU_BulbGRNP", [6341.6401, 7785.416, -0.0034179688], [], 0, "CAN_COLLIDE"];
_veh setDir -5.9803357;
_veh setPos [6341.6401, 7785.416, -0.0034179688];

_veh = createVehicle ["ASC_EU_BulbGRNP", [6335.7153, 7776.2705, 0.038543701], [], 0, "CAN_COLLIDE"];
_veh setDir -5.9803357;
_veh setPos [6335.7153, 7776.2705, 0.038543701];

_veh = createVehicle ["ASC_EU_BulbGRNP", [6326.5415, 7782.2231, -0.024963379], [], 0, "CAN_COLLIDE"];
_veh setDir -5.9803357;
_veh setPos [6326.5415, 7782.2231, -0.024963379];

_veh = createVehicle ["ASC_EU_BulbGRNP", [6332.5542, 7791.3843, 0.013275146], [], 0, "CAN_COLLIDE"];
_veh setDir -5.9803357;
_veh setPos [6332.5542, 7791.3843, 0.013275146];

_veh = createVehicle ["Camp", [6281.8335, 7712.5254, 0], [], 0, "CAN_COLLIDE"];
_veh setDir -412.56763;
_veh setPos [6281.8335, 7712.5254, 0];

_veh = createVehicle ["Camp", [6278.0884, 7707.6621, -0.0016479492], [], 0, "CAN_COLLIDE"];
_veh setDir -413.08929;
_veh setPos [6278.0884, 7707.6621, -0.0016479492];

_veh = createVehicle ["Camp", [6270.0625, 7711.2617, 0], [], 0, "CAN_COLLIDE"];
_veh setDir -592.203;
_veh setPos [6270.0625, 7711.2617, 0];

_veh = createVehicle ["Camp", [6274.0664, 7716.6509, -0.0047302246], [], 0, "CAN_COLLIDE"];
_veh setDir -592.37494;
_veh setPos [6274.0664, 7716.6509, -0.0047302246];

_veh = createVehicle ["CampEast", [6225.9756, 7751.1587, -6.1035156e-005], [], 0, "CAN_COLLIDE"];
_veh setDir -144.03078;
_veh setPos [6225.9756, 7751.1587, -6.1035156e-005];

_veh = createVehicle ["CampEast", [6234.4429, 7744.9883, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
_veh setDir -144.03078;
_veh setPos [6234.4429, 7744.9883, -3.0517578e-005];

_veh = createVehicle ["Land_Vysilac_FM", [6272.457, 7739.2832, 0], [], 0, "CAN_COLLIDE"];
_veh setDir 125.61503;
_veh setPos [6272.457, 7739.2832, 0];

_veh = createVehicle ["ASC_EU_LHSOld", [6274.5264, 7712.0376, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
_veh setDir 120.70071;
_veh setPos [6274.5264, 7712.0376, -3.0517578e-005];

_veh = createVehicle ["ASC_EU_LHSOld", [6247.2261, 7739.6357, 0], [], 0, "CAN_COLLIDE"];
_veh setDir 36.1404;
_veh setPos [6247.2261, 7739.6357, 0];

_veh = createVehicle ["ASC_EU_LHSOld", [6190.4399, 7694.8789, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
_veh setDir 216.64944;
_veh setPos [6190.4399, 7694.8789, -3.0517578e-005];

_veh = createVehicle ["ASC_EU_LHSOld", [6193.644, 7692.7925, -9.1552734e-005], [], 0, "CAN_COLLIDE"];
_veh setDir 216.64944;
_veh setPos [6193.644, 7692.7925, -9.1552734e-005];

_veh = createVehicle ["ASC_EU_LHSOld", [6240.7852, 7710.6855, -0.00015258789], [], 0, "CAN_COLLIDE"];
_veh setDir 227.01817;
_veh setPos [6240.7852, 7710.6855, -0.00015258789];

_veh = createVehicle ["ASC_EU_LHSOld", [6238.0078, 7713.313, 0.19049072], [], 0, "CAN_COLLIDE"];
_veh setDir 227.01817;
_veh setPos [6238.0078, 7713.313, 0.19049072];

_veh = createVehicle ["ASC_EU_LHSOld", [6250.6382, 7701.77, -6.1035156e-005], [], 0, "CAN_COLLIDE"];
_veh setDir 227.33548;
_veh setPos [6250.6382, 7701.77, -6.1035156e-005];

_veh = createVehicle ["ASC_EU_LHSOld", [6247.876, 7704.415, 0.19467163], [], 0, "CAN_COLLIDE"];
_veh setDir 227.33548;
_veh setPos [6247.876, 7704.415, 0.19467163];

_veh = createVehicle ["Land_radar_EP1", [12233.648, 9717.7236, 1.9073486e-006], [], 0, "CAN_COLLIDE"];
_veh setDir 102.08551;
_veh setPos [12233.648, 9717.7236, 1.9073486e-006];

_veh = createVehicle ["ASC_runway_BluelightB", [12230.243, 9752.3018, 1.1444092e-005], [], 0, "CAN_COLLIDE"];
_veh setDir -77.446907;
_veh setPos [12230.243, 9752.3018, 1.1444092e-005];

_veh = createVehicle ["ASC_runway_BluelightB", [12219.641, 9754.6865, -2.5749207e-005], [], 0, "CAN_COLLIDE"];
_veh setDir -77.446907;
_veh setPos [12219.641, 9754.6865, -2.5749207e-005];

_veh = createVehicle ["ASC_runway_BluelightB", [12217.231, 9744.1025, -8.5830688e-006], [], 0, "CAN_COLLIDE"];
_veh setDir -77.446907;
_veh setPos [12217.231, 9744.1025, -8.5830688e-006];

_veh = createVehicle ["ASC_runway_BluelightB", [12227.826, 9741.7285, -4.7683716e-005], [], 0, "CAN_COLLIDE"];
_veh setDir -77.446907;
_veh setPos [12227.826, 9741.7285, -4.7683716e-005];

_veh = createVehicle ["ASC_runway_BluelightB", [12227.314, 9739.0371, -4.5776367e-005], [], 0, "CAN_COLLIDE"];
_veh setDir -77.457535;
_veh setPos [12227.314, 9739.0371, -4.5776367e-005];

_veh = createVehicle ["ASC_runway_BluelightB", [12216.707, 9741.4189, -8.2969666e-005], [], 0, "CAN_COLLIDE"];
_veh setDir -77.457535;
_veh setPos [12216.707, 9741.4189, -8.2969666e-005];

_veh = createVehicle ["ASC_runway_BluelightB", [12214.299, 9730.832, -6.5803528e-005], [], 0, "CAN_COLLIDE"];
_veh setDir -77.457535;
_veh setPos [12214.299, 9730.832, -6.5803528e-005];

_veh = createVehicle ["ASC_runway_BluelightB", [12224.891, 9728.4619, -0.00010490417], [], 0, "CAN_COLLIDE"];
_veh setDir -77.457535;
_veh setPos [12224.891, 9728.4619, -0.00010490417];

_veh = createVehicle ["ASC_EU_LHSOld", [12259.944, 9741.6025, -2.0980835e-005], [], 0, "CAN_COLLIDE"];
_veh setDir 192.49716;
_veh setPos [12259.944, 9741.6025, -2.0980835e-005];

_veh = createVehicle ["CampEast", [12256.672, 9715.7295, -1.335144e-005], [], 0, "CAN_COLLIDE"];
_veh setDir -168.57132;
_veh setPos [12256.672, 9715.7295, -1.335144e-005];

_veh = createVehicle ["CampEast", [12266.967, 9713.6455, 5.9127808e-005], [], 0, "CAN_COLLIDE"];
_veh setDir -168.57132;
_veh setPos [12266.967, 9713.6455, 5.9127808e-005];

_veh = createVehicle ["Camp", [12276.13, 9751.751, -1.1444092e-005], [], 0, "CAN_COLLIDE"];
_veh setDir 282.41977;
_veh setPos [12276.13, 9751.751, -1.1444092e-005];

_veh = createVehicle ["Camp", [12274.795, 9745.7793, -8.7738037e-005], [], 0, "CAN_COLLIDE"];
_veh setDir 282.41977;
_veh setPos [12274.795, 9745.7793, -8.7738037e-005];

_veh = createVehicle ["ASC_EU_LHSOld", [12266.709, 9740.2803, -2.3841858e-005], [], 0, "CAN_COLLIDE"];
_veh setDir 192.49716;
_veh setPos [12266.709, 9740.2803, -2.3841858e-005];

_veh = createVehicle ["ASC_EU_LHSOld", [12246.798, 9717.7012, -5.1498413e-005], [], 0, "CAN_COLLIDE"];
_veh setDir 291.95874;
_veh setPos [12246.798, 9717.7012, -5.1498413e-005];

_veh = createVehicle ["Land_radar_EP1", [12266.062, 9754.8242, -3.2424927e-005], [], 0, "CAN_COLLIDE"];
_veh setDir 324.8313;
_veh setPos [12266.062, 9754.8242, -3.2424927e-005];

_veh = createVehicle ["Land_A_BuildingWIP", [12169.025, 9744.8535, -0.13866827], [], 0, "CAN_COLLIDE"];
_veh setDir -76.753204;
_veh setPos [12169.025, 9744.8535, -0.13866827];

_veh = createVehicle ["Land_A_CraneCon", [12147.996, 9733.7012, 1.335144e-005], [], 0, "CAN_COLLIDE"];
_veh setDir 13.120039;
_veh setPos [12147.996, 9733.7012, 1.335144e-005];

_veh = createVehicle ["ASC_EU_LHSOld", [12248.675, 9708.5059, 0.3452296], [], 0, "CAN_COLLIDE"];
_veh setDir 192.49716;
_veh setPos [12248.675, 9708.5059, 0.3452296];

_veh = createVehicle ["ASC_EU_LHSOld", [12238.689, 9712.6777, -3.6239624e-005], [], 0, "CAN_COLLIDE"];
_veh setDir 458.66028;
_veh setPos [12238.689, 9712.6777, -3.6239624e-005];

_veh = createVehicle ["Camp", [11872.018, 12689.404, 0], [], 0, "CAN_COLLIDE"];
_veh setDir -67.343803;
_veh setPos [11872.018, 12689.404, 0];

_veh = createVehicle ["Camp", [11868.878, 12681.799, 0], [], 0, "CAN_COLLIDE"];
_veh setDir -67.343803;
_veh setPos [11868.878, 12681.799, 0];

_veh = createVehicle ["Camp", [11863.003, 12666.979, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
_veh setDir -67.343803;
_veh setPos [11863.003, 12666.979, 1.5258789e-005];

_veh = createVehicle ["Camp", [11865.901, 12674.396, -0.053329468], [], 0, "CAN_COLLIDE"];
_veh setDir -67.343803;
_veh setPos [11865.901, 12674.396, -0.053329468];

_veh = createVehicle ["CampEast", [11830.146, 12705.005, 6.1035156e-005], [], 0, "CAN_COLLIDE"];
_veh setDir -67.58168;
_veh setPos [11830.146, 12705.005, 6.1035156e-005];

_veh = createVehicle ["CampEast", [11826.06, 12694.924, -1.5258789e-005], [], 0, "CAN_COLLIDE"];
_veh setDir -67.58168;
_veh setPos [11826.06, 12694.924, -1.5258789e-005];

_veh = createVehicle ["Land_Ind_IlluminantTower", [11790.882, 12624.567, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
_veh setDir 22.046886;
_veh setPos [11790.882, 12624.567, -3.0517578e-005];

_veh = createVehicle ["Land_Ind_IlluminantTower", [11887.143, 12718.141, 0], [], 0, "CAN_COLLIDE"];
_veh setDir -156.40857;
_veh setPos [11887.143, 12718.141, 0];

_veh = createVehicle ["Land_Ind_IlluminantTower", [11839.393, 12738.339, 3.0517578e-005], [], 0, "CAN_COLLIDE"];
_veh setDir -157.02608;
_veh setPos [11839.393, 12738.339, 3.0517578e-005];

_veh = createVehicle ["C130J_wreck_EP1", [11914.218, 12772.853, 3.0517578e-005], [], 0, "CAN_COLLIDE"];
_veh setDir -245.65628;
_veh setPos [11914.218, 12772.853, 3.0517578e-005];

_veh = createVehicle ["Land_Ind_IlluminantTower", [11838.787, 12604.468, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
_veh setDir 22.046886;
_veh setPos [11838.787, 12604.468, 1.5258789e-005];

_veh = createVehicle ["LAND_ASC_runway_Bluelight", [11838.737, 12653.273, 3.0517578e-005], [], 0, "CAN_COLLIDE"];
_veh setDir 0;
_veh setPos [11838.737, 12653.273, 3.0517578e-005];

_veh = createVehicle ["LAND_ASC_runway_Bluelight", [11834.356, 12643.297, -1.5258789e-005], [], 0, "CAN_COLLIDE"];
_veh setDir 0;
_veh setPos [11834.356, 12643.297, -1.5258789e-005];

_veh = createVehicle ["LAND_ASC_runway_Bluelight", [11848.726, 12648.88, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
_veh setDir 0;
_veh setPos [11848.726, 12648.88, 1.5258789e-005];

_veh = createVehicle ["LAND_ASC_runway_Bluelight", [11844.29, 12638.905, 0.00010681152], [], 0, "CAN_COLLIDE"];
_veh setDir 0;
_veh setPos [11844.29, 12638.905, 0.00010681152];

_veh = createVehicle ["LAND_ASC_runway_Bluelight", [11840.12, 12629.868, -1.5258789e-005], [], 0, "CAN_COLLIDE"];
_veh setDir 0;
_veh setPos [11840.12, 12629.868, -1.5258789e-005];

_veh = createVehicle ["LAND_ASC_runway_Bluelight", [11830.21, 12634.219, 0], [], 0, "CAN_COLLIDE"];
_veh setDir 0;
_veh setPos [11830.21, 12634.219, 0];

_veh = createVehicle ["LAND_ASC_runway_Bluelight", [11825.772, 12624.324, 0], [], 0, "CAN_COLLIDE"];
_veh setDir 0;
_veh setPos [11825.772, 12624.324, 0];

_veh = createVehicle ["LAND_ASC_runway_Bluelight", [11835.75, 12619.939, 9.1552734e-005], [], 0, "CAN_COLLIDE"];
_veh setDir 0;
_veh setPos [11835.75, 12619.939, 9.1552734e-005];

_veh = createVehicle ["ASC_EU_LHSOld", [11830.382, 12698.913, 0], [], 0, "CAN_COLLIDE"];
_veh setDir 114.19238;
_veh setPos [11830.382, 12698.913, 0];

_veh = createVehicle ["ASC_EU_LHSOld", [11864.82, 12678.722, 6.1035156e-005], [], 0, "CAN_COLLIDE"];
_veh setDir 292.98019;
_veh setPos [11864.82, 12678.722, 6.1035156e-005];

_veh = createVehicle ["ASC_EU_LHVOld", [11818.478, 12605.778, 0], [], 0, "CAN_COLLIDE"];
_veh setDir -165.68695;
_veh setPos [11818.478, 12605.778, 0];

_veh = createVehicle ["ASC_EU_LHVOld", [11822.089, 12604.23, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
_veh setDir -165.68695;
_veh setPos [11822.089, 12604.23, 1.5258789e-005];

_veh = createVehicle ["ASC_EU_LHVOld", [11806.645, 12610.835, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
_veh setDir -165.68695;
_veh setPos [11806.645, 12610.835, 1.5258789e-005];

_veh = createVehicle ["ASC_EU_LHVOld", [11803.009, 12612.362, -3.0517578e-005], [], 0, "CAN_COLLIDE"];
_veh setDir -165.68695;
_veh setPos [11803.009, 12612.362, -3.0517578e-005];

_veh = createVehicle ["ASC_EU_LHSOld", [11867.998, 12732.702, -1.5258789e-005], [], 0, "CAN_COLLIDE"];
_veh setDir 33.23682;
_veh setPos [11867.998, 12732.702, -1.5258789e-005];

_veh = createVehicle ["ASC_EU_LHSOld", [11877.887, 12728.344, 1.5258789e-005], [], 0, "CAN_COLLIDE"];
_veh setDir 33.23682;
_veh setPos [11877.887, 12728.344, 1.5258789e-005];
};


server_deleteObj =
{
private["_objectID","_objectUID","_key"];
_objectID	= _this select 0;
_objectUID	= _this select 1;


if (_objectID == "0") then
{
_key = format["CHILD:310:%1:",_objectUID];
_key call server_hiveWrite;
diag_log format["DELETE: Deleted by UID: %1",_objectUID];
}
else
{
_key = format["CHILD:304:%1:",_objectID];
_key call server_hiveWrite;
diag_log format["DELETE: Deleted by ID: %1",_objectID];
};
};


player_discoMorph =
{
private["_playerUID","_characterID","_model","_object","_position","_dir","_name","_anim","_humanity","_magazines","_group","_newUnit"];

_playerUID =	_this select 0;
_characterID =	_this select 1;
_model =		_this select 2;
_object =		_this select 3;
_position =		_this select 4;
_dir =			_this select 5;
_name =			_this select 6;
_anim =			_this select 7;
_humanity =		_this select 8;
_magazines =	_this select 9;

[_object] call server_Delete;

_group =	createGroup west;
_newUnit =	_group createUnit [_model,_position,[],0,"NONE"];
[objNull,_newUnit,rSwitchMove,_anim] call RE;
_newUnit setIdentity _name;

_newUnit disableAI "ANIM";
_newUnit disableAI "MOVE";
_newUnit disableConversation true;
_newUnit setVariable ["bodyName",_name,true];
_newUnit setVariable ["PlayerUID",_playerUID,true];
_newUnit setVariable ["CharacterID",str(_characterID),true];
_newUnit setVariable ["humanity",_humanity,true];
_newUnit setDir _dir;
_newUnit setPosATL _position;

if(canStand _newUnit) then
{
_newUnit playMove "AmovPercMstpSsurWnonDnon";
};

_newUnit addEventHandler ["HandleDamage",{_this call disco_handler;}];
_newUnit addEventHandler ["Killed",{_this call disco_death;}];
_newUnit allowDamage true;

botPlayers set [count botPlayers,_playerUID];


[_newUnit,_name,_characterID,_playerUID,_position] spawn
{
private["_newUnit","_name","_characterID","_playerUID","_position"];

_newUnit =		_this select 0;
_name =			_this select 1;
_characterID =	_this select 2;
_playerUID =	_this select 3;
_position =		_this select 4;

sleep 30;

if (alive _newUnit) then
{
[_newUnit] call server_Delete;
diag_log (format["DISCOMORPH DELETING: %1  - [%2|%3] AT %4",_name,_characterID,_playerUID,_position]);
}
else
{
diag_log (format["DISCOMORPH DEATH: %1  - [%2|%3] AT %4",_name,_characterID,_playerUID,_position]);
};

botPlayers = botPlayers - [_playerUID];
publicVariable "botPlayers";

};
};


disco_handler =
{
private["_unit","_source","_damage","_characterID","_playerUID","_killerUID","_killerName","_weaponUsed","_key","_message"];

_unit =			_this select 0;
_source =		_this select 3;
_damage =		_this select 2;
_characterID =	_unit getVariable ["CharacterID","0"];
_playerUID =	_unit getVariable ["PlayerUID","0"];

if (_damage > 0.1) then
{
if (_characterID != "0") then
{
_killerUID =		getPlayerUID _source;
_killerName =		name _source;
_weaponUsed =		currentWeapon _source;
_unit setVariable ["killPlayerUID",_killerUID,true];
_unit setDamage 1;
_unit removeAllEventHandlers "HandleDamage";
_unit removeAllEventHandlers "Killed";

_key = format["CHILD:202:%1:%2:",_characterID,0];
_key call server_hiveWrite;

_message = format["Killed by [%1] [%2] using weapon [%3] || CAUSE [disco]",_killerName,_killerUID,_weaponUsed];
_key = format["CHILD:600:%1:%2:%3:","DEATH",_playerUID,_message];
_key call server_hiveWrite;
};
};
};


disco_death =
{
private["_unit","_source","_characterID","_playerUID","_killerUID","_killerName","_weaponUsed","_key","_message"];

_unit =			_this select 0;
_source =		_this select 1;
_characterID =	_unit getVariable ["CharacterID","0"];
_playerUID =	_unit getVariable ["PlayerUID","0"];

if (_characterID != "0") then
{
_killerUID =		getPlayerUID _source;
_killerName =		name _source;
_weaponUsed =		currentWeapon _source;
_unit setVariable ["killPlayerUID",_killerUID,true];
_unit setDamage 1;
_unit removeAllEventHandlers "HandleDamage";
_unit removeAllEventHandlers "Killed";

_key = format["CHILD:202:%1:%2:",_characterID,0];
_key call server_hiveWrite;

_message = format["Killed by [%1] [%2] using weapon [%3] || CAUSE [discokill]",_killerName,_killerUID,_weaponUsed];
_key = format["CHILD:600:%1:%2:%3:","DEATH",_playerUID,_message];
_key call server_hiveWrite;
};
};


server_setTime =
{
private ["_date","_key","_result","_outcome"];

_key = "CHILD:307:";
_result = _key call server_hiveReadWrite;
_outcome = _result select 0;
if(_outcome == "PASS") then
{
_date = _result select 1;
setDate _date;
dayzSetDate = _date;
publicVariable "dayzSetDate";
diag_log ("HIVE: Local Time set to " + str(_date));
};
};
