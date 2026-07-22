{$IFDEF read_interface}

const
  GST_H266_MAX_SAMPLE_ARRAYS = 3;
  GST_H266_MAX_LAYERS = 64;
  GST_H266_MAX_SUBLAYERS = 7;
  GST_H266_MAX_SLI_REF_LEVELS = 8;
  GST_H266_MAX_TOTAL_NUM_OLSS = 257;
  GST_H266_MAX_PTLS = GST_H266_MAX_TOTAL_NUM_OLSS;
  GST_H266_MAX_VPS_COUNT = 16;
  GST_H266_MAX_SPS_COUNT = 16;
  GST_H266_MAX_PPS_COUNT = 64;
  GST_H266_MAX_APS_COUNT = 8;
  GST_H266_MAX_SUB_PROFILES = 256;
  GST_H266_MAX_DPB_SIZE = 16;
  GST_H266_MAX_REF_PIC_LISTS = 64;
  GST_H266_NUM_ALF_FILTERS = 25;
  GST_H266_MAX_REF_ENTRIES = GST_H266_MAX_DPB_SIZE + 13;
  GST_H266_MAX_POINTS_IN_QP_TABLE = 111;
  GST_H266_MAX_CPB_CNT = 32;
  GST_H266_MAX_LUMA_PS = 35651584;
  GST_H266_MAX_WIDTH = 16888;
  GST_H266_MAX_HEIGHT = 16888;
  GST_H266_MAX_TILES_PER_AU = 440;
  GST_H266_MAX_TILE_ROWS = GST_H266_MAX_TILES_PER_AU;
  GST_H266_MAX_TILE_COLUMNS = 20;
  GST_H266_MAX_SLICES_PER_AU = 1000;
  GST_H266_MAX_ENTRY_POINTS = GST_H266_MAX_TILE_COLUMNS * 135;
  GST_H266_MAX_CTUS_IN_PICTURE = (80216064 div 8) div 32;
  GST_H266_MAX_DECODING_UNITS_IN_PIC_TIMING = 600;

type
  PGstH266ParserResult = ^TGstH266ParserResult;
  TGstH266ParserResult = longint;
const
  GST_H266_PARSER_OK = 0;
  GST_H266_PARSER_BROKEN_DATA = 1;
  GST_H266_PARSER_BROKEN_LINK = 2;
  GST_H266_PARSER_ERROR = 3;
  GST_H266_PARSER_NO_NAL = 4;
  GST_H266_PARSER_NO_NAL_END = 5;

type
  PGstH266Profile = ^TGstH266Profile;
  TGstH266Profile = longint;
const
  GST_H266_PROFILE_INVALID = -(1);
  GST_H266_PROFILE_NONE = 0;
  GST_H266_PROFILE_INTRA = 8;
  GST_H266_PROFILE_STILL_PICTURE = 64;
  GST_H266_PROFILE_MAIN_10 = 1;
  GST_H266_PROFILE_MAIN_10_STILL_PICTURE = GST_H266_PROFILE_MAIN_10 or GST_H266_PROFILE_STILL_PICTURE;
  GST_H266_PROFILE_MULTILAYER_MAIN_10 = 17;
  GST_H266_PROFILE_MULTILAYER_MAIN_10_STILL_PICTURE = GST_H266_PROFILE_MULTILAYER_MAIN_10 or GST_H266_PROFILE_STILL_PICTURE;
  GST_H266_PROFILE_MAIN_10_444 = 33;
  GST_H266_PROFILE_MAIN_10_444_STILL_PICTURE = GST_H266_PROFILE_MAIN_10_444 or GST_H266_PROFILE_STILL_PICTURE;
  GST_H266_PROFILE_MULTILAYER_MAIN_10_444 = 49;
  GST_H266_PROFILE_MULTILAYER_MAIN_10_444_STILL_PICTURE = GST_H266_PROFILE_MULTILAYER_MAIN_10_444 or GST_H266_PROFILE_STILL_PICTURE;
  GST_H266_PROFILE_MAIN_12 = 2;
  GST_H266_PROFILE_MAIN_12_444 = 34;
  GST_H266_PROFILE_MAIN_16_444 = 35;
  GST_H266_PROFILE_MAIN_12_INTRA = GST_H266_PROFILE_MAIN_12 or GST_H266_PROFILE_INTRA;
  GST_H266_PROFILE_MAIN_12_444_INTRA = GST_H266_PROFILE_MAIN_12_444 or GST_H266_PROFILE_INTRA;
  GST_H266_PROFILE_MAIN_16_444_INTRA = GST_H266_PROFILE_MAIN_16_444 or GST_H266_PROFILE_INTRA;
  GST_H266_PROFILE_MAIN_12_STILL_PICTURE = GST_H266_PROFILE_MAIN_12 or GST_H266_PROFILE_STILL_PICTURE;
  GST_H266_PROFILE_MAIN_12_444_STILL_PICTURE = GST_H266_PROFILE_MAIN_12_444 or GST_H266_PROFILE_STILL_PICTURE;
  GST_H266_PROFILE_MAIN_16_444_STILL_PICTURE = GST_H266_PROFILE_MAIN_16_444 or GST_H266_PROFILE_STILL_PICTURE;
  GST_H266_PROFILE_MAX = (GST_H266_PROFILE_MAIN_16_444 or GST_H266_PROFILE_STILL_PICTURE) + 1;

type
  PGstH266Level = ^TGstH266Level;
  TGstH266Level = longint;
const
  GST_H266_LEVEL_L1_0 = 16;
  GST_H266_LEVEL_L2_0 = 32;
  GST_H266_LEVEL_L2_1 = 35;
  GST_H266_LEVEL_L3_0 = 48;
  GST_H266_LEVEL_L3_1 = 51;
  GST_H266_LEVEL_L4_0 = 64;
  GST_H266_LEVEL_L4_1 = 67;
  GST_H266_LEVEL_L5_0 = 80;
  GST_H266_LEVEL_L5_1 = 83;
  GST_H266_LEVEL_L5_2 = 86;
  GST_H266_LEVEL_L6_0 = 96;
  GST_H266_LEVEL_L6_1 = 99;
  GST_H266_LEVEL_L6_2 = 102;
  GST_H266_LEVEL_L6_3 = 105;

type
  PGstH266NalUnitType = ^TGstH266NalUnitType;
  TGstH266NalUnitType = longint;
const
  GST_H266_NAL_SLICE_TRAIL = 0;
  GST_H266_NAL_SLICE_STSA = 1;
  GST_H266_NAL_SLICE_RADL = 2;
  GST_H266_NAL_SLICE_RASL = 3;
  GST_H266_NAL_SLICE_IDR_W_RADL = 7;
  GST_H266_NAL_SLICE_IDR_N_LP = 8;
  GST_H266_NAL_SLICE_CRA = 9;
  GST_H266_NAL_SLICE_GDR = 10;
  GST_H266_NAL_OPI = 12;
  GST_H266_NAL_DCI = 13;
  GST_H266_NAL_VPS = 14;
  GST_H266_NAL_SPS = 15;
  GST_H266_NAL_PPS = 16;
  GST_H266_NAL_PREFIX_APS = 17;
  GST_H266_NAL_SUFFIX_APS = 18;
  GST_H266_NAL_PH = 19;
  GST_H266_NAL_AUD = 20;
  GST_H266_NAL_EOS = 21;
  GST_H266_NAL_EOB = 22;
  GST_H266_NAL_PREFIX_SEI = 23;
  GST_H266_NAL_SUFFIX_SEI = 24;
  GST_H266_NAL_FD = 25;

type
  PGstH266SEIPayloadType = ^TGstH266SEIPayloadType;
  TGstH266SEIPayloadType = longint;
const
  GST_H266_SEI_BUF_PERIOD = 0;
  GST_H266_SEI_PIC_TIMING = 1;
  GST_H266_SEI_REGISTERED_USER_DATA = 4;
  GST_H266_SEI_USER_DATA_UNREGISTERED = 5;
  GST_H266_SEI_DU_INFO = 130;
  GST_H266_SEI_SCALABLE_NESTING = 133;
  GST_H266_SEI_FRAME_FIELD_INFO = 168;
  GST_H266_SEI_SUBPIC_LEVEL_INFO = 203;

type
  PGstH266SliceType = ^TGstH266SliceType;
  TGstH266SliceType = longint;
const
  GST_H266_B_SLICE = 0;
  GST_H266_P_SLICE = 1;
  GST_H266_I_SLICE = 2;

type
  PGstH266APSType = ^TGstH266APSType;
  TGstH266APSType = longint;
const
  GST_H266_ALF_APS = 0;
  GST_H266_LMCS_APS = 1;
  GST_H266_SCALING_APS = 2;
  GST_H266_APS_TYPE_MAX = 3;

