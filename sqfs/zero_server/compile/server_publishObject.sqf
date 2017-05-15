#line 1 "z\addons\zero_server\compile\server_publishObject.sqf"

private["_characterID","_object","_worldspace","_class","_objectUID","_key"];

_characterID =	_this select 0;
_object =		_this select 1;
_worldspace =	_this select 2;
_class =		_this select 3;

if(_class in ["TentStorage","Hedgehog_DZ","Sandbag1_DZ"]) then
{

_objectUID = _worldspace call dayz_objectUID2;


_key = format["CHILD:308:%1:%2:%3:%4:%5:%6:%7:%8:%9:",zero_instance,_class,0,_characterID,_worldspace,[],[],0,_objectUID];
_key call server_hiveWrite;
_object setVariable ["ObjectUID",_objectUID,true];
}
else
{
[_object] call server_Delete;
};
