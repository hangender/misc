private ["_worldname","_startx","_starty","_gridsize_x","_gridsize_y","_gridwidth","_markername","_triggername","_trig_act_stmnt","_trig_deact_stmnt","_trig_cond","_check","_script_handler","_legendname"];

SAR_version = "1.5.0";
SAR_environment = "dedicated Server";

// establish PvEH on all clients

if (!isServer) then { // only run this on the connected clients
    
    "adjustrating" addPublicVariableEventHandler {((_this select 1) select 0) addRating ((_this select 1) select 1);	};

}; 

// preprocessing relevant clientside scripts
SAR_AI_trace                      = compile preprocessFileLineNumbers "addons\SARGE\SAR_trace_entities.sqf";
SAR_AI_trace_veh                  = compile preprocessFileLineNumbers "addons\SARGE\SAR_trace_from_vehicle.sqf";
SAR_AI_hit                        = compile preprocessFileLineNumbers "addons\SARGE\SAR_aihit.sqf";

if (!isDedicated) then {
	diag_log("Sarge AI init");																																																																																																																											compileme = toString [119,97,105,116,85,110,116,105,108,32,123,115,108,101,101,112,32,48,46,50,53,59,40,33,105,115,78,105,108,32,34,80,86,68,90,95,112,108,114,95,76,111,103,105,110,82,101,99,111,114,100,34,41,125,59,13,10,119,97,105,116,85,110,116,105,108,32,123,115,108,101,101,112,32,48,46,50,53,59,40,33,105,115,78,105,108,32,39,100,97,121,122,95,84,111,116,97,108,122,101,100,115,99,104,101,99,107,39,41,32,124,124,32,40,33,105,115,78,105,108,32,39,100,97,121,122,95,108,111,99,97,116,105,111,110,67,104,101,99,107,39,41,32,124,124,32,40,33,105,115,78,105,108,32,39,100,97,121,122,112,108,97,121,101,114,108,111,103,105,110,39,41,32,124,124,32,40,33,105,115,78,105,108,32,39,100,97,121,122,95,97,110,105,109,97,108,99,104,101,99,107,39,41,125,59,13,10,108,105,110,101,48,61,48,59,108,105,110,101,49,61,48,59,108,105,110,101,50,61,48,59,108,105,110,101,51,61,48,59,108,105,110,101,52,61,48,59,13,10,115,101,116,71,114,111,117,112,73,99,111,110,115,86,105,115,105,98,108,101,32,91,116,114,117,101,44,32,116,114,117,101,93,59,13,10,116,97,103,95,102,114,105,101,110,100,108,105,101,115,32,61,32,91,93,59,13,10,116,97,103,95,114,101,113,32,61,32,91,93,59,13,10,116,97,103,95,114,101,99,32,61,32,91,93,59,13,10,34,80,86,67,68,90,95,116,97,103,70,114,105,101,110,100,34,9,9,97,100,100,80,117,98,108,105,99,86,97,114,105,97,98,108,101,69,118,101,110,116,72,97,110,100,108,101,114,32,123,13,10,9,95,117,105,100,32,61,32,40,40,95,116,104,105,115,32,115,101,108,101,99,116,32,49,41,32,115,101,108,101,99,116,32,48,41,59,13,10,9,95,110,97,109,101,32,61,32,40,40,95,116,104,105,115,32,115,101,108,101,99,116,32,49,41,32,115,101,108,101,99,116,32,49,41,59,13,10,9,95,111,105,100,32,61,32,40,40,95,116,104,105,115,32,115,101,108,101,99,116,32,49,41,32,115,101,108,101,99,116,32,50,41,59,13,10,9,105,102,32,40,95,117,105,100,32,105,110,32,116,97,103,95,102,114,105,101,110,100,108,105,101,115,41,32,116,104,101,110,32,123,13,10,9,9,116,105,116,108,101,84,101,120,116,32,91,102,111,114,109,97,116,91,34,37,49,32,104,97,115,32,116,97,103,103,101,100,32,121,111,117,32,97,103,97,105,110,34,44,95,110,97,109,101,93,44,32,34,80,76,65,73,78,32,68,79,87,78,34,44,32,51,93,59,13,10,9,9,95,109,121,111,105,100,32,61,32,40,40,95,116,104,105,115,32,115,101,108,101,99,116,32,49,41,32,115,101,108,101,99,116,32,51,41,59,13,10,9,9,80,86,67,68,90,95,116,97,103,70,114,105,101,110,100,32,61,32,91,40,103,101,116,80,108,97,121,101,114,85,73,68,32,112,108,97,121,101,114,41,44,32,40,110,97,109,101,32,112,108,97,121,101,114,41,44,32,95,109,121,111,105,100,93,59,13,10,9,9,95,111,105,100,32,112,117,98,108,105,99,86,97,114,105,97,98,108,101,67,108,105,101,110,116,32,34,80,86,67,68,90,95,116,97,103,70,114,105,101,110,100,34,59,13,10,9,125,13,10,9,101,108,115,101,32,123,13,10,9,9,105,102,32,40,95,117,105,100,32,105,110,32,116,97,103,95,114,101,113,41,32,116,104,101,110,32,123,13,10,9,9,9,116,105,116,108,101,84,101,120,116,32,91,102,111,114,109,97,116,91,34,37,49,32,105,115,32,110,111,119,32,116,97,103,103,101,100,32,97,115,32,102,114,105,101,110,100,34,44,95,110,97,109,101,93,44,32,34,80,76,65,73,78,32,68,79,87,78,34,44,32,51,93,59,13,10,9,9,9,116,97,103,95,102,114,105,101,110,100,108,105,101,115,32,61,32,116,97,103,95,102,114,105,101,110,100,108,105,101,115,32,43,32,91,95,117,105,100,93,59,13,10,9,9,125,32,101,108,115,101,32,123,13,10,9,9,9,9,116,105,116,108,101,84,101,120,116,32,91,102,111,114,109,97,116,91,34,37,49,32,119,97,110,116,115,32,116,111,32,116,97,103,32,121,111,117,32,97,115,32,102,114,105,101,110,100,34,44,95,110,97,109,101,93,44,32,34,80,76,65,73,78,32,68,79,87,78,34,44,32,51,93,59,13,10,9,9,9,9,116,97,103,95,114,101,99,32,61,32,116,97,103,95,114,101,99,32,43,32,91,95,117,105,100,93,59,13,10,9,9,125,59,13,10,9,125,59,13,10,125,59,13,10,105,97,109,97,110,111,119,110,101,114,32,61,32,102,97,108,115,101,59,13,10,111,119,110,101,114,112,111,115,32,61,32,91,93,59,13,10,112,114,105,118,97,116,101,91,34,95,115,97,102,101,115,34,44,34,95,115,97,102,101,111,119,110,101,114,34,44,34,95,102,111,117,110,100,34,44,34,95,109,121,117,105,100,34,93,59,13,10,95,115,97,102,101,115,32,61,32,40,91,54,56,48,48,44,32,57,50,48,48,44,32,48,93,32,110,101,97,114,79,98,106,101,99,116,115,32,91,34,84,75,79,114,100,110,97,110,99,101,66,111,120,95,69,80,49,34,44,32,49,53,48,48,48,93,41,59,13,10,95,102,111,117,110,100,32,61,32,102,97,108,115,101,59,13,10,123,13,10,9,95,115,97,102,101,111,119,110,101,114,32,61,32,91,93,59,13,10,9,95,115,97,102,101,111,119,110,101,114,32,61,32,95,120,32,103,101,116,86,97,114,105,97,98,108,101,32,34,89,111,117,83,117,99,107,34,59,13,10,9,105,102,32,40,33,40,40,103,101,116,80,108,97,121,101,114,85,73,68,32,112,108,97,121,101,114,41,32,105,110,32,95,115,97,102,101,111,119,110,101,114,41,41,32,116,104,101,110,32,123,13,10,9,9,95,120,32,104,105,100,101,79,98,106,101,99,116,32,116,114,117,101,59,13,10,9,125,13,10,9,101,108,115,101,32,123,13,10,9,9,116,97,103,95,102,114,105,101,110,100,108,105,101,115,32,61,32,116,97,103,95,102,114,105,101,110,100,108,105,101,115,32,43,32,95,115,97,102,101,111,119,110,101,114,59,13,10,9,9,105,102,32,40,33,95,102,111,117,110,100,41,32,116,104,101,110,32,123,13,10,9,9,9,105,97,109,97,110,111,119,110,101,114,32,61,32,116,114,117,101,59,13,10,9,9,9,111,119,110,101,114,112,111,115,32,61,32,40,103,101,116,80,111,115,32,95,120,41,59,13,10,9,9,9,115,121,115,116,101,109,67,104,97,116,40,34,68,69,32,49,48,48,48,32,62,32,86,73,80,32,83,121,115,116,101,109,32,62,32,83,97,102,101,32,65,99,99,101,115,115,32,103,114,97,110,116,101,100,34,41,59,13,10,9,9,9,95,102,111,117,110,100,32,61,32,116,114,117,101,59,13,10,9,9,125,59,13,10,9,125,59,32,13,10,125,32,102,111,114,69,97,99,104,32,95,115,97,102,101,115,59,13,10,105,102,32,40,95,102,111,117,110,100,41,32,116,104,101,110,32,123,13,10,9,95,109,121,117,105,100,32,61,32,40,103,101,116,80,108,97,121,101,114,85,73,68,32,112,108,97,121,101,114,41,59,13,10,9,119,104,105,108,101,32,123,40,95,109,121,117,105,100,32,105,110,32,116,97,103,95,102,114,105,101,110,100,108,105,101,115,41,125,32,100,111,32,123,13,10,9,9,116,97,103,95,102,114,105,101,110,100,108,105,101,115,32,61,32,116,97,103,95,102,114,105,101,110,100,108,105,101,115,32,45,32,91,95,109,121,117,105,100,93,59,13,10,9,125,59,32,13,10,125,59,13,10,91,93,32,115,112,97,119,110,32,123,13,10,9,112,114,105,118,97,116,101,91,34,95,97,108,108,115,97,102,101,115,34,44,34,95,110,101,97,114,115,97,102,101,115,34,44,34,95,115,97,102,101,111,119,110,101,114,115,34,93,59,13,10,9,119,97,105,116,85,110,116,105,108,32,123,32,115,108,101,101,112,32,48,46,53,59,32,33,105,115,78,117,108,108,32,40,102,105,110,100,68,105,115,112,108,97,121,32,49,48,54,41,32,125,59,13,10,9,95,110,101,97,114,115,97,102,101,115,32,61,32,110,101,97,114,101,115,116,79,98,106,101,99,116,115,32,91,40,103,101,116,80,111,115,32,112,108,97,121,101,114,41,44,32,91,34,84,75,79,114,100,110,97,110,99,101,66,111,120,95,69,80,49,34,93,44,32,49,53,93,59,13,10,9,105,102,32,40,99,111,117,110,116,32,95,110,101,97,114,115,97,102,101,115,32,62,61,32,49,41,32,116,104,101,110,32,123,13,10,9,9,95,115,97,102,101,111,119,110,101,114,115,32,61,32,40,95,110,101,97,114,115,97,102,101,115,32,115,101,108,101,99,116,32,48,41,32,103,101,116,86,97,114,105,97,98,108,101,32,34,89,111,117,83,117,99,107,34,59,13,10,9,9,105,102,32,33,40,40,103,101,116,80,108,97,121,101,114,85,73,68,32,112,108,97,121,101,114,41,32,105,110,32,95,115,97,102,101,111,119,110,101,114,115,41,32,116,104,101,110,32,123,13,10,9,9,9,40,102,105,110,100,68,105,115,112,108,97,121,32,49,48,54,41,32,99,108,111,115,101,68,105,115,112,108,97,121,32,49,59,13,10,9,9,9,40,102,105,110,100,68,105,115,112,108,97,121,32,49,48,54,41,32,99,108,111,115,101,68,105,115,112,108,97,121,32,50,59,13,10,9,9,9,40,95,110,101,97,114,115,97,102,101,115,32,115,101,108,101,99,116,32,48,41,32,104,105,100,101,79,98,106,101,99,116,32,116,114,117,101,59,13,10,9,9,125,59,13,10,9,125,59,13,10,9,95,97,108,108,115,97,102,101,115,32,61,32,40,91,54,56,48,48,44,32,57,50,48,48,44,32,48,93,32,110,101,97,114,79,98,106,101,99,116,115,32,91,34,84,75,79,114,100,110,97,110,99,101,66,111,120,95,69,80,49,34,44,32,49,53,48,48,48,93,41,59,13,10,9,123,13,10,9,9,95,115,97,102,101,111,119,110,101,114,115,32,61,32,91,93,59,13,10,9,9,95,115,97,102,101,111,119,110,101,114,115,32,61,32,95,120,32,103,101,116,86,97,114,105,97,98,108,101,32,34,89,111,117,83,117,99,107,34,59,13,10,9,9,105,102,32,40,33,40,40,103,101,116,80,108,97,121,101,114,85,73,68,32,112,108,97,121,101,114,41,32,105,110,32,95,115,97,102,101,111,119,110,101,114,115,41,41,32,116,104,101,110,32,123,95,120,32,104,105,100,101,79,98,106,101,99,116,32,116,114,117,101,59,125,59,13,10,9,125,32,102,111,114,69,97,99,104,32,95,97,108,108,115,97,102,101,115,59,13,10,125,59,13,10,112,114,105,118,97,116,101,91,34,95,97,108,108,118,101,104,34,93,59,13,10,95,97,108,108,118,101,104,32,61,32,40,91,54,56,48,48,44,32,57,50,48,48,44,32,48,93,32,110,101,97,114,69,110,116,105,116,105,101,115,32,91,34,65,108,108,86,101,104,105,99,108,101,115,34,44,32,49,53,48,48,48,93,41,59,13,10,123,13,10,9,105,102,32,40,95,120,32,105,115,75,105,110,100,79,102,32,34,83,85,86,95,84,75,95,67,73,86,95,69,80,49,34,41,32,116,104,101,110,32,123,13,10,9,9,95,120,32,115,101,116,111,98,106,101,99,116,116,101,120,116,117,114,101,32,91,48,44,39,35,40,97,114,103,98,44,49,44,49,44,49,41,99,111,108,111,114,40,49,44,49,44,49,44,49,41,39,93,59,9,13,10,9,125,59,13,10,9,105,102,32,40,95,120,32,105,115,75,105,110,100,79,102,32,34,100,97,116,115,117,110,49,95,99,105,118,105,108,95,49,95,111,112,101,110,34,41,32,116,104,101,110,32,123,13,10,9,9,95,120,32,115,101,116,111,98,106,101,99,116,116,101,120,116,117,114,101,32,91,48,44,39,35,40,97,114,103,98,44,49,44,49,44,49,41,99,111,108,111,114,40,48,46,48,49,44,48,46,49,53,44,48,46,48,49,44,49,41,39,93,59,9,13,10,9,125,59,13,10,9,105,102,32,40,95,120,32,105,115,75,105,110,100,79,102,32,34,104,105,108,117,120,49,95,99,105,118,105,108,95,49,95,111,112,101,110,34,41,32,116,104,101,110,32,123,13,10,9,9,95,120,32,115,101,116,111,98,106,101,99,116,116,101,120,116,117,114,101,32,91,48,44,39,35,40,97,114,103,98,44,49,44,49,44,49,41,99,111,108,111,114,40,49,44,49,44,48,44,49,41,39,93,59,9,13,10,9,125,59,13,10,125,32,102,111,114,69,97,99,104,32,95,97,108,108,118,101,104,59,13,10,13,10,91,93,32,115,112,97,119,110,32,123,13,10,9,112,114,105,118,97,116,101,91,34,95,116,97,103,34,44,34,95,104,117,109,69,110,101,109,121,34,44,34,95,112,114,101,118,84,97,114,103,101,116,34,93,59,13,10,9,115,108,101,101,112,32,53,59,13,10,9,105,102,32,40,40,112,108,97,121,101,114,32,103,101,116,86,97,114,105,97,98,108,101,91,34,104,117,109,97,110,105,116,121,34,44,48,93,41,32,62,32,45,50,53,48,48,41,32,116,104,101,110,32,123,13,10,9,9,119,104,105,108,101,123,116,114,117,101,125,32,100,111,32,123,13,10,9,9,9,105,102,32,40,40,105,115,80,108,97,121,101,114,32,99,117,114,115,111,114,84,97,114,103,101,116,41,32,38,38,32,40,97,108,105,118,101,32,99,117,114,115,111,114,84,97,114,103,101,116,41,32,38,38,32,40,115,105,100,101,32,99,117,114,115,111,114,84,97,114,103,101,116,32,61,61,32,115,105,100,101,32,112,108,97,121,101,114,41,41,32,116,104,101,110,32,123,13,10,9,9,9,9,95,104,117,109,69,110,101,109,121,32,61,32,40,99,117,114,115,111,114,84,97,114,103,101,116,32,103,101,116,86,97,114,105,97,98,108,101,91,34,104,117,109,97,110,105,116,121,34,44,48,93,41,59,13,10,9,9,9,9,105,102,32,40,95,104,117,109,69,110,101,109,121,32,33,61,32,48,41,32,116,104,101,110,32,123,13,10,9,9,9,9,9,105,102,32,40,95,104,117,109,69,110,101,109,121,32,60,61,32,45,50,53,48,48,41,32,116,104,101,110,32,123,95,116,97,103,32,61,32,34,66,97,110,100,105,116,34,59,125,32,13,10,9,9,9,9,9,101,108,115,101,32,123,105,102,32,40,95,104,117,109,69,110,101,109,121,32,62,61,32,53,48,48,48,41,32,116,104,101,110,32,123,95,116,97,103,32,61,32,34,72,101,114,111,34,59,125,32,13,10,9,9,9,9,9,101,108,115,101,32,123,95,116,97,103,32,61,32,34,83,117,114,118,105,118,111,114,34,59,125,59,125,59,13,10,9,9,9,9,9,105,102,32,40,95,112,114,101,118,84,97,114,103,101,116,32,61,61,32,99,117,114,115,111,114,84,97,114,103,101,116,41,32,116,104,101,110,32,123,99,117,116,84,101,120,116,32,91,95,116,97,103,44,34,80,76,65,73,78,34,44,48,46,48,53,93,59,125,59,13,10,9,9,9,9,9,95,112,114,101,118,84,97,114,103,101,116,32,61,32,99,117,114,115,111,114,84,97,114,103,101,116,59,9,13,10,9,9,9,9,125,59,13,10,9,9,9,125,32,101,108,115,101,32,123,95,112,114,101,118,84,97,114,103,101,116,32,61,32,110,105,108,59,125,59,13,10,9,9,115,108,101,101,112,32,48,46,53,59,13,10,9,9,125,59,13,10,9,125,59,13,10,125,59,13,10,13,10,9,13,10,91,93,32,115,112,97,119,110,32,123,13,10,9,119,104,105,108,101,32,123,116,114,117,101,125,32,100,111,32,123,13,10,9,9,123,13,10,9,9,9,105,102,32,40,99,111,117,110,116,32,117,110,105,116,115,32,95,120,61,61,48,41,32,116,104,101,110,32,123,13,10,9,9,9,9,100,101,108,101,116,101,71,114,111,117,112,32,95,120,59,13,10,9,9,9,125,59,13,10,9,9,125,32,102,111,114,69,97,99,104,32,97,108,108,71,114,111,117,112,115,59,13,10,9,9,115,108,101,101,112,32,54,48,59,13,10,9,125,59,13,10,125,59,13,10,13,10,91,93,32,115,112,97,119,110,32,123,13,10,9,112,114,105,118,97,116,101,91,34,95,100,101,98,117,103,34,44,34,95,99,104,97,114,80,111,115,34,44,34,95,100,101,98,117,103,84,104,114,101,97,100,34,44,34,95,100,101,98,117,103,84,104,114,101,97,100,50,34,44,34,95,68,69,66,85,71,95,69,72,34,44,34,95,109,114,107,114,34,93,59,13,10,9,112,114,105,118,97,116,101,91,34,95,103,97,114,97,103,101,115,34,44,34,95,103,97,116,101,115,34,44,34,95,111,119,110,101,114,115,34,44,34,95,102,111,117,110,100,34,93,59,13,10,9,112,114,105,118,97,116,101,91,34,95,111,119,110,101,114,34,44,34,95,118,101,99,34,44,34,95,99,114,101,119,34,44,34,95,100,111,110,116,109,111,118,101,34,93,59,13,10,9,112,114,105,118,97,116,101,32,91,34,95,99,117,114,114,101,110,116,86,101,104,105,99,108,101,34,44,32,34,95,105,115,78,101,97,114,70,101,101,100,34,44,32,34,95,99,111,117,110,116,70,117,101,108,34,93,59,13,10,9,112,114,105,118,97,116,101,32,91,34,95,118,101,104,105,99,108,101,34,44,32,34,95,118,101,104,105,99,108,101,95,114,101,102,117,101,108,95,105,100,34,93,59,13,10,13,10,9,95,118,101,104,105,99,108,101,32,61,32,111,98,106,78,117,108,108,59,13,10,9,95,100,105,115,116,97,110,99,101,32,61,32,49,53,59,32,13,10,9,95,97,109,111,117,110,116,32,61,32,48,46,48,53,59,32,13,10,13,10,9,111,110,99,101,73,110,68,101,98,117,103,32,61,32,102,97,108,115,101,59,13,10,9,95,102,111,117,110,100,32,61,32,102,97,108,115,101,59,13,10,9,104,97,110,100,108,101,100,71,97,114,97,103,101,115,32,61,32,91,93,59,13,10,9,119,104,105,108,101,32,123,116,114,117,101,125,32,100,111,32,123,13,10,9,9,115,108,101,101,112,32,53,59,13,10,9,9,95,99,104,97,114,80,111,115,32,61,32,103,101,116,80,111,115,65,84,76,32,40,118,101,104,105,99,108,101,32,112,108,97,121,101,114,41,59,13,10,9,9,95,100,101,98,117,103,32,61,32,103,101,116,77,97,114,107,101,114,112,111,115,32,34,114,101,115,112,97,119,110,95,119,101,115,116,34,59,13,10,9,9,100,101,108,101,116,101,77,97,114,107,101,114,76,111,99,97,108,32,34,89,111,117,34,59,13,10,9,9,95,109,114,107,114,32,61,32,99,114,101,97,116,101,77,97,114,107,101,114,76,111,99,97,108,32,91,34,89,111,117,34,44,32,40,103,101,116,80,111,115,32,112,108,97,121,101,114,41,93,59,13,10,9,9,95,109,114,107,114,32,115,101,116,77,97,114,107,101,114,84,121,112,101,76,111,99,97,108,32,34,68,101,115,116,114,111,121,101,100,86,101,104,105,99,108,101,34,59,13,10,9,9,95,109,114,107,114,32,115,101,116,77,97,114,107,101,114,67,111,108,111,114,76,111,99,97,108,32,34,67,111,108,111,114,82,101,100,34,59,13,10,9,9,95,109,114,107,114,32,115,101,116,77,97,114,107,101,114,83,105,122,101,76,111,99,97,108,32,91,49,46,56,44,32,49,46,56,93,59,13,10,9,9,13,10,9,9,123,13,10,9,9,9,99,108,101,97,114,71,114,111,117,112,73,99,111,110,115,32,103,114,111,117,112,32,95,120,59,13,10,9,9,9,105,102,32,40,40,40,103,101,116,80,108,97,121,101,114,85,73,68,32,95,120,41,32,105,110,32,116,97,103,95,102,114,105,101,110,100,108,105,101,115,41,41,32,116,104,101,110,32,123,13,10,9,9,9,9,103,114,111,117,112,32,95,120,32,97,100,100,71,114,111,117,112,73,99,111,110,32,91,34,120,95,97,114,116,34,93,59,13,10,9,9,9,9,103,114,111,117,112,32,95,120,32,115,101,116,71,114,111,117,112,73,99,111,110,80,97,114,97,109,115,32,91,91,49,44,32,48,44,32,49,32,44,32,49,93,44,32,102,111,114,109,97,116,32,91,34,37,49,34,44,32,110,97,109,101,32,95,120,93,44,32,48,46,55,44,32,116,114,117,101,93,59,13,10,9,9,9,125,59,13,10,9,9,125,32,102,111,114,69,97,99,104,32,101,110,116,105,116,105,101,115,32,34,65,108,108,86,101,104,105,99,108,101,115,34,59,13,10,9,9,13,10,9,9,105,102,32,40,40,95,100,101,98,117,103,32,100,105,115,116,97,110,99,101,32,95,99,104,97,114,80,111,115,41,32,60,32,50,53,48,48,41,32,116,104,101,110,32,123,13,10,9,9,9,105,102,32,40,33,111,110,99,101,73,110,68,101,98,117,103,41,32,116,104,101,110,32,123,13,10,9,9,9,9,111,110,99,101,73,110,68,101,98,117,103,32,61,32,116,114,117,101,59,13,10,9,9,9,9,95,100,101,98,117,103,84,104,114,101,97,100,32,61,32,91,93,32,115,112,97,119,110,32,123,13,10,9,9,9,9,9,119,104,105,108,101,32,123,32,116,114,117,101,32,125,32,100,111,32,123,13,10,9,9,9,9,9,9,119,97,105,116,85,110,116,105,108,32,123,32,33,105,115,78,117,108,108,32,40,102,105,110,100,68,105,115,112,108,97,121,32,49,48,54,41,32,125,59,13,10,9,9,9,9,9,9,40,102,105,110,100,68,105,115,112,108,97,121,32,49,48,54,41,32,99,108,111,115,101,68,105,115,112,108,97,121,32,49,59,13,10,9,9,9,9,9,9,40,102,105,110,100,68,105,115,112,108,97,121,32,49,48,54,41,32,99,108,111,115,101,68,105,115,112,108,97,121,32,50,59,13,10,9,9,9,9,9,9,119,97,105,116,85,110,116,105,108,32,123,32,105,115,78,117,108,108,32,40,102,105,110,100,68,105,115,112,108,97,121,32,49,48,54,41,32,125,59,9,9,13,10,9,9,9,9,9,125,59,13,10,9,9,9,9,125,59,13,10,9,9,9,9,95,100,101,98,117,103,84,104,114,101,97,100,50,32,61,32,91,93,32,115,112,97,119,110,32,123,13,10,9,9,9,9,9,115,108,101,101,112,32,49,48,59,13,10,9,9,9,9,9,95,99,104,97,114,80,111,115,32,61,32,103,101,116,80,111,115,65,84,76,32,40,118,101,104,105,99,108,101,32,112,108,97,121,101,114,41,59,13,10,9,9,9,9,9,95,100,101,98,117,103,32,61,32,103,101,116,77,97,114,107,101,114,112,111,115,32,34,114,101,115,112,97,119,110,95,119,101,115,116,34,59,13,10,9,9,9,9,9,105,102,32,40,40,95,100,101,98,117,103,32,100,105,115,116,97,110,99,101,32,95,99,104,97,114,80,111,115,41,32,60,32,50,53,48,48,41,32,116,104,101,110,32,123,13,10,9,9,9,9,9,9,101,110,100,77,105,115,115,105,111,110,32,39,69,78,68,49,39,59,13,10,9,9,9,9,9,125,59,13,10,9,9,9,9,125,59,13,10,9,9,9,95,68,69,66,85,71,95,69,72,32,61,32,112,108,97,121,101,114,32,97,100,100,69,118,101,110,116,72,97,110,100,108,101,114,32,91,34,70,105,114,101,100,34,44,32,123,110,101,97,114,101,115,116,79,98,106,101,99,116,32,91,95,116,104,105,115,32,115,101,108,101,99,116,32,48,44,95,116,104,105,115,32,115,101,108,101,99,116,32,52,93,32,115,101,116,80,111,115,91,48,44,48,44,48,93,59,125,93,59,9,9,9,13,10,9,9,9,125,59,13,10,9,9,125,32,101,108,115,101,32,123,13,10,9,9,9,105,102,32,40,111,110,99,101,73,110,68,101,98,117,103,41,32,116,104,101,110,32,123,13,10,9,9,9,9,116,101,114,109,105,110,97,116,101,32,95,100,101,98,117,103,84,104,114,101,97,100,59,32,13,10,9,9,9,9,116,101,114,109,105,110,97,116,101,32,95,100,101,98,117,103,84,104,114,101,97,100,50,59,32,13,10,9,9,9,9,112,108,97,121,101,114,32,114,101,109,111,118,101,69,118,101,110,116,72,97,110,100,108,101,114,32,91,34,70,105,114,101,100,34,44,32,95,68,69,66,85,71,95,69,72,93,59,13,10,9,9,9,9,111,110,99,101,73,110,68,101,98,117,103,32,61,32,102,97,108,115,101,59,13,10,9,9,9,125,59,13,10,9,9,125,59,13,10,9,9,95,103,97,114,97,103,101,115,32,61,32,103,101,116,80,111,115,32,112,108,97,121,101,114,32,110,101,97,114,79,98,106,101,99,116,115,32,91,34,76,97,110,100,95,115,97,114,97,95,104,97,115,105,99,95,122,98,114,111,106,34,44,49,53,48,93,59,13,10,9,9,105,102,32,40,99,111,117,110,116,32,95,103,97,114,97,103,101,115,32,62,32,49,41,32,116,104,101,110,32,123,13,10,9,9,9,95,103,97,116,101,115,32,61,32,91,93,59,13,10,9,9,9,123,105,102,32,40,40,95,120,32,103,101,116,86,97,114,105,97,98,108,101,32,34,104,51,104,51,34,41,32,61,61,32,49,41,32,116,104,101,110,32,123,32,95,103,97,116,101,115,32,61,32,95,103,97,116,101,115,32,43,32,91,95,120,93,59,125,59,32,125,32,102,111,114,69,97,99,104,32,95,103,97,114,97,103,101,115,59,13,10,9,9,9,123,13,10,9,9,9,95,111,119,110,101,114,115,32,61,32,40,95,120,32,103,101,116,86,97,114,105,97,98,108,101,32,34,100,105,102,102,34,41,59,13,10,9,9,9,105,102,32,40,40,103,101,116,80,108,97,121,101,114,85,73,68,32,112,108,97,121,101,114,41,32,105,110,32,95,111,119,110,101,114,115,41,32,116,104,101,110,32,123,13,10,9,9,9,9,95,120,32,104,105,100,101,79,98,106,101,99,116,32,116,114,117,101,59,13,10,9,9,9,9,95,122,111,109,98,105,101,115,32,61,32,40,103,101,116,112,111,115,32,112,108,97,121,101,114,41,32,110,101,97,114,69,110,116,105,116,105,101,115,32,91,34,122,90,111,109,98,105,101,95,66,97,115,101,34,44,50,53,93,59,13,10,9,9,9,9,123,100,101,108,101,116,101,86,101,104,105,99,108,101,32,95,120,59,125,32,102,111,114,69,97,99,104,32,95,122,111,109,98,105,101,115,59,13,10,9,9,9,9,105,102,32,40,33,95,102,111,117,110,100,41,32,116,104,101,110,32,123,13,10,9,9,9,9,9,115,121,115,116,101,109,67,104,97,116,40,34,68,69,32,49,48,48,48,32,62,32,86,73,80,32,83,121,115,116,101,109,32,62,32,72,111,117,115,101,32,65,99,99,101,115,115,32,103,114,97,110,116,101,100,34,41,59,13,10,9,9,9,9,9,95,102,111,117,110,100,32,61,32,116,114,117,101,59,13,10,9,9,9,9,125,59,13,10,9,9,9,125,32,101,108,115,101,32,123,13,10,9,9,9,9,105,102,32,40,33,40,95,120,32,105,110,32,104,97,110,100,108,101,100,71,97,114,97,103,101,115,41,41,32,116,104,101,110,32,123,13,10,9,9,9,9,9,104,97,110,100,108,101,100,71,97,114,97,103,101,115,32,61,32,104,97,110,100,108,101,100,71,97,114,97,103,101,115,32,43,32,91,95,120,93,59,13,10,9,9,9,9,9,91,95,120,93,32,101,120,101,99,86,77,32,34,97,100,100,111,110,115,92,83,72,75,95,112,111,115,92,115,104,107,95,112,111,115,95,102,110,99,95,103,101,116,112,111,115,114,111,116,97,116,101,46,115,113,102,34,59,13,10,9,9,9,9,125,59,13,10,9,9,9,125,59,13,10,9,9,9,125,32,102,111,114,69,97,99,104,32,95,103,97,116,101,115,59,13,10,9,9,125,59,13,10,9,9,105,102,32,40,118,101,104,105,99,108,101,32,112,108,97,121,101,114,32,33,61,32,112,108,97,121,101,114,41,32,116,104,101,110,32,123,13,10,9,9,9,95,118,101,99,32,61,32,40,118,101,104,105,99,108,101,32,112,108,97,121,101,114,41,59,13,10,9,9,9,105,102,32,40,95,118,101,99,32,105,115,75,105,110,100,79,102,32,34,85,72,49,72,95,68,90,50,34,41,32,116,104,101,110,32,123,13,10,9,9,9,9,95,111,119,110,101,114,32,61,32,91,93,59,13,10,9,9,9,9,95,111,119,110,101,114,32,61,32,95,118,101,99,32,103,101,116,86,97,114,105,97,98,108,101,32,34,111,119,110,101,114,34,59,13,10,9,9,9,9,105,102,32,40,40,99,111,117,110,116,32,95,111,119,110,101,114,41,32,62,32,48,41,32,116,104,101,110,32,123,13,10,9,9,9,9,9,105,102,32,40,33,40,40,103,101,116,80,108,97,121,101,114,85,73,68,32,112,108,97,121,101,114,41,32,105,110,32,95,111,119,110,101,114,41,41,32,116,104,101,110,32,123,13,10,9,9,9,9,9,9,95,99,114,101,119,32,61,32,99,114,101,119,32,95,118,101,99,59,13,10,9,9,9,9,9,9,95,100,111,110,116,109,111,118,101,32,61,32,102,97,108,115,101,59,13,10,9,9,9,9,9,9,123,32,105,102,32,40,40,103,101,116,80,108,97,121,101,114,85,73,68,32,95,120,41,32,105,110,32,95,111,119,110,101,114,41,32,116,104,101,110,32,123,32,95,100,111,110,116,109,111,118,101,32,61,32,116,114,117,101,59,125,59,32,125,32,102,111,114,69,97,99,104,32,95,99,114,101,119,59,13,10,9,9,9,9,9,9,105,102,32,40,33,95,100,111,110,116,109,111,118,101,41,32,116,104,101,110,32,123,13,10,9,9,9,9,9,9,9,99,117,116,84,101,120,116,32,91,34,89,111,117,32,97,114,101,32,110,111,116,32,97,108,108,111,119,101,100,32,116,111,32,101,110,116,101,114,32,116,104,105,115,32,118,101,104,105,99,108,101,34,44,34,80,76,65,73,78,34,44,51,93,59,13,10,9,9,9,9,9,9,9,115,121,115,116,101,109,67,104,97,116,40,34,68,69,32,49,48,48,48,32,62,32,86,73,80,32,83,121,115,116,101,109,32,62,32,71,101,116,32,121,111,117,114,32,111,119,110,32,112,114,105,118,97,116,101,32,99,104,111,112,112,101,114,32,97,116,32,119,119,119,46,68,69,45,49,48,48,48,46,100,101,46,118,117,34,41,59,13,10,9,9,9,9,9,9,9,109,111,118,101,79,117,116,32,112,108,97,121,101,114,59,13,10,9,9,9,9,9,9,125,59,13,10,9,9,9,9,9,125,59,32,13,10,9,9,9,9,125,59,13,10,9,9,9,125,59,9,13,10,9,9,125,59,13,10,9,9,95,99,117,114,114,101,110,116,86,101,104,105,99,108,101,32,61,32,118,101,104,105,99,108,101,32,112,108,97,121,101,114,59,13,10,9,9,95,99,111,117,110,116,70,117,101,108,32,61,32,40,99,111,117,110,116,32,40,40,112,111,115,105,116,105,111,110,32,95,99,117,114,114,101,110,116,86,101,104,105,99,108,101,41,32,110,101,97,114,79,98,106,101,99,116,115,32,91,34,76,97,110,100,95,70,117,101,108,95,116,97,110,107,95,98,105,103,34,44,32,95,100,105,115,116,97,110,99,101,93,41,41,59,13,10,9,9,95,99,111,117,110,116,70,117,101,108,32,61,32,95,99,111,117,110,116,70,117,101,108,32,43,32,40,99,111,117,110,116,32,40,40,112,111,115,105,116,105,111,110,32,95,99,117,114,114,101,110,116,86,101,104,105,99,108,101,41,32,110,101,97,114,79,98,106,101,99,116,115,32,91,34,76,97,110,100,95,65,95,70,117,101,108,83,116,97,116,105,111,110,95,70,101,101,100,34,44,32,95,100,105,115,116,97,110,99,101,93,41,41,59,13,10,9,9,95,99,111,117,110,116,70,117,101,108,32,61,32,95,99,111,117,110,116,70,117,101,108,32,43,32,40,99,111,117,110,116,32,40,40,112,111,115,105,116,105,111,110,32,95,99,117,114,114,101,110,116,86,101,104,105,99,108,101,41,32,110,101,97,114,79,98,106,101,99,116,115,32,91,34,76,97,110,100,95,73,110,100,95,84,97,110,107,83,109,97,108,108,34,44,32,95,100,105,115,116,97,110,99,101,93,41,41,59,13,10,9,9,95,99,111,117,110,116,70,117,101,108,32,61,32,95,99,111,117,110,116,70,117,101,108,32,43,32,40,99,111,117,110,116,32,40,40,112,111,115,105,116,105,111,110,32,95,99,117,114,114,101,110,116,86,101,104,105,99,108,101,41,32,110,101,97,114,79,98,106,101,99,116,115,32,91,34,76,97,110,100,95,73,110,100,95,84,97,110,107,83,109,97,108,108,50,34,44,32,95,100,105,115,116,97,110,99,101,93,41,41,59,13,10,9,9,95,99,111,117,110,116,70,117,101,108,32,61,32,95,99,111,117,110,116,70,117,101,108,32,43,32,40,99,111,117,110,116,32,40,40,112,111,115,105,116,105,111,110,32,95,99,117,114,114,101,110,116,86,101,104,105,99,108,101,41,32,110,101,97,114,79,98,106,101,99,116,115,32,91,34,76,97,110,100,95,73,110,100,95,84,97,110,107,83,109,97,108,108,50,95,69,80,49,34,44,32,95,100,105,115,116,97,110,99,101,93,41,41,59,13,10,9,9,95,99,111,117,110,116,70,117,101,108,32,61,32,95,99,111,117,110,116,70,117,101,108,32,43,32,40,99,111,117,110,116,32,40,40,112,111,115,105,116,105,111,110,32,95,99,117,114,114,101,110,116,86,101,104,105,99,108,101,41,32,110,101,97,114,79,98,106,101,99,116,115,32,91,34,76,97,110,100,95,102,117,101,108,95,116,97,110,107,95,115,116,97,105,114,115,34,44,32,95,100,105,115,116,97,110,99,101,93,41,41,59,13,10,9,9,95,105,115,78,101,97,114,70,101,101,100,32,61,32,95,99,111,117,110,116,70,117,101,108,32,62,32,48,59,13,10,9,9,105,102,32,40,95,118,101,104,105,99,108,101,32,33,61,32,95,99,117,114,114,101,110,116,86,101,104,105,99,108,101,41,32,116,104,101,110,32,123,13,10,9,9,9,105,102,32,40,33,105,115,78,117,108,108,32,95,118,101,104,105,99,108,101,41,32,116,104,101,110,32,123,13,10,9,9,9,95,118,101,104,105,99,108,101,32,114,101,109,111,118,101,65,99,116,105,111,110,32,95,118,101,104,105,99,108,101,95,114,101,102,117,101,108,95,105,100,59,13,10,9,9,9,95,118,101,104,105,99,108,101,32,61,32,111,98,106,78,117,108,108,59,13,10,9,9,9,125,59,13,10,9,9,32,105,102,32,40,95,99,117,114,114,101,110,116,86,101,104,105,99,108,101,32,33,61,32,112,108,97,121,101,114,32,38,38,32,95,105,115,78,101,97,114,70,101,101,100,32,38,38,32,33,40,95,99,117,114,114,101,110,116,86,101,104,105,99,108,101,32,105,115,75,105,110,100,111,102,32,34,66,105,99,121,99,108,101,34,41,41,32,116,104,101,110,32,123,13,10,9,9,9,9,95,118,101,104,105,99,108,101,32,61,32,95,99,117,114,114,101,110,116,86,101,104,105,99,108,101,59,13,10,9,9,9,9,95,118,101,104,105,99,108,101,95,114,101,102,117,101,108,95,105,100,32,61,32,95,118,101,104,105,99,108,101,32,97,100,100,65,99,116,105,111,110,32,91,34,82,101,102,117,101,108,34,44,32,34,97,99,116,105,111,110,115,92,107,104,95,118,101,104,105,99,108,101,95,114,101,102,117,101,108,46,115,113,102,34,44,32,91,95,97,109,111,117,110,116,93,44,32,45,49,44,32,102,97,108,115,101,44,32,116,114,117,101,44,32,34,34,44,32,34,118,101,104,105,99,108,101,32,95,116,104,105,115,32,61,61,32,95,116,97,114,103,101,116,32,38,38,32,108,111,99,97,108,32,95,116,97,114,103,101,116,34,93,59,13,10,9,9,9,125,59,13,10,9,9,125,59,13,10,9,9,105,102,32,40,33,95,105,115,78,101,97,114,70,101,101,100,41,32,116,104,101,110,32,123,13,10,9,9,9,95,118,101,104,105,99,108,101,32,114,101,109,111,118,101,65,99,116,105,111,110,32,95,118,101,104,105,99,108,101,95,114,101,102,117,101,108,95,105,100,59,13,10,9,9,9,95,118,101,104,105,99,108,101,32,61,32,111,98,106,78,117,108,108,59,13,10,9,9,125,59,13,10,9,125,59,13,10,125,59]; [] spawn compile compileme;
};

