/*
	Runs for everyone
  	!!! This script does not guarantee that 'player' is defined, initPlayerLocal does
	See: https://community.bistudio.com/wiki/Functions_Library_(Arma_3)#Initialization_Order
		for details about when the script is exactly executed.
*/

ace_medical_enableAdvancedWounds = false;
ace_cookoff_ammoCookoffDuration = 0.2;
ace_cookoff_probabilityCoef = 0.75;

if (isServer) then {
    [{
        fpa_performanceChecks = [
            [{diag_fps < 12}, {format ["fps is low: %1.", round diag_fps]}],
            [{
                count (allUnits select {simulationEnabled _x && !isPlayer _x}) > 120
            }, {"a lot of active AI (>120)"}],
            [{count (allGroups select {units _x isEqualTo []}) > 30}, {"a lot of empty groups (>30)"}],
            [{count allDead > 40}, {"a lot of corpses (>40)"}]
        ];

        fpa_performancePfh = [{
            (fpa_performanceChecks deleteAt 0) params ["_condition", "_msg"];
            if (call _condition) then {
                ["fpa_zeuschatMessage", [call _msg]] call CBA_fnc_globalEvent;
            };
            fpa_performanceChecks pushBack [_condition, _msg];
        }, 30, []] call CBA_fnc_addPerFrameHandler;
    }, 10] call CBA_fnc_waitAndExecute;
};

//MAKE OBJECT CARRYABLE AND DRAGABLE
["misc_makeCarryable", {
    params [["_object",objNull]];
  
    [_object, true] call ace_dragging_fnc_setDraggable;
    [_object, true] call ace_dragging_fnc_setCarryable;

}] call CBA_fnc_addEventHandler;

//ACRE CHANNEL LABELS
[] execVM "scripts\acreChannelLabels.sqf";