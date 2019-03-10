// ACRE CHANNEL LABELS ////////////////////////////////////////////////////////////////////////////
/*
    - File that sets the channel labels for selected acre LR radios.
*/
// INIT ///////////////////////////////////////////////////////////////////////////////////////////
if !(isClass (configFile >> "CfgPatches" >> "acre_main")) exitWith {};

private _radios = ["ACRE_PRC148","ACRE_PRC152","ACRE_PRC117F"];

{
	[_x, "default", 1, "label", "COY NET"] call acre_api_fnc_setPresetChannelField;
	[_x, "default", 2, "label", "1PLT NET"] call acre_api_fnc_setPresetChannelField;
	[_x, "default", 3, "label", "2PLT NET"] call acre_api_fnc_setPresetChannelField;
	[_x, "default", 4, "label", "CAS NET"] call acre_api_fnc_setPresetChannelField;
	[_x, "default", 5, "label", "AIR NET"] call acre_api_fnc_setPresetChannelField;
	[_x, "default", 6, "label", "AUX NET"] call acre_api_fnc_setPresetChannelField;
	[_x, "default", 7, "label", "AUX NET"] call acre_api_fnc_setPresetChannelField;
	[_x, "default", 8, "label", "AUX NET"] call acre_api_fnc_setPresetChannelField;
} forEach _radios;

{
	[_x, "default"] call acre_api_fnc_setPreset;
} forEach _radios;