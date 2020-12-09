
/* ----------------------------------------------------------------------------
Function: btc_fnc_tow_unhook

Description:
    Unhook the current tower/towed vehicle.

Parameters:
    _veh - Vehicle, could be the tower or the towed vehicle. [Object]

Returns:

Examples:
    (begin example)
        [cursorObject] call btc_fnc_tow_unhook;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_veh", objNull, [objNull]]
];

private _towing = _veh getVariable ["btc_towing", objNull];
if (isNull _towing) exitWith {(localize "STR_BTC_HAM_LOG_UNHOOK_NOROPE") call CBA_fnc_notify;};

private _ropes = ropes _this;
if (_ropes isEqualTo []) then {
    _ropes = ropes _towing;
};

_ropes apply {ropeDestroy _x};
