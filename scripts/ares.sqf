["Mission", "Teleport self",
	{
		player setPos (_this select 0);
	}
] call Ares_fnc_RegisterCustomModule;

["Mission", "Spawn Enemy Group",
  {
    private _pos = (_this select 0);
    private _types = [
      "riflesquad",
      "weaponssquad",
      "fireteam",
      "assault",
      "sentry",
      "aa",
      "at"
    ];
    private _dialogResult =
    [
      "Spawn Group",
      [
        ["Group Type", _types]
      ]
    ] call Ares_fnc_ShowChooseDialog;

    if (count _dialogResult == 0) exitWith {};
    if ((_dialogResult select 0) isEqualTo []) exitWith {};

    _dialogResult params ["_type"];
    [_pos, _types select _type] call spawner_fnc_spawnGroup;
  }
] call Ares_fnc_RegisterCustomModule;

["Mission", "Spawn QRF",
  {
    private _pos = (_this select 0);
    private _types = [
      "tank",
      "apc",
      "truck",
      "helitransport"
    ];
    private _dialogResult =
    [
      "Spawn QRF",
      [
        ["Type", _types],
        ["Amount", "NUMBER"]
      ]
    ] call Ares_fnc_ShowChooseDialog;

    if (count _dialogResult == 0) exitWith {};
    if ((_dialogResult select 0) isEqualTo []) exitWith {};

    _dialogResult params ["_type", "_amount"];
    [_pos, _types select _type, parseNumber _amount] call spawner_fnc_spawnQrf;
  }
] call Ares_fnc_RegisterCustomModule;

["Mission", "Spawn Hunter Group",
  {
    private _pos = (_this select 0);
    private _radiuses = [
      "500",
      "1000",
      "100",
      "200"
    ];
    private _dialogResult =
    [
      "Spawn Hunter Group",
      [
        ["Search Radius", _radiuses]
      ]
    ] call Ares_fnc_ShowChooseDialog;

    if (count _dialogResult == 0) exitWith {};
    if ((_dialogResult select 0) isEqualTo []) exitWith {};

    _dialogResult params ["_radius"];
    [_pos, parseNumber (_radiuses select _radius)] call spawner_fnc_spawnHunter;
  }
] call Ares_fnc_RegisterCustomModule;

["Mission", "Spawn Aircraft",
  {
    private _pos = (_this select 0);
    private _types = [
      "fighter",
      "bomber",
      "fatass"
    ];
    private _dialogResult =
    [
      "Spawn Hunter Group",
      [
        ["Type", _types],
        ["Amount","NUMBER"]
      ]
    ] call Ares_fnc_ShowChooseDialog;

    if (count _dialogResult == 0) exitWith {};
    if ((_dialogResult select 0) isEqualTo []) exitWith {};

    _dialogResult params ["_type", "_amount"];
    [(_types select _type), parseNumber _amount] call spawner_fnc_spawnJet;
  }
] call Ares_fnc_RegisterCustomModule;

["Mission", "AI Task hunt",
  {
    private _grp = group (_this select 1);
    if (isNil '_grp') exitWith {["did you click on a unit or not?"] call ares_fnc_ShowZeusMessage};
    if (isPlayer (_this select 1)) exitWith {["Don't click this on palyers...."] call ares_fnc_ShowZeusMessage};
    if (_grp getVariable ["isHunting",false]) then {
      ["Stopping hunting task"] call ares_fnc_ShowZeusMessage;
    };
    ["diw_taskHunt", [_grp], _grp] call CBA_fnc_targetEvent;
  }
] call Ares_fnc_RegisterCustomModule;