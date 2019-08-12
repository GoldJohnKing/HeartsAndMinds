// ////////////////////////////////////////////////////////////////////////////
// Tactical Combat Link
// ////////////////////////////////////////////////////////////////////////////
// Feature Database
// Based on Operation Flashpoint Mod E.C.P. ( Enhanced Configuration Project )
// By =\SNKMAN/=
// ////////////////////////////////////////////////////////////////////////////

if (TCL_Server) then
{
	if (isNil "TCL_Feature") then
	{
		TCL_Feature = [ // Edited: Modify default settings
		
			// 0 ( Watch )
			True,
			75,
			
			// 2 ( Garrison )
			True,
			
			// 3 - 6 ( Smoke )
			True,
			80,
			True,
			75,
			
			// 7 ( Flare )
			True,
			90,
			
			// 9 ( Artillery )
			True,
			80,
			
			// 11 ( House Search )
			True,
			75,
			
			// 13 ( Static Weapon )
			True,
			75,
			
			// 15 - 18 ( Take Cover )
			True,
			75,
			75,
			75,
			
			// 19 - 21 ( Flanking )
			True,
			80,
			75,
			
			// 22 - 26 ( Advancing )
			True,
			75,
			300,
			500,
			800,
			
			// 27 - 29 ( Suppressed )
			True,
			0.90,
			5,
			
			// 30 - 31 ( Heal )
			True,
			75,
			
			// 32 - 33 ( Rearm )
			True,
			50,
			
			// 34 - 35 ( Surrender )
			True,
			5
		];
		
		if (TCL_FilePatching) then
		{
			if ("UserConfig\TCL\TCL_Feature.sqf" call TCL_Exist_F) then
			{
				call compile preprocessFileLineNumbers "UserConfig\TCL\TCL_Feature.sqf";
			};
		};
	};
};