//Figure out which side the player is on.
_side = side player;
switch (_side) do {
    case east: { m_playerBaseChannel = m_opforBaseChannel; };
    case west: { m_playerBaseChannel = m_bluforBaseChannel; };
    case independent: { m_playerBaseChannel = m_indforBaseChannel; };
    default { titleText ["The game thinks you aren't one of the three teams!","PLAIN"]; };
};
//Error message
if (isNil "m_playerBaseChannel") exitWith {titleText ["Error! Default radio channels will not be set!","PLAIN DOWN",0.5];};

m_ch1 = m_playerBaseChannel; //All players will be able to switch to channel 1 to get on platoon net.

// m_radioSettings: Tells radio script which channels to set for group. [altChannel,mainChannel,[channelArray]] (array)
//     mainChannel: Which channel the radio will start on. (1-8)
//     altChannel: Which channel the radio will have as an alternate by default (1-8)
//     [channelArray]: An array of channels to set on the radio. (float)
//        channelArray is expressed as numbers which are added to playerBaseChannel (ch1) to determine which channel the radio will be on. 
//        Try to keep offsets single digit or the channel may not be set if playerBaseChannel is a high number.
//        Frequencies can only have one decimal place.
//     ex: [1,6,[1,2,3,4]] - mainChannel is ch1, altChannel is ch6, ch2 is 1 unit MHz higher than ch1, etc.
_radioSettings = (group player) getVariable ["m_radioSettings",[1,2,[0]]];
m_curChan = _radioSettings select 0;
m_altChan = _radioSettings select 1;
_channelArray = _radioSettings select 2;
if (count _channelArray >= 0) then {m_ch2 = m_playerBaseChannel + (_channelArray select 0)};
if (count _channelArray >= 1) then {m_ch3 = m_playerBaseChannel + (_channelArray select 1)};
if (count _channelArray >= 2) then {m_ch4 = m_playerBaseChannel + (_channelArray select 2)};
if (count _channelArray >= 3) then {m_ch5 = m_playerBaseChannel + (_channelArray select 3)};
if (count _channelArray >= 4) then {m_ch6 = m_playerBaseChannel + (_channelArray select 4)};
if (count _channelArray >= 5) then {m_ch7 = m_playerBaseChannel + (_channelArray select 5)};
if (count _channelArray >= 6) then {m_ch8 = m_playerBaseChannel + (_channelArray select 6)};
if (count _channelArray >= 7) then {m_ch9 = m_playerBaseChannel + (_channelArray select 7)};

//player isn't part of any template group
if (isNil "m_curChan") then {
    m_curChan = 1;
    m_altChan = 8;
};

//Generate Mission Notes
m_radioNoteString = "<font size='24'>Your Radio's Default Settings</font><br/><br/>Channel 1: " + str(m_ch1) + " MHz<br/>";
if (!isNil "m_ch2") then {m_radioNoteString = m_radioNoteString + "Channel 2: " + str(m_ch2) + " MHz<br/>";};
if (!isNil "m_ch3") then {m_radioNoteString = m_radioNoteString + "Channel 3: " + str(m_ch3) + " MHz<br/>";};
if (!isNil "m_ch4") then {m_radioNoteString = m_radioNoteString + "Channel 4: " + str(m_ch4) + " MHz<br/>";};
if (!isNil "m_ch5") then {m_radioNoteString = m_radioNoteString + "Channel 5: " + str(m_ch5) + " MHz<br/>";};
if (!isNil "m_ch6") then {m_radioNoteString = m_radioNoteString + "Channel 6: " + str(m_ch6) + " MHz<br/>";};
if (!isNil "m_ch7") then {m_radioNoteString = m_radioNoteString + "Channel 7: " + str(m_ch7) + " MHz<br/>";};
if (!isNil "m_ch8") then {m_radioNoteString = m_radioNoteString + "Channel 8: " + str(m_ch8) + " MHz<br/>";};
if (!isNil "m_ch9") then {m_radioNoteString = m_radioNoteString + "Channel 9: " + str(m_ch9) + " MHz<br/>";};

//Let player know what channels he starts on.
m_radioNoteString = m_radioNoteString + "<br/>Main Channel (left ear): <font color='#90ee90'>CH " + str(m_curChan) + "</font><br/>Alt. Channel (right ear): <font color='#90ee90'>CH " + str(m_altChan) + "</font>";
player createDiaryRecord ["m_Diary", ["Radio Settings", m_radioNoteString]];

//Next step
m_radHandle2 = [m_fnc_radio_waitRadios, 0, []] call CBA_fnc_addPerFrameHandler;
