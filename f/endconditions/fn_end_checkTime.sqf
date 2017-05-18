// Time Limits
if ((m_missionRuntimeMins - 15) <= (CBA_missionTime/60) && {m_alertSoon isEqualTo 0}) then {
    _hintStr = "15 minutes remaining.";
    call fnc_sectorControl;
    _hintStr remoteExecCall ["m_fnc__hintThenClear", 0];
    m_alertSoon = 1;
};
if (m_missionRuntimeMins <= (CBA_missionTime/60) && {m_alertEnd < 1}) then {
    _hintStr = "The mission time limit has been reached.";
    call fnc_sectorControl;
    _hintStr remoteExecCall ["m_fnc__hintThenClear", 0];
    m_alertEnd = m_alertEnd + 1;
};
if ((m_missionRuntimeMins + (1*m_alertOver)) <= (CBA_missionTime/60)) then {
    _hintStr = str(1*m_alertOver) + " minute(s) since limit.";
    call fnc_sectorControl;
    _hintStr remoteExecCall ["m_fnc__hintThenClear", 0];
    m_alertOver = m_alertOver + 1;
};
