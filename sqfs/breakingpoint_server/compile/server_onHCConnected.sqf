playerObject = _this select 0;
actionHC = _this select 1;
headlessTime = _this select 2;
diag_log(format ["Headless Client Connected:%1 time:%2",actionHC,headlessTime]);
if(actionHC== "QUERYS") then {
    HeadlessClientID = owner playerObject;       
};
