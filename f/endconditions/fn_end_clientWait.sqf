if (!isNil "m_end_clientTime") then {
    [m_end_clientWait] call CBA_fnc_removePerFrameHandler;
};
if ((!isNil "m_isSpectator") && (isNil "m_end_clientTime")) then {
    [m_end_clientWait] call CBA_fnc_removePerFrameHandler;
    m_end_clientTime = [m_fnc_end_clientTime, 0.25, []] call CBA_fnc_addPerFrameHandler;
};
