// Add clothing
call m_fnc_loadout_handleClothing; // Add clothing variables above this line!

// Add gear
for "_i" from 1 to 2 do {player addItemToUniform "FirstAidKit";};
for "_i" from 1 to 4 do {player addItemToUniform "SmokeShell";};
player addItemToUniform "1Rnd_HE_Grenade_shell";
for "_i" from 1 to 8 do {player addItemToVest "1Rnd_HE_Grenade_shell";};
for "_i" from 1 to 4 do {player addItemToVest "1Rnd_Smoke_Grenade_shell";};
for "_i" from 1 to 4 do {player addItemToVest "UGL_FlareWhite_F";};
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
for "_i" from 1 to 4 do {player addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";};
for "_i" from 1 to 9 do {player addItemToBackpack "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
player addWeapon "rhs_weap_m16a4_carryhandle_M203";
for "_i" from 1 to 2 do {player addItem "ACE_CableTie";};

// Add items
call m_fnc_loadout_handleItems; // Add binocular/nvg variables above this line!

missionNamespace setVariable ["m_loadoutAssigned",true]; //Place this at the end of the loadout script so other scripts can tell when the player's loadout has been set.
