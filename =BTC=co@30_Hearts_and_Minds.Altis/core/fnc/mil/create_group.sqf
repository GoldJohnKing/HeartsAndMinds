
/* ----------------------------------------------------------------------------
Function: btc_fnc_mil_create_group

Description:
    Fill me when you edit me !

Parameters:
    _city - [Number]
    _area - [Number]
    _n - [Number]
    _wp - [Array]
    _type_divers - [Array]
    _type_units - [Boolean]
    _p_sea - [Side]
    _enemy_side - [Array]
    _wp_ratios - []

Returns:

Examples:
    (begin example)
        [player, 50, 1, (btc_p_mil_wp_ratios#0) - 0.1] call btc_fnc_mil_create_group;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_city", objNull, [objNull, []]],
    ["_area", 300, [0]],
    ["_n", 0, [0]],
    ["_wp", 0, [0]],
    ["_type_divers", btc_type_divers, [[]]],
    ["_type_units", btc_type_units, [[]]],
    ["_p_sea", btc_p_sea, [true]],
    ["_enemy_side", btc_enemy_side, [east]],
    ["_wp_ratios", btc_p_mil_wp_ratios, [[]]]
];
_wp_ratios params ["_wp_house_probability", "_wp_sentry_probability"];

([_city, _area] call btc_fnc_city_findPos) params ["_rpos", "_pos_iswater"];
private _group_structure = [1, objNull];
if (_wp <= _wp_house_probability) then { // Find building
    ([_rpos, _n] call btc_fnc_mil_getBuilding) params ["_numberOfGroup", "_structure"];
    if (_structure isNotEqualTo "") then {
        _group_structure = [_numberOfGroup, _structure];
    } else {
        _wp = _wp_sentry_probability; // Handle the case there is no building
    };
};

_group_structure params ["_numberOfGroup", "_structure"];
private _groups = [];
for "_i" from 1 to _numberOfGroup do {
    private _group = createGroup _enemy_side;
    _groups pushBack _group;
    if (_city isEqualType objNull) then {
        _group setVariable ["btc_city", _city];
    };

    switch (true) do {
        case (_wp <= _wp_house_probability) : {
            _n = 1;
            [_group, _structure] call btc_fnc_house_addWP;
            _group setVariable ["btc_inHouse", typeOf _structure];
        };
        case (_wp > _wp_house_probability && _wp <= _wp_sentry_probability) : {
            [_group, _rpos, _area, 2 + floor (random 4), "MOVE", "SAFE", "RED", "LIMITED", "STAG COLUMN", "", [5, 10, 20]] call CBA_fnc_taskPatrol;
        };
        case (_wp > _wp_sentry_probability) : {
            [_group] call CBA_fnc_clearWaypoints;
            [_group, _rpos, -1, "SENTRY", "AWARE", "RED"] call CBA_fnc_addWaypoint;
        };
    };

    [_group, _rpos, _n, _pos_iswater] call btc_fnc_mil_createUnits;
};

if (btc_debug_log) then {
    [format ["_this = %1 ; POS %2 UNITS N %3 _wp_ratios %4", _this, _rpos, _n, _wp_ratios], __FILE__, [false]] call btc_fnc_debug_message;
};

_groups