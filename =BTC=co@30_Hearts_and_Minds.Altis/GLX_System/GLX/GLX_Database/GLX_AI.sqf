// ////////////////////////////////////////////////////////////////////////////
// GLX - A.I. Settings
// ////////////////////////////////////////////////////////////////////////////
// A.I. Database
// Based on Operation Flashpoint Mod E.C.P. ( Enhanced Configuration Project )
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

if (isNil "GLX_AI") then
{
    GLX_AI =
    [
        // ==============================================================
        // G.L.X A.I. Reinforcement Request: ( Knowledge )
        // ==============================================================
        // Choose knowledge A.I. group(s) need to have about their enemy(s) to requesting reinforcement(s).
        // Note: If this value was set to 4 A.I. group(s) are not able to request reinforcement(s).
        // 0 - 4.00, default is > 1
            0.5,

        // ==============================================================
        // G.L.X A.I. Reinforcement Request Courage: ( Rating )
        // ==============================================================
        // Choose A.I. group(s) courage rating factor.
        // Note: The lower this value the faster A.I. group(s) will be rated overpowered and request reinforcement(s).
        // Example: By default A.I. group(s) with 4 A.I. unit(s) vs 1 enemy unit will not request reinforcement(s) but A.I. group(s) with 4 A.I. unit(s) vs 2 enemy unit(s) will request reinforcement(s).  
        // 0.01 - 1.00, default is 0.15
            0.01,

        // ==============================================================
        // G.L.X A.I. Reinforcement Request: ( Limit )
        // ==============================================================
        // Choose how many A.I. group(s) can be requested as reinforcement(s).
        // 0 - 30, default is 3
            30,

        // ==============================================================
        // G.L.X A.I. Reinforcement: ( Cancel )
        // ==============================================================
        // Choose time of how long A.I. group(s) should search for their enemy(s) after loosing all knowledge about their enemy(s).
        // 30 - 500, default is 170 seconds
            180
    ];

    if (isFilePatchingEnabled) then
    {
        if ("UserConfig\GLX\GLX_AI.sqf" call GLX_Exist_F) then
        {
            call compileFinal preprocessFileLineNumbers "UserConfig\GLX\GLX_AI.sqf";
        };
    };
};