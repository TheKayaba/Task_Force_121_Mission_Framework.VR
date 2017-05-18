params ["_args", "_handle"];
_args params ["_triggerList", "_delay", "_sectorType"];

if !(CBA_missionTime > 0) exitWith {};

private _triggerCount = count _triggerList;
private _markerNameIterator = 0;
{ // forEach _triggerList

    // Get owner of the cap from the last time it was checked
    private _sidePastOwned = _x getVariable "m_sector_curOwner";
    private _sideLastOwned = _x getVariable "m_sector_lastOwner";
    private _flagPole = _x getVariable "m_sector_flagPole";

    // Get marker names
    private _textMarkerName = str(_markerNameIterator) + "_mSectorMarkText";
    private _bgMarkerName = str(_markerNameIterator) + "_mSectorMark";

    private _westCount = {private _isSpectator = _x getVariable ["m_isUnitSpectator",false]; (alive _x) && {side group _x isEqualTo west} && {!_isSpectator}} count list _x;
    private _eastCount = {private _isSpectator = _x getVariable ["m_isUnitSpectator",false]; (alive _x) && {side group _x isEqualTo east} && {!_isSpectator}} count list _x;
    private _indCount = {private _isSpectator = _x getVariable ["m_isUnitSpectator",false]; (alive _x) && {side group _x isEqualTo independent} && {!_isSpectator}} count list _x;
    private _sideCurOwned = 5;

    // Western Controlled - 0
    if (_westCount > _eastCount && _westCount > _indCount) then {
        _sideCurOwned = 0;
        if (_sideCurOwned isEqualTo _sidePastOwned) then {
            m_sector_westPoints = m_sector_westPoints+ (1*_delay);
        } else {
            _textMarkerName setMarkerText (triggerText _x + " - BLUFOR Controlled");
            _bgMarkerName setMarkerColor "ColorBLUFOR";
            _flagPole setFlagTexture "\ca\ca_e\data\flag_blufor_co.paa";
            _x setVariable ["m_sector_lastOwner",_sideCurOwned, true];
        };
    };

    // Eastern Controlled - 1
    if (_eastCount > _westCount && _eastCount > _indCount) then {
        _sideCurOwned = 1;
        if (_sideCurOwned isEqualTo _sidePastOwned) then {
            m_sector_eastPoints = m_sector_eastPoints+ (1*_delay);
        } else {
            _textMarkerName setMarkerText (triggerText _x + " - OPFOR Controlled");
            _bgMarkerName setMarkerColor "ColorOPFOR";
            _flagPole setFlagTexture "\ca\ca_e\data\flag_opfor_co.paa";
            _x setVariable ["m_sector_lastOwner",_sideCurOwned, true];
        };
    };

    // Independent Controlled - 4
    if (_indCount > _westCount && _indCount > _eastCount) then {
        _sideCurOwned = 4;
        if (_sideCurOwned isEqualTo _sidePastOwned) then {
            m_sector_indPoints = m_sector_indPoints+ (1*_delay);
        } else {
            _textMarkerName setMarkerText (triggerText _x + " - INDFOR Controlled");
            _bgMarkerName setMarkerColor "ColorGUER";
            _flagPole setFlagTexture "\ca\ca_e\data\flag_indfor_co.paa";
            _x setVariable ["m_sector_lastOwner",_sideCurOwned, true];
        };
    };

    // Contested Objective - 2
    if (((_westCount isEqualTo _eastCount) && {_westCount != 0} && (_indCount <= _westCount)) || ((_westCount isEqualTo _indCount) && {_westCount != 0} && (_eastCount <= _westCount)) || ((_indCount isEqualTo _eastCount) && {_indCount != 0} && (_westCount <= _indCount))) then {
        _sideCurOwned = 2;
        _textMarkerName setMarkerText (triggerText _x + " - CONTESTED");
        _bgMarkerName setMarkerColor "ColorBlack";
        _flagPole setFlagTexture "\ca\ca_e\data\flag_white_co.paa";
        _x setVariable ["m_sector_lastOwner",_sideCurOwned, true];
    };

    // Neutral Objective - 3
    if ((_westCount isEqualTo _eastCount) && (_indCount isEqualTo _westCount) && {_westCount isEqualTo 0}) then {
        _sideCurOwned = 3;
        // For objectives that a side controls but no longer occupies
        if (_sideLastOwned isEqualTo 0) then {
            m_sector_westPoints = m_sector_westPoints+ (1*_delay);
        };
        if (_sideLastOwned isEqualTo 1) then {
            m_sector_eastPoints = m_sector_eastPoints+ (1*_delay);
        };
        if (_sideLastOwned isEqualTo 4) then {
            m_sector_indPoints = m_sector_indPoints+ (1*_delay);
        };
    };

    // Set current owner
    _x setVariable ["m_sector_curOwner",_sideCurOwned];

    // Sector has changed sides
    if ((_sideCurOwned != _sideLastOwned) && {_sideCurOwned != 3}) then {
        private _textString = "----";
        switch (_sideCurOwned) do {
            case 0: { _textString = format["BLUFOR have taken control of %1.",triggerText _x]; };
            case 1: { _textString = format["OPFOR have taken control of %1.",triggerText _x]; };
            case 2: { _textString = format["%1 is now contested.",triggerText _x]; };
            case 4: { _textString = format["INDFOR have taken control of %1.",triggerText _x]; }
        };
        [_textString] remoteExecCall ["m_fnc_titleTextSector", 0];
    };
    // Iterator for marker names
    _markerNameIterator = _markerNameIterator + 1;
} forEach _triggerList;

if (_sectorType isEqualTo 2) then {
    // Update points for clients
    if (m_sector_westPoints != m_sector_westPointsPublic) then {
        m_sector_westPointsPublic = m_sector_westPoints;
        publicVariable "m_sector_westPointsPublic";
    };
    if (m_sector_eastPoints != m_sector_eastPointsPublic) then {
        m_sector_eastPointsPublic = m_sector_eastPoints;
        publicVariable "m_sector_eastPointsPublic";
    };
    if (m_sector_indPoints != m_sector_indPointsPublic) then {
        m_sector_indPointsPublic = m_sector_indPoints;
        publicVariable "m_sector_indPointsPublic";
    };

    // Ending conditions
    if (m_sector_westPoints >= m_sector_endPoints) then {
        private _textString = format ["The BLUFOR team has reached the required amount of points to win the mission."];
        [_textString] remoteExecCall ["m_fnc_titleTextSector", 0];

        [_handle] call CBA_fnc_removePerFrameHandler;
    };
    if (m_sector_eastPoints >= m_sector_endPoints) then {
        private _textString = format ["The OPFOR team has reached the required amount of points to win the mission."];
        [_textString] remoteExecCall ["m_fnc_titleTextSector", 0];

        [_handle] call CBA_fnc_removePerFrameHandler;
    };
    if (m_sector_indPoints >= m_sector_endPoints) then {
        private _textString = format ["The INDFOR team has reached the required amount of points to win the mission."];
        [_textString] remoteExecCall ["m_fnc_titleTextSector", 0];

        [_handle] call CBA_fnc_removePerFrameHandler;
    };
};
