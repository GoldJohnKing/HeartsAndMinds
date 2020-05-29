
/* ----------------------------------------------------------------------------
Function: btc_fnc_chem_damage

Description:
    Apply chemical damage.

Parameters:
    _unit - Unit to apply the damage. [Object]
    _firstDamage - If no CBRN protection, true: Always apply damage, false: Damage are applied randomly. [Boolean]
    _bodyParts - List of body part. [Array]
    _cfgGlasses - Glasses config. [Config]

Returns:

Examples:
    (begin example)
        [cursorObject, true, ["head","body","hand_l","hand_r","leg_l","leg_r"], configFile >> "CfgGlasses"] call btc_fnc_chem_damage;
    (end)

Author:
    Vdauphin

---------------------------------------------------------------------------- */

params [
    ["_unit", objNull, [objNull]],
    ["_firstDamage", true, [true]],
    ["_bodyParts", [], [[]]],
    ["_cfgGlasses", configNull, [configNull]]
];

//Edited: Modify how damages are taken
[_unit, random [0, 0.01, 0.25], selectRandom _bodyParts, "stab"] call ace_medical_fnc_addDamageToUnit; //ropeburn

_this
