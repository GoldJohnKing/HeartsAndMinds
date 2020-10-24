
/* ----------------------------------------------------------------------------
Function: btc_fnc_set_groupsOwner

Description:
    Transfert groups to a headless client.

Parameters:
    _groups - Array of groups to transfert. [Array]

Returns:
	Returns array of true if locality was changed. [Array]

Examples:
    (begin example)
        [btc_patrol_active + btc_civ_veh_active] call btc_fnc_set_groupsOwner;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

if !(btc_p_auto_headless) exitWith {};
private _HCs = (entities "HeadlessClient_F") + playableUnits; // Edited: Use player's clients as headless clients, this is experimental, default = entities "HeadlessClient_F"
if (_HCs isEqualTo []) exitWith {[]};

params [
    ["_groups", (btc_patrol_active + btc_civ_veh_active) select {local _x}, [[]]] // Edited: If no param is passed, only re-assign units which are local to server, default = ["_groups", btc_patrol_active + btc_civ_veh_active, [[]]]
];

// private _HC = owner (_HCs select 0); // Edited: Support multiple headless clients
_groups apply {
    _x setGroupOwner (owner (selectRandom _HCs)); // Edited: Support multiple headless clients, default = _x setGroupOwner _HC
};
