waitUntil {!isNull player};

//Aim and fatigue
player setFatigue 0;
player enableFatigue false;
player enableStamina false;
player setCustomAimCoef 0.35;
player addEventhandler ["Respawn", {player enableFatigue false}];
player addEventhandler ["Respawn", {player enableStamina false}];
player addEventhandler ["Respawn", {player setCustomAimCoef 0.35}];

//Comms plan
M_Diary = player createDiarySubject ["M_Diary", "[TF121] Misc Info"];

[] execVM "briefing\f_commsPlan.sqf";

hint "Player Initialized";

sleep 3;

_pNAme = name player;

hint format ["Welcome, %1",_pName];