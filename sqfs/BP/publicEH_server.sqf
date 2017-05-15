#line 1 "z\deathlyrage\breakingpoint_server\init\publicEH_server.sqf"






"dayzLogin"			addPublicVariableEventHandler {_id = (_this select 1) call BPServer_LoginQueueAdd};
"norrnRaLW"   		addPublicVariableEventHandler {[_this select 1] execVM "\z\addons\dayz_code\medical\publicEH\load_wounded.sqf"};
"norrnRLact"		addPublicVariableEventHandler {[_this select 1] execVM "\z\addons\dayz_code\medical\load\load_wounded.sqf"};
"norrnRDead"   		addPublicVariableEventHandler {[_this select 1] execVM "\z\addons\dayz_code\medical\publicEH\deadState.sqf"};
"dayzHumanity"		addPublicVariableEventHandler {(_this select 1) spawn player_humanityChange};
"usecBleed"			addPublicVariableEventHandler {_id = (_this select 1) spawn fnc_usec_damageBleed};
"usecBandage"		addPublicVariableEventHandler {(_this select 1) call player_medBandage};
"usecInject"		addPublicVariableEventHandler {(_this select 1) call player_medInject};
"usecEpi"			addPublicVariableEventHandler {(_this select 1) call player_medEpi};
"usecTransfuse"		addPublicVariableEventHandler {(_this select 1) call player_medTransfuse};
"usecMorphine"		addPublicVariableEventHandler {(_this select 1) call player_medMorphine};
"usecPainK"			addPublicVariableEventHandler {(_this select 1) call player_medPainkiller};

"dayzDeath"			addPublicVariableEventHandler {_id = (_this select 1) call server_playerDied};
"dayzPlayerSave"	addPublicVariableEventHandler {_id = (_this select 1) call server_playerSync};
"dayzPublishObj"	addPublicVariableEventHandler {(_this select 1) call server_publishObj};
"dayzUpdateVehicle" addPublicVariableEventHandler {_id = (_this select 1) spawn server_updateObject};
"dayzPlayerMorph"	addPublicVariableEventHandler {(_this select 1) call server_playerMorph};
"dayzUpdate"		addPublicVariableEventHandler {_id = (_this select 1) spawn dayz_processUpdate};
"dayzLoginRecord"	addPublicVariableEventHandler {_id = (_this select 1) spawn dayz_recordLogin};
"dayzCharSave"		addPublicVariableEventHandler {_id = (_this select 1) spawn server_playerSync};

"dayzSetFuel"		addPublicVariableEventHandler {(_this select 1) spawn local_setFuel};
"dayzSetFix"		addPublicVariableEventHandler {(_this select 1) call object_setFixServer};
"dayzDeleteObj"		addPublicVariableEventHandler {(_this select 1) spawn server_deleteObj};
"dayzHit" 			addPublicVariableEventHandler {(_this select 1) call fnc_usec_damageHandler};
