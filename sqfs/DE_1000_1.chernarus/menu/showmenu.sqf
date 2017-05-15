// DE 1000, intrntbrn

DE_1000_main_menu =
[
	["",true],
		["View Distance", [2],  "", -5, [["expression", 			"[] execVM 'menu\view_distance_menu.sqf'"]], "1", "1"],
		["Suicide", [3],  "", -5, [["expression", 					"[] execVM 'menu\suicide_menu.sqf'"]], "1", "1"]
];

showCommandingMenu "#USER:DE_1000_main_menu";