// ["B_Soldier_F", "example.sqf"]
params ["_unit", "_type"];

// Fake backpack to store magazines and then load them. This ensures that weapons are loaded
_unit addBackpack "ACE_FakeBackpack";
// Primary weapon
_unit addMagazine "rhs_mag_30Rnd_556x45_M855A1_Stanag";
_unit addWeapon "rhs_weap_m16a4_carryhandle";
// Handgun
_unit addMagazine "rhsusf_mag_17Rnd_9x19_JHP";
_unit addWeapon "rhsusf_weap_glock17g4";
removeBackpack _unit;

// Containers / clothes
_unit addHeadgear "UK3CB_BAF_H_Mk7_Win_ESS_A";
_unit forceAddUniform "UK3CB_BAF_U_Smock_Arctic";
_unit addVest "V_PlateCarrier1_blk";
_unit addBackpack "UK3CB_BAF_B_Bergen_Arctic_Rifleman_B";
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
{_unit addItemToVest "rhs_mag_30Rnd_556x45_M855_PMAG"} count [1,2,3,4,5,6,7,8];
// Backpack items
{_unit addItemToBackpack "ACE_tourniquet"} count [1,2,3,4];
_unit addItemToBackpack "ACE_personalAidKit";
{_unit addItemToBackpack "ACE_salineIV"} count [1,2,3,4,5,6,7,8,9,10];
{_unit addItemToBackpack "ACE_morphine"} count [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40];
{_unit addItemToBackpack "ACE_epinephrine"} count [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40];
{_unit addItemToBackpack "ACE_fieldDressing"} count [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40];
// Radios
_unit addItemToUniform "ACRE_PRC343";