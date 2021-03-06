
btc_version = [1, 21.1, 3];
diag_log format (["=BTC= HEARTS AND MINDS VERSION %1.%2.%3"] + btc_version);

//Param
//<< Time options >>
btc_p_time = "btc_p_time" call BIS_fnc_getParamValue;
btc_p_acctime = "btc_p_acctime" call BIS_fnc_getParamValue;
private _p_db = ("btc_p_load" call BIS_fnc_getParamValue) isEqualTo 1;
btc_p_auto_db = "btc_p_auto_db" call BIS_fnc_getParamValue isEqualTo 1;
btc_p_db_autoRestart = "btc_p_db_autoRestart" call BIS_fnc_getParamValue;
btc_p_db_autoRestartTime = "btc_p_db_autoRestartTime" call BIS_fnc_getParamValue;

//<< Respawn options >>
btc_p_respawn_location = "btc_p_respawn_location" call BIS_fnc_getParamValue;
btc_p_respawn_fromFOBToBase = ("btc_p_respawn_fromFOBToBase" call BIS_fnc_getParamValue) isEqualTo 1;
btc_p_rallypointTimer = "btc_p_rallypointTimer" call BIS_fnc_getParamValue;
btc_p_respawn_arsenal = ("btc_p_respawn_arsenal" call BIS_fnc_getParamValue) isEqualTo 1;

//<< Faction options >>
private _p_en = "btc_p_en" call BIS_fnc_getParamValue;
private _p_en_AA = ("btc_p_AA" call BIS_fnc_getParamValue) isEqualTo 1;
private _p_en_tank = ("btc_p_tank" call BIS_fnc_getParamValue) isEqualTo 1;
private _p_civ = "btc_p_civ" call BIS_fnc_getParamValue;
private _p_civ_veh = "btc_p_civ_veh" call BIS_fnc_getParamValue;

//<< IED options >>
btc_p_ied = ("btc_p_ied" call BIS_fnc_getParamValue)/2;
private _p_ied_spot = "btc_p_ied_spot" call BIS_fnc_getParamValue;
btc_p_ied_placement = "btc_p_ied_placement" call BIS_fnc_getParamValue;
btc_p_ied_drone = ("btc_p_ied_drone" call BIS_fnc_getParamValue) isEqualTo 1;

//<< Hideout/Cache options >>
private _hideout_n = "btc_p_hideout_n" call BIS_fnc_getParamValue;
private _cache_info_def = "btc_p_cache_info_def" call BIS_fnc_getParamValue;
private _cache_info_ratio = "btc_p_cache_info_ratio" call BIS_fnc_getParamValue;
private _info_chance = "btc_p_info_chance" call BIS_fnc_getParamValue;
btc_p_info_houseDensity = "btc_p_info_houseDensity" call BIS_fnc_getParamValue;

//<< Skill options >>
btc_p_set_skill  = ("btc_p_set_skill" call BIS_fnc_getParamValue) isEqualTo 1;
private _p_skill = [
    ("btc_p_set_skill_general" call BIS_fnc_getParamValue)/10,//general
    ("btc_p_set_skill_aimingAccuracy" call BIS_fnc_getParamValue)/10,//aimingAccuracy
    ("btc_p_set_skill_aimingShake" call BIS_fnc_getParamValue)/10,//aimingShake
    ("btc_p_set_skill_aimingSpeed" call BIS_fnc_getParamValue)/10,//aimingSpeed
    ("btc_p_set_skill_endurance" call BIS_fnc_getParamValue)/10,//endurance
    ("btc_p_set_skill_spotDistance" call BIS_fnc_getParamValue)/10,//spotDistance
    ("btc_p_set_skill_spotTime" call BIS_fnc_getParamValue)/10,//spotTime
    ("btc_p_set_skill_courage" call BIS_fnc_getParamValue)/10,//courage
    ("btc_p_set_skill_reloadSpeed" call BIS_fnc_getParamValue)/10,//reloadSpeed
    ("btc_p_set_skill_commanding" call BIS_fnc_getParamValue)/10//commanding
];

//<< Spawn options >>
btc_p_is_free_prob = ("btc_p_is_free_prob" call BIS_fnc_getParamValue)/100;
btc_p_mil_group_ratio = ("btc_p_mil_group_ratio" call BIS_fnc_getParamValue)/100;
btc_p_mil_static_group_ratio = ("btc_p_mil_static_group_ratio" call BIS_fnc_getParamValue)/100;
btc_p_civ_group_ratio = ("btc_p_civ_group_ratio" call BIS_fnc_getParamValue)/100;
btc_p_animals_group_ratio = ("btc_p_animals_group_ratio" call BIS_fnc_getParamValue)/100;
private _wp_house_probability = ("btc_p_wp_house_probability" call BIS_fnc_getParamValue)/100;
btc_p_veh_armed_ho = ("btc_p_veh_armed_ho" call BIS_fnc_getParamValue) isEqualTo 1;
btc_p_veh_armed_spawn_more = ("btc_p_veh_armed_spawn_more" call BIS_fnc_getParamValue) isEqualTo 1;
btc_p_patrol_max = "btc_p_patrol_max" call BIS_fnc_getParamValue;
btc_p_civ_max_veh = "btc_p_civ_max_veh" call BIS_fnc_getParamValue;

//<< Gameplay options >>
btc_p_sea = ("btc_p_sea" call BIS_fnc_getParamValue) isEqualTo 1;
btc_p_chem = ("btc_p_chem" call BIS_fnc_getParamValue) isEqualTo 1;
btc_p_spect = ("btc_p_spect" call BIS_fnc_getParamValue) isEqualTo 1;
btc_p_side_mission_cycle = "btc_p_side_mission_cycle" call BIS_fnc_getParamValue;

//<< Arsenal options >>
btc_p_arsenal_Type = "btc_p_arsenal_Type" call BIS_fnc_getParamValue;
btc_p_arsenal_Restrict = "btc_p_arsenal_Restrict" call BIS_fnc_getParamValue;
btc_p_garage = ("btc_p_garage" call BIS_fnc_getParamValue) isEqualTo 1;
btc_p_autoloadout = "btc_p_autoloadout" call BIS_fnc_getParamValue;

//<< Other options >>
private _p_rep = "btc_p_rep" call BIS_fnc_getParamValue;
btc_p_rep_notify = "btc_p_rep_notify" call BIS_fnc_getParamValue;
private _p_city_radius = ("btc_p_city_radius" call BIS_fnc_getParamValue) * 100;
btc_p_trigger = if (("btc_p_trigger" call BIS_fnc_getParamValue) isEqualTo 1) then {
    "this && (false in (thisList apply {(_x isKindOf 'Air' && {speed _x > 125 || {(getPosATL _x select 2) > 125}})}))" // Edited: Allow planes trigger city activation & Tweak trigger speed and height, default = "this && (false in (thisList apply {_x isKindOf 'Plane'})) && (false in (thisList apply {(_x isKindOf 'Helicopter') && (speed _x > 190)}))"
} else {
    "this"
};
btc_p_city_free_trigger = "btc_p_city_free_trigger" call BIS_fnc_getParamValue; // Edited: Use a different method to trigger enemy surrender
// private _p_city_free_trigger = "btc_p_city_free_trigger" call BIS_fnc_getParamValue;
// btc_p_city_free_trigger_condition = if (_p_city_free_trigger isEqualTo 0) then {
//     "thisList isEqualTo []"
// } else {
//     format ["[thisList, %1] call btc_fnc_city_trigger_free_condition", _p_city_free_trigger]
// };
btc_p_auto_headless = ("btc_p_auto_headless" call BIS_fnc_getParamValue) isEqualTo 1;
btc_p_debug = "btc_p_debug" call BIS_fnc_getParamValue;

switch (btc_p_debug) do {
    case 0 : {
        btc_debug_log = false;
        btc_debug = false;
        btc_debug_graph = false; // Edited: Allow btc_debug_graph for everyone
        btc_debug_frames = 0; // Edited: Allow btc_debug_graph for everyone
    };
    case 1 : {
        btc_debug_log = true;
        btc_debug = true;
        btc_debug_graph = false;
        btc_debug_frames = 0;
    };
    case 2 : {
        btc_debug_log = true;
        btc_debug = false;
    };
};

if (!isMultiplayer) then {
    btc_debug_log = true;
    btc_debug = true;
    btc_debug_graph = false;
    btc_debug_frames = 0;
};

private _cfgVehicles = configFile >> "CfgVehicles";
private _allClassVehicles = ("true" configClasses _cfgVehicles) apply {configName _x};
private _allClassSorted = _allClassVehicles select {getNumber (_cfgVehicles >> _x >> "scope") isEqualTo 2};

