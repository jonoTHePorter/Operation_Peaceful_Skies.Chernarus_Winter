/*
 * Author: Cuel
 * Init JIP and respawn manager. Call on all clients
 *
 * Arguments:
 * 0 - Amount of respawns before permadeath <number>
 *
 * Public: Yes
 */

if (isServer && {!(missionNamespace getvariable ["fpa_jrm_initialized",false])}) then {

    fpa_jrm_state = [true] call CBA_fnc_createNamespace;
    publicVariable "fpa_jrm_state";

    addMissionEventHandler ["PlayerDisconnected", {
        params ["", "_uid"];
        private _unit = allPlayers select {getPlayerUID _x == _uid} param [0, objNull];
        if (_unit getVariable ["ACE_isUnconscious", false]) then {
            (fpa_jrm_state getVariable [_uid, []]) params [["_prevDeaths", 0]];
            fpa_jrm_state setVariable [_uid, [_prevDeaths + 1, CBA_missionTime], true];
        };
    }];

    fpa_jrm_initialized = true;
};

if (hasInterface) then {
    params [["_respawns", -1]];
    fpa_jrm_respawns = _respawns;

    if (didJIP && {!isNil "fpa_jrm_state"}) then {
        [{!isNull player}, {
            (fpa_jrm_state getVariable [getPlayerUID player, []]) params [["_deaths", 0], ["_timeOfDeath", 0]];
            if (fpa_jrm_respawns >= 0 && {_deaths > fpa_jrm_respawns}) then {
                [true] call ace_spectator_fnc_setSpectator;
                ["fpa_jrm_onPermaDeath", [_deaths, _timeOfDeath, true]] call CBA_fnc_localEvent;
            };
        }] call CBA_fnc_waitUntilAndExecute;
    };

    if (!isNil "Ares_fnc_RegisterCustomModule") then {
        private _res = "FP - Respawn";

        [_res, "Respawn ALL units at pos", {
            params ["_pos"];
            private _players = [] call ace_spectator_fnc_players;
            if (count _players == 0) exitWith {["ERROR: No dead players"] call ares_fnc_ShowZeusMessage};
            ["fpa_jrm_respawn", [_pos]] call CBA_fnc_globalEvent;
            ["Respawned %1 players at %2", count _players, mapGridPosition _pos] call ares_fnc_ShowZeusMessage;
        }] call Ares_fnc_RegisterCustomModule;

        [_res, "Respawn SINGLE unit at pos", {
            params ["_pos", "_obj"];

            private _players = [] call ace_spectator_fnc_players;
            if (count _players == 0) exitWith {["ERROR: No dead players"] call ares_fnc_ShowZeusMessage};
            private _names = _players apply {name _x};

            private _args = ["Respawn single unit", [
                ["Player", _names, 0]
            ]] call Ares_fnc_ShowChooseDialog;
            if (count _args == 0) exitWith {};

            private _plr = _players param [_args select 0, objNull];
            if (isNull _plr) exitWith {["ERROR: Unable to find player"] call ares_fnc_ShowZeusMessage};

            ["fpa_jrm_respawn", [_pos], _plr] call CBA_fnc_targetEvent;
            ["Respawned %1 at %2", name _plr, mapGridPosition _pos] call ares_fnc_ShowZeusMessage;
        }] call Ares_fnc_RegisterCustomModule;
    };
};
