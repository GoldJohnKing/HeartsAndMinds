
/* ----------------------------------------------------------------------------
Function: btc_fnc_db_add_veh

Description:
    Fill me when you edit me !

Parameters:
    _veh - [Object]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_db_add_veh;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_veh", objNull, [objNull]],
    ["_p_chem", btc_p_chem, [false]]
];

if !(isServer) exitWith {
    _veh remoteExecCall ["btc_fnc_db_add_veh", 2];
};

btc_vehicles pushBackUnique _veh;
_veh addMPEventHandler ["MPKilled", {
    if (isServer) then {_this call btc_fnc_eh_veh_killed};
}];
if ((isNumber (configfile >> "CfgVehicles" >> typeOf _veh >> "ace_fastroping_enabled")) && !(typeOf _veh isEqualTo "RHS_UH1Y_d")) then {
    [_veh] call ace_fastroping_fnc_equipFRIES
};

if (_p_chem) then {
    _veh addEventHandler ["GetIn", {
        [_this select 0, _this select 2] call btc_fnc_chem_propagate;
        _this
    }];
};

// Edited: Add vehicle friendly fire logging
_veh addMPEventHandler ["MPHit", custom_fnc_vehFriendlyFire];

// Edited: Add vehicle destroyed logging
_veh addMPEventHandler ["MPKilled", custom_fnc_vehDestroyed];
