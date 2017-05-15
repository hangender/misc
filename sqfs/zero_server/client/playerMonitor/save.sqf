#line 1 "z\addons\zero_server\client\playerMonitor\save.sqf"

zeroScheduledSave = [player,dayz_Magazines];
publicVariableServer "zeroScheduledSave";

if(dayz_unsaved) then
{
dayz_Magazines = [];
dayz_unsaved = false;
};
