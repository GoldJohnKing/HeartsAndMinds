// Edited: Add friendly fire logging of infantries
// Author: Gold John King

params ["_unit", "_source", "_damage", "_instigator"];

if ((isPlayer _unit) && (isPlayer _source)) then {
    [format ["SGLA Log: Friendly infantry %1 (%2) is hit by %3 (%4), triggered by %5, damage %6.", _unit, getText (configFile >> "cfgVehicles" >> typeOf _unit >> "displayName"), _source, getText (configFile >> "cfgVehicles" >> typeOf _source >> "displayName"), _instigator, _damage]] remoteExecCall ["diag_log", 0, true];
};
