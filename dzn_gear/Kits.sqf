// ***********************************
// Gear Kits 
// ***********************************
// ******** GEAR CLASSES **********
//
//	Maptools		"ACE_MapTools"	["ACE_MapTools",1]
//	Binocular		"Binocular"	["Binocular",1]		
//
// 	Map			"ItemMap"
//	Compass			"ItemCompass"
//	Watch			"ItemWatch"
//	Personal Radio		"ItemRadio"
//
// ******* KIT NAMES FORMAT ********
//  Kit names format:		kit_FACTION_ROLE
//	Platoon Leader / Командир Взвода	->	kit_ussf_pl
//	Squad Leader / Командир отделения	->	kit_ussf_sl
//	Section Leader				->	kit_ussf_sl
//	2IC					->	kit_ussf_2ic
//	Fireteam Leader				->	kit_ussf_ftl
//	Automatic Rifleman			->	kit_ussf_ar
//	Grenadier / Стрелок (ГП)		->	kit_ussf_gr
//	Rifleman / Стрелок			->	kit_ussf_r
//	Экипаж					->	kit_ussf_crew
//	Пулеметчик				->	kit_ussf_mg
//	Стрелок-Гранатометчик			->	kit_ussf_at
//	Стрелок, помощник гранатометчика	->	kit_ussf_aat
//	Старший стрелок				->	kit_ussf_ar / kit_ussf_ss
//	Снайпер					->	kit_ussf_mm
// ****************
//
// ******** USEFUL MACROSES *******
// Maros for Empty weapon
#define EMPTYKIT	[["","","","",""],["","","","",""],["","","","",""],["","","","",""],[],[["",0],["",0],["",0],["",0],["",0],["",0],["",0],["",0],["",0]],[["",0],["",0],["",0],["",0],["",0],["",0]],[]]
// Macros for Empty weapon
#define EMPTYWEAPON	"","",["","","",""]
// Macros for the list of items to be chosen randomly
#define RANDOM_ITEM	["H_HelmetB_grass","H_HelmetB"]
// Macros to give the item only if daytime is in given inerval (e.g. to give NVGoggles only at night)
#define NIGHT_ITEM(X)	if (daytime < 9 || daytime > 18) then { X } else { "" }

// ******** ASSIGNED and UNIFORM ITEMS MACRO ********
#define NVG_NIGHT_ITEM		if (daytime < 9 || daytime > 18) then { "NVGoggles_OPFOR" } else { "" }
#define BINOCULAR_ITEM		"Binocular"

#define ASSIGNED_ITEMS		"ItemMap","ItemCompass","ItemWatch","ItemRadio", NVG_NIGHT_ITEM
#define ASSIGNED_ITEMS_L	"ItemMap","ItemCompass","ItemWatch","ItemRadio", NVG_NIGHT_ITEM, BINOCULAR_ITEM

#define UNIFORM_ITEMS		["ACE_fieldDressing",5],["ACE_packingBandage",5],["ACE_elasticBandage",5],["ACE_tourniquet",2],["ACE_morphine",2],["ACE_epinephrine",2],["ACE_quikclot",5],["ACE_CableTie",2],["ACE_Flashlight_XL50",1],["ACE_EarPlugs",1]
#define UNIFORM_ITEMS_L		["ACE_fieldDressing",5],["ACE_packingBandage",5],["ACE_elasticBandage",5],["ACE_tourniquet",2],["ACE_morphine",2],["ACE_epinephrine",2],["ACE_quikclot",5],["ACE_CableTie",2],["ACE_Flashlight_XL50",1],["ACE_EarPlugs",1],["ACE_MapTools",1]
// ****************

#define ACR_U ["CUP_U_B_CZ_DST_Kneepads_Gloves","CUP_U_B_CZ_DST_Kneepads","CUP_U_B_CZ_DST_NoKneepads","CUP_U_B_CZ_DST_Kneepads_Sleeve"]
#define ACR_H ["CUP_H_OpsCore_Grey","CUP_H_OpsCore_Black","CUP_H_OpsCore_Tan","CUP_H_OpsCore_Grey_SF"]
#define ACR_G ["CUP_G_Scarf_Face_Tan","CUP_PMC_Facewrap_Black","G_Bandanna_khk","CUP_G_Scarf_Face_Grn"]
#define ACR_V ["CUP_V_CZ_NPP2006_ok_des","CUP_V_CZ_NPP2006_co_des","CUP_V_CZ_NPP2006_ok_black","CUP_V_CZ_NPP2006_nk_des"]
#define ACR_B ["B_AssaultPack_cbr","B_AssaultPack_khk"]
#define ACR_EQUIP	["<EQUIPEMENT >>  ",ACR_U,ACR_V,ACR_B,ACR_H,ACR_G]
/*
kit_acrsf_default = [
	["<EQUIPEMENT >>  ",ACR_U,ACR_V,ACR_B,ACR_H,ACR_G],
	["<PRIMARY WEAPON >>  ","","",["","","",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ", ASSIGNED_ITEMS_L],
	["<UNIFORM ITEMS >> ",[UNIFORM_ITEMS_L]],
	["<VEST ITEMS >> ",[]],
	["<BACKPACK ITEMS >> ",[]]
];
*/


