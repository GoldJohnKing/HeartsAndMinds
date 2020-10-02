
/* ----------------------------------------------------------------------------
Function: btc_fnc_eh_veh_add_respawn

Description:
    Add a vehicle to the respawn system and save vehicle parameters.

Parameters:
    _vehicle - Vehicle to add inside the respawn system. [Object]
    _time - Time before respawn. [Number]
    _helo - Array of respawning vehicles. [Array]

Returns:
    _handle - Value of the MPEventhandle. [Number]

Examples:
    (begin example)
        [cursorObject, 30] call btc_fnc_eh_veh_add_respawn;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_vehicle", objNull, [objNull]],
    ["_time", 30, [0]],
    ["_helo", btc_helo, [[]]]
];

_helo pushBackUnique _vehicle;

private _type = typeOf _vehicle;
private _pos = getPosASL _vehicle;
private _dir = getDir _vehicle;
private _vector = [vectorDir _vehicle, vectorUp _vehicle];
private _vehProperties = [_vehicle] call btc_fnc_getVehProperties;
_vehProperties set [5, false];

_vehicle setVariable ["data_respawn", [_type, _pos, _dir, _time, _vector] + _vehProperties];

if ((isNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "ace_fastroping_enabled")) && !(typeOf _vehicle isEqualTo "RHS_UH1Y_d")) then {[_vehicle] call ace_fastroping_fnc_equipFRIES};
_vehicle addMPEventHandler ["MPKilled", { // Edited: Add notification when friendly vehicles are killed by friendly units & Add ratings to players once friendly vehicles are killed to prevent VCOM AI target players as enemy, default = ["MPKilled", {if (isServer) then {[_this select 0] call btc_fnc_eh_veh_respawn};}]
    params ["_unit", "_killer", "_instigator"];
    if (isServer) then {
        [_unit] call btc_fnc_eh_veh_respawn;
        private _driver = driver _unit;
        if (isPlayer _instigator) then {
            [22, [name _instigator, getText (configFile >> "cfgVehicles" >> typeOf _unit >> "displayName")]] remoteExecCall ["btc_fnc_show_hint", 0];
        } else {
            if (isPlayer _driver) then { // Edited: Temporarily useless: && (_unit isEqualTo _killer)
                [23, [name _driver, getText (configFile >> "cfgVehicles" >> typeOf _unit >> "displayName")]] remoteExecCall ["btc_fnc_show_hint", 0];
            };
        };
    };
    // if (side _instigator == btc_player_side) then { // Edited: Temporarily useless
    //     {
    //         if (local _x) then {
    //             _x addRating (9999 - rating _x);
    //         };
    //     } forEach units group _instigator;
    // };
}];
if (btc_p_respawn_location > 0) then {
    if !(fullCrew [_vehicle, "cargo", true] isEqualTo []) then {
        [_vehicle, "Deleted", {_thisArgs call BIS_fnc_removeRespawnPosition}, [btc_player_side, _vehicle] call BIS_fnc_addRespawnPosition] call CBA_fnc_addBISEventHandler;
    };
};
