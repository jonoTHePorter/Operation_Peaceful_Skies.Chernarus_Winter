/*
 * Author: Cuel
 * Handles a unit respawn
 *
 * Arguments:
 * Unit
 *
 * Public: No
 */

params [["_unit", objNull]];

if (isNil "fpa_jrm_state" || {player != _unit}) exitWith {};

(fpa_jrm_state getVariable [getPlayerUID player, []]) params [["_deaths", 0], ["_timeOfDeath", 0]];

private _respawns = missionNamespace getvariable ["fpa_jrm_respawns", -1];
if (_respawns >= 0 && {_deaths > _respawns}) then {
    [true] call ace_spectator_fnc_setSpectator;
    ["fpa_jrm_onPermaDeath", [_deaths, _timeOfDeath, false]] call CBA_fnc_localEvent;
};
