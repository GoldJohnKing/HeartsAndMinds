
/* ----------------------------------------------------------------------------
Function: btc_fnc_ied_boom

Description:
    Create the boom and the visual effect player side.

Parameters:
    _wreck - Simple object around the ied. [Object]
    _ied - ACE IED. [Object]

Returns:

Examples:
    (begin example)
        [wreck, ied] call btc_fnc_ied_boom;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_wreck", objNull, [objNull]],
    ["_ied", objNull, [objNull]]
];

if (btc_debug_log) then {
    [format ["%1 - POS %2", [_wreck, _ied], getPos _wreck], __FILE__, [false]] call btc_fnc_debug_message;
};

private _pos = getPos _ied;
deleteVehicle _ied;
// Edited: Add more explosion and more damage, default: "Bo_GBU12_LGB_MI10" createVehicle _pos;
private _totalCount = ceil (random 5);
private _currentCount = 0;
while {_currentCount < _totalCount} do {
    "Bomb_03_F" createVehicle _pos;
    _currentCount = _currentCount + 1;
};
deleteVehicle _wreck;

[_pos] call btc_fnc_deaf_earringing;
[_pos] remoteExecCall ["btc_fnc_ied_effects", [0, -2] select isDedicated];
["btc_ied_boom", [_pos]] call CBA_fnc_localEvent;
