btc_custom_loc = [
/*
    DESCRIPTION: [POS(Array),TYPE(String),NAME(String),RADIUS (Number),IS OCCUPIED(Bool)]
    Possible types: "NameVillage","NameCity","NameCityCapital","NameLocal","Hill","Airport","NameMarine"
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
private _weapons = [

];
private _magazines = [
    "Titan_AP"
];
private _items = [
    //"H_HelmetO_ViperSP_hex_F",
    //"H_HelmetO_ViperSP_ghex_F",
    "I_UavTerminal",
    "O_UavTerminal",
    "C_UavTerminal",
    "I_E_UavTerminal",
    "NVGogglesB_gry_F",
    "NVGogglesB_grn_F",
    "NVGogglesB_blk_F",
    "ACE_bodyBag",
    "ACE_Sandbag_empty",
    "TFAR_rf7800str",
    "TFAR_anprc148jem",
    "TFAR_anprc154",
    "TFAR_fadak",
    "TFAR_pnr1000a",
    "TFAR_microdagr",
    "JAS_GPNVG18_blk_TI",
    "JAS_GPNVG18_Tan_TI",
    "JAS_GPNVG18_Full_blk_TI",
    "JAS_GPNVG18_Full_Tan_TI"
];
private _backpacks = [
    "I_HMG_01_weapon_F",
    "O_HMG_01_weapon_F",
    "I_HMG_01_A_weapon_F",
    "O_HMG_01_A_weapon_F",
    "I_HMG_01_high_weapon_F",
    "O_HMG_01_high_weapon_F",
    "I_GMG_01_weapon_F",
    "O_GMG_01_weapon_F",
    "I_GMG_01_A_weapon_F",
    "O_GMG_01_A_weapon_F",
    "I_GMG_01_high_weapon_F",
    "O_GMG_01_high_weapon_F",
    "I_Mortar_01_support_F",
    "O_Mortar_01_support_F",
    "I_Mortar_01_weapon_F",
    "O_Mortar_01_weapon_F",
    "I_HMG_01_support_F",
    "O_HMG_01_support_F",
    "I_HMG_01_support_high_F",
    "O_HMG_01_support_high_F",
    "I_AA_01_weapon_F",
    "O_AA_01_weapon_F",
    "I_AT_01_weapon_F",
    "O_AT_01_weapon_F",
    "I_UAV_01_backpack_F",
    "O_UAV_01_backpack_F",
    "I_UAV_06_backpack_F",
    "O_UAV_06_backpack_F",
    "I_UAV_06_medical_backpack_F",
    "O_UAV_06_medical_backpack_F",
    "C_UAV_06_backpack_F",
    "C_UAV_06_medical_backpack_F",
    "C_IDAP_UAV_01_backpack_F",
    "C_IDAP_UAV_06_backpack_F",
    "C_IDAP_UAV_06_medical_backpack_F",
    "C_IDAP_UAV_06_antimine_backpack_F",
    "I_E_UAV_06_backpack_F",
	"I_E_UAV_06_medical_backpack_F",
	"I_E_UAV_01_backpack_F",
	"I_UGV_02_Demining_backpack_F",
	"O_UGV_02_Demining_backpack_F",
	"I_E_UGV_02_Demining_backpack_F",
	"I_UGV_02_Science_backpack_F",
	"O_UGV_02_Science_backpack_F",
	"I_E_UGV_02_Science_backpack_F",
	"C_IDAP_UGV_02_Demining_backpack_F",
	"I_E_Mortar_01_support_F",
	"I_E_Mortar_01_Weapon_F",
	"I_E_HMG_01_support_F",
	"I_E_HMG_01_support_high_F",
	"I_E_HMG_01_Weapon_F",
	"I_E_HMG_01_high_Weapon_F",
	"I_E_GMG_01_Weapon_F",
	"I_E_GMG_01_high_Weapon_F",
	"I_E_HMG_01_A_Weapon_F",
    "I_E_GMG_01_A_Weapon_F",
    "I_E_AA_01_weapon_F",
    "I_E_AT_01_weapon_F",
    "O_Static_Designator_02_weapon_F",
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
    "B_rhsusf_B_BACKPACK"
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
