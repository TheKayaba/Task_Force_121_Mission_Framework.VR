//Generates base channels for radios and broadcasts them to clients. 30MHz-87MHz is the longrange limit before taking into account how many freqs are needed
if (!isServer) exitWith {};

_enablePreset = ["m_param_enableRadioPreset",1] call BIS_fnc_getParamValue;
if (_enablePreset isEqualTo 0) exitWith {[m_radHandle1] call CBA_fnc_removePerFrameHandler;};

_opforBaseChannel = floor(random 50) + 30;
_indforBaseChannel = floor(random 50) + 30;
_bluforBaseChannel = floor(random 50) + 30;
_broadcasted1 = ["m_bluforBaseChannel", _bluforBaseChannel] call CBA_fnc_publicVariable;
_broadcasted2 = ["m_opforBaseChannel", _opforBaseChannel] call CBA_fnc_publicVariable;
_broadcasted3 = ["m_indforBaseChannel", _indforBaseChannel] call CBA_fnc_publicVariable;
