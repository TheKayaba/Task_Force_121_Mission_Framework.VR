#include "cfgLoadouts.hpp"

giveBLUFORLoadout = {
  m_loadout_rifle_mag_tracer = "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red:3";
  m_loadout_rifle_mag = "rhs_mag_30Rnd_556x45_M855A1_Stanag:6";
  if (pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL) then {
    m_loadout_rifle_weapon = "rhs_weap_m16a4_carryhandle_M203";
    m_loadout_rifle_gl_he = "1Rnd_HE_Grenade_shell:5";
    m_loadout_rifle_gl_smoke = "1Rnd_Smoke_Grenade_shell:3";
    m_loadout_rifle_gl_flare = "UGL_FlareWhite_F:3";
    m_loadout_rifle_mag_tracer = "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red:6";
    m_loadout_rifle_mag = "rhs_mag_30Rnd_556x45_M855A1_Stanag:4";
  } else { m_loadout_rifle_weapon = "rhs_weap_m16a4_carryhandle"; };
  if (pRole == ROLE_AR) then {
    m_loadout_automaticrifle_weapon = "rhs_weap_m249_pip_L";
    m_loadout_automaticrifle_mag = "rhs_200rnd_556x45_M_SAW:3";
  };
  if (pRole == ROLE_AAR) then {
    m_loadout_automaticrifle_mag = "rhs_200rnd_556x45_M_SAW";
  };
  if (pRole == ROLE_MG) then {
    m_loadout_mmg_weapon = "rhs_weap_m240G";
    m_loadout_mmg_mag = "rhsusf_100Rnd_762x51_m80a1epr:3";
  };
  if (pRole == ROLE_AM) then {
    m_loadout_rifle_mag_tracer = "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red:5";
    m_loadout_rifle_mag = "rhs_mag_30Rnd_556x45_M855A1_Stanag:4";
    m_loadout_mmg_mag = "rhsusf_100Rnd_762x51_m80a1epr:3";
  };
  if (pRole == ROLE_RAT) then {
    m_loadout_antitank_weapon = "rhs_weap_M136_hedp";
    m_loadout_antitank_mag = "rhs_m136_hedp_mag";
  };
  if (pRole == ROLE_AT) then {
    m_loadout_mediumantitank_weapon = "rhs_weap_smaw";
    m_loadout_mediumantitank_mag = "rhs_mag_smaw_HEDP";
  };
  if (pRole == ROLE_AAT) then {
    m_loadout_mediumantitank_mag = "rhs_mag_smaw_HEDP";
  };
  m_loadout_flare = "rhs_weap_rsp30_white:3";
  m_loadout_addAttachment = "rhsusf_acc_wmx";
};

giveOPFORLoadout = {
  m_loadout_rifle_mag_tracer = "rhs_30Rnd_545x39_AK_green:3";
  m_loadout_rifle_mag = "rhs_30Rnd_545x39_AK:6";
  if (pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL) then {
    m_loadout_rifle_weapon = "rhs_weap_ak74m_gp25";
    m_loadout_rifle_gl_he = "rhs_VOG25:5";
    m_loadout_rifle_gl_smoke = "rhs_GRD40_White:3";
    m_loadout_rifle_gl_flare = "rhs_VG40OP_white:3";
    m_loadout_rifle_mag_tracer = "rhs_30Rnd_545x39_AK_green:6";
    m_loadout_rifle_mag = "rhs_30Rnd_545x39_AK:4";
  } else { m_loadout_rifle_weapon = "rhs_weap_ak74m"; };
  if (pRole == ROLE_AR) then {
    m_loadout_automaticrifle_weapon = "rhs_weap_pkm";
    m_loadout_automaticrifle_mag = "rhs_100Rnd_762x54mmR_green:3";
  };
  if (pRole == ROLE_AAR) then {
    m_loadout_automaticrifle_mag = "rhs_100Rnd_762x54mmR_green:3";
  };
  if (pRole == ROLE_MG) then {
    m_loadout_mmg_weapon = "rhs_weap_pkp";
    m_loadout_mmg_mag = "rhs_100Rnd_762x54mmR_green:3";
  };
  if (pRole == ROLE_AM) then {
    m_loadout_rifle_mag_tracer = "rhs_30Rnd_545x39_AK_green:5";
    m_loadout_rifle_mag = "rhs_30Rnd_545x39_AK:4";
    m_loadout_mmg_mag = "rhs_100Rnd_762x54mmR_green:3";
  };
  if (pRole == ROLE_RAT) then {
    m_loadout_antitank_weapon = "rhs_weap_rpg7";
    m_loadout_antitank_mag = "rhs_rpg7_PG7VL_mag";
  };
  if (pRole == ROLE_AT) then {
    m_loadout_mediumantitank_weapon = "rhs_weap_rpg7";
    m_loadout_mediumantitank_mag = "rhs_rpg7_PG7VR_mag";
  };
  if (pRole == ROLE_AAT) then {
    m_loadout_mediumantitank_mag = "rhs_rpg7_PG7VR_mag";
  };
  m_loadout_flare = "rhs_weap_rsp30_white:3";
  m_loadout_addAttachment = "rhs_acc_2dpZenit";
};

