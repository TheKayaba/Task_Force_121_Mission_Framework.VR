/*


To activate add the following line to your mission's init.sqf:

    call m_fnc_sectorInit;

*/

_sectorType = 1; // 1 - Simple Sector -- 2 - Sector Control with Points

m_sector_triggerArray = [m_sector_1]; // Names of triggers separated by commas

_delay = 5; // Delay between sector checks. Lower numbers cause worse performance. Higher numbers cause longer delays for feedback to players.
