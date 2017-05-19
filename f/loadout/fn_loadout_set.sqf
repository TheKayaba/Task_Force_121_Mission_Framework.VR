if (!hasInterface) exitWith {};

// Ensure script is run only once.
if (!isNil "m_loadoutAssigned") exitWith {};
m_loadoutAssigned = false;

#include "cfgLoadouts.hpp"

private _char = toLower (typeOf player);

//Get radio and map parameters from the slot screen. If the parameters don't exist then they default to giving everybody a map and radio.
m_loadout_radio = ["m_loadout_radio",0] call BIS_fnc_getParamValue;
m_loadout_map = ["m_loadout_map",0] call BIS_fnc_getParamValue;
m_loadout_gps = ["m_loadout_gps",0] call BIS_fnc_getParamValue;
m_loadout_watch = ["m_loadout_watch",0] call BIS_fnc_getParamValue;
m_loadout_compass = ["m_loadout_compass",0] call BIS_fnc_getParamValue;
m_loadout_aid = "FirstAidKit:2";
m_loadout_smoke = "SmokeShell:4";
m_loadout_grenade = "HandGrenade:2";
m_loadout_cuffs = "ACE_CableTie:2";
m_loadout_explosives = "SatchelCharge_Remote_Mag:2";
m_loadout_defusalkit = "ACE_DefusalKit";
m_loadout_trigger = "ACE_Clacker";
m_loadout_bandage = "ACE_fieldDressing:32";
m_loadout_morphine = "ACE_morphine:16";
m_loadout_epinephrine = "ACE_epinephrine:8";
m_loadout_blood = "ACE_bloodIV:2";
m_loadout_maptools = "ACE_MapTools";
m_loadout_entrenching = "ACE_EntrenchingTool";

/*
    Acceptable Values for unit level:
    0 - Regular unit
    1 - Team Leader
    2 - Squad Leader or Higher

    Set the default unit level          */
m_loadout_unitLevel = 0;

private _loadout = ["m_loadout_modSet",1] call BIS_fnc_getParamValue;
_loadout = switch (_loadout) do {
    case 0: {"Vanilla"}; // Vanilla A3
    case 1: {"RHS"}; // RHS
    default {"RHS"};
};

//====================================================================================================
// Get the default gear settings for each side
switch (side group player) do {
    case west: {
      pUniform = ["m_loadout_blufor_uniform",0] call BIS_fnc_getParamValue;
      pWeapons = ["m_loadout_blufor_weapons",0] call BIS_fnc_getParamValue;
    };
    case east: {
      pUniform = ["m_loadout_opfor_uniform",0] call BIS_fnc_getParamValue;
      pWeapons = ["m_loadout_opfor_weapons",0] call BIS_fnc_getParamValue;
    };
    case independent: {
      pUniform = ["m_loadout_indfor_uniform",0] call BIS_fnc_getParamValue;
      pWeapons = ["m_loadout_indfor_weapons",0] call BIS_fnc_getParamValue;
    };
    case civilian: {
      pUniform = ["m_loadout_civ_uniform",0] call BIS_fnc_getParamValue;
      pWeapons = ["m_loadout_civ_weapons",0] call BIS_fnc_getParamValue;
    };
    default {
      pUniform = 0;
      pWeapons = 0;
    };
};

// Default role is rifleman
pRole = ROLE_RF;

if (_char == UNIT_PL) then {
	pRole = ROLE_PL;
};
if (_char == UNIT_PS) then {
	pRole = ROLE_PS;
};
if (_char == UNIT_PLRTO) then {
	pRole = ROLE_PLRTO;
};
if (_char == UNIT_SL) then {
	pRole = ROLE_SL;
};
if (_char == UNIT_FTL) then {
	pRole = ROLE_FTL;
};
if (_char == UNIT_ARM27) then {
	pRole = ROLE_ARM27;
};
if (_char == UNIT_AARM27) then {
	pRole = ROLE_AARM27;
};
if (_char == UNIT_SPECTATOR) then {
	pRole = ROLE_SPECTATOR;
};

