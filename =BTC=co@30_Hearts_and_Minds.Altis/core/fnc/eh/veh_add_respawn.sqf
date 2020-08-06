
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
    ["_helo", btc_helo, [[]]],
    ["_p_chem", btc_p_chem, [false]]
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
    private _driver = driver _unit;
    if (isPlayer _instigator) then {
        [["玩家"], [name _instigator, 1.25, [1, 0, 0, 1]], [" ", 0.7], ["摧毁了友方载具"], [getText (configFile >> "cfgVehicles" >> typeOf _unit >> "displayName"), 1.25, [1, 0, 0, 1]]] remoteExecCall ["CBA_fnc_notify", -2];
    } else {
        if (isPlayer _driver) then { // && (_unit isEqualTo _killer)
            [["玩家"], [name _driver, 1.25, [1, 0, 0, 1]], [" ", 0.7], ["坠毁了友方载具"], [getText (configFile >> "cfgVehicles" >> typeOf _unit >> "displayName"), 1.25, [1, 0, 0, 1]]] remoteExecCall ["CBA_fnc_notify", -2];
        };
    };
    if (side _instigator == btc_player_side) then { // Edited: Temporarily useless
        {
            _x addRating (9999 - rating _x);
        } forEach units group _instigator;
    };
    if (isServer) then {
        [_unit] call btc_fnc_eh_veh_respawn;
    };
}];
if (btc_p_respawn_location > 0) then {
    if !(fullCrew [_vehicle, "cargo", true] isEqualTo []) then {
        [btc_player_side, _vehicle] call BIS_fnc_addRespawnPosition;
    };
};
if (_p_chem) then {
    _vehicle addEventHandler ["GetIn", {
        [_this select 0, _this select 2] call btc_fnc_chem_propagate;
        _this
    }];
};
