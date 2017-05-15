#line 1 "z\addons\deathly_breakingpoint_server\system\login_thread.sqf"





waitUntil {!(isNil "sm_done")};
while {isServer} do {
call BPServer_LoginQueueProcess;
sleep 4;
};