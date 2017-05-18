[] spawn {

waitUntil {!isNil "m_diary"};

private _settingsBrief ="
<br/>
<font size='18'>SETTINGS</font><br/>
This briefing section allows you to change various personal settings.
<br/><br/>
";

_settingsBrief = _settingsBrief + "
<font size='18'>UI CONTROL</font><br/>
|- <execute expression=""m_show_timeUI = !m_show_timeUI; if (m_show_timeUI) then {hintsilent 'Capture UI toggled on.'} else {hintsilent 'Capture UI toggled off.'};"">
Toggle Capture Timer UI</execute><br/>
";

player createDiaryRecord ["m_Diary", ["TF121 Settings Menu",_settingsBrief]];

};