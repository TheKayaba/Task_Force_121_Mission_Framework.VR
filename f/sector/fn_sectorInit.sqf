#include "settings.sqf"

if (isServer) then {
    if (!isNil "m_sector_1") then {
      call m_fnc_createSector;
    };
};

// Only add points and time display to clients when the mission uses sector control type
if (hasInterface && {_sectorType isEqualTo 2}) then {
    call m_fnc_pointsDisplay;
    m_end_clientTime = [m_fnc_end_clientTime, 0.25, []] call CBA_fnc_addPerFrameHandler;

    // Add briefing note
    #include "briefing_include.sqf"
};
