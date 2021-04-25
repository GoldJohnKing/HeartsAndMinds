
/* ----------------------------------------------------------------------------
Function: btc_fnc_hideout_hd

Description:
    Fill me when you edit me !

Parameters:
    _hideout - Object to destroy. [Object]
    _selection - Not use. [String]
    _damage - Amount of damage get by the object. [Number]
    _source - Not use. [Object]
    _ammo - Type of ammo use to make damage. [String]
    _hitIndex - Hit part index of the hit point, -1 otherwise. [Number]
    _instigator - Person who pulled the trigger. [Object]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_hideout_hd;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_hideout", objNull, [objNull]],
    ["_selection", "", [""]],
    ["_damage", 0, [0]],
    ["_source", objNull, [objNull]],
    ["_ammo", "", [""]],
    ["_hitIndex", 0, [0]],
    ["_instigator", objNull, [objNull]]
];

// private _explosive = getNumber(configFile >> "cfgAmmo" >> _ammo >> "explosive") > 0; // Edited: Allow non-explosive ammos destroy the hideout

if (
    // _explosive && // Edited: Allow non-explosive ammos destroy the hideout
    !(_hideout getVariable ["btc_fnc_mil_hd_hideout_fired", false]) && // Edited: Make the code compatible with above changes, default = {!(_hideout getVariable ["btc_fnc_mil_hd_hideout_fired", false])}
    {_damage > 0.3} // Edited: Decrease per-time damage requirement of destroying the hideout, default = {_damage > 0.6}
) then {
    _hideout setVariable ["btc_fnc_mil_hd_hideout_fired", true];

    btc_hideouts deleteAt (btc_hideouts find _hideout);
    publicVariable "btc_hideouts";

    [btc_rep_bonus_hideout, _instigator] call btc_fnc_rep_change;

    private _id = _hideout getVariable "id";
    private _marker = createMarker [format ["btc_hideout_%1_destroyed", _id], getPos _hideout];
    _marker setMarkerType "hd_destroy";
    [_marker, "STR_BTC_HAM_O_EH_HDHIDEOUT_MRK", _id] remoteExecCall ["btc_fnc_set_markerTextLocal", [0, -2] select isDedicated, _marker];
    _marker setMarkerSize [1, 1];
    _marker setMarkerColor "ColorRed";

    private _city = _hideout getVariable ["assigned_to", _hideout];
    _city setVariable ["has_ho", false];

    deleteVehicle (nearestObject [getPos _hideout, "Flag_Red_F"]);
    _hideout setDamage 1;

    private _array = _hideout getVariable ["markers", []];

    {deleteMarker _x} forEach _array;

    if (btc_hq isEqualTo _hideout) then {btc_hq = objNull};
    if (btc_hideouts isEqualTo []) then {[] spawn btc_fnc_final_phase;};

    //Notification
    [2, count btc_hideouts] remoteExecCall ["btc_fnc_show_hint", 0];
    if (btc_debug_log) then {
        [format ["_this = %1 ; POS %2 ID %3", _this, getPos _hideout, _id], __FILE__, [false]] call btc_fnc_debug_message;
    };
} else {
    0
};
