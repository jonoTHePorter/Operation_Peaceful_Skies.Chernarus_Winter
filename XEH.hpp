class Extended_PreInit_EventHandlers {
  class FPARMA_Template {
    init = "[] call compile preprocessFileLineNumbers 'fparma\XEH_preInit.sqf'";
  };
};

class Extended_PostInit_EventHandlers {
  class FPARMA_Template {
    init = "[] call compile preprocessFileLineNumbers 'fparma\XEH_postInit.sqf'";
  };
};

class Extended_InitPost_EventHandlers {
  class CAManBase {
    init = "(_this select 0) call replacer_fnc_validate;";
  };

  class ReammoBox_F {
    init = "(_this select 0) call misc_fnc_replaceSuppContents;";
  };

  class rhs_mig29s_vvsc {
    init = "(_this select 0) setObjectTexture [0, ""images\mig_00.jpg""];(_this select 0)  setObjectTexture [1, ""images\mig_01.jpg""];(_this select 0)  setObjectTexture [2, ""images\mig_02.jpg""];[(_this select 0)] call misc_fnc_respawnVic";
  };

  class B_Heli_Transport_03_F {
    init = "if (local (_this select 0)) then {[(_this select 0), 250] call ace_cargo_fnc_setSpace;[(_this select 0), 10, ""ACE_Track"", true] call ace_repair_fnc_addSpareParts;[(_this select 0), 10, ""ACE_Wheel"", true] call ace_repair_fnc_addSpareParts;};[(_this select 0)] call misc_fnc_respawnVic";
  };

  class rhs_tigr_m_msv {
    init = "[(_this select 0)] call misc_fnc_respawnVic";
  };

  class rhs_tigr_sts_vmf {
    init = "[(_this select 0)] call misc_fnc_respawnVic";
  };

  class rhs_t90a_tv {
    init = "[(_this select 0)] call misc_fnc_respawnVic";
  };

  class I_APC_Wheeled_03_cannon_F {
    init = "[(_this select 0)] call misc_fnc_respawnVic;(_this select 0) setObjectTexture [0, ""images\APC_000.paa""];(_this select 0) setObjectTexture [1, ""images\APC_001.paa""];(_this select 0) setObjectTexture [2, ""images\APC_002.paa""];(_this select 0) setObjectTexture [3, ""images\APC_003.paa""];";
  };

  class B_APC_Wheeled_01_cannon_F {
    init = "(_this select 0) setObjectTexture [0, ""images\h_apc_001.jpg""];(_this select 0) setObjectTexture [1, ""images\h_apc_000.jpg""];(_this select 0) setObjectTexture [2, ""images\h_apc_002.jpg""];";
  };

  class O_MBT_04_cannon_F {
    init = "(_this select 0) setObjectTexture [0, ""a3\armor_f_tank\mbt_04\data\mbt_04_exterior_1_co.paa""];(_this select 0) setObjectTexture [1, ""a3\armor_f_tank\mbt_04\data\mbt_04_exterior_2_co.paa""];(_this select 0) setObjectTexture [2, ""a3\armor_f\data\camonet_csat_stripe_desert_co.paa""];";
  };

  class O_Heli_Light_02_dynamicLoadout_F {
    init = "(_this select 0) setObjectTexture [0, ""a3\air_f\heli_light_02\data\heli_light_02_ext_co.paa""];";
  };

  class Wheeled_APC_F {
    init = "(_this select 0) allowCrewInImmobile true";
  };
  
  class Tank {
    init = "(_this select 0) allowCrewInImmobile true";
  };
};

class Extended_Killed_EventHandlers {
  class CAManBase {
    class fpa_jrm {
      clientKilled = "_this call fpa_jrm_fnc_handleKilled";
    };
  };
};

class Extended_Respawn_EventHandlers {
  class CAManBase {
    class fpa_jrm {
      clientRespawn = "_this call fpa_jrm_fnc_handleRespawn";
    };
  };
};