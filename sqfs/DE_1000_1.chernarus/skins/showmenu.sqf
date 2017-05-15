pathtoclothing = "skins\submenu\";
EXECscript1 = 'player execVM "'+pathtoclothing+'%1"';

skins_main =
[
	["",true],
		["DayZ Clothing", [2],  "", -5, [["expression", format[EXECscript1,"dayz.sqf"]]], "1", "1"],
		["Custom Clothing", [3],  "", -5, [["expression", format[EXECscript1,"custom.sqf"]]], "1", "1"],
		["Allahu Akbar", [4],  "", -5, [["expression", format[EXECscript1,"akbar.sqf"]]], "1", "1"],
		["Delete Backpack", [5],  "", -5, [["expression", format[EXECscript1,"backpack.sqf"]]], "1", "1"],
		["", [-1], "", -5, [["expression", ""]], "1", "0"],
			["Close", [13], "", -3, [["expression", ""]], "1", "1"]
		
];
showCommandingMenu "#USER:skins_main";