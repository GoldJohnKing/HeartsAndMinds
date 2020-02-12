
/* ----------------------------------------------------------------------------
Function: btc_fnc_civ_unit_create

Description:
    Initialize civilian by adding eventhandlers.

Parameters:
    _group - group to initialize. [Object]

Returns:

Examples:
    (begin example)
        [_group] call btc_fnc_civ_unit_create;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_group", grpNull, [grpNull]]
];

{
    _x setVariable ["btc_init", true];

    _x call btc_fnc_rep_add_eh;
    
    if (btc_p_chem) then {
        //Edited: Randomly add CBRN equipments to civ units
        private _rand = random 1;
        if (_rand < 0.1) then {
            removeUniform _x;
            removeBackpack _x;
            removeHeadgear _x;
            _x addUniform "U_C_CBRN_Suit_01_White_F";
            _x addBackpack "B_CombinationUnitRespirator_01_F";
            _x linkItem "G_AirPurifyingRespirator_01_F";
        } else {
            if (_rand < 0.2) then {
                removeUniform _x;
                removeBackpack _x;
                removeHeadgear _x;
                _x addUniform "U_C_CBRN_Suit_01_Blue_F";
                _x addBackpack "B_SCBA_01_F";
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
