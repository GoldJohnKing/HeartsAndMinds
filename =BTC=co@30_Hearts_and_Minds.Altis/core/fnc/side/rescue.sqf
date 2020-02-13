
/* ----------------------------------------------------------------------------
Function: btc_fnc_side_rescue

Description:
    Fill me when you edit me !

Parameters:
    _taskID - Unique task ID. [String]

Returns:

Examples:
    (begin example)
        [false, "btc_fnc_side_rescue"] spawn btc_fnc_side_create;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_taskID", "btc_side", [""]]
];

//// Choose an occupied City \\\\
private _useful = btc_city_all select {!(isNull _x) && _x getVariable ["occupied", false] && !((_x getVariable ["type", ""]) in ["NameLocal", "Hill", "NameMarine"])};

if (_useful isEqualTo []) exitWith {[] spawn btc_fnc_side_create;};

private _city = selectRandom _useful;

//// Randomise position \\\\
private _pos = [getPos _city, (((_city getVariable ["RadiusX", 0]) + (_city getVariable ["RadiusY", 0]))/4) - 100] call btc_fnc_randomize_pos; //Edited: Narrow randomize distance
_pos = [_pos, 0, 50, 13, 0, 60 * (pi / 180), 0] call btc_fnc_findsafepos;

_city setVariable ["spawn_more", true];

//Edited: Use IDAP medical van instead of heli ruin
_heli_type = "C_IDAP_Van_02_medevac_F";
private _heli = createVehicle [_heli_type, _pos, [], 0, "NONE"];
_heli setVariable ["btc_dont_delete", true];

private _group = createGroup btc_player_side;
_group setVariable ["no_cache", true];
private _crew = selectRandom btc_civ_type_units; //Edited: Use civ unit instead of mil crew units
_pos = [_pos, 1, 5, 3, 0, 60 * (pi / 180), 0] call btc_fnc_findsafepos; //Edited: Avoid unit collision with vehicle
_crew createUnit [_pos, _group];
_group call btc_fnc_civ_unit_create; //Edited: Call btc_fnc_civ_unit_create to add probability for CBRN equipments and propagation

//Edited: Add map marker to rescue target
private _rescueMarker = createMarker ["IDAP", _group];
_rescueMarker setMarkerType "hd_flag";
[_rescueMarker, "IDAP"] remoteExecCall ["btc_fnc_set_markerTextLocal", [0, -2] select isDedicated, _rescueMarker];
_rescueMarker setMarkerSize [0.6, 0.6];

[_taskID, 13, getPos _city, _city getVariable "name"] call btc_fnc_task_create;
private _find_taskID = _taskID + "mv";
[[_find_taskID, _taskID], 20, objNull, _crew] call btc_fnc_task_create;
private _back_taskID = _taskID + "bk";

private _units = [];
private _triggers = [];
{
    _x setCaptive true;
    removeAllWeapons _x;
    _x setBehaviour "CARELESS";
    _x setDir (random 360);
    _x setUnitPos "AUTO"; //Edited: Unit position set to AUTO
    _units pushBack _x;
    //// Create trigger \\\\
    private _trigger = createTrigger ["EmptyDetector", getPos _city];
    _trigger setVariable ["unit", _x];
    _trigger setTriggerArea [50, 50, 0, false];
    _trigger setTriggerActivation [str btc_player_side, "PRESENT", false];
    _trigger setTriggerStatements ["this", format ["_unit = thisTrigger getVariable 'unit'; [_unit] join (thisList select 0); ['%1', 'SUCCEEDED'] call BIS_fnc_taskSetState; [['%2', '%3'], 21, medical_center, typeOf medical_center, true] call btc_fnc_task_create;", _find_taskID, _back_taskID, _taskID], ""]; //Edited: Unit position set to AUTO & Change task finish target area to medical_center
    _trigger attachTo [_x, [0, 0, 0]];
    _triggers pushBack _trigger;
} forEach units _group;

waitUntil {sleep 5; (
    _taskID call BIS_fnc_taskCompleted ||
    _units select {_x distance medical_center > 100} isEqualTo [] || //Edited: Change task finish target area to medical_center
    _units select {alive _x} isEqualTo []
)};

private _rep = 50;
if (_units select {alive _x} isEqualTo []) then {
    [_back_taskID, "FAILED"] call BIS_fnc_taskSetState;
    private _bodyBag_taskID = _taskID + "bb";
    {
        private _IDDeleted = [_x, "Deleted", {
            params [
                ["_unit", objNull, [objNull]]
            ];
            _thisArgs params ["_taskID"];

            if (_unit inArea [[-5000, -5000, 0], 10, 10, 0, false]) exitWith {}; // Detect if the body is inside a bodybag (https://github.com/acemod/ACE3/blob/44050df98b00e579e5b5a79c0d76d4d1138b4baa/addons/medical_treatment/functions/fnc_placeInBodyBag.sqf#L40)
            [_taskID, "FAILED"] call btc_fnc_task_setState;
        }, [_taskID]] call CBA_fnc_addBISEventHandler;

        private _unitBodyBag_taskID = _bodyBag_taskID + str(_forEachIndex);
        [[_unitBodyBag_taskID, _taskID], 34, _x, [([_x] call ace_dogtags_fnc_getDogtagData) select 0, typeOf _x]] call btc_fnc_task_create;
        ["ace_placedInBodyBag", {
            params ["_patient", "_bodyBag"];
            _thisArgs params ["_unit", "_unitBodyBag_taskID", "_taskID", "_IDDeleted"];

            if (_patient isEqualTo _unit) then {
                _patient removeEventHandler ["Deleted", _IDDeleted];

                [_thisType, _thisId] call CBA_fnc_removeEventHandler;
                [_unitBodyBag_taskID, "SUCCEEDED"] call BIS_fnc_taskSetState;

                private _base_taskID = _taskID + "bs";
                [[_base_taskID, _taskID], 35, medical_center, [([_patient] call ace_dogtags_fnc_getDogtagData) select 0, typeOf medical_center]] call btc_fnc_task_create; //Edited: Change task finish target area to medical_center

                [_bodyBag, "Deleted", {
                    params [
                        ["_bodyBag", objNull, [objNull]]
                    ];
                    _thisArgs params ["_taskID"];

                    if (_taskID call BIS_fnc_taskCompleted) exitWith {};
                    [_taskID, "FAILED"] call btc_fnc_task_setState;
                }, [_taskID]] call CBA_fnc_addBISEventHandler;
            };
            _this
        }, [_x, _unitBodyBag_taskID, _taskID, _IDDeleted]] call CBA_fnc_addEventHandlerArgs;
    } forEach _units;

    private _dogTagList = _units apply {([_x] call ace_dogtags_fnc_getDogtagData) select 0};

    waitUntil {sleep 5; (
        _taskID call BIS_fnc_taskCompleted ||
        {
            (([_x] call ace_dogtags_fnc_getDogtagData) select 0) in _dogTagList
        } count (nearestObjects [medical_center, ["ACE_bodyBagObject"], 100]) >= count _units //Edited: Change task finish target area to medical_center
    )};
    _rep = 40;
};

{
    deleteVehicle _x;
} forEach _triggers;
[[_rescueMarker], [_heli, _group] + _units] call btc_fnc_delete; //Edited: Add removal of rescue target map marker, remove _fx

if (_taskID call BIS_fnc_taskState in ["CANCELED", "FAIL"]) exitWith {};

_rep call btc_fnc_rep_change;

[_taskID, "SUCCEEDED"] call btc_fnc_task_setState;
