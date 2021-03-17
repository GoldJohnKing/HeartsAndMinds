
[compileScript ["core\init.sqf"]] call CBA_fnc_directCall;

[] spawn VCM_fnc_VcomInit; // Edited: Add VCOM Support

[] execVM "RYD_FFE\FFE.sqf"; // Edited: Add RYD_FFE Support