[] call btc_fnc_eh_headless;

//Move btc_patrol_active group to HC
[(btc_patrol_active + btc_civ_veh_active) select {local _x}] remoteExecCall ["btc_fnc_set_groupsOwner", 2]; // Edited: Re-assign units on server to headless clients on clients connect, default = [] remoteExecCall ["btc_fnc_set_groupsOwner", 2];
