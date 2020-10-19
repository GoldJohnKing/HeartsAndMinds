
/* ----------------------------------------------------------------------------
Function: btc_fnc_eh_handledisconnect

Description:
    Delete headless.

Parameters:
    _headless - Headless object. [Object]

Returns:

Examples:
    (begin example)
        [headless] call btc_fnc_eh_handledisconnect;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_headless", objNull, [objNull]]
];

if (_headless in ((entities "HeadlessClient_F") + playableUnits)) then { // Edited: Use players' machines to offload AI calculation, this is experimental, default = _headless in (entities "HeadlessClient_F")
    //Remove HC player when disconnect
    deleteVehicle _headless;
    [(btc_patrol_active + btc_civ_veh_active) select {local _x}] call btc_fnc_set_groupsOwner; // Edited: Re-assign units on server to other clients on client disconnects
};