if (isServer) then {
    btc_final_phase = false;
    btc_delay_createUnit = 0;

    //City
    btc_city_radius = _p_city_radius;
    btc_city_blacklist = [];//NAME FROM CFG

    //Civ
    btc_civ_veh_active = [];

    //Database
    btc_db_load = _p_db;
    btc_db_serverCommandPassword = "btc_password"; //Define the same password in server.cfg like this: serverCommandPassword = "btc_password";

    //Hideout
    btc_hideouts = [];
    btc_hideouts_id = 0;
    btc_hideouts_radius = 800;
    btc_hideout_n = _hideout_n;
    if (btc_hideout_n isEqualTo 99) then {
        btc_hideout_n = round random 5;
    };
    btc_hideout_safezone = 4000;
    btc_hideout_range = 3500;
    btc_hideout_cap_time = 1800;
    btc_hideout_cap_checking = false;
    btc_hideout_minRange = btc_hideout_range;

    //IED
    btc_ied_suic_time = 900;
    btc_ied_suic_spawned = - btc_ied_suic_time;
    btc_ied_offset = [0, -0.03, -0.07] select _p_ied_spot;
    btc_ied_list = [];

    //FOB
    btc_fobs = [[], [], []];
    btc_fob_rallypointTimer = 60 * btc_p_rallypointTimer;

    //MIL
    btc_p_mil_wp_ratios = [_wp_house_probability, (1 - _wp_house_probability) / 1.5 + _wp_house_probability];
    if ((btc_p_mil_wp_ratios select 0) isEqualTo (btc_p_mil_wp_ratios select 1)) then {
        btc_p_mil_wp_ratios set [1, 0.1 + (btc_p_mil_wp_ratios select 1)];
    };

    //Patrol
    btc_patrol_active = [];
    btc_patrol_area = 3000; // Edited: Increase enemy patrol spawn range, default = 2500

    //Rep
    btc_global_reputation = _p_rep;
    btc_rep_militia_call_time = 600;
    btc_rep_militia_called = - btc_rep_militia_call_time;
    btc_rep_delayed = [0, []];

    //Chem
    btc_chem_decontaminate = [btc_bigShower];
    btc_chem_contaminated = []; publicVariable "btc_chem_contaminated"; //Preserve reference

    //Spect
    btc_spect_emp = []; publicVariable "btc_spect_emp"; //Preserve reference

    //Cache
    btc_cache_type = [
        _allClassSorted select {
            _x isKindOf "ReammoBox_F" &&
            {getText(_cfgVehicles >> _x >> "model") isEqualTo "\A3\weapons_F\AmmoBoxes\AmmoBox_F"}
        },
        ["Land_PlasticCase_01_small_black_CBRN_F", "Land_PlasticCase_01_small_olive_CBRN_F", "Land_PlasticCase_01_small_CBRN_F"]
    ];
    private _weapons_usefull = "true" configClasses (configFile >> "CfgWeapons") select {
        getNumber (_x >> 'type') isEqualTo 1 &&
        {getArray (_x >> 'magazines') isNotEqualTo []} &&
        {getNumber (_x >> 'scope') isEqualTo 2}
    };
    btc_cache_weapons_type = _weapons_usefull apply {configName _x};

    //Hideout classname
    btc_type_campfire = ["MetalBarrel_burning_F"] + (_allClassSorted select {_x isKindOf "Land_Campfire_F"});
    btc_type_Scrapyard = _allClassSorted select {
        _x isKindOf "Scrapyard_base_F" &&
        {!("scrap" in toLower _x)}
    };
    btc_type_bigbox = ["Box_FIA_Ammo_F", "Box_East_AmmoVeh_F", "CargoNet_01_box_F", "O_CargoNet_01_ammo_F"] + btc_type_Scrapyard;
    btc_type_seat = ["Land_WoodenLog_F", "Land_CampingChair_V2_F", "Land_CampingChair_V1_folded_F", "Land_CampingChair_V1_F"];
    btc_type_sleepingbag = _allClassSorted select {_x isKindOf "Land_Sleeping_bag_F"};
    btc_type_tent = ["Land_TentA_F", "Land_TentDome_F"] + (_allClassSorted select {
        _x isKindOf "Land_TentSolar_01_base_F" &&
        {!(_x isKindOf "Land_TentSolar_01_folded_base_F")}
    });
    btc_type_camonet = ["Land_IRMaskingCover_02_F"] + (_allClassSorted select {_x isKindOf "Shelter_base_F"});
    btc_type_satelliteAntenna = _allClassSorted select {_x isKindOf "Land_SatelliteAntenna_01_F"};

    //Side
    btc_side_ID = 0;
    btc_side_list = ["supply", "mines", "vehicle", "get_city", "tower", "checkpoint", "rescue", "hostage", "kill", "EMP", "removeRubbish", "hack"]; // Edited: Exclude "capture_officer", "convoy", "civtreatment" - On ground (Side "convoy" and "capture_officer" are not design for map with different islands. Start and end city can be on different islands.)
    if (btc_p_sea) then {btc_side_list append ["underwater_generator", "civtreatment_boat"]}; //On sea
    if (btc_p_chem) then {btc_side_list pushBack "chemicalLeak"};
    btc_side_list_use = [];
    btc_type_tower = ["Land_Communication_F", "Land_TTowerBig_1_F", "Land_TTowerBig_2_F"];
    btc_type_phone = ["Land_PortableLongRangeRadio_F", "Land_MobilePhone_smart_F", "Land_MobilePhone_old_F"];
    btc_type_barrel = ["Land_GarbageBarrel_01_F", "Land_BarrelSand_grey_F", "MetalBarrel_burning_F", "Land_BarrelWater_F", "Land_MetalBarrel_F", "Land_MetalBarrel_empty_F"];
    btc_type_canister = ["Land_CanisterPlastic_F"];
    btc_type_pallet = ["Land_Pallets_stack_F", "Land_Pallets_F", "Land_Pallet_F"];
    btc_type_box = ["Box_East_Wps_F", "Box_East_WpsSpecial_F", "Box_East_Ammo_F"] + (btc_cache_type select 0);
    btc_type_generator = _allClassSorted select {_x isKindOf "Land_Device_assembled_F"};
    btc_type_storagebladder = _allClassSorted select {_x isKindOf "StorageBladder_base_F"};
    btc_type_mines = ["APERSMine", "APERSBoundingMine", "APERSTripMine"];
    btc_type_power = ["Land_PowerGenerator_F", "Land_PortableGenerator_01_F"] + (_allClassSorted select {_x isKindOf "Machine_base_F"});
    btc_type_cord = ["Land_ExtensionCord_F"];
    btc_type_cones = ["Land_RoadCone_01_F", "RoadCone_F", "RoadCone_L_F"];
    btc_type_fences = ["Land_PlasticNetFence_01_long_F", "Land_PlasticNetFence_01_long_d_F", "RoadBarrier_F", "TapeSign_F"];
    btc_type_barrier = ["Land_CncBarrier_stripes_F", "Land_CncBarrier_F"];
    btc_type_portable_light = _allClassSorted select {_x isKindOf "Land_PortableLight_single_F"};
    btc_type_portableLamp = _allClassSorted select {
        _x isKindOf "Land_PortableLight_02_base_F" ||
        {_x isKindOf "TentLamp_01_standing_base_F"}
    };
    btc_type_tentLamp = _allClassSorted select {_x isKindOf "TentLamp_01_base_F"};
    btc_type_first_aid_kits = ["Land_FirstAidKit_01_open_F", "Land_FirstAidKit_01_closed_F"];
    btc_type_body_bags = _allClassSorted select {
        _x isKindOf "Land_Bodybag_01_base_F" ||
        {_x isKindOf "Land_Bodybag_01_empty_base_F"} ||
        {_x isKindOf "Land_Bodybag_01_folded_base_F"}
    };
    btc_type_signs = _allClassSorted select {_x isKindOf "Land_Sign_Mines_F"};
    btc_type_bloods = _allClassSorted select {_x isKindOf "Blood_01_Base_F"};
    btc_type_medicals = _allClassSorted select {_x isKindOf "MedicalGarbage_01_Base_F"};
    btc_type_table = _allClassSorted select {_x isKindOf "Land_CampingTable_F"};
    btc_type_garbage = ["Land_Garbage_line_F","Land_Garbage_square3_F","Land_Garbage_square5_F"];
    btc_type_foodSack = _allClassSorted select {_x isKindOf "Land_FoodSack_01_empty_base_F"};
    btc_type_PaperBox = _allClassSorted select {
        _x isKindOf "Land_PaperBox_01_small_ransacked_base_F" ||
        {_x isKindOf "Land_PaperBox_01_small_open_base_F"} ||
        {_x isKindOf "Land_PaperBox_01_small_destroyed_base_F"}
    };
    btc_type_EmergencyBlanket = _allClassSorted select {_x isKindOf "Land_EmergencyBlanket_01_base_F"};
    btc_type_Sponsor = _allClassSorted select {
        _x isKindOf "SignAd_Sponsor_F" &&
        {"idap" in toLower _x}
    };
    btc_type_PlasticCase = _allClassSorted select {_x isKindOf "PlasticCase_01_base_F"};
    btc_type_MedicalTent = _allClassSorted select {_x isKindOf "Land_MedicalTent_01_base_F"};
    btc_type_cargo_ruins = _allClassSorted select {
        _x isKindOf "Ruins_F" &&
        {
            "cargo40" in toLower _x ||
            "cargo20" in toLower _x
        }
    };
    btc_type_spill = ["Oil_Spill_F", "Land_DirtPatch_01_6x8_F"] + (_allClassSorted select {
        _x isKindOf "Land_DirtPatch_02_base_F" ||
        {_x isKindOf "WaterSpill_01_Base_F"}
    });
    btc_type_tarp = _allClassSorted select {_x isKindOf "Tarp_01_base_F"};
    btc_type_SCBA = _allClassSorted select {_x isKindOf "SCBACylinder_01_base_F"};
    btc_type_brush = _allClassSorted select {_x isKindOf "Brush_01_base_F"};
    btc_type_broom = _allClassSorted select {_x isKindOf "Broom_01_base_F"};
    btc_type_sponge = _allClassSorted select {_x isKindOf "Sponge_01_base_F"};
    btc_type_connectorTentClosed = _allClassSorted select {_x isKindOf "Land_ConnectorTent_01_closed_base_F"};
    btc_type_crossTent = _allClassSorted select {_x isKindOf "Land_ConnectorTent_01_cross_base_F"};
    btc_type_connectorTent = (_allClassSorted select {_x isKindOf "Land_ConnectorTent_01_base_F"}) - btc_type_connectorTentClosed - btc_type_crossTent;
    btc_type_cargoEMP = _allClassSorted select {_x isKindOf "Cargo_EMP_base_F"};
    btc_type_antenna = _allClassSorted select {_x isKindOf "OmniDirectionalAntenna_01_base_F"};
    btc_type_solarPanel = _allClassSorted select {_x isKindOf "Land_SolarPanel_04_base_F"};

    //BTC Vehicles in missions.sqm
    btc_vehicles = [btc_veh_1, btc_veh_2, btc_veh_3, btc_veh_4, btc_veh_5, btc_veh_6, btc_veh_7, btc_veh_8, btc_veh_9, btc_veh_10, btc_veh_11, btc_veh_12, btc_veh_13, btc_veh_14, btc_veh_15, btc_veh_16, btc_veh_17, btc_veh_18, btc_veh_19]; // Edited: Modified according to player vehicles
    btc_helo = [btc_helo_1, btc_helo_2, btc_helo_3, btc_helo_4, btc_helo_5, btc_helo_6, btc_helo_7, btc_helo_8, btc_helo_9, btc_helo_10, btc_helo_11, btc_helo_12, btc_helo_13, btc_helo_14, btc_helo_15, btc_helo_16, btc_helo_17, btc_helo_18]; // Edited: Modified according to player vehicles

    // The two arrays below are prefixes of buildings and their multiplier.
    // They will multiply the values of btc_rep_malus_building_destroyed and btc_rep_malus_building_damaged,
    // if a building is not present here it will be multiplied by 1.0.
    // Use 0.0 to disable reputation hit on a specific's building destruction.
    // You can modify this for any other terrain, clearing the table will also make all buildings just have a 1.0 multiplier.
    // If there's a hit in btc_buildings_multiplier, btc_buildings_categories_multipliers will NOT be run
    btc_buildings_multipliers = [
        // Specific buildings that need to have a custom modifier.
        ["Land_BellTower", 0.2 ], ["Land_WIP", 1.5], ["Land_u_Addon_01", 0.2],
        ["Land_Airport_Tower", 10.0], ["Land_Mil_ControlTower", 10.0],
        ["Land_TentHangar", 7.0], ["Land_i_Shed_Ind", 1.5], ["Land_u_Shed_Ind", 1.5],
        ["Land_TTowerBig", 6.0], ["Land_TTowerSmall", 4.5], ["Land_cmp_Tower", 4.0]
    ];

    // The multipliers are applied on top of each other, so "Chapel" and "Small" will both multiply the malus value
    btc_buildings_categories_multipliers = [
        ["Shed", 0.75], ["Slum", 0.8], ["Small", 0.8], ["Big", 1.5], ["Villa", 2.0], ["Main", 3.0], ["Tower", 2.0],
        ["HouseBlock", 2.0], ["Panelak", 2.0], ["Tenement", 7.0],
        ["Barn", 1.5], ["School", 3.0], ["Office", 2.0], ["Shop", 1.5], ["Store", 1.5], ["Hospital", 12.0],
        ["Castle", 2.5], ["Chapel", 3.0], ["Minaret", 3.0], ["Mosque", 4.0], ["Church", 4.0], ["Kostel", 4.0],
        ["Lighthouse", 4.0],
        ["Airport", 4.0], ["Hangar", 1.75], ["ControlTower", 2.25], ["Terminal", 3.0],
        ["Hopper", 2.0], ["Tank", 4.0], ["Factory", 2.0], ["Transformer", 1.1],
        ["FuelStation", 5.0],
        ["Barracks", 1.75],
        ["spp", 3.0], ["Powerstation", 3.0],
        ["Pump", 2.5]
    ];
    btc_buildings_changed = [];

    //TAGS
    btc_type_tags = ["Land_Graffiti_01_F", "Land_Graffiti_02_F", "Land_Graffiti_03_F", "Land_Graffiti_04_F", "Land_Graffiti_05_F"];
    btc_type_tags_sentences = [
        "STR_BTC_HAM_TAG_GO",
        "STR_BTC_HAM_TAG_LN",
        "STR_BTC_HAM_TAG_WWKY",
        "STR_BTC_HAM_TAG_BA",
        "STR_BTC_HAM_TAG_GH",
        "STR_BTC_HAM_TAG_IE",
        "STR_BTC_HAM_TAG_DWY",
        "STR_BTC_HAM_TAG_WHY",
        "STR_BTC_HAM_TAG_YGD"
    ];
    btc_tags_player = [];
    btc_tags_server = [];

    //Flowers
    btc_type_flowers = _allClassSorted select {_x isKindOf "FlowerBouquet_base_F"};

    //IED
    private _ieds = ["Land_GarbageContainer_closed_F", "Land_GarbageContainer_open_F", "Land_Portable_generator_F", "Land_WoodenBox_F", "Land_BarrelTrash_grey_F", "Land_Sacks_heap_F", "Land_Wreck_Skodovka_F", "Land_WheelieBin_01_F", "Land_GarbageBin_03_F"] + btc_type_pallet + btc_type_barrel + (_allClassSorted select {
        _x isKindOf "GasTank_base_F" ||
        {_x isKindOf "Garbage_base_F"} ||
        (_x isKindOf "Constructions_base_F" &&
        {
            "bricks" in toLower _x
        }) ||
        (_x isKindOf "Wreck_base_F" &&
        {
            "car" in toLower _x ||
            "offroad" in toLower _x
        })
    });
    btc_type_ieds = _ieds - ["Land_Garbage_line_F","Land_Garbage_square3_F","Land_Garbage_square5_F"];
    btc_model_ieds = btc_type_ieds apply {(toLower getText(_cfgVehicles >> _x >> "model")) select [1]};
    btc_type_blacklist = btc_type_tags + btc_type_flowers + ["UserTexture1m_F", "Land_RepairDepot_01_tan_F"]; publicVariable "btc_type_blacklist"; // Edited: Exclude btc_log_object "Land_RepairDepot_01_tan_F" from removable list

    btc_groundWeaponHolder = [];
};

