/*  ////////////////////////////////////////////////////////////////////////////////
\   \ GLX - A.I Improvement Project
 \   \------------------------------------------------------------------------------
  \   \ Location Function
   \   \----------------------------------------------------------------------------
   /   / By =\SNKMAN/=
  /   /-----------------------------------------------------------------------------
*/   ///////////////////////////////////////////////////////////////////////////////
params ["_group","_objects"];

_units = _objects select { (_x isKindOf "Man") };

if (True) then
{
	if (_units isEqualTo [] ) exitWith {};
	
	private _array = [];
	
	private "_unit";
	
	private _count = 0;
	
	for "_count" from _count to (count _units - 1) do
	{
		_unit = (_units select _count);
		
		_array pushBack (group _unit);
		
		// player sideChat format ["GLX_Location_F > %1 > %2", _group, _unit];
	};
	
	if (_array isEqualTo [] ) exitWith {};
	
	_array pushBack _group;
	
	(GLX_Location select 0) append _array;
	
	_group setVariable ["GLX_Location", _array];
};

True