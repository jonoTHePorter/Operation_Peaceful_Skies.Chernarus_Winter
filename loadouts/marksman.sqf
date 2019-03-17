// ["B_Soldier_F", "example.sqf"]
params ["_unit", "_type"];

// Fake backpack to store magazines and then load them. This ensures that weapons are loaded
_unit addBackpack "ACE_FakeBackpack";
// Primary weapon
_unit addMagazine "ACE_20Rnd_762x51_Mag_tracer_green";
_unit addWeapon "rhs_weap_m14ebrri";
_unit addPrimaryWeaponItem "rhsusf_acc_ACOG_USMC";
_unit addPrimaryWeaponItem "rhsusf_acc_harris_bipod";
// Handgun
_unit addMagazine "rhsusf_mag_17Rnd_9x19_JHP";
_unit addWeapon "rhsusf_weap_glock17g4";
removeBackpack _unit;

// Containers / clothes
_unit addHeadgear "UK3CB_BAF_H_Mk7_Win_ESS_A";
_unit forceAddUniform "UK3CB_BAF_U_Smock_Arctic";
_unit addVest "V_PlateCarrier1_blk";
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
{_unit addItemToVest "ACE_20Rnd_762x51_Mag_tracer_green"} count [1,2,3,4,5,6,7];
// Radios
_unit addItemToUniform "ACRE_PRC343";