// Functions
SHK_pos_getPos = compile preprocessfilelinenumbers "addons\shk_pos\shk_pos_getpos.sqf";
SHK_pos_getPosMarker = compile preprocessfilelinenumbers "addons\shk_pos\shk_pos_getposmarker.sqf";

// Sub functions
SHK_pos_fnc_findClosestPosition = compile preprocessfilelinenumbers "addons\shk_pos\shk_pos_fnc_findclosestposition.sqf";
SHK_pos_fnc_getMarkerCorners = compile preprocessfilelinenumbers "addons\shk_pos\shk_pos_fnc_getmarkercorners.sqf";
SHK_pos_fnc_getMarkerShape = compile preprocessfilelinenumbers "addons\shk_pos\shk_pos_fnc_getmarkershape.sqf";
SHK_pos_fnc_getPos = compile preprocessfilelinenumbers "addons\shk_pos\shk_pos_fnc_getpos.sqf";
SHK_pos_fnc_getPosFromCircle = compile preprocessfilelinenumbers "addons\shk_pos\shk_pos_fnc_getposfromcircle.sqf";
SHK_pos_fnc_getPosFromEllipse = compile preprocessfilelinenumbers "addons\shk_pos\shk_pos_fnc_getposfromellipse.sqf";
SHK_pos_fnc_getPosFromRectangle = compile preprocessfilelinenumbers "addons\shk_pos\shk_pos_fnc_getposfromrectangle.sqf";
SHK_pos_fnc_getPosFromSquare = compile preprocessfilelinenumbers "addons\shk_pos\shk_pos_fnc_getposfromsquare.sqf";
SHK_pos_fnc_isBlacklisted = compile preprocessfilelinenumbers "addons\shk_pos\shk_pos_fnc_isblacklisted.sqf";
SHK_pos_fnc_isInCircle = compile preprocessfilelinenumbers "addons\shk_pos\shk_pos_fnc_isincircle.sqf";
SHK_pos_fnc_isInEllipse = compile preprocessfilelinenumbers "addons\shk_pos\shk_pos_fnc_isinellipse.sqf";
SHK_pos_fnc_isInRectangle = compile preprocessfilelinenumbers "addons\shk_pos\shk_pos_fnc_isinrectangle.sqf";
SHK_pos_fnc_isSamePosition = compile preprocessfilelinenumbers "addons\shk_pos\shk_pos_fnc_issameposition.sqf";
SHK_pos_fnc_rotatePosition = compile preprocessfilelinenumbers "addons\shk_pos\shk_pos_fnc_rotateposition.sqf";

// Wrapper function
// Decide which function to call based on parameters.
SHK_pos = {
  private ["_pos"];
  // SARGE DEBUG
  //diag_log "SHK_pos executed";
  _pos = [];

  // Only marker is given as parameter
  if (typename _this == "STRING") then {
    _pos = [_this] call SHK_pos_getPosMarker;

  // Parameter array
  } else {
    if (typename (_this select 0) == "STRING") then {
      _pos = _this call SHK_pos_getPosMarker;
    } else {
      _pos = _this call SHK_pos_getPos;
    };
  };

  // Return position
  _pos
};