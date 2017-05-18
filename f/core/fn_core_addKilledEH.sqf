if (!isServer) exitWith {};

{
    _x addEventHandler ["Killed",{_this call m_fnc_core_mpKilled;}];
} forEach playableUnits;