type
  PGstH266NalUnit = ^TGstH266NalUnit;
  TGstH266NalUnit = record
    _type: Tguint8;
    layer_id: Tguint8;
    temporal_id_plus1: Tguint8;
    size: Tguint;
    offset: Tguint;
    sc_offset: Tguint;
    valid: Tgboolean;
    data: Pguint8;
    header_bytes: Tguint8;
  end;

  PGstH266GeneralConstraintsInfo = ^TGstH266GeneralConstraintsInfo;
  TGstH266GeneralConstraintsInfo = record
    present_flag: Tguint8;
    intra_only_constraint_flag: Tguint8;
    all_layers_independent_constraint_flag: Tguint8;
    one_au_only_constraint_flag: Tguint8;
    sixteen_minus_max_bitdepth_constraint_idc: Tguint8;
    three_minus_max_chroma_format_constraint_idc: Tguint8;
    no_mixed_nalu_types_in_pic_constraint_flag: Tguint8;
    no_trail_constraint_flag: Tguint8;
    no_stsa_constraint_flag: Tguint8;
    no_rasl_constraint_flag: Tguint8;
    no_radl_constraint_flag: Tguint8;
    no_idr_constraint_flag: Tguint8;
    no_cra_constraint_flag: Tguint8;
    no_gdr_constraint_flag: Tguint8;
    no_aps_constraint_flag: Tguint8;
    no_idr_rpl_constraint_flag: Tguint8;
    one_tile_per_pic_constraint_flag: Tguint8;
    pic_header_in_slice_header_constraint_flag: Tguint8;
    one_slice_per_pic_constraint_flag: Tguint8;
    no_rectangular_slice_constraint_flag: Tguint8;
    one_slice_per_subpic_constraint_flag: Tguint8;
    no_subpic_info_constraint_flag: Tguint8;
    three_minus_max_log2_ctu_size_constraint_idc: Tguint8;
    no_partition_constraints_override_constraint_flag: Tguint8;
    no_mtt_constraint_flag: Tguint8;
    no_qtbtt_dual_tree_intra_constraint_flag: Tguint8;
    no_palette_constraint_flag: Tguint8;
    no_ibc_constraint_flag: Tguint8;
    no_isp_constraint_flag: Tguint8;
    no_mrl_constraint_flag: Tguint8;
    no_mip_constraint_flag: Tguint8;
    no_cclm_constraint_flag: Tguint8;
    no_ref_pic_resampling_constraint_flag: Tguint8;
    no_res_change_in_clvs_constraint_flag: Tguint8;
    no_weighted_prediction_constraint_flag: Tguint8;
    no_ref_wraparound_constraint_flag: Tguint8;
    no_temporal_mvp_constraint_flag: Tguint8;
    no_sbtmvp_constraint_flag: Tguint8;
    no_amvr_constraint_flag: Tguint8;
    no_bdof_constraint_flag: Tguint8;
    no_smvd_constraint_flag: Tguint8;
    no_dmvr_constraint_flag: Tguint8;
    no_mmvd_constraint_flag: Tguint8;
    no_affine_motion_constraint_flag: Tguint8;
    no_prof_constraint_flag: Tguint8;
    no_bcw_constraint_flag: Tguint8;
    no_ciip_constraint_flag: Tguint8;
    no_gpm_constraint_flag: Tguint8;
    no_luma_transform_size_64_constraint_flag: Tguint8;
    no_transform_skip_constraint_flag: Tguint8;
    no_bdpcm_constraint_flag: Tguint8;
    no_mts_constraint_flag: Tguint8;
    no_lfnst_constraint_flag: Tguint8;
    no_joint_cbcr_constraint_flag: Tguint8;
    no_sbt_constraint_flag: Tguint8;
    no_act_constraint_flag: Tguint8;
    no_explicit_scaling_list_constraint_flag: Tguint8;
    no_dep_quant_constraint_flag: Tguint8;
    no_sign_data_hiding_constraint_flag: Tguint8;
    no_cu_qp_delta_constraint_flag: Tguint8;
    no_chroma_qp_offset_constraint_flag: Tguint8;
    no_sao_constraint_flag: Tguint8;
    no_alf_constraint_flag: Tguint8;
    no_ccalf_constraint_flag: Tguint8;
    no_lmcs_constraint_flag: Tguint8;
    no_ladf_constraint_flag: Tguint8;
    no_virtual_boundaries_constraint_flag: Tguint8;
    all_rap_pictures_constraint_flag: Tguint8;
    no_extended_precision_processing_constraint_flag: Tguint8;
    no_ts_residual_coding_rice_constraint_flag: Tguint8;
    no_rrc_rice_extension_constraint_flag: Tguint8;
    no_persistent_rice_adaptation_constraint_flag: Tguint8;
    no_reverse_last_sig_coeff_constraint_flag: Tguint8;
    reserved_zero_bit: array[0..63] of Tguint8;
  end;

  PGstH266ProfileTierLevel = ^TGstH266ProfileTierLevel;
  TGstH266ProfileTierLevel = record
    profile_idc: TGstH266Profile;
    tier_flag: Tguint8;
    level_idc: Tguint8;
    frame_only_constraint_flag: Tguint8;
    multilayer_enabled_flag: Tguint8;
    general_constraints_info: TGstH266GeneralConstraintsInfo;
    sublayer_level_present_flag: array[0..(GST_H266_MAX_SUBLAYERS - 1) - 1] of Tguint8;
    sublayer_level_idc: array[0..(GST_H266_MAX_SUBLAYERS - 1) - 1] of Tguint8;
    num_sub_profiles: Tguint8;
    sub_profile_idc: array[0..(GST_H266_MAX_SUB_PROFILES) - 1] of TGstH266Profile;
    ptl_reserved_zero_bit: Tguint8;
  end;

  PGstH266DPBParameters = ^TGstH266DPBParameters;
  TGstH266DPBParameters = record
    max_dec_pic_buffering_minus1: array[0..(GST_H266_MAX_SUBLAYERS) - 1] of Tguint8;
    max_num_reorder_pics: array[0..(GST_H266_MAX_SUBLAYERS) - 1] of Tguint8;
    max_latency_increase_plus1: array[0..(GST_H266_MAX_SUBLAYERS) - 1] of Tguint8;
  end;

  PGstH266GeneralHRDParameters = ^TGstH266GeneralHRDParameters;
  TGstH266GeneralHRDParameters = record
    num_units_in_tick: Tguint32;
    time_scale: Tguint32;
    general_nal_hrd_params_present_flag: Tguint8;
    general_vcl_hrd_params_present_flag: Tguint8;
    general_same_pic_timing_in_all_ols_flag: Tguint8;
    general_du_hrd_params_present_flag: Tguint8;
    tick_divisor_minus2: Tguint8;
    bit_rate_scale: Tguint8;
    cpb_size_scale: Tguint8;
    cpb_size_du_scale: Tguint8;
    hrd_cpb_cnt_minus1: Tguint8;
  end;

  PGstH266SubLayerHRDParameters = ^TGstH266SubLayerHRDParameters;
  TGstH266SubLayerHRDParameters = record
    bit_rate_value_minus1: array[0..(GST_H266_MAX_CPB_CNT) - 1] of Tguint32;
    cpb_size_value_minus1: array[0..(GST_H266_MAX_CPB_CNT) - 1] of Tguint32;
    cpb_size_du_value_minus1: array[0..(GST_H266_MAX_CPB_CNT) - 1] of Tguint32;
    bit_rate_du_value_minus1: array[0..(GST_H266_MAX_CPB_CNT) - 1] of Tguint32;
    cbr_flag: array[0..(GST_H266_MAX_CPB_CNT) - 1] of Tguint8;
    bit_rate: array[0..(GST_H266_MAX_CPB_CNT) - 1] of Tguint32;
    cpb_size: array[0..(GST_H266_MAX_CPB_CNT) - 1] of Tguint32;
  end;

  PGstH266OLSHRDParameters = ^TGstH266OLSHRDParameters;
  TGstH266OLSHRDParameters = record
    fixed_pic_rate_general_flag: array[0..(GST_H266_MAX_SUBLAYERS) - 1] of Tguint8;
    fixed_pic_rate_within_cvs_flag: array[0..(GST_H266_MAX_SUBLAYERS) - 1] of Tguint8;
    elemental_duration_in_tc_minus1: array[0..(GST_H266_MAX_SUBLAYERS) - 1] of Tguint16;
    low_delay_hrd_flag: array[0..(GST_H266_MAX_SUBLAYERS) - 1] of Tguint8;
    nal_sub_layer_hrd_parameters: array[0..(GST_H266_MAX_SUBLAYERS) - 1] of TGstH266SubLayerHRDParameters;
    vcl_sub_layer_hrd_parameters: array[0..(GST_H266_MAX_SUBLAYERS) - 1] of TGstH266SubLayerHRDParameters;
  end;

  PGstH266VPS = ^TGstH266VPS;
  TGstH266VPS = record
    vps_id: Tguint8;
    max_layers_minus1: Tguint8;
    max_sublayers_minus1: Tguint8;
    default_ptl_dpb_hrd_max_tid_flag: Tguint8;
    all_independent_layers_flag: Tguint8;
    layer_id: array[0..(GST_H266_MAX_LAYERS) - 1] of Tguint8;
    independent_layer_flag: array[0..(GST_H266_MAX_LAYERS) - 1] of Tguint8;
    max_tid_ref_present_flag: array[0..(GST_H266_MAX_LAYERS) - 1] of Tguint8;
    direct_ref_layer_flag: array[0..(GST_H266_MAX_LAYERS) - 1] of array[0..(GST_H266_MAX_LAYERS) - 1] of Tguint8;
    max_tid_il_ref_pics_plus1: array[0..(GST_H266_MAX_LAYERS) - 1] of array[0..(GST_H266_MAX_LAYERS) - 1] of Tguint8;
    each_layer_is_an_ols_flag: Tguint8;
    ols_mode_idc: Tguint8;
    total_num_olss: Tguint;
    num_multi_layer_olss: Tguint;
    multi_layer_ols_idx: array[0..(GST_H266_MAX_TOTAL_NUM_OLSS) - 1] of Tguint16;
    num_layers_in_ols: array[0..(GST_H266_MAX_TOTAL_NUM_OLSS) - 1] of Tguint16;
    layer_id_in_ols: array[0..(GST_H266_MAX_TOTAL_NUM_OLSS) - 1] of array[0..(GST_H266_MAX_LAYERS) - 1] of Tguint8;
    num_output_layer_sets_minus2: Tguint8;
    ols_output_layer_flag: array[0..(GST_H266_MAX_TOTAL_NUM_OLSS) - 1] of array[0..(GST_H266_MAX_LAYERS) - 1] of Tguint8;
    num_output_layers_in_ols: array[0..(GST_H266_MAX_TOTAL_NUM_OLSS) - 1] of Tguint16;
    output_layer_id_in_ols: array[0..(GST_H266_MAX_TOTAL_NUM_OLSS) - 1] of array[0..(GST_H266_MAX_LAYERS) - 1] of Tguint8;
    num_sub_layers_in_layer_in_ols: array[0..(GST_H266_MAX_TOTAL_NUM_OLSS) - 1] of array[0..(GST_H266_MAX_LAYERS) - 1] of Tguint8;
    num_ptls_minus1: Tguint8;
    pt_present_flag: array[0..(GST_H266_MAX_PTLS) - 1] of Tguint8;
    ptl_max_tid: array[0..(GST_H266_MAX_PTLS) - 1] of Tguint8;
    profile_tier_level: array[0..(GST_H266_MAX_PTLS) - 1] of TGstH266ProfileTierLevel;
    ols_ptl_idx: array[0..(GST_H266_MAX_TOTAL_NUM_OLSS) - 1] of Tguint8;
    num_dpb_params_minus1: Tguint8;
    sublayer_dpb_params_present_flag: Tguint8;
    dpb_max_tid: array[0..(GST_H266_MAX_TOTAL_NUM_OLSS) - 1] of Tguint8;
    dpb: array[0..(GST_H266_MAX_TOTAL_NUM_OLSS) - 1] of TGstH266DPBParameters;
    ols_dpb_pic_width: array[0..(GST_H266_MAX_TOTAL_NUM_OLSS) - 1] of Tguint16;
    ols_dpb_pic_height: array[0..(GST_H266_MAX_TOTAL_NUM_OLSS) - 1] of Tguint16;
    ols_dpb_chroma_format: array[0..(GST_H266_MAX_TOTAL_NUM_OLSS) - 1] of Tguint8;
    ols_dpb_bitdepth_minus8: array[0..(GST_H266_MAX_TOTAL_NUM_OLSS) - 1] of Tguint8;
    ols_dpb_params_idx: array[0..(GST_H266_MAX_TOTAL_NUM_OLSS) - 1] of Tguint8;
    timing_hrd_params_present_flag: Tguint8;
    general_hrd_params: TGstH266GeneralHRDParameters;
    sublayer_cpb_params_present_flag: Tguint8;
    num_ols_timing_hrd_params_minus1: Tguint8;
    hrd_max_tid: array[0..(GST_H266_MAX_TOTAL_NUM_OLSS) - 1] of Tguint8;
    ols_hrd_params: array[0..(GST_H266_MAX_TOTAL_NUM_OLSS) - 1] of TGstH266OLSHRDParameters;
    ols_timing_hrd_idx: array[0..(GST_H266_MAX_TOTAL_NUM_OLSS) - 1] of Tguint8;
    extension_flag: Tguint8;
    extension_data: array[0..63] of Tguint8;
    valid: Tgboolean;
  end;

  PGstH266RefPicListStruct = ^TGstH266RefPicListStruct;
  TGstH266RefPicListStruct = record
    num_ref_entries: Tguint8;
    ltrp_in_header_flag: Tguint8;
    inter_layer_ref_pic_flag: array[0..(GST_H266_MAX_REF_ENTRIES) - 1] of Tguint8;
    st_ref_pic_flag: array[0..(GST_H266_MAX_REF_ENTRIES) - 1] of Tguint8;
    abs_delta_poc_st: array[0..(GST_H266_MAX_REF_ENTRIES) - 1] of Tguint16;
    strp_entry_sign_flag: array[0..(GST_H266_MAX_REF_ENTRIES) - 1] of Tguint8;
    rpls_poc_lsb_lt: array[0..(GST_H266_MAX_REF_ENTRIES) - 1] of Tguint8;
    ilrp_idx: array[0..(GST_H266_MAX_REF_ENTRIES) - 1] of Tguint8;
    num_short_term_pic: Tguint;
    num_long_term_pic: Tguint;
    num_inter_layer_pic: Tguint;
    delta_poc_val_st: array[0..(GST_H266_MAX_REF_ENTRIES) - 1] of Tgint16;
  end;

  PGstH266RefPicLists = ^TGstH266RefPicLists;
  TGstH266RefPicLists = record
    rpl_sps_flag: array[0..1] of Tguint8;
    rpl_idx: array[0..1] of Tguint8;
    rpl_ref_list: array[0..1] of TGstH266RefPicListStruct;
    poc_lsb_lt: array[0..1] of array[0..(GST_H266_MAX_REF_ENTRIES) - 1] of Tguint16;
    delta_poc_msb_cycle_present_flag: array[0..1] of array[0..(GST_H266_MAX_REF_ENTRIES) - 1] of Tguint8;
    delta_poc_msb_cycle_lt: array[0..1] of array[0..(GST_H266_MAX_REF_ENTRIES) - 1] of Tguint16;
  end;

  PGstH266VUIParams = ^TGstH266VUIParams;
  TGstH266VUIParams = record
    progressive_source_flag: Tguint8;
    interlaced_source_flag: Tguint8;
    non_packed_constraint_flag: Tguint8;
    non_projected_constraint_flag: Tguint8;
    aspect_ratio_info_present_flag: Tguint8;
    aspect_ratio_constant_flag: Tguint8;
    aspect_ratio_idc: Tguint8;
    sar_width: Tguint16;
    sar_height: Tguint16;
    overscan_info_present_flag: Tguint8;
    overscan_appropriate_flag: Tguint8;
    colour_description_present_flag: Tguint8;
    colour_primaries: Tguint8;
    transfer_characteristics: Tguint8;
    matrix_coeffs: Tguint8;
    full_range_flag: Tguint8;
    chroma_loc_info_present_flag: Tguint8;
    chroma_sample_loc_type_frame: Tguint8;
    chroma_sample_loc_type_top_field: Tguint8;
    chroma_sample_loc_type_bottom_field: Tguint8;
    par_n: Tguint;
    par_d: Tguint;
  end;

  PGstH266SPSRangeExtensionParams = ^TGstH266SPSRangeExtensionParams;
  TGstH266SPSRangeExtensionParams = record
    extended_precision_flag: Tguint8;
    ts_residual_coding_rice_present_in_sh_flag: Tguint8;
    rrc_rice_extension_flag: Tguint8;
    persistent_rice_adaptation_enabled_flag: Tguint8;
    reverse_last_sig_coeff_enabled_flag: Tguint8;
  end;

  PGstH266SPS = ^TGstH266SPS;
  TGstH266SPS = record
    nuh_layer_id: Tguint8;
    sps_id: Tguint8;
    vps_id: Tguint8;
    vps: PGstH266VPS;
    max_sublayers_minus1: Tguint8;
    chroma_format_idc: Tguint8;
    log2_ctu_size_minus5: Tguint8;
    ctu_size: Tguint;
    ptl_dpb_hrd_params_present_flag: Tguint8;
    dpb: TGstH266DPBParameters;
    profile_tier_level: TGstH266ProfileTierLevel;
    general_hrd_params: TGstH266GeneralHRDParameters;
    ols_hrd_params: TGstH266OLSHRDParameters;
    gdr_enabled_flag: Tguint8;
    res_change_in_clvs_allowed_flag: Tguint8;
    ref_pic_resampling_enabled_flag: Tguint8;
    pic_width_max_in_luma_samples: Tguint16;
    pic_height_max_in_luma_samples: Tguint16;
    conformance_window_flag: Tguint8;
    conf_win_left_offset: Tguint16;
    conf_win_right_offset: Tguint16;
    conf_win_top_offset: Tguint16;
    conf_win_bottom_offset: Tguint16;
    subpic_info_present_flag: Tguint8;
    num_subpics_minus1: Tguint16;
    independent_subpics_flag: Tguint8;
    subpic_same_size_flag: Tguint8;
    subpic_ctu_top_left_x: array[0..(GST_H266_MAX_SLICES_PER_AU) - 1] of Tguint16;
    subpic_ctu_top_left_y: array[0..(GST_H266_MAX_SLICES_PER_AU) - 1] of Tguint16;
    subpic_width_minus1: array[0..(GST_H266_MAX_SLICES_PER_AU) - 1] of Tguint16;
    subpic_height_minus1: array[0..(GST_H266_MAX_SLICES_PER_AU) - 1] of Tguint16;
    subpic_treated_as_pic_flag: array[0..(GST_H266_MAX_SLICES_PER_AU) - 1] of Tguint8;
    loop_filter_across_subpic_enabled_flag: array[0..(GST_H266_MAX_SLICES_PER_AU) - 1] of Tguint8;
    subpic_id: array[0..(GST_H266_MAX_SLICES_PER_AU) - 1] of Tguint32;
    subpic_id_len_minus1: Tguint8;
    subpic_id_mapping_explicitly_signalled_flag: Tguint8;
    subpic_id_mapping_present_flag: Tguint8;
    bitdepth_minus8: Tguint8;
    entropy_coding_sync_enabled_flag: Tguint8;
    entry_point_offsets_present_flag: Tguint8;
    log2_max_pic_order_cnt_lsb_minus4: Tguint8;
    poc_msb_cycle_flag: Tguint8;
    poc_msb_cycle_len_minus1: Tguint8;
    num_extra_ph_bytes: Tguint8;
    extra_ph_bit_present_flag: array[0..15] of Tguint8;
    num_extra_sh_bytes: Tguint8;
    extra_sh_bit_present_flag: array[0..15] of Tguint8;
    sublayer_dpb_params_flag: Tguint8;
    log2_min_luma_coding_block_size_minus2: Tguint8;
    partition_constraints_override_enabled_flag: Tguint8;
    log2_diff_min_qt_min_cb_intra_slice_luma: Tguint8;
    max_mtt_hierarchy_depth_intra_slice_luma: Tguint8;
    log2_diff_max_bt_min_qt_intra_slice_luma: Tguint8;
    log2_diff_max_tt_min_qt_intra_slice_luma: Tguint8;
    qtbtt_dual_tree_intra_flag: Tguint8;
    log2_diff_min_qt_min_cb_intra_slice_chroma: Tguint8;
    max_mtt_hierarchy_depth_intra_slice_chroma: Tguint8;
    log2_diff_max_bt_min_qt_intra_slice_chroma: Tguint8;
    log2_diff_max_tt_min_qt_intra_slice_chroma: Tguint8;
    log2_diff_min_qt_min_cb_inter_slice: Tguint8;
    max_mtt_hierarchy_depth_inter_slice: Tguint8;
    log2_diff_max_bt_min_qt_inter_slice: Tguint8;
    log2_diff_max_tt_min_qt_inter_slice: Tguint8;
    max_luma_transform_size_64_flag: Tguint8;
    transform_skip_enabled_flag: Tguint8;
    log2_transform_skip_max_size_minus2: Tguint8;
    bdpcm_enabled_flag: Tguint8;
    mts_enabled_flag: Tguint8;
    explicit_mts_intra_enabled_flag: Tguint8;
    explicit_mts_inter_enabled_flag: Tguint8;
    lfnst_enabled_flag: Tguint8;
    joint_cbcr_enabled_flag: Tguint8;
    same_qp_table_for_chroma_flag: Tguint8;
    qp_table_start_minus26: array[0..(GST_H266_MAX_SAMPLE_ARRAYS) - 1] of Tgint8;
    num_points_in_qp_table_minus1: array[0..(GST_H266_MAX_SAMPLE_ARRAYS) - 1] of Tguint8;
    delta_qp_in_val_minus1: array[0..(GST_H266_MAX_SAMPLE_ARRAYS) - 1] of array[0..(GST_H266_MAX_POINTS_IN_QP_TABLE) - 1] of Tguint8;
    delta_qp_diff_val: array[0..(GST_H266_MAX_SAMPLE_ARRAYS) - 1] of array[0..(GST_H266_MAX_POINTS_IN_QP_TABLE) - 1] of Tguint8;
    sao_enabled_flag: Tguint8;
    alf_enabled_flag: Tguint8;
    ccalf_enabled_flag: Tguint8;
    lmcs_enabled_flag: Tguint8;
    weighted_pred_flag: Tguint8;
    weighted_bipred_flag: Tguint8;
    long_term_ref_pics_flag: Tguint8;
    inter_layer_prediction_enabled_flag: Tguint8;
    idr_rpl_present_flag: Tguint8;
    rpl1_same_as_rpl0_flag: Tguint8;
    num_ref_pic_lists: array[0..1] of Tguint8;
    ref_pic_list_struct: array[0..1] of array[0..(GST_H266_MAX_REF_PIC_LISTS) - 1] of TGstH266RefPicListStruct;
    ref_wraparound_enabled_flag: Tguint8;
    temporal_mvp_enabled_flag: Tguint8;
    sbtmvp_enabled_flag: Tguint8;
    amvr_enabled_flag: Tguint8;
    bdof_enabled_flag: Tguint8;
    bdof_control_present_in_ph_flag: Tguint8;
    smvd_enabled_flag: Tguint8;
    dmvr_enabled_flag: Tguint8;
    dmvr_control_present_in_ph_flag: Tguint8;
    mmvd_enabled_flag: Tguint8;
    mmvd_fullpel_only_enabled_flag: Tguint8;
    six_minus_max_num_merge_cand: Tguint8;
    sbt_enabled_flag: Tguint8;
    affine_enabled_flag: Tguint8;
    five_minus_max_num_subblock_merge_cand: Tguint8;
    sps_6param_affine_enabled_flag: Tguint8;
    affine_amvr_enabled_flag: Tguint8;
    affine_prof_enabled_flag: Tguint8;
    prof_control_present_in_ph_flag: Tguint8;
    bcw_enabled_flag: Tguint8;
    ciip_enabled_flag: Tguint8;
    gpm_enabled_flag: Tguint8;
    max_num_merge_cand_minus_max_num_gpm_cand: Tguint8;
    log2_parallel_merge_level_minus2: Tguint8;
    isp_enabled_flag: Tguint8;
    mrl_enabled_flag: Tguint8;
    mip_enabled_flag: Tguint8;
    cclm_enabled_flag: Tguint8;
    chroma_horizontal_collocated_flag: Tguint8;
    chroma_vertical_collocated_flag: Tguint8;
    palette_enabled_flag: Tguint8;
    act_enabled_flag: Tguint8;
    min_qp_prime_ts: Tguint8;
    ibc_enabled_flag: Tguint8;
    six_minus_max_num_ibc_merge_cand: Tguint8;
    ladf_enabled_flag: Tguint8;
    num_ladf_intervals_minus2: Tguint8;
    ladf_lowest_interval_qp_offset: Tgint8;
    ladf_qp_offset: array[0..3] of Tgint8;
    ladf_delta_threshold_minus1: array[0..3] of Tguint16;
    explicit_scaling_list_enabled_flag: Tguint8;
    scaling_matrix_for_lfnst_disabled_flag: Tguint8;
    scaling_matrix_for_alternative_colour_space_disabled_flag: Tguint8;
    scaling_matrix_designated_colour_space_flag: Tguint8;
    dep_quant_enabled_flag: Tguint8;
    sign_data_hiding_enabled_flag: Tguint8;
    virtual_boundaries_enabled_flag: Tguint8;
    virtual_boundaries_present_flag: Tguint8;
    num_ver_virtual_boundaries: Tguint32;
    virtual_boundary_pos_x_minus1: array[0..2] of Tguint16;
    num_hor_virtual_boundaries: Tguint32;
    virtual_boundary_pos_y_minus1: array[0..2] of Tguint16;
    timing_hrd_params_present_flag: Tguint8;
    sublayer_cpb_params_present_flag: Tguint8;
    field_seq_flag: Tguint8;
    vui_parameters_present_flag: Tguint8;
    vui_payload_size_minus1: Tguint16;
    vui_params: TGstH266VUIParams;
    extension_flag: Tguint8;
    range_extension_flag: Tguint8;
    extension_7_flags: array[0..6] of Tguint8;
    range_params: TGstH266SPSRangeExtensionParams;
    max_width: Tgint;
    max_height: Tgint;
    crop_rect_width: Tgint;
    crop_rect_height: Tgint;
    crop_rect_x: Tgint;
    crop_rect_y: Tgint;
    fps_num: Tgint;
    fps_den: Tgint;
    chroma_qp_table: array[0..(GST_H266_MAX_SAMPLE_ARRAYS) - 1] of array[0..(GST_H266_MAX_POINTS_IN_QP_TABLE) - 1] of Tgint;
    valid: Tgboolean;
  end;

  PGstH266PPS = ^TGstH266PPS;
  TGstH266PPS = record
    pps_id: Tguint8;
    sps_id: Tguint8;
    sps: PGstH266SPS;
    mixed_nalu_types_in_pic_flag: Tguint8;
    pic_width_in_luma_samples: Tguint16;
    pic_height_in_luma_samples: Tguint16;
    conformance_window_flag: Tguint8;
    conf_win_left_offset: Tguint16;
    conf_win_right_offset: Tguint16;
    conf_win_top_offset: Tguint16;
    conf_win_bottom_offset: Tguint16;
    scaling_window_explicit_signalling_flag: Tguint8;
    scaling_win_left_offset: Tgint32;
    scaling_win_right_offset: Tgint32;
    scaling_win_top_offset: Tgint32;
    scaling_win_bottom_offset: Tgint32;
    output_flag_present_flag: Tguint8;
    no_pic_partition_flag: Tguint8;
    subpic_id_mapping_present_flag: Tguint8;
    num_subpics_minus1: Tguint32;
    subpic_id_len_minus1: Tguint32;
    subpic_id: array[0..(GST_H266_MAX_SLICES_PER_AU) - 1] of Tguint16;
    log2_ctu_size_minus5: Tguint8;
    num_exp_tile_columns_minus1: Tguint8;
    num_exp_tile_rows_minus1: Tguint8;
    tile_column_width_minus1: array[0..(GST_H266_MAX_TILE_COLUMNS) - 1] of Tguint16;
    tile_row_height_minus1: array[0..(GST_H266_MAX_TILE_ROWS) - 1] of Tguint16;
    loop_filter_across_tiles_enabled_flag: Tguint8;
    rect_slice_flag: Tguint8;
    single_slice_per_subpic_flag: Tguint8;
    num_slices_in_pic_minus1: Tguint16;
    tile_idx_delta_present_flag: Tguint8;
    slice_width_in_tiles_minus1: array[0..(GST_H266_MAX_SLICES_PER_AU) - 1] of Tguint16;
    slice_height_in_tiles_minus1: array[0..(GST_H266_MAX_SLICES_PER_AU) - 1] of Tguint16;
    num_exp_slices_in_tile: array[0..(GST_H266_MAX_SLICES_PER_AU) - 1] of Tguint16;
    exp_slice_height_in_ctus_minus1: array[0..(GST_H266_MAX_SLICES_PER_AU) - 1] of array[0..(GST_H266_MAX_TILE_ROWS) - 1] of Tguint16;
    tile_idx_delta_val: array[0..(GST_H266_MAX_SLICES_PER_AU) - 1] of Tgint16;
    loop_filter_across_slices_enabled_flag: Tguint8;
    cabac_init_present_flag: Tguint8;
    num_ref_idx_default_active_minus1: array[0..1] of Tguint8;
    rpl1_idx_present_flag: Tguint8;
    weighted_pred_flag: Tguint8;
    weighted_bipred_flag: Tguint8;
    ref_wraparound_enabled_flag: Tguint8;
    pic_width_minus_wraparound_offset: Tguint16;
    init_qp_minus26: Tgint8;
    cu_qp_delta_enabled_flag: Tguint8;
    chroma_tool_offsets_present_flag: Tguint8;
    cb_qp_offset: Tgint8;
    cr_qp_offset: Tgint8;
    joint_cbcr_qp_offset_present_flag: Tguint8;
    joint_cbcr_qp_offset_value: Tgint8;
    slice_chroma_qp_offsets_present_flag: Tguint8;
    cu_chroma_qp_offset_list_enabled_flag: Tguint8;
    chroma_qp_offset_list_len_minus1: Tguint8;
    cb_qp_offset_list: array[0..5] of Tguint8;
    cr_qp_offset_list: array[0..5] of Tguint8;
    joint_cbcr_qp_offset_list: array[0..5] of Tguint8;
    deblocking_filter_control_present_flag: Tguint8;
    deblocking_filter_override_enabled_flag: Tguint8;
    deblocking_filter_disabled_flag: Tguint8;
    dbf_info_in_ph_flag: Tguint8;
    luma_beta_offset_div2: Tgint8;
    luma_tc_offset_div2: Tgint8;
    cb_beta_offset_div2: Tgint8;
    cb_tc_offset_div2: Tgint8;
    cr_beta_offset_div2: Tgint8;
    cr_tc_offset_div2: Tgint8;
    rpl_info_in_ph_flag: Tguint8;
    sao_info_in_ph_flag: Tguint8;
    alf_info_in_ph_flag: Tguint8;
    wp_info_in_ph_flag: Tguint8;
    qp_delta_info_in_ph_flag: Tguint8;
    picture_header_extension_present_flag: Tguint8;
    slice_header_extension_present_flag: Tguint8;
    extension_flag: Tguint8;
    extension_data_flag: Tguint8;
    width: Tgint;
    height: Tgint;
    crop_rect_width: Tgint;
    crop_rect_height: Tgint;
    crop_rect_x: Tgint;
    crop_rect_y: Tgint;
    pic_width_in_ctbs_y: Tguint32;
    pic_height_in_ctbs_y: Tguint32;
    pic_size_in_ctbs_y: Tguint32;
    num_tile_columns: Tguint32;
    num_tile_rows: Tguint32;
    num_tiles_in_pic: Tguint32;
    tile_col_bd_val: array[0..(GST_H266_MAX_TILE_COLUMNS + 1) - 1] of Tguint32;
    tile_row_bd_val: array[0..(GST_H266_MAX_TILE_ROWS + 1) - 1] of Tguint32;
    slice_top_left_tile_idx: array[0..(GST_H266_MAX_SLICES_PER_AU) - 1] of Tguint32;
    slice_top_left_ctu_x: array[0..(GST_H266_MAX_SLICES_PER_AU) - 1] of Tguint32;
    slice_top_left_ctu_y: array[0..(GST_H266_MAX_SLICES_PER_AU) - 1] of Tguint32;
    slice_height_in_ctus: array[0..(GST_H266_MAX_SLICES_PER_AU) - 1] of Tguint32;
    num_slices_in_subpic: array[0..(GST_H266_MAX_SLICES_PER_AU) - 1] of Tguint32;
    valid: Tgboolean;
  end;

  PGstH266ALF = ^TGstH266ALF;
  TGstH266ALF = record
    luma_filter_signal_flag: Tguint8;
    chroma_filter_signal_flag: Tguint8;
    cc_cb_filter_signal_flag: Tguint8;
    cc_cr_filter_signal_flag: Tguint8;
    luma_clip_flag: Tguint8;
    luma_num_filters_signalled_minus1: Tguint8;
    luma_coeff_delta_idx: array[0..(GST_H266_NUM_ALF_FILTERS) - 1] of Tguint8;
    luma_coeff_abs: array[0..(GST_H266_NUM_ALF_FILTERS) - 1] of array[0..11] of Tguint8;
    luma_coeff_sign: array[0..(GST_H266_NUM_ALF_FILTERS) - 1] of array[0..11] of Tguint8;
    luma_clip_idx: array[0..(GST_H266_NUM_ALF_FILTERS) - 1] of array[0..11] of Tguint8;
    chroma_clip_flag: Tguint8;
    chroma_num_alt_filters_minus1: Tguint8;
    chroma_coeff_abs: array[0..7] of array[0..5] of Tguint8;
    chroma_coeff_sign: array[0..7] of array[0..5] of Tguint8;
    chroma_clip_idx: array[0..7] of array[0..5] of Tguint8;
    cc_cb_filters_signalled_minus1: Tguint8;
    cc_cb_mapped_coeff_abs: array[0..3] of array[0..6] of Tguint8;
    cc_cb_coeff_sign: array[0..3] of array[0..6] of Tguint8;
    cc_cr_filters_signalled_minus1: Tguint8;
    cc_cr_mapped_coeff_abs: array[0..3] of array[0..6] of Tguint8;
    cc_cr_coeff_sign: array[0..3] of array[0..6] of Tguint8;
  end;

  PGstH266LMCS = ^TGstH266LMCS;
  TGstH266LMCS = record
    min_bin_idx: Tguint8;
    delta_max_bin_idx: Tguint8;
    delta_cw_prec_minus1: Tguint8;
    delta_abs_cw: array[0..15] of Tguint8;
    delta_sign_cw_flag: array[0..15] of Tguint8;
    delta_abs_crs: Tguint8;
    delta_sign_crs_flag: Tguint8;
  end;

  PGstH266ScalingList = ^TGstH266ScalingList;
  TGstH266ScalingList = record
    copy_mode_flag: array[0..27] of Tguint8;
    pred_mode_flag: array[0..27] of Tguint8;
    pred_id_delta: array[0..27] of Tguint8;
    dc_coef: array[0..13] of Tgint8;
    delta_coef: array[0..27] of array[0..63] of Tgint8;
    scaling_list_DC: array[0..13] of Tguint8;
    scaling_list: array[0..27] of array[0..63] of Tguint8;
  end;

  PGstH266APS = ^TGstH266APS;
  TGstH266APS = record
    params_type: TGstH266APSType;
    aps_id: Tguint8;
    chroma_present_flag: Tguint8;
    rec: record
      case longint of
        0: (alf: TGstH266ALF);
        1: (lmcs: TGstH266LMCS);
        2: (sl: TGstH266ScalingList);
      end;
    extension_flag: Tguint8;
    extension_data_flag: Tguint8;
    valid: Tgboolean;
  end;

  PGstH266PredWeightTable = ^TGstH266PredWeightTable;
  TGstH266PredWeightTable = record
    luma_log2_weight_denom: Tguint8;
    delta_chroma_log2_weight_denom: Tgint8;
    num_l0_weights: Tguint8;
    luma_weight_l0_flag: array[0..14] of Tguint8;
    chroma_weight_l0_flag: array[0..14] of Tguint8;
    delta_luma_weight_l0: array[0..14] of Tgint8;
    luma_offset_l0: array[0..14] of Tgint8;
    delta_chroma_weight_l0: array[0..14] of array[0..1] of Tgint8;
    delta_chroma_offset_l0: array[0..14] of array[0..1] of Tgint16;
    num_l1_weights: Tguint8;
    luma_weight_l1_flag: array[0..14] of Tguint8;
    chroma_weight_l1_flag: array[0..14] of Tguint8;
    delta_luma_weight_l1: array[0..14] of Tgint8;
    luma_offset_l1: array[0..14] of Tgint8;
    delta_chroma_weight_l1: array[0..14] of array[0..1] of Tgint8;
    delta_chroma_offset_l1: array[0..14] of array[0..1] of Tgint16;
  end;

  PGstH266PicHdr = ^TGstH266PicHdr;
  TGstH266PicHdr = record
    gdr_or_irap_pic_flag: Tguint8;
    non_ref_pic_flag: Tguint8;
    gdr_pic_flag: Tguint8;
    inter_slice_allowed_flag: Tguint8;
    intra_slice_allowed_flag: Tguint8;
    pps_id: Tguint8;
    pps: PGstH266PPS;
    pic_order_cnt_lsb: Tguint16;
    recovery_poc_cnt: Tguint8;
    extra_bit: array[0..15] of Tguint8;
    poc_msb_cycle_present_flag: Tguint8;
    poc_msb_cycle_val: Tguint8;
    alf_enabled_flag: Tguint8;
    num_alf_aps_ids_luma: Tguint8;
    alf_aps_id_luma: array[0..7] of Tguint8;
    alf_cb_enabled_flag: Tguint8;
    alf_cr_enabled_flag: Tguint8;
    alf_aps_id_chroma: Tguint8;
    alf_cc_cb_enabled_flag: Tguint8;
    alf_cc_cb_aps_id: Tguint8;
    alf_cc_cr_enabled_flag: Tguint8;
    alf_cc_cr_aps_id: Tguint8;
    lmcs_enabled_flag: Tguint8;
    lmcs_aps_id: Tguint8;
    chroma_residual_scale_flag: Tguint8;
    explicit_scaling_list_enabled_flag: Tguint8;
    scaling_list_aps_id: Tguint8;
    virtual_boundaries_present_flag: Tguint8;
    num_ver_virtual_boundaries: Tguint8;
    virtual_boundary_pos_x_minus1: array[0..2] of Tguint16;
    num_hor_virtual_boundaries: Tguint8;
    virtual_boundary_pos_y_minus1: array[0..2] of Tguint16;
    pic_output_flag: Tguint8;
    ref_pic_lists: TGstH266RefPicLists;
    partition_constraints_override_flag: Tguint8;
    log2_diff_min_qt_min_cb_intra_slice_luma: Tguint8;
    max_mtt_hierarchy_depth_intra_slice_luma: Tguint8;
    log2_diff_max_bt_min_qt_intra_slice_luma: Tguint8;
    log2_diff_max_tt_min_qt_intra_slice_luma: Tguint8;
    log2_diff_min_qt_min_cb_intra_slice_chroma: Tguint8;
    max_mtt_hierarchy_depth_intra_slice_chroma: Tguint8;
    log2_diff_max_bt_min_qt_intra_slice_chroma: Tguint8;
    log2_diff_max_tt_min_qt_intra_slice_chroma: Tguint8;
    cu_qp_delta_subdiv_intra_slice: Tguint8;
    cu_chroma_qp_offset_subdiv_intra_slice: Tguint8;
    log2_diff_min_qt_min_cb_inter_slice: Tguint8;
    max_mtt_hierarchy_depth_inter_slice: Tguint8;
    log2_diff_max_bt_min_qt_inter_slice: Tguint8;
    log2_diff_max_tt_min_qt_inter_slice: Tguint8;
    cu_qp_delta_subdiv_inter_slice: Tguint8;
    cu_chroma_qp_offset_subdiv_inter_slice: Tguint8;
    temporal_mvp_enabled_flag: Tguint8;
    collocated_from_l0_flag: Tguint8;
    collocated_ref_idx: Tguint8;
    mmvd_fullpel_only_flag: Tguint8;
    mvd_l1_zero_flag: Tguint8;
    bdof_disabled_flag: Tguint8;
    dmvr_disabled_flag: Tguint8;
    prof_disabled_flag: Tguint8;
    pred_weight_table: TGstH266PredWeightTable;
    qp_delta: Tgint8;
    joint_cbcr_sign_flag: Tguint8;
    sao_luma_enabled_flag: Tguint8;
    sao_chroma_enabled_flag: Tguint8;
    deblocking_params_present_flag: Tguint8;
    deblocking_filter_disabled_flag: Tguint8;
    luma_beta_offset_div2: Tgint8;
    luma_tc_offset_div2: Tgint8;
    cb_beta_offset_div2: Tgint8;
    cb_tc_offset_div2: Tgint8;
    cr_beta_offset_div2: Tgint8;
    cr_tc_offset_div2: Tgint8;
    extension_length: Tguint8;
    extension_data_byte: array[0..255] of Tguint8;
    valid: Tgboolean;
  end;

  PGstH266SliceHdr = ^TGstH266SliceHdr;
  TGstH266SliceHdr = record
    picture_header_in_slice_header_flag: Tguint8;
    picture_header: TGstH266PicHdr;
    subpic_id: Tguint16;
    slice_address: Tguint16;
    extra_bit: array[0..15] of Tguint8;
    num_tiles_in_slice_minus1: Tguint8;
    slice_type: Tguint8;
    no_output_of_prior_pics_flag: Tguint8;
    alf_enabled_flag: Tguint8;
    num_alf_aps_ids_luma: Tguint8;
    alf_aps_id_luma: array[0..7] of Tguint8;
    alf_cb_enabled_flag: Tguint8;
    alf_cr_enabled_flag: Tguint8;
    alf_aps_id_chroma: Tguint8;
    alf_cc_cb_enabled_flag: Tguint8;
    alf_cc_cb_aps_id: Tguint8;
    alf_cc_cr_enabled_flag: Tguint8;
    alf_cc_cr_aps_id: Tguint8;
    lmcs_used_flag: Tguint8;
    explicit_scaling_list_used_flag: Tguint8;
    ref_pic_lists: TGstH266RefPicLists;
    num_ref_idx_active_override_flag: Tguint8;
    num_ref_idx_active_minus1: array[0..1] of Tguint8;
    num_ref_idx_active: array[0..1] of Tguint8;
    cabac_init_flag: Tguint8;
    collocated_from_l0_flag: Tguint8;
    collocated_ref_idx: Tguint8;
    pred_weight_table: TGstH266PredWeightTable;
    slice_qp_y: Tgint8;
    qp_delta: Tgint8;
    cb_qp_offset: Tgint8;
    cr_qp_offset: Tgint8;
    joint_cbcr_qp_offset: Tgint8;
    cu_chroma_qp_offset_enabled_flag: Tguint8;
    sao_luma_used_flag: Tguint8;
    sao_chroma_used_flag: Tguint8;
    deblocking_params_present_flag: Tguint8;
    deblocking_filter_disabled_flag: Tguint8;
    luma_beta_offset_div2: Tgint8;
    luma_tc_offset_div2: Tgint8;
    cb_beta_offset_div2: Tgint8;
    cb_tc_offset_div2: Tgint8;
    cr_beta_offset_div2: Tgint8;
    cr_tc_offset_div2: Tgint8;
    dep_quant_used_flag: Tguint8;
    sign_data_hiding_used_flag: Tguint8;
    ts_residual_coding_disabled_flag: Tguint8;
    ts_residual_coding_rice_idx_minus1: Tguint8;
    reverse_last_sig_coeff_flag: Tguint8;
    slice_header_extension_length: Tguint16;
    slice_header_extension_data_byte: array[0..255] of Tguint8;
    num_entry_points: Tguint16;
    entry_point_start_ctu: array[0..(GST_H266_MAX_ENTRY_POINTS) - 1] of Tguint16;
    entry_offset_len_minus1: Tguint8;
    entry_point_offset_minus1: array[0..(GST_H266_MAX_ENTRY_POINTS) - 1] of Tguint32;
    header_size: Tguint;
    n_emulation_prevention_bytes: Tguint;
  end;

  PGstH266AUD = ^TGstH266AUD;
  TGstH266AUD = record
    irap_or_gdr_flag: Tguint8;
    pic_type: Tguint8;
  end;

  PGstH266OPI = ^TGstH266OPI;
  TGstH266OPI = record
    ols_info_present_flag: Tguint8;
    htid_info_present_flag: Tguint8;
    ols_idx: Tguint;
    htid_plus1: Tguint8;
    extension_flag: Tguint8;
    extension_data_flag: Tguint8;
  end;

  PGstH266DCI = ^TGstH266DCI;
  TGstH266DCI = record
    num_ptls_minus1: Tguint8;
    profile_tier_level: array[0..14] of TGstH266ProfileTierLevel;
    extension_flag: Tguint8;
    extension_data_flag: Tguint8;
  end;

  PGstH266BufferingPeriod = ^TGstH266BufferingPeriod;
  TGstH266BufferingPeriod = record
    nal_hrd_params_present_flag: Tguint8;
    vcl_hrd_params_present_flag: Tguint8;
    cpb_initial_removal_delay_length_minus1: Tguint8;
    cpb_removal_delay_length_minus1: Tguint8;
    dpb_output_delay_length_minus1: Tguint8;
    du_hrd_params_present_flag: Tguint8;
    du_cpb_removal_delay_increment_length_minus1: Tguint8;
    dpb_output_delay_du_length_minus1: Tguint8;
    du_cpb_params_in_pic_timing_sei_flag: Tguint8;
    du_dpb_params_in_pic_timing_sei_flag: Tguint8;
    concatenation_flag: Tguint8;
    additional_concatenation_info_present_flag: Tguint8;
    max_initial_removal_delay_for_concatenation: Tguint8;
    cpb_removal_delay_delta_minus1: Tguint8;
    max_sublayers_minus1: Tguint8;
    cpb_removal_delay_deltas_present_flag: Tguint8;
    num_cpb_removal_delay_deltas_minus1: Tguint8;
    cpb_removal_delay_delta_val: array[0..15] of Tguint8;
    cpb_cnt_minus1: Tguint8;
    sublayer_initial_cpb_removal_delay_present_flag: Tguint8;
    nal_initial_cpb_removal_delay: array[0..7] of array[0..31] of Tguint8;
    nal_initial_cpb_removal_offset: array[0..7] of array[0..31] of Tguint8;
    nal_initial_alt_cpb_removal_delay: array[0..7] of array[0..31] of Tguint8;
    nal_initial_alt_cpb_removal_offset: array[0..7] of array[0..31] of Tguint8;
    vcl_initial_cpb_removal_delay: array[0..7] of array[0..31] of Tguint8;
    vcl_initial_cpb_removal_offset: array[0..7] of array[0..31] of Tguint8;
    vcl_initial_alt_cpb_removal_delay: array[0..7] of array[0..31] of Tguint8;
    vcl_initial_alt_cpb_removal_offset: array[0..7] of array[0..31] of Tguint8;
    sublayer_dpb_output_offsets_present_flag: Tguint8;
    dpb_output_tid_offset: array[0..7] of Tguint32;
    alt_cpb_params_present_flag: Tguint8;
    use_alt_cpb_params_flag: Tguint8;
  end;

  PGstH266PicTiming = ^TGstH266PicTiming;
  TGstH266PicTiming = record
    cpb_removal_delay_minus: Tguint8;
    sublayer_delays_present_flag: array[0..7] of Tguint8;
    cpb_removal_delay_delta_enabled_flag: array[0..7] of Tguint8;
    cpb_removal_delay_delta_idx: array[0..7] of Tguint8;
    cpb_removal_delay_minus1: array[0..7] of Tguint8;
    dpb_output_delay: Tguint8;
    cpb_alt_timing_info_present_flag: Tguint8;
    nal_cpb_alt_initial_removal_delay_delta: array[0..7] of array[0..31] of Tguint8;
    nal_cpb_alt_initial_removal_offset_delta: array[0..7] of array[0..31] of Tguint8;
    nal_cpb_delay_offset: array[0..7] of Tguint8;
    nal_dpb_delay_offset: array[0..7] of Tguint8;
    vcl_cpb_alt_initial_removal_delay_delta: array[0..7] of array[0..31] of Tguint8;
    vcl_cpb_alt_initial_removal_offset_delta: array[0..7] of array[0..31] of Tguint8;
    vcl_cpb_delay_offset: array[0..7] of Tguint8;
    vcl_dpb_delay_offset: array[0..7] of Tguint8;
    dpb_output_du_delay: Tguint8;
    num_decoding_units_minus1: Tguint32;
    du_common_cpb_removal_delay_flag: Tguint8;
    du_common_cpb_removal_delay_increment_minus1: array[0..7] of Tguint8;
    num_nalus_in_du_minus1: array[0..(GST_H266_MAX_DECODING_UNITS_IN_PIC_TIMING) - 1] of Tguint32;
    du_cpb_removal_delay_increment_minus1: array[0..(GST_H266_MAX_DECODING_UNITS_IN_PIC_TIMING) - 1] of array[0..7] of Tguint8;
    delay_for_concatenation_ensured_flag: Tguint8;
    display_elemental_periods_minus1: Tguint8;
  end;

  PGstH266RegisteredUserData = ^TGstH266RegisteredUserData;
  TGstH266RegisteredUserData = record
    country_code: Tguint8;
    country_code_extension: Tguint8;
    size: Tguint;
    data: Pguint8;
  end;

  PGstH266DUInfo = ^TGstH266DUInfo;
  TGstH266DUInfo = record
    decoding_unit_idx: Tguint32;
    sublayer_delays_present_flag: array[0..7] of Tguint8;
    du_cpb_removal_delay_increment: array[0..7] of Tguint8;
    dpb_output_du_delay_present_flag: Tguint8;
    dpb_output_du_delay: Tguint8;
  end;

  PGstH266ScalableNesting = ^TGstH266ScalableNesting;
  TGstH266ScalableNesting = record
    ols_flag: Tguint8;
    subpic_flag: Tguint8;
    num_olss_minus1: Tguint8;
    ols_idx_delta_minus1: array[0..(GST_H266_MAX_TOTAL_NUM_OLSS) - 1] of Tguint8;
    all_layers_flag: Tguint8;
    num_layers_minus1: Tguint8;
    layer_id: array[0..(GST_H266_MAX_LAYERS) - 1] of Tguint8;
    num_subpics_minus1: Tguint16;
    subpic_id_len_minus1: Tguint8;
    subpic_id: array[0..(GST_H266_MAX_SLICES_PER_AU) - 1] of Tguint8;
    num_seis_minus1: Tguint8;
  end;

  PGstH266SubPicLevelInfo = ^TGstH266SubPicLevelInfo;
  TGstH266SubPicLevelInfo = record
    num_ref_levels_minus1: Tguint8;
    cbr_constraint_flag: Tguint8;
    explicit_fraction_present_flag: Tguint8;
    num_subpics_minus1: Tguint16;
    max_sublayers_minus1: Tguint8;
    sublayer_info_present_flag: Tguint8;
    non_subpic_layers_fraction: array[0..(GST_H266_MAX_SLI_REF_LEVELS) - 1] of array[0..(GST_H266_MAX_SUBLAYERS) - 1] of Tguint8;
    ref_level_idc: array[0..(GST_H266_MAX_SLI_REF_LEVELS) - 1] of array[0..(GST_H266_MAX_SUBLAYERS) - 1] of Tguint8;
    ref_level_fraction_minus1: array[0..(GST_H266_MAX_SLI_REF_LEVELS) - 1] of array[0..(GST_H266_MAX_SLICES_PER_AU) - 1] of array[0..(GST_H266_MAX_SUBLAYERS) - 1] of Tguint8;
  end;

  PGstH266FrameFieldInfo = ^TGstH266FrameFieldInfo;
  TGstH266FrameFieldInfo = record
    field_pic_flag: Tguint8;
    bottom_field_flag: Tguint8;
    pairing_indicated_flag: Tguint8;
    paired_with_next_field_flag: Tguint8;
    display_fields_from_frame_flag: Tguint8;
    top_field_first_flag: Tguint8;
    display_elemental_periods_minus1: Tguint8;
    source_scan_type: Tguint8;
    duplicate_flag: Tguint8;
    valid: Tgboolean;
  end;

  PGstH266SEIMessage = ^TGstH266SEIMessage;
  TGstH266SEIMessage = record
    payloadType: TGstH266SEIPayloadType;
    payload: record
      case longint of
        0: (buffering_period: TGstH266BufferingPeriod);
        1: (pic_timing: TGstH266PicTiming);
        2: (du_info: TGstH266DUInfo);
        3: (scalable_nesting: TGstH266ScalableNesting);
        4: (subpic_level_info: TGstH266SubPicLevelInfo);
        5: (frame_field_info: TGstH266FrameFieldInfo);
        6: (registered_user_data: TGstH266RegisteredUserData);
        7: (padding: array[0..(GST_PADDING_LARGE) - 1] of Tgpointer);
      end;
  end;

  PGstH266DecoderConfigRecordNalUnitArray = ^TGstH266DecoderConfigRecordNalUnitArray;
  TGstH266DecoderConfigRecordNalUnitArray = record
    array_completeness: Tguint8;
    nal_unit_type: TGstH266NalUnitType;
    nalu: PGArray;
  end;

  PGstH266PTLRecord = ^TGstH266PTLRecord;
  TGstH266PTLRecord = record
    num_bytes_constraint_info: Tguint8;
    general_profile_idc: Tguint8;
    general_tier_flag: Tguint8;
    general_level_idc: Tguint8;
    ptl_frame_only_constraint_flag: Tguint8;
    ptl_multilayer_enabled_flag: Tguint8;
    general_constraint_info: array[0..62] of Tguint8;
    ptl_sublayer_level_present_flag: array[0..6] of Tguint8;
    sublayer_level_idc: array[0..6] of Tguint8;
    ptl_num_sub_profiles: Tguint8;
    general_sub_profile_idc: array[0..254] of Tguint32;
  end;

  PPGstH266DecoderConfigRecord = ^PGstH266DecoderConfigRecord;
  PGstH266DecoderConfigRecord = ^TGstH266DecoderConfigRecord;
  TGstH266DecoderConfigRecord = record
    length_size_minus_one: Tguint8;
    ptl_present_flag: Tguint8;
    ols_idx: Tguint16;
    num_sublayers: Tguint8;
    constant_frame_rate: Tguint8;
    chroma_format_idc: Tguint8;
    bit_depth_minus8: Tguint8;
    native_ptl: TGstH266PTLRecord;
    max_picture_width: Tguint16;
    max_picture_height: Tguint16;
    avg_frame_rate: Tguint16;
    nalu_array: PGArray;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstH266Parser = ^TGstH266Parser;
  TGstH266Parser = record
    vps: array[0..(GST_H266_MAX_VPS_COUNT) - 1] of TGstH266VPS;
    sps: array[0..(GST_H266_MAX_SPS_COUNT) - 1] of TGstH266SPS;
    pps: array[0..(GST_H266_MAX_PPS_COUNT) - 1] of TGstH266PPS;
    aps: array[0..(GST_H266_APS_TYPE_MAX) - 1] of array[0..(GST_H266_MAX_APS_COUNT) - 1] of TGstH266APS;
    last_vps: PGstH266VPS;
    last_sps: PGstH266SPS;
    last_pps: PGstH266PPS;
    last_aps: array[0..(GST_H266_APS_TYPE_MAX) - 1] of PGstH266APS;
    ph: TGstH266PicHdr;
    buffering_period: TGstH266SEIMessage;
    last_buffering_period: PGstH266SEIMessage;
    active_vps: PGstH266VPS;
    active_sps: PGstH266SPS;
    active_pps: PGstH266PPS;
    ctb_addr_in_slice: array[0..(GST_H266_MAX_CTUS_IN_PICTURE) - 1] of Tguint16;
    slice_start_offset: array[0..(GST_H266_MAX_SLICES_PER_AU) - 1] of Tguint16;
    num_ctus_in_slice: array[0..(GST_H266_MAX_SLICES_PER_AU) - 1] of Tguint16;
    ctb_to_tile_col_bd: array[0..(GST_H266_MAX_CTUS_IN_PICTURE) - 1] of Tguint16;
    ctb_to_tile_row_bd: array[0..(GST_H266_MAX_CTUS_IN_PICTURE) - 1] of Tguint16;
  end;


