/*
	Executed locally when player joins mission (includes both mission start and JIP).
  	This script guarantees that player object exists. Init.sqf does not
	See: https://community.bistudio.com/wiki/Functions_Library_(Arma_3)#Initialization_Order
		for details about when the script is exactly executed.
*/

if !(hasInterface) exitWith {};

[] call compile preprocessFileLineNumbers "briefing.sqf";

// Apply loadout
if (!isNil "FP_fnc_getLoadout") then {
  private _added = [player, typeOf player] call FP_fnc_getLoadout;

  // Respawn with gear
  if (_added) then {
    player addEventHandler ["Respawn", {
      [player, typeOf player] call FP_fnc_getLoadout;
    }];
  };

  if (!isMultiplayer) then {
    // Give AI loadouts
    {
      [_x, typeOf _x] call FP_fnc_getLoadout;
    } forEach (switchableUnits - (entities "HeadlessClient_F" + [player]));
  };
};

// Easier arsenal in editor, validate mission
if (!isMultiplayer) then {
  // Make arsenal easier to enter
  [["<t color='#ffff00'>[ Arsenal ]</t>", {[ace_player, ace_player, true] call ace_arsenal_fnc_openBox}, 0, -85, false, true, "", ""]] call CBA_fnc_addPlayerAction;
  
  // Validate unit descriptions and callsigns. Can be removed (description.ext)
  // private _cfg = getMissionConfig "MissionSQM";
  // if (!isNull _cfg) then {
  //   [_cfg] call fpa_common_fnc_validateMission;
  // };
};

["diw_cough",{
  if !(hasInterface) exitWith {};
  params ["_unit", "_sound"];
  _unit say3D _sound;
}] call CBA_fnc_addEventHandler;

["diw_setUpUnit",{
  params ["_unit", "_face", "_speaker"];
  _unit setFace _face;
  _unit setSpeaker _speaker;
}] call CBA_fnc_addEventHandler;

// snow
execvm "scripts\snow.sqf";
execvm "scripts\groupTracker.sqf";

// achilles modules
if !(isnil "Ares_fnc_RegisterCustomModule") then {
	[] execVM "scripts\ares.sqf";
};

//JIP
if (CBA_missionTime > 2*60) then {
	[] execVM "scripts\jipTeleport.sqf";
};

//ACRE CHANNEL PRESET
[] execVM "scripts\acreChannelPreset.sqf";

// coughing
[misc_fnc_cough, nil,  45 + (random 255)] call CBA_fnc_waitAndExecute;

if (typeOf player isEqualTo "B_engineer_F") then {
    ["diw_respawn_hint",{
        ["RespawnAdded",["Respawn Wave","New Respawn Wave!","\A3\ui_f\data\Map\VehicleIcons\iconHelicopter_ca.paa"]] call BIS_fnc_showNotification;
    }] call CBA_fnc_addEventHandler;
};

player addEventHandler ["Killed", {
  ["diw_player_killed",[]] call CBA_fnc_serverEvent;
}];

// supply spawn ace actions (requires laptop named "ammoSpawner" and helipad named "ammoPad")
[] call compile preprocessFileLineNumbers "scripts\suppSpawningAction.sqf";

if (ace_advanced_fatigue_enabled) then {
  [] spawn {
    while {ace_advanced_fatigue_enabled} do { // sorry for I have sinned
      ace_advanced_fatigue_muscleDamage = 0;
      sleep 60;
    };
  };
};

ace_hearing_damageCoefficent = 0;
ace_hearing_deafnessDV  = 0;

