
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
    if (isServer) then {
        [_unit] call btc_fnc_eh_veh_respawn;
    };
    if (side _instigator isEqualTo btc_player_side) then {
        {
            _x addRating (9999 - rating _x);
        } forEach units group _instigator;
    };
    if (_instigator isPlayer) then {
        private _killerName = [[name _instigator], [" "]] select (isNull _instigator);
        private _vehicleName = _getText (configFile >> "cfgVehicles" >> typeOf (_this select 0) >> "displayName");
        private _hintContent = [
            format ["玩家 %1", _killerName],
            ["摧毁了"],
            format ["友方载具 %1", _vehicleName]
        ];
        format ["玩家 %1 摧毁了友方载具 %2", _killerName, _vehicleName] call CBA_fnc_notify;
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
