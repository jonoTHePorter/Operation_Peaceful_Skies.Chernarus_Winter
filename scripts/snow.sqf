//EXIT IF NO INTERFACE AND WAIT UNTIL MISSION START
if !(hasInterface) exitWith {};
waitUntil {time > 12};

//PLAY SNOW EFFECT (THX CUEL)
CUL_snowEmitter = objNull;
CUL_doSnow = {
    private _unit = ACE_player;
    if (!alive _unit || {!([_unit] call ace_common_fnc_isInBuilding)}) then {
        if (isNull CUL_snowEmitter) then {
            CUL_snowEmitter = "#particlesource" createVehicleLocal getpos _unit;
            CUL_snowEmitter setParticleParams [
                ["\A3\data_f\ParticleEffects\Universal\Universal",16,12,13,1],
                "",
                "Billboard",
                1, // timePeriod
                10, // lifetime
                [0,0,0],
                [0,0,-10],
                10,
				1,
				0,
				1,
                [0.09],
                [[1,1,1,0.5]],
                [0,1],
                0.25,
                1,
                "",
                "",
                CUL_snowEmitter,
                0,false,0.01
            ];
            CUL_snowEmitter setParticleCircle [0.0,[0, 0, 0]];
            CUL_snowEmitter setParticleRandom [0,[25,25,18],[0,0,0],0,0.01,[0,0,0,0.1],0,0];
            CUL_snowEmitter setDropInterval (0.001 * ceil random 4);
        };
        CUL_snowEmitter setPosASL (AGLToASL positionCameraToWorld [0,0,0]);
    } else {
        deleteVehicle CUL_snowEmitter;
    };
};

[{[] call CUL_doSnow}, 0.5] call cba_fnc_addPerFrameHandler;