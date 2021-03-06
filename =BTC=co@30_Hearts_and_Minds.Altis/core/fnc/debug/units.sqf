
/* ----------------------------------------------------------------------------
Function: btc_fnc_debug_units

Description:
    Fill me when you edit me !

Parameters:
    _args - [Array]
    _id - [Number]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_debug_units;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_args", [], [[]]],
    ["_id", 0, [0]]
];
_args params ["_display", "_TXTunits"];

if (isNull _display || !btc_debug_graph) exitWith {
    [_id] call CBA_fnc_removePerFrameHandler;
    _display closeDisplay 1;
};

[10, objNull, "btc_units_owners"] remoteExecCall ["btc_fnc_int_ask_var", 2];
["btc_patrol_active", objNull, "btc_patrol_active"] remoteExecCall ["btc_fnc_int_ask_var", 2];
["btc_civ_veh_active", objNull, "btc_civ_veh_active"] remoteExecCall ["btc_fnc_int_ask_var", 2];
["btc_delay_createUnit", objNull, "btc_delay_createUnitDebug"] remoteExecCall ["btc_fnc_int_ask_var", 2];
private _count_units = {(_x select 0) isKindOf "man"} count btc_units_owners;
private _count_units_own = {((_x select 1) isEqualTo 2) && ((_x select 0) isKindOf "man")} count btc_units_owners;

_TXTunits ctrlSetText format ["等待:%1s 单位:%2 负载均衡:%3 小队:%4 敌军巡逻:%5 平民交通:%6", [btc_delay_createUnitDebug, 0] select (btc_delay_createUnitDebug < 0.001), _count_units, _count_units - _count_units_own, count allGroups, count btc_patrol_active, count btc_civ_veh_active]; // Edited: Translate and shorten the phrases to support wider fonts, default = "DELAY:%1s UNITS:%2 NOT-ON-SERVER:%3 | GROUPS:%4 | Patrol:%5 Traffic:%6"
