
//Adds ACE actions to the players to use the supply spawn terminal
lmf_spawnerCreateObject = {
	params ["_vehType"];

	if (count (ammoPad nearEntities [["Man", "Air", "Land", "Ship"], 5]) > 0) exitWith {
		titleText ["<t font='PuristaBold' shadow='2' color='#FFBA26' size='2'>WARNING!</t><br/><t font='PuristaBold' shadow='2' color='#FFFFFF' size='1.5'>Spawn pad occupied!</t>", "PLAIN", 0.3, false, true];
	};

	if (rank ace_player == "PRIVATE" || {rank ace_player == "CORPORAL"}) exitWith {
		titleText ["<t font='PuristaBold' shadow='2' color='#FFBA26' size='2'>WARNING!</t><br/><t font='PuristaBold' shadow='2' color='#FFFFFF' size='1.5'>Only for NCOs and Officers!</t>", "PLAIN", 0.3, false, true];
	};

	private _vehicle = _vehType createVehicle getPosATL ammoPad;
	_vehicle setDir (getDir ammoPad);

	//private _vehDelete = ["vehDelete","Remove from Pad","\a3\ui_f_curator\data\cfgmarkers\kia_ca.paa",{deleteVehicle _target},{_target distance2D ammoPad < 10}] call ace_interact_menu_fnc_createAction;
	//[_vehicle,0,["ACE_MainActions"],_vehDelete] remoteExec ["ace_interact_menu_fnc_addActionToObject", 0, _vehicle];
};


// AMMOSPAWNER ////////////////////////////////////////////////////////////////////////////////////
if !(isNil "ammoSpawner") then {
	ammoSpawner setObjectTexture [0, "images\supplies.jpg"];
	private _ammoType1 = ["ammoType1","Vehicle Supplies","\A3\ui_f\data\map\vehicleicons\iconCrateAmmo_ca.paa",{["Box_NATO_AmmoVeh_F"] call lmf_spawnerCreateObject;},{true}] call ace_interact_menu_fnc_createAction;
	// private _ammoType2 = ["ammoType2","Osea Supplies","\A3\ui_f\data\map\vehicleicons\iconCrateAmmo_ca.paa",{["CargoNet_01_box_F"] call lmf_spawnerCreateObject;},{true}] call ace_interact_menu_fnc_createAction;
	private _ammoType3 = ["ammoType3","Yuktobania Supplies","\A3\ui_f\data\map\vehicleicons\iconCrateAmmo_ca.paa",{["C_IDAP_supplyCrate_F"] call lmf_spawnerCreateObject;},{true}] call ace_interact_menu_fnc_createAction;
	private _ammoMedic = ["ammoMedic","Medical Supplies","\A3\ui_f\data\map\vehicleicons\pictureHeal_ca.paa",{["ACE_medicalSupplyCrate_advanced"] call lmf_spawnerCreateObject;},{true}] call ace_interact_menu_fnc_createAction;

	[ammoSpawner, 0, ["ACE_MainActions"], _ammoType1] call ace_interact_menu_fnc_addActionToObject;
	// [ammoSpawner, 0, ["ACE_MainActions"], _ammoType2] call ace_interact_menu_fnc_addActionToObject;
	[ammoSpawner, 0, ["ACE_MainActions"], _ammoType3] call ace_interact_menu_fnc_addActionToObject;
	[ammoSpawner, 0, ["ACE_MainActions"], _ammoMedic] call ace_interact_menu_fnc_addActionToObject;
};