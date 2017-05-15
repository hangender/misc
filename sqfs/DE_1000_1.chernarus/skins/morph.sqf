// intrntbrn
private["_model","_hasmapitem","_hascompassitem","_haswatchitem","_hasradioitem","_hasgpsitem"];
_model = (_this select 0);
_hasgpsitem = "ItemGPS" in weapons player;
_hasmapitem = "ItemMap" in weapons player;
_hascompassitem = "ItemCompass" in weapons player;
_haswatchitem = "ItemWatch" in weapons player;
_hasradioitem = "ItemRadio" in weapons player;

// combat @TODO

player removeAction s_skins;
titleText ["Changing Skin...", "PLAIN DOWN", 3];
sleep 3;
[dayz_playerUID,dayz_characterID,_model] spawn player_humanityMorph;
sleep 2;
titleText [format["Thanks for Donating, %1!",(name player)], "PLAIN DOWN", 3];

if (!_hasmapitem ) then {
    player removeWeapon "ItemMap";
};
if (!_hascompassitem ) then {
    player removeWeapon "ItemCompass";
};
if (!_haswatchitem ) then {
    player removeWeapon "ItemWatch";
};
if (!_hasradioitem) then {
	player removeWeapon "ItemRadio";
};
if (!_hasgpsitem) then {
	player removeWeapon "ItemGPS";
};
sleep 5;
titleFadeOut 1;
sleep 450;
if ((getPlayerUID player) in donator_skin) then {
	s_skins = player addaction [("<t color=""#426797"">" + ("Skins") +"</t>"),"skins\showmenu.sqf","",5,false,true,"",""];
};