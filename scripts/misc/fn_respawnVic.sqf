if !(isServer) exitWith {};
params ["_vic"];

_vic setVariable ["diw_respawn_pos", [typeOf _vic, getPosWorld _vic, getDir _vic], true];

_vic addMPEventHandler ["MPKilled", {
	if !(isServer) exitWith {};
	params ["_vic"];
	[{
		params ["_type","_pos","_dir"];
		private _vic = createVehicle [_type, [0,0,0], [], 0, "CAN_COLLIDE"];
		_vic setPosWorld _pos;
		_vic setDir _dir;
		clearMagazineCargoGlobal _vic ;
		clearWeaponCargoGlobal _vic;
		clearItemCargoGlobal _vic;
		clearBackpackCargoGlobal _vic;
	}, (_vic getVariable "diw_respawn_pos"), 5*60] call CBA_fnc_waitAndExecute;
}];
