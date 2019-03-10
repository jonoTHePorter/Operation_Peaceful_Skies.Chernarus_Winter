private _plr = ace_player;

if (alive _plr && (isNull objectParent _plr)) then {
	["diw_cough",[_plr, format ["cough%1", (floor random 11) + 1]]] call CBA_fnc_globalEvent;
};

[misc_fnc_cough, nil,  45 + (random 255)] call CBA_fnc_waitAndExecute;
