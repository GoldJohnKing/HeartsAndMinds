if (hasInterface) then {startLoadingScreen [""];};
enableSaving [false, false];

[] call compile preprocessFileLineNumbers "core\def\mission.sqf";
[] call compile preprocessFileLineNumbers "define_mod.sqf";

if (isServer) then {
    [] call compile preprocessFileLineNumbers "core\init_server.sqf";
};

[] call compile preprocessFileLineNumbers "core\init_common.sqf";

if (!isDedicated && hasInterface) then {
    [] call compile preprocessFileLineNumbers "core\init_player.sqf";
};

if (!isDedicated && !hasInterface) then {
    [] call compile preprocessFileLineNumbers "core\init_headless.sqf";
};

[] spawn VCM_fnc_VcomInit; // Edited: Add VCOM Support

nul = [] execVM "RYD_FFE\FFE.sqf"; // Edited: Add RYD_FFE Support