//Civ
// Get all faction from mod there are currently running
//copyToClipboard str (["CIV"] call btc_fnc_get_class);
private _allfaction = ["CIV_F","DEFAULT","CFP_C_AFG","CFP_C_AFRCHRISTIAN","CFP_C_AFRISLAMIC","CFP_C_ASIA","CFP_C_CHERNO_WIN","CFP_C_MALDEN","CFP_C_ME","CUP_C_RU","CUP_C_CHERNARUS","CUP_C_SAHRANI","CUP_C_TK","AFGCIV","GM_FC_GC_CIV","GM_FC_GE_CIV","LIB_CIV","LOP_AFR_CIV","LOP_CHR_CIV","LOP_TAK_CIV","OPTRE_UEG_CIV","CIV_IDAP_F","RDS_POL_CIV","RDS_RUS_CIV","C_VIET","UK3CB_ADC_C","UK3CB_CHC_C","UK3CB_TKC_C","UNSUNG_C"]; //All factions
_p_civ = _allfaction select _p_civ; //Select faction selected from mission parameter
_p_civ_veh = _allfaction select _p_civ_veh; //Select faction selected from mission parameter
private _allclasse = [[_p_civ, "CIV_IDAP_F"]] call btc_fnc_civ_class; // Edited: Add more civ factions - Create classes from factions, you can combine factions from the SAME side : [[_p_civ, "btc_ac","LOP_TAK_CIV"]] call btc_fnc_civ_class.

//Save class name to global variable
btc_civ_type_units = _allclasse select 0;
_allclasse = [[_p_civ_veh, "CIV_IDAP_F"]] call btc_fnc_civ_class; // Edited: Add more civ vehicle factions
btc_civ_type_veh = _allclasse select 2;
btc_civ_type_boats = _allclasse select 1;

btc_w_civs = [ // Edited: Give more powerful weapons to armed civs
    ["arifle_ARX_blk_F","arifle_AK12_GL_F","srifle_GM6_F","MMG_01_tan_F","sgun_HunterShotgun_01_F","rhs_weap_mg42","rhs_weap_pkp","rhs_weap_M107","rhs_weap_m32","HLC_wp_M134Painless"], // Edited: default = "srifle_DMR_06_hunter_F", "sgun_HunterShotgun_01_F", "srifle_DMR_06_hunter_khs_F", "sgun_HunterShotgun_01_Sawedoff_F", "Hgun_PDW2000_F", "arifle_AKM_F", "arifle_AKS_F"
    ["hlc_smg_mp5k","rhs_weap_savz61_folded","rhs_weap_pp2000_folded","rhs_weap_m320"] // Edited: default = "hgun_Pistol_heavy_02_F", "hgun_Rook40_F", "hgun_Pistol_01_F"
];
btc_g_civs = ["HandGrenade","ACE_M84","ACE_M14","rhs_mag_m67","rhs_charge_tnt_x2_mag","rhs_charge_sb3kg_mag","rhs_grenade_sthgr24_x7bundle_mag","ClusterGrenade_FragGrenade","ClusterGrenade_Motar82","WNZ_EMPGrenade","ACE_DemoCharge_Remote_Mag_Throwable","ACE_SatchelCharge_Remote_Mag_Throwable"]; // Edited: default = "HandGrenade", "MiniGrenade", "ACE_M84", "ACE_M84"

// ANIMALS
btc_animals_type = ["Hen_random_F", "Cock_random_F", "Fin_random_F", "Alsatian_Random_F", "Goat_random_F", "Sheep_random_F"];

//FOB
btc_fob_mat = "Land_Cargo20_blue_F";
btc_fob_structure = "Land_Cargo_HQ_V1_F";
btc_fob_flag = "Flag_NATO_F";
btc_fob_id = 0;
btc_fob_minDistance = 1500;

//IED
btc_type_ieds_ace = ["IEDLandBig_F", "IEDLandSmall_F"];
btc_ied_deleteOn = -1;

//Int
btc_int_radius_orders = 25;
btc_int_search_intel_time = 4;

//Info
btc_info_intel_chance = _info_chance;
btc_info_intel_type = [80, 95];//cache - hd - both
btc_info_cache_def = _cache_info_def;
btc_info_cache_ratio = _cache_info_ratio;
btc_info_hideout_radius = 4000;
btc_info_intels = ["Land_Camera_01_F", "Land_HandyCam_F"];

//Supplies
btc_supplies_cargo = "Land_Cargo20_IDAP_F";
btc_supplies_mat = [
    _allClassSorted select {_x isKindOf "Land_FoodSack_01_cargo_base_F"},
    _allClassSorted select {_x isKindOf "Land_WaterBottle_01_stack_F"}
];

//Hazmat
btc_type_hazmat = ["HazmatBag_01_F", "Land_MetalBarrel_F"] + (_allClassSorted select {
    _x isKindOf "Land_GarbageBarrel_02_base_F" ||
    {_x isKindOf "Land_FoodContainer_01_F"} ||
    {_x isKindOf "Land_CanisterFuel_F"} ||
    {_x isKindOf "CBRNContainer_01_base_F"} ||
    {_x isKindOf "PlasticCase_01_base_F"}
});

//Containers
btc_containers_mat = ["Land_Cargo20_military_green_F", "Land_Cargo40_military_green_F"];

