/*
 *	You can change MissionDate to some specific date to override date set in mission editor:
 *		format:		[@Year, @Month, @Day, @Hours, @Minutes] (e.g. [2012, 12, 31, 12, 45])
 */
MissionDate = [
	date select 0
	, date select 1
	, date select 2
	, switch ("par_daytime" call BIS_fnc_getParamValue) do {
		case 0: { 10 + round(random 4) };
		case 1: { 20 + round(random 3) };
		case 2: { round(random 24) };
	}
	, selectRandom [0,10,15,20,25,30,40,45,50]
];
publicVariable "MissionDate";

/*
 * Date
 */
setDate MissionDate;

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



CaveEntrancePos = getPos CaveInfLogic;
[
	{
		private _tgts = allPlayers select { _x inArea CaveLocator };
	
		{ 
			private _u = _x;
			_u setUnitPos "MIDDLE"; 
			_u lookAt CaveEntrancePos;
			
			{ _u reveal [_x,4] } forEach _tgts;
		} forEach (synchronizedObjects CaveInfLogic);
	}
	, 5
] call CBA_fnc_addPerFrameHandler;
