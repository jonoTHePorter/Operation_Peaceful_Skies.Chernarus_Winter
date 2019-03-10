/**
* Author: Cuel
* Force respawn spectators
*
* Arguments:
*  0 - _positionOrCode - A marker, object, position, (_this select 0 will be the unit for code)
*       If position, will be teleported there after exiting spectator
*   If code, the code is assumed to handle turning spectator off (fpa_common_fnc_spectate)
*        If nil, ace spectator will teleport the unit back to where he was when entering spectator (respawn pos)
* 1 - _reset - (server only) Clear all previous dead units [Default: false] <bool>
*
* Public: Yes
*/

params ["_positionOrCode", ["_resetState", false]];

if (isServer && {_resetState}) then {
    fpa_jrm_state = [true] call CBA_fnc_createNamespace;
    publicVariable "fpa_jrm_state";
};

if (!hasInterface || {!(missionNamespace getVariable ["ace_spectator_isSet",false])}) exitWith {};

// Exiting spectator is up to the function
if (!isNil "_positionOrCode" && {_positionOrCode isEqualType {}}) exitWith {
    [player] call _positionOrCode;
};

if (!isNil "_positionOrCode") then {
    private _pos = _positionOrCode call CBA_fnc_getPos;
    if (!(_pos - [0] isEqualTo [])) then {
        player setPos ([_pos, 10] call CBA_fnc_randPos);
        {player reveal [_x, 4]} forEach nearestObjects [player, ["All"], 100];
    };
};

[false] call ace_spectator_fnc_setSpectator;
