//====================================================================================================
// Shared Scripts

// Add event handlers for rating and score
call m_fnc_core_addRatingEH;
call m_fnc_core_addScoreEH;

// Set up time of day + weather
call m_fnc_core_setDate;
call m_fnc_core_setWeather;

// Run sector script
call m_fnc_sectorInit;

// Run safestart script
[] execVM "f\safeStart\f_safeStart.sqf";

// Run radio setup
[] execVM "f\radios\radio_init.sqf";

//====================================================================================================
m_sharedInitFinished = true;

// Wait for mission to start, then execute post briefing init
[{CBA_missionTime > 0}, {
    call m_fnc_init_postBriefing;
}, []] call CBA_fnc_waitUntilAndExecute;