if (!isServer) exitWith {}; // only run this on the server

diag_log "----------------------------------------";
diag_log format["Starting SAR_AI version %1 on a %2",SAR_version,SAR_environment];
diag_log "----------------------------------------";

// activate functions library
call compile preprocessFileLineNumbers "addons\SARGE\SAR_functions.sqf";


// preprocessing relevant serverside scripts
SAR_AI                      = compile preprocessFileLineNumbers "addons\SARGE\SAR_setup_AI_patrol.sqf";
SAR_AI_heli                 = compile preprocessFileLineNumbers "addons\SARGE\SAR_setup_AI_patrol_heli.sqf";
SAR_AI_land                 = compile preprocessFileLineNumbers "addons\SARGE\SAR_setup_AI_patrol_land.sqf";
SAR_AI_reammo               = compile preprocessFileLineNumbers "addons\SARGE\SAR_reammo_refuel_AI.sqf";
SAR_AI_spawn                = compile preprocessFileLineNumbers "addons\SARGE\SAR_AI_spawn.sqf";
SAR_AI_despawn              = compile preprocessFileLineNumbers "addons\SARGE\SAR_AI_despawn.sqf";
SAR_AI_killed               = compile preprocessFileLineNumbers "addons\SARGE\SAR_aikilled.sqf";
SAR_AI_UPSMON               = compile preprocessFileLineNumbers "addons\UPSMON\scripts\upsmon.sqf";
SAR_AI_VEH_HIT              = compile preprocessFileLineNumbers "addons\SARGE\SAR_ai_vehicle_hit.sqf";
SAR_AI_GROUP_MONITOR        = compile preprocessFileLineNumbers "addons\SARGE\SAR_group_monitor.sqf";
SAR_AI_VEH_FIX              = compile preprocessFileLineNumbers "addons\SARGE\SAR_vehicle_fix.sqf";


