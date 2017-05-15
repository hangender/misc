
if (SAR_dynamic_spawning) then {
    
};

diag_log format["SAR_AI: Static spawning area definition started"];

// AUSSERHALB
// zwischen Nordstrasse und Osteingang
_this = createMarker ["SAR_nord_strasse", [9776.71, 11637.2]];
_this setMarkerShape "RECTANGLE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [300, 300];
SAR_nord_strasse = _this;

// Sued Wald Camper:
//_this = createMarker ["SAR_sued_wald", [9751.38, 11153.5]];
//_this setMarkerShape "RECTANGLE";
//_this setMarkeralpha 0;
//_this setMarkerType "Flag";
//_this setMarkerBrush "Solid";
//_this setMarkerSize [150, 80];
//SAR_sued_wald = _this;

// West Feld:
_this = createMarker ["SAR_west_feld", [9381.63, 11160.3]];
_this setMarkerShape "RECTANGLE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [300, 300];
SAR_west_feld = _this;


// INNERHALB

// Osteingang
_this = createMarker ["SAR_osteingang", [9580.4, 11428.1]];
_this setMarkerShape "RECTANGLE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [15, 15];
SAR_osteingang = _this;

// Industrial
_this = createMarker ["SAR_industrial", [9559.58, 11382.1]];
_this setMarkerShape "RECTANGLE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [20, 200];
SAR_industrial = _this;

// Innere Mauern bei Barracke und Kiste
_this = createMarker ["SAR_mauerkiste", [9514.04, 11457.9]];
_this setMarkerShape "RECTANGLE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [25, 25];
SAR_mauerkiste = _this;

// Heuballen
_this = createMarker ["SAR_heuballen", [9491.85, 11514.2]];
_this setMarkerShape "RECTANGLE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [10, 10];
SAR_heuballen = _this;

// Panzerstatue
_this = createMarker ["SAR_panzerstatue", [9458.92, 11322.4]];
_this setMarkerShape "RECTANGLE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [40, 40];
SAR_panzerstatue = _this;

// Wohnhaeuser
_this = createMarker ["SAR_wohnhaus", [9590.1, 11293.1]];
_this setMarkerShape "RECTANGLE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [10, 10];
SAR_wohnhaus = _this;

// Metalcompound
//_this = createMarker ["SAR_metal", [9406.61, 11452.1]];
//_this setMarkerShape "RECTANGLE";
//_this setMarkeralpha 0;
//_this setMarkerType "Flag";
//_this setMarkerBrush "Solid";
//_this setMarkerSize [10, 10];
//SAR_metal = _this;

// Turm West
_this = createMarker ["SAR_turm_west", [9502.74, 11268.1]];
_this setMarkerShape "RECTANGLE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [10, 10];
SAR_turm_west = _this;

// Turm NordEast
_this = createMarker ["SAR_turm_ne", [9501.57, 11263.6]];
_this setMarkerShape "RECTANGLE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [4, 4];
SAR_turm_ne = _this;

// Supermarkt
_this = createMarker ["SAR_supermarkt", [9543.27, 11296.1]];
_this setMarkerShape "RECTANGLE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [50, 50];
SAR_supermarkt = _this;


diag_log format["SAR_AI: Static spawning area definition finished"];


diag_log format["SAR_AI: Static Spawning for Helicopter patrols started"];

//
// define your static air patrols here
//

// Heli Patroulie
_this = createMarker ["SAR_helipatrol", [9404.61, 11450.1]];
_this setMarkerShape "RECTANGLE";
_this setMarkeralpha 0;
_this setMarkerType "Flag";
_this setMarkerBrush "Solid";
_this setMarkerSize [800, 800];
SAR_helipatrol = _this;


[SAR_helipatrol,3,false] call SAR_AI_heli;


diag_log format["SAR_AI: Static Spawning for Helicopter patrols finished"];


diag_log format["SAR_AI: Static Spawning for infantry patrols started"];

//
// define your static infantry patrols here
//

[SAR_nord_strasse,3,1,2,"patrol",false] call SAR_AI;
//[SAR_sued_wald,3,1,1,"ambush",false] call SAR_AI;
[SAR_west_feld,3,1,2,"patrol",false] call SAR_AI;

[SAR_osteingang,3,1,2,"fortify",false] call SAR_AI;
[SAR_industrial,3,1,2,"fortify",false] call SAR_AI;
//[SAR_mauerkiste,3,1,2,"fortify",false] call SAR_AI;
[SAR_heuballen,3,2,2,"fortify",false] call SAR_AI;
[SAR_panzerstatue,3,1,2,"fortify",false] call SAR_AI;
[SAR_wohnhaus,3,2,2,"fortify",false] call SAR_AI;
//[SAR_metal,3,2,3,"fortify",false] call SAR_AI;
[SAR_turm_west,3,1,1,"fortify",false] call SAR_AI;
//[SAR_turm_ne,3,1,1,"fortify",false] call SAR_AI;
[SAR_supermarkt,3,1,1,"ambush",false] call SAR_AI;

diag_log format["SAR_AI: Static Spawning for infantry patrols finished"];

