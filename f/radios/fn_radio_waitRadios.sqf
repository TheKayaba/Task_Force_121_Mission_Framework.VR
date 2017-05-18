//Get initial values from TFAR and see if they match with what the player had on him.
m_hasLR = call TFAR_fnc_haveLRRadio;
m_hasSW = call TFAR_fnc_haveSWRadio;

if (m_hasLRitem) then {
    if (m_hasLR) then {
        m_LRsetup = true;
    } else {
        m_LRsetup = false;
    };
} else {
    m_LRsetup = true;
};

if (m_hasSWitem) then {
    if (m_hasSW) then {
        m_SWsetup = true;
    } else {
        m_SWsetup = false;
    };
} else {
    m_SWsetup = true;
};

if (m_SWsetup && {m_LRsetup} && {(CBA_missionTime > 0)}) then {
    [m_radHandle2] call CBA_fnc_removePerFrameHandler;
    call m_fnc_radio_setRadios;
};