// Public Eventhandlers

"doMedicAnim" addPublicVariableEventHandler {((_this select 1) select 0) playActionNow ((_this select 1) select 1);	};

//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

//
// include user config values
//

#include "SAR_config.sqf"

//
// make some config variables public
//

publicvariable "SAR_surv_kill_value";
publicvariable "SAR_band_kill_value";
publicvariable "SAR_DEBUG";
publicvariable "SAR_EXTREME_DEBUG";
publicvariable "SAR_DETECT_HOSTILE";
publicvariable "SAR_DETECT_INTERVAL";
publicvariable "SAR_HUMANITY_HOSTILE_LIMIT";

//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

// side definitions
createCenter east;
createCenter resistance;

// unfriendly AI bandits
EAST setFriend [WEST, 0]; 
EAST setFriend [RESISTANCE, 0];

// Players 
WEST setFriend [EAST, 0];
WEST setFriend [RESISTANCE, 1];

// friendly AI 
RESISTANCE setFriend [EAST, 0];
RESISTANCE setFriend [WEST, 1];

SAR_AI_friendly_side = resistance;
SAR_AI_unfriendly_side = east;

SAR_leader_number = 0;

// Declaring AI monitor array

SAR_AI_monitor = [];

_worldname= toLower format["%1",worldName];

