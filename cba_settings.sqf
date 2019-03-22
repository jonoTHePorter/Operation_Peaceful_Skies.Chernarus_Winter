#include "config_mission.hpp"

force ace_medical_preventInstaDeath = CFG_PREVENT_INSTANT_DEATH;
force ace_medical_playerDamageThreshold = CFG_PLAYER_DAMAGE_TRESHOLD;

force ace_map_BFT_Enabled = false;
force force ace_advanced_fatigue_enabled = false;

// ACE Medical
force ace_medical_level = 2; // Advanced
force ace_medical_useCondition_PAK = 1; // Pak Condition Stable

force ace_medical_blood_enabledFor = 2; //Enable Blood Drops (Enabled)
force ace_medical_medicSetting = 1; //Medic Setting (Normal)
force ace_medical_increaseTrainingInLocations = true; //Location Boost Training (Yes)
force ace_medical_enableFor = 0; //Enabled for (Player only)
force ace_medical_enableOverdosing = false; //Overdosing (No)
force ace_medical_enableAdvancedWounds = false; //Advanced Wounds (No)
force ace_medical_enableScreams = true; //Enable Screams (Yes)
force ace_medical_enableVehicleCrashes = true; //Vehicle Crashes (Yes)
force ace_medical_remoteControlledAI = true; //Treat Remote Controlled AI as AI (Yes)
force ace_medical_allowLitterCreation = true; //Enable Litter (Yes)
force ace_medical_litterCleanUpDelay = 300; //Litter Lifetime (300 seconds)
force ace_medical_litterSimulationDetail = 2; //Litter Simulation Level (Medium)
force ace_medical_medicSetting_basicEpi = 0; //Allow Epinephrine (Everyone)
force ace_medical_medicSetting_PAK = 0; //Allow PAK (Everyone)
force ace_medical_useLocation_basicEpi = 0; //Allow Epi-pen (Everyone)
force ace_medical_useLocation_PAK = 0; //Allow PAK Location (Everywhere)
force ace_medical_useLocation_SurgicalKit = 4; //Allow Surgical Kit Location (Disabled)
force ace_medical_healHitPointAfterAdvBandage = true; //Bandages Heal Crippling (Yes)
force ace_medical_keepLocalSettingsSynced = true; //Keep Unit Synced (Yes)
force ace_medical_painIsOnlySuppressed = false; //Only Suppress Pain (No)
force ace_medical_allowUnconsciousAnimationOnTreatment = true; //Unconscious Animation On Treatment (Yes)
force ace_medical_moveUnitsFromGroupOnUnconscious = false; //Move Unconscious Units From Group (No)
force ace_medical_ai_enabledFor = 2; //Medical AI Enabled (Yes)
force ace_medical_delayUnconCaptive = 2; //Delay AI Cease Fire (2 seconds)
force ace_medical_menu_allow = 1; //Allow Medical Menu (Yes)
force ace_medical_menu_useMenu = 1; //Use Medical Menu (Yes)
force ace_medical_menu_maxRange = 5; //Medical Menu Max Range (5 meters)

force ace_medical_bleedingCoefficient = 1; //Bleeding Coefficient (1)
force ace_medical_painCoefficient = 1; //Pain Coefficient (1)
force ace_medical_AIDamageThreshold = 1; //AI Damage Threshold (1)
force ace_medical_enableUnconsciousnessAI = 0; //AI Unconsciousness (Disabled)

force ace_medical_amountOfReviveLives = -1; //Revive Lives (None)
force ace_medical_enableRevive = 0; //Enable Revive (Disabled)
force ace_medical_maxReviveTime = 600; //Max Revive Time (600 seconds)
force ace_medical_consumeItem_PAK = 0; //Consume PAK (No)
force ace_medical_useCondition_PAK = 0; //Condition PAK (Anytime)

force ace_medical_consumeItem_SurgicalKit = 0; //Consume Surgical Kit (No)
force ace_medical_medicSetting_SurgicalKit = 1; //Allow Surgical Kit (Medics Only)
force ace_medical_useCondition_SurgicalKit = 0; //Condition Surgical Kit (Anytime)
force ace_medical_painEffectType = 0; //Pain Effect Type (Color Flashing)
force ace_medical_menuTypeStyle = 0; //Style of Medical Menu (3d Selection)
force ace_medical_menu_openAfterTreatment = true; //Reopen Medical Menu (Yes)

// ACE Zeus
force ace_zeus_zeusAscension = false;
force ace_zeus_zeusBird = false;
force ace_zeus_remoteWind = false;
force ace_zeus_radioOrdnance = false;
force ace_zeus_revealMines = 0;
force ace_zeus_autoAddObjects = true;

// UO Framework Settings
force UO_FW_Server_AcreModule_Allowed = false;
force UO_FW_Server_AIDriversModule_Allowed = false;
force UO_FW_Server_AILink_Allowed = false;
force UO_FW_Server_AntiNDModule_Allowed = false;
force UO_FW_Server_AOLimit_Allowed = false;
force UO_FW_Server_AutoTrackAssetModule_Allowed = false;
force UO_FW_Server_Briefing_Allowed = false;
force UO_FW_Server_CaptureZoneModule_Allowed = false;
force UO_FW_Server_CoverMapModule_Allowed = false;
force UO_FW_Server_DEBUG_Allowed = false;
force UO_FW_Server_DisconnectModule_Allowed = false;
force UO_FW_Server_EndConditionModule_Allowed = false;
force UO_FW_Server_FireMissionModule_Allowed = false;
force UO_FW_Server_Framework_Allowed = false;
force UO_FW_Server_GearModule_Allowed = false;
force UO_FW_Server_HCModule_Allowed = false;
force UO_FW_Server_HostageModule_Allowed = false;
force UO_FW_Server_JiPModule_Allowed = false;
force UO_FW_Server_MarkerControlModule_Allowed = false;
force UO_FW_Server_RemoverModule_Allowed = false;
force UO_FW_Server_SafeStartModule_Allowed = false;
force UO_FW_Server_SelfActionsModule_Allowed = false;
force UO_FW_Server_SetupModule_Allowed = false;
force UO_FW_Server_ShotCountModule_Allowed = false;
force UO_FW_Server_StartInParachuteModule_Allowed = false;
force UO_FW_Server_StartTextModule_Allowed = false;
force UO_FW_Server_TeamColourModule_Allowed = false;

// ACE Cookoff
force force ace_cookoff_enable = false;
force ace_cookoff_enableAmmobox = true;
force ace_cookoff_enableAmmoCookoff = true;
force ace_cookoff_ammoCookoffDuration = 0.2;
force ace_cookoff_probabilityCoef = 0.75;

// ACE Hearing
force ace_hearing_autoAddEarplugsToUnits = true;
force ace_hearing_disableEarRinging = true;
force ace_hearing_earplugsVolume = 1;
force ace_hearing_enableCombatDeafness = false;
force ace_hearing_enabledForZeusUnits = false;
force ace_hearing_unconsciousnessVolume = 0.4;

// ACE Rearm
force ace_rearm_level = 1;
force ace_rearm_supply = 1;

// ACE Logistics
force ace_cargo_paradropTimeCoefficent = 0.2;

// ACEX Headless
force acex_headless_delay = 60;
force acex_headless_enabled = true;
force acex_headless_endMission = 2;
force acex_headless_log = false;
force acex_headless_transferLoadout = 1;
