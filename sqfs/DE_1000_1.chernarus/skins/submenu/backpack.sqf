BackpackMenu =
[
	["",true],
		["Citizen", [2],  "", -5, [["expression", 			"['Citizen3'] execVM 'skins\morph.sqf'"]], "1", "1"],
		["Worker", [3],  "", -5, [["expression", 			"['Worker1'] execVM 'skins\morph.sqf'"]], "1", "1"],
		["Villager", [4],  "", -5, [["expression", 			"['Villager1'] execVM 'skins\morph.sqf'"]], "1", "1"],
		["Akbar 2", [5],  "", -5, [["expression", 			"['TK_CIV_Takistani01_EP1'] execVM 'skins\morph.sqf'"]], "1", "1"],
		["Akbar 3", [6],  "", -5, [["expression", 			"['TK_CIV_Takistani05_EP1'] execVM 'skins\morph.sqf'"]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Close", [13], "", -3, [["expression", ""]], "1", "1"]
];
showCommandingMenu "#USER:BackpackMenu";