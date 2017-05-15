#line 1 "z\addons\zero_server\client\playerMonitor\saveCheck.sqf"

while {true} do
{
dayz_currentGlobalZombies = count entities "zZombie_Base";
dayz_currentGlobalAnimals = count entities "CAAnimalBase";
dayz_spawnZombies = {local _x} count entities "zZombie_Base";

sleep 2;

call zero_player_save;
sleep 60;
};
