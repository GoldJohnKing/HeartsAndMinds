// ////////////////////////////////////////////////////////////////////////////
// GLX - Radio Settings
// ////////////////////////////////////////////////////////////////////////////
// Radio Database
// Based on Operation Flashpoint Mod E.C.P. ( Enhanced Configuration Project )
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

if (isNil "GLX_Radio") then
{
    GLX_Radio =
    [
        // ==============================================================
        // G.L.X A.I. Radio: ( Time )
        // ==============================================================
        // Choose time A.I. group(s) should need to request reinforcement(s).
        // Note: This value will be recalculated with the skill of the requesting A.I. group leader.
        // 0 - 100, default is 30 seconds
            30,

        // ==============================================================
        // G.L.X A.I. Radio: ( Distance )
        // ==============================================================
        // Choose distance within specific A.I. group(s) are able to request reinforcement(s).
        // 0 - 10000, default is [1000, 3000, 5000, 7000] - [Man, Car, Tank, Air, Ship], Ship is not yet implemented.
            [2500, 3000, 8000, 7000]
    ];

    if (isFilePatchingEnabled) then
    {
        if ("UserConfig\GLX\GLX_Radio.sqf" call GLX_Exist_F) then
        {
            call compileFinal preprocessFileLineNumbers "UserConfig\GLX\GLX_Radio.sqf";
        };
    };
};