// ["B_recon_F", "example.sqf"]
params ["_unit", "_type"];

// Fake backpack to store magazines and then load them. This ensures that weapons are loaded
_unit addBackpack "ACE_FakeBackpack";
// Primary weapon
_unit addMagazine "20Rnd_762x51_Mag";
_unit addWeapon "srifle_DMR_06_olive_F";
_unit addPrimaryWeaponItem "muzzle_snds_B";
_unit addPrimaryWeaponItem "rhsusf_acc_su230_mrds";
// Handgun
_unit addMagazine "rhsusf_mag_17Rnd_9x19_JHP";
_unit addWeapon "rhsusf_weap_glock17g4";
_unit addHandgunItem "rhsusf_acc_omega9k";
removeBackpack _unit;

// Containers / clothes
_unit addHeadgear "UK3CB_BAF_H_Mk7_Win_ESS_A";
_unit forceAddUniform "UK3CB_BAF_U_Smock_Arctic";
_unit addVest "UK3CB_BAF_V_Osprey_Winter";
_unit addBackpack "UK3CB_BAF_B_Bergen_Arctic_Rifleman_A";
clearAllItemsFromBackpack _unit;
{_unit linkItem _x} forEach ["ItemMap","ItemCompass","ItemWatch","ItemGPS"];

// Uniform items
_unit addItemToUniform "ACE_tourniquet";
{_unit addItemToUniform "ACE_epinephrine"} count [1,2];
{_unit addItemToUniform "ACE_morphine"} count [1,2,3,4,5];
{_unit addItemToUniform "ACE_fieldDressing"} count [1,2,3,4,5];
{_unit addItemToUniform "rhsusf_mag_17Rnd_9x19_JHP"} count [1,2];
// Vest items
_unit addItemToVest "SmokeShell";
{_unit addItemToVest "rhs_mag_m67"} count [1,2];
{_unit addItemToVest "20Rnd_762x51_Mag"} count [1,2,3,4,5,6,7,8];
// Backpack items
_unit addItemToBackpack "ACE_Clacker";
_unit addItemToBackpack "FPA_scissors";
_unit addItemToBackpack "ACE_wirecutter";
_unit addItemToBackpack "ACE_SpottingScope";
_unit addItemToBackpack "ACE_IR_Strobe_Item";
{_unit addItemToBackpack "DemoCharge_Remote_Mag"} count [1,2,3,4];
// Radios
_unit addItemToUniform "ACRE_PRC343";

