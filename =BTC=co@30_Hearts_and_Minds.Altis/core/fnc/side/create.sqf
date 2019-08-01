if (btc_side_assigned) exitWith {};

params [["_cycle", false]];

if (btc_side_list_use isEqualTo []) then {btc_side_list_use = + btc_side_list;};

private _side = selectRandom btc_side_list_use;

btc_side_list_use = btc_side_list_use - [_side];

btc_side_aborted = false;
btc_side_done = false;
btc_side_failed = false;
//Edited - Deleted mission names are: 0-btc_fnc_side_supply, 2-btc_fnc_side_vehicle, 5-btc_fnc_side_civtreatment, 7-btc_fnc_side_civtreatment_boat, 11-btc_fnc_side_capture_officer
switch (_side) do {
    case 0 : {[] call btc_fnc_side_hack;};
    case 1 : {[] call btc_fnc_side_mines;};
    case 2 : {[] call btc_fnc_side_convoy;};
    case 3 : {[] call btc_fnc_side_get_city;};
    case 4 : {[] call btc_fnc_side_tower;};
    case 5 : {[] call btc_fnc_side_checkpoint;};
    case 6 : {[] call btc_fnc_side_checkpoint;};
    case 7 : {[] call btc_fnc_side_hostage;};
    case 8 : {[] call btc_fnc_side_underwater_generator;};
    case 9 : {[] call btc_fnc_side_convoy;};
    case 10 : {[] call btc_fnc_side_rescue;};
    case 11 : {[] call btc_fnc_side_rescue;};
    case 12 : {[] call btc_fnc_side_hostage;};
    case 13 : {[] call btc_fnc_side_hack;};
};

if (_cycle) then {
    [true] spawn btc_fnc_side_create;
};