if (isServer) then {
    //Player
    missionNamespace setVariable ["btc_player_side", west, true];
    missionNamespace setVariable ["btc_respawn_marker", "respawn_west", true];

    //Log
    private _rearming_static =
    [
        //"Static"
    ] + (_allClassSorted select {(
        _x isKindOf "GMG_TriPod" ||
        {_x isKindOf "StaticMortar"} ||
        {_x isKindOf "HMG_01_base_F"} ||
        {_x isKindOf "AA_01_base_F"} ||
        {_x isKindOf "AT_01_base_F"}) && {
            getNumber (_cfgVehicles >> _x >> "side") isEqualTo ([east, west, independent, civilian] find btc_player_side)
        }
    });
    ([_rearming_static] call btc_fnc_find_veh_with_turret) params ["_rearming_static", "_magazines_static"];
    _rearming_static = ["B_Quadbike_01_F","rhsusf_mrzr4_d","B_LSV_01_armed_F","B_LSV_01_AT_F","O_LSV_02_armed_F","O_LSV_02_AT_F","rhsusf_m1151_m2_lras3_v1_usarmy_d","rhsusf_m1151_mk19_v2_usarmy_d","rhsusf_m1151_m2crows_usarmy_d","rhsusf_m1151_mk19crows_usarmy_d","rhsusf_m1045_d_s","rhsusf_m1165a1_gmv_m2_m240_socom_d","rhsusf_m1165a1_gmv_mk19_m240_socom_d","rhsusf_m1165a1_gmv_m134d_m240_socom_d","rhsusf_m1240a1_m2_uik_usarmy_d","rhsusf_m1240a1_mk19_uik_usarmy_d","rhsusf_m1245_m2crows_socom_d","rhsusf_m1245_mk19crows_socom_d","rhsusf_M1230_M2_usarmy_d","rhsusf_M1230_MK19_usarmy_d","rhsusf_M1237_MK19_usarmy_d","rhsusf_M1237_M2_usarmy_d","rhsusf_m113d_usarmy_MK19","rhsusf_m113d_usarmy","rhsusf_M1117_D","B_MRAP_01_hmg_F","B_MRAP_01_gmg_F","I_MRAP_03_hmg_F","I_MRAP_03_gmg_F","O_MRAP_02_hmg_F","O_MRAP_02_gmg_F","rhs_tigr_sts_vdv","min_rf_gaz_2330_HMG","I_LT_01_AT_F","I_LT_01_cannon_F","B_G_Offroad_01_armed_F","B_G_Offroad_01_AT_F","I_C_Offroad_02_LMG_F","I_C_Offroad_02_AT_F","B_Heli_Light_01_F","RHS_MELB_MH6M","B_GEN_Offroad_01_gen_F","B_GEN_Van_02_transport_F","C_IDAP_Van_02_medevac_F","C_Kart_01_F","C_Hatchback_01_sport_F","B_UGV_01_rcws_F","pook_MAARS_AA12","pook_MAARS_M240","B_AAA_System_01_F","B_Radar_System_01_F","B_SAM_System_03_F","B_SAM_System_02_F","B_Ship_MRLS_01_F","B_Ship_Gun_01_F","B_SAM_System_01_F"] + _rearming_static - ["RHS_M252_WD","RHS_M252_USMC_D","RHS_M252_USMC_WD","rhsgref_cdf_b_reg_M252","rhsgref_cdf_reg_M252","rhssaf_army_m252","rhssaf_army_o_m252"] + ["ace_dragon_staticAssembled","RHS_Stinger_AA_pod_D","rhs_Igla_AA_pod_vdv","RHS_ZU23_VDV","RHS_M119_D","rhs_D30_vdv","rhs_D30_at_vdv"]; // Edited: Exclude duplicates items & Add light vehicles and more static weapons

    ([btc_vehicles + btc_helo] call btc_fnc_log_getRearmMagazines) params ["_rearming_vehicles", "_rearming_magazines"];

    btc_construction_array =
    [
        [ // Add: Translation for logistics menu, default = "Fortifications", "Static", "Ammobox", "Containers", "Supplies", "FOB", "Decontamination", "Vehicle Logistic"
            "防御工事",
            "载具及固定式武器",
            "弹药箱",
            "集装箱",
            "人道主义救援物资",
            "FOB",
            "消杀喷淋装置",
            "后勤补给"
        ], // + (_rearming_vehicles apply {getText (_cfgVehicles >> _x >> "displayName")}), // Edited: Remove vehicle ammo categories
        [ // Edited: Modify the construction list
            [
                //"Fortifications"
                "Land_BagBunker_Small_F",
                "Land_BagFence_Corner_F",
                "Land_BagFence_End_F",
                "Land_BagFence_Long_F",
                "Land_BagFence_Round_F",
                "Land_BagFence_Short_F",
                "Land_HBarrier_1_F",
                "Land_HBarrier_3_F",
                "Land_HBarrier_5_F",
                "Land_HBarrierBig_F",
                "Land_Razorwire_F",
                "Land_CncBarrier_F",
                "Land_CncBarrierMedium_F",
                "Land_CncBarrierMedium4_F",
                "Land_CncWall1_F",
                "Land_CncWall4_F",
                "Land_Mil_ConcreteWall_F",
                "Land_Mil_WallBig_4m_F",
                "Land_Mil_WallBig_Corner_F",
                "Land_PortableLight_double_F"
                // "Land_Pod_Heli_Transport_04_medevac_black_F", // Edited: Remove duplicate items
                // "B_Slingload_01_Fuel_F" // Edited: Remove duplicate items
            ],
            _rearming_static,  // Edited: Remove magazines from the list, default = _rearming_static + _magazines_static
            [
                //"Ammobox"
                "Land_WoodenBox_F"

            ] + (_allClassSorted select {
                _x isKindOf "ReammoBox_F" &&
                {!(_x isKindOf "Slingload_01_Base_F")} &&
                {!(_x isKindOf "Pod_Heli_Transport_04_base_F")}
            }),
            [
                //"Containers"
                "B_Slingload_01_Cargo_F", // Edited: Add containers for cargo
                "Land_Pod_Heli_Transport_04_box_black_F"
            ] + btc_containers_mat,
            [
                //"Supplies"
                btc_supplies_cargo
            ],
            [
                //"FOB"
                btc_fob_mat
            ],
            [
                //"Decontamination"
                "DeconShower_01_F"
            ],
            [
                //"Vehicle logistic"
                "ACE_Wheel",
                "ACE_Track",
                "B_Slingload_01_Ammo_F", // Edited: Add containers for vehicle logistic
                "B_Slingload_01_Repair_F",
                "B_Slingload_01_Fuel_F",
                "B_Slingload_01_Medevac_F",
                "Land_Pod_Heli_Transport_04_ammo_black_F",
                "Land_Pod_Heli_Transport_04_repair_black_F",
                "Land_Pod_Heli_Transport_04_fuel_black_F",
                "Land_Pod_Heli_Transport_04_medevac_black_F",
                "Coffin_01_F", // Edited: Add coffins
                "Coffin_02_Flag_F"
            ]
        ] // + _rearming_magazines // Edited: Remove vehicle ammo boxes
    ];
    publicVariable "btc_construction_array";
};

btc_supplies_mat params ["_food", "_water"];
private _c_array = btc_construction_array select 1;
btc_log_def_loadable = (_c_array select 0) + (_c_array select 1) + (_c_array select 2) + (_c_array select 3) + (_c_array select 4) + (_c_array select 5) + (_c_array select 6) + (_c_array select 7) + (_allClassVehicles select {_x isKindOf "ace_rearm_defaultCarriedObject"}) + _food + _water + btc_type_hazmat;
btc_log_def_can_load = (_c_array select 3);
btc_log_def_placeable = ((_c_array select 0) + (_c_array select 3) + (_c_array select 4) + (_c_array select 5) + (_c_array select 6) + _food + _water + btc_type_hazmat) select {
    getNumber(_cfgVehicles >> _x >> "ace_dragging_canCarry") isEqualTo 0
};
btc_tow_vehicleSelected = objNull;
btc_log_placing_max_h = 12;
btc_log_placing = false;
btc_log_obj_created = [];

btc_log_main_cc = [
    "Helicopter", 6,
    "Ship", 3,
    "Tank", 5,
    "Wheeled_APC", 5,
    "Truck", 10,
    "Truck_F", 10,
    "Motorcycle", 1,
    "Car", 3
];
btc_log_main_rc = [
    "Items_base_F", 2,
    "ReammoBox_F", 2,
    "thingX", 3,
    "StaticWeapon", 3,
    "Strategic", 2,
    "Motorcycle", 3,
    "Land_BarGate_F", 3,
    "HBarrier_base_F", 5,
    "Land_BagFence_Long_F", 3,
    "Wall_F", 5,
    "BagBunker_base_F", 5,
    "Wheeled_APC", 50,
    "Tank", 75,
    "Truck", 50,
    "Truck_F", 50,
    "Ship", 50,
    "Helicopter", 9999,
    "Car", 35,
    "Lamps_base_F", 2
];
btc_log_def_cc = [
    "Land_CargoBox_V1_F", 0,
    btc_supplies_cargo, 20,
    btc_fob_mat, 0,
    "Land_Cargo20_military_green_F", 20,
    "Land_Cargo40_military_green_F", 40
];
btc_log_def_rc = [
    "Land_BagBunker_Small_F", 5,
    "Land_CargoBox_V1_F", 9999,
    btc_supplies_cargo, 8,
    btc_fob_mat, 8,
    "Land_Cargo20_military_green_F", 8,
    "B_Slingload_01_Fuel_F", 20,
    "Land_Pod_Heli_Transport_04_medevac_black_F", 8
];

btc_fnc_log_get_nottowable = {
    params ["_tower"];

    switch (true) do { // Edited: make everything tow everything
        //The tower is a tank so it can't tow: plane and helicopter
        case (_tower isKindOf "Tank") : {[];};
        case (_tower isKindOf "Truck_F") : {[];};
        case (_tower isKindOf "Truck") : {[];};
        case (_tower isKindOf "Ship") : {[];};
        //The tower is a car so it can't tow: truck, tank, plane and helicopter
        case (_tower isKindOf "Car") : {[];};
        default {["Car", "Truck", "Truck_F", "Tank", "Plane", "Helicopter", "Ship"];};
    };
};

//Lift
btc_fnc_lift_getLiftable = {
    params ["_chopper"];

    private _array   = [];
    switch (typeOf _chopper) do {
        case "B_SDV_01_F" : {
            _array = ["Motorcycle", "ReammoBox", "ReammoBox_F", "StaticWeapon", "Car", "Truck", "Wheeled_APC_F", "Tracked_APC", "APC_Tracked_01_base_F", "APC_Tracked_02_base_F", "Air", "Ship", "Tank"] + ((btc_construction_array select 1) select 3) + ((btc_construction_array select 1) select 4) + ((btc_construction_array select 1) select 5);
        };
        default {
            private _MaxCargoMass = getNumber (configOf _chopper >> "slingLoadMaxCargoMass");
            switch (true) do {
                case (_MaxCargoMass <= 510) : {
                    _array = ["Motorcycle", "ReammoBox", "ReammoBox_F", "Quadbike_01_base_F", "Strategic"];
                };
                case (_MaxCargoMass <= 2100) : {
                    _array = ["Motorcycle", "ReammoBox", "ReammoBox_F", "StaticWeapon", "Car"];
                };
                case (_MaxCargoMass <= 4100) : {
                    _array = ["Motorcycle", "ReammoBox", "ReammoBox_F", "StaticWeapon", "Car", "Truck_F", "Truck", "Wheeled_APC_F", "Air", "Ship"] + ((btc_construction_array select 1) select 3) + ((btc_construction_array select 1) select 4) + ((btc_construction_array select 1) select 5);
                };
                case (_MaxCargoMass <= 14000) : {
                    _array = ["Motorcycle", "ReammoBox", "ReammoBox_F", "StaticWeapon", "Car", "Truck_F", "Truck", "Wheeled_APC_F", "Tracked_APC", "APC_Tracked_01_base_F", "APC_Tracked_02_base_F", "Air", "Ship", "Tank"] + ((btc_construction_array select 1) select 3) + ((btc_construction_array select 1) select 4) + ((btc_construction_array select 1) select 5);
                };
                default {
                    _array = ["Motorcycle", "ReammoBox", "ReammoBox_F", "StaticWeapon", "Car", "Truck_F", "Truck", "Wheeled_APC_F", "Tracked_APC", "APC_Tracked_01_base_F", "APC_Tracked_02_base_F", "Air", "Ship", "Tank"] + ((btc_construction_array select 1) select 3) + ((btc_construction_array select 1) select 4) + ((btc_construction_array select 1) select 5);
                };
            };
        };
    };
    _array
};

btc_ropes_deployed = false;
btc_lift_min_h  = 7;
btc_lift_max_h  = 12;
btc_lift_radius = 3;
btc_lift_HUD_x  = 0.874;
btc_lift_HUD_y  = 0.848;

