private ["_vehiculo","_jugador","_char","_vehiculo_id"];

_vehiculo = _this select 0;
_jugador = _this select 2;
_vehiculo_id = _vehiculo getVariable ["ObjectID", 0];
_char = _jugador getVariable["CharacterID","0"];
 "blisshive" callExtension format ["Q:%1:call dw_anadirVehiculoIn('%3', %2)", (call blisshive_server), _vehiculo_id, _char];