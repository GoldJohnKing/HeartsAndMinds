
/* ----------------------------------------------------------------------------
Function: btc_fnc_city_activate

Description:
    Activate the city with the current id passed. This generate IED, random group, populate city with civilian and suicider. It also spawn military patrol and civilian.

Parameters:
    _id - Number of the city will be activated. [Number]
    _p_mil_group_ratio - Enemy density. [Number]
    _p_civ_group_ratio - Civilian density. [Number]
    _p_animals_group_ratio - Animal density. [Number]
    _p_civ_max_veh - Maximum number of civilian patrol. [Number]
    _p_patrol_max - Maximum number of enemy patrol. [Number]
    _wp_ratios - Ratio of spawned group in and out houses. [Array]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_city_activate;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_id", 0, [0]],
    ["_p_mil_group_ratio", btc_p_mil_group_ratio, [0]],
    ["_p_civ_group_ratio", btc_p_civ_group_ratio, [0]],
    ["_p_animals_group_ratio", btc_p_animals_group_ratio, [0]],
    ["_p_civ_max_veh", btc_p_civ_max_veh, [0]],
    ["_p_patrol_max", btc_p_patrol_max, [0]],
    ["_wp_ratios", btc_p_mil_wp_ratios, [[]]]
];
_wp_ratios params ["_wp_house", "_wp_sentry"];

private _city = btc_city_all select _id;
if (_city getVariable "activating") exitWith {};

if (btc_debug) then {
    [str _id, __FILE__, [btc_debug, btc_debug_log, true]] call btc_fnc_debug_message;
};

_city setVariable ["activating", true];

private _is_init = _city getVariable ["initialized", false];
private _data_units = _city getVariable ["data_units", []];
private _data_animals = _city getVariable ["data_animals", []];
private _type = _city getVariable ["type", ""];
private _radius = _city getVariable ["radius", 100];
private _has_en = _city getVariable ["occupied", false];
private _has_ho = _city getVariable ["has_ho", false];
private _ieds = _city getVariable ["ieds", []];
private _tags = _city getVariable ["tags", []];
private _spawningRadius = _radius/2;

if (!_is_init) then {
    private _ratio = (switch _type do {
        case "Hill" : {random 1};
        case "NameLocal" : {random 2.5};
        case "NameVillage" : {random 3.5};
        case "NameCity" : {random 5};
        case "NameCityCapital" : {random 6};
        case "Airport" : {0};
        case "NameMarine" : {0};
    });

    private _ratio_ied = _ratio;
    if (_has_en) then {
        _ratio_ied = _ratio_ied * 1.5;
    } else {
        _ratio_ied = _ratio_ied * 0.75;
    };
    if (_has_ho) then {
        _ratio_ied = _ratio_ied * 2;
    };

    if (btc_debug_log) then {
        [format ["_ratio_ied %1 - p %2", _ratio_ied, _ratio_ied * btc_p_ied], __FILE__, [false]] call btc_fnc_debug_message;
    };

    _ratio_ied = _ratio_ied * btc_p_ied;
    if (_ratio_ied > 0) then {[_city, _spawningRadius, (_ratio_ied / 2) + (random _ratio_ied)] call btc_fnc_ied_init_area};

    _ieds = _city getVariable ["ieds", []];
    _city setVariable ["initialized", true];
};

_city setVariable ["active", true];

if !(_ieds isEqualTo []) then {
    [[_city, _ieds], btc_fnc_ied_check] call btc_fnc_delay_exec;
};

private _delay = 0;
if !(_data_units isEqualTo []) then {
    {
        _delay = _delay + ([_x, _id] call btc_fnc_data_spawn_group);
    } forEach _data_units;
} else {
    // Maximum number of enemy group
    private _max_number_group = (switch _type do { // Edited: Tweak basic amount of enemy groups, default = 1,2,3,7,15,15,1,0
        case "Hill" : {4};
        case "NameLocal" : {4};
        case "NameVillage" : {4};
        case "NameCity" : {4};
        case "NameCityCapital" : {6};
        case "Airport" : {6};
        case "NameMarine" : {4};
        default {0};
    });

    if (_has_en) then {
        for "_i" from 1 to (2 + round (_p_mil_group_ratio * random _max_number_group)) do { // Edited: Tweak basic amount of enemy groups, default = (round (_p_mil_group_ratio * (1 + random _max_number_group)))
            [_city, _spawningRadius, round random [4, 6, 8], random 1] call btc_fnc_mil_create_group; // Edited: Tweak enemy amount each group, default = [_city, _spawningRadius, 1 + round random [0, 1, 2], random 1]
        };
    };

    // Spawn civilians
    if (_type != "Hill") then {
        private _max_number_group = (switch _type do {
            case "NameLocal" : {3};
            case "NameVillage" : {6};
            case "NameCity" : {10};
            case "NameCityCapital" : {19};
            case "Airport" : {6};
            default {2};
        });
        [_city, _spawningRadius/3, round (_p_civ_group_ratio * random _max_number_group)] call btc_fnc_civ_populate;
    };
};
if (btc_p_animals_group_ratio > 0) then {
    if !(_data_animals isEqualTo []) then {
        {
            _x call btc_fnc_delay_createAgent;
        } forEach _data_animals;
    } else {
        // Spawn animals
        private _max_number_animalsGroup = (switch _type do {
            case "Hill" : {3};
            case "NameLocal" : {3};
            case "NameVillage" : {2};
            case "NameCity" : {1};
            case "NameCityCapital" : {0};
            case "Airport" : {0};
            case "NameMarine" : {0};
            default {0};
        });
        for "_i" from 1 to (round (random _max_number_animalsGroup)) do {
            private _pos = [_city, _spawningRadius/3] call CBA_fnc_randPos;
            for "_i" from 1 to (round (random 3)) do {
                [selectRandom btc_animals_type, [_pos, 6] call CBA_fnc_randPos] call btc_fnc_delay_createAgent;
            };
        };
    };
};

if (_city getVariable ["spawn_more", false]) then {
    _city setVariable ["spawn_more", false];
    for "_i" from 1 to (2 + round random 2) do { // Edited: Tweak enemy group amount of "spawn_more" (side mission) cities, default = round (_p_mil_group_ratio * (2 + random 3))
        [_city, _spawningRadius, round random [4, 6, 8], random 1] call btc_fnc_mil_create_group;  // Edited: Tweak enemy amount each group of "spawn_more" (side mission) cities, default = [_city, _spawningRadius, 4 + round random 3, random 1]
    };
    for "_i" from 1 to (round (7.5 + random 7.5)) do { // Edited: Spawn many enemy static weapons every "spawn_more" city
            [[_city, random _spawningRadius] call CBA_fnc_randPos, btc_type_mg + btc_type_gl, random 360] call btc_fnc_mil_create_static;
    };
    if (btc_p_veh_armed_spawn_more) then {
        private _closest = [_city, btc_city_all select {!(_x getVariable ["active", false])}, false] call btc_fnc_find_closecity;
        for "_i" from 1 to (2 + round random [0, 1.5, 3]) do { // Edited: Tweak enemy armed vehicle amount in cities when "btc_p_veh_armed_spawn_more" is enabled, default = 1 + round random 2
            [{_this call btc_fnc_mil_send}, [_closest, getPos _city, 1, selectRandom btc_type_motorized_armed], _i * 2] call CBA_fnc_waitAndExecute;
        };
    };
    [[_city, 250] call CBA_fnc_randPos, btc_type_motar, random 360] call btc_fnc_mil_create_static;// Edited: Spawn enemy artillery every "spawn_more" city
};

if !(btc_cache_pos isEqualTo [] && {!(btc_cache_obj getVariable ["btc_cache_unitsSpawned", false])}) then {
    if (_city inArea [btc_cache_pos, _radius, _radius, 0, false]) then {
        btc_cache_obj setVariable ["btc_cache_unitsSpawned", true];

        [btc_cache_pos, 8, round (_p_mil_group_ratio * random [2, 4, 6]), _wp_house] call btc_fnc_mil_create_group; // Edited: Tweak enemy amount of guard group in cache cities, default = [btc_cache_pos, 8, 3, _wp_house]
        [btc_cache_pos, 60, round (_p_mil_group_ratio * random [2, 4, 6]), _wp_sentry] call btc_fnc_mil_create_group; // Edited: Tweak enemy amount of patrol group cache cities, default = [btc_cache_pos, 60, 4, _wp_sentry]
        if (btc_p_veh_armed_spawn_more) then {
            private _closest = [_city, btc_city_all select {!(_x getVariable ["active", false])}, false] call btc_fnc_find_closecity;
            for "_i" from 1 to (round (_p_mil_group_ratio * (1 + random [0, 2, 4]))) do { // Edited: Tweak enemy armed vehicle amount in cache cities when "btc_p_veh_armed_spawn_more" is enabled, default = 1 + round random 3
                [{_this call btc_fnc_mil_send}, [_closest, getPos _city, 1, selectRandom btc_type_motorized_armed], _i * 2] call CBA_fnc_waitAndExecute;
            };
        };
        [[_city, 250] call CBA_fnc_randPos, btc_type_motar, random 360] call btc_fnc_mil_create_static;// Edited: Spawn enemy artillery every "cache" city
    };
};

if (_has_ho && {!(_city getVariable ["ho_units_spawned", false])}) then {
    _city setVariable ["ho_units_spawned", true];
    private _pos = _city getVariable ["ho_pos", getPos _city];
    [_pos, 50, round random [4, 6, 8], 1.1] call btc_fnc_mil_create_group; // Edited: Tweak enemy amount and spawn radius of guard group in hideouts, default = [_pos, 20, 10 + round (_p_mil_group_ratio * random 6), 1.1]
    [_pos, 100, round random [4, 6, 8], _wp_sentry] call btc_fnc_mil_create_group; // Edited: Tweak enemy amount and spawn radius of patrol group in hideouts, default = [_pos, 120, 1 + round random 2, _wp_sentry]
    [_pos, 150, round random [4, 6, 8], _wp_sentry] call btc_fnc_mil_create_group; // Edited: Tweak enemy amount and spawn radius of guard group in hideouts, default = [_pos, 120, 1 + round random 2, _wp_sentry]
    private _random = random 1;
    switch (true) do {
        case (_random <= 0.3) : {};
        case (_random > 0.3 && _random <= 0.75) : {
            private _statics = btc_type_gl + btc_type_mg;
            [[(_pos select 0) + 7, (_pos select 1) + 7, 0], _statics, 45] call btc_fnc_mil_create_static;
        };
        case (_random > 0.75) : {
            private _statics = btc_type_gl + btc_type_mg;
            [[(_pos select 0) + 7, (_pos select 1) + 7, 0], _statics, 45] call btc_fnc_mil_create_static;
            [[(_pos select 0) - 7, (_pos select 1) - 7, 0], _statics, 225] call btc_fnc_mil_create_static;
        };
    };
    if (btc_p_veh_armed_ho) then {
        _closest = [_city, btc_city_all select {!(_x getVariable ["active", false])}, false] call btc_fnc_find_closecity;
        for "_i" from 1 to (2 + round random 2) do { // Edited: Tweak enemy armed vehicle amount in cache cities when "btc_p_veh_armed_ho" is enabled, default = (2 + round random 3)
            [{_this call btc_fnc_mil_send}, [_closest, _pos, 1, selectRandom btc_type_motorized_armed], _i * 2] call CBA_fnc_waitAndExecute;
        };
    };
    [[_city, 250] call CBA_fnc_randPos, btc_type_motar, random 360] call btc_fnc_mil_create_static;// Edited: Spawn enemy artillery every "hideout" city
};

//Suicider
if !(_city getVariable ["has_suicider", false]) then {
    if ((time - btc_ied_suic_spawned) > btc_ied_suic_time && {random 1000 > btc_global_reputation}) then {
        btc_ied_suic_spawned = time;
        _city setVariable ["has_suicider", true];
        if (selectRandom [false, false, btc_p_ied_drone]) then {
            [[_city, _spawningRadius], btc_fnc_ied_drone_create] call btc_fnc_delay_exec;
        } else {
            [[_city, _spawningRadius], btc_fnc_ied_suicider_create] call btc_fnc_delay_exec;
        };
    };
};

[[_city, _spawningRadius, _type, _has_en, _has_ho], btc_fnc_tag_initArea] call btc_fnc_delay_exec;

[{
    params ["_has_en", "_city", "_radius", "_id"];

    if (_has_en) then {
        private _trigger = createTrigger ["EmptyDetector", getPos _city];
        _trigger setTriggerArea [_radius, _radius, 0, false];
        _trigger setTriggerActivation [str btc_enemy_side, "NOT PRESENT", false];
        _trigger setTriggerStatements ["count thisList < 3", format ["[%1] call btc_fnc_city_set_clear", _id], ""]; // Edited: Set when cities will be free, default = _trigger setTriggerStatements ["this", format ["[%1] call btc_fnc_city_set_clear", _id], ""];
        _city setVariable ["trigger", _trigger];
    };

    _city setVariable ["activating", false];
}, [_has_en, _city, _radius, _id], btc_delay_createUnit + _delay] call CBA_fnc_waitAndExecute;

//Patrol
btc_patrol_active = btc_patrol_active - [grpNull];
private _numberOfPatrol = count btc_patrol_active;
if (_numberOfPatrol < _p_patrol_max) then {
    private _offset = 0;
    private _max = 2;
    if (_has_en) then {
        _max = 3;
        _offset = 3/2;
    };
    private _r = (_offset + random _max) min (_p_patrol_max - _numberOfPatrol);
    for "_i" from 1 to round _r do {
        private _group = createGroup btc_enemy_side;
        btc_patrol_active pushBack _group;
        _group setVariable ["no_cache", true];
        [[_group, 2, _city, _radius + btc_patrol_area], btc_fnc_mil_create_patrol] call btc_fnc_delay_exec; // Edited: Adjust probability of AI patrol types, spawn more enemy vehicles, default = [_group, 1 + round random 1, _city, _radius + btc_patrol_area], btc_fnc_mil_create_patrol]
    };
};
//Traffic
btc_civ_veh_active = btc_civ_veh_active - [grpNull];
private _numberOfCivVeh = count btc_civ_veh_active;
if (_numberOfCivVeh < _p_civ_max_veh) then {
    private _r = (3/2 + random 3) min (_p_civ_max_veh - _numberOfCivVeh);
    for "_i" from 1 to round _r do {
        private _group = createGroup civilian;
        btc_civ_veh_active pushBack _group;
        _group setVariable ["no_cache", true];
        [[_group, _city, _radius + btc_patrol_area], btc_fnc_civ_create_patrol] call btc_fnc_delay_exec;
    };
};
