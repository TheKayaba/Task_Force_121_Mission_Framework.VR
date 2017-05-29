waitUntil {!isNull player};

//Aim and fatigue
player setCustomAimCoef 0.35;
player enableStamina false;
player enableFatigue false;

//Safe zone. first param = marker name : second param = radius
["safe",150,"You Have Entered The Safe Zone","You Have Left The Safe Zone",1] exec "misc\NoKillZone.Sqs";

M_Diary = player createDiarySubject ["M_Diary", "[TF121] Misc Info"];

[] execVM "briefing\f_commsPlan.sqf";