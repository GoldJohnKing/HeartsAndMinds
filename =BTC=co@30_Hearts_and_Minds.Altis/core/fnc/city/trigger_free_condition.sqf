
/* ----------------------------------------------------------------------------
Function: btc_fnc_city_trigger_free_condition

Description:
    Check if a city should be free.

Parameters:
    _remainEnemyUnits - Remaining enemy units assigned to the city, passed by the trigger. [Array]
    _p_city_free_trigger - Minimum number of units to consider a city free. [Number]

Returns:
    _return - If the city should be free. [Boolean]

Examples:
    (begin example)
        [allUnits inAreaArray [getPos player, 100, 100], 2] call btc_fnc_city_trigger_free_condition;
    (end)

Author:
    GoldJohnKing

---------------------------------------------------------------------------- */

params [ // Edited: Use a different method to trigger enemy surrender, notice that above comments are not corresponding
    ["_remainEnemyUnits", [], [[]]]
];

if (btc_p_city_free_trigger isEqualTo 0) then {
    _remainEnemyUnits isEqualTo []
} else {
    if (count _remainEnemyUnits >= btc_p_city_free_trigger) exitWith {false};
    _remainEnemyUnits findIf {
        private _veh = vehicle _x;
        !(_veh isKindOf "Man" || {_veh isKindOf "StaticWeapon" || {unitIsUAV _veh}}) // Edited: Enemy in static weapons will surrender too
    } isEqualTo -1
};
// params [
//     ["_remainEnemyUnits", [], [[]]],
//     ["_p_city_free_trigger", 0, [0]]
// ];

// if (count _remainEnemyUnits > _p_city_free_trigger) exitWith {false};
// _remainEnemyUnits findIf {
//     private _veh = vehicle _x;
//     !(
//         _veh isKindOf "Man" ||
//         {unitIsUAV _veh}
//     )
// } isEqualTo -1