switch (pWeapons) do {
    case WEAPONS_M16A4_M249_M240G_M136_SMAW: {
        [] call giveBLUFORLoadout;
    };
    case WEAPONS_M4A1_M249_M240G_M136_SMAW: {
        [] call giveBLUFORLoadout;
        if (pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL) then {
          m_loadout_rifle_weapon = "rhs_weap_m4a1_carryhandle_m203";
        } else { m_loadout_rifle_weapon = "rhs_weap_m4a1_carryhandle"; };
    };
    case WEAPONS_HK416D10_M249_M240G_M136_SMAW: {
        [] call giveBLUFORLoadout;
        if (pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL) then {
          m_loadout_rifle_weapon = "rhs_weap_hk416d10_m320";
        } else { m_loadout_rifle_weapon = "rhs_weap_hk416d10"; };
    };
    case WEAPONS_HKG36C_M249_M240G_M136_SMAW: {
        [] call giveBLUFORLoadout;
        m_loadout_rifle_mag_tracer = "rhssaf_30rnd_556x45_Tracers_G36:3";
        m_loadout_rifle_mag = "rhssaf_30rnd_556x45_EPR_G36:6";

        if (pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL) then {
          m_loadout_rifle_weapon = "rhs_weap_g36kv_ag36";
          m_loadout_rifle_mag_tracer = "rhssaf_30rnd_556x45_Tracers_G36:6";
          m_loadout_rifle_mag = "rhssaf_30rnd_556x45_EPR_G36:4";
        } else { m_loadout_rifle_weapon = "rhs_weap_g36c"; };

        if (pRole == ROLE_AM) then {
          m_loadout_rifle_mag_tracer = "rhssaf_30rnd_556x45_Tracers_G36:5";
          m_loadout_rifle_mag = "rhssaf_30rnd_556x45_EPR_G36:4";
        };
    };

    case WEAPONS_AK74M_PKM_PKP_RPG7: {
        [] call giveOPFORLoadout;
    };
    case WEAPONS_AK74M_WOODCAMO_PKM_PKP_RPG7: {
        [] call giveOPFORLoadout;
        if (pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL) then {
          m_loadout_rifle_weapon = "rhs_weap_ak74m_gp25";
        } else { m_loadout_rifle_weapon = "rhs_weap_ak74m_camo"; };
    };
    case WEAPONS_AKM762_PKM_PKP_RPG7: {
        [] call giveOPFORLoadout;
        m_loadout_rifle_mag_tracer = "rhs_30Rnd_762x39mm:3";
        m_loadout_rifle_mag = "rhs_30Rnd_762x39mm:6";
        if (pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL) then {
          m_loadout_rifle_weapon = "rhs_weap_akm_gp25";
          m_loadout_rifle_mag_tracer = "rhs_30Rnd_762x39mm:6";
          m_loadout_rifle_mag = "rhs_30Rnd_762x39mm:4";
        } else { m_loadout_rifle_weapon = "rhs_weap_akm"; };
        if (pRole == ROLE_AM) then {
          m_loadout_rifle_mag_tracer = "rhs_30Rnd_762x39mm:5";
          m_loadout_rifle_mag = "rhs_30Rnd_762x39mm:4";
        };
    };
    case WEAPONS_MOSIN_PKM_RSHG2_RPG7: {
        [] call giveOPFORLoadout;
        m_loadout_rifle_weapon = "rhs_weap_m38";
        if (pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL) then {
          m_loadout_rifle_gl_he = "";
          m_loadout_rifle_gl_smoke = "";
          m_loadout_rifle_gl_flare = "";
        };
        m_loadout_rifle_mag_tracer = "";
        m_loadout_rifle_mag = "rhsgref_5Rnd_762x54_m38:8";
        if (pRole == ROLE_RAT) then {
          m_loadout_antitank_weapon = "rhs_weap_rshg2";
          m_loadout_antitank_mag = "rhs_rshg2_mag";
        };
    };
    case WEAPONS_KAR98K_PKM_RSHG2_RPG7: {
        [] call giveOPFORLoadout;
        m_loadout_rifle_weapon = "rhs_weap_kar98k";
        if (pRole == ROLE_PL || pRole == ROLE_SL || pRole == ROLE_TL || pRole == ROLE_MGTL) then {
          m_loadout_rifle_gl_he = "";
          m_loadout_rifle_gl_smoke = "";
          m_loadout_rifle_gl_flare = "";
        };
        m_loadout_rifle_mag_tracer = "";
        m_loadout_rifle_mag = "rhsgref_5Rnd_792x57_kar98k:8";
        if (pRole == ROLE_RAT) then {
          m_loadout_antitank_weapon = "rhs_weap_rshg2";
          m_loadout_antitank_mag = "rhs_rshg2_mag";
        };
    };
    case WEAPONS_UNARMED: {
        m_loadout_rifle_weapon = "";
        m_loadout_rifle_gl_weapon = "";
        m_loadout_rifle_mag = "";
        m_loadout_rifle_mag_tracer = "";
        m_loadout_rifle_gl_he = "";
        m_loadout_rifle_gl_smoke = "";
        m_loadout_rifle_gl_flare = "";
        m_loadout_automaticrifle_weapon = "";
        m_loadout_automaticrifle_mag = "";
        m_loadout_mmg_weapon = "";
        m_loadout_mmg_mag = "";
        m_loadout_antitank_weapon = "";
        m_loadout_antitank_mag = "";
        m_loadout_mediumantitank_weapon = "";
        m_loadout_mediumantitank_mag = "";
        m_loadout_cuffs = "";
        m_loadout_smoke = "";
        m_loadout_flare = "";
        m_loadout_defusalkit = "";
        m_loadout_trigger = "";
        m_loadout_entrenching = "";
        m_loadout_grenade = "";
        m_loadout_explosives = "";
    };
    case WEAPONS_SDAR_UNDERWATER: {
        m_loadout_rifle_weapon = "arifle_SDAR_F";
        m_loadout_rifle_gl_he = "";
        m_loadout_rifle_gl_smoke = "";
        m_loadout_rifle_gl_flare = "";
        m_loadout_rifle_mag_tracer = "20Rnd_556x45_UW_mag:4";
        m_loadout_rifle_mag = "30Rnd_556x45_Stanag:6";
        if (pRole == ROLE_AR) then {
          m_loadout_automaticrifle_weapon = "rhs_weap_m249_pip_L";
          m_loadout_automaticrifle_mag = "rhs_200rnd_556x45_M_SAW:3";
        };
        if (pRole == ROLE_AAR) then { m_loadout_automaticrifle_mag = "rhs_200rnd_556x45_M_SAW:2"; };
        if (pRole == ROLE_MG) then {
          m_loadout_mmg_weapon = "rhs_weap_m240G";
          m_loadout_mmg_mag = "rhsusf_100Rnd_762x51_m80a1epr:3";
        };
        if (pRole == ROLE_AM) then { m_loadout_mmg_mag = "rhsusf_100Rnd_762x51_m80a1epr:3"; };
        if (pRole == ROLE_RAT) then {
          m_loadout_antitank_weapon = "rhs_weap_M136_hedp";
          m_loadout_antitank_mag = "rhs_m136_hedp_mag";
        };
        if (pRole == ROLE_AT) then {
          m_loadout_mediumantitank_weapon = "rhs_weap_smaw";
          m_loadout_mediumantitank_mag = "rhs_mag_smaw_HEDP";
        };
        if (pRole == ROLE_AAT) then { m_loadout_mediumantitank_mag = "rhs_mag_smaw_HEDP"; };
        if (pRole == ROLE_CE) then { m_loadout_explosives = "SatchelCharge_Remote_Mag"; };
        m_loadout_entrenching = "";
        m_loadout_flare = "rhs_weap_rsp30_white:3";
    };
    default {};
};
