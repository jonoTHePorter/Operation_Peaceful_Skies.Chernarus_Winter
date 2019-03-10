/*
    Executed only by server
    See: https://community.bistudio.com/wiki/Functions_Library_(Arma_3)#Initialization_Order
        for details about when the script is exactly executed.
*/
diw_enemy_radio = true;

[] spawn {
  private _grps = [];
  private _units = [];
  private _unit = objNull;
  private _index = -1;
  while {diw_enemy_radio} do {
    _grps = allGroups select {side _x == opfor};
    {
      if ((random 10) > 7 && {(_x getVariable ["diw_radiotime", -10]) < time}) then {
        _x setVariable ["diw_radiotime", time + 30 + (random 120)];
        _units = units _x;
        _index = _units findIf {alive _x};
        if (_index > -1) then {
          _unit = _units select _index;
          playSound3D [format ["%1sounds\radio\radio%2.ogg", MISSION_ROOT, (floor random 57) + 1], objNull,  false, getPosASL _unit, 3.5, 1, 150];
        };
        sleep 1;
      };
    } forEach _grps;
    sleep 30;
  };
};

diw_respawnWave = false;
diw_respawnTimer = 10 * 60;
["diw_player_killed",{
  if !(diw_respawnWave) then {
    diw_respawnWave = true;
    [{
      ["diw_respawn_hint", []] call CBA_fnc_globalEvent;
    },[],(diw_respawnTimer-30)] call CBA_fnc_waitAndExecute;
    [{
      diw_respawnWave = false;
      ["fpa_jrm_respawn", ["respawn_west"]] call CBA_fnc_globalEvent;
    },[],diw_respawnTimer] call CBA_fnc_waitAndExecute;
  };
}] call CBA_fnc_addEventHandler;