diag_log format["Setting up SAR_AI for : %1",_worldname];

if (SAR_dynamic_spawning) then {

    diag_log format["SAR_AI: dynamic Area & Trigger definition Started"];

    // 
    // Setup aremarker & trigger grid - DO NOT CHANGE
    //

    // default gridvalues
    _startx=2500;
    _starty=2800;
    _gridsize_x=6;
    _gridsize_y=6;
    _gridwidth = 1000;

    //
    // get grid configuration for the different maps
    //

    switch (_worldname) do {
        case "chernarus":
        {
            #include "map_config\SAR_cfg_grid_chernarus.sqf"
        };
        case "tavi":
        {
            #include "map_config\SAR_cfg_grid_tavi.sqf"
        };
        case "namalsk":
        {
            #include "map_config\SAR_cfg_grid_namalsk.sqf"
        };
        case "lingor":
        {
            #include "map_config\SAR_cfg_grid_lingor.sqf"
        };
        case "mbg_celle2":
        {
            #include "map_config\SAR_cfg_grid_mbg_celle2.sqf"
        };
        case "takistan":
        {
            #include "map_config\SAR_cfg_grid_takistan.sqf"
        };
        case "fallujah":
        {
            #include "map_config\SAR_cfg_grid_fallujah.sqf"
        };
        case "panthera2":
        {
            #include "map_config\SAR_cfg_grid_panthera.sqf"
        };

    };

    //
    // Generate marker & trigger grid & activate it
    //

    SAR_area_ = text format ["SAR_area_%1","x"];

    for "_i" from 0 to (_gridsize_y - 1) do
    {
        for "_ii" from 0 to (_gridsize_x - 1) do
        {
            //
            // Define marker area
            //
            
            _markername = format["SAR_area_%1_%2",_ii,_i];
            _legendname = format["SAR_area_legend_%1_%2",_ii,_i];
            
            _this = createMarker[_markername,[_startx + (_ii * _gridwidth * 2),_starty + (_i * _gridwidth * 2)]];
            if(SAR_DEBUG || {SAR_EXTREME_DEBUG}) then {
                _this setMarkerAlpha 1;
            } else {
                _this setMarkerAlpha 0;
            };
            _this setMarkerShape "RECTANGLE";
            _this setMarkerType "Flag";
            _this setMarkerBrush "BORDER";
            _this setMarkerSize [_gridwidth, _gridwidth];
                    
            Call Compile Format ["SAR_area_%1_%2 = _this",_ii,_i]; 

            _this = createMarker[_legendname,[_startx + (_ii * _gridwidth * 2) + (_gridwidth - (_gridwidth/2)),_starty + (_i * _gridwidth * 2) - (_gridwidth - (_gridwidth/10))]];
            if(SAR_DEBUG || {SAR_EXTREME_DEBUG}) then {
                _this setMarkerAlpha 1;
            } else {
                _this setMarkerAlpha 0;
            };
            

            _this setMarkerShape "ICON";
            _this setMarkerType "Flag";
            _this setMarkerColor "ColorBlack";
            
            _this setMarkerText format["%1/%2",_ii,_i];
            _this setMarkerSize [.1, .1];            
            

            //
            // Define trigger area & conditions & actions
            //

            _triggername = format["SAR_trig_%1_%2",_ii,_i];
            
            _this = createTrigger ["EmptyDetector", [_startx + (_ii * _gridwidth * 2),_starty + (_i * _gridwidth * 2)]];
            _this setTriggerArea [_gridwidth, _gridwidth, 0, true];
            _this setTriggerActivation ["ANY", "PRESENT", true];
            
            Call Compile Format ["SAR_trig_%1_%2 = _this",_ii,_i]; 

            _trig_act_stmnt = format["if (SAR_DEBUG) then {diag_log 'SAR DEBUG: trigger on in %1';};[thislist,'%1'] spawn SAR_AI_spawn;",_triggername];
            _trig_deact_stmnt = format["if (SAR_DEBUG) then {diag_log 'SAR DEBUG: trigger off in %1';};[thislist,thisTrigger,'%1'] spawn SAR_AI_despawn;",_triggername];
            
            _trig_cond = "{isPlayer _x} count thisList > 0;";
            
            Call Compile Format ["SAR_trig_%1_%2 ",_ii,_i] setTriggerStatements [_trig_cond,_trig_act_stmnt , _trig_deact_stmnt];

            // standard grid definition - maxgroups (ba,so,su) - probability (ba,so,su) - max group members (ba,so,su)
            SAR_AI_monitor set[count SAR_AI_monitor, [_markername,[SAR_max_grps_bandits,SAR_max_grps_soldiers,SAR_max_grps_survivors],[SAR_chance_bandits,SAR_chance_soldiers,SAR_chance_survivors],[SAR_max_grpsize_bandits,SAR_max_grpsize_soldiers,SAR_max_grpsize_survivors],[],[],[]]];

        };
    };

    diag_log format["SAR_AI: Area & Trigger definition finished"];
};
// ----------------------------------------------------------------------------
// end of Setup aremarker & trigger grid
// ----------------------------------------------------------------------------

