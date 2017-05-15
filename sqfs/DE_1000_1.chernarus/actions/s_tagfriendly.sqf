// obv intrntbrn is obv
private["_uid","_name","_tagObj"];
_tagObj = (_this select 3);
_name = name _tagObj;
_uid = getPlayerUID _tagObj;

if (_uid in tag_rec) then {
	titleText [format["%1 is now tagged as friend",_name], "PLAIN DOWN", 3];
	tag_friendlies = tag_friendlies + [_uid];
	[] spawn update_tags;
}
else {
	titleText [format["%1 has to confirm the tag",_name], "PLAIN DOWN", 3];
	tag_req = tag_req + [_uid];
};

PV_RequestTag = [player,_tagObj];
publicVariableServer "PV_RequestTag";

player removeAction s_tagfriendly;
s_tagfriendly = -1;