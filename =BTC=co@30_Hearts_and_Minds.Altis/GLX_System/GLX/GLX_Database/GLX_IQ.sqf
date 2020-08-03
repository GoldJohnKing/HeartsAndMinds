// ////////////////////////////////////////////////////////////////////////////
// GLX - I.Q. Settings
// ////////////////////////////////////////////////////////////////////////////
// I.Q. Database
// Based on Operation Flashpoint Mod E.C.P. ( Enhanced Configuration Project )
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

if (isNil "GLX_IQ") then
{
    GLX_IQ =
    [
        // ==============================================================
        // G.L.X A.I. I.Q. Knowledge: ( Duration )
        // ==============================================================
        // Choose value of how fast A.I. should loose knowledge about their enemy(s) after loosing line of sight.
        // Note: 0 = Very fast / 7 = Very slow
        // Description: If this value was set to 0 A.I. without line of sight to their enemy(s) will almost instantly loose all their enemy(s) knowledge and enemy(s) position accuracy.
        // 0 - 7, default is 3
            3
    ];

    if (isFilePatchingEnabled) then
    {
        if ("UserConfig\GLX\GLX_IQ.sqf" call GLX_Exist_F) then
        {
            call compileFinal preprocessFileLineNumbers "UserConfig\GLX\GLX_IQ.sqf";
        };
    };
};