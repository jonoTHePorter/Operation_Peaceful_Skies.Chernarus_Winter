// ["B_T_Soldier_F", "example.sqf"]
params ["_unit", "_type"];

// Fake backpack to store magazines and then load them. This ensures that weapons are loaded
_unit addBackpack "ACE_FakeBackpack";
// Primary weapon
_unit addMagazine "rhs_10Rnd_762x54mmR_7N1";
_unit addWeapon "rhs_weap_svdp_npz";
_unit addPrimaryWeaponItem "rhsusf_acc_ACOG_USMC";
// Handgun
_unit addMagazine "rhs_mag_9x19_17";
_unit addWeapon "rhs_weap_pya";
removeBackpack _unit;

// Containers / clothes
_unit addHeadgear "rhsgref_6b27m_ttsko_urban";
_unit forceAddUniform "rhsgref_uniform_ttsko_urban";
_unit addVest "V_PlateCarrier2_blk";
{_unit linkItem _x} forEach ["ItemMap","ItemCompass","ItemWatch","ItemGPS"];
// Uniform items
_unit addItemToUniform "ACE_tourniquet";
{_unit addItemToUniform "ACE_epinephrine"} count [1,2];
{_unit addItemToUniform "rhs_mag_9x19_17"} count [1,2];
{_unit addItemToUniform "ACE_morphine"} count [1,2,3,4,5];
{_unit addItemToUniform "ACE_fieldDressing"} count [1,2,3,4,5];
// Vest items
_unit addItemToVest "SmokeShell";
{_unit addItemToVest "rhs_mag_rgd5"} count [1,2];
{_unit addItemToVest "rhs_10Rnd_762x54mmR_7N1"} count [1,2,3,4,5,6,7,8,9,10,11,12];
// Radios
_unit addItemToUniform "ACRE_PRC343";