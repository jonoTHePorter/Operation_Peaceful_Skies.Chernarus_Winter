// ["B_recon_M_F", "example.sqf"]
params ["_unit", "_type"];

// Fake backpack to store magazines and then load them. This ensures that weapons are loaded
_unit addBackpack "ACE_FakeBackpack";
// Primary weapon
_unit addMagazine "20Rnd_762x51_Mag";
_unit addWeapon "srifle_DMR_06_olive_F";
_unit addPrimaryWeaponItem "muzzle_snds_B";
_unit addPrimaryWeaponItem "rhsusf_acc_su230_mrds_3d";
// Handgun
_unit addMagazine "rhsusf_mag_17Rnd_9x19_JHP";
_unit addWeapon "rhsusf_weap_glock17g4";
_unit addHandgunItem "rhsusf_acc_omega9k";
removeBackpack _unit;

// Containers / clothes
_unit addHeadgear "rhsusf_ach_helmet_headset_ess_ucp";
_unit forceAddUniform "rhs_uniform_acu_ucp";
_unit addVest "rhsusf_spcs_ucp_sniper";
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
_unit addItemToVest "ACE_RangeCard";
{_unit addItemToVest "SmokeShell"} count [1,2];
{_unit addItemToVest "rhsusf_mag_17Rnd_9x19_FMJ"} count [1,2];
{_unit addItemToVest "ACE_20Rnd_762x51_Mag_tracer_green"} count [1,2,3,4,5,6,7];
// Backpack items
_unit addItemToBackpack "ACE_Clacker";
_unit addItemToBackpack "FPA_scissors";
_unit addItemToBackpack "ACE_wirecutter";
_unit addItemToBackpack "ACE_SpottingScope";
_unit addItemToBackpack "ACE_IR_Strobe_Item";
{_unit addItemToBackpack "DemoCharge_Remote_Mag"} count [1,2,3,4];
// Radios
_unit addItemToUniform "ACRE_PRC343";

