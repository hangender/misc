#line 1 "z\addons\zero_server\client\infiniteLoops\animalCheck.sqf"

private ["_list","_animalsSupported","_type","_root","_favouriteZones","_randomPoint","_posList","_posSelect","_pos","_agent"];

while {true} do
{
_list = getPosATL player nearEntities [["CAAnimalBase"],zero_animalDistance];

if ((count _list < dayz_maxAnimals) and (dayz_currentGlobalAnimals < dayz_maxGlobalAnimals)) then
{
_animalsSupported = ["hen","Cow","Sheep","WildBoar","WildBoar","WildBoar","Goat","Rabbit","Rabbit"];
_type = (_animalsSupported select floor(random(count _animalsSupported)));

if (_type == "Cow") then
{
_animalsSupported = ["Cow01","Cow02","Cow03","Cow04"];
_type =  (_animalsSupported select floor(random(count _animalsSupported)));
};

_root = configFile >> "CfgVehicles" >> _type;
_favouriteZones = getText ( _root >> "favouritezones");

_randomPoint =	getPosATL player;
_posList =		selectBestPlaces [_randomPoint,zero_animalDistance,_favouriteZones,10,5];
_posSelect =	_posList select (floor random (count _posList));
_pos =			_posSelect select 0;
_list =			_pos nearEntities [["CAAnimalBase","Man"],50];

if (player distance _pos < zero_animalDistance and NOT surfaceIsWater _pos and (count _list == 0)) then
{
_agent = createAgent [_type, _pos, [], 0, "FORM"];
_agent setPos _pos;
[_pos,_agent] execFSM "\z\addons\zero_code\system\animal_agent.fsm";





};
};

sleep 15;
};
