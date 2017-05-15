private ["_characterID","_minutes","_newObject","_playerID","_playerName","_victim","_victimName","_killer","_killerName","_weapon","_distance","_message","_loc_message","_killerPlayerID","_key","_eh","_body","_method","_killmsg","_pic","_safeOffset","_lvl","_isHeadshot"];


_characterID = 	_this select 0;
_minutes =	_this select 1;
_newObject = 	_this select 2;
_playerID = 	_this select 3;
_playerName = 	name _newObject;

_victim = _this select 2;
_victim removeAllEventHandlers "MPHit";
_victim setVariable["processedDeath",time];
_victim setVariable ["bodyName", _playerName, true];
_victimName = _victim getVariable["bodyName", "nil"];

_killer = _victim getVariable["AttackedBy", "nil"];
_killerName = _victim getVariable["AttackedByName", "nil"];
_weapon = _victim getVariable["AttackedByWeapon", "nil"];



if (_killerName != "nil") then
{
_weapon = _victim getVariable["AttackedByWeapon", "nil"];
_distance = _victim getVariable["AttackedFromDistance", "nil"];

if (_victimName == _killerName) then 
{
_message = format["%1 killed himself",_victimName];
_loc_message = format["PKILL: %1 killed himself", _victimName];
}
else 
{
_loc_message = format["KILLMSG: %1 Was Killed By %2 With A %3 From %4m", _victimName, _killerName, _weapon, _distance];
_message = format["%1 killed by %2 with %3 from %4m",_victimName, _killerName, _weapon, _distance];

if (_distance > 2000) then {
_distance = -1;
} else {
_distance = round _distance;
};

_pic = (getText (configFile >> 'cfgWeapons' >> _weapon >> 'picture'));
if (_pic == "") then {
_pic = (getText (configFile >> 'cfgVehicles' >> _weapon >> 'picture'));
};

[nil, nil, rspawn, [_killerName, _pic, _victimName, _distance, nil, nil], {
_killerName = _this select 0;
_pic		= _this select 1;
_victimName = _this select 2;
_distance 	= _this select 3;
if (line4 == 1) then {
line0 = 1; lvl = 6000; safeOffset = 0;
line1 = 0; line2 = 0; line3 = 0; line4 = 0;
[] spawn { sleep 10; line0 = 0; };
} else { if (line3 == 1) then {
line4 = 1; lvl = 6004; safeOffset =0.2;
[] spawn { sleep 10; line4 = 0; };
} else { if (line2 == 1) then {
line3 = 1; lvl = 6003; safeOffset = 0.15;
[] spawn { sleep 10; line3 = 0; };
} else { if (line1 == 1) then {
line2 = 1; lvl = 6002; safeOffset = 0.1;
[] spawn { sleep 10; line2 = 0; };
} else { if (line0 == 1) then {
line1 = 1; lvl = 6001; safeOffset = 0.05;
[] spawn { sleep 10; line1 = 0; };
} else { line0 = 1; lvl = 6000; safeOffset = 0; [] spawn { sleep 10; line0 = 0; };};};};};};
["<t color='#ffffff' align='left' size='0.66'>"+_killerName+" </t><img align='left' size='1' image='"+_pic+"'/><t color='#ffffff' align='left' size='0.66'> "+_victimName+" ["+str _distance+"m]</t>",safezoneX,(safezoneY + safeOffset),9,0,0,lvl] spawn yoloText;

}] call RE;


_victim setVariable["AttackedBy", "nil", true];
_victim setVariable["AttackedByName", "nil", true];
_victim setVariable["AttackedByWeapon", "nil", true];
_victim setVariable["AttackedFromDistance", "nil", true];	
};
};


_newObject setVariable["processedDeath",diag_tickTime];
_newObject setVariable ["bodyName", _playerName, true];


if (typeName _minutes == "STRING") then 
{
_minutes = parseNumber _minutes;
};

if (_characterID != "0") then 
{
_key = format["CHILD:202:%1:%2:",_characterID,_minutes];

_key call server_hiveWrite;
} 
else 
{
deleteVehicle _newObject;
};


format ["Player UID#%3 CID#%4 %1 as %5 died at %2", 
_newObject call fa_plr2str, (getPosATL _newObject) call fa_coor2str,
getPlayerUID _newObject,_characterID,
typeOf _newObject
];




