/*if (_char == UNIT_SPECTATOR) then {
      pRole = ROLE_SPECTATOR;
} else {

if (_char == UNIT_OPFOR_PL ||
    _char == UNIT_PL ||
    _char == UNIT_INDFOR_PL) then {
      pRole = ROLE_PL;
} else {

if (_char == UNIT_OPFOR_CLS ||
    _char == UNIT_PS ||
    _char == UNIT_INDFOR_CLS) then {
      pRole = ROLE_PS;
} else {

if (_char == UNIT_OPFOR_SL ||
    _char == UNIT_PLRTO ||
    _char == UNIT_INDFOR_SL) then {
      pRole = ROLE_PLRTO;
} else {

if (_char == UNIT_OPFOR_TL ||
    _char == UNIT_SL ||
    _char == UNIT_INDFOR_TL) then {
      pRole = ROLE_SL;
} else {

if (_char == UNIT_OPFOR_AR ||
    _char == UNIT_FTL ||
    _char == UNIT_INDFOR_AR) then {
      pRole = ROLE_FTL;
} else {

if (_char == UNIT_OPFOR_AAR ||
    _char == UNIT_ARM27 ||
    _char == UNIT_INDFOR_AAR) then {
      pRole = ROLE_ARM27;
} else {

if (_char == UNIT_OPFOR_RAT ||
    _char == UNIT_AARM27 ||
    _char == UNIT_INDFOR_RAT) then {
      pRole = ROLE_AARM27;
} else {

if (_char == UNIT_OPFOR_CE ||
    _char == UNIT_RF ||
    _char == UNIT_INDFOR_CE) then {
      pRole = ROLE_RF;
} else {

if (_char == UNIT_OPFOR_R ||
    _char == UNIT_BLUFOR_R ||
    _char == UNIT_INDFOR_R ||
    _char == UNIT_CIV_R) then {
      pRole = ROLE_R;
} else {

if (_char == UNIT_OPFOR_MG ||
    _char == UNIT_BLUFOR_MG ||
    _char == UNIT_INDFOR_MG) then {
      pRole = ROLE_MG;
} else {

if (_char == UNIT_OPFOR_AM ||
    _char == UNIT_BLUFOR_AM ||
    _char == UNIT_INDFOR_AM) then {
      pRole = ROLE_AM;
} else {

if (_char == UNIT_OPFOR_MGTL ||
    _char == UNIT_BLUFOR_MGTL ||
    _char == UNIT_INDFOR_MGTL) then {
      pRole = ROLE_MGTL;
} else {

if (_char == UNIT_OPFOR_AT ||
    _char == UNIT_BLUFOR_AT ||
    _char == UNIT_INDFOR_AT) then {
      pRole = ROLE_AT;
} else {

if (_char == UNIT_OPFOR_AAT ||
    _char == UNIT_BLUFOR_AAT ||
    _char == UNIT_INDFOR_AAT) then {
      pRole = ROLE_AAT;
} else {

if (_char == UNIT_OPFOR_P ||
    _char == UNIT_BLUFOR_P ||
    _char == UNIT_INDFOR_P) then {
      pRole = ROLE_P;
} else {

if (_char == UNIT_OPFOR_CR ||
    _char == UNIT_BLUFOR_CR ||
    _char == UNIT_INDFOR_CR) then {
      pRole = ROLE_CR;
} else {

if (_char == UNIT_OPFOR_MK ||
    _char == UNIT_BLUFOR_MK ||
    _char == UNIT_INDFOR_MK) then {
      pRole = ROLE_MK;
};

}; //end ROLE_CR
}; //end ROLE_P
}; //end ROLE_AAT
}; //end ROLE_AT
}; //end ROLE_MGTL
}; //end ROLE_AM
}; //end ROLE_MG
}; //end ROLE_R
}; //end ROLE_CE
}; //end ROLE_RAT
}; //end ROLE_AAR
}; //end ROLE_AR
}; //end ROLE_TL
}; //end ROLE_SL
}; //end ROLE_CLS
}; //end ROLE_PL
}; //end ROLE_SPECTATOR*/

// Determine uniform and weapons
[] call compile preprocessFileLineNumbers format["f\loadout\fn_loadout_uniforms.sqf"];
[] call compile preprocessFileLineNumbers format["f\loadout\fn_loadout_weapons.sqf"];

// Add stuff
[{
params ["_args", "_handle"];
_args params ["_addGearTime","_frameAdded","_char", "_loadout"];

if (diag_tickTime > _addGearTime && {diag_frameNo-10 > _frameAdded}) then {

//removeAllWeapons player;
//removeGoggles player;

[_handle] call CBA_fnc_removePerFrameHandler;

switch (pRole) do {
    //----------------------------------------
    // REDFOR - CSAT/EAST - OPF_F
    case ROLE_PL: {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\PL.sqf"]
    };
    case ROLE_PS: {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\PS.sqf"]
    };
    case ROLE_PLRTO: {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\PLRTO.sqf"]
    };
    case ROLE_SL: {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\SL.sqf"]
    };
    case ROLE_FTL: {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\FTL.sqf"]
    };
    case ROLE_ARM27: {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\ARM27.sqf"]
    };
    case ROLE_AARM27: {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\AARM27.sqf"]
    };
    case ROLE_RF: {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\RF.sqf"]
    };
    case ROLE_MG: {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\MG.sqf"]
    };
    case ROLE_RAT: {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\RAT.sqf"]
    };
    case ROLE_AM: {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\AM.sqf"]
    };
    case ROLE_MGTL: {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\MGTL.sqf"]
    };
    case ROLE_AT: {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\AT.sqf"]
    };
    case ROLE_AAT: {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\AAT.sqf"]
    };
    case ROLE_P: {
        [] call compile preprocessFileLineNumbers format["f\loadout\units\P.sqf"]
    };

    //----------------------------------------
    // Spectator Slots
    case ROLE_SPECTATOR: {
        player forceAddUniform "U_I_Protagonist_VR";
        player linkItem "ItemMap";
        missionNamespace setVariable ["m_loadoutAssigned",true];

        // Waits until mission starts and then forces player into F3 spectator instead of EG spectator
        [{(CBA_missionTime > 0) && {(!isNull player)} && {(cameraOn isEqualTo player)}}, {
            [{
                [player, objNull, 0, 0, true] call f_fnc_camInit;
            }] call CBA_fnc_execNextFrame;
        }] call CBA_fnc_waitUntilAndExecute;
    };

    //----------------------------------------
    // Error message - Classname not found in list
    default {diag_log format["m fn_loadout_set: Unable to find player classname in list: %1",_char];};
};

// Generate loadout briefing page.
//call m_fnc_loadout_notes;
};
}, 0, [(diag_tickTime+2.5),diag_frameno,_char,_loadout]] call CBA_fnc_addPerFrameHandler;
