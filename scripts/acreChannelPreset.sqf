// ACRE CHANNEL PRESET ////////////////////////////////////////////////////////////////////////////
/*
    - File that presets the SR channel for selected infantry groups.
*/
// INIT ///////////////////////////////////////////////////////////////////////////////////////////
if !(isClass (configFile >> "CfgPatches" >> "acre_main")) exitWith {};
waitUntil {([] call acre_api_fnc_isInitialized)};

private _id = groupID group player;
private _personalRadio = ["ACRE_PRC343"] call acre_api_fnc_getRadioByType;

//EXIT IF NO RADIO OR NOT LOCAL
if (!local player || {isNil "_personalRadio"}) exitWith {};

//APPLY CHANNEL IF RADIO
if (_id == "1st Platoon Command") exitWith {
	[_personalRadio, 5] call acre_api_fnc_setRadioChannel;
};

if (_id == "Alpha 1-1") exitWith {
	[_personalRadio, 1] call acre_api_fnc_setRadioChannel;
};

if (_id == "Bravo 1-2") exitWith {
	[_personalRadio, 2] call acre_api_fnc_setRadioChannel;
};

if (_id == "Charlie 1-3") exitWith {
	[_personalRadio, 3] call acre_api_fnc_setRadioChannel;
};

if (_id == "Delta 1-4") exitWith {
	[_personalRadio, 4] call acre_api_fnc_setRadioChannel;
};

if (_id == "2nd Platoon Command") exitWith {
	[_personalRadio, 10] call acre_api_fnc_setRadioChannel;
};

if (_id == "Alpha 2-1") exitWith {
	[_personalRadio, 6] call acre_api_fnc_setRadioChannel;
};

if (_id == "Bravo 2-2") exitWith {
	[_personalRadio, 7] call acre_api_fnc_setRadioChannel;
};

if (_id == "Charlie 2-3") exitWith {
	[_personalRadio, 8] call acre_api_fnc_setRadioChannel;
};

if (_id == "Delta 2-4") exitWith {
	[_personalRadio, 9] call acre_api_fnc_setRadioChannel;
};

if (_id == "Company Command") exitWith {
	[_personalRadio, 17] call acre_api_fnc_setRadioChannel;
};

if (_id == "Kilo") exitWith {
	[_personalRadio, 18] call acre_api_fnc_setRadioChannel;
};

if (_id == "Snake") exitWith {
	[_personalRadio, 19] call acre_api_fnc_setRadioChannel;
};

if (_id == "Doom 1") exitWith {
	[_personalRadio, 20] call acre_api_fnc_setRadioChannel;
};

if (_id == "Doom 2") exitWith {
	[_personalRadio, 20] call acre_api_fnc_setRadioChannel;
};

if (_id == "Sierra 1") exitWith {
	[_personalRadio, 22] call acre_api_fnc_setRadioChannel;
};

if (_id == "Sierra 2") exitWith {
	[_personalRadio, 23] call acre_api_fnc_setRadioChannel;
};

if (_id == "Sierra 3") exitWith {
	[_personalRadio, 23] call acre_api_fnc_setRadioChannel;
};

if (_id == "Sierra 4") exitWith {
	[_personalRadio, 22] call acre_api_fnc_setRadioChannel;
};