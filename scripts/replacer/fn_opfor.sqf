params [["_man", nil]];
if (isNil "_man") exitWith {};

// (group _man) allowFleeing 0;
// _man setskill ["courage",1];
// _man disableAI "fsm";
// _man disableAI "COVER";
// _man disableAI "pathplan";


// private _pWeap = primaryWeapon _man;
// private _isMachineGun = getText(configFile >> "CfgWeapons" >> _pWeap >> "UIPicture") == "\a3\weapons_f\data\ui\icon_mg_ca.paa";

// private _sWeap = secondaryWeapon _man;

removeAllWeapons _man;
removeAllItems _man;
removeAllAssignedItems _man;
removeUniform _man;
removeVest _man;
removeBackpack _man;
removeHeadgear _man;
removeGoggles _man;

_man linkItem "ItemMap";
_man linkItem "ItemCompass";
_man linkItem "ItemWatch";
_man linkItem "ItemRadio";

private _faceWear = ["G_Aviator","G_Balaclava_blk","rhs_scarf","G_Bandanna_khk","G_Balaclava_TI_blk_F","G_Bandanna_beast","G_Bandanna_aviator"];

private _type = typeOf _man;

if (_type == "O_Soldier_LAT_F") exitWith {
    _man forceAddUniform "rhs_uniform_gorka_r_y";
	for "_i" from 1 to 6 do {_man addItemToUniform "ACE_fieldDressing";};
	for "_i" from 1 to 2 do {_man addItemToUniform "ACE_epinephrine";};
	for "_i" from 1 to 5 do {_man addItemToUniform "ACE_morphine";};
	_man addVest "V_PlateCarrier1_blk";
	for "_i" from 1 to 2 do {_man addItemToVest "HandGrenade";};
	for "_i" from 1 to 8 do {_man addItemToVest "rhsgref_30rnd_556x45_vhs2_t";};
	_man addBackpack "B_ViperHarness_blk_F";
	_man addHeadgear "H_HelmetSpecO_blk";
	_man addGoggles selectRandom _faceWear;

	_man addWeapon "rhs_weap_vhsd2_ct15x";
	_man addWeapon "rhs_weap_M136_hedp";
	_man addWeapon "Binocular";

	["lmf_ai_listener", [_man]] call CBA_fnc_localEvent;
};

if (_type == "O_crew_F") exitWith {
    _man forceAddUniform "rhs_uniform_gorka_r_y";
	_man addItemToUniform "FirstAidKit";
	_man addItemToUniform "rhs_1PN138";
	_man addItemToUniform "rhs_mag_rgn";
	_man addVest "V_PlateCarrier2_blk";
	for "_i" from 1 to 2 do {_man addItemToVest "rhs_mag_fakel";};
	for "_i" from 1 to 2 do {_man addItemToVest "rhs_mag_9x19_17";};
	for "_i" from 1 to 6 do {_man addItemToVest "30Rnd_45ACP_Mag_SMG_01_Tracer_Red";};
	_man addHeadgear "H_HelmetSpecO_blk";
	_man addGoggles selectRandom _faceWear;

	_man addWeapon "SMG_01_F";
	// _man addPrimaryWeaponItem "acc_flashlight_smg_01";
	// _man addPrimaryWeaponItem "rhsusf_acc_T1_high";
	_man addWeapon "rhs_weap_pya";

	["lmf_ai_listener", [_man]] call CBA_fnc_localEvent;
};

