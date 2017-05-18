// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// MAKE SURE THE PLAYER INITIALIZES PROPERLY

if (hasInterface && (isNull player)) then
{
    waitUntil {sleep 0.1; !isNull player};
};

// ====================================================================================
// Create Phalanx Diary Entry
ORBAT_Diary = player createDiarySubject ["ORBAT_Diary", "ORBAT"];
M_Diary = player createDiarySubject ["M_Diary", "[TF121] Misc Info"];

// ====================================================================================
// BRIEFING: ADMIN
// The following block of code executes only if the player is the current host
// it automatically includes a file which contains the appropriate briefing data.

if (isMultiplayer) then {
    if (serverCommandAvailable "#kick") then {
        #include "f\briefing\f_briefing_admin.sqf"
    };
} else {
    #include "f\briefing\f_briefing_admin.sqf"
};
// ====================================================================================
