
private ["_needles", "_haystack", "_caseSensitive", "_found"];

_needles = param [0, [], ["",[]]];
_haystack = param [1, "", [""]];
_caseSensitive = param [2, false, [false]];

if (typeName _needles != "ARRAY") then
{
	_needles = [_needles];
};

if (!_caseSensitive) then
{
	_haystack = toLower _haystack;
};

_found = -1;

{
	_found = _haystack find (if (_caseSensitive) then { _x } else { toLower _x });
	if (_found != -1) exitWith {};
} forEach _needles;

_found