//Mil
btc_hq = objNull;
// Get all faction from mod there are currently running
//copyToClipboard str (["EN"] call btc_fnc_get_class);
private _allfaction = ["00VTN_MILFOR_USMCW","01VTN_MILFOR_USMCD","05VTN_MILFOR_TIASF","AFR_ARMY","ARA_ARMY","ARL_ARMY","BLU_F","IND_F","OPF_F","OPF_G_F","IND_G_F","BLU_G_F","IND_E_F","IND_L_F","CEC_ARMY","CFP_B_CAF","CFP_O_IQARMY","CFP_B_ILIDF","CFP_B_NAARMY","CFP_O_SDMILITIA","CFP_O_ABUSAYYAF","CFP_B_AFGPOLICE","CFP_O_ALQAEDA","CFP_I_ALNUSRA","CFP_O_ALSHABAAB","CFP_O_BOKOHARAM","CFP_O_CFREBELS","CFP_O_HAMAS","CFP_O_HEZBOLLAH","CFP_B_IQARMY","CFP_B_IQPOLICE","CFP_O_IRARMY","CFP_O_IS","CFP_I_IS","CFP_B_KEARMY","CFP_B_MLARMY","CFP_B_PESH","CFP_O_SOREBEL","CFP_I_SSARMY","CFP_O_SSREBELS","CFP_I_SDREBELS","CFP_I_SDREBELSRF","CFP_O_SDARMY","CFP_O_SYARMY","CFP_O_TBAN","CFP_I_TUAREG","CFP_B_UGARMY","CFP_B_USRANGERS_WDL","CFP_B_USSEALS_DES","CFP_B_USSEALS_WDL","CFP_B_YPG","CFP_O_ANSARALLAH","CFP_B_CZARMY_WDL","CFP_I_WESTULTRA","CUP_B_CZ","CUP_B_GB","CUP_B_CDF","CUP_O_CHDKZ","CUP_STATIC_SHIPS","CUP_B_HIL","CUP_I_NAPA","CUP_I_RACS","CUP_B_RNZN","CUP_O_RU","CUP_O_SLA","CUP_O_TK","CUP_O_TK_MILITIA","CUP_I_UN","CUP_B_US_ARMY","CUP_B_USMC","CFP_B_GBARMY_WDL","CUP_B_GER","CFP_B_DEARMY_WDL","CUP_I_PMC_ION","CFP_O_RUARMY_DES","CUP_I_TK_GUE","CFP_B_USMC_DES","CFP_B_CDF_SNW","CFP_O_WAGNER","CFP_I_WAGNER","CFP_O_WAGNER_WIN","CFP_I_WAGNER_WIN","CFP_O_WAGNER_WDL","CFP_I_WAGNER_WDL","CFP_B_USARMY_1991_DES","CFP_B_USARMY_1991_WDL","CFP_B_USARMY_2003_DES","CFP_B_USARMY_2003_WDL","CFP_O_RUMVD","CFP_B_USCIA","CFP_B_USARMY_WDL","CFP_B_AFARMY","CFP_O_CHDKZ_SNW","OPF_R_F","TBAN","BLU_CTRG_F","OPF_GEN_F","BLU_GEN_F","BLU_T_F","CFP_O_NKARMY","FAP_ARMY","FOW_HEER","FOW_IJA_NAS","FOW_UK_FAA","FOW_USA_NAVY","FOW_WAFFENSS","FOW_AUS","FOW_LUFTWAFFE","FOW_HI","FOW_UK","FOW_USA_P","FOW_IJA","FOW_USA","FOW_USMC","GAL_ARMY","GANGBLUE_ARMY","GANGRED_ARMY","GM_FC_DK","GM_FC_GC_BGS","GM_FC_GC","GM_FC_PL","GM_FC_GE_BGS","GM_FC_GE","IBR_ZETABORN_FACTION","IBR_ROBOTFAC","ISC_ALNUSRA_I","ISC_IP_B","ISC_IS_O","ISC_IS_I","ISC_PESH_B","ISC_YPG_B","O_CAR","LM_OPCAN_URA","LIB_RKKA_W","LIB_WEHRMACHT_W","LIB_ARR","LIB_MKHL","LIB_RBAF","LIB_ACI","LIB_GUER","LIB_RAAF","LIB_RKKA","LIB_WEHRMACHT","LIB_US_101AB","LIB_US_82AB","LIB_UK_AB_W","LIB_UK_ARMY_W","LIB_US_ARMY_W","LIB_FSJ","LIB_UK_AB","LIB_UK_ARMY","LIB_UK_DR","LIB_US_ARMY","LIB_DAK","LIB_NKVD","LIB_US_RANGERS","LIB_NAC","LIB_FFI","LM_OPCAN_CGC","LM_OPCAN_CMA","LM_OPCAN_CPD","LM_OPCAN_FRI_DES","LM_OPCAN_FRI","LM_OPCAN_FRI_WDL","LM_OPCAN_KOS","LM_OPCAN_SU","LM_OPCAN_UNSC_ARMY_D","LM_OPCAN_UNSC_ARMY_MIX","LM_OPCAN_UNSC_ARMY","LM_OPCAN_UNSC_ARMY_RES","LM_OPCAN_UNSC_MC_CEA","LM_OPCAN_UNSC_MC_D","LM_OPCAN_UNSC_MC_INF","LM_OPCAN_UNSC_MC","LOP_AA","LOP_AFR_OPF","LOP_AFR","LOP_BH","LOP_CDF","LOP_CHDKZ","LOP_NAPA","LOP_GRE","LOP_IRAN","LOP_IA","LOP_IRA","LOP_ISTS_OPF","LOP_ISTS","LOP_NK","LOP_PESH_IND","LOP_PESH","LOP_AM_OPF","LOP_AM","LOP_PMC","LOP_RACS","LOP_SLA","LOP_SYR","LOP_TKA","LOP_TRK","LOP_UKR","LOP_UVF","LOP_UA","LOP_US","LOP_UN","BLU_W_F","MOL_ARMY","OPF_T_F","OPTRE_PD","OPTRE_FC_COVENANT","OPTRE_INS","OPTRE_UNSC","ISC_IA_B","RHS_FACTION_MSV","RHS_FACTION_RVA","RHS_FACTION_TV","RHS_FACTION_VDV","RHS_FACTION_VMF","RHS_FACTION_VV","RHS_FACTION_VVS_C","RHS_FACTION_VVS","RHS_FACTION_VPVO","ISC_SAA_O","RHSGREF_FACTION_CDF_AIR_B","RHSGREF_FACTION_CHDKZ","RHSGREF_FACTION_CDF_AIR","RHSSAF_FACTION_ARMY","RHSSAF_FACTION_ARMY_OPFOR","RHSSAF_FACTION_AIRFORCE_OPFOR","RHSSAF_FACTION_AIRFORCE","RHSSAF_FACTION_UN","RHS_FACTION_USARMY_D","RHS_FACTION_USARMY_WD","RHS_FACTION_USN","RHS_FACTION_SOCOM","RHS_FACTION_USAF","RHS_FACTION_USMC_D","RHS_FACTION_USMC_WD","RHSGREF_FACTION_UN","RHSGREF_FACTION_NATIONALIST","RHSGREF_FACTION_TLA","RHSGREF_FACTION_TLA_G","RHSGREF_FACTION_CDF_GROUND","RHSGREF_FACTION_CDF_GROUND_B","I_ARVN","B_MACV","O_PAVN","O_VC","SG_STURM","SG_STURMPANZER","IND_C_F","UK3CB_AAF_O","UK3CB_AAF_I","UK3CB_AAF_B","UK3CB_ANA_B","UK3CB_ANP_B","UK3CB_ADA_O","UK3CB_ADA_I","UK3CB_ADA_B","UK3CB_ADR_O","UK3CB_ADR_I","UK3CB_ADR_B","UK3CB_ADG_O","UK3CB_ADG_I","UK3CB_ADG_B","UK3CB_ADC_O","UK3CB_ADC_I","UK3CB_ADC_B","UK3CB_ADE_O","UK3CB_ADE_I","UK3CB_ADM_O","UK3CB_ADM_I","UK3CB_ADM_B","UK3CB_ADP_O","UK3CB_ADP_I","UK3CB_ADP_B","UK3CB_CHD_O","UK3CB_CHD_B","UK3CB_CHD_I","UK3CB_CHC_O","UK3CB_CHC_I","UK3CB_CHC_B","UK3CB_CCM_O","UK3CB_CCM_B","UK3CB_CCM_I","UK3CB_CPD_O","UK3CB_CPD_I","UK3CB_CPD_B","UK3CB_CW_US_B_EARLY","UK3CB_CW_US_B_LATE","UK3CB_CW_SOV_O_EARLY","UK3CB_CW_SOV_O_LATE","UK3CB_NAP_O","UK3CB_NAP_I","UK3CB_NAP_B","UK3CB_TKC_O","UK3CB_TKC_I","UK3CB_TKC_B","UK3CB_TKM_O","UK3CB_TKA_O","UK3CB_TKA_I","UK3CB_TKA_B","UK3CB_TKP_O","UK3CB_TKP_I","UK3CB_TKP_B","UK3CB_TKM_B","UK3CB_TKM_I","UK3CB_UN_I","UK3CB_UN_B","RHSGREF_FACTION_CDF_NG","RHSGREF_FACTION_CDF_NG_B","RHSGREF_FACTION_CHDKZ_G","RHSGREF_FACTION_HIDF","UNSUNG_AUS","UNSUNG_NZ","UNSUNG_ROK","UNSUNG_W","UNSUNG_EV","UNSUNG_E","UNSUNG_G","02VTN_MILFOR_RC","01VTN_INSURGENTS_RU","03VTN_INSURGENTS_ISIL","00VTN_MILFOR_MIW_EMR","01VTN_MILFOR_MIW","00VTN_MILITIA_RU","03VTN_MILFOR_SPPU","07VTN_MILFOR_TNG"]; //All factions
_p_en = _allfaction select _p_en; //Select faction selected from mission parameter
_allclasse = [[_p_en], _p_en_AA, _p_en_tank] call btc_fnc_mil_class; //Create classes from factions, you can combine factions like that: [[_p_en , "IND_F"], _p_en_AA, _p_en_tank] call btc_fnc_mil_class;

//Save class name to global variable
btc_enemy_side = _allclasse select 0;
btc_type_units = _allclasse select 1;
btc_type_divers = _allclasse select 2;
btc_type_crewmen = _allclasse select 3;
btc_type_boats = _allclasse select 4;
btc_type_motorized = _allclasse select 5;
btc_type_motorized_armed = _allclasse select 6;
btc_type_mg = _allclasse select 7;
btc_type_gl = _allclasse select 8;

