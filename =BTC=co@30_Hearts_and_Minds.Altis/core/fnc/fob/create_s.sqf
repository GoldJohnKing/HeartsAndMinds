
/* ----------------------------------------------------------------------------
Function: btc_fnc_fob_create_s

Description:
   Create the FOB.

Parameters:
    _pos - Position of the FOB. [Array]
    _direction - Direction of the FOB between 0 to 360 degree. [Number]
    _FOB_name - Name of the FOB. [String]
    _fob_structure - FOB structure. [Array]
    _fob_flag - Flag type. [Array]
    _fobs - Array of FOB. [Array]

Returns:
    _array - Return marker, structure and flag object. [Array]

Examples:
    (begin example)
        [getPos player, random 360, "My FOB"] call btc_fnc_fob_create_s;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_pos", [], [[]]],
    ["_direction", 0, [0]],
    ["_FOB_name", "FOB ", [""]],
    ["_fob_structure", btc_fob_structure, [[]]],
    ["_fob_flag", btc_fob_flag, [[]]],
    ["_fobs", btc_fobs, [[]]]
];

private _flag = createVehicle [_fob_flag, _pos, [], 0, "CAN_COLLIDE"];
private _structure = createVehicle [_fob_structure, _pos, [], 0, "CAN_COLLIDE"];

_structure setDir _direction;

private _marker = createMarker [_FOB_name, _pos];
_marker setMarkerSize [1, 1];
if (_FOB_name isEqualTo "航空母舰" || _FOB_name isEqualTo "码头") then { // Edited: Custom FOB icon
    _marker setMarkerType "b_naval";
} else {
    _marker setMarkerType "b_hq";
};
_marker setMarkerText _FOB_name;
//_marker setMarkerColor "ColorBlue"; // Edited: Use default color
_marker setMarkerShape "ICON";

(_fobs select 0) pushBack _marker;
(_fobs select 1) pushBack _structure;
(_fobs select 2) pushBack _flag;
_flag setVariable ["BIS_fnc_IDRespawnPosition", ([btc_player_side, _flag, _FOB_name] call BIS_fnc_addRespawnPosition) select 1];

_structure addEventHandler ["Killed", btc_fnc_fob_killed];

[_marker, _structure, _flag]
