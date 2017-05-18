//Change channel numbers from user readable to script readable
m_curChan = m_curChan - 1;
m_altChan = m_altChan - 1;

//Only setup long range channels if player has one
if (m_hasLR) then {
    m_curSettings = (call TFAR_fnc_activeLrRadio) call TFAR_fnc_getLrSettings;
    //Set default channel
    m_curSettings set [0,m_curChan];
    //Set default volume
    m_curSettings set [1,6];
    //Setup frequencies for channels 1-9
    m_chanSettings = m_curSettings select 2;
    if (!isNil "m_ch1") then {m_chanSettings set [0,m(m_ch1)];};
    if (!isNil "m_ch2") then {m_chanSettings set [1,m(m_ch2)];};
    if (!isNil "m_ch3") then {m_chanSettings set [2,m(m_ch3)];};
    if (!isNil "m_ch4") then {m_chanSettings set [3,m(m_ch4)];};
    if (!isNil "m_ch5") then {m_chanSettings set [4,m(m_ch5)];};
    if (!isNil "m_ch6") then {m_chanSettings set [5,m(m_ch6)];};
    if (!isNil "m_ch7") then {m_chanSettings set [6,m(m_ch7)];};
    if (!isNil "m_ch8") then {m_chanSettings set [7,m(m_ch8)];};
    if (!isNil "m_ch9") then {m_chanSettings set [8,m(m_ch9)];};
    m_curSettings set [2,m_chanSettings];
    //Set stero mode for default channel
    m_curSettings set [3,1];
    //Set alternate channel
    m_curSettings set [5,m_altChan];
    //Set stero mode for alternate channel
    m_curSettings set [6,2];
    [(call TFAR_fnc_activeLrRadio) select 0, (call TFAR_fnc_activeLrRadio) select 1, m_curSettings] call TFAR_fnc_setLrSettings;
};

//Only setup short wave channels if player has one
if (m_hasSW) then {
    m_curSettings = (call TFAR_fnc_activeSwRadio) call TFAR_fnc_getSwSettings;
    //Set default channel
    m_curSettings set [0,m_curChan];
    //Set default volume
    m_curSettings set [1,6];
    //Setup frequencies for channels 1-9
    m_chanSettings = m_curSettings select 2;
    if (!isNil "m_ch1") then {m_chanSettings set [0,m(m_ch1)];};
    if (!isNil "m_ch2") then {m_chanSettings set [1,m(m_ch2)];};
    if (!isNil "m_ch3") then {m_chanSettings set [2,m(m_ch3)];};
    if (!isNil "m_ch4") then {m_chanSettings set [3,m(m_ch4)];};
    if (!isNil "m_ch5") then {m_chanSettings set [4,m(m_ch5)];};
    if (!isNil "m_ch6") then {m_chanSettings set [5,m(m_ch6)];};
    if (!isNil "m_ch7") then {m_chanSettings set [6,m(m_ch7)];};
    if (!isNil "m_ch8") then {m_chanSettings set [7,m(m_ch8)];};
    m_curSettings set [2,m_chanSettings];
    //Set stero mode for default channel
    m_curSettings set [3,1];
    //Set alternate channel
    m_curSettings set [5,m_altChan];
    //Set stero mode for alternate channel
    m_curSettings set [6,2];
    
    [(call TFAR_fnc_activeSwRadio), m_curSettings] call TFAR_fnc_setSwSettings;
};


//Everything should be setup. Let the player know.
systemChat "Radios preset.";
call m_fnc_radio_cleanup;