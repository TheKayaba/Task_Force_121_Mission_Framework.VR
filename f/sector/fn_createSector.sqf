/*
Creates sector(s) and then adds a PFH to poll them every ~10 seconds for changes..

Runs on server.
*/
if (!isServer) exitWith {};

#include "settings.sqf"

// Initialize variables
private _markerNameIterator = 0;
m_sector_westPoints = 0;
m_sector_westPointsPublic = 0;

m_sector_eastPoints = 0;
m_sector_eastPointsPublic = 0;

m_sector_indPoints = 0;
m_sector_indPointsPublic = 0;

m_sector_playing = true;
m_sector_sectorControl = true;
missionNamespace setVariable ["m_sector_sectorControlActive", true, true]; // Used to check if sector control module is running or not

if (isNil "m_sector_quickestTime") then {
    // Time in minutes it would take to win if one team owned all points uncontested
    m_sector_quickestTime = ["m_sector_sectorTime",25] call BIS_fnc_getParamValue;
};
m_sector_endPoints = (m_sector_quickestTime * 60) * (count m_sector_triggerArray);

// Create markers for players to see whats going on
{// forEach m_sector_triggerArray
    // Get variables for a marker
    private _markerName = str(_markerNameIterator) + "_mSectorMark";
    private _markerNameText = str(_markerNameIterator) + "_mSectorMarkText";
    private _markerSize = triggerArea _x;
    private _markerPos = getPos _x;

    // Just in case this script has already been run
    if (!isNil "m_sector_sectorsAlreadyCreated") then {
        deleteMarker _markerName;
        deleteMarker _markerNameText;
    };

    // Build marker for area
    private _marker = createMarker [_markerName,_markerPos];
    _marker setMarkerSize [_markerSize select 0,_markerSize select 1];
    _marker setMarkerDir (_markerSize select 2);
    _marker setMarkerColor "ColorBlack";
    _marker setMarkerBrush "SolidBorder";
    // Get marker's shape
    if (_markerSize select 3) then {
        _marker setMarkerShape "RECTANGLE";
    } else {
        _marker setMarkerShape "ELLIPSE";
    };

    // Build marker for text
    _marker = createMarker [_markerNameText,_markerPos];
    _marker setMarkerShape "ICON";
    _marker setMarkerType "hd_dot";
    _marker setMarkerText (triggerText _x + " - Neutral");

    // Create flag
    _flag = createVehicle ["Flag_White_F", (getPos _x), [], 0, "CAN_COLLIDE"];
    _flag allowDamage false;
    _x setVariable ["m_sector_flagPole",_flag,true];

    // Set sector status to neutral for later
    _x setVariable ["m_sector_curOwner",3,true];
    _x setVariable ["m_sector_lastOwner",3];
    _markerNameIterator = _markerNameIterator + 1;
} forEach m_sector_triggerArray;

if (isNil "m_sector_sectorsAlreadyCreated") then {
    m_sector_sectorsAlreadyCreated = true;

    [m_fnc_watchSector, _delay, [m_sector_triggerArray, _delay, _sectorType]] call CBA_fnc_addPerFrameHandler;
};
