// ////////////////////////////////////////////////////////////////////////////
// GLX - Feature Settings
// ////////////////////////////////////////////////////////////////////////////
// Feature Database
// Based on Operation Flashpoint Mod E.C.P. ( Enhanced Configuration Project )
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

if (isNil "GLX_Feature") then
{
    GLX_Feature =
    [
        // ==============================================================
        // G.L.X A.I. Smoke Man: ( Chance )
        // ==============================================================
        // Choose chance of how A.I. without vehicle should be able to use smoke at daytime.
        // 0 - 100, default is 50%
            50,

        // ==============================================================
        // G.L.X A.I. Smoke Vehicle: ( Chance )
        // ==============================================================
        // Choose chance of how A.I. with vehicle should be able to use smoke at daytime.
        // 0 - 100, default is 75%
            75,

        // ==============================================================
        // G.L.X A.I. Flare: ( Chance )
        // ==============================================================
        // Choose chance of how A.I. should be able to use flares at nighttime.
        // 0 - 100, default is 50%
            50,
        
        // ==============================================================
        // G.L.X A.I. Take Cover: ( Chance )
        // ==============================================================
        // Choose chance of how A.I. should be able to search for cover.
        // 0 - 100, default is 35% (default is 50% actually)
            30,

        // --------------------------------------------------------------
        // G.L.X A.I. Take Cover: ( Distance )
        // --------------------------------------------------------------
        // Choose distance within A.I. should be able to search for cover.
        // 10 - 100, default is 15 meters
            15,

        // ==============================================================
        // G.L.X A.I. House Search: ( Chance )
        // ==============================================================
        // Choose chance of how A.I. should be able to do house search.
        // 0 - 100, default is 50%
            30,

        // ==============================================================
        // G.L.X A.I. Weapon Fire:
        // ==============================================================
        // Choose if A.I. should be able to react to weapon fire.
        // True / False, default is True
            True,

        // --------------------------------------------------------------
        // G.L.X A.I. Weapon Fire Type: ( Distance )
        // --------------------------------------------------------------
        // Choose distance within A.I. should be able to react to specific kind of weapon fire in meters.
        // [Suppressed, Grenade Launcher, Rocket Launcher, Default], default is [15, 50, 300, 700]
            [250, 500, 1000, 800]
    ];

    if (isFilePatchingEnabled) then
    {
        if ("UserConfig\GLX\GLX_Feature.sqf" call GLX_Exist_F) then
        {
            call compileFinal preprocessFileLineNumbers "UserConfig\GLX\GLX_Feature.sqf";
        };
    };
};