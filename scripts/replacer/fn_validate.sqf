params [["_man", nil]];
if(isNil "_man") exitWith {};

if !(local _man) exitWith {};

if (isPlayer _man) exitWith {};

if !(isGroupDeletedWhenEmpty group _man) then {
	(group _man) deleteGroupWhenEmpty true;
};

private _set = _man getVariable ["edited",false];
_man setVariable ["edited", true, true];

switch(side group _man) do {
	default {};
	case west: {};
	case east: {[_man] call replacer_fnc_opfor;};
	case resistance: {[_man] call replacer_fnc_greenfor;};
	case civilian: {exit};
};
