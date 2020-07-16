
/*
	Author: Genesis
	Description:
		Forces AI to move towards enemies, failing that move towards waypoint.

	Parameter(s):
		0: OBJECT - Group leader to get moving
		1 (Optional): NUMBER - Distance to move

	Returns:
		NOTHING
*/
params ["_SquadLead","_Medlist"];

//Before we move, we need to heal

[(group _SquadLead),_MedList] call VCM_fnc_MedicalHandler;


private _NearbyCover = [_SquadLead] call VCM_fnc_CoverDetect;
private _NEnemyA = [];
private _EnemyList = _SquadLead targets [true,1000];

private _NEnemies = _SquadLead call VCM_fnc_ClstKnwnEnmy;

if (count _NEnemies > 0) then
{

	{
		if (_x#0 < 100) then
		{
			_NEnemyA pushback (_x#1);
		};
	
	} foreach _NEnemies;
};	

private _LGroup = group _SquadLead;
if (_NearbyCover isEqualTo []) exitWith 
{
	{
		if (isNull objectParent _x) then
		{
			_x forcespeed -1;
			if (random 100 < 50) then
			{
				private _Unit = _x;
				private _EnemyArray = [];
				{
					private _cansee = [_Unit, "VIEW"] checkVisibility [eyePos _Unit, eyePos _x];
					_EnemyArray pushback [_cansee,_x];
				} foreach _EnemyList;
				_EnemyArray sort true;
				if (count _EnemyArray > 0) then
				{
					private _TargetE = ((_EnemyArray#0)#1);
					doStop _unit;
					_unit disableAI "FSM";
					_unit disableAI "TARGET";
					_unit disableAI "WEAPONAIM";
					_unit disableAI "AUTOTARGET";
					_unit disableAI "SUPPRESSION";
					_unit disableAI "CHECKVISIBLE";
					_unit disableAI "COVER";
					_Unit doWatch _TargetE;
					doStop _Unit;
					_Unit forceSpeed -1;				
					_Unit setDestination [(getpos _Unit), "FORMATION PLANNED", true];						
					_Unit doSuppressiveFire _TargetE;
				};
				if (vcm_Debug) then {[_Unit,"LOOKING TO FIRE"] call VCM_fnc_DebugText;};
			};
		};
	} foreach (units _LGroup);
};


private _CoverObjects = _NearbyCover#1;
private _WPos = _NearbyCover#2;

if ((count (waypoints _LGroup)) == 0) exitWith {};

if (count _CoverObjects > 0 && {!(_WPos isEqualTo [0,0,0])}) then
{

	
	private _CoverHardObjects = [];
	{
		if (_x isKindOf "House" || {_x isKindOf "Wall"}) then
		{
			_CoverHardObjects pushback _x;
		};
	} foreach _CoverObjects;	
	
	private _Pos = _WPos;
	private _MoveArray = [];

	

	{
		if (isNull objectParent _x) then
		{
			if (random 100 > 30) then
			{
				if (count _CoverHardObjects > 0) then
				{	_CoverObj = [_CoverHardObjects,_WPos] call BIS_fnc_nearestPosition;
					if (count _CoverHardObjects > 2) then
					{
						_CoverHardObjects deleteAt (_CoverHardObjects findif {_CoverObj isEqualTo _x});
					};
					_Pos =  _CoverObj getPos [2,(_CoverObj getdir _SquadLead)];
					_FinalPos = _Pos findEmptyPosition [0,10,"B_soldier_AT_F"];
					if (_FinalPos isEqualTo []) then {_FinalPos = _Pos;};
					
		
					private _nBuilding = nearestBuilding _FinalPos;
					if ([_nBuilding] call BIS_fnc_isBuildingEnterable && {_nBuilding distance2D _FinalPos < 25}) then
					{
						private _BuildingPos = ([_nBuilding] call BIS_fnc_buildingPositions);
						if (count _BuildingPos > 3) then
						{
							_FinalPos = selectRandom ([_nBuilding] call BIS_fnc_buildingPositions);
						};
					};			
					_MoveArray pushback [_x,_FinalPos];	
					[_x,_FinalPos] spawn
					{
						params ["_Unit","_Pos"];
						sleep (2 + (random 5));
						
						_Unit disableAI "FSM";
						_Unit disableAI "TARGET";
						_Unit disableAI "WEAPONAIM";
						_Unit disableAI "AUTOTARGET";
						_Unit disableAI "SUPPRESSION";
						_Unit disableAI "CHECKVISIBLE";
						_Unit disableAI "COVER";
						_Unit doWatch ObjNull;
						doStop _unit;
						_Unit forceSpeed -1;				
						_Unit setDestination [_Pos, "FORMATION PLANNED", true];
						
						If (VCM_Debug) then {[_unit,"MOVING TO POSITION - A"] call VCM_fnc_DebugText;};
					};
						if (VCM_Debug) then
						{
							private _CustomPos = [(_FinalPos#0),(_FinalPos#1),((_FinalPos#2)+10)];
							private _veh = createVehicle ["Sign_Arrow_Large_Green_F", _CustomPos, [], 0, "CAN_COLLIDE"];
							_veh spawn {sleep 30; deleteVehicle _this;};
			
						};	
		
				}
				else
				{
					_CoverObj = [_CoverObjects,_WPos] call BIS_fnc_nearestPosition;
					if (count _CoverObjects > 0) then
					{
						if (count _CoverObjects > 2) then
						{			
							_CoverObjects deleteAt (_CoverObjects findif {_CoverObj isEqualTo _x});
						};
						_Pos =  _CoverObj getPos [2,(_CoverObj getdir _SquadLead)];				
						_FinalPos = _Pos findEmptyPosition [0,10,"B_soldier_AT_F"];
						if (_FinalPos isEqualTo []) then {_FinalPos = _Pos;};				
						
		
						private _nBuilding = nearestBuilding _FinalPos;
						if ([_nBuilding] call BIS_fnc_isBuildingEnterable && {_nBuilding distance2D _FinalPos < 20}) then
						{
							private _BuildingPos = ([_nBuilding] call BIS_fnc_buildingPositions);
							if (count _BuildingPos > 3) then
							{
								_FinalPos = selectRandom ([_nBuilding] call BIS_fnc_buildingPositions);
							};
						};	
						_MoveArray pushback [_x,_FinalPos];
						[_x,_FinalPos] spawn
						{
							params ["_Unit","_Pos"];
							sleep (2 + (random 5));
							
							doStop _unit;_unit domove (getposATL _Unit);
							_unit forceSpeed -1;				
							_Unit disableAI "FSM";
							_Unit disableAI "TARGET";
							_Unit disableAI "WEAPONAIM";
							_Unit disableAI "AUTOTARGET";
							_Unit disableAI "SUPPRESSION";
							_Unit disableAI "CHECKVISIBLE";
							_Unit disableAI "COVER";
							_Unit doWatch ObjNull;
							_Unit setDestination [_Pos, "FORMATION PLANNED", true];
							
							If (VCM_Debug) then {[_Unit,"MOVING TO POSITION - B"] call VCM_fnc_DebugText;};
						};
			
		
						
						if (VCM_Debug) then
						{		
							private _CustomPos = [(_FinalPos#0),(_FinalPos#1),((_FinalPos#2)+10)];
							private _veh = createVehicle ["Sign_Arrow_Large_Green_F", _CustomPos, [], 0, "CAN_COLLIDE"];
							_veh spawn {sleep 30; deleteVehicle _this;};
		
						};
					}
					else
					{
						_MoveArray pushback [_x,_Pos];
						[_x,_Pos] spawn
						{
							params ["_Unit","_Pos"];
							sleep (2 + (random 5));
							
							_Unit setUnitPos "Middle";
							_Unit disableAI "FSM";
							_Unit disableAI "TARGET";
							_Unit disableAI "WEAPONAIM";
							_Unit disableAI "AUTOTARGET";
							_Unit disableAI "SUPPRESSION";
							_Unit disableAI "CHECKVISIBLE";
							_Unit disableAI "COVER";
							_Unit doWatch ObjNull;
							doStop _unit;
							_unit forceSpeed -1;
							_Unit setDestination [_Pos, "FORMATION PLANNED", true];
							If (VCM_Debug) then {[_unit,"MOVING TO POSITION - C"] call VCM_fnc_DebugText;};
						};			
						
					};
				};
			}
			else
			{
				private _Unit = _x;
				private _EnemyArray = [];
				{
					private _cansee = [_Unit, "VIEW"] checkVisibility [eyePos _Unit, eyePos _x];
					_EnemyArray pushback [_cansee,_x];
				} foreach _EnemyList;
				_EnemyArray sort true;
				if (count _EnemyArray > 0) then
				{
					private _TargetE = ((_EnemyArray#0)#1);
					_Unit enableAI "FSM";
					_Unit enableAI "TARGET";
					_Unit enableAI "WEAPONAIM";
					_Unit enableAI "AUTOTARGET";
					_Unit enableAI "SUPPRESSION";
					_Unit enableAI "CHECKVISIBLE";
					_Unit enableAI "COVER";
					_Unit doWatch _TargetE;
					doStop _unit;
					_Unit forceSpeed -1;				
					_Unit setDestination [_Pos, "FORMATION PLANNED", true];					
					_Unit doSuppressiveFire _TargetE;
				};
				if (vcm_Debug) then {[_Unit,"LOOKING TO FIRE"] call VCM_fnc_DebugText;};
			};
		};
	} foreach (units _LGroup);
	
	private _Cntr = 0;

	_MoveArray spawn
	{
		sleep 5;
		private _Timer = diag_ticktime + 20;
		{
			_x params ["_Unit","_Pos"];
			doStop _unit;
			_Unit setUnitPos "Middle";
			_Unit forcespeed -1;
			_Unit setDestination [_Pos, "FORMATION PLANNED", true];		
		} foreach _this;

		waituntil
		{

			{
				_x params ["_Unit","_Pos"];
				If (VCM_Debug) then {[_Unit,(format ["MOVING: %1 M",(_Unit distance2D _Pos)])] call VCM_fnc_DebugText;};
				//private _EnemyList = ((getPos _Unit) nearEntities ["Man", 100]) select {[(side _x),(side _Unit)] call BIS_fnc_sideIsEnemy};
				private _EnemyList = _Unit targets [true,1000];
				{
					private _cansee = [_Unit, "VIEW"] checkVisibility [eyePos _Unit, eyePos _x];
					if (_Cansee > 0 && (_x distance2D _Unit < 100)) exitWith
					{
						doStop _unit;
						_Unit enableAI "FSM";
						_Unit enableAI "TARGET";
						_Unit enableAI "WEAPONAIM";
						_Unit enableAI "AUTOTARGET";
						_Unit enableAI "SUPPRESSION";
						_Unit enableAI "CHECKVISIBLE";
						_Unit enableAI "COVER";
						_Unit doWatch _x;
						If (VCM_Debug) then {[_Unit,"STOP TO RETURN FIRE"] call VCM_fnc_DebugText;};
					};
				} foreach _EnemyList;
				if (speed _Unit < 0.1) then
				{
					doStop _unit;
					_Unit setUnitPos "AUTO";
					_Unit forcespeed -1;
					_Unit setDestination [_Pos, "FORMATION PLANNED", true];	
				};
			} foreach _this;
			sleep 5;
			diag_ticktime > _Timer
		};
	};

	waituntil
	{
		_LGroup setBehaviourStrong "AWARE";
		_LGroup setCombatMode "YELLOW";
		//_LGroup setBehaviour "AWARE";
		private _CurrentWaypoint = currentWaypoint _LGroup;
		private _wPos2 = waypointPosition [_LGroup,_CurrentWaypoint];	
		{
				_x params ["_Unit","_Pos"];
				
				if !(alive _Unit) then {_MoveArray deleteAt _foreachIndex;};
				
				if (_Unit distance2D _Pos < 2) then
				{
					_unit spawn
					{
						sleep 1;
						_this setUnitPos "Auto";
						doStop _this;
						_this forceSpeed 0;
						_this enableAI "FSM";
						_this enableAI "TARGET";
						_this enableAI "WEAPONAIM";
						_this enableAI "AUTOTARGET";
						_this enableAI "SUPPRESSION";
						_this enableAI "CHECKVISIBLE";
						_this enableAI "COVER";
						private _EnemyList = _this targets [true,1000];
						private _EnemyArray = [];
						{
							private _cansee = [_this, "VIEW"] checkVisibility [eyePos _this, eyePos _x];
							_EnemyArray pushback [_cansee,_x];
						} foreach _EnemyList;
						_EnemyArray sort true;
						if (count _EnemyArray > 0) then
						{		
							private _TargetE = ((_EnemyArray#0)#1);
							doStop _this;
							_this forceSpeed -1;				
							_this setDestination [(getpos _this), "FORMATION PLANNED", true];								
							_this doSuppressiveFire _TargetE;
						};
						if (vcm_Debug) then {[_this,"SET"] call VCM_fnc_DebugText;};
					};
					_MoveArray deleteAt _foreachIndex;
				};
		} foreach _MoveArray;
		sleep 0.01;
		_Cntr = _Cntr + 0.01;
		(count _MoveArray < 1 || _Cntr > 30 || !(_WPos isEqualTo _wPos2))
	};
	
	_LGroup setBehaviourStrong "COMBAT";
	_LGroup setCombatMode "YELLOW";
	//_LGroup setBehaviour "COMBAT";
	
}
else
{
	{
		if (isNull objectParent _x) then
		{
			if (Vcm_GrenadeChance > 100) then
			{
				[_x,false,true] spawn VCM_fnc_ForceGrenadeFire;
			};
			_x forceSpeed -1;
			_x setUnitPos "Auto";
			doStop _x;
			_x setDestination [_WPos, "FORMATION PLANNED", true];	
			If (VCM_Debug) then {[_x,"MOVING TO POSITION - D"] call VCM_fnc_DebugText;};
			if (random 100 < 50) then
			{
				private _Unit = _x;
				private _EnemyArray = [];
				{
					private _cansee = [_Unit, "VIEW"] checkVisibility [eyePos _Unit, eyePos _x];
					_EnemyArray pushback [_cansee,_x];
				} foreach _EnemyList;
				_EnemyArray sort true;
				if (count _EnemyArray > 0) then
				{
					private _TargetE = ((_EnemyArray#0)#1);
					doStop _unit;
					_Unit enableAI "FSM";
					_Unit enableAI "TARGET";
					_Unit enableAI "WEAPONAIM";
					_Unit enableAI "AUTOTARGET";
					_Unit enableAI "SUPPRESSION";
					_Unit enableAI "CHECKVISIBLE";
					_Unit enableAI "COVER";				
					_Unit doWatch _TargetE;
					doStop _Unit;
					_Unit forceSpeed -1;				
					_Unit setDestination [(getpos _Unit), "FORMATION PLANNED", true];						
					_Unit doSuppressiveFire _TargetE;
				};
				if (vcm_Debug) then {[_Unit,"LOOKING TO FIRE"] call VCM_fnc_DebugText;};
			};
		};
	} foreach (units _LGroup);
};

if (_WPos distance2D _SquadLead < 75) then
{
	_index = currentWaypoint (group _SquadLead);
	deleteWaypoint [_LGroup,_index];
};