
/* ----------------------------------------------------------------------------
Function: btc_fnc_side_vehicle

Description:
    Fill me when you edit me !

Parameters:
    _taskID - Unique task ID. [String]

Returns:

Examples:
    (begin example)
        [] spawn btc_fnc_side_vehicle;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_taskID", "btc_side", [""]]
];

private _useful = btc_city_all select {!(isNull _x) && _x getVariable ["type", ""] != "NameMarine"};
if (_useful isEqualTo []) exitWith {[] spawn btc_fnc_side_create;};
private _city = selectRandom _useful;

private _pos = [getPos _city, 100] call btc_fnc_randomize_pos;
private _roads = _pos nearRoads 300;
if !(_roads isEqualTo []) then {_pos = getPos (selectRandom _roads);};

private _veh_type = selectRandom [selectRandom btc_civ_type_veh, selectRandom side_vehicle_types]; // Edited: Add player side vehicles, default = selectRandom btc_civ_type_veh
private _veh = createVehicle [_veh_type, _pos, [], 0, "NONE"];
_veh setDir (random 360);
_veh setDamage 0.87; // Edited: Increase default damage value, default = 0.7
_veh setHit ["wheel_1_1_steering", 1];
// Edited: Add more hit points
_veh setHit ["wheel_1_2_steering", 1];
_veh setHit ["wheel_2_1_steering", 1];
_veh setHit ["wheel_2_2_steering", 1];
_veh setHitPointDamage ["hitbody", 0.85];
_veh setHitPointDamage ["hithull", 0.85];
_veh setHitPointDamage ["hitengine", 1];
_veh setHitPointDamage ["hitfuel", 1];
_veh setHitPointDamage ["hitltrack", 1];
_veh setHitPointDamage ["hitrtrack", 1];
_veh setHitPointDamage ["hithrotor", 1];
_veh setHitPointDamage ["hitvrotor", 1];
_veh setHitPointDamage ["hitavionics", 1];
_veh setHitPointDamage ["hitgun", 1];
_veh setHitPointDamage ["hitturret", 1];

[_taskID, 5, _veh, [_city getVariable "name", _veh_type]] call btc_fnc_task_create;

waitUntil {sleep 5; (_taskID call BIS_fnc_taskCompleted || (damage _veh < 0.1) || !alive _veh)}; // Edited: Change mission complete condition to fully repaired, default = (_veh getHit "wheel_1_1_steering" < 1)

[[], [_veh]] call btc_fnc_delete;

if (_taskID call BIS_fnc_taskState isEqualTo "CANCELED") exitWith {};
if (!alive _veh) exitWith {
    [_taskID, "FAILED"] call BIS_fnc_taskSetState;
};

15 call btc_fnc_rep_change;

[_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;
