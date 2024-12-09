
{$IFDEF read_interface}

  {#warning "The H.265 parsing library is unstable API and may change in future." }
  {#warning "You can define GST_USE_UNSTABLE_API to avoid this warning." }
const
  GST_H265_MAX_SUB_LAYERS = 8;
  GST_H265_MAX_VPS_COUNT = 16;
  GST_H265_MAX_SPS_COUNT = 16;
  GST_H265_MAX_PPS_COUNT = 64;

type
  PGstH265Profile = ^TGstH265Profile;
  TGstH265Profile = longint;

const
  GST_H265_PROFILE_INVALID = -(1);
  GST_H265_PROFILE_MAIN = 1;
  GST_H265_PROFILE_MAIN_10 = 2;
  GST_H265_PROFILE_MAIN_STILL_PICTURE = 3;
  GST_H265_PROFILE_MONOCHROME = 4;
  GST_H265_PROFILE_MONOCHROME_12 = 5;
  GST_H265_PROFILE_MONOCHROME_16 = 6;
  GST_H265_PROFILE_MAIN_12 = 7;
  GST_H265_PROFILE_MAIN_422_10 = 8;
  GST_H265_PROFILE_MAIN_422_12 = 9;
  GST_H265_PROFILE_MAIN_444 = 10;
  GST_H265_PROFILE_MAIN_444_10 = 11;
  GST_H265_PROFILE_MAIN_444_12 = 12;
  GST_H265_PROFILE_MAIN_INTRA = 13;
  GST_H265_PROFILE_MAIN_10_INTRA = 14;
  GST_H265_PROFILE_MAIN_12_INTRA = 15;
  GST_H265_PROFILE_MAIN_422_10_INTRA = 16;
  GST_H265_PROFILE_MAIN_422_12_INTRA = 17;
  GST_H265_PROFILE_MAIN_444_INTRA = 18;
  GST_H265_PROFILE_MAIN_444_10_INTRA = 19;
  GST_H265_PROFILE_MAIN_444_12_INTRA = 20;
  GST_H265_PROFILE_MAIN_444_16_INTRA = 21;
  GST_H265_PROFILE_MAIN_444_STILL_PICTURE = 22;
  GST_H265_PROFILE_MAIN_444_16_STILL_PICTURE = 23;
  GST_H265_PROFILE_MONOCHROME_10 = 24;
  GST_H265_PROFILE_HIGH_THROUGHPUT_444 = 25;
  GST_H265_PROFILE_HIGH_THROUGHPUT_444_10 = 26;
  GST_H265_PROFILE_HIGH_THROUGHPUT_444_14 = 27;
  GST_H265_PROFILE_HIGH_THROUGHPUT_444_16_INTRA = 28;
  GST_H265_PROFILE_SCREEN_EXTENDED_MAIN = 29;
  GST_H265_PROFILE_SCREEN_EXTENDED_MAIN_10 = 30;
  GST_H265_PROFILE_SCREEN_EXTENDED_MAIN_444 = 31;
  GST_H265_PROFILE_SCREEN_EXTENDED_MAIN_444_10 = 32;
  GST_H265_PROFILE_SCREEN_EXTENDED_HIGH_THROUGHPUT_444 = 33;
  GST_H265_PROFILE_SCREEN_EXTENDED_HIGH_THROUGHPUT_444_10 = 34;
  GST_H265_PROFILE_SCREEN_EXTENDED_HIGH_THROUGHPUT_444_14 = 35;
  GST_H265_PROFILE_MULTIVIEW_MAIN = 36;
  GST_H265_PROFILE_SCALABLE_MAIN = 37;
  GST_H265_PROFILE_SCALABLE_MAIN_10 = 38;
  GST_H265_PROFILE_SCALABLE_MONOCHROME = 39;
  GST_H265_PROFILE_SCALABLE_MONOCHROME_12 = 40;
  GST_H265_PROFILE_SCALABLE_MONOCHROME_16 = 41;
  GST_H265_PROFILE_SCALABLE_MAIN_444 = 42;
  GST_H265_PROFILE_3D_MAIN = 43;
  GST_H265_PROFILE_MAX = 44;

type
  PGstH265ProfileIDC = ^TGstH265ProfileIDC;
  TGstH265ProfileIDC = longint;

const
  GST_H265_PROFILE_IDC_MAIN = 1;
  GST_H265_PROFILE_IDC_MAIN_10 = 2;
  GST_H265_PROFILE_IDC_MAIN_STILL_PICTURE = 3;
  GST_H265_PROFILE_IDC_FORMAT_RANGE_EXTENSION = 4;
  GST_H265_PROFILE_IDC_HIGH_THROUGHPUT = 5;
  GST_H265_PROFILE_IDC_MULTIVIEW_MAIN = 6;
  GST_H265_PROFILE_IDC_SCALABLE_MAIN = 7;
  GST_H265_PROFILE_IDC_3D_MAIN = 8;
  GST_H265_PROFILE_IDC_SCREEN_CONTENT_CODING = 9;
  GST_H265_PROFILE_IDC_SCALABLE_FORMAT_RANGE_EXTENSION = 10;
  GST_H265_PROFILE_IDC_HIGH_THROUGHPUT_SCREEN_CONTENT_CODING_EXTENSION = 11;

type
  PGstH265NalUnitType = ^TGstH265NalUnitType;
  TGstH265NalUnitType = longint;

const
  GST_H265_NAL_SLICE_TRAIL_N = 0;
  GST_H265_NAL_SLICE_TRAIL_R = 1;
  GST_H265_NAL_SLICE_TSA_N = 2;
  GST_H265_NAL_SLICE_TSA_R = 3;
  GST_H265_NAL_SLICE_STSA_N = 4;
  GST_H265_NAL_SLICE_STSA_R = 5;
  GST_H265_NAL_SLICE_RADL_N = 6;
  GST_H265_NAL_SLICE_RADL_R = 7;
  GST_H265_NAL_SLICE_RASL_N = 8;
  GST_H265_NAL_SLICE_RASL_R = 9;
  GST_H265_NAL_SLICE_BLA_W_LP = 16;
  GST_H265_NAL_SLICE_BLA_W_RADL = 17;
  GST_H265_NAL_SLICE_BLA_N_LP = 18;
  GST_H265_NAL_SLICE_IDR_W_RADL = 19;
  GST_H265_NAL_SLICE_IDR_N_LP = 20;
  GST_H265_NAL_SLICE_CRA_NUT = 21;
  GST_H265_NAL_VPS = 32;
  GST_H265_NAL_SPS = 33;
  GST_H265_NAL_PPS = 34;
  GST_H265_NAL_AUD = 35;
  GST_H265_NAL_EOS = 36;
  GST_H265_NAL_EOB = 37;
  GST_H265_NAL_FD = 38;
  GST_H265_NAL_PREFIX_SEI = 39;
  GST_H265_NAL_SUFFIX_SEI = 40;

const
  RESERVED_NON_IRAP_SUBLAYER_NAL_TYPE_MIN = 10;
  RESERVED_NON_IRAP_SUBLAYER_NAL_TYPE_MAX = 15;
  RESERVED_IRAP_NAL_TYPE_MIN = 22;
  RESERVED_IRAP_NAL_TYPE_MAX = 23;
  RESERVED_NON_IRAP_NAL_TYPE_MIN = 24;
  RESERVED_NON_IRAP_NAL_TYPE_MAX = 31;
  RESERVED_NON_VCL_NAL_TYPE_MIN = 41;
  RESERVED_NON_VCL_NAL_TYPE_MAX = 47;
  UNSPECIFIED_NON_VCL_NAL_TYPE_MIN = 48;
  UNSPECIFIED_NON_VCL_NAL_TYPE_MAX = 63;

type
  PGstH265ParserResult = ^TGstH265ParserResult;
  TGstH265ParserResult = longint;

const
  GST_H265_PARSER_OK = 0;
  GST_H265_PARSER_BROKEN_DATA = 1;
  GST_H265_PARSER_BROKEN_LINK = 2;
  GST_H265_PARSER_ERROR = 3;
  GST_H265_PARSER_NO_NAL = 4;
  GST_H265_PARSER_NO_NAL_END = 5;

type
  PGstH265SEIPayloadType = ^TGstH265SEIPayloadType;
  TGstH265SEIPayloadType = longint;

const
  GST_H265_SEI_BUF_PERIOD = 0;
  GST_H265_SEI_PIC_TIMING = 1;
  GST_H265_SEI_REGISTERED_USER_DATA = 4;
  GST_H265_SEI_USER_DATA_UNREGISTERED = 5;
  GST_H265_SEI_RECOVERY_POINT = 6;
  GST_H265_SEI_TIME_CODE = 136;
  GST_H265_SEI_MASTERING_DISPLAY_COLOUR_VOLUME = 137;
  GST_H265_SEI_CONTENT_LIGHT_LEVEL = 144;

type
  PGstH265SEIPicStructType = ^TGstH265SEIPicStructType;
  TGstH265SEIPicStructType = longint;

const
  GST_H265_SEI_PIC_STRUCT_FRAME = 0;
  GST_H265_SEI_PIC_STRUCT_TOP_FIELD = 1;
  GST_H265_SEI_PIC_STRUCT_BOTTOM_FIELD = 2;
  GST_H265_SEI_PIC_STRUCT_TOP_BOTTOM = 3;
  GST_H265_SEI_PIC_STRUCT_BOTTOM_TOP = 4;
  GST_H265_SEI_PIC_STRUCT_TOP_BOTTOM_TOP = 5;
  GST_H265_SEI_PIC_STRUCT_BOTTOM_TOP_BOTTOM = 6;
  GST_H265_SEI_PIC_STRUCT_FRAME_DOUBLING = 7;
  GST_H265_SEI_PIC_STRUCT_FRAME_TRIPLING = 8;
  GST_H265_SEI_PIC_STRUCT_TOP_PAIRED_PREVIOUS_BOTTOM = 9;
  GST_H265_SEI_PIC_STRUCT_BOTTOM_PAIRED_PREVIOUS_TOP = 10;
  GST_H265_SEI_PIC_STRUCT_TOP_PAIRED_NEXT_BOTTOM = 11;
  GST_H265_SEI_PIC_STRUCT_BOTTOM_PAIRED_NEXT_TOP = 12;

type
  PGstH265SliceType = ^TGstH265SliceType;
  TGstH265SliceType = longint;

const
  GST_H265_B_SLICE = 0;
  GST_H265_P_SLICE = 1;
  GST_H265_I_SLICE = 2;

type
  PGstH265QuantMatrixSize = ^TGstH265QuantMatrixSize;
  TGstH265QuantMatrixSize = longint;

const
  GST_H265_QUANT_MATIX_4X4 = 0;
  GST_H265_QUANT_MATIX_8X8 = 1;
  GST_H265_QUANT_MATIX_16X16 = 2;
  GST_H265_QUANT_MATIX_32X32 = 3;

type
  PGstH265Level = ^TGstH265Level;
  TGstH265Level = longint;

const
  GST_H265_LEVEL_L1 = 30;
  GST_H265_LEVEL_L2 = 60;
  GST_H265_LEVEL_L2_1 = 63;
  GST_H265_LEVEL_L3 = 90;
  GST_H265_LEVEL_L3_1 = 93;
  GST_H265_LEVEL_L4 = 120;
  GST_H265_LEVEL_L4_1 = 123;
  GST_H265_LEVEL_L5 = 150;
  GST_H265_LEVEL_L5_1 = 153;
  GST_H265_LEVEL_L5_2 = 156;
  GST_H265_LEVEL_L6 = 180;
  GST_H265_LEVEL_L6_1 = 183;
  GST_H265_LEVEL_L6_2 = 186;

type
  TGstH265NalUnit = record
    _type: Tguint8;
    layer_id: Tguint8;
    temporal_id_plus1: Tguint8;
    size: Tguint;
    offset: Tguint;
    sc_offset: Tguint;
    valid: Tgboolean;
    Data: Pguint8;
    header_bytes: Tguint8;
  end;
  PGstH265NalUnit = ^TGstH265NalUnit;

  TGstH265ProfileTierLevel = record
    profile_space: Tguint8;
    tier_flag: Tguint8;
    profile_idc: Tguint8;
    profile_compatibility_flag: array[0..31] of Tguint8;
    progressive_source_flag: Tguint8;
    interlaced_source_flag: Tguint8;
    non_packed_constraint_flag: Tguint8;
    frame_only_constraint_flag: Tguint8;
    max_12bit_constraint_flag: Tguint8;
    max_10bit_constraint_flag: Tguint8;
    max_8bit_constraint_flag: Tguint8;
    max_422chroma_constraint_flag: Tguint8;
    max_420chroma_constraint_flag: Tguint8;
    max_monochrome_constraint_flag: Tguint8;
    intra_constraint_flag: Tguint8;
    one_picture_only_constraint_flag: Tguint8;
    lower_bit_rate_constraint_flag: Tguint8;
    max_14bit_constraint_flag: Tguint8;
    level_idc: Tguint8;
    sub_layer_profile_present_flag: array[0..5] of Tguint8;
    sub_layer_level_present_flag: array[0..5] of Tguint8;
    sub_layer_profile_space: array[0..5] of Tguint8;
    sub_layer_tier_flag: array[0..5] of Tguint8;
    sub_layer_profile_idc: array[0..5] of Tguint8;
    sub_layer_profile_compatibility_flag: array[0..5] of array[0..31] of Tguint8;
    sub_layer_progressive_source_flag: array[0..5] of Tguint8;
    sub_layer_interlaced_source_flag: array[0..5] of Tguint8;
    sub_layer_non_packed_constraint_flag: array[0..5] of Tguint8;
    sub_layer_frame_only_constraint_flag: array[0..5] of Tguint8;
    sub_layer_level_idc: array[0..5] of Tguint8;
  end;
  PGstH265ProfileTierLevel = ^TGstH265ProfileTierLevel;

  TGstH265SubLayerHRDParams = record
    bit_rate_value_minus1: array[0..31] of Tguint32;
    cpb_size_value_minus1: array[0..31] of Tguint32;
    cpb_size_du_value_minus1: array[0..31] of Tguint32;
    bit_rate_du_value_minus1: array[0..31] of Tguint32;
    cbr_flag: array[0..31] of Tguint8;
  end;
  PGstH265SubLayerHRDParams = ^TGstH265SubLayerHRDParams;

  TGstH265HRDParams = record
    nal_hrd_parameters_present_flag: Tguint8;
    vcl_hrd_parameters_present_flag: Tguint8;
    sub_pic_hrd_params_present_flag: Tguint8;
    tick_divisor_minus2: Tguint8;
    du_cpb_removal_delay_increment_length_minus1: Tguint8;
    sub_pic_cpb_params_in_pic_timing_sei_flag: Tguint8;
    dpb_output_delay_du_length_minus1: Tguint8;
    bit_rate_scale: Tguint8;
    cpb_size_scale: Tguint8;
    cpb_size_du_scale: Tguint8;
    initial_cpb_removal_delay_length_minus1: Tguint8;
    au_cpb_removal_delay_length_minus1: Tguint8;
    dpb_output_delay_length_minus1: Tguint8;
    fixed_pic_rate_general_flag: array[0..6] of Tguint8;
    fixed_pic_rate_within_cvs_flag: array[0..6] of Tguint8;
    elemental_duration_in_tc_minus1: array[0..6] of Tguint16;
    low_delay_hrd_flag: array[0..6] of Tguint8;
    cpb_cnt_minus1: array[0..6] of Tguint8;
    sublayer_hrd_params: array[0..6] of TGstH265SubLayerHRDParams;
  end;
  PGstH265HRDParams = ^TGstH265HRDParams;

  TGstH265VPS = record
    id: Tguint8;
    base_layer_internal_flag: Tguint8;
    base_layer_available_flag: Tguint8;
    max_layers_minus1: Tguint8;
    max_sub_layers_minus1: Tguint8;
    temporal_id_nesting_flag: Tguint8;
    profile_tier_level: TGstH265ProfileTierLevel;
    sub_layer_ordering_info_present_flag: Tguint8;
    max_dec_pic_buffering_minus1: array[0..(GST_H265_MAX_SUB_LAYERS) - 1] of Tguint8;
    max_num_reorder_pics: array[0..(GST_H265_MAX_SUB_LAYERS) - 1] of Tguint8;
    max_latency_increase_plus1: array[0..(GST_H265_MAX_SUB_LAYERS) - 1] of Tguint32;
    max_layer_id: Tguint8;
    num_layer_sets_minus1: Tguint16;
    timing_info_present_flag: Tguint8;
    num_units_in_tick: Tguint32;
    time_scale: Tguint32;
    poc_proportional_to_timing_flag: Tguint8;
    num_ticks_poc_diff_one_minus1: Tguint32;
    num_hrd_parameters: Tguint16;
    hrd_layer_set_idx: Tguint16;
    cprms_present_flag: Tguint8;
    hrd_params: TGstH265HRDParams;
    vps_extension: Tguint8;
    valid: Tgboolean;
  end;
  PGstH265VPS = ^TGstH265VPS;

  TGstH265ShortTermRefPicSet = record
    inter_ref_pic_set_prediction_flag: Tguint8;
    delta_idx_minus1: Tguint8;
    delta_rps_sign: Tguint8;
    abs_delta_rps_minus1: Tguint16;
    NumDeltaPocs: Tguint8;
    NumNegativePics: Tguint8;
    NumPositivePics: Tguint8;
    UsedByCurrPicS0: array[0..15] of Tguint8;
    UsedByCurrPicS1: array[0..15] of Tguint8;
    DeltaPocS0: array[0..15] of Tgint32;
    DeltaPocS1: array[0..15] of Tgint32;
    NumDeltaPocsOfRefRpsIdx: Tguint8;
  end;
  PGstH265ShortTermRefPicSet = ^TGstH265ShortTermRefPicSet;

  TGstH265VUIParams = record
    parsed: Tgboolean;
    aspect_ratio_info_present_flag: Tguint8;
    aspect_ratio_idc: Tguint8;
    sar_width: Tguint16;
    sar_height: Tguint16;
    overscan_info_present_flag: Tguint8;
    overscan_appropriate_flag: Tguint8;
    video_signal_type_present_flag: Tguint8;
    video_format: Tguint8;
    video_full_range_flag: Tguint8;
    colour_description_present_flag: Tguint8;
    colour_primaries: Tguint8;
    transfer_characteristics: Tguint8;
    matrix_coefficients: Tguint8;
    chroma_loc_info_present_flag: Tguint8;
    chroma_sample_loc_type_top_field: Tguint8;
    chroma_sample_loc_type_bottom_field: Tguint8;
    neutral_chroma_indication_flag: Tguint8;
    field_seq_flag: Tguint8;
    frame_field_info_present_flag: Tguint8;
    default_display_window_flag: Tguint8;
    def_disp_win_left_offset: Tguint32;
    def_disp_win_right_offset: Tguint32;
    def_disp_win_top_offset: Tguint32;
    def_disp_win_bottom_offset: Tguint32;
    timing_info_present_flag: Tguint8;
    num_units_in_tick: Tguint32;
    time_scale: Tguint32;
    poc_proportional_to_timing_flag: Tguint8;
    num_ticks_poc_diff_one_minus1: Tguint32;
    hrd_parameters_present_flag: Tguint8;
    hrd_params: TGstH265HRDParams;
    bitstream_restriction_flag: Tguint8;
    tiles_fixed_structure_flag: Tguint8;
    motion_vectors_over_pic_boundaries_flag: Tguint8;
    restricted_ref_pic_lists_flag: Tguint8;
    min_spatial_segmentation_idc: Tguint16;
    max_bytes_per_pic_denom: Tguint8;
    max_bits_per_min_cu_denom: Tguint8;
    log2_max_mv_length_horizontal: Tguint8;
    log2_max_mv_length_vertical: Tguint8;
    par_n: Tguint;
    par_d: Tguint;
  end;
  PGstH265VUIParams = ^TGstH265VUIParams;

  TGstH265SPSExtensionParams = record
    transform_skip_rotation_enabled_flag: Tguint8;
    transform_skip_context_enabled_flag: Tguint8;
    implicit_rdpcm_enabled_flag: Tguint8;
    explicit_rdpcm_enabled_flag: Tguint8;
    extended_precision_processing_flag: Tguint8;
    intra_smoothing_disabled_flag: Tguint8;
    high_precision_offsets_enabled_flag: Tguint8;
    persistent_rice_adaptation_enabled_flag: Tguint8;
    cabac_bypass_alignment_enabled_flag: Tguint8;
  end;
  PGstH265SPSExtensionParams = ^TGstH265SPSExtensionParams;

  TGstH265SPSSccExtensionParams = record
    sps_curr_pic_ref_enabled_flag: Tguint8;
    palette_mode_enabled_flag: Tguint8;
    palette_max_size: Tguint8;
    delta_palette_max_predictor_size: Tguint8;
    sps_palette_predictor_initializers_present_flag: Tguint8;
    sps_num_palette_predictor_initializer_minus1: Tguint8;
    sps_palette_predictor_initializer: array[0..2] of array[0..127] of Tguint32;
    motion_vector_resolution_control_idc: Tguint8;
    intra_boundary_filtering_disabled_flag: Tguint8;
  end;
  PGstH265SPSSccExtensionParams = ^TGstH265SPSSccExtensionParams;

  TGstH265PPSExtensionParams = record
    log2_max_transform_skip_block_size_minus2: Tguint32;
    cross_component_prediction_enabled_flag: Tguint8;
    chroma_qp_offset_list_enabled_flag: Tguint8;
    diff_cu_chroma_qp_offset_depth: Tguint8;
    chroma_qp_offset_list_len_minus1: Tguint8;
    cb_qp_offset_list: array[0..5] of Tgint8;
    cr_qp_offset_list: array[0..5] of Tgint8;
    log2_sao_offset_scale_luma: Tguint8;
    log2_sao_offset_scale_chroma: Tguint8;
  end;
  PGstH265PPSExtensionParams = ^TGstH265PPSExtensionParams;

  TGstH265PPSSccExtensionParams = record
    pps_curr_pic_ref_enabled_flag: Tguint8;
    residual_adaptive_colour_transform_enabled_flag: Tguint8;
    pps_slice_act_qp_offsets_present_flag: Tguint8;
    pps_act_y_qp_offset_plus5: Tguint8;
    pps_act_cb_qp_offset_plus5: Tguint8;
    pps_act_cr_qp_offset_plus3: Tguint8;
    pps_palette_predictor_initializers_present_flag: Tguint8;
    pps_num_palette_predictor_initializer: Tguint8;
    monochrome_palette_flag: Tguint8;
    luma_bit_depth_entry_minus8: Tguint8;
    chroma_bit_depth_entry_minus8: Tguint32;
    pps_palette_predictor_initializer: array[0..2] of array[0..127] of Tguint32;
  end;
  PGstH265PPSSccExtensionParams = ^TGstH265PPSSccExtensionParams;

  TGstH265ScalingList = record
    scaling_list_dc_coef_minus8_16x16: array[0..5] of Tgint16;
    scaling_list_dc_coef_minus8_32x32: array[0..1] of Tgint16;
    scaling_lists_4x4: array[0..5] of array[0..15] of Tguint8;
    scaling_lists_8x8: array[0..5] of array[0..63] of Tguint8;
    scaling_lists_16x16: array[0..5] of array[0..63] of Tguint8;
    scaling_lists_32x32: array[0..1] of array[0..63] of Tguint8;
  end;
  PGstH265ScalingList = ^TGstH265ScalingList;

  TGstH265SPS = record
    id: Tguint8;
    vps_id: Tguint8;
    vps: PGstH265VPS;
    max_sub_layers_minus1: Tguint8;
    temporal_id_nesting_flag: Tguint8;
    profile_tier_level: TGstH265ProfileTierLevel;
    chroma_format_idc: Tguint8;
    separate_colour_plane_flag: Tguint8;
    pic_width_in_luma_samples: Tguint16;
    pic_height_in_luma_samples: Tguint16;
    conformance_window_flag: Tguint8;
    conf_win_left_offset: Tguint32;
    conf_win_right_offset: Tguint32;
    conf_win_top_offset: Tguint32;
    conf_win_bottom_offset: Tguint32;
    bit_depth_luma_minus8: Tguint8;
    bit_depth_chroma_minus8: Tguint8;
    log2_max_pic_order_cnt_lsb_minus4: Tguint8;
    sub_layer_ordering_info_present_flag: Tguint8;
    max_dec_pic_buffering_minus1: array[0..(GST_H265_MAX_SUB_LAYERS) - 1] of Tguint8;
    max_num_reorder_pics: array[0..(GST_H265_MAX_SUB_LAYERS) - 1] of Tguint8;
    max_latency_increase_plus1: array[0..(GST_H265_MAX_SUB_LAYERS) - 1] of Tguint8;
    log2_min_luma_coding_block_size_minus3: Tguint8;
    log2_diff_max_min_luma_coding_block_size: Tguint8;
    log2_min_transform_block_size_minus2: Tguint8;
    log2_diff_max_min_transform_block_size: Tguint8;
    max_transform_hierarchy_depth_inter: Tguint8;
    max_transform_hierarchy_depth_intra: Tguint8;
    scaling_list_enabled_flag: Tguint8;
    scaling_list_data_present_flag: Tguint8;
    scaling_list: TGstH265ScalingList;
    amp_enabled_flag: Tguint8;
    sample_adaptive_offset_enabled_flag: Tguint8;
    pcm_enabled_flag: Tguint8;
    pcm_sample_bit_depth_luma_minus1: Tguint8;
    pcm_sample_bit_depth_chroma_minus1: Tguint8;
    log2_min_pcm_luma_coding_block_size_minus3: Tguint8;
    log2_diff_max_min_pcm_luma_coding_block_size: Tguint8;
    pcm_loop_filter_disabled_flag: Tguint8;
    num_short_term_ref_pic_sets: Tguint8;
    short_term_ref_pic_set: array[0..64] of TGstH265ShortTermRefPicSet;
    long_term_ref_pics_present_flag: Tguint8;
    num_long_term_ref_pics_sps: Tguint8;
    lt_ref_pic_poc_lsb_sps: array[0..31] of Tguint16;
    used_by_curr_pic_lt_sps_flag: array[0..31] of Tguint8;
    temporal_mvp_enabled_flag: Tguint8;
    strong_intra_smoothing_enabled_flag: Tguint8;
    vui_parameters_present_flag: Tguint8;
    vui_params: TGstH265VUIParams;
    sps_extension_flag: Tguint8;
    sps_range_extension_flag: Tguint8;
    sps_multilayer_extension_flag: Tguint8;
    sps_3d_extension_flag: Tguint8;
    sps_scc_extension_flag: Tguint8;
    sps_extension_4bits: Tguint8;
    sps_extension_params: TGstH265SPSExtensionParams;
    sps_scc_extension_params: TGstH265SPSSccExtensionParams;
    chroma_array_type: Tguint8;
    Width: Tgint;
    Height: Tgint;
    crop_rect_width: Tgint;
    crop_rect_height: Tgint;
    crop_rect_x: Tgint;
    crop_rect_y: Tgint;
    fps_num: Tgint;
    fps_den: Tgint;
    valid: Tgboolean;
  end;
  PGstH265SPS = ^TGstH265SPS;

  TGstH265PPS = record
    id: Tguint;
    sps_id: Tguint;
    sps: PGstH265SPS;
    dependent_slice_segments_enabled_flag: Tguint8;
    output_flag_present_flag: Tguint8;
    num_extra_slice_header_bits: Tguint8;
    sign_data_hiding_enabled_flag: Tguint8;
    cabac_init_present_flag: Tguint8;
    num_ref_idx_l0_default_active_minus1: Tguint8;
    num_ref_idx_l1_default_active_minus1: Tguint8;
    init_qp_minus26: Tgint8;
    constrained_intra_pred_flag: Tguint8;
    transform_skip_enabled_flag: Tguint8;
    cu_qp_delta_enabled_flag: Tguint8;
    diff_cu_qp_delta_depth: Tguint8;
    cb_qp_offset: Tgint8;
    cr_qp_offset: Tgint8;
    slice_chroma_qp_offsets_present_flag: Tguint8;
    weighted_pred_flag: Tguint8;
    weighted_bipred_flag: Tguint8;
    transquant_bypass_enabled_flag: Tguint8;
    tiles_enabled_flag: Tguint8;
    entropy_coding_sync_enabled_flag: Tguint8;
    num_tile_columns_minus1: Tguint8;
    num_tile_rows_minus1: Tguint8;
    uniform_spacing_flag: Tguint8;
    column_width_minus1: array[0..19] of Tguint32;
    row_height_minus1: array[0..21] of Tguint32;
    loop_filter_across_tiles_enabled_flag: Tguint8;
    loop_filter_across_slices_enabled_flag: Tguint8;
    deblocking_filter_control_present_flag: Tguint8;
    deblocking_filter_override_enabled_flag: Tguint8;
    deblocking_filter_disabled_flag: Tguint8;
    beta_offset_div2: Tgint8;
    tc_offset_div2: Tgint8;
    scaling_list_data_present_flag: Tguint8;
    scaling_list: TGstH265ScalingList;
    lists_modification_present_flag: Tguint8;
    log2_parallel_merge_level_minus2: Tguint8;
    slice_segment_header_extension_present_flag: Tguint8;
    pps_extension_flag: Tguint8;
    pps_range_extension_flag: Tguint8;
    pps_multilayer_extension_flag: Tguint8;
    pps_3d_extension_flag: Tguint8;
    pps_scc_extension_flag: Tguint8;
    pps_extension_4bits: Tguint8;
    pps_extension_params: TGstH265PPSExtensionParams;
    pps_scc_extension_params: TGstH265PPSSccExtensionParams;
    PicWidthInCtbsY: Tguint32;
    PicHeightInCtbsY: Tguint32;
    valid: Tgboolean;
  end;
  PGstH265PPS = ^TGstH265PPS;

  TGstH265RefPicListModification = record
    ref_pic_list_modification_flag_l0: Tguint8;
    list_entry_l0: array[0..14] of Tguint32;
    ref_pic_list_modification_flag_l1: Tguint8;
    list_entry_l1: array[0..14] of Tguint32;
  end;
  PGstH265RefPicListModification = ^TGstH265RefPicListModification;

  TGstH265PredWeightTable = record
    luma_log2_weight_denom: Tguint8;
    delta_chroma_log2_weight_denom: Tgint8;
    luma_weight_l0_flag: array[0..14] of Tguint8;
    chroma_weight_l0_flag: array[0..14] of Tguint8;
    delta_luma_weight_l0: array[0..14] of Tgint8;
    luma_offset_l0: array[0..14] of Tgint8;
    delta_chroma_weight_l0: array[0..14] of array[0..1] of Tgint8;
    delta_chroma_offset_l0: array[0..14] of array[0..1] of Tgint16;
    luma_weight_l1_flag: array[0..14] of Tguint8;
    chroma_weight_l1_flag: array[0..14] of Tguint8;
    delta_luma_weight_l1: array[0..14] of Tgint8;
    luma_offset_l1: array[0..14] of Tgint8;
    delta_chroma_weight_l1: array[0..14] of array[0..1] of Tgint8;
    delta_chroma_offset_l1: array[0..14] of array[0..1] of Tgint16;
  end;
  PGstH265PredWeightTable = ^TGstH265PredWeightTable;

  TGstH265SliceHdr = record
    first_slice_segment_in_pic_flag: Tguint8;
    no_output_of_prior_pics_flag: Tguint8;
    pps: PGstH265PPS;
    dependent_slice_segment_flag: Tguint8;
    segment_address: Tguint32;
    _type: Tguint8;
    pic_output_flag: Tguint8;
    colour_plane_id: Tguint8;
    pic_order_cnt_lsb: Tguint16;
    short_term_ref_pic_set_sps_flag: Tguint8;
    short_term_ref_pic_sets: TGstH265ShortTermRefPicSet;
    short_term_ref_pic_set_idx: Tguint8;
    num_long_term_sps: Tguint8;
    num_long_term_pics: Tguint8;
    lt_idx_sps: array[0..15] of Tguint8;
    poc_lsb_lt: array[0..15] of Tguint32;
    used_by_curr_pic_lt_flag: array[0..15] of Tguint8;
    delta_poc_msb_present_flag: array[0..15] of Tguint8;
    delta_poc_msb_cycle_lt: array[0..15] of Tguint32;
    temporal_mvp_enabled_flag: Tguint8;
    sao_luma_flag: Tguint8;
    sao_chroma_flag: Tguint8;
    num_ref_idx_active_override_flag: Tguint8;
    num_ref_idx_l0_active_minus1: Tguint8;
    num_ref_idx_l1_active_minus1: Tguint8;
    ref_pic_list_modification: TGstH265RefPicListModification;
    mvd_l1_zero_flag: Tguint8;
    cabac_init_flag: Tguint8;
    collocated_from_l0_flag: Tguint8;
    collocated_ref_idx: Tguint8;
    pred_weight_table: TGstH265PredWeightTable;
    five_minus_max_num_merge_cand: Tguint8;
    use_integer_mv_flag: Tguint8;
    qp_delta: Tgint8;
    cb_qp_offset: Tgint8;
    cr_qp_offset: Tgint8;
    slice_act_y_qp_offset: Tgint8;
    slice_act_cb_qp_offset: Tgint8;
    slice_act_cr_qp_offset: Tgint8;
    cu_chroma_qp_offset_enabled_flag: Tguint8;
    deblocking_filter_override_flag: Tguint8;
    deblocking_filter_disabled_flag: Tguint8;
    beta_offset_div2: Tgint8;
    tc_offset_div2: Tgint8;
    loop_filter_across_slices_enabled_flag: Tguint8;
    num_entry_point_offsets: Tguint32;
    offset_len_minus1: Tguint8;
    entry_point_offset_minus1: Pguint32;
    NumPocTotalCurr: Tgint;
    header_size: Tguint;
    n_emulation_prevention_bytes: Tguint;
    short_term_ref_pic_set_size: Tguint;
    long_term_ref_pic_set_size: Tguint;
  end;
  PGstH265SliceHdr = ^TGstH265SliceHdr;

  TGstH265PicTiming = record
    pic_struct: Tguint8;
    source_scan_type: Tguint8;
    duplicate_flag: Tguint8;
    au_cpb_removal_delay_minus1: Tguint8;
    pic_dpb_output_delay: Tguint8;
    pic_dpb_output_du_delay: Tguint8;
    num_decoding_units_minus1: Tguint32;
    du_common_cpb_removal_delay_flag: Tguint8;
    du_common_cpb_removal_delay_increment_minus1: Tguint8;
    num_nalus_in_du_minus1: Pguint32;
    du_cpb_removal_delay_increment_minus1: Pguint8;
  end;
  PGstH265PicTiming = ^TGstH265PicTiming;

  TGstH265BufferingPeriod = record
    sps: PGstH265SPS;
    irap_cpb_params_present_flag: Tguint8;
    cpb_delay_offset: Tguint8;
    dpb_delay_offset: Tguint8;
    concatenation_flag: Tguint8;
    au_cpb_removal_delay_delta_minus1: Tguint8;
    nal_initial_cpb_removal_delay: array[0..31] of Tguint8;
    nal_initial_cpb_removal_offset: array[0..31] of Tguint8;
    nal_initial_alt_cpb_removal_delay: array[0..31] of Tguint8;
    nal_initial_alt_cpb_removal_offset: array[0..31] of Tguint8;
    vcl_initial_cpb_removal_delay: array[0..31] of Tguint8;
    vcl_initial_cpb_removal_offset: array[0..31] of Tguint8;
    vcl_initial_alt_cpb_removal_delay: array[0..31] of Tguint8;
    vcl_initial_alt_cpb_removal_offset: array[0..31] of Tguint8;
  end;
  PGstH265BufferingPeriod = ^TGstH265BufferingPeriod;

  TGstH265RecoveryPoint = record
    recovery_poc_cnt: Tgint32;
    exact_match_flag: Tguint8;
    broken_link_flag: Tguint8;
  end;
  PGstH265RecoveryPoint = ^TGstH265RecoveryPoint;

  TGstH265RegisteredUserData = record
    country_code: Tguint8;
    country_code_extension: Tguint8;
    Data: Pguint8;
    size: Tguint;
  end;
  PGstH265RegisteredUserData = ^TGstH265RegisteredUserData;

  TGstH265UserDataUnregistered = record
    uuid: array[0..15] of Tguint8;
    Data: Pguint8;
    size: Tguint;
  end;
  PGstH265UserDataUnregistered = ^TGstH265UserDataUnregistered;

  TGstH265TimeCode = record
    num_clock_ts: Tguint8;
    clock_timestamp_flag: array[0..2] of Tguint8;
    units_field_based_flag: array[0..2] of Tguint8;
    counting_type: array[0..2] of Tguint8;
    full_timestamp_flag: array[0..2] of Tguint8;
    discontinuity_flag: array[0..2] of Tguint8;
    cnt_dropped_flag: array[0..2] of Tguint8;
    n_frames: array[0..2] of Tguint16;
    seconds_flag: array[0..2] of Tguint8;
    seconds_value: array[0..2] of Tguint8;
    minutes_flag: array[0..2] of Tguint8;
    minutes_value: array[0..2] of Tguint8;
    hours_flag: array[0..2] of Tguint8;
    hours_value: array[0..2] of Tguint8;
    time_offset_length: array[0..2] of Tguint8;
    time_offset_value: array[0..2] of Tguint32;
  end;
  PGstH265TimeCode = ^TGstH265TimeCode;

  TGstH265MasteringDisplayColourVolume = record
    display_primaries_x: array[0..2] of Tguint16;
    display_primaries_y: array[0..2] of Tguint16;
    white_point_x: Tguint16;
    white_point_y: Tguint16;
    max_display_mastering_luminance: Tguint32;
    min_display_mastering_luminance: Tguint32;
  end;
  PGstH265MasteringDisplayColourVolume = ^TGstH265MasteringDisplayColourVolume;

  TGstH265ContentLightLevel = record
    max_content_light_level: Tguint16;
    max_pic_average_light_level: Tguint16;
  end;
  PGstH265ContentLightLevel = ^TGstH265ContentLightLevel;

  TGstH265SEIMessage = record
    payloadType: TGstH265SEIPayloadType;
    payload: record
      case longint of
        0: (buffering_period: TGstH265BufferingPeriod);
        1: (pic_timing: TGstH265PicTiming);
        2: (registered_user_data: TGstH265RegisteredUserData);
        3: (recovery_point: TGstH265RecoveryPoint);
        4: (time_code: TGstH265TimeCode);
        5: (mastering_display_colour_volume: TGstH265MasteringDisplayColourVolume);
        6: (content_light_level: TGstH265ContentLightLevel);
        7: (user_data_unregistered: TGstH265UserDataUnregistered);
      end;
  end;
  PGstH265SEIMessage = ^TGstH265SEIMessage;

  TGstH265DecoderConfigRecordNalUnitArray = record
    array_completeness: Tguint8;
    nal_unit_type: TGstH265NalUnitType;
    nalu: PGArray;
  end;
  PGstH265DecoderConfigRecordNalUnitArray = ^TGstH265DecoderConfigRecordNalUnitArray;

  TGstH265DecoderConfigRecord = record
    configuration_version: Tguint8;
    general_profile_space: Tguint8;
    general_tier_flag: Tguint8;
    general_profile_idc: Tguint8;
    general_profile_compatibility_flags: array[0..31] of Tguint8;
    general_progressive_source_flag: Tguint8;
    general_interlaced_source_flag: Tguint8;
    general_non_packed_constraint_flag: Tguint8;
    general_frame_only_constraint_flag: Tguint8;
    general_max_12bit_constraint_flag: Tguint8;
    general_max_10bit_constraint_flag: Tguint8;
    general_max_8bit_constraint_flag: Tguint8;
    general_max_422chroma_constraint_flag: Tguint8;
    general_max_420chroma_constraint_flag: Tguint8;
    general_max_monochrome_constraint_flag: Tguint8;
    general_intra_constraint_flag: Tguint8;
    general_one_picture_only_constraint_flag: Tguint8;
    general_lower_bit_rate_constraint_flag: Tguint8;
    general_max_14bit_constraint_flag: Tguint8;
    general_inbld_flag: Tguint8;
    general_level_idc: Tguint8;
    min_spatial_segmentation_idc: Tguint16;
    parallelism_type: Tguint8;
    chroma_format_idc: Tguint8;
    bit_depth_luma_minus8: Tguint8;
    bit_depth_chroma_minus8: Tguint8;
    avg_frame_rate: Tguint16;
    constant_frame_rate: Tguint8;
    num_temporal_layers: Tguint8;
    temporal_id_nested: Tguint8;
    length_size_minus_one: Tguint8;
    nalu_array: PGArray;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstH265DecoderConfigRecord = ^TGstH265DecoderConfigRecord;
  PPGstH265DecoderConfigRecord = ^PGstH265DecoderConfigRecord;

  TGstH265Parser = record
    vps: array[0..(GST_H265_MAX_VPS_COUNT) - 1] of TGstH265VPS;
    sps: array[0..(GST_H265_MAX_SPS_COUNT) - 1] of TGstH265SPS;
    pps: array[0..(GST_H265_MAX_PPS_COUNT) - 1] of TGstH265PPS;
    last_vps: PGstH265VPS;
    last_sps: PGstH265SPS;
    last_pps: PGstH265PPS;
  end;
  PGstH265Parser = ^TGstH265Parser;

function gst_h265_parser_new: PGstH265Parser; cdecl; external libgstcodecparsers;
function gst_h265_parser_identify_nalu(parser: PGstH265Parser; Data: Pguint8; offset: Tguint; size: Tgsize; nalu: PGstH265NalUnit): TGstH265ParserResult; cdecl; external libgstcodecparsers;
function gst_h265_parser_identify_nalu_unchecked(parser: PGstH265Parser; Data: Pguint8; offset: Tguint; size: Tgsize; nalu: PGstH265NalUnit): TGstH265ParserResult; cdecl; external libgstcodecparsers;
function gst_h265_parser_identify_nalu_hevc(parser: PGstH265Parser; Data: Pguint8; offset: Tguint; size: Tgsize; nal_length_size: Tguint8;
  nalu: PGstH265NalUnit): TGstH265ParserResult; cdecl; external libgstcodecparsers;
function gst_h265_parser_identify_and_split_nalu_hevc(parser: PGstH265Parser; Data: Pguint8; offset: Tguint; size: Tgsize; nal_length_size: Tguint8;
  nalus: PGArray; consumed: Pgsize): TGstH265ParserResult; cdecl; external libgstcodecparsers;
function gst_h265_parser_parse_nal(parser: PGstH265Parser; nalu: PGstH265NalUnit): TGstH265ParserResult; cdecl; external libgstcodecparsers;
function gst_h265_parser_parse_slice_hdr(parser: PGstH265Parser; nalu: PGstH265NalUnit; slice: PGstH265SliceHdr): TGstH265ParserResult; cdecl; external libgstcodecparsers;
function gst_h265_parser_parse_vps(parser: PGstH265Parser; nalu: PGstH265NalUnit; vps: PGstH265VPS): TGstH265ParserResult; cdecl; external libgstcodecparsers;
function gst_h265_parser_parse_sps(parser: PGstH265Parser; nalu: PGstH265NalUnit; sps: PGstH265SPS; parse_vui_params: Tgboolean): TGstH265ParserResult; cdecl; external libgstcodecparsers;
function gst_h265_parser_parse_pps(parser: PGstH265Parser; nalu: PGstH265NalUnit; pps: PGstH265PPS): TGstH265ParserResult; cdecl; external libgstcodecparsers;
function gst_h265_parser_parse_sei(parser: PGstH265Parser; nalu: PGstH265NalUnit; Messages: PPGArray): TGstH265ParserResult; cdecl; external libgstcodecparsers;
function gst_h265_parser_update_vps(parser: PGstH265Parser; vps: PGstH265VPS): TGstH265ParserResult; cdecl; external libgstcodecparsers;
function gst_h265_parser_update_sps(parser: PGstH265Parser; sps: PGstH265SPS): TGstH265ParserResult; cdecl; external libgstcodecparsers;
function gst_h265_parser_update_pps(parser: PGstH265Parser; pps: PGstH265PPS): TGstH265ParserResult; cdecl; external libgstcodecparsers;
procedure gst_h265_parser_free(parser: PGstH265Parser); cdecl; external libgstcodecparsers;
function gst_h265_parse_vps(nalu: PGstH265NalUnit; vps: PGstH265VPS): TGstH265ParserResult; cdecl; external libgstcodecparsers;
function gst_h265_parse_sps(parser: PGstH265Parser; nalu: PGstH265NalUnit; sps: PGstH265SPS; parse_vui_params: Tgboolean): TGstH265ParserResult; cdecl; external libgstcodecparsers;
function gst_h265_parse_pps(parser: PGstH265Parser; nalu: PGstH265NalUnit; pps: PGstH265PPS): TGstH265ParserResult; cdecl; external libgstcodecparsers;
function gst_h265_slice_hdr_copy(dst_slice: PGstH265SliceHdr; src_slice: PGstH265SliceHdr): Tgboolean; cdecl; external libgstcodecparsers;
procedure gst_h265_slice_hdr_free(slice_hdr: PGstH265SliceHdr); cdecl; external libgstcodecparsers;
function gst_h265_sei_copy(dest_sei: PGstH265SEIMessage; src_sei: PGstH265SEIMessage): Tgboolean; cdecl; external libgstcodecparsers;
procedure gst_h265_sei_free(sei: PGstH265SEIMessage); cdecl; external libgstcodecparsers;
procedure gst_h265_quant_matrix_4x4_get_zigzag_from_raster(out_quant: Tguint8arr16; quant: Tguint8arr16); cdecl; external libgstcodecparsers;
procedure gst_h265_quant_matrix_4x4_get_raster_from_zigzag(out_quant: Tguint8arr16; quant: Tguint8arr16); cdecl; external libgstcodecparsers;
procedure gst_h265_quant_matrix_8x8_get_zigzag_from_raster(out_quant: Tguint8arr64; quant: Tguint8arr64); cdecl; external libgstcodecparsers;
procedure gst_h265_quant_matrix_8x8_get_raster_from_zigzag(out_quant: Tguint8arr64; quant: Tguint8arr64); cdecl; external libgstcodecparsers;

procedure gst_h265_quant_matrix_16x16_get_zigzag_from_raster(out_quant: Tguint8arr64; quant: Tguint8arr64); cdecl; external libgstcodecparsers name 'gst_h265_quant_matrix_8x8_get_zigzag_from_raster';
procedure gst_h265_quant_matrix_16x16_get_raster_from_zigzag(out_quant: Tguint8arr64; quant: Tguint8arr64); cdecl; external libgstcodecparsers name 'gst_h265_quant_matrix_8x8_get_raster_from_zigzag';

procedure gst_h265_quant_matrix_32x32_get_zigzag_from_raster(out_quant: Tguint8arr64; quant: Tguint8arr64); cdecl; external libgstcodecparsers name 'gst_h265_quant_matrix_8x8_get_zigzag_from_raster';
procedure gst_h265_quant_matrix_32x32_get_raster_from_zigzag(out_quant: Tguint8arr64; quant: Tguint8arr64); cdecl; external libgstcodecparsers name 'gst_h265_quant_matrix_8x8_get_raster_from_zigzag';

procedure gst_h265_quant_matrix_4x4_get_uprightdiagonal_from_raster(out_quant: Tguint8arr16; quant: Tguint8arr16); cdecl; external libgstcodecparsers;
procedure gst_h265_quant_matrix_4x4_get_raster_from_uprightdiagonal(out_quant: Tguint8arr16; quant: Tguint8arr16); cdecl; external libgstcodecparsers;
procedure gst_h265_quant_matrix_8x8_get_uprightdiagonal_from_raster(out_quant: Tguint8arr64); cdecl; external libgstcodecparsers;
procedure gst_h265_quant_matrix_8x8_get_raster_from_uprightdiagonal(out_quant: Tguint8arr64); cdecl; external libgstcodecparsers;

procedure gst_h265_quant_matrix_16x16_get_uprightdiagonal_from_raster(out_quant: Tguint8arr64); cdecl; external libgstcodecparsers name 'gst_h265_quant_matrix_8x8_get_uprightdiagonal_from_raster';
procedure gst_h265_quant_matrix_16x16_get_raster_from_uprightdiagonal(out_quant: Tguint8arr64); cdecl; external libgstcodecparsers name 'gst_h265_quant_matrix_8x8_get_raster_from_uprightdiagonal';

procedure gst_h265_quant_matrix_32x32_get_uprightdiagonal_from_raster(out_quant: Tguint8arr64); cdecl; external libgstcodecparsers name 'gst_h265_quant_matrix_8x8_get_uprightdiagonal_from_raster';
procedure gst_h265_quant_matrix_32x32_get_raster_from_uprightdiagonal(out_quant: Tguint8arr64); cdecl; external libgstcodecparsers name 'gst_h265_quant_matrix_8x8_get_raster_from_uprightdiagonal';

function gst_h265_profile_tier_level_get_profile(ptl: PGstH265ProfileTierLevel): TGstH265Profile; cdecl; external libgstcodecparsers;
function gst_h265_profile_to_string(profile: TGstH265Profile): Pgchar; cdecl; external libgstcodecparsers;
function gst_h265_profile_from_string(_string: Pgchar): TGstH265Profile; cdecl; external libgstcodecparsers;
function gst_h265_slice_type_to_string(slice_type: TGstH265SliceType): Pgchar; cdecl; external libgstcodecparsers;
function gst_h265_create_sei_memory(layer_id: Tguint8; temporal_id_plus1: Tguint8; start_code_prefix_length: Tguint8; Messages: PGArray): PGstMemory; cdecl; external libgstcodecparsers;
function gst_h265_create_sei_memory_hevc(layer_id: Tguint8; temporal_id_plus1: Tguint8; nal_length_size: Tguint8; Messages: PGArray): PGstMemory; cdecl; external libgstcodecparsers;
function gst_h265_parser_insert_sei(parser: PGstH265Parser; au: PGstBuffer; sei: PGstMemory): PGstBuffer; cdecl; external libgstcodecparsers;
function gst_h265_parser_insert_sei_hevc(parser: PGstH265Parser; nal_length_size: Tguint8; au: PGstBuffer; sei: PGstMemory): PGstBuffer; cdecl; external libgstcodecparsers;
function gst_h265_get_profile_from_sps(sps: PGstH265SPS): TGstH265Profile; cdecl; external libgstcodecparsers;
procedure gst_h265_decoder_config_record_free(config: PGstH265DecoderConfigRecord); cdecl; external libgstcodecparsers;
function gst_h265_parser_parse_decoder_config_record(parser: PGstH265Parser; Data: Pguint8; size: Tgsize; config: PPGstH265DecoderConfigRecord): TGstH265ParserResult; cdecl; external libgstcodecparsers;

function GST_H265_IS_B_SLICE(slice: PGstH265SliceHdr): Tgboolean;
function GST_H265_IS_P_SLICE(slice: PGstH265SliceHdr): Tgboolean;
function GST_H265_IS_I_SLICE(slice: PGstH265SliceHdr): Tgboolean;
function GST_H265_IS_NAL_TYPE_IDR(nal_type: longint): Tgboolean;
function GST_H265_IS_NAL_TYPE_IRAP(nal_type: longint): Tgboolean;
function GST_H265_IS_NAL_TYPE_BLA(nal_type: longint): Tgboolean;
function GST_H265_IS_NAL_TYPE_CRA(nal_type: longint): Tgboolean;
function GST_H265_IS_NAL_TYPE_RADL(nal_type: longint): Tgboolean;
function GST_H265_IS_NAL_TYPE_RASL(nal_type: longint): Tgboolean;

// === Konventiert am: 7-10-24 11:29:55 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function GST_H265_IS_B_SLICE(slice: PGstH265SliceHdr): Tgboolean;
begin
  GST_H265_IS_B_SLICE := (slice^._type) = GST_H265_B_SLICE;
end;

function GST_H265_IS_P_SLICE(slice: PGstH265SliceHdr): Tgboolean;
begin
  GST_H265_IS_P_SLICE := (slice^._type) = GST_H265_P_SLICE;
end;

function GST_H265_IS_I_SLICE(slice: PGstH265SliceHdr): Tgboolean;
begin
  GST_H265_IS_I_SLICE := (slice^._type) = GST_H265_I_SLICE;
end;

function GST_H265_IS_NAL_TYPE_IDR(nal_type: longint): Tgboolean;
begin
  GST_H265_IS_NAL_TYPE_IDR := (nal_type = GST_H265_NAL_SLICE_IDR_W_RADL) or (nal_type = GST_H265_NAL_SLICE_IDR_N_LP);
end;

function GST_H265_IS_NAL_TYPE_IRAP(nal_type: longint): Tgboolean;
begin
  GST_H265_IS_NAL_TYPE_IRAP := (nal_type >= GST_H265_NAL_SLICE_BLA_W_LP) and (nal_type <= RESERVED_IRAP_NAL_TYPE_MAX);
end;

function GST_H265_IS_NAL_TYPE_BLA(nal_type: longint): Tgboolean;
begin
  GST_H265_IS_NAL_TYPE_BLA := (nal_type >= GST_H265_NAL_SLICE_BLA_W_LP) and (nal_type <= GST_H265_NAL_SLICE_BLA_N_LP);
end;

function GST_H265_IS_NAL_TYPE_CRA(nal_type: longint): Tgboolean;
begin
  GST_H265_IS_NAL_TYPE_CRA := nal_type = GST_H265_NAL_SLICE_CRA_NUT;
end;

function GST_H265_IS_NAL_TYPE_RADL(nal_type: longint): Tgboolean;
begin
  GST_H265_IS_NAL_TYPE_RADL := (nal_type = GST_H265_NAL_SLICE_RADL_N) or (nal_type = GST_H265_NAL_SLICE_RADL_R);
end;

function GST_H265_IS_NAL_TYPE_RASL(nal_type: longint): Tgboolean;
begin
  GST_H265_IS_NAL_TYPE_RASL := (nal_type = GST_H265_NAL_SLICE_RASL_N) or (nal_type = GST_H265_NAL_SLICE_RASL_R);
end;


{$ENDIF read_implementation}
