
/* *********** This array defines detailed properties of zones ************************** */
// MAIN BASE

[
    "base", /* Zone Name */
    "EAST",true, /* Side, is Active */ [],[],
    /* Groups: */
    [],
    /* Behavior: Speed, Behavior, Combat mode, Formation */
    ["LIMITED","SAFE","YELLOW","WEDGE"]
]
,[
	"Reinf" /* Zone Name */
	,"EAST",false, /* Side, is Active */ [],[]
	/* Groups: */
	,[
		[
			1, /* Groups quantity */
			/* Units */
			[
				["CUP_C_Lada_TK2_CIV", "Vehicle Advance", ""]
                ,["CUP_O_TK_INS_Soldier", [0,"Cargo"], ""]
				,["CUP_O_TK_INS_Soldier", [0,"Driver"], ""]
				,["CUP_O_TK_INS_Soldier_MG", [0,"Cargo"], ""]
				,["CUP_O_TK_INS_Soldier_Enfield", [0,"Cargo"], ""]
			]
		], 
        [
			1, /* Groups quantity */
			/* Units */
			[
                ["CUP_C_UAZ_Unarmed_TK_CIV", "Vehicle Advance", ""]
				,["CUP_O_TK_INS_Soldier_Enfield", [0,"Driver"], ""]
				,["CUP_O_TK_INS_Soldier", [0,"Cargo"], ""]
				,["CUP_O_TK_INS_Soldier", [0,"Cargo"], ""]
				,["CUP_O_TK_INS_Soldier", [0,"Cargo"], ""]
			]
		]
	]
	/* Behavior: Speed, Behavior, Combat mode, Formation */
	,["FULL","AWARE","RED","WEDGE"]
	 /* (OPTIONAL) Activation condition */
	,{ !isNil "ReinfCalled" }
]