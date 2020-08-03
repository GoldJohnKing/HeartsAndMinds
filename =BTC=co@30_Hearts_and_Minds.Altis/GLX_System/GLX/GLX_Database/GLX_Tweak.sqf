// ////////////////////////////////////////////////////////////////////////////
// GLX - Tweak Settings
// ////////////////////////////////////////////////////////////////////////////
// Tweak Database
// Based on Operation Flashpoint Mod E.C.P. ( Enhanced Configuration Project )
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

if (isNil "GLX_Tweak") then
{
    GLX_Tweak =
    [
        // ==============================================================
        // G.L.X A.I. Movement Distance: ( Random )
        // ==============================================================
        // Choose A.I. movement distance random values.
        // Note: Empty array [] means fully randomized A.I. movement distance. 1 value array e.g. [5] means fixed A.I. movement distance.
        // Description: Low values ( 1, 3, 5 ) will make A.I. flank less. High values ( 7, 10, 13, 15 ) will make A.I. flank more.
        // Example: [3, 5, 7, 10] or [3, 13, 5, 15] or [1, 3, 5, 7, 10] or [10, 13, 15] or [3, 5, 7] or [7] or [15]
        // 0 - 30, default is [5, 10, 15, 10, 5] v.1.0.05 [] ( Fully randomized )
            [3, 5, 10, 5, 3],

        // ==============================================================
        // G.L.X A.I. Movement Type: ( Chance )
        // ==============================================================
        // Choose A.I. movement system type ( Tactical / Aggressive ) chance.
        // Note: Lower value will make A.I. move more aggressive ( straight ) to their target position.
        // Example: 100 = A.I. will try to use flank movement as much as possible. 0 = A.I. will try to move straight to their target position as much as possible.
        // 0 - 100, default is 75%
            15
    ];

    if (isFilePatchingEnabled) then
    {
        if ("UserConfig\GLX\GLX_Tweak.sqf" call GLX_Exist_F) then
        {
            call compileFinal preprocessFileLineNumbers "UserConfig\GLX\GLX_Tweak.sqf";
        };
    };
};