//Sometimes you need to remove units: - ["Blabla","moreBlabla"];
//Sometimes you need to add units: + ["Blabla","moreBlabla"];
switch (_p_en) do {
    /*case "Myfactionexemple" : {
        btc_type_units = btc_type_units - ["Blabla","moreBlabla"];
        btc_type_divers = btc_type_divers + ["Blabla","moreBlabla"];
        btc_type_crewmen = "Blabla";
        btc_type_boats = btc_type_boats;
        btc_type_motorized = btc_type_motorized;
        btc_type_mg = btc_type_mg;
        btc_type_gl = btc_type_gl;
    };*/
    case "OPF_G_F" : {
        btc_type_motorized = btc_type_motorized + ["I_Truck_02_transport_F", "I_Truck_02_covered_F"];
        btc_type_motorized_armed = btc_type_motorized_armed + ["I_Heli_light_03_F"];
    };
    case "IND_C_F" : {
        btc_type_motorized = btc_type_motorized + ["I_G_Offroad_01_repair_F", "I_G_Offroad_01_F", "I_G_Quadbike_01_F", "I_G_Van_01_fuel_F", "I_Truck_02_transport_F", "I_Truck_02_covered_F"];
        btc_type_motorized_armed = btc_type_motorized_armed + ["I_Heli_light_03_F", "I_G_Offroad_01_F"];
        btc_type_units = btc_type_units - ["I_C_Soldier_Camo_F"];
    };
    // Edited: Modify RHSAFRF Faction
    case "RHS_FACTION_VDV" : {
        btc_type_units = 
            ["rhs_msv_emr_aa","rhs_msv_emr_at","rhs_msv_emr_arifleman","rhs_msv_emr_efreitor","rhs_msv_emr_grenadier_rpg","rhs_msv_emr_junior_sergeant","rhs_msv_emr_machinegunner","rhs_msv_emr_marksman","rhs_msv_emr_rifleman","rhs_msv_emr_grenadier","rhs_msv_emr_LAT","rhs_msv_emr_RShG2","rhs_msv_emr_sergeant","rhs_msv_aa","rhs_msv_at","rhs_msv_arifleman","rhs_msv_efreitor","rhs_msv_grenadier_rpg","rhs_msv_junior_sergeant","rhs_msv_machinegunner","rhs_msv_marksman","rhs_msv_rifleman","rhs_msv_grenadier","rhs_msv_LAT","rhs_msv_RShG2","rhs_msv_sergeant","rhs_vdv_aa","rhs_vdv_at","rhs_vdv_arifleman","rhs_vdv_efreitor","rhs_vdv_grenadier_rpg","rhs_vdv_junior_sergeant","rhs_vdv_machinegunner","rhs_vdv_marksman","rhs_vdv_marksman_asval","rhs_vdv_rifleman","rhs_vdv_rifleman_asval","rhs_vdv_grenadier","rhs_vdv_grenadier_alt","rhs_vdv_LAT","rhs_vdv_RShG2","rhs_vdv_rifleman_alt","rhs_vdv_sergeant","rhs_vdv_des_aa","rhs_vdv_des_at","rhs_vdv_des_arifleman","rhs_vdv_des_efreitor","rhs_vdv_des_grenadier_rpg","rhs_vdv_des_junior_sergeant","rhs_vdv_des_machinegunner","rhs_vdv_des_marksman","rhs_vdv_des_marksman_asval","rhs_vdv_des_rifleman","rhs_vdv_des_rifleman_asval","rhs_vdv_des_grenadier","rhs_vdv_des_LAT","rhs_vdv_des_RShG2","rhs_vdv_des_sergeant","rhs_vdv_flora_aa","rhs_vdv_flora_at","rhs_vdv_flora_efreitor","rhs_vdv_flora_grenadier_rpg","rhs_vdv_flora_junior_sergeant","rhs_vdv_flora_machinegunner","rhs_vdv_flora_marksman","rhs_vdv_flora_rifleman","rhs_vdv_flora_grenadier","rhs_vdv_flora_LAT","rhs_vdv_flora_RShG2","rhs_vdv_flora_sergeant","rhs_vdv_mflora_aa","rhs_vdv_mflora_at","rhs_vdv_mflora_efreitor","rhs_vdv_mflora_grenadier_rpg","rhs_vdv_mflora_junior_sergeant","rhs_vdv_mflora_machinegunner","rhs_vdv_mflora_marksman","rhs_vdv_mflora_rifleman","rhs_vdv_mflora_grenadier","rhs_vdv_mflora_LAT","rhs_vdv_mflora_RShG2","rhs_vdv_mflora_sergeant","rhs_vdv_recon_arifleman","rhs_vdv_recon_efreitor","rhs_vdv_recon_marksman","rhs_vdv_recon_marksman_asval","rhs_vdv_recon_marksman_vss","rhs_vdv_recon_rifleman","rhs_vdv_recon_rifleman_ak103","rhs_vdv_recon_rifleman_akms","rhs_vdv_recon_rifleman_asval","rhs_vdv_recon_grenadier","rhs_vdv_recon_rifleman_lat","rhs_vdv_recon_rifleman_scout_akm","rhs_vdv_recon_rifleman_scout","rhs_vdv_recon_grenadier_scout","rhs_vdv_recon_arifleman_scout","rhs_vdv_recon_sergeant","rhs_vmf_flora_aa","rhs_vmf_flora_at","rhs_vmf_flora_efreitor","rhs_vmf_flora_grenadier_rpg","rhs_vmf_flora_junior_sergeant","rhs_vmf_flora_machinegunner","rhs_vmf_flora_marksman","rhs_vmf_flora_rifleman","rhs_vmf_flora_grenadier","rhs_vmf_flora_LAT","rhs_vmf_flora_RShG2","rhs_vmf_flora_sergeant","rhs_vmf_recon_arifleman","rhs_vmf_recon_efreitor","rhs_vmf_recon_marksman","rhs_vmf_recon_marksman_vss","rhs_vmf_recon_rifleman","rhs_vmf_recon_rifleman_akms","rhs_vmf_recon_rifleman_asval","rhs_vmf_recon_grenadier","rhs_vmf_recon_rifleman_lat","rhs_vmf_recon_rifleman_scout_akm","rhs_vmf_recon_rifleman_scout","rhs_vmf_recon_grenadier_scout","rhs_vmf_recon_arifleman_scout","rhs_vmf_recon_sergeant","rhs_mvd_izlom_arifleman","rhs_mvd_izlom_efreitor","rhs_mvd_izlom_grenadier_rpg","rhs_mvd_izlom_machinegunner","rhs_mvd_izlom_marksman","rhs_mvd_izlom_marksman_vss","rhs_mvd_izlom_rifleman","rhs_mvd_izlom_rifleman_asval","rhs_mvd_izlom_rifleman_LAT","rhs_mvd_izlom_sergeant"] // Edited: Add RHSAFRF infantries
            + ["O_R_Soldier_GL_F","O_R_Soldier_LAT_F","O_R_soldier_exp_F","O_R_soldier_M_F","O_R_JTAC_F","O_R_Soldier_AR_F","O_R_Patrol_Soldier_TL_F","O_R_Patrol_Soldier_GL_F","O_R_Patrol_Soldier_LAT_F","O_R_Patrol_Soldier_M_F","O_R_Patrol_Soldier_M2_F","O_R_Patrol_Soldier_AR_F","O_R_Patrol_Soldier_AR2_F","O_R_recon_LAT_F","O_R_recon_TL_F","O_R_recon_GL_F","O_R_recon_exp_F","O_R_recon_M_F","O_R_recon_JTAC_F","O_R_recon_AR_F","O_R_Soldier_TL_F"] // Edited: Add Contact DLC Russian Special Military infantries
            + ["min_rf_soldier_AT","min_rf_soldier_AA","min_rf_soldier_TL","min_rf_soldier_mine","min_rf_soldier_GL","min_rf_soldier","min_rf_soldier_LAT","min_rf_soldier_exp","min_rf_soldier_SL","min_rf_soldier_M","min_rf_soldier_AR","min_rf_soldierU_AT","min_rf_soldierU_AA","min_rf_soldierU_TL","min_rf_soldierU_mine","min_rf_soldierU_GL","min_rf_soldierU","min_rf_soldierU_LAT","min_rf_soldierU_exp","min_rf_soldierU_SL","min_rf_soldierU_M","min_rf_soldierU_AR","min_rf_recon","min_rf_recon_LAT","min_rf_recon_TL","min_rf_recon_exp","min_rf_recon_M","min_rf_recon_JTAC","min_rf_sniper","min_rf_spotter","min_rf_recon_saboteur","min_rf_spetsnaz_AR","min_rf_spetsnaz_GL","min_rf_spetsnaz_O","min_rf_spetsnaz","min_rf_spetsnaz_M","min_rf_spetsnaz_TL","min_rf_soldier_desert_AT","min_rf_soldier_desert_AA","min_rf_soldier_desert_TL","min_rf_soldier_desert_mine","min_rf_soldier_desert_GL","min_rf_soldier_desert","min_rf_soldier_desert_LAT","min_rf_soldier_desert_exp","min_rf_soldier_desert_SL","min_rf_soldier_desert_M","min_rf_soldier_desert_AR","min_rf_recon_desert","min_rf_recon_desert_LAT","min_rf_recon_desert_M","min_rf_recon_desert_JTAC","min_rf_sniper_desert","min_rf_spotter_desert","min_rf_recon_desert_saboteur","min_rf_spetsnaz_desert_AR","min_rf_spetsnaz_desert","min_rf_spetsnaz_desert_M","min_rf_spetsnaz_desert_TL","min_rf_soldier_winter_AT","min_rf_soldier_winter_AA","min_rf_soldier_winter_TL","min_rf_soldier_winter_mine","min_rf_soldier_winter_GL","min_rf_soldier_winter","min_rf_soldier_winter_LAT","min_rf_soldier_winter_exp","min_rf_soldier_winter_SL","min_rf_soldier_winter_M","min_rf_soldier_winter_AR","min_rf_recon_winter","min_rf_recon_winter_LAT","min_rf_recon_winter_TL","min_rf_recon_winter_exp","min_rf_recon_winter_M","min_rf_recon_winter_JTAC","min_rf_sniper_winter","min_rf_spotter_winter","min_rf_recon_winter_saboteur","min_rf_recon_desert_TL","min_rf_recon_desert_exp","min_rf_spetsnaz_desert_GL","min_rf_spetsnaz_desert_O"] // Edited: Add 2035 Russian Armed Forces infantries
            + ["I_E_Officer_F","I_E_Soldier_MP_F","I_E_Soldier_AT_F","I_E_Soldier_AA_F","I_E_Soldier_TL_F","I_E_Engineer_F","I_E_Soldier_A_F","I_E_Medic_F","I_E_soldier_Mine_F","I_E_Soldier_Pathfinder_F","I_E_Soldier_GL_F","I_E_Soldier_F","I_E_Soldier_LAT_F","I_E_Soldier_LAT2_F","I_E_Soldier_lite_F","I_E_Soldier_Exp_F","I_E_Soldier_SL_F","I_E_Soldier_CBRN_F","I_E_soldier_M_F","I_E_Soldier_Repair_F","I_E_Soldier_AAR_F","I_E_Soldier_AR_F","I_E_Soldier_AAT_F","I_E_Soldier_AAA_F","I_E_RadioOperator_F"] // Edited: Add Contact DLC LDF infantries
            + ["O_G_Soldier_GL_F","O_G_Soldier_LAT_F","O_G_Soldier_LAT2_F","O_G_Soldier_exp_F","O_G_Soldier_M_F","O_G_Soldier_AR_F"] // Edited: Add FIA infantries
            + ["I_C_Soldier_Para_5_F","I_C_Soldier_Para_6_F","I_C_Soldier_Para_1_F","I_C_Soldier_Para_2_F","I_C_Soldier_Para_4_F","I_C_Soldier_Para_8_F","I_C_Soldier_Para_7_F","I_C_Soldier_Bandit_7_F","I_C_Soldier_Bandit_3_F","I_C_Soldier_Bandit_8_F","I_C_Soldier_Bandit_5_F","I_C_Soldier_Bandit_4_F","I_C_Soldier_Bandit_6_F","I_C_Soldier_Bandit_2_F"] // Edited: Add Syndicate infantries
            + ["I_L_Looter_Rifle_F","I_L_Looter_SG_F","I_L_Hunter_F","I_L_Criminal_SG_F"] // Edited: Add Looter infantries
            // + ["O_Soldier_TL_F","O_Soldier_AT_F","O_Soldier_AA_F","O_Soldier_GL_F","O_Soldier_F","O_Soldier_LAT_F","O_Soldier_HAT_F","O_soldier_exp_F","O_Soldier_SL_F","O_Sharpshooter_F","O_soldier_M_F","O_Soldier_AR_F","O_HeavyGunner_F","O_soldierU_AT_F","O_soldierU_AA_F","O_soldierU_TL_F","O_SoldierU_GL_F","O_soldierU_F","O_soldierU_LAT_F","O_soldierU_exp_F","O_SoldierU_SL_F","O_Urban_Sharpshooter_F","O_soldierU_M_F","O_soldierU_AR_F","O_Urban_HeavyGunner_F","O_recon_F","O_recon_LAT_F","O_recon_TL_F","O_Pathfinder_F","O_recon_exp_F","O_recon_M_F","O_sniper_F","O_ghillie_sard_F","O_ghillie_lsh_F","O_ghillie_ard_F","O_spotter_F","O_recon_JTAC_F"] // Edited: Add CSAT infantries
            // + ["TEC_O_Soldier_AR_F","TEC_O_Soldier_EXP_F","TEC_O_Soldier_GL_F","TEC_O_Soldier_HG_F","TEC_O_Soldier_M_F","TEC_O_Soldier_Mine_F","TEC_O_Soldier_AA_F","TEC_O_Soldier_AT_F","TEC_O_Soldier_F","TEC_O_Soldier_LAT_F","TEC_O_Soldier_HAT_F","TEC_O_Soldier_Patrol_F","TEC_O_Soldier_SMG_F","TEC_O_Soldier_SS_F","TEC_O_Soldier_SL_F","TEC_O_Soldier_TL_F","TEC_O_Soldier_Urban_AR_F","TEC_O_Soldier_Urban_EXP_F","TEC_O_Soldier_Urban_GL_F","TEC_O_Soldier_Urban_HG_F","TEC_O_Recon_EXP_F","TEC_O_Recon_JTAC_F","TEC_O_Recon_M_F","TEC_O_Recon_PT_F","TEC_O_Recon_F","TEC_O_Recon_LAT_F","TEC_O_Recon_SMG_F","TEC_O_Recon_TL_F","TEC_O_Soldier_CBRN_AR_F","TEC_O_Soldier_CBRN_EXP_F","TEC_O_Soldier_CBRN_GL_F","TEC_O_Soldier_CBRN_HG_F","TEC_O_Soldier_CBRN_M_F","TEC_O_Soldier_CBRN_Mine_F","TEC_O_Soldier_CBRN_AA_F","TEC_O_Soldier_CBRN_AT_F","TEC_O_Soldier_CBRN_F","TEC_O_Soldier_CBRN_LAT_F","TEC_O_Soldier_CBRN_HAT_F","TEC_O_Soldier_CBRN_Patrol_F","TEC_O_Soldier_CBRN_SMG_F","TEC_O_Soldier_CBRN_SS_F","TEC_O_Soldier_CBRN_SL_F","TEC_O_Soldier_CBRN_TL_F","TEC_O_Soldier_Semiarid_AR_F","TEC_O_Soldier_Semiarid_EXP_F","TEC_O_Soldier_Semiarid_GL_F","TEC_O_Soldier_Semiarid_HG_F","TEC_O_Soldier_Semiarid_M_F","TEC_O_Soldier_Semiarid_Mine_F","TEC_O_Soldier_Semiarid_AA_F","TEC_O_Soldier_Semiarid_AT_F","TEC_O_Soldier_Semiarid_F","TEC_O_Soldier_Semiarid_LAT_F","TEC_O_Soldier_Semiarid_HAT_F","TEC_O_Soldier_Semiarid_Patrol_F","TEC_O_Soldier_Semiarid_SMG_F","TEC_O_Soldier_Semiarid_SS_F","TEC_O_Soldier_Semiarid_SL_F","TEC_O_Soldier_Semiarid_TL_F","TEC_O_Sailor_M_F","TEC_O_Chief_C_F","TEC_O_Soldier_AAR_F","TEC_O_Sailor_C_F","TEC_O_Sailor_SMG_F","TEC_O_SOF_EXP_F","TEC_O_SOF_HG_F","TEC_O_SOF_M_F","TEC_O_SOF_F","TEC_O_SOF_LAT_F","TEC_O_SOF_SMG_F","TEC_O_SOF_AR_F","TEC_O_SOF_SS_F","TEC_O_SOF_TL_F","TEC_O_SOF_EXP_Woodland_F","TEC_O_SOF_HG_Woodland_F","TEC_O_SOF_M_Woodland_F","TEC_O_SOF_Woodland_F","TEC_O_SOF_LAT_Woodland_F","TEC_O_SOF_SMG_Woodland_F","TEC_O_SOF_AR_Woodland_F","TEC_O_SOF_SS_Woodland_F","TEC_O_Viper_EXP_F","TEC_O_Viper_JTAC_F","TEC_O_Viper_M_F","TEC_O_Viper_F","TEC_O_Viper_LAT_F","TEC_O_Viper_TL_F","TEC_O_Sniper_F","TEC_O_Sniper_Arid_F","TEC_O_Sniper_Scout_F","TEC_O_Sniper_Semiarid_F","TEC_O_Viper_Sniper_F","TEC_O_Spotter_F","TEC_O_Spotter_Scout_F","TEC_O_Viper_Spotter_F","TEC_O_Sniper_Woodland_F","TEC_O_Sniper_Jungle_F","TEC_O_Sniper_Lush_F","TEC_O_Sniper_Woodland_Scout_F","TEC_O_Viper_Sniper_Woodland_F","TEC_O_Spotter_Woodland_F","TEC_O_Spotter_Woodland_Scout_F","TEC_O_Viper_Spotter_Woodland_F","TEC_O_Viper_EXP_Woodland_F","TEC_O_Viper_JTAC_Woodland_F","TEC_O_Viper_M_Woodland_F","TEC_O_Viper_Woodland_F","TEC_O_Viper_LAT_Woodland_F","TEC_O_Viper_TL_Woodland_F","TEC_O_Soldier_Woodland_AR_F","TEC_O_Soldier_Woodland_EXP_F","TEC_O_Soldier_Woodland_GL_F","TEC_O_Soldier_Woodland_HG_F","TEC_O_Soldier_Woodland_M_F","TEC_O_Soldier_Woodland_Mine_F","TEC_O_Soldier_Woodland_AA_F","TEC_O_Soldier_Woodland_AT_F","TEC_O_Soldier_Woodland_F","TEC_O_Soldier_Woodland_LAT_F","TEC_O_Soldier_Woodland_HAT_F","TEC_O_Soldier_Woodland_Patrol_F","TEC_O_Soldier_Woodland_SMG_F","TEC_O_Soldier_Woodland_SS_F","TEC_O_Soldier_Woodland_SL_F","TEC_O_Soldier_Woodland_TL_F","TEC_O_Soldier_CBRN_Woodland_AR_F","TEC_O_Soldier_CBRN_Woodland_EXP_F","TEC_O_Soldier_CBRN_Woodland_GL_F","TEC_O_Soldier_CBRN_Woodland_HG_F","TEC_O_Soldier_CBRN_Woodland_M_F","TEC_O_Soldier_CBRN_Woodland_Mine_F","TEC_O_Soldier_CBRN_Woodland_AA_F","TEC_O_Soldier_CBRN_Woodland_AT_F","TEC_O_Soldier_CBRN_Woodland_F","TEC_O_Soldier_CBRN_Woodland_LAT_F","TEC_O_Soldier_CBRN_Woodland_HAT_F","TEC_O_Soldier_CBRN_Woodland_Patrol_F","TEC_O_Soldier_CBRN_Woodland_SMG_F","TEC_O_Soldier_CBRN_Woodland_SS_F","TEC_O_Soldier_CBRN_Woodland_TL_F","TEC_O_Recon_EXP_Woodland_F","TEC_O_Recon_JTAC_Woodland_F","TEC_O_Recon_M_Woodland_F","TEC_O_Recon_PT_Woodland_F","TEC_O_Recon_Woodland_F","TEC_O_Recon_LAT_Woodland_F","TEC_O_Recon_SMG_Woodland_F","TEC_O_Recon_TL_Woodland_F","TEC_O_Soldier_Woodland_AAR_F","TEC_O_Soldier_Urban_M_F","TEC_O_Soldier_Urban_Mine_F","TEC_O_Soldier_Urban_AA_F","TEC_O_Soldier_Urban_AT_F","TEC_O_Soldier_Urban_F","TEC_O_Soldier_Urban_LAT_F","TEC_O_Soldier_Urban_HAT_F","TEC_O_Soldier_Urban_Patrol_F","TEC_O_Soldier_Urban_SMG_F","TEC_O_Soldier_Urban_SS_F","TEC_O_Soldier_Urban_SL_F","TEC_O_Soldier_Urban_TL_F","TEC_O_SOF_TL_Woodland_F"] // Edited: Add CSAT Modification Project infantries
            + ["AGE_Alpha_Camo_G_Sniper","AGE_Alpha_Camo_G_Marksman","AGE_Alpha_Camo_G_Soldier_AK105C","AGE_Alpha_Camo_G_Soldier_AK74M","AGE_Alpha_Camo_G_Soldier_MP9","AGE_Alpha_Camo_G_Teamleader","AGE_Alpha_Marksman","AGE_Alpha_Sniper","AGE_Alpha_Soldier_AK105C","AGE_Alpha_Soldier_AK74M","AGE_Alpha_Soldier_MP9","AGE_Alpha_Teamleader","AGE_Alpha_Camo_D_Marksman","AGE_Alpha_Camo_D_Sniper","AGE_Alpha_Camo_D_Soldier_AK105C","AGE_Alpha_Camo_D_Soldier_AK74M","AGE_Alpha_Camo_D_Soldier_MP9","AGE_Alpha_Camo_D_Teamleader","AGE_Insurgent_AK74M","AGE_Insurgent_AKM","AGE_Insurgent_AKMS","AGE_Insurgent_AKS","AGE_Insurgent_AT","AGE_Insurgent_CETME","AGE_Insurgent_Heavy_AK74M","AGE_Insurgent_Heavy_AKMS","AGE_Insurgent_Uzi","AGE_Insurgent_Leader","AGE_Insurgent_Marksman","AGE_Terrorist_Leader","AGE_Terrorist_AK74M","AGE_Terrorist_AKM","AGE_Terrorist_AKMS","AGE_Terrorist_AKS","AGE_Terrorist_MP5","AGE_Terrorist_MP9","AGE_Terrorist_Stechkin","AGE_Terrorist_Uzi"]; // Edited: Add Alpha Group Faction
        btc_type_motorized =
            ["RHS_Mi24P_vvs","RHS_Mi8AMTSh_vvs","RHS_Mi8MTV3_heavy_vvs","RHS_Ka52_vvs","rhs_mi28n_vvs","RHS_Su25SM_vvs","rhs_mig29sm_vvs","RHS_T50_vvs_generic_ext"]
            + ["min_rf_heli_light_black","min_rf_ka_52","min_rf_su_34","min_rf_ka_52_grey","min_rf_heli_light_grey"] // Edited: Add 2035 Russian Armed Forces vehicles
            + ["I_E_Heli_light_03_dynamicLoadout_F"] // Edited: Add Contact DLC LDF vehicles
            + ["O_Plane_Fighter_02_F","O_Plane_CAS_02_dynamicLoadout_F","O_Heli_Transport_04_covered_F","O_Heli_Attack_02_dynamicLoadout_F","O_Heli_Light_02_dynamicLoadout_F","O_T_VTOL_02_infantry_dynamicLoadout_F"] // Edited: Add CSAT and CSAT Pacific vehicles
            + ["TEC_VH_Helicopter_Keftar_F","TEC_VH_UAV_03_F","TEC_VH_Helicopter_Keftar_Navy_F","TEC_VH_Helicopter_Orca_Navy_Armed_F","TEC_VH_Navy_VTOL_Xian_Infantry","TEC_VH_Helicopter_Keftar_SOF_F","TEC_VH_WD_Helicopter_Keftar","TEC_VH_WD_Helicopter_Kajman","TEC_VH_WD_Helicopter_Orca_Armed","TEC_VH_WD_Helicopter_Taru_Transport","TEC_VH_WD_Jet_Neophron","TEC_VH_WD_Jet_Shikra","TEC_VH_WD_Plane_Shahan","TEC_VH_Plane_Shahan_F","TEC_VH_Plane_Shahan_Navy_F"] // Edited: Add CSAT Modification Project vehicles
            + ["I_Heli_Transport_02_LDF_F"]; // Edited: Add Livonia Project vehicles
        btc_type_motorized_armed =
            ["RHS_BM21_VDV_01","rhs_2s3_tv","rhs_2s1_vmf","rhs_zsu234_aa","RHS_Ural_Zu23_VDV_01","rhs_sprut_vdv","rhs_t72be_tv","rhs_t80um","rhs_t90sm_tv","rhs_btr80a_vdv","rhs_bmd1r","rhs_bmd2m","rhs_bmd4m_vdv","rhs_bmd4ma_vdv","rhs_brm1k_vdv","rhs_tigr_sts_vdv","rhs_kamaz5350_vdv","rhs_bmp2_vdv","rhs_bmp2e_vdv","rhs_bmp2d_vdv","rhs_t15_tv"]
            + ["min_rf_t_14","min_rf_2b26","min_rf_t_15","min_rf_gaz_2330_HMG","min_rf_truck_covered","min_rf_sa_22","min_rf_t_14_desert","min_rf_2b26_desert","min_rf_t_15_desert","min_rf_gaz_2330_HMG_desert","min_rf_truck_covered_desert","min_rf_sa_22_desert","min_rf_t_14_winter","min_rf_2b26_winter","min_rf_t_15_winter","min_rf_gaz_2330_HMG_winter","min_rf_truck_covered_winter","min_rf_sa_22_winter"] // Edited: Add 2035 Russian Armed Forces vehicles
            + ["I_E_APC_tracked_03_cannon_F","I_E_Truck_02_MRL_F","I_E_Truck_02_F"] // Edited: Add Contact DLC LDF vehicles
            + ["O_G_Offroad_01_armed_F","O_G_Offroad_01_AT_F","O_G_Van_02_transport_F"] // Edited: Add FIA vehicles
            + ["I_C_Van_02_transport_F","I_C_Offroad_02_LMG_F","I_C_Offroad_02_AT_F"] // Edited: Add Syndicate vehicles
            + ["O_LSV_02_AT_F","O_LSV_02_armed_F","O_Truck_02_covered_F","O_Truck_03_covered_F","O_MRAP_02_gmg_F","O_MRAP_02_hmg_F","O_APC_Tracked_02_AA_F","O_MBT_04_cannon_F","O_MBT_04_command_F","O_MBT_02_cannon_F","O_MBT_02_arty_F","O_APC_Wheeled_02_rcws_v2_F","O_APC_Tracked_02_cannon_F","O_T_MBT_04_cannon_F","O_T_MBT_04_command_F","O_T_MBT_02_cannon_ghex_F","O_T_MBT_02_arty_ghex_F","O_T_APC_Wheeled_02_rcws_v2_ghex_F","O_T_APC_Tracked_02_cannon_ghex_F","O_T_LSV_02_AT_F","O_T_LSV_02_armed_F","O_T_Truck_03_covered_ghex_F","O_T_MRAP_02_gmg_ghex_F","O_T_MRAP_02_hmg_ghex_F","O_T_Truck_02_F","O_T_APC_Tracked_02_AA_ghex_F"] // Edited: Add CSAT and CSAT Pacific vehicles
            + ["TEC_VH_Truck_Zamak_MLRS","TEC_VH_MRAP_Abda_GMG","TEC_VH_MRAP_Abda_HMG","TEC_VH_MRAP_Shir_GMG","TEC_VH_MRAP_Shir_HMG","TEC_VH_Truck_Zamak_Covered_GMG","TEC_VH_Truck_Zamak_Covered_HMG","TEC_VH_WD_Truck_Zamak_MLRS","TEC_VH_WD_MRAP_Abda_GMG","TEC_VH_WD_MRAP_Abda_HMG","TEC_VH_WD_MRAP_Shir_GMG","TEC_VH_WD_MRAP_Shir_HMG","TEC_VH_WD_Truck_Zamak_Covered_GMG","TEC_VH_WD_Truck_Zamak_Covered_HMG"] // Edited: Add CSAT Modification Project vehicles
            + ["I_LT_01_AT_LDF_F","I_LT_01_Cannon_LDF_F","I_MBT_03_Cannon_LDF_F","I_Heli_Transport_02_LDF_F","I_APC_Wheeled_03_Cannon_LDF_F","I_LT_01_AA_LDF_F"]; // Edited: Add Livonia Project vehicles
        btc_type_mg = ["rhs_KORD_VDV","rhs_KORD_high_VDV","RHS_NSV_TriPod_VDV","RHS_AGS30_TriPod_VDV"] + ["O_HMG_01_F","O_HMG_01_high_F","O_GMG_01_F","O_GMG_01_high_F"] + ["min_rf_AGS_30","min_rf_Kord"];
        btc_type_gl = ["rhs_Metis_9k115_2_vdv","rhs_Kornet_9M133_2_vdv","rhs_SPG9M_VDV"] + ["min_rf_Metis"];
        btc_type_motar = ["O_G_Mortar_01_F","rhs_2b14_82mm_vdv","rhs_D30_vmf","RHS_ZU23_VDV","rhs_Igla_AA_pod_vdv"]; // Edited: Add a new type for enemy mortar and static AA
    };
};

