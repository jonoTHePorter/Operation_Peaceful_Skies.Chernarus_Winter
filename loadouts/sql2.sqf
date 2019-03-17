// ["B_RangeMaster_F", "example.sqf"]
params ["_unit", "_type"];

// Fake backpack to store magazines and then load them. This ensures that weapons are loaded
_unit addBackpack "ACE_FakeBackpack";
// Primary weapon
_unit addMagazine "rhs_30Rnd_762x39mm_polymer_tracer";
_unit addMagazine "rhs_VOG25";
_unit addWeapon "rhs_weap_ak103_gp25_npz";
_unit addPrimaryWeaponItem "rhs_acc_dtk";
_unit addPrimaryWeaponItem "rhs_acc_1p87";
// Handgun
_unit addMagazine "rhs_mag_9x19_17";
_unit addWeapon "rhs_weap_pya";
removeBackpack _unit;

// Containers / clothes
_unit addHeadgear "rhsgref_6b27m_ttsko_urban";
_unit forceAddUniform "rhsgref_uniform_ttsko_urban";
_unit addVest "V_PlateCarrier1_blk";
_unit addBackpack "B_FieldPack_blk";
clearAllItemsFromBackpack _unit;
{_unit linkItem _x} forEach ["ItemMap","ItemCompass","ItemWatch","ItemGPS"];
// Uniform items
_unit addItemToUniform "ACE_tourniquet";
{_unit addItemToUniform "ACE_epinephrine"} count [1,2];
{_unit addItemToUniform "rhs_mag_9x19_17"} count [1,2];
{_unit addItemToUniform "ACE_morphine"} count [1,2,3,4,5];
{_unit addItemToUniform "ACE_fieldDressing"} count [1,2,3,4,5];
// Vest items
_unit addItemToVest "SmokeShell";
{_unit addItemToVest "rhs_VOG25"} count [1,2];
{_unit addItemToVest "rhs_mag_rgd5"} count [1,2];
{_unit addItemToVest "rhs_30Rnd_762x39mm_polymer_tracer"} count [1,2,3,4,5,6,7,8];
// Backpack items
_unit addItemToBackpack "rhs_VOG25";
_unit addItemToBackpack "rhs_GRD40_Red";
{_unit addItemToBackpack "rhs_GRD40_White"} count [1,2];
// Radios
_unit addItemToUniform "ACRE_PRC343";
_unit addItemToBackpack "ACRE_PRC148";