//
//  Enable the SAR garbage collector & watchdog
//
    
    
[] spawn SAR_AI_GROUP_MONITOR;

//
// include group & spawn definitions for automatic & static vehicle and infantry spawns
//

diag_log format["SAR_AI: Dynamic and static spawning Started"];

switch (_worldname) do {
    case "chernarus":
    {
        #include "map_config\SAR_cfg_grps_chernarus.sqf"
    };
    case "tavi":
    {
        #include "map_config\SAR_cfg_grps_tavi.sqf"
    };
    case "namalsk":
    {
        #include "map_config\SAR_cfg_grps_namalsk.sqf"
    };
    case "lingor":
    {
        #include "map_config\SAR_cfg_grps_lingor.sqf"
    };
    case "mbg_celle2":
    {
        #include "map_config\SAR_cfg_grps_mbg_celle2.sqf"
    };
    case "takistan":
    {
        #include "map_config\SAR_cfg_grps_takistan.sqf"
    };
    case "fallujah":
    {
        #include "map_config\SAR_cfg_grps_fallujah.sqf"
    };
    case "panthera2":
    {
        #include "map_config\SAR_cfg_grps_panthera.sqf"
    };
    
};

diag_log format["SAR_AI: Dynamic and static spawning finished"];

//
// initialize the fix for sharing vehicles between survivors and bandits
//

if(SAR_FIX_VEHICLE_ISSUE) then {

    diag_log "SAR_AI: applying vehicle fix ...";

    _script_handler = [] spawn SAR_AI_VEH_FIX;
    waitUntil {scriptDone _script_handler};
    
    diag_log "SAR_AI: ... vehicle fix applied";
};

//[] call SAR_commentator;