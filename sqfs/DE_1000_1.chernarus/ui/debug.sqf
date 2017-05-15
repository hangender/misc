if (isNil "custom_monitor") then {custom_monitor = true;} else {custom_monitor = !custom_monitor;};
private["_killsH","_killsB","_humanity","_heliModel","_posStr","_missionKind","_msg","_zStreak","_heroKills","_blood"];
player setVariable["zStreak",0,true];
player setVariable["npcKills",0,true];
missionMode = 0;

while {custom_monitor} do
{
	if (!(missionMode > 0)) then {
    _killsH =        player getVariable["humanKills",0];
    _killsB =        player getVariable["banditKills",0];
    _humanity =        player getVariable["humanity",0];
	_heroKills = player getVariable["headShots",0];
	_zStreak = player getVariable["zStreak",0];
	_npc = player getVariable["npcKills",0];
	if (r_player_blood < 0) then {
		_blood = 0;
	} else {
		_blood = round r_player_blood;
	};
    hintSilent parseText format ["
	<t size='1'font='Bitstream'align='center' color='#b80000'>www.DE-1000.de.vu</t><br/>
	<t color='#ffffff' size='1'font='Bitstream'align='left'>Humanity:</t><t size='1' color='#b80000' font='Bitstream'align='right'>%2</t><br/>
    <t color='#ffffff' size='1'font='Bitstream'align='left'>Blood:</t><t size='1' color='#b80000' font='Bitstream'align='right'>%1</t><br/>
    <t color='#ffffff' size='1'font='Bitstream'align='left'>Survivor Kills:</t><t size='1' color='#b80000' font='Bitstream'align='right'>%3</t><br/>
    <t color='#ffffff' size='1'font='Bitstream'align='left'>Bandit Kills:</t><t size='1' color='#b80000' font='Bitstream'align='right'>%4</t><br/>
	<t color='#ffffff' size='1'font='Bitstream'align='left'>Hero Kills:</t><t size='1' color='#b80000' font='Bitstream'align='right'>%7</t><br/>
	<t color='#ffffff' size='1'font='Bitstream'align='left'>NPC Kills:</t><t size='1' color='#b80000' font='Bitstream'align='right'>%8</t><br/>
	<t color='#ffffff' size='1'font='Bitstream'align='left'>Zombie Streak:</t><t size='1' color='#b80000' font='Bitstream'align='right'>%6</t><br/>
	<t color='#ffffff' size='1'font='Bitstream'align='left'>Next Restart:</t><t size='1' color='#b80000' font='Bitstream'align='right'>%5min</t><br/>
	<t color='#ffffff' size='1'font='Bitstream'align='left'>TeamSpeak:</t><t size='1' color='#b80000' font='Bitstream'align='right'>193.192.58.61</t>
    ",_blood,round _humanity,_killsH,_killsB,(120-(round(serverTime/60))),_zStreak,_heroKills,_npc];
	}
	else {
		_heliModel = (missionArray select 0);
		_posStr = (missionArray select 1);
		
		if (missionMode == 1) then {
				if ("ItemRadio" in items player) then {
					_missionKind = (missionArray select 2);
					_msg = format ["%1 Crash at",_missionKind];
					hintSilent parseText format ["
					<t size='1.25'font='Bitstream'align='center' color='#FF0000'>Mayday Mayday</t><br/><br/>
					<img size='5' image='%1'/><br/><br/>
					<t size='1.25'font='Bitstream'align='center' color='#FFFFFF'>%2</t><br/><br/>
					<t size='1'font='Bitstream'align='center' color='#FFFFFF'>%3</t><br/>
					",getText (configFile >> "cfgVehicles" >> _heliModel >> "picture"), _msg, _posStr];
				}
				else {
					_msg = "unknown Crash";
					hintSilent parseText format ["
					<t size='1.25'font='Bitstream'align='center' color='#FF0000'>Mayday Mayday</t><br/><br/>
					<img size='5' image='%1'/><br/><br/>
					<t size='1'font='Bitstream'align='center' color='#000000'>[no Radio]</t><br/>
					<t size='1.25'font='Bitstream'align='center' color='#FFFFFF'>%2</t><br/><br/>
					<t size='1'font='Bitstream'align='center' color='#FFFFFF'>%3</t><br/>
					",getText (configFile >> "cfgVehicles" >> _heliModel >> "picture"), _msg, _posStr];
				};
		};
		if (missionMode == 2) then {
			_missionKind = (missionArray select 2);
			_msg = format ["%1 Crash at",_missionKind];
			hintSilent parseText format ["
			<t size='1.25'font='Bitstream'align='center' color='#00FF00'>Capture</t><br/><br/>
			<img size='5' image='%1'/><br/><br/>
			<t size='1.25'font='Bitstream'align='center' color='#FFFFFF'>%2</t><br/><br/>
			<t size='1'font='Bitstream'align='center' color='#FFFFFF'>%3</t><br/>
			",getText (configFile >> "cfgVehicles" >> _heliModel >> "picture"),_msg, _posStr];		
		};		
	}; 
	sleep 5;
};