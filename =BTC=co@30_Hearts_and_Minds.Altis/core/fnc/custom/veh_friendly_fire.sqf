// Edited: Add friendly fire logging of vehicles
// Author: Gold John King

params ["_unit", "_source", "_damage", "_instigator"];

if ((isPlayer _instigator) || (isPlayer _source)) then {
    [format ["Custom Server Log: Friendly vehicle %1 (%2, crews are %3) is hit by %4 (%5, crews are %6), triggered by %7, damage %8.", _unit, getText (configFile >> "cfgVehicles" >> typeOf _unit >> "displayName"), crew _unit, _source, getText (configFile >> "cfgVehicles" >> typeOf _source >> "displayName"), crew _source, _instigator, _damage]] remoteExecCall ["diag_log", 0, true];
};
