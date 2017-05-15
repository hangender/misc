_dayzActions = s_player_repairActions+r_player_actions+[null]+[NORRN_dropAction,s_player_studybody,s_player_grabflare,s_player_removeflare,s_player_dropflare,s_player_deleteBuild,s_player_forceSave,s_player_fillfuel,s_player_butcher,s_player_cook,s_player_fireout,s_player_packtent];
				
_tempRemoveAction = _dayzActions call {
_unsortedArray = _this;

_unsortedArray = _unsortedArray - [-1];

_swaps = true;

while {_swaps} do
{
	_swaps = false;
	for "_i" from 0 to ((count _unsortedArray) - 1) do
	{
		if (_i+1 <= ((count _unsortedArray) - 1)) then
		{
			_num1 = _unsortedArray select _i;
			_num2 = _unsortedArray select (_i+1);
			if (_num2 < _num1) then
			{
				_unsortedArray set [_i,  _num2];
				_unsortedArray set [(_i+1),  _num1];
				_swaps = true;
			};
		};
	};
};

_unsortedArray;
};

if (count _tempRemoveAction == 0) then
{
	_sAntihack = player addAction ["","",[],1,false,true,"",false];
	for '_i' from 0 to _sAntihack do
	{
		player removeAction _i;
	};
	
}
else
{
	for '_i' from 0 to (_tempRemoveAction select 0) do
	{
		player removeAction _i;
	};
	_sAntihack = player addAction ["","",[],1,false,true,"",false];
	for '_i' from ((_tempRemoveAction select (count_tempRemoveAction - 1) ) + 1) to _sAntihack do
	{
		player removeAction _i;
	};
};