[] spawn {
  sleep 10;
  if !(isNull (getAssignedCuratorLogic player)) then {
    // zeus actions
    private _action = ["diw_spawnerRoot","AI Spawning","",{true},{true}] call ace_interact_menu_fnc_createAction;
    [["ACE_ZeusActions"], _action] call ace_interact_menu_fnc_addActionToZeus;
    _action = ["diw_spawnerQRF","QRF","",{true},{true}] call ace_interact_menu_fnc_createAction;
    [["ACE_ZeusActions","diw_spawnerRoot"], _action] call ace_interact_menu_fnc_addActionToZeus;
    _action = ["diw_spawnerAirplanes","Airplanes","",{true},{true}] call ace_interact_menu_fnc_createAction;
    [["ACE_ZeusActions","diw_spawnerRoot"], _action] call ace_interact_menu_fnc_addActionToZeus;
    _action = ["diw_spawnerInfantry","Infantry","",{true},{true}] call ace_interact_menu_fnc_createAction;
    [["ACE_ZeusActions","diw_spawnerRoot"], _action] call ace_interact_menu_fnc_addActionToZeus;

    _action = ["diw_spawnerQRFHeli","Helitransport","",{
      diw_spawnType = "qrfheli";
      [] spawn diw_addClickEh;
    },{true}] call ace_interact_menu_fnc_createAction;
    [["ACE_ZeusActions","diw_spawnerRoot","diw_spawnerQRF"], _action] call ace_interact_menu_fnc_addActionToZeus;
    _action = ["diw_spawnerQRFApc","APCs","",{
      diw_spawnType = "qrfapc";
      [] spawn diw_addClickEh;
    },{true}] call ace_interact_menu_fnc_createAction;
    [["ACE_ZeusActions","diw_spawnerRoot","diw_spawnerQRF"], _action] call ace_interact_menu_fnc_addActionToZeus;
    _action = ["diw_spawnerQRFTank","Tanks","",{
      diw_spawnType = "qrftank";
      [] spawn diw_addClickEh;
    },{true}] call ace_interact_menu_fnc_createAction;
    [["ACE_ZeusActions","diw_spawnerRoot","diw_spawnerQRF"], _action] call ace_interact_menu_fnc_addActionToZeus;
    _action = ["diw_spawnerQRFTruck","Trucks","",{
      diw_spawnType = "qrftruck";
      [] spawn diw_addClickEh;
    },{true}] call ace_interact_menu_fnc_createAction;
    [["ACE_ZeusActions","diw_spawnerRoot","diw_spawnerQRF"], _action] call ace_interact_menu_fnc_addActionToZeus;

    _action = ["diw_spawnerInfriflesquad","riflesquad","",{
      diw_spawnType = "infriflesquad";
      [] spawn diw_addClickEh;
    },{true}] call ace_interact_menu_fnc_createAction;
    [["ACE_ZeusActions","diw_spawnerRoot","diw_spawnerInfantry"], _action] call ace_interact_menu_fnc_addActionToZeus;
    _action = ["diw_spawnerInfweaponssquad","weaponssquad","",{
      diw_spawnType = "infweaponssquad";
      [] spawn diw_addClickEh;
    },{true}] call ace_interact_menu_fnc_createAction;
    [["ACE_ZeusActions","diw_spawnerRoot","diw_spawnerInfantry"], _action] call ace_interact_menu_fnc_addActionToZeus;
    _action = ["diw_spawnerInffireteam","fireteam","",{
      diw_spawnType = "inffireteam";
      [] spawn diw_addClickEh;
    },{true}] call ace_interact_menu_fnc_createAction;
    [["ACE_ZeusActions","diw_spawnerRoot","diw_spawnerInfantry"], _action] call ace_interact_menu_fnc_addActionToZeus;
    _action = ["diw_spawnerInfassault","assault","",{
      diw_spawnType = "infassault";
      [] spawn diw_addClickEh;
    },{true}] call ace_interact_menu_fnc_createAction;
    [["ACE_ZeusActions","diw_spawnerRoot","diw_spawnerInfantry"], _action] call ace_interact_menu_fnc_addActionToZeus;
    _action = ["diw_spawnerInfsentry","sentry","",{
      diw_spawnType = "infsentry";
      [] spawn diw_addClickEh;
    },{true}] call ace_interact_menu_fnc_createAction;
    [["ACE_ZeusActions","diw_spawnerRoot","diw_spawnerInfantry"], _action] call ace_interact_menu_fnc_addActionToZeus;
    _action = ["diw_spawnerInfaa","aa","",{
      diw_spawnType = "infaa";
      [] spawn diw_addClickEh;
    },{true}] call ace_interact_menu_fnc_createAction;
    [["ACE_ZeusActions","diw_spawnerRoot","diw_spawnerInfantry"], _action] call ace_interact_menu_fnc_addActionToZeus;
    _action = ["diw_spawnerInfat","at","",{
      diw_spawnType = "infat";
      [] spawn diw_addClickEh;
    },{true}] call ace_interact_menu_fnc_createAction;
    [["ACE_ZeusActions","diw_spawnerRoot","diw_spawnerInfantry"], _action] call ace_interact_menu_fnc_addActionToZeus;

    _action = ["diw_spawnerAirplanesJets","Gripen","",{
      ["fighter", 2] call spawner_fnc_spawnJet;
    },{true}] call ace_interact_menu_fnc_createAction;
    [["ACE_ZeusActions","diw_spawnerRoot","diw_spawnerAirplanes"], _action] call ace_interact_menu_fnc_addActionToZeus;
    _action = ["diw_spawnerAirplanesA10","A-10","",{
      ["bomber", 2] call spawner_fnc_spawnJet;
    },{true}] call ace_interact_menu_fnc_createAction;
    [["ACE_ZeusActions","diw_spawnerRoot","diw_spawnerAirplanes"], _action] call ace_interact_menu_fnc_addActionToZeus;
    _action = ["diw_spawnerAirplanesBomber","Fat ass bomber","",{
      ["fatass", 2] call spawner_fnc_spawnJet;
    },{true}] call ace_interact_menu_fnc_createAction;
    [["ACE_ZeusActions","diw_spawnerRoot","diw_spawnerAirplanes"], _action] call ace_interact_menu_fnc_addActionToZeus;

    _action = ["diw_spawnerZeus","Hide Zeus","",{true},{true}] call ace_interact_menu_fnc_createAction;
    [["ACE_ZeusActions"], _action] call ace_interact_menu_fnc_addActionToZeus;
    _action = ["diw_spawnerZeusYes","Yup","",{
      player allowDamage false;
      player setVariable ["ace_medical_allowDamage", false, true];
      ["diw_hide",[player, true]] call CBA_fnc_serverEvent;
      player setCaptive true;
    },{true}] call ace_interact_menu_fnc_createAction;
    [["ACE_ZeusActions","diw_spawnerZeus"], _action] call ace_interact_menu_fnc_addActionToZeus;
    _action = ["diw_spawnerZeusNo","Nope","",{
      player allowDamage true;
      player setVariable ["ace_medical_allowDamage", true, true];
      ["diw_hide",[player, false]] call CBA_fnc_serverEvent;
      player setCaptive false;
    },{true}] call ace_interact_menu_fnc_createAction;
    [["ACE_ZeusActions","diw_spawnerZeus"], _action] call ace_interact_menu_fnc_addActionToZeus;

    diw_spawnType = -1;
    diw_clickEh = {
      if ((_this select 1) == 0) then {
        private _pos = AGLToASL (screenToWorld getMousePosition);
        _pos = [_pos#0, _pos#1, 0];
        private _type = missionNamespace getVariable ["diw_spawnType", "none"];
        switch (_type) do {
          case "qrfapc": { [_pos, "apc", 2] call spawner_fnc_spawnQrf; };
          case "qrfheli": { [_pos, "helitransport", 2] call spawner_fnc_spawnQrf; };
          case "qrftank": { [_pos, "tank", 2] call spawner_fnc_spawnQrf; };
          case "qrftruck": { [_pos, "truck", 2] call spawner_fnc_spawnQrf; };
          case "infriflesquad": { [_pos, "riflesquad"] call spawner_fnc_spawnGroup; };
          case "infweaponssquad": { [_pos, "weaponssquad"] call spawner_fnc_spawnGroup; };
          case "inffireteam": { [_pos, "fireteam"] call spawner_fnc_spawnGroup; };
          case "infassault": { [_pos, "assault"] call spawner_fnc_spawnGroup; };
          case "infsentry": { [_pos, "sentry"] call spawner_fnc_spawnGroup; };
          case "infaa": { [_pos, "aa"] call spawner_fnc_spawnGroup; };
          case "infat": { [_pos, "at"] call spawner_fnc_spawnGroup; };
          default { };
        };
      };
      diw_spawnType = -1;
      (findDisplay 312) displayRemoveEventHandler ["mouseButtonDown", diw_clickEhId];
    };

    diw_addClickEh = {
      waitUntil { !isnull (findDisplay 312) };
      diw_clickEhId = [findDisplay 312, "mouseButtonDown", {_this call diw_clickEh}] call CBA_fnc_addBISEventHandler;
    };

    systemChat "Zeus shit added!";
  };
};

onMapSingleClick "_shift";