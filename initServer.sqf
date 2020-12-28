/*
 *	You can change MissionDate to some specific date to override date set in mission editor:
 *		a) array in format [YYYY,MM,DD,HH,mm] (e.g. [2012, 12, 31, 12, 45])
 *		b) date (to use editor set date)
 */
private _date = [
	date
	, "par_daytime" call BIS_fnc_getParamValue
	/* Расширеные опции: ["day","night","morning","midday","evening","midnight","random"] */
	, ["day","night","random"] 
] call dzn_fnc_randomizeTime;

/*
 *	Date
 */
setDate _date;
MissionDate = date;
publicVariable "MissionDate";

/*
 *	Weather
 */
if (!isNil "dzn_fnc_setWeather") then {
	("par_weather" call BIS_fnc_getParamValue) spawn dzn_fnc_setWeather;
};


/*
 *	Collect Some Player connection data
 */
PlayerConnectedData = [];
PlayerConnectedEH = addMissionEventHandler ["PlayerConnected", {
	diag_log "Client connected";
	diag_log _this;
	// [ DirectPlayID, getPlayerUID player, name player, @bool, clientOwner ]
	PlayerConnectedData pushBack _this;
	publicVariable "PlayerConnectedData";
}];

/*
 *	Mission custom server code goes here:
 */

// -- Apply skill settings to units

if ("par_dynai_overrideSkill" call BIS_fnc_getParamValue > 0) then {
	[{ time > 10 && !isNil "dzn_dynai_complexSkill" }, {
		((allUnits) select { side _x == east }) apply {

			private _u = _x;
			dzn_dynai_complexSkill params ["_isComplex", "_skillsParams"];

			if (_isComplex) then {
				{ _u setSkill _x } forEach _skillsParams;
			} else {
				_u setSkill _skillsParams;
			};
		};
	}] call CBA_fnc_waitUntilAndExecute;
};

// -- Cave supression script 

["ace_flashbangExploded", {_this call fnc_handleFlashbang}] call CBA_fnc_addEventHandler;

CaveEntrancePos = getPos CaveInfLogic;
MGunners = [MGunner1, MGunner2];
[
	{
		private _entranceCaveTgts = allPlayers select { _x inArea CaveLocator };
		private _innerCaveTgts = allPlayers select { _x inArea InnerCaveLocator };

		private _units = (synchronizedObjects CaveInfLogic) select { alive _x };
		if (
			_units isEqualTo [] 
			&& MGunners findIf { alive _x && !(_x getVariable ["Supressing", false]) } == -1
		) exitWith {
			[_this # 1] call CBA_fnc_removePerFrameHandler;
			ReinfCalled = true;
			publicVariable "ReinfCalled";
		};
	
		{ 
			private _u = _x;
			if (_entranceCaveTgts isEqualTo []) then {
				_u setUnitPos "MIDDLE"; 
				_u lookAt CaveEntrancePos;
			} else {
				// If there are units in cave entrance zone - spot them and assign targets
				// remove units from pre-aim cycle
				{ _u reveal [_x,4] } forEach _entranceCaveTgts;
				private _tgt = _u findNearestEnemy (_entranceCaveTgts # 0);
				_u doTarget _tgt;
				_u synchronizeObjectsRemove [CaveInfLogic];
			};
		} forEach _units;

		[MGunner1, _entranceCaveTgts] call fnc_handleMGunnerBehavior;
		[MGunner2, _innerCaveTgts] call fnc_handleMGunnerBehavior;
	}
	, 5
] call CBA_fnc_addPerFrameHandler;

fnc_handleMGunnerBehavior = {
	params ["_u", "_tgts"];
	if (!alive _u || _u getVariable ["Supressing", false]) exitWith {};

	private _tgt = (synchronizedObjects _u) # 0;
	if (_tgts isEqualTo []) then {
		_u lookAt _tgt;
	} else {
		_u setVariable ["Supressing", true];

		if (_u == MGunner2) then {
			_u setUnitPos "UP";
			doStop _u;
		};

		[_u, _tgt] call fnc_suppressEntrance;
	};
};

fnc_suppressEntrance = {
	params ["_u","_tgt"];

	if (!alive _u || !(_u getVariable ["isAbleToSuppress", true])) exitWith {};

	private _pw = primaryWeapon _u;
	_u setAmmo [_pw, 50 max ceil((_u ammo _pw)* 1.75)];

	_u reveal _tgt;	
	_u doSuppressiveFire _tgt;

	[{
		params ["_u", "_tgt"];
		[_u, _tgt] call fnc_suppressEntrance;
	}, [_u, _tgt] , random [4, 6, 10]] call CBA_fnc_waitAndExecute;
};

fnc_handleFlashbang = {
	params ["_grenadePosASL"];

	{
		if (alive _x && { _x getVariable ["Supressing", false] && _x distance2d _grenadePosASL < 25 }) then {
		
			_x doSuppressiveFire objNull;
			_x setVariable ["isAbleToSuppress", false];

			[{
				params ["_u"];
				_u setVariable ["isAbleToSuppress", true];
				[_u, (synchronizedObjects _u) # 0] call fnc_suppressEntrance;
			}, [_x, _handle], 4] call CBA_fnc_waitAndExecute;

		};
	} forEach MGunners;
};