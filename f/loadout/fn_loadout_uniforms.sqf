#include "cfgLoadouts.hpp"

//this disableTIEquipment true;this setVehicleAmmo 0;this addMagazineTurret ["rhs_mag_762x54mm_100",[0]];this addMagazineTurret ["rhs_mag_762x54mm_100",[0]];this addMagazineTurret ["rhs_mag_762x54mm_100",[0]];this addMagazineTurret ["rhs_mag_762x54mm_100",[0]];this addMagazineTurret ["rhs_mag_762x54mm_100",[0]];this addMagazineTurret ["rhs_mag_762x54mm_100",[0]];reload this

_lrRadio = "";
switch (side group player) do {
    case west: {
      _giveLR = ["m_loadout_blufor_lr_radio",0] call BIS_fnc_getParamValue;
      if (_giveLR isEqualTo 1) then {
        _lrRadio = "tf_rt1523g_black";
      };
    };
    case east: {
      _giveLR = ["m_loadout_opfor_lr_radio",0] call BIS_fnc_getParamValue;
      if (_giveLR isEqualTo 1) then {
        _lrRadio = "tf_mr3000_rhs";
      };
    };
    case independent: {
      _giveLR = ["m_loadout_indfor_lr_radio",0] call BIS_fnc_getParamValue;
      if (_giveLR isEqualTo 1) then {
        _lrRadio = "tf_anprc155_coyote";
      };
    };
    case civilian: {
      _giveLR = ["m_loadout_civ_lr_radio",0] call BIS_fnc_getParamValue;
      if (_giveLR isEqualTo 1) then {
        _lrRadio = "tf_anprc155_coyote";
      };
    };
    default {
      _lrRadio = "";
    };
};

switch (pUniform) do {
    case UNIFORM_MARPAT_WD: {
        m_loadout_uniform = "rhs_uniform_FROG01_wd";
        m_loadout_vest = "rhsusf_spc_rifleman";
        //m_loadout_backpack = "rhsusf_assault_eagleaiii_coy";
        m_loadout_headgear = "rhsusf_ech_helmet_marpatwd";
        if (pRole == ROLE_PL) then {
          m_loadout_vest = "rhsusf_spc_squadleader";
		  m_loadout_backpack = "tfw_ilbe_dd_coy";
		  m_loadout_headgear = "rhsusf_ech_helmet_headset_ess_marpatwd";
        };
        if (pRole == ROLE_PS) then {
          m_loadout_vest = "rhsusf_spc_squadleader";
		  m_loadout_headgear = "rhsusf_ech_helmet_headset_marpatwd";
		  m_loadout_backpack = "tfw_ilbe_dd_coy";
        };
        if (pRole == ROLE_PLRTO) then {
          m_loadout_vest = "rhsusf_spc_squadleader";
		  m_loadout_headgear = "rhsusf_ech_helmet_headset_marpatd";
		  m_loadout_backpack = "tfw_ilbe_dd_coy";
        };
        if (pRole == ROLE_SL) then {
          m_loadout_vest = "rhsusf_spc_squadleader";
		  m_loadout_headgear = "rhsusf_ech_helmet_headset_ess_marpatwd";
        };
        if (pRole == ROLE_FTL) then {
          m_loadout_vest = "rhsusf_spc_teamleader";
		  m_loadout_headgear = "rhsusf_ech_helmet_marpatwd_headset";
        };
        if (pRole == ROLE_AR) then {
          m_loadout_vest = "rhsusf_spc_mg";
        };
        if (pRole == ROLE_AAR) then {
          m_loadout_vest = "rhsusf_spc_iar";
        };
    };
    case UNIFORM_MARPAT_D: {
        m_loadout_uniform = "rhs_uniform_FROG01_d";
        m_loadout_vest = "rhsusf_spc_rifleman";
        //m_loadout_backpack = "rhsusf_assault_eagleaiii_coy";
        m_loadout_headgear = "rhsusf_ech_helmet_marpatd";
        if (pRole == ROLE_PL) then {
          m_loadout_vest = "rhsusf_spc_squadleader";
		  m_loadout_backpack = "tfw_ilbe_dd_coy";
		  m_loadout_headgear = "rhsusf_ech_helmet_headset_ess_marpatd";
        };
        if (pRole == ROLE_PS) then {
          m_loadout_vest = "rhsusf_spc_squadleader";
		  m_loadout_headgear = "rhsusf_ech_helmet_headset_marpatd";
		  m_loadout_backpack = "tfw_ilbe_dd_coy";
        };
        if (pRole == ROLE_PLRTO) then {
          m_loadout_vest = "rhsusf_spc_squadleader";
		  m_loadout_headgear = "rhsusf_ech_helmet_headset_marpatd";
		  m_loadout_backpack = "tfw_ilbe_dd_coy";
        };
        if (pRole == ROLE_SL) then {
          m_loadout_vest = "rhsusf_spc_squadleader";
		  m_loadout_headgear = "rhsusf_ech_helmet_headset_ess_marpatd";
        };
        if (pRole == ROLE_FTL) then {
          m_loadout_vest = "rhsusf_spc_teamleader";
		  m_loadout_headgear = "rhsusf_ech_helmet_marpatd_headset";
        };
        if (pRole == ROLE_AR) then {
          m_loadout_vest = "rhsusf_spc_mg";
        };
        if (pRole == ROLE_AAR) then {
          m_loadout_vest = "rhsusf_spc_iar";
        };
    };
    default {};
};
