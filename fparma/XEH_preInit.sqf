#include "../config_mission.hpp"

if (is3DEN) exitWith {};

// Custom export function
fpa_common_overrideArsenalExport = !isMultiplayer;

["diw_spawnGroup", {
	_this call spawner_fnc_spawnGroup;
}] call CBA_fnc_addEventHandler;

["diw_taskHunt", {
	_this call ai_fnc_taskHunt;
}] call CBA_fnc_addEventHandler;

["diw_spawnHunter", {
	_this call spawner_fnc_spawnHunter;
}] call CBA_fnc_addEventHandler;

["diw_spawnJet", {
	_this call spawner_fnc_spawnJet;
}] call CBA_fnc_addEventHandler;

["diw_patrol", {
	_this call spawner_fnc_patrol;
}] call CBA_fnc_addEventHandler;

["diw_spawnQrf", {
	_this call spawner_fnc_spawnQrf;
}] call CBA_fnc_addEventHandler;

["diw_message", {
	systemChat "message reeived";
	systemChat _this;
}] call CBA_fnc_addEventHandler;

["fpa_jrm_respawn", {
	_this call fpa_jrm_fnc_forcerespawn;
}] call CBA_fnc_addEventHandler;

["lmf_ai_listener", {
	//PARAMS INITIALLY PASSED FROM LOCAL EVENT IN INITMAN.SQF
	params ["_unit"];
	(group _unit) allowFleeing 0;
	{
		_unit setskill _x;
	} forEach [['aimingAccuracy',0.75],['aimingShake',0.50000001],['aimingSpeed',0.50000001],['commanding',1],['courage',1],['endurance',1],['general',1],['reloadSpeed',1],['spotDistance',0.85],['spotTime',0.85]];

	private _isMachineGun = getText(configFile >> "CfgWeapons" >> (primaryWeapon _unit) >> "UIPicture") == "\a3\weapons_f\data\ui\icon_mg_ca.paa";

	private _id = _unit addEventHandler["Reloaded", {
		params ["_unit","","","_newMag"];
		_newMag = _newMag select 0;
		if (_newMag == "1Rnd_HE_Grenade_shell") exitWith {};
		_unit additem _newMag;
	}];

	_unit setvariable ["lmf_ai_reloaded_EH", _id];

	//SUPPRESSION EH
	if (_isMachineGun) then {
		_id = _unit addEventHandler ["Fired", {
			_this call Ai_fnc_suppressEH;
		}];
		_unit setvariable ["lmf_ai_suppression_EH", _id];
	};

	["diw_setUpUnit", [_unit, selectRandom ["WhiteHead_06","GreekHead_A3_14","WhiteHead_07","GreekHead_A3_05","WhiteHead_09","WhiteHead_23","WhiteHead_19","WhiteHead_21","Sturrock","WhiteHead_20","AfricanHead_01","AsianHead_A3_01","AsianHead_A3_06","WhiteHead_02","WhiteHead_16","AsianHead_A3_04","PersianHead_A3_03","PersianHead_A3_01"],selectRandom ["Male01ENG","Male02ENG","Male03ENG","Male04ENG","Male05ENG","Male06ENG","Male07ENG","Male08ENG","Male09ENG","Male10ENG","Male11ENG","Male12ENG"]]] call CBA_fnc_globalEvent;

	//LOKAL EH (To remove and reapply all EHs if locality changes.)
	_id = _unit addEventHandler ["Local", {
		params ["_unit"];

		if (_unit getVariable ["lmf_ai_suppression_EH" ,-1] >= 0) then {
			_unit removeEventHandler ["Fired", _unit getVariable ["lmf_ai_suppression_EH" ,-1]];
		};
		_unit removeEventHandler ["Local", _unit getVariable ["lmf_ai_local_EH" ,-1]];
		_unit removeEventHandler ["Reloaded", _unit getVariable ["lmf_ai_reloaded_EH" ,-1]];
		//REAPPLY EHS
		["lmf_ai_listener", [_unit], _unit] call CBA_fnc_targetEvent;
	}];
	_unit setvariable ["lmf_ai_local_EH", _id];
}] call CBA_fnc_addEventHandler;

["ModuleCurator_F", "initPost", {
	params ["_module"];
	_module addEventHandler ["CuratorPinged", {
		params ["_curator", "_unit"];
		private _zeus = getAssignedCuratorUnit _curator;
		if (_zeus == player) then {
			systemChat format ["%1 just pinged", name _unit];
			["diw_message", format ["Ping received by %1!",name player, _unit] ] call CBA_fnc_targetEvent;
		};
	}];
}, false, [], true] call CBA_fnc_addClassEventHandler;

["fpa_zeuschatMessage", {
    params ["_msg"];

    if !(isNull (getAssignedCuratorLogic player)) then {
        systemChat _msg;
    };
}] call CBA_fnc_addEventHandler;

["diw_hide", {
    params ["_obj","_hide"];
	_obj hideObjectGlobal _hide;
}] call CBA_fnc_addEventHandler;

ace_advanced_fatigue_enabled = false;
ace_medical_enableAdvancedWounds = false;

if(isNil "MISSION_ROOT") then {
    if(isDedicated) then {
        MISSION_ROOT = "mpmissions\__CUR_MP." + worldName + "\";
    }
    else {
        MISSION_ROOT = str missionConfigFile select [0, count str missionConfigFile - 15];
    };
};