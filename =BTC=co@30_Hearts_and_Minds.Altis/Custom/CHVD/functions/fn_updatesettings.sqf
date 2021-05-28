private ["_updateType"];
_updateType = [_this, 0, 0, [0]] call BIS_fnc_param; // 1 - view, 2 - obj, 3 - both, 4 - FOV, 0 - both and terrain

switch (CHVD_vehType) do {
	case 0: {setViewDistance CHVD_foot; setObjectViewDistance CHVD_footObj};
	case 1: {setViewDistance CHVD_car; setObjectViewDistance CHVD_carObj};
	case 2: {setViewDistance CHVD_air; setObjectViewDistance CHVD_airObj};
};

if (_updateType isEqualTo 0) then {
	[] call CHVDAddon_fnc_updateTerrain;
};
