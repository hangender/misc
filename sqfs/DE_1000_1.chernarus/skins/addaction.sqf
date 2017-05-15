waitUntil {!isNil "PVDZ_plr_LoginRecord"};
waitUntil {!isNil "dayz_characterID"};
waitUntil {((!isNil 'dayz_animalCheck') || (!isNil 'dayz_spawnCheck') || (!isNil 'dayz_locationCheck') || (!isNil 'dayz_slowCheck'))};

sleep 10;

if (isNil "s_ccmenu") then {
	s_ccmenu = player addaction ["Command Menu","menu\showmenu.sqf","",5,false,true,"",""];
};


if ((getPlayerUID player) in donator_skin) then {
	systemChat ("DE 1000 > VIP System > Ghost Access granted");
	s_skins = player addaction [("<t color=""#426797"">" + ("Skins") +"</t>"),"skins\showmenu.sqf","",5,false,true,"",""];
} else {
	player removeAction s_skins;
};
