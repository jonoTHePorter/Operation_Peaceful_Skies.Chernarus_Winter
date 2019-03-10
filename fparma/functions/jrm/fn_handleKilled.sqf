/*
 * Author: Cuel
 * Handles a unit dying
 *
 * Arguments:
 * Unit
 *
 * Public: No
 */

params [["_unit", objNull]];

if (isNil "fpa_jrm_state" || {player != _unit}) exitWith {};

private _uid = getPlayerUID player;
(fpa_jrm_state getVariable [_uid, []]) params [["_prevDeaths", 0]];

private _deaths = _prevDeaths + 1;
fpa_jrm_state setVariable [_uid, [_deaths, CBA_missionTime], true];