kit_acrsf_sl = [
	ACR_EQUIP,
	["<PRIMARY WEAPON >>  ","CUP_arifle_Sa58RIS2_camo","CUP_30Rnd_Sa58_M",["CUP_muzzle_snds_KZRZP_AK762_desert","CUP_acc_ANPEQ_15_Top_Flashlight_Tan_L","rhsusf_acc_RX01_NoFilter_tan",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","CUP_hgun_Phantom","CUP_18Rnd_9x19_Phantom",["muzzle_snds_L","CUP_acc_CZ_M3X","",""]],
	["<ASSIGNED ITEMS >>  ", ASSIGNED_ITEMS_L],
	["<UNIFORM ITEMS >> ",[UNIFORM_ITEMS_L]],
	["<VEST ITEMS >> ",[["PRIMARY MAG",8],["rhs_mag_m67",2],["HANDGUN MAG",2]]],
	["<BACKPACK ITEMS >> ",[["ACE_Chemlight_HiBlue",2],["ACE_Chemlight_HiRed",2],["ACE_HandFlare_Yellow",1],["ACE_HandFlare_Red",1],["B_IR_Grenade",2],["PRIMARY MAG",2]]]
];

kit_acrsf_ftl = [
	ACR_EQUIP,
	["<PRIMARY WEAPON >>  ","CUP_arifle_Sa58RIS2_camo","CUP_30Rnd_Sa58_M",["CUP_muzzle_snds_KZRZP_AK762_desert","CUP_acc_ANPEQ_15_Top_Flashlight_Tan_L","rhsusf_acc_RX01_NoFilter_tan",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","rhs_weap_M320","rhs_mag_M441_HE",["","","",""]],
	["<ASSIGNED ITEMS >>  ", ASSIGNED_ITEMS],
	["<UNIFORM ITEMS >> ",[UNIFORM_ITEMS]],
	["<VEST ITEMS >> ",[["rhs_mag_M433_HEDP",6],["CUP_30Rnd_Sa58_M_TracerG",6],["rhs_mag_m67",2],["ACE_Chemlight_HiBlue",2],["ACE_Chemlight_HiRed",2]]],
	["<BACKPACK ITEMS >> ",[["rhs_mag_M433_HEDP",6],["PRIMARY MAG",3]]]
];

kit_acrsf_br = [
	ACR_EQUIP,
	["<PRIMARY WEAPON >>  ","CUP_sgun_M1014_Entry_vfg","CUP_6Rnd_B_Beneli_74Pellets",["","rhsusf_acc_wmx_bk","CUP_optic_MicroT1_low",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","CUP_hgun_SA61","CUP_50Rnd_B_765x17_Ball_M",["CUP_muzzle_snds_SA61","","",""]],
	["<ASSIGNED ITEMS >>  ", ASSIGNED_ITEMS],
	["<UNIFORM ITEMS >> ",[UNIFORM_ITEMS]],
	["<VEST ITEMS >> ",[["HANDGUN MAG",2],["PRIMARY MAG",10],["CUP_6Rnd_B_Benelli_74Slug",10],["ACE_Chemlight_HiRed",2],["ACE_Chemlight_HiGreen",2],["rhs_mag_m67",1]]],
	["<BACKPACK ITEMS >> ",[["ACE_M14",2],["rhs_mag_m67",1],["ACE_M84",4],["PRIMARY MAG",10],["CUP_6Rnd_B_Benelli_74Slug",10]]]
];

kit_acrsf_demo = [
	ACR_EQUIP,
	["<PRIMARY WEAPON >>  ","CUP_arifle_Sa58P_frontris_desert","CUP_30Rnd_Sa58_M",["CUP_muzzle_snds_KZRZP_AK762_desert","rhsusf_acc_wmx","rhsusf_acc_eotech_552_d",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ", ASSIGNED_ITEMS],
	["<UNIFORM ITEMS >> ",[UNIFORM_ITEMS]],
	["<VEST ITEMS >> ",[["ACE_Clacker",1],["ACE_DefusalKit",1],["PRIMARY MAG",8],["ACE_Chemlight_HiRed",2],["ACE_Chemlight_HiGreen",2],["rhs_mag_m67",2]]],
	["<BACKPACK ITEMS >> ",[["SatchelCharge_Remote_Mag",1],["DemoCharge_Remote_Mag",4]]]
];

kit_acrsf_r = [
	["<EQUIPEMENT >>  ","CUP_U_B_CZ_DST_Kneepads_Sleeve","CUP_V_CZ_NPP2006_nk_des","B_AssaultPack_cbr","CUP_H_OpsCore_Grey_SF","CUP_G_Scarf_Face_Grn"],
	["<PRIMARY WEAPON >>  ","CUP_arifle_Sa58RIS1_des","CUP_30Rnd_Sa58_M",["CUP_muzzle_snds_KZRZP_AK762_desert","rhsusf_acc_wmx","CUP_optic_MicroT1_low_coyote",""]],
	["<LAUNCHER WEAPON >>  ","rhs_weap_m72a7","rhs_m72a7_mag",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ", ASSIGNED_ITEMS],
	["<UNIFORM ITEMS >> ",[UNIFORM_ITEMS]],
	["<VEST ITEMS >> ",[["ACE_Clacker",1],["ACE_DefusalKit",1],["ACE_Chemlight_HiRed",2],["ACE_Chemlight_HiGreen",2],["rhs_mag_m67",2],["PRIMARY MAG",7]]],
	["<BACKPACK ITEMS >> ",[["PRIMARY MAG",3],["ACE_M84",2],["rhs_mag_m67",4]]]
];

