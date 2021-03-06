btc_custom_loc = [
/*
    DESCRIPTION: [POS(Array),TYPE(String),NAME(String),RADIUS (Number),IS OCCUPIED(Bool)]
    Possible types: "NameVillage","NameCity","NameCityCapital","NameLocal","Hill","Airport","NameMarine", "StrongpointArea", "BorderCrossing", "VegetationFir"
    EXAMPLE: [[13132.8,3315.07,0.00128174],"NameVillage","Mountain 1",800,true]
*/
];

/*
    Here you can specify which equipment should be added or removed from the arsenal.
    Please take care that there are different categories (weapons, magazines, items, backpacks) for different pieces of equipment into which you have to classify the classnames.
    In all cases, you need the classname of an object.

    Attention: The function of these lists depends on the setting in the mission parameter (Restrict arsenal).
        - "Full": here you have only the registered items in the arsenal available.
        - "Remove only": here all registered items are removed from the arsenal. This only works for the ACE3 arsenal!

    Example(s):
        private _weapons = [
            "arifle_MX_F",          //Classname for the rifle MX
            "arifle_MX_SW_F",       //Classname for the rifle MX LSW
            "arifle_MXC_F"          //Classname for the rifle MXC
        ];

        private _items = [
            "G_Shades_Black",
            "G_Shades_Blue",
            "G_Shades_Green"
        ];
*/
private _weapons = [ // Edited: Remove imbanlance, useless or buggy equipments
    "hlc_rifle_mk18mod0", // This weapon has no fire sound
    "SMA_ACRREMAFGblk_N", // These weapons do not have valid textures
    "SMA_Mk16_EGLM",
    "SMA_MK16_EGLM_black",
    "SMA_MK16_EGLM_Green",
    "LMG_min_rf_6p69", // These weapons do not have corresponding magazines in arsenal
    "LMG_min_rf_6p69_camo",
    "LMG_min_rf_6p69_desert",
    "LMG_Zafir_F",
    "LMG_Zafir_Winter_F",
    "TEC_LMG_Zafir_Black",
    "QBZ95_1", // These weapons have buggy magazines
    "QBZ95_1_DF",
    "USSR_GuitarA", // Guitar will cause player stand up inside vehicles
    "TR_CXS_Baglama"
];
private _magazines = [
    "Titan_AP"
];
private _items = [
    "USP_CRYE_G3C_CUT_DCU_MC", // This uniform does not have valid textures
    "WINTER_VIPER_SUIT_GREY", // These uniforms are invincible with ACE Medical System
    "WINTER_VIPER_SUIT_HEX",
    "WINTER_VIPER_SUIT_WHITE",
    "ACE_optic_Arco_PIP", // These PIP optics will cause significant fps drop on players who are next to the optic user
    "ACE_optic_Hamr_PIP",
    // "H_HelmetO_ViperSP_hex_F",
    // "H_HelmetO_ViperSP_ghex_F",
    // "NVGogglesB_gry_F",
    // "NVGogglesB_grn_F",
    // "NVGogglesB_blk_F",
    "O_IR_Grenade", // These OPFOR items are not functional for BLUFOR units
    "I_IR_Grenade",
    "O_R_IR_Grenade",
    "I_E_IR_Grenade",
    "I_UavTerminal",
    "O_UavTerminal",
    "C_UavTerminal",
    "I_E_UavTerminal",
    "TFAR_rf7800str",
    "TFAR_anprc148jem",
    "TFAR_anprc154",
    "TFAR_fadak",
    "TFAR_pnr1000a",
    "TFAR_microdagr",
    // "ACE_SpraypaintRed",
    "ACE_SpraypaintGreen",
    "ACE_SpraypaintBlue",
    "ACE_SpraypaintBlack",
    // "JAS_GPNVG18_blk_TI",
    // "JAS_GPNVG18_Tan_TI",
    // "JAS_GPNVG18_Full_blk_TI",
    // "JAS_GPNVG18_Full_Tan_TI",
    // "NVGogglesC_SSU_blk",
    // "NVGogglesC_SSU_grn",
    // "NVGogglesB_SSU_blk",
    // "NVGogglesB_SSU_gry",
    // "NVGogglesB_SSU_grn",
    "HLC_Charm_base",
    "FIR_PDU",
    "EOD9_HELMET_Base",
    "min_rf_UavTerminal"
];
private _backpacks = [
    "C_IDAP_UAV_01_backpack_F",
    "C_IDAP_UAV_06_antimine_backpack_F",
    "C_IDAP_UAV_06_backpack_F",
    "C_IDAP_UAV_06_medical_backpack_F",
    "C_IDAP_UGV_02_Demining_backpack_F",
    "C_UAV_06_backpack_F",
    "C_UAV_06_medical_backpack_F",
    "I_AA_01_weapon_F",
    "I_AT_01_weapon_F",
    "I_C_HMG_02_high_weapon_F",
    "I_C_HMG_02_support_F",
    "I_C_HMG_02_support_high_F",
    "I_C_HMG_02_weapon_F",
    "I_E_AA_01_weapon_F",
    "I_E_AT_01_weapon_F",
    "I_E_GMG_01_A_Weapon_F",
    "I_E_GMG_01_high_Weapon_F",
    "I_E_GMG_01_Weapon_F",
    "I_E_HMG_01_A_Weapon_F",
    "I_E_HMG_01_high_Weapon_F",
    "I_E_HMG_01_support_F",
    "I_E_HMG_01_support_high_F",
    "I_E_HMG_01_Weapon_F",
    "I_E_HMG_02_high_weapon_F",
    "I_E_HMG_02_support_F",
    "I_E_HMG_02_support_high_F",
    "I_E_HMG_02_weapon_F",
    "I_E_Mortar_01_support_F",
    "I_E_Mortar_01_Weapon_F",
    "I_E_UAV_01_backpack_F",
    "I_E_UAV_06_backpack_F",
    "I_E_UAV_06_medical_backpack_F",
    "I_E_UGV_02_Demining_backpack_F",
    "I_E_UGV_02_Science_backpack_F",
    "I_G_HMG_02_high_weapon_F",
    "I_G_HMG_02_support_F",
    "I_G_HMG_02_support_high_F",
    "I_G_HMG_02_weapon_F",
    "I_GMG_01_A_weapon_F",
    "I_GMG_01_high_weapon_F",
    "I_GMG_01_weapon_F",
    "I_HMG_01_A_weapon_F",
    "I_HMG_01_high_weapon_F",
    "I_HMG_01_support_F",
    "I_HMG_01_support_high_F",
    "I_HMG_01_weapon_F",
    "I_HMG_02_high_weapon_F",
    "I_HMG_02_support_F",
    "I_HMG_02_support_high_F",
    "I_HMG_02_weapon_F",
    "I_Mortar_01_support_F",
    "I_Mortar_01_weapon_F",
    "I_UAV_01_backpack_F",
    "I_UAV_06_backpack_F",
    "I_UAV_06_medical_backpack_F",
    "I_UGV_02_Demining_backpack_F",
    "I_UGV_02_Science_backpack_F",
    "O_AA_01_weapon_F",
    "O_AT_01_weapon_F",
    "O_GMG_01_A_weapon_F",
    "O_GMG_01_high_weapon_F",
    "O_GMG_01_weapon_F",
    "O_HMG_01_A_weapon_F",
    "O_HMG_01_high_weapon_F",
    "O_HMG_01_support_F",
    "O_HMG_01_support_high_F",
    "O_HMG_01_weapon_F",
    "O_Mortar_01_support_F",
    "O_Mortar_01_weapon_F",
    "O_UAV_01_backpack_F",
    "O_UAV_06_backpack_F",
    "O_UAV_06_medical_backpack_F",
    "O_UGV_02_Demining_backpack_F",
    "O_UGV_02_Science_backpack_F",
    "O_Static_Designator_02_weapon_F",
    "CSAT_WINTER_BACKPACK_GMG_A_BIGHEX",
    "CSAT_WINTER_BACKPACK_GMG_A_GREY",
    "CSAT_WINTER_BACKPACK_GMG_A_HEX",
    "CSAT_WINTER_BACKPACK_GMG_A_WHITE",
    "CSAT_WINTER_BACKPACK_HMG_A_BIGHEX",
    "CSAT_WINTER_BACKPACK_HMG_A_GREY",
    "CSAT_WINTER_BACKPACK_HMG_A_HEX",
    "CSAT_WINTER_BACKPACK_HMG_A_WHITE",
    "CSAT_WINTER_BACKPACK_HMG_HIGH_BIGHEX",
    "CSAT_WINTER_BACKPACK_HMG_HIGH_GREY",
    "CSAT_WINTER_BACKPACK_HMG_HIGH_HEX",
    "CSAT_WINTER_BACKPACK_HMG_HIGH_WHITE",
    "CSAT_WINTER_BACKPACK_HMG_BIGHEX",
    "CSAT_WINTER_BACKPACK_HMG_GREY",
    "CSAT_WINTER_BACKPACK_HMG_HEX",
    "CSAT_WINTER_BACKPACK_HMG_WHITE",
    "CSAT_WINTER_BACKPACK_GMG_HIGH_BIGHEX",
    "CSAT_WINTER_BACKPACK_GMG_HIGH_GREY",
    "CSAT_WINTER_BACKPACK_GMG_HIGH_HEX",
    "CSAT_WINTER_BACKPACK_GMG_HIGH_WHITE",
    "CSAT_WINTER_BACKPACK_GMG_BIGHEX",
    "CSAT_WINTER_BACKPACK_GMG_GREY",
    "CSAT_WINTER_BACKPACK_GMG_HEX",
    "CSAT_WINTER_BACKPACK_GMG_WHITE",
    "CSAT_WINTER_BACKPACK_AMORT_BIGHEX",
    "CSAT_WINTER_BACKPACK_AMORT_GREY",
    "CSAT_WINTER_BACKPACK_AMORT_HEX",
    "CSAT_WINTER_BACKPACK_AMORT_WHITE",
    "CSAT_WINTER_BACKPACK_MORT_BIGHEX",
    "CSAT_WINTER_BACKPACK_MORT_GREY",
    "CSAT_WINTER_BACKPACK_MORT_HEX",
    "CSAT_WINTER_BACKPACK_MORT_WHITE",
    "CSAT_WINTER_BACKPACK_AMG_RAISED_BIGHEX",
    "CSAT_WINTER_BACKPACK_AMG_RAISED_GREY",
    "CSAT_WINTER_BACKPACK_AMG_RAISED_HEX",
    "CSAT_WINTER_BACKPACK_AMG_RAISED_WHITE",
    "CSAT_WINTER_BACKPACK_AMG_BIGHEX",
    "CSAT_WINTER_BACKPACK_AMG_GREY",
    "CSAT_WINTER_BACKPACK_AMG_HEX",
    "CSAT_WINTER_BACKPACK_AMG_WHITE",
    "CSAT_WINTER_BACKPACK_STATIC_AA_BIGHEX",
    "CSAT_WINTER_BACKPACK_STATIC_AA_GREY",
    "CSAT_WINTER_BACKPACK_STATIC_AA_HEX",
    "CSAT_WINTER_BACKPACK_STATIC_AA_WHITE",
    "CSAT_WINTER_BACKPACK_STATIC_AT_BIGHEX",
    "CSAT_WINTER_BACKPACK_STATIC_AT_GREY",
    "CSAT_WINTER_BACKPACK_STATIC_AT_HEX",
    "CSAT_WINTER_BACKPACK_STATIC_AT_WHITE",
    "CSAT_WINTER_BACKPACK_STATIC_AT_BIGHEX",
    "CSAT_WINTER_BACKPACK_STATIC_AT_GREY",
    "CSAT_WINTER_BACKPACK_STATIC_AT_HEX",
    "CSAT_WINTER_BACKPACK_STATIC_AT_WHITE",
    "CSAT_WINTER_BACKPACK_UAV_AL6_BIGHEX",
    "CSAT_WINTER_BACKPACK_UAV_AL6_GREY",
    "CSAT_WINTER_BACKPACK_UAV_AL6_HEX",
    "CSAT_WINTER_BACKPACK_UAV_AL6_WHITE",
    "CSAT_WINTER_BACKPACK_UAV_AL6_MEDICAL_BIGHEX",
    "CSAT_WINTER_BACKPACK_UAV_AL6_MEDICAL_GREY",
    "CSAT_WINTER_BACKPACK_UAV_AL6_MEDICAL_HEX",
    "CSAT_WINTER_BACKPACK_UAV_AL6_MEDICAL_WHITE",
    "CSAT_WINTER_BACKPACK_UAV_BIGHEX",
    "CSAT_WINTER_BACKPACK_UAV_GREY",
    "CSAT_WINTER_BACKPACK_UAV_HEX",
    "CSAT_WINTER_BACKPACK_UAV_WHITE",
    "TEC_GMG_Weapon_Woodland_Auto_F",
    "TEC_GMG_Weapon_Auto_F",
    "TEC_HMG_Weapon_Woodland_Auto_F",
    "TEC_HMG_Weapon_Auto_F",
    "TEC_O_UGV_02_Demining_Backpack_F",
    "TEC_O_UGV_02_Science_Backpack_F",
    "TEC_Static_AT_Bag_F",
    "TEC_Static_AT_Bag_WoodLand_F", // This seems unable to prohibit
    "TEC_Static_AA_Bag_F",
    "TEC_Static_AA_Bag_Woodland_F", // This seems unable to prohibit
    "TEC_Static_Bipod_High_F",
    "TEC_Static_Bipod_Woodland_High_F",
    "TEC_Static_Bipod_Low_F",
    "TEC_Static_Bipod_Woodland_Low_F",
    "TEC_Mortar_01_Tube_F",
    "TEC_Mortar_01_Woodland_Tube_F",
    "TEC_Mortar_01_Bipod_F",
    "TEC_Mortar_01_Woodland_Bipod_F",
    "TEC_GMG_Weapon_Woodland_High_F",
    "TEC_GMG_Weapon_High_F",
    "TEC_HMG_Weapon_Woodland_High_F",
    "TEC_HMG_Weapon_High_F",
    "TEC_GMG_Weapon_Woodland_Low_F",
    "TEC_GMG_Weapon_Low_F",
    "TEC_HMG_Weapon_Woodland_Low_F",
    "TEC_HMG_Weapon_Low_F",
    "TEC_B_O_UAV_Woodland",
    "TEC_B_O_UAV_Urban",
    "TEC_B_O_UAV_Arid",
    "TEC_B_O_UAV_Semiarid",
    "TEC_B_O_UAV_AL6_Medical_Woodland",
    "TEC_B_O_UAV_AL6_Medical_Urban",
    "TEC_B_O_UAV_AL6_Medical_Arid",
    "TEC_B_O_UAV_AL6_Medical_Semiarid",
    "TEC_B_O_UAV_AL6_Antimine_Woodland",
    "TEC_B_O_UAV_AL6_Antimine_Urban",
    "TEC_B_O_UAV_AL6_Antimine_Arid",
    "TEC_B_O_UAV_AL6_Antimine_Semiarid",
    "TEC_B_O_UAV_AL6_Woodland",
    "TEC_B_O_UAV_AL6_Urban",
    "TEC_B_O_UAV_AL6_Arid",
    "TEC_B_O_UAV_AL6_Semiarid",
    "TEC_Static_Vorona_Bag_Woodland_F",
    "TEC_Static_Vorona_Bag_F",
    "TEC_B_O_Static_Designator_Woodland",
    "TEC_B_O_Static_Designator_Urban",
    "TEC_B_O_Static_Designator_Arid",
    "TEC_B_O_Static_Designator_Semiarid",
    "TFAR_anprc155",
    "TFAR_anprc155_coyote",
    "TFAR_anarc164",
    "TFAR_mr3000",
    "TFAR_mr3000_multicam",
    "TFAR_mr3000_rhs",
    "TFAR_mr3000_bwmod",
    "TFAR_mr3000_bwmod_tropen",
    "TFAR_mr6000l",
    "TFAR_bussole",
    "B_rhsusf_B_BACKPACK",
    "ACE_NonSteerableParachute",
    "EOD_Bag"
];

