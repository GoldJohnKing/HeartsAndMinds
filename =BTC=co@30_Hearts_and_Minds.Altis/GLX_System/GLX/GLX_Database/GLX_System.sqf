// ////////////////////////////////////////////////////////////////////////////
// GLX - System Settings
// ////////////////////////////////////////////////////////////////////////////
// System Database
// Based on Operation Flashpoint Mod E.C.P. ( Enhanced Configuration Project )
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

if (isNil "GLX_System") then
{
    GLX_System =
    [
        // ------------------------------------------------------------
        // G.L.X Initialize: ( System )
        // ------------------------------------------------------------
        // Choose if GLX should be initialized.
        // True / False, default is True
            True,
        
        // ------------------------------------------------------------
        // G.L.X A.I. Side(s): ( Initialize )
        // ------------------------------------------------------------
        // Choose side(s) which should be initialized.
        // [EAST, WEST, RESISTANCE, CIVILIAN], default is [EAST, WEST, RESISTANCE]
            [EAST, RESISTANCE]
    ];

    if (isFilePatchingEnabled) then
    {
        if ("UserConfig\GLX\GLX_System.sqf" call GLX_Exist_F) then
        {
            call compileFinal preprocessFileLineNumbers "UserConfig\GLX\GLX_System.sqf";
        };
    };
};