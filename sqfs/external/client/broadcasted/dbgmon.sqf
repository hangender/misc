while {alive player} do 
{
	_kills = player getVariable["zombieKills", 0];
	_killsH = player getVariable["humanKills", 0];
	_killsB = player getVariable["banditKills", 0];
	_humanity =	player getVariable["humanity", 0];
	_headShots = player getVariable["headShots", 0];
	
	hintSilent parseText format
	[
		"<t size='1'font='Bitstream'align='left'>Blood:</t><t size='1'font='Bitstream'align='right'>%1</t><br/>
		<t size='1'font='Bitstream'align='left'>Humanity:</t><t size='1'font='Bitstream'align='right'>%2</t><br/>
		<t size='1'font='Bitstream'align='left'>Murders:</t><t size='1'font='Bitstream'align='right'>%3</t><br/>
		<t size='1'font='Bitstream'align='left'>Bandits Killed:</t><t size='1'font='Bitstream'align='right'>%4</t><br/>
		<t size='1'font='Bitstream'align='left'>Zombies Killed:</t><t size='1'font='Bitstream'align='right'>%5</t><br/>
		<t size='1'font='Bitstream'align='left'>Headshots:</t><t size='1'font='Bitstream'align='right'>%6</t><br/>
		<t size='1'font='Bitstream'align='left'>GPS:</t><t size='1'font='Bitstream'align='right'>%7</t><br/>
		<t size='1'font='Bitstream'align='left'>FPS:</t><t size='1'font='Bitstream'align='right'>%8</t>",
		round r_player_blood, round _humanity, _killsH, _killsB, _kills, _headShots, mapGridPosition player, round diag_fps
	];
	sleep 1;
};