btc_custom_arsenal = [_weapons, _magazines, _items, _backpacks];

/*
    Here you can specify which equipment is loaded on player connection.
*/

private _radio = ["tf_anprc152", "ACRE_PRC148"] select (isClass(configFile >> "cfgPatches" >> "acre_main"));
//Array of colored item: 0 - Desert, 1 - Tropic, 2 - Black, 3 - forest
private _uniforms = ["U_B_CombatUniform_mcam", "U_B_CTRG_Soldier_F", "U_B_CTRG_1", "U_B_CombatUniform_mcam_wdl_f"];
private _uniformsCBRN = ["U_B_CBRN_Suit_01_MTP_F", "U_B_CBRN_Suit_01_Tropic_F", "U_C_CBRN_Suit_01_Blue_F", "U_B_CBRN_Suit_01_Wdl_F"];
private _uniformsSniper = ["U_B_FullGhillie_sard", "U_B_FullGhillie_lsh", "U_B_T_FullGhillie_tna_F", "U_B_T_FullGhillie_tna_F"];
private _vests = ["V_PlateCarrierH_CTRG", "V_PlateCarrier2_rgr_noflag_F", "V_PlateCarrierH_CTRG", "V_PlateCarrier2_wdl"];
private _helmets = ["H_HelmetSpecB_paint2", "H_HelmetB_Enh_tna_F", "H_HelmetSpecB_blk", "H_HelmetSpecB_wdl"];
private _hoods = ["G_Balaclava_combat", "G_Balaclava_TI_G_tna_F", "G_Balaclava_combat", "G_Balaclava_combat"];
private _hoodCBRN = "G_AirPurifyingRespirator_01_F";
private _laserdesignators = ["Laserdesignator", "Laserdesignator_03", "Laserdesignator_01_khk_F", "Laserdesignator_01_khk_F"];
private _night_visions = ["NVGoggles", "NVGoggles_INDEP", "NVGoggles_OPFOR", "NVGoggles_INDEP"];
private _weapons = ["arifle_MXC_F", "arifle_MXC_khk_F", "arifle_MXC_Black_F", "arifle_MXC_Black_F"];
private _weapons_machineGunner = ["arifle_MX_SW_F", "arifle_MX_SW_khk_F", "arifle_MX_SW_Black_F", "arifle_MX_SW_Black_F"];
private _weapons_sniper = ["arifle_MXM_F", "arifle_MXM_khk_F", "arifle_MXM_Black_F", "arifle_MXM_Black_F"];
private _bipods = ["bipod_01_F_snd", "bipod_01_F_khk", "bipod_01_F_blk", "bipod_01_F_blk"];
private _pistols = ["hgun_P07_F", "hgun_P07_khk_F", "hgun_P07_F", "hgun_P07_khk_F"];
private _launcher_AT = ["launch_B_Titan_short_F", "launch_B_Titan_short_tna_F", "launch_O_Titan_short_F", "launch_B_Titan_short_tna_F"];
private _launcher_AA = ["launch_B_Titan_F", "launch_B_Titan_tna_F", "launch_O_Titan_F", "launch_B_Titan_tna_F"];
private _backpacks = ["B_AssaultPack_Kerry", "B_AssaultPack_eaf_F", "B_AssaultPack_blk", "B_AssaultPack_wdl_F"];
private _backpacks_big = ["B_Kitbag_mcamo", "B_Kitbag_rgr", "B_Kitbag_rgr", "B_Kitbag_rgr"];
private _backpackCBRN = "B_CombinationUnitRespirator_01_F";

btc_arsenal_loadout = [_uniforms, _uniformsCBRN, _uniformsSniper, _vests, _helmets, _hoods, [_hoodCBRN, _hoodCBRN, _hoodCBRN, _hoodCBRN], _laserdesignators, _night_visions, _weapons, _weapons_sniper, _weapons_machineGunner, _bipods, _pistols, _launcher_AT, _launcher_AA, _backpacks, _backpacks_big, [_backpackCBRN, _backpackCBRN, _backpackCBRN, _backpackCBRN], [_radio, _radio, _radio, _radio]];
