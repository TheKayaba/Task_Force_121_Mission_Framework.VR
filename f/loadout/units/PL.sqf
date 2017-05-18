m_loadout_unitLevel = 2;

// Add clothing
call m_fnc_loadout_handleClothing; // Add clothing variables above this line!
/*
// Add gear
[m_loadout_aid, "uniform"] call m_fnc_loadout_handleGear;
[m_loadout_smoke, "uniform"] call m_fnc_loadout_handleGear;
[m_loadout_grenade, "uniform"] call m_fnc_loadout_handleGear;
[m_loadout_cuffs, "item"] call m_fnc_loadout_handleGear;
[m_loadout_maptools, "item"] call m_fnc_loadout_handleGear;
[m_loadout_rifle_gl_he, "vest"] call m_fnc_loadout_handleGear;
[m_loadout_rifle_gl_smoke, "vest"] call m_fnc_loadout_handleGear;
[m_loadout_rifle_gl_flare, "vest"] call m_fnc_loadout_handleGear;
[m_loadout_rifle_mag_tracer, "backpack"] call m_fnc_loadout_handleGear;
[m_loadout_rifle_mag, "backpack"] call m_fnc_loadout_handleGear;
[m_loadout_flare, "item"] call m_fnc_loadout_handleGear;
player addWeapon m_loadout_rifle_weapon;

// Add items
m_loadout_addBinocular = "ACE_VectorDay";
call m_fnc_loadout_handleItems; // Add binocular/nvg variables above this line!
*/
missionNamespace setVariable ["m_loadoutAssigned",true]; //Place this at the end of the loadout script so other scripts can tell when the player's loadout has been set.