if (_type == "O_Soldier_GL_F") exitWith {
    _man forceAddUniform "rhs_uniform_gorka_r_y";
	for "_i" from 1 to 6 do {_man addItemToUniform "ACE_fieldDressing";};
	for "_i" from 1 to 2 do {_man addItemToUniform "ACE_epinephrine";};
	for "_i" from 1 to 5 do {_man addItemToUniform "ACE_morphine";};
	_man addVest "V_PlateCarrier1_blk";
	for "_i" from 1 to 2 do {_man addItemToVest "HandGrenade";};
	for "_i" from 1 to 8 do {_man addItemToVest "rhsgref_30rnd_556x45_vhs2_t";};
	for "_i" from 1 to 4 do {_man addItemToVest "1Rnd_HE_Grenade_shell";};
	_man addBackpack "B_ViperHarness_blk_F";
	for "_i" from 1 to 3 do {_man addItemToBackpack "1Rnd_HE_Grenade_shell";};
	for "_i" from 1 to 2 do {_man addItemToBackpack "rhsgref_30rnd_556x45_vhs2";};
	_man addHeadgear "H_HelmetSpecO_blk";
	_man addGoggles selectRandom _faceWear;

	_man addWeapon "rhs_weap_vhsd2_bg_ct15x";
	_man addWeapon "Binocular";

	["lmf_ai_listener", [_man]] call CBA_fnc_localEvent;
};

if (_type == "O_Soldier_AAR_F") exitWith {
    _man forceAddUniform "rhs_uniform_gorka_r_y";
	for "_i" from 1 to 6 do {_man addItemToUniform "ACE_fieldDressing";};
	for "_i" from 1 to 2 do {_man addItemToUniform "ACE_epinephrine";};
	for "_i" from 1 to 5 do {_man addItemToUniform "ACE_morphine";};
	_man addVest "V_PlateCarrier1_blk";
	for "_i" from 1 to 2 do {_man addItemToVest "HandGrenade";};
	for "_i" from 1 to 7 do {_man addItemToVest "rhsgref_30rnd_556x45_vhs2_t";};
	_man addBackpack "B_ViperHarness_blk_F";
	for "_i" from 1 to 4 do {_man addItemToBackpack "150Rnd_762x54_Box_Tracer";};
	_man addHeadgear "H_HelmetSpecO_blk";
	_man addGoggles selectRandom _faceWear;

	_man addWeapon "rhs_weap_vhsd2_ct15x";
	_man addWeapon "Binocular";

	["lmf_ai_listener", [_man]] call CBA_fnc_localEvent;
};

if (_type == "O_Soldier_AR_F") exitWith {
    _man forceAddUniform "rhs_uniform_gorka_r_y";
	for "_i" from 1 to 6 do {_man addItemToUniform "ACE_fieldDressing";};
	for "_i" from 1 to 2 do {_man addItemToUniform "ACE_epinephrine";};
	for "_i" from 1 to 5 do {_man addItemToUniform "ACE_morphine";};
	_man addVest "V_PlateCarrier1_blk";
	for "_i" from 1 to 2 do {_man addItemToVest "HandGrenade";};
	for "_i" from 1 to 2 do {_man addItemToVest "150Rnd_762x54_Box_Tracer";};
	_man addBackpack "B_ViperHarness_blk_F";
	_man addItemToBackpack "150Rnd_762x54_Box_Tracer";
	for "_i" from 1 to 2 do {_man addItemToBackpack "SmokeShell";};
	for "_i" from 1 to 2 do {_man addItemToBackpack "HandGrenade";};
	_man addHeadgear "H_HelmetSpecO_blk";
	_man addGoggles selectRandom _faceWear;

	_man addWeapon "LMG_Zafir_F";
	// _man addPrimaryWeaponItem "optic_Hamr";
	// _man addWeapon "Binocular";

	["lmf_ai_listener", [_man]] call CBA_fnc_localEvent;
};

