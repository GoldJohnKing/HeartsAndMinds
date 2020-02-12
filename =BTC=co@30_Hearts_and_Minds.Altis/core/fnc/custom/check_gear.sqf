
/* ----------------------------------------------------------------------------
Function: gjk_fnc_custom_check_gear

Description:
    Check CBRN protection gears and return protection level.

Parameters:
    _unit - Unit to check gear. [Object]
    _cfgGlasses - Glasses config. [Config]

Returns:
	_hasProtection - Protection level. [Array]

Examples:
    (begin example)
        [cursorObject, configFile >> "CfgGlasses"] call gjk_fnc_custom_check_gear;
    (end)

Author:
    GoldJohnKing

---------------------------------------------------------------------------- */

params [
    ["_unit", objNull, [objNull]],
    ["_cfgGlasses", configNull, [configNull]]
];

//Edited: Check protection gear and return protection level
private _faceware = (
    goggles _unit isKindOf ["G_Respirator_white_F", _cfgGlasses] ||
    goggles _unit isKindOf ["G_Respirator_yellow_F", _cfgGlasses] ||
    goggles _unit isKindOf ["G_Respirator_blue_F", _cfgGlasses]);
private _betterFaceware = (
        goggles _unit isKindOf ["G_RegulatorMask_base_F", _cfgGlasses] ||
        goggles _unit isKindOf ["G_AirPurifyingRespirator_01_base_F", _cfgGlasses]);
private _backpack = (
        backpack _unit isKindOf "B_SCBA_01_base_F" ||
        backpack _unit isKindOf "B_CombinationUnitRespirator_01_Base_F");
private _uniform = uniform _unit find "CBRN" > -1;
private _faceware = _faceware || _betterFaceware;
private _fullUniform = _betterFaceware && _uniform;
private _fullCBRN = _fullUniform && _backpack;
private _hasProtection = [_faceware, _betterFaceware, _betterFaceware, _uniform, _backpack, _fullUniform, _fullUniform, _fullUniform, _fullUniform, _fullCBRN];

_hasProtection
