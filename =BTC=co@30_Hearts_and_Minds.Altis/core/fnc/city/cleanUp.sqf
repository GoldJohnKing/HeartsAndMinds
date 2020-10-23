
/* ----------------------------------------------------------------------------
Function: btc_fnc_city_cleanUp

Description:
    Delete all ground weapon holder (in range of 500 m), dead bodies (in range of 500 m) and empty group.

Parameters:
    _playableUnits - Players connected. [Array]

Returns:

Examples:
    (begin example)
        [] call btc_fnc_city_cleanUp;
    (end)

Author:
    Giallustio

---------------------------------------------------------------------------- */

params [
    ["_playableUnits", playableUnits, [[]]]
];

btc_groundWeaponHolder = btc_groundWeaponHolder - [objNull];
private _toRemove = ((btc_groundWeaponHolder + (entities "WeaponHolderSimulated") + (entities "body") + (entities "ACE_bodyBagObject")) select {!(_x getVariable ["no_cache", false])}) select { // Edited: Support AGM Mod Bodybags, default = (btc_groundWeaponHolder + (entities "WeaponHolderSimulated"))

    private _obj = _x;

    ((btc_gear_object inArea [getPosWorld _obj, 300, 300, 0, false]) || (_playableUnits inAreaArray [getPosWorld _obj, 250, 250] isEqualTo [])) && !(_obj getVariable ["btc_dont_delete", false]) // Edited: Force "btc_dont_delete" objects not removable in all cases & Decrease minimal clean range for dead units & Add support for base cleanup, default = _playableUnits inAreaArray [getPosWorld _obj, 500, 500] isEqualTo []
};

_toRemove append (allDead select {
    private _dead = _x;

    ((btc_gear_object inArea [getPosWorld _dead, 300, 300, 0, false]) || (_playableUnits inAreaArray [getPosWorld _dead, 300, 300] isEqualTo [])) && !(_dead getVariable ["btc_dont_delete", false]) // Edited: Force delete dead units near player spawn point & Decrease minimal clean range for dead units, default = _playableUnits inAreaArray [getPosWorld _dead, 500, 500]
});

// Edited: Also remove enemy infantries and land vehicles far from players
_toRemove append ((entities [[], [], true, true] select {!(_x getVariable ["no_cache", false])}) select {
    private _obj = _x;
    ((allUnits select {side _x isEqualTo btc_player_side}) inAreaArray [getPosWorld _obj, 2750, 2750] isEqualTo []) && (side _obj isEqualTo east) && !(_obj getVariable ["btc_dont_delete", false])
});

_toRemove call CBA_fnc_deleteEntity;

if (btc_delay_createUnit < 0.001) then { // Don't remove group during units creation.
    (allGroups select {
        units _x isEqualTo [] &&
        !(
            _x in btc_patrol_active ||
            _x in btc_civ_veh_active
        )
    }) call CBA_fnc_deleteEntity;
};

while {objNull in btc_chem_contaminated} do {
    btc_chem_contaminated deleteAt (
        btc_chem_contaminated find objNull
    )
};
