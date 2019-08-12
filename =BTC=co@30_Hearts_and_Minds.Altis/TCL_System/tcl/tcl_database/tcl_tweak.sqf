// ////////////////////////////////////////////////////////////////////////////
// Tactical Combat Link
// ////////////////////////////////////////////////////////////////////////////
// Tweak Database
// Based on Operation Flashpoint Mod E.C.P. ( Enhanced Configuration Project )
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

if (TCL_Server) then
{
	if (isNil "TCL_Tweak") then
	{
		TCL_Tweak = [ // Edited: Modify default settings
			
			// 0 ( Behaviour )
			15,
			
			// 1 ( Push and Stop Distance )
			250,
			
			// 2 ( Push Chance )
			75,
			
			// 3 ( Push Factor )
			5
		];
		
		if (TCL_FilePatching) then
		{
			if ("UserConfig\TCL\TCL_Tweak.sqf" call TCL_Exist_F) then
			{
				call compile preprocessFileLineNumbers "UserConfig\TCL\TCL_Tweak.sqf";
			};
		};
	};
};