if (_type == "O_soldier_M_F") exitWith {
    _man forceAddUniform "rhs_uniform_gorka_r_y";
	for "_i" from 1 to 6 do {_man addItemToUniform "ACE_fieldDressing";};
	for "_i" from 1 to 2 do {_man addItemToUniform "ACE_epinephrine";};
	for "_i" from 1 to 5 do {_man addItemToUniform "ACE_morphine";};
	_man addVest "V_PlateCarrier1_blk";
	for "_i" from 1 to 2 do {_man addItemToVest "HandGrenade";};
	for "_i" from 1 to 7 do {_man addItemToVest "20Rnd_650x39_Cased_Mag_F";};
	for "_i" from 1 to 4 do {_man addItemToVest "rhs_mag_9x19mm_7n31_44";};
	_man addBackpack "B_ViperLightHarness_blk_F";
	_man addHeadgear "H_HelmetSpecO_blk";
	_man addGoggles selectRandom _faceWear;

	_man addWeapon "srifle_DMR_07_blk_F";
	_man addPrimaryWeaponItem "optic_DMS";
	_man addWeapon "rhs_weap_pp2000_folded";
	// _man addHandgunItem "optic_Aco_smg";
	_man addWeapon "Binocular";

	["lmf_ai_listener", [_man]] call CBA_fnc_localEvent;
};

if (_type == "O_Pilot_F") exitWith {
    _man forceAddUniform "U_I_pilotCoveralls";
	_man addItemToUniform "FirstAidKit";
	_man addItemToUniform "rhs_mag_rdg2_white";
	_man addItemToUniform "rhs_mag_nspd";
	_man addVest "V_Chestrig_oli";
	for "_i" from 1 to 6 do {_man addItemToVest "50Rnd_570x28_SMG_03";};
	_man addHeadgear "H_PilotHelmetFighter_O";

	_man addWeapon "SMG_03C_black";

	["lmf_ai_listener", [_man]] call CBA_fnc_localEvent;
};

if (_type == "O_Soldier_TL_F" || _type == "O_Soldier_SL_F") exitWith {
    _man forceAddUniform "rhs_uniform_gorka_r_y";
	for "_i" from 1 to 6 do {_man addItemToUniform "ACE_fieldDressing";};
	for "_i" from 1 to 2 do {_man addItemToUniform "ACE_epinephrine";};
	for "_i" from 1 to 5 do {_man addItemToUniform "ACE_morphine";};
	_man addVest "V_PlateCarrier1_blk";
	for "_i" from 1 to 2 do {_man addItemToVest "HandGrenade";};
	for "_i" from 1 to 6 do {_man addItemToVest "rhsgref_30rnd_556x45_vhs2_t";};
	for "_i" from 1 to 4 do {_man addItemToVest "1Rnd_HE_Grenade_shell";};
	_man addBackpack "B_ViperHarness_blk_F";
	for "_i" from 1 to 8 do {_man addItemToBackpack "ACE_fieldDressing";};
	for "_i" from 1 to 3 do {_man addItemToBackpack "ACE_epinephrine";};
	for "_i" from 1 to 6 do {_man addItemToBackpack "ACE_morphine";};
	_man addHeadgear "H_HelmetSpecO_blk";
	_man addGoggles selectRandom _faceWear;

	_man addWeapon "rhs_weap_vhsd2_bg_ct15x";
	_man addWeapon "Binocular";

	["lmf_ai_listener", [_man]] call CBA_fnc_localEvent;
};

if (_type == "O_medic_F") exitWith {
    _man forceAddUniform "rhs_uniform_gorka_r_y";
	_man addItemToUniform "FirstAidKit";
	for "_i" from 1 to 6 do {_man addItemToUniform "ACE_fieldDressing";};
	for "_i" from 1 to 5 do {_man addItemToUniform "ACE_morphine";};
	for "_i" from 1 to 2 do {_man addItemToUniform "ACE_epinephrine";};
	_man addItemToUniform "rhs_mag_rgn";
	_man addVest "V_PlateCarrier1_blk";
	_man addItemToVest "rhs_mag_rgn";
	for "_i" from 1 to 7 do {_man addItemToVest "rhsgref_30rnd_556x45_vhs2_t";};
	for "_i" from 1 to 2 do {_man addItemToVest "HandGrenade";};
	_man addBackpack "B_ViperHarness_blk_F";
	for "_i" from 1 to 3 do {_man addItemToBackpack "rhsgref_30rnd_556x45_vhs2_t";};
	_man addHeadgear "H_HelmetSpecO_blk";
	_man addGoggles selectRandom _faceWear;

	_man addWeapon "rhs_weap_vhsd2_ct15x";
	// _man addWeapon "rhs_weap_M136";

	{_man addItemToBackpack "ACE_tourniquet"} count [1,2,3];
	{_man addItemToBackpack "ACE_plasmaIV"} count [1,2,3,4];
	{_man addItemToBackpack "ACE_epinephrine"} count [1,2,3,4,5,6,7,8,9,10];
	{_man addItemToBackpack "ACE_morphine"} count [1,2,3,4,5,6,7,8,9,10];
	{_man addItemToBackpack "ACE_fieldDressing"} count [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];

	["lmf_ai_listener", [_man]] call CBA_fnc_localEvent;
};

