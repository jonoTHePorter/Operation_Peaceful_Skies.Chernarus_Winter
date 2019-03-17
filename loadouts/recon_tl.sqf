// ["B_recon_TL_F", "example.sqf"]
params ["_unit", "_type"];

// Fake backpack to store magazines and then load them. This ensures that weapons are loaded
_unit addBackpack "ACE_FakeBackpack";
// Primary weapon
_unit addMagazine "rhs_mag_30Rnd_556x45_M855A1_Stanag";
_unit addWeapon "rhs_weap_hk416d10_LMT_grip3";
_unit addPrimaryWeaponItem "rhsusf_acc_nt4_black";
_unit addPrimaryWeaponItem "ACE_acc_pointer_green";
_unit addPrimaryWeaponItem "rhsusf_acc_ACOG_USMC_3d";
_unit addPrimaryWeaponItem "rhsusf_acc_rvg_blk";
// Handgun
_unit addMagazine "rhsusf_mag_17Rnd_9x19_JHP";
_unit addWeapon "rhsusf_weap_glock17g4";
_unit addHandgunItem "rhsusf_acc_omega9k";
// Binoc
_unit addWeapon "Binocular";
removeBackpack _unit;

// Containers / clothes
_unit addHeadgear "rhsusf_ach_helmet_headset_ess_ucp";
_unit forceAddUniform "rhs_uniform_acu_ucp";
_unit addVest "rhsusf_spcs_ucp_squadleader";
_unit addBackpack "rhsusf_assault_eagleaiii_ucp";
clearAllItemsFromBackpack _unit;
{_unit linkItem _x} forEach ["ItemMap","ItemCompass","ItemWatch","ItemGPS"];

// Uniform items
_unit addItemToUniform "ACE_tourniquet";
{_unit addItemToUniform "ACE_epinephrine"} count [1,2];
{_unit addItemToUniform "ACE_morphine"} count [1,2,3,4,5];
{_unit addItemToUniform "ACE_fieldDressing"} count [1,2,3,4,5];
// Vest items
_unit addItemToVest "rhs_mag_m67";
{_unit addItemToVest "SmokeShell"} count [1,2];
{_unit addItemToVest "rhsusf_mag_17Rnd_9x19_JHP"} count [1,2];
{_unit addItemToVest "rhs_mag_30Rnd_556x45_M855_PMAG"} count [1,2,3,4,5,6,7,8];
// Backpack items
// Radios
_unit addItemToUniform "ACRE_PRC343";
_unit addItemToBackpack "ACRE_PRC117F";