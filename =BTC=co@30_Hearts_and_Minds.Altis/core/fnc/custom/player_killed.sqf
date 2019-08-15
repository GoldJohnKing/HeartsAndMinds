// Edited: Add player killed/respawned logging
// Author: Gold John King

params ["_unit", "_source", "_damage", "_instigator"];

if ((isPlayer _unit) && (isPlayer _source)) then {
    [format ["Custom Server Log: Player %1 (%2) is killed/respawned by %3 (%4), triggered by %5, damage %6.", _unit, getText (configFile >> "cfgVehicles" >> typeOf _unit >> "displayName"), _source, getText (configFile >> "cfgVehicles" >> typeOf _source >> "displayName"), _instigator, _damage]] remoteExecCall ["diag_log", 0, true];
};