//If ORBAT is written, destroy all global variables that aren't in use anymore
if (m_writtenORBAT) then {
    m_hasSWitem = nil;
    m_hasLRitem = nil;
    m_radHandle1 = nil;

    m_curChan = nil;
    m_altChan = nil;
    m_ch1 = nil;
    m_ch2 = nil;
    m_ch3 = nil;
    m_ch4 = nil;
    m_ch5 = nil;
    m_ch6 = nil;
    m_ch7 = nil;
    m_ch8 = nil;
    m_ch9 = nil;
    m_radioNoteString = nil;
    m_radHandle2 = nil;

    m_hasLR = nil;
    m_LRsetup = nil;
    m_hasSW = nil;
    m_SWsetup = nil;

    m_curSettings = nil;
};
