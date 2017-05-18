//====================================================================================================
// Client init - Player is not null by this point

// Set loadouts
call m_fnc_loadout_set;

// Set the group IDs
[] call compile preprocessFileLineNumbers "f\setGroupID\f_setGroupIDs.sqf";

f_param_radios = ["m_param_radios",0] call BIS_fnc_getParamValue;
if (f_param_radios isEqualTo 1) then {
  // Preset radios
  m_radHandle1 = [m_fnc_radio_waitGear, 0.1, []] call CBA_fnc_addPerFrameHandler;
};

// Add mission boundary (disabled by default)
//m_playerBoundsCheck_PFH = [m_fnc_core_playerBoundsCheck, 5, []] call CBA_fnc_addPerFrameHandler;

// Add nametags
//m_core_showTags = [m_fnc_core_showTags, 0, []] call CBA_fnc_addPerFrameHandler;

// Time remaining display - TODO: Remove and just add this into the spectator script?
m_end_clientWait = [m_fnc_end_clientWait, 5, []] call CBA_fnc_addPerFrameHandler;

// Create briefing
[] execVM "briefing.sqf";

//Aim and fatigue
player setCustomAimCoef 0.35;
player enableStamina false;
player enableFatigue false;
player addEventhandler ["Respawn", {player enableFatigue false}];
player addEventhandler ["Respawn", {player enableStamina false}];
player addEventhandler ["Respawn", {player setCustomAimCoef 0.35}];

// Generate ORBAT page
[] execVM "f\briefing\f_orbatNotes.sqf";

// Add condition for blocking ACE features when player becomes spectator
["isnotmspectator", {
    private _return = false;
    if !(missionNamespace getVariable ["m_isSpectator",false]) then {
        _return = true;
    };
    _return
}] call ACE_common_fnc_addCanInteractWithCondition;

// Initialize variables for spectator script later on
m_spect_playerGroup = group player;
private _str = str player;
m_spect_playerGroupNumber = parseNumber (_str select [(_str find ":") + 1]);

// Add EH for kill display
//call m_fnc_core_addKilledEH;

//====================================================================================================
m_clientInitFinished = true;

// Call init function for scripts that are shared between clients and server
call m_fnc_init_shared;
