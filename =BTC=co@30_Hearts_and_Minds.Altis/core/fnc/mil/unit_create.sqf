
/* ----------------------------------------------------------------------------
Function: btc_fnc_mil_unit_create

Description:
    Fill me when you edit me !

Parameters:
    _group - [Object]

Returns:

Examples:
    (begin example)
        _result = [] call btc_fnc_mil_unit_create;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_group", grpNull, [grpNull]]
];

{
    _x setVariable ["btc_init", true];
    _x call btc_fnc_mil_add_eh;

    if (btc_p_set_skill) then {
        _x call btc_fnc_mil_set_skill;
    };

    if (btc_p_chem) then {
        //Edited: Randomly add CBRN equipments to mil units
        private _rand = random 1;
        if (_rand < 0.1) then {
            _x linkItem "G_AirPurifyingRespirator_01_F";
        } else {
            if (_rand < 0.2) then {
                _x linkItem "G_RegulatorMask_F";
            } else {
                if (_rand < 0.5) then {
                    _x linkItem selectRandom ["G_Respirator_white_F", "G_Respirator_yellow_F", "G_Respirator_blue_F"];
                    };
            };
        };
        //Edited: Add possibility for basic propagation
        if (random 1 < 0.05) then {
            if ((btc_chem_contaminated pushBackUnique _x) > -1) then {
                publicVariable "btc_chem_contaminated";
            };
        };
    };

} forEach (units _group select {!(_x getVariable ["btc_init", false])});
