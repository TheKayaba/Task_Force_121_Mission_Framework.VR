//====================================================================================================
// Server Scripts
if !(isServer) exitWith {};

// Initialize Variables - End conditions
m_missionSafeTime = ["f_param_mission_timer",0] call BIS_fnc_getParamValue; //Default - 0 minute safestart
m_missionRunTime = ["m_missionTimelimit",45] call BIS_fnc_getParamValue; //Default - 45 minute battle phase
m_missionRuntimeMins = m_missionRunTime + m_missionSafeTime;
m_alertOver = 1; // Time elapsed warning
m_alertEnd = 0; // Time elapsed warning
m_alertSoon = 0; // 15 minute warning

// Start check ending conditions
//m_end_checkTime = [m_fnc_end_checkTime, 10, []] call CBA_fnc_addPerFrameHandler;
//m_end_checkAlive = [m_fnc_end_checkAlive, 10, []] call CBA_fnc_addPerFrameHandler;

/*f_param_radios = ["m_param_radios",0] call BIS_fnc_getParamValue;
if (f_param_radios isEqualTo 1) then {
  // Generate frequencies for preset radios
  call m_fnc_radio_genFreqs;
};*/

/*// Create respawn markers in bottom left corner of map
{
    private _marker = createMarker [_x, [-1000,-1000,0]];
    _marker setMarkerShape "ICON";
    _marker setMarkerType "Empty";
} forEach ["respawn", "respawn_west","respawn_east","respawn_guerrila","respawn_civilian"];
*/
//====================================================================================================
m_serverInitFinished = true;

// Call mixed scripts, but only if server is not a player
if !(hasInterface) then {
    call m_fnc_init_shared;
};
