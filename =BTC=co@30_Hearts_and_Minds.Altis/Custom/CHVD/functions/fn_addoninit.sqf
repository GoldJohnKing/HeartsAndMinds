[] spawn {
	if (!hasInterface) exitWith {};
	//Wait for mission init, in case there are variables defined some place else
	waitUntil {time > 0};
	
	CHVD_footSyncMode = 0;
	CHVD_carSyncMode = 0;
	CHVD_airSyncMode = 0;

	CHVD_foot = 1800;
	CHVD_car = 2400;
	CHVD_air = 7500;

	CHVD_footObj = 1500;
	CHVD_carObj = 2000;
	CHVD_airObj = 6000;

	CHVD_footTerrain = 0;
	CHVD_carTerrain = 6.25;
	CHVD_airTerrain = 12.5;
	
	CHVD_vehType = 0; // 0 = foot, 1 = car, 2 = air

	//Begin initialization
	waitUntil {!isNull player};
	waitUntil {!isNull findDisplay 46};

	(findDisplay 46) displayAddEventHandler ["Unload", {call CHVDAddon_fnc_updateSettings}]; // Reset obj view distance so game doesn't lag when browsing menues and so on, if FOV method was used during the game
	
	[] call CHVDAddon_fnc_updateVehType;
	[] call CHVDAddon_fnc_updateSettings;

	//Detect when to change setting type
	[] spawn {
		for "_i" from 0 to 1 step 0 do {
			_currentVehicle = vehicle player;
			waitUntil {_currentVehicle != vehicle player};
			[] call CHVDAddon_fnc_updateVehType;
			[] call CHVDAddon_fnc_updateSettings;
		};
	};
	
	[] spawn {
		for "_i" from 0 to 1 step 0 do {
			_UAVstatus = call CHVDAddon_fnc_UAVstatus;
			waitUntil {_UAVstatus != call CHVDAddon_fnc_UAVstatus};
			[] call CHVDAddon_fnc_updateVehType;
			[] call CHVDAddon_fnc_updateSettings;
		};
	};
	
	[] spawn {
		for "_i" from 0 to 1 step 0 do {
			_currentZoom = call CHVDAddon_fnc_trueZoom;
			waitUntil {_currentZoom != call CHVDAddon_fnc_trueZoom};
		};
	};
};