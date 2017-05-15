#line 1 "z\addons\zero_server\client\gui\gui_functions.sqf"

zero_updateGui =
{
private ["_ctrlBleed","_ctrlFracture","_display","_control"];

disableSerialization;
_display = uiNamespace getVariable 'DAYZ_GUI_display';
_control = _display displayCtrl 1204;
_control ctrlShow false;

if (!r_player_injured) then
{
_ctrlBleed = _display displayCtrl 1303;
_ctrlBleed ctrlShow false;
};
if (!r_fracture_legs and !r_fracture_arms) then
{
_ctrlFracture = _display displayCtrl 1203;
_ctrlFracture ctrlShow false;
};
};
