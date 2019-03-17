//XEH Function to handle certain supply crates, wether they be created through zeus, script or eden editor.

//EXIT IF NOT LOCAL TO CRATE
private _crate = _this;

//EXIT IF NOT LOCAL OR ISNULL
if (!local _crate || {isNull _crate}) exitWith {};

//EXIT CRATES THAT AREN'T AFFECTED
private _type = typeof _crate;
private _allCrates = ["Box_NATO_AmmoVeh_F", "CargoNet_01_box_F", "C_IDAP_supplyCrate_F"];
if (_allCrates findIf {_type == _x} == -1) exitWith {};

//DO THE STUFF /////////////////////////////////////////////////////////////////////////////////
//CLEAR CARGO
clearWeaponCargoGlobal _crate;
clearMagazineCargoGlobal _crate;
clearItemCargoGlobal _crate;
clearBackpackCargoGlobal _crate;

//APPLY CRATE SPECIFIC THINGS (Vehicle)
if (_type == "Box_NATO_AmmoVeh_F") exitWith {
	["misc_makeCarryable",[_crate]] call CBA_fnc_globalEvent;
	[_crate, 3000] call ace_rearm_fnc_setSupplyCount;
	[_crate, 12] call ace_cargo_fnc_setSize;
	[_crate, 24] call ace_cargo_fnc_setSpace;
	[_crate, 4, "ACE_Track", true] call ace_repair_fnc_addSpareParts;
	[_crate, 4, "ACE_Wheel", true] call ace_repair_fnc_addSpareParts;
	_crate addItemCargoGlobal ["ToolKit", 3];
	_crate setVariable ["ace_dragging_ignoreWeightDrag", true, true];
};
//APPLY CRATE SPECIFIC THINGS (OSEA)
if (_type == "CargoNet_01_box_F") exitWith {
	["misc_makeCarryable",[_crate]] call CBA_fnc_globalEvent;
	_crate addItemCargoGlobal ["rhs_mag_30Rnd_556x45_M855_PMAG", 25]; 
	_crate addItemCargoGlobal ["ACE_20Rnd_762x51_Mag_tracer_green", 15];
	_crate addItemCargoGlobal ["rhs_mag_100Rnd_556x45_M855_cmag", 15];
	_crate addItemCargoGlobal ["rhs_fgm148_magazine_AT", 5];
	_crate addItemCargoGlobal ["SmokeShell", 5];
	_crate addItemCargoGlobal ["rhs_mag_m67", 5];
	_crate setVariable ["ace_dragging_ignoreWeightDrag", true, true];
};

//APPLY CRATE SPECIFIC THINGS (Yuktobania)
if (_type == "C_IDAP_supplyCrate_F") exitWith {
	["misc_makeCarryable",[_crate]] call CBA_fnc_globalEvent;
	_crate addItemCargoGlobal ["rhs_30Rnd_762x39mm_polymer_89", 50]; 
	_crate addItemCargoGlobal ["rhs_10Rnd_762x54mmR_7N1", 25];
	_crate addItemCargoGlobal ["rhs_100Rnd_762x54mmR", 20];
	_crate addItemCargoGlobal ["rhs_fgm148_magazine_AT", 5];
	_crate addItemCargoGlobal ["SmokeShell", 10];
	_crate addItemCargoGlobal ["rhs_mag_rgd5", 10];
	_crate addWeaponCargoGlobal ["launch_NLAW_F", 5];
	_crate setVariable ["ace_dragging_ignoreWeightDrag", true, true];
};