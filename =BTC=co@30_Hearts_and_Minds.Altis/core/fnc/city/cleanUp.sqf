
/* ----------------------------------------------------------------------------
Function: btc_city_fnc_cleanUp

Description:
    Delete all ground weapon holder (in range of 500 m), dead bodies (in range of 500 m) and empty group.

Parameters:
    _playableUnits - Players connected. [Array]

Returns:

Examples:
    (begin example)
        [] call btc_city_fnc_cleanUp;
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

    ((btc_gear_object inArea [getPosWorld _obj, 500, 500, 0, false]) || (_playableUnits inAreaArray [getPosWorld _obj, 500, 500] isEqualTo [])) && !(_obj getVariable ["btc_dont_delete", false]) // Edited: Force "btc_dont_delete" objects not removed in all cases & Add support for base cleanup, default = _playableUnits inAreaArray [getPosWorld _obj, 500, 500] isEqualTo []
};

_toRemove append (allDead select {
    private _dead = _x;

    ((btc_gear_object inArea [getPosWorld _dead, 500, 500, 0, false]) || (_playableUnits inAreaArray [getPosWorld _dead, 500, 500] isEqualTo [])) && !(_dead getVariable ["btc_dont_delete", false]) // Edited: Force delete dead units near player spawn point, default = _playableUnits inAreaArray [getPosWorld _dead, 500, 500]
});

_toRemove call CBA_fnc_deleteEntity;

if (btc_delay_time < 0.001) then { // Don't remove group during units creation.
    // Edited: Also delete AI groups that are far from players
    private _patrolsToRemove = [];
    private _patrolGroupsToRemove = ((btc_patrol_active + btc_civ_veh_active) select {
        private _leader = leader _x;
        private _vehicle = vehicle _leader;
        private _leaderPos = getPosWorld _leader;
        ((_vehicle isKindOf "Men") && {_playableUnits inAreaArray [_leaderPos, 1000, 1000] isEqualTo []}) ||
        {((_vehicle isKindOf "LandVehicle") && {_playableUnits inAreaArray [_leaderPos, 1500, 1500] isEqualTo []}) ||
        {((_vehicle isKindOf "Helicopter") && {_playableUnits inAreaArray [_leaderPos, 3000, 3000] isEqualTo []}) ||
        {((_vehicle isKindOf "Plane") && {_playableUnits inAreaArray [_leaderPos, 5000, 5000] isEqualTo []})}}}
    });
    {
        {
            _patrolsToRemove pushBackUnique (vehicle _x);
        } forEach units _x;
    } forEach _patrolGroupsToRemove;
    _patrolsToRemove call CBA_fnc_deleteEntity;

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