if (_type == "O_Soldier_AT_F") exitWith {
    _man forceAddUniform "rhs_uniform_gorka_r_y";
	_man addItemToUniform "FirstAidKit";
	_man addItemToUniform "rhs_1PN138";
	_man addItemToUniform "rhs_mag_rgn";
	_man addVest "V_PlateCarrier1_blk";
	for "_i" from 1 to 2 do {_man addItemToVest "rhs_mag_fakel";};
	for "_i" from 1 to 7 do {_man addItemToVest "rhsgref_30rnd_556x45_vhs2_t";};
	for "_i" from 1 to 2 do {_man addItemToVest "rhs_mag_9x19_17";};
	_man addBackpack "B_ViperHarness_blk_F";
	for "_i" from 1 to 2 do {_man addItemToBackpack "rhs_mag_rgn";};
	for "_i" from 1 to 2 do {_man addItemToBackpack "rhs_mag_fakel";};
	_man addItemToBackpack "rhs_mag_rdg2_white";
	for "_i" from 1 to 2 do {_man addItemToBackpack "rhsgref_30rnd_556x45_vhs2";};
	_man addHeadgear "H_HelmetSpecO_blk";
	_man addGoggles selectRandom _faceWear;

	_man addWeapon "rhs_weap_vhsd2";
	// _man addPrimaryWeaponItem "rhsusf_acc_nt4_black";
	// _man addPrimaryWeaponItem "rhs_acc_perst1ik_ris";
	// _man addPrimaryWeaponItem "optic_MRCO";
	_man addWeapon "launch_NLAW_F";
	_man addWeapon "rhs_weap_pya";

	["lmf_ai_listener", [_man]] call CBA_fnc_localEvent;
};

if (_type == "O_Sharpshooter_F") exitWith {
    _man forceAddUniform "rhs_uniform_gorka_r_y";
	_man addItemToUniform "FirstAidKit";
	_man addItemToUniform "rhs_1PN138";
	_man addItemToUniform "rhs_beret_mp1";
	_man addItemToUniform "rhs_mag_rdg2_white";
	_man addVest "V_PlateCarrier2_blk";
	for "_i" from 1 to 2 do {_man addItemToVest "rhs_mag_9x19_17";};
	_man addItemToVest "rhs_mag_rgn";
	for "_i" from 1 to 7 do {_man addItemToVest "10Rnd_127x54_Mag";};
	_man addBackpack "B_ViperHarness_blk_F";
	_man addHeadgear "H_HelmetSpecO_blk";
	_man addGoggles selectRandom _faceWear;

	_man addWeapon "srifle_DMR_04_F";
	// _man addPrimaryWeaponItem "rhs_acc_perst1ik_ris";
	_man addPrimaryWeaponItem "optic_Nightstalker";
	_man addPrimaryWeaponItem "rhs_acc_harris_swivel";
	_man addWeapon "rhs_weap_pya";

	["lmf_ai_listener", [_man]] call CBA_fnc_localEvent;
};

