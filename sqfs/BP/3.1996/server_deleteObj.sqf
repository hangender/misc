#line 1 "z\deathlyrage\breakingpoint_server\compile\server_deleteObj.sqf"



private["_id","_uid","_key"];
_id 	= _this select 0;
_uid 	= _this select 1;

if (isServer) then {

if (parseNumber _id > 0) then {

_key = format["CHILD:304:%1:",_id];
_key call server_hiveWrite;

} else  {

_key = format["CHILD:310:%1:",_uid];
_key call server_hiveWrite;

};
};