function gst_h266_parser_new: PGstH266Parser; cdecl; external libgstcodecparsers;
function gst_h266_parser_identify_nalu(parser: PGstH266Parser; data: Pguint8; offset: Tguint; size: Tgsize; nalu: PGstH266NalUnit): TGstH266ParserResult; cdecl; external libgstcodecparsers;
function gst_h266_parser_identify_nalu_unchecked(parser: PGstH266Parser; data: Pguint8; offset: Tguint; size: Tgsize; nalu: PGstH266NalUnit): TGstH266ParserResult; cdecl; external libgstcodecparsers;
function gst_h266_parser_identify_nalu_vvc(parser: PGstH266Parser; data: Pguint8; offset: Tguint; size: Tgsize; nal_length_size: Tguint8;
  nalu: PGstH266NalUnit): TGstH266ParserResult; cdecl; external libgstcodecparsers;
function gst_h266_parser_identify_and_split_nalu_vvc(parser: PGstH266Parser; data: Pguint8; offset: Tguint; size: Tgsize; nal_length_size: Tguint8;
  nalus: PGArray; consumed: Pgsize): TGstH266ParserResult; cdecl; external libgstcodecparsers;
function gst_h266_parser_parse_nal(parser: PGstH266Parser; nalu: PGstH266NalUnit): TGstH266ParserResult; cdecl; external libgstcodecparsers;
function gst_h266_parser_parse_aud(parser: PGstH266Parser; nalu: PGstH266NalUnit; aud: PGstH266AUD): TGstH266ParserResult; cdecl; external libgstcodecparsers;
function gst_h266_parser_parse_opi(parser: PGstH266Parser; nalu: PGstH266NalUnit; opi: PGstH266OPI): TGstH266ParserResult; cdecl; external libgstcodecparsers;
function gst_h266_parser_parse_dci(parser: PGstH266Parser; nalu: PGstH266NalUnit; dci: PGstH266DCI): TGstH266ParserResult; cdecl; external libgstcodecparsers;
function gst_h266_parser_parse_picture_hdr(parser: PGstH266Parser; nalu: PGstH266NalUnit; picture: PGstH266PicHdr): TGstH266ParserResult; cdecl; external libgstcodecparsers;
function gst_h266_parser_parse_slice_hdr(parser: PGstH266Parser; nalu: PGstH266NalUnit; slice: PGstH266SliceHdr): TGstH266ParserResult; cdecl; external libgstcodecparsers;
function gst_h266_parser_parse_vps(parser: PGstH266Parser; nalu: PGstH266NalUnit; vps: PGstH266VPS): TGstH266ParserResult; cdecl; external libgstcodecparsers;
function gst_h266_parser_parse_sps(parser: PGstH266Parser; nalu: PGstH266NalUnit; sps: PGstH266SPS): TGstH266ParserResult; cdecl; external libgstcodecparsers;
function gst_h266_parser_parse_pps(parser: PGstH266Parser; nalu: PGstH266NalUnit; pps: PGstH266PPS): TGstH266ParserResult; cdecl; external libgstcodecparsers;
function gst_h266_parser_parse_aps(parser: PGstH266Parser; nalu: PGstH266NalUnit; aps: PGstH266APS): TGstH266ParserResult; cdecl; external libgstcodecparsers;
function gst_h266_parser_parse_sei(parser: PGstH266Parser; nalu: PGstH266NalUnit; messages: PPGArray): TGstH266ParserResult; cdecl; external libgstcodecparsers;
procedure gst_h266_parser_free(parser: PGstH266Parser); cdecl; external libgstcodecparsers;
function gst_h266_parse_vps(nalu: PGstH266NalUnit; vps: PGstH266VPS): TGstH266ParserResult; cdecl; external libgstcodecparsers;
function gst_h266_parse_sps(parser: PGstH266Parser; nalu: PGstH266NalUnit; sps: PGstH266SPS): TGstH266ParserResult; cdecl; external libgstcodecparsers;
function gst_h266_parse_pps(parser: PGstH266Parser; nalu: PGstH266NalUnit; pps: PGstH266PPS): TGstH266ParserResult; cdecl; external libgstcodecparsers;
function gst_h266_parse_aps(parser: PGstH266Parser; nalu: PGstH266NalUnit; aps: PGstH266APS): TGstH266ParserResult; cdecl; external libgstcodecparsers;
function gst_h266_profile_to_string(profile: TGstH266Profile): Pgchar; cdecl; external libgstcodecparsers;
function gst_h266_profile_from_string(_string: Pgchar): TGstH266Profile; cdecl; external libgstcodecparsers;
procedure gst_h266_decoder_config_record_free(config: PGstH266DecoderConfigRecord); cdecl; external libgstcodecparsers;
function gst_h266_parser_parse_decoder_config_record(parser: PGstH266Parser; data: Pguint8; size: Tgsize; config: PPGstH266DecoderConfigRecord): TGstH266ParserResult; cdecl; external libgstcodecparsers;

