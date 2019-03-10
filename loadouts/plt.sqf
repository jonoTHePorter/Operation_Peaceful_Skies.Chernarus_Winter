// ["B_Soldier_SL_F", "example.sqf"]
params ["_unit", "_type"];

// Fake backpack to store magazines and then load them. This ensures that weapons are loaded
_unit addBackpack "ACE_FakeBackpack";
// Primary weapon
_unit addMagazine "rhs_mag_30Rnd_556x45_M855A1_Stanag";
_unit addMagazine "1Rnd_HE_Grenade_shell";
_unit addWeapon "rhs_weap_m16a4_carryhandle_M203";
// Handgun
_unit addMagazine "rhsusf_mag_17Rnd_9x19_JHP";
_unit addWeapon "rhsusf_weap_glock17g4";
removeBackpack _unit;

// Containers / clothes
_unit addHeadgear "H_Beret_blk";
_unit forceAddUniform "UK3CB_BAF_U_Smock_Arctic";
_unit addVest "V_PlateCarrier1_blk";
_unit addBackpack "UK3CB_BAF_B_Bergen_Arctic_SL_A";
clearAllItemsFromBackpack _unit;
{_unit linkItem _x} forEach ["ItemMap","ItemCompass","ItemWatch","ItemGPS"];

// Uniform items
_unit addItemToUniform "ACE_tourniquet";
{_unit addItemToUniform "ACE_epinephrine"} count [1,2];
{_unit addItemToUniform "ACE_morphine"} count [1,2,3,4,5];
{_unit addItemToUniform "ACE_fieldDressing"} count [1,2,3,4,5];
// Vest items
_unit addItemToVest "SmokeShell";
_unit addItemToVest "UGL_FlareRed_F";
_unit addItemToVest "UGL_FlareGreen_F";
{_unit addItemToVest "rhs_mag_m67"} count [1,2];
_unit addItemToVest "1Rnd_SmokeRed_Grenade_shell";
_unit addItemToVest "1Rnd_SmokeGreen_Grenade_shell";
{_unit addItemToVest "1Rnd_Smoke_Grenade_shell"} count [1,2];
{_unit addItemToVest "1Rnd_HE_Grenade_shell"} count [1,2,3,4];
{_unit addItemToVest "rhs_mag_30Rnd_556x45_M855_PMAG"} count [1,2,3,4,5,6,7,8];
// Backpack items
// Radios
_unit addItemToUniform "ACRE_PRC343";
_unit addItemToUniform "ACRE_PRC148";
_unit addItemToBackpack "ACRE_PRC117F";