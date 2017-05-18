// Add clothing
call m_fnc_loadout_handleClothing; // Add clothing variables above this line!
/*
// Add gear
[m_loadout_smoke, "uniform"] call m_fnc_loadout_handleGear;
[m_loadout_grenade, "uniform"] call m_fnc_loadout_handleGear;
[m_loadout_cuffs, "item"] call m_fnc_loadout_handleGear;
[m_loadout_rifle_mag_tracer, "vest"] call m_fnc_loadout_handleGear;
[m_loadout_rifle_mag, "vest"] call m_fnc_loadout_handleGear;
[m_loadout_bandage, "backpack"] call m_fnc_loadout_handleGear;
[m_loadout_morphine, "backpack"] call m_fnc_loadout_handleGear;
[m_loadout_epinephrine, "backpack"] call m_fnc_loadout_handleGear;
[m_loadout_blood, "backpack"] call m_fnc_loadout_handleGear;
player addWeapon m_loadout_rifle_weapon;

// Add items
call m_fnc_loadout_handleItems; // Add binocular/nvg variables above this line!
*/
missionNamespace setVariable ["m_loadoutAssigned",true]; //Place this at the end of the loadout script so other scripts can tell when the player's loadout has been set.