if (_type == "O_HeavyGunner_F") exitWith {
    _man forceAddUniform "rhs_uniform_gorka_r_y";
	for "_i" from 1 to 6 do {_man addItemToUniform "ACE_fieldDressing";};
	for "_i" from 1 to 2 do {_man addItemToUniform "ACE_epinephrine";};
	for "_i" from 1 to 5 do {_man addItemToUniform "ACE_morphine";};
	_man addVest "V_PlateCarrier1_blk";
	for "_i" from 1 to 2 do {_man addItemToVest "HandGrenade";};
	_man addBackpack "B_ViperHarness_blk_F";
	for "_i" from 1 to 2 do {_man addItemToBackpack "SmokeShell";};
	for "_i" from 1 to 2 do {_man addItemToBackpack "HandGrenade";};
	_man addItemToBackpack "130Rnd_338_Mag";
	_man addHeadgear "H_HelmetSpecO_blk";
	_man addGoggles selectRandom _faceWear;

	_man addWeapon "MMG_02_black_F";
	_man addPrimaryWeaponItem "bipod_01_F_blk";
	_man addWeapon "Binocular";

	["lmf_ai_listener", [_man]] call CBA_fnc_localEvent;
};

if (_type == "O_Soldier_AA_F") exitWith {
	_man forceAddUniform "rhs_uniform_gorka_r_y";
	_man addItemToUniform "FirstAidKit";
	_man addItemToUniform "rhs_1PN138";
	_man addItemToUniform "rhs_mag_rgn";
	_man addVest "V_PlateCarrier1_blk";
	for "_i" from 1 to 2 do {_man addItemToVest "rhs_mag_fakel";};
	for "_i" from 1 to 7 do {_man addItemToVest "rhsgref_30rnd_556x45_vhs2_t";};
	for "_i" from 1 to 2 do {_man addItemToVest "rhs_mag_9x19_17";};
	_man addBackpack "B_ViperHarness_blk_F";
	for "_i" from 1 to 2 do {_man addItemToBackpack "Titan_AA";};
	for "_i" from 1 to 2 do {_man addItemToBackpack "rhs_mag_rgn";};
	for "_i" from 1 to 2 do {_man addItemToBackpack "rhs_mag_fakel";};
	_man addItemToBackpack "rhs_mag_rdg2_white";
	for "_i" from 1 to 2 do {_man addItemToBackpack "rhsgref_30rnd_556x45_vhs2";};
	_man addHeadgear "H_HelmetSpecO_blk";
	_man addGoggles selectRandom _faceWear;

	_man addWeapon "rhs_weap_vhsd2";
	// _man addPrimaryWeaponItem "optic_MRCO";
	_man addWeapon "launch_B_Titan_F";
	_man addWeapon "rhs_weap_pya";

	["lmf_ai_listener", [_man]] call CBA_fnc_localEvent;
};

if (_type == "O_PILOT_F") exitWith {

};

_man forceAddUniform "rhs_uniform_gorka_r_y";
_man addItemToUniform "FirstAidKit";
for "_i" from 1 to 6 do {_man addItemToUniform "ACE_fieldDressing";};
for "_i" from 1 to 5 do {_man addItemToUniform "ACE_morphine";};
for "_i" from 1 to 2 do {_man addItemToUniform "ACE_epinephrine";};
_man addItemToUniform "rhs_mag_rgn";
_man addVest "V_PlateCarrier1_blk";
_man addItemToVest "rhs_mag_rgn";
for "_i" from 1 to 7 do {_man addItemToVest "rhsgref_30rnd_556x45_vhs2_t";};
for "_i" from 1 to 2 do {_man addItemToVest "HandGrenade";};
_man addBackpack "B_ViperLightHarness_blk_F";
for "_i" from 1 to 3 do {_man addItemToBackpack "rhsgref_30rnd_556x45_vhs2_t";};
_man addHeadgear "H_HelmetSpecO_blk";
_man addGoggles selectRandom _faceWear;

_man addWeapon "rhs_weap_vhsd2_ct15x";
// _man addWeapon "rhs_weap_M136";

["lmf_ai_listener", [_man]] call CBA_fnc_localEvent;