// === Konventiert am: 21-7-26 17:01:59 ===

function GST_H266_IS_B_SLICE(slice: PGstH266SliceHdr): Tgboolean; inline;
function GST_H266_IS_P_SLICE(slice: PGstH266SliceHdr): Tgboolean; inline;
function GST_H266_IS_I_SLICE(slice: PGstH266SliceHdr): Tgboolean; inline;

function GST_H266_IS_NAL_TYPE_GDR(nal_type: Tguint8): Tgboolean; inline;
function GST_H266_IS_NAL_TYPE_CRA(nal_type: Tguint8): Tgboolean; inline;
function GST_H266_IS_NAL_TYPE_RADL(nal_type: Tguint8): Tgboolean; inline;
function GST_H266_IS_NAL_TYPE_RASL(nal_type: Tguint8): Tgboolean; inline;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_H266_IS_B_SLICE(slice: PGstH266SliceHdr): Tgboolean;
begin
  Result := slice^.slice_type = GST_H266_B_SLICE;
end;

function GST_H266_IS_P_SLICE(slice: PGstH266SliceHdr): Tgboolean;
begin
  Result := slice^.slice_type = GST_H266_P_SLICE;
end;

function GST_H266_IS_I_SLICE(slice: PGstH266SliceHdr): Tgboolean;
begin
  Result := slice^.slice_type = GST_H266_I_SLICE;
