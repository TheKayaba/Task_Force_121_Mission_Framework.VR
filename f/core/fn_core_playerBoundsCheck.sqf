// Check if player is out of bounds - Requires a trigger named 'm_missionAreaTrig' to exist
_playerInBounds = [m_missionAreaTrig, player] call BIS_fnc_inTrigger;
if (isNil "m_playerWarnedCount") then {m_playerWarnedCount = 0};
if (!_playerInBounds && {isNil "m_isSpectator"}) then {
    m_playerWarnedCount = m_playerWarnedCount + 1;
    titleText ["WARNING!\n\nYou are outside of the mission area. Return immediately or YOU WILL BE KILLED!","PLAIN"];
    //Give player 5 iterations to get back into the playable area
    if (m_playerWarnedCount > 5) then {
        player setDamage 1;
    };
} else {
    //reset player warning count since he's back in bounds
    if (m_playerWarnedCount > 0) then {
        titleText ["","PLAIN DOWN",0.1];
        m_playerWarnedCount = 0;
    };
    //player is a spectator, exit this PFH loop
    if (!isNil "m_isSpectator") then {
        [m_playerBoundsCheck_PFH] call CBA_fnc_removePerFrameHandler;
    };
};