//Chem
btc_chem_range = 3;

//Spect
btc_spect_range = 1000;
btc_spect_updateOn = -1;

//Rep
btc_rep_bonus_cache = 100;
btc_rep_bonus_civ_hh = 3;
btc_rep_bonus_disarm = 15;
btc_rep_bonus_hideout = 200;
btc_rep_bonus_mil_killed = 1; // Edited: Increase reputation gain every enemy killed, default = 0.25
btc_rep_bonus_IEDCleanUp = 10;
btc_rep_bonus_removeTag = 3;
btc_rep_bonus_removeTagLetter = 0.5;
btc_rep_bonus_foodGive = 0.5;

btc_rep_malus_civ_hd = - 2;
btc_rep_malus_animal_hd = - 1;
btc_rep_malus_civ_killed = - 10;
btc_rep_malus_animal_killed = - 5;
btc_rep_malus_civ_suppressed = - 4;
btc_rep_malus_player_respawn = 0; // Edited: Player respawn does not affect reputation anymore, default = - 10
btc_rep_malus_veh_killed = 0; // Edited: Player vehicle killed does not affect reputation anymore, default = - 25
btc_rep_malus_building_damaged = - 2.5;
btc_rep_malus_building_destroyed = - 5;
btc_rep_malus_foodRemove = - btc_rep_bonus_foodGive;
btc_rep_malus_breakDoor = - 2;

//Skill
btc_AI_skill = _p_skill;

//Headless
btc_units_owners = [];

btc_player_type = ["SoldierWB", "SoldierEB", "SoldierGB"] select ([west, east, independent] find btc_player_side);

//Door
btc_door_breaking_time = 60;

// Edited: Add vehicle type list for vehicle side mission to use
side_vehicle_types = ["RHS_MELB_MH6M","RHS_AH64D","RHS_UH1Y_FFAR","RHS_AH1Z","B_T_LSV_01_armed_F","B_APC_Tracked_01_AA_F","B_AFV_Wheeled_01_up_cannon_F","B_APC_Wheeled_01_cannon_F","B_APC_Tracked_01_CRV_F","rhsusf_m1043_d_s_m2","rhsusf_m1043_d_s_mk19","rhsusf_M1230a1_usarmy_d","rhsusf_M1237_M2_usarmy_d","rhsusf_M1237_MK19_usarmy_d","rhsusf_m1245_m2crows_socom_d","rhsusf_m1245_mk19crows_socom_d","rhsusf_m1a2sep1tuskiid_usarmy","RHS_M2A3_BUSKIII","rhsusf_m966_d","B_MBT_01_TUSK_F","B_MBT_01_mlrs_F","B_Heli_Attack_01_dynamicLoadout_F","B_MRAP_01_gmg_F","B_MRAP_01_hmg_F","rhsusf_m1a1aim_tuski_d","rhsusf_M1117_D","rhsusf_m109d_usarmy","rhsusf_M142_usarmy_D","RHS_M6","RHS_M2A2_BUSKI","rhsusf_stryker_m1126_m2_d","rhsusf_stryker_m1126_mk19_d","B_APC_Tracked_01_rcws_F","B_Heli_Light_01_dynamicLoadout_F","RHS_MELB_AH6M","rhsusf_CGRCAT1A2_M2_usmc_d","rhsusf_CGRCAT1A2_Mk19_usmc_d","rhsusf_M1238A1_M2_socom_d","rhsusf_M1238A1_Mk19_socom_d","Leopard_2_d"];