end;

function GST_H266_IS_NAL_TYPE_GDR(nal_type: Tguint8): Tgboolean;
begin
  Result := nal_type = GST_H266_NAL_SLICE_GDR;
end;

function GST_H266_IS_NAL_TYPE_CRA(nal_type: Tguint8): Tgboolean;
begin
  Result := nal_type = GST_H266_NAL_SLICE_CRA;
end;

function GST_H266_IS_NAL_TYPE_RADL(nal_type: Tguint8): Tgboolean;
begin
  Result := nal_type = GST_H266_NAL_SLICE_RADL;
end;

function GST_H266_IS_NAL_TYPE_RASL(nal_type: Tguint8): Tgboolean;
begin
  Result := nal_type = GST_H266_NAL_SLICE_RASL;
end;


function GST_H266_IS_NAL_TYPE_IDR(nal_type: Tguint8): Tgboolean;
begin
  Result := (nal_type = GST_H266_NAL_SLICE_IDR_N_LP) or (nal_type = GST_H266_NAL_SLICE_IDR_W_RADL);
end;

function GST_H266_IS_NAL_TYPE_IRAP(nal_type: Tguint8): Tgboolean;
begin
  Result := GST_H266_IS_NAL_TYPE_IDR(nal_type) or GST_H266_IS_NAL_TYPE_CRA(nal_type);
end;

function GST_H266_IS_NAL_TYPE_CVSS(nal_type: Tguint8): Tgboolean;
begin
  Result := GST_H266_IS_NAL_TYPE_IRAP(nal_type) or GST_H266_IS_NAL_TYPE_GDR(nal_type);
end;

{$ENDIF read_implementation}
