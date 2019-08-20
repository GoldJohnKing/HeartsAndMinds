// Edited: Add friendly fire logging of vehicles
// Author: Gold John King

params ["_unit", "_killer", "_instigator", "_useEffects"];

    [format ["Custom Server Log: Friendly vehicle %1 (%2, crews are %3) is killed by %4 (%5, crews are %6), triggered by %7, using %8.", _unit, getText (configFile >> "cfgVehicles" >> typeOf _unit >> "displayName"), crew _unit, _killer, getText (configFile >> "cfgVehicles" >> typeOf _killer >> "displayName"), crew _killer, _instigator, _useEffects]] remoteExecCall ["diag_log", 0, true];
