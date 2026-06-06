unit vulkan_video_codec_h265std;

interface

uses
  fp_vulkan;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  VULKAN_VIDEO_CODEC_H265STD_H_ = 1;

const
  STD_VIDEO_H265_CPB_CNT_LIST_SIZE = 32;
  STD_VIDEO_H265_SUBLAYERS_LIST_SIZE = 7;
  STD_VIDEO_H265_SCALING_LIST_4X4_NUM_LISTS = 6;
  STD_VIDEO_H265_SCALING_LIST_4X4_NUM_ELEMENTS = 16;
  STD_VIDEO_H265_SCALING_LIST_8X8_NUM_LISTS = 6;
  STD_VIDEO_H265_SCALING_LIST_8X8_NUM_ELEMENTS = 64;
  STD_VIDEO_H265_SCALING_LIST_16X16_NUM_LISTS = 6;
  STD_VIDEO_H265_SCALING_LIST_16X16_NUM_ELEMENTS = 64;
  STD_VIDEO_H265_SCALING_LIST_32X32_NUM_LISTS = 2;
  STD_VIDEO_H265_SCALING_LIST_32X32_NUM_ELEMENTS = 64;
  STD_VIDEO_H265_CHROMA_QP_OFFSET_LIST_SIZE = 6;
  STD_VIDEO_H265_CHROMA_QP_OFFSET_TILE_COLS_LIST_SIZE = 19;
  STD_VIDEO_H265_CHROMA_QP_OFFSET_TILE_ROWS_LIST_SIZE = 21;
  STD_VIDEO_H265_PREDICTOR_PALETTE_COMPONENTS_LIST_SIZE = 3;
  STD_VIDEO_H265_PREDICTOR_PALETTE_COMP_ENTRIES_LIST_SIZE = 128;
  STD_VIDEO_H265_MAX_NUM_LIST_REF = 15;
  STD_VIDEO_H265_MAX_CHROMA_PLANES = 2;
  STD_VIDEO_H265_MAX_SHORT_TERM_REF_PIC_SETS = 64;
  STD_VIDEO_H265_MAX_DPB_SIZE = 16;
  STD_VIDEO_H265_MAX_LONG_TERM_REF_PICS_SPS = 32;
  STD_VIDEO_H265_MAX_LONG_TERM_PICS = 16;
  STD_VIDEO_H265_MAX_DELTA_POC = 48;
  STD_VIDEO_H265_NO_REFERENCE_PICTURE = $FF;

type
  PStdVideoH265ChromaFormatIdc = ^TStdVideoH265ChromaFormatIdc;
  TStdVideoH265ChromaFormatIdc = longint;

const
  STD_VIDEO_H265_CHROMA_FORMAT_IDC_MONOCHROME = 0;
  STD_VIDEO_H265_CHROMA_FORMAT_IDC_420 = 1;
  STD_VIDEO_H265_CHROMA_FORMAT_IDC_422 = 2;
  STD_VIDEO_H265_CHROMA_FORMAT_IDC_444 = 3;
  STD_VIDEO_H265_CHROMA_FORMAT_IDC_INVALID = $7FFFFFFF;
  STD_VIDEO_H265_CHROMA_FORMAT_IDC_MAX_ENUM = $7FFFFFFF;

type
  PStdVideoH265ProfileIdc = ^TStdVideoH265ProfileIdc;
  TStdVideoH265ProfileIdc = longint;

const
  STD_VIDEO_H265_PROFILE_IDC_MAIN = 1;
  STD_VIDEO_H265_PROFILE_IDC_MAIN_10 = 2;
  STD_VIDEO_H265_PROFILE_IDC_MAIN_STILL_PICTURE = 3;
  STD_VIDEO_H265_PROFILE_IDC_FORMAT_RANGE_EXTENSIONS = 4;
  STD_VIDEO_H265_PROFILE_IDC_SCC_EXTENSIONS = 9;
  STD_VIDEO_H265_PROFILE_IDC_INVALID = $7FFFFFFF;
  STD_VIDEO_H265_PROFILE_IDC_MAX_ENUM = $7FFFFFFF;

type
  PStdVideoH265LevelIdc = ^TStdVideoH265LevelIdc;
  TStdVideoH265LevelIdc = longint;

const
  STD_VIDEO_H265_LEVEL_IDC_1_0 = 0;
  STD_VIDEO_H265_LEVEL_IDC_2_0 = 1;
  STD_VIDEO_H265_LEVEL_IDC_2_1 = 2;
  STD_VIDEO_H265_LEVEL_IDC_3_0 = 3;
  STD_VIDEO_H265_LEVEL_IDC_3_1 = 4;
  STD_VIDEO_H265_LEVEL_IDC_4_0 = 5;
  STD_VIDEO_H265_LEVEL_IDC_4_1 = 6;
  STD_VIDEO_H265_LEVEL_IDC_5_0 = 7;
  STD_VIDEO_H265_LEVEL_IDC_5_1 = 8;
  STD_VIDEO_H265_LEVEL_IDC_5_2 = 9;
  STD_VIDEO_H265_LEVEL_IDC_6_0 = 10;
  STD_VIDEO_H265_LEVEL_IDC_6_1 = 11;
  STD_VIDEO_H265_LEVEL_IDC_6_2 = 12;
  STD_VIDEO_H265_LEVEL_IDC_INVALID = $7FFFFFFF;
  STD_VIDEO_H265_LEVEL_IDC_MAX_ENUM = $7FFFFFFF;

type
  PStdVideoH265SliceType = ^TStdVideoH265SliceType;
  TStdVideoH265SliceType = longint;

const
  STD_VIDEO_H265_SLICE_TYPE_B = 0;
  STD_VIDEO_H265_SLICE_TYPE_P = 1;
  STD_VIDEO_H265_SLICE_TYPE_I = 2;
  STD_VIDEO_H265_SLICE_TYPE_INVALID = $7FFFFFFF;
  STD_VIDEO_H265_SLICE_TYPE_MAX_ENUM = $7FFFFFFF;

type
  PStdVideoH265PictureType = ^TStdVideoH265PictureType;
  TStdVideoH265PictureType = longint;

const
  STD_VIDEO_H265_PICTURE_TYPE_P = 0;
  STD_VIDEO_H265_PICTURE_TYPE_B = 1;
  STD_VIDEO_H265_PICTURE_TYPE_I = 2;
  STD_VIDEO_H265_PICTURE_TYPE_IDR = 3;
  STD_VIDEO_H265_PICTURE_TYPE_INVALID = $7FFFFFFF;
  STD_VIDEO_H265_PICTURE_TYPE_MAX_ENUM = $7FFFFFFF;

type
  PStdVideoH265AspectRatioIdc = ^TStdVideoH265AspectRatioIdc;
  TStdVideoH265AspectRatioIdc = longint;

const
  STD_VIDEO_H265_ASPECT_RATIO_IDC_UNSPECIFIED = 0;
  STD_VIDEO_H265_ASPECT_RATIO_IDC_SQUARE = 1;
  STD_VIDEO_H265_ASPECT_RATIO_IDC_12_11 = 2;
  STD_VIDEO_H265_ASPECT_RATIO_IDC_10_11 = 3;
  STD_VIDEO_H265_ASPECT_RATIO_IDC_16_11 = 4;
  STD_VIDEO_H265_ASPECT_RATIO_IDC_40_33 = 5;
  STD_VIDEO_H265_ASPECT_RATIO_IDC_24_11 = 6;
  STD_VIDEO_H265_ASPECT_RATIO_IDC_20_11 = 7;
  STD_VIDEO_H265_ASPECT_RATIO_IDC_32_11 = 8;
  STD_VIDEO_H265_ASPECT_RATIO_IDC_80_33 = 9;
  STD_VIDEO_H265_ASPECT_RATIO_IDC_18_11 = 10;
  STD_VIDEO_H265_ASPECT_RATIO_IDC_15_11 = 11;
  STD_VIDEO_H265_ASPECT_RATIO_IDC_64_33 = 12;
  STD_VIDEO_H265_ASPECT_RATIO_IDC_160_99 = 13;
  STD_VIDEO_H265_ASPECT_RATIO_IDC_4_3 = 14;
  STD_VIDEO_H265_ASPECT_RATIO_IDC_3_2 = 15;
  STD_VIDEO_H265_ASPECT_RATIO_IDC_2_1 = 16;
  STD_VIDEO_H265_ASPECT_RATIO_IDC_EXTENDED_SAR = 255;
  STD_VIDEO_H265_ASPECT_RATIO_IDC_INVALID = $7FFFFFFF;
  STD_VIDEO_H265_ASPECT_RATIO_IDC_MAX_ENUM = $7FFFFFFF;

type
  TStdVideoH265DecPicBufMgr = record
    max_latency_increase_plus1: array[0..(STD_VIDEO_H265_SUBLAYERS_LIST_SIZE) - 1] of Tuint32_t;
    max_dec_pic_buffering_minus1: array[0..(STD_VIDEO_H265_SUBLAYERS_LIST_SIZE) - 1] of Tuint8_t;
    max_num_reorder_pics: array[0..(STD_VIDEO_H265_SUBLAYERS_LIST_SIZE) - 1] of Tuint8_t;
  end;
  PStdVideoH265DecPicBufMgr = ^TStdVideoH265DecPicBufMgr;

  TStdVideoH265SubLayerHrdParameters = record
    bit_rate_value_minus1: array[0..(STD_VIDEO_H265_CPB_CNT_LIST_SIZE) - 1] of Tuint32_t;
    cpb_size_value_minus1: array[0..(STD_VIDEO_H265_CPB_CNT_LIST_SIZE) - 1] of Tuint32_t;
    cpb_size_du_value_minus1: array[0..(STD_VIDEO_H265_CPB_CNT_LIST_SIZE) - 1] of Tuint32_t;
    bit_rate_du_value_minus1: array[0..(STD_VIDEO_H265_CPB_CNT_LIST_SIZE) - 1] of Tuint32_t;
    cbr_flag: Tuint32_t;
  end;
  PStdVideoH265SubLayerHrdParameters = ^TStdVideoH265SubLayerHrdParameters;

type
  TStdVideoH265HrdFlags = bitpacked record
    nal_hrd_parameters_present_flag: 0..1;
    vcl_hrd_parameters_present_flag: 0..1;
    sub_pic_hrd_params_present_flag: 0..1;
    sub_pic_cpb_params_in_pic_timing_sei_flag: 0..1;
    fixed_pic_rate_general_flag: 0..$FF;
    fixed_pic_rate_within_cvs_flag: 0..$FF;
    low_delay_hrd_flag: 0..$FF;
    reserved: 0..$F;
  end;
  PStdVideoH265HrdFlags = ^TStdVideoH265HrdFlags;

type
  TStdVideoH265HrdParameters = record
    flags: TStdVideoH265HrdFlags;
    tick_divisor_minus2: Tuint8_t;
    du_cpb_removal_delay_increment_length_minus1: Tuint8_t;
    dpb_output_delay_du_length_minus1: Tuint8_t;
    bit_rate_scale: Tuint8_t;
    cpb_size_scale: Tuint8_t;
    cpb_size_du_scale: Tuint8_t;
    initial_cpb_removal_delay_length_minus1: Tuint8_t;
    au_cpb_removal_delay_length_minus1: Tuint8_t;
    dpb_output_delay_length_minus1: Tuint8_t;
    cpb_cnt_minus1: array[0..(STD_VIDEO_H265_SUBLAYERS_LIST_SIZE) - 1] of Tuint8_t;
    elemental_duration_in_tc_minus1: array[0..(STD_VIDEO_H265_SUBLAYERS_LIST_SIZE) - 1] of Tuint16_t;
    reserved: array[0..2] of Tuint16_t;
    pSubLayerHrdParametersNal: PStdVideoH265SubLayerHrdParameters;
    pSubLayerHrdParametersVcl: PStdVideoH265SubLayerHrdParameters;
  end;
  PStdVideoH265HrdParameters = ^TStdVideoH265HrdParameters;

type
  TStdVideoH265VpsFlags = bitpacked record
    vps_temporal_id_nesting_flag: 0..1;
    vps_sub_layer_ordering_info_present_flag: 0..1;
    vps_timing_info_present_flag: 0..1;
    vps_poc_proportional_to_timing_flag: 0..1;
    reserved: 0..$7FFFFFF;
  end;
  PStdVideoH265VpsFlags = ^TStdVideoH265VpsFlags;

type
  TStdVideoH265ProfileTierLevelFlags = bitpacked record
    general_tier_flag: 0..1;
    general_progressive_source_flag: 0..1;
    general_interlaced_source_flag: 0..1;
    general_non_packed_constraint_flag: 0..1;
    general_frame_only_constraint_flag: 0..1;
    reserved: 0..$7FFFFFF;
  end;
  PStdVideoH265ProfileTierLevelFlags = ^TStdVideoH265ProfileTierLevelFlags;

type
  TStdVideoH265ProfileTierLevel = record
    flags: TStdVideoH265ProfileTierLevelFlags;
    general_profile_idc: TStdVideoH265ProfileIdc;
    general_level_idc: TStdVideoH265LevelIdc;
  end;
  PStdVideoH265ProfileTierLevel = ^TStdVideoH265ProfileTierLevel;

  TStdVideoH265VideoParameterSet = record
    flags: TStdVideoH265VpsFlags;
    vps_video_parameter_set_id: Tuint8_t;
    vps_max_sub_layers_minus1: Tuint8_t;
    reserved1: Tuint8_t;
    reserved2: Tuint8_t;
    vps_num_units_in_tick: Tuint32_t;
    vps_time_scale: Tuint32_t;
    vps_num_ticks_poc_diff_one_minus1: Tuint32_t;
    reserved3: Tuint32_t;
    pDecPicBufMgr: PStdVideoH265DecPicBufMgr;
    pHrdParameters: PStdVideoH265HrdParameters;
    pProfileTierLevel: PStdVideoH265ProfileTierLevel;
  end;
  PStdVideoH265VideoParameterSet = ^TStdVideoH265VideoParameterSet;

  TStdVideoH265ScalingLists = record
    ScalingList4x4: array[0..(STD_VIDEO_H265_SCALING_LIST_4X4_NUM_LISTS) - 1] of array[0..(STD_VIDEO_H265_SCALING_LIST_4X4_NUM_ELEMENTS) - 1] of Tuint8_t;
    ScalingList8x8: array[0..(STD_VIDEO_H265_SCALING_LIST_8X8_NUM_LISTS) - 1] of array[0..(STD_VIDEO_H265_SCALING_LIST_8X8_NUM_ELEMENTS) - 1] of Tuint8_t;
    ScalingList16x16: array[0..(STD_VIDEO_H265_SCALING_LIST_16X16_NUM_LISTS) - 1] of array[0..(STD_VIDEO_H265_SCALING_LIST_16X16_NUM_ELEMENTS) - 1] of Tuint8_t;
    ScalingList32x32: array[0..(STD_VIDEO_H265_SCALING_LIST_32X32_NUM_LISTS) - 1] of array[0..(STD_VIDEO_H265_SCALING_LIST_32X32_NUM_ELEMENTS) - 1] of Tuint8_t;
    ScalingListDCCoef16x16: array[0..(STD_VIDEO_H265_SCALING_LIST_16X16_NUM_LISTS) - 1] of Tuint8_t;
    ScalingListDCCoef32x32: array[0..(STD_VIDEO_H265_SCALING_LIST_32X32_NUM_LISTS) - 1] of Tuint8_t;
  end;
  PStdVideoH265ScalingLists = ^TStdVideoH265ScalingLists;

type
  TStdVideoH265SpsVuiFlags = bitpacked record
    aspect_ratio_info_present_flag: 0..1;
    overscan_info_present_flag: 0..1;
    overscan_appropriate_flag: 0..1;
    video_signal_type_present_flag: 0..1;
    video_full_range_flag: 0..1;
    colour_description_present_flag: 0..1;
    chroma_loc_info_present_flag: 0..1;
    neutral_chroma_indication_flag: 0..1;
    field_seq_flag: 0..1;
    frame_field_info_present_flag: 0..1;
    default_display_window_flag: 0..1;
    vui_timing_info_present_flag: 0..1;
    vui_poc_proportional_to_timing_flag: 0..1;
    vui_hrd_parameters_present_flag: 0..1;
    bitstream_restriction_flag: 0..1;
    tiles_fixed_structure_flag: 0..1;
    motion_vectors_over_pic_boundaries_flag: 0..1;
    restricted_ref_pic_lists_flag: 0..1;
    reserved: 0..$3FFF;
  end;
  PStdVideoH265SpsVuiFlags = ^TStdVideoH265SpsVuiFlags;

type
  TStdVideoH265SequenceParameterSetVui = record
    flags: TStdVideoH265SpsVuiFlags;
    aspect_ratio_idc: TStdVideoH265AspectRatioIdc;
    sar_width: Tuint16_t;
    sar_height: Tuint16_t;
    video_format: Tuint8_t;
    colour_primaries: Tuint8_t;
    transfer_characteristics: Tuint8_t;
    matrix_coeffs: Tuint8_t;
    chroma_sample_loc_type_top_field: Tuint8_t;
    chroma_sample_loc_type_bottom_field: Tuint8_t;
    reserved1: Tuint8_t;
    reserved2: Tuint8_t;
    def_disp_win_left_offset: Tuint16_t;
    def_disp_win_right_offset: Tuint16_t;
    def_disp_win_top_offset: Tuint16_t;
    def_disp_win_bottom_offset: Tuint16_t;
    vui_num_units_in_tick: Tuint32_t;
    vui_time_scale: Tuint32_t;
    vui_num_ticks_poc_diff_one_minus1: Tuint32_t;
    min_spatial_segmentation_idc: Tuint16_t;
    reserved3: Tuint16_t;
    max_bytes_per_pic_denom: Tuint8_t;
    max_bits_per_min_cu_denom: Tuint8_t;
    log2_max_mv_length_horizontal: Tuint8_t;
    log2_max_mv_length_vertical: Tuint8_t;
    pHrdParameters: PStdVideoH265HrdParameters;
  end;
  PStdVideoH265SequenceParameterSetVui = ^TStdVideoH265SequenceParameterSetVui;

  TStdVideoH265PredictorPaletteEntries = record
    PredictorPaletteEntries: array[0..(STD_VIDEO_H265_PREDICTOR_PALETTE_COMPONENTS_LIST_SIZE) - 1] of array[0..(STD_VIDEO_H265_PREDICTOR_PALETTE_COMP_ENTRIES_LIST_SIZE) - 1] of Tuint16_t;
  end;
  PStdVideoH265PredictorPaletteEntries = ^TStdVideoH265PredictorPaletteEntries;

type
  TStdVideoH265SpsFlags = bitpacked record
    sps_temporal_id_nesting_flag: 0..1;
    separate_colour_plane_flag: 0..1;
    conformance_window_flag: 0..1;
    sps_sub_layer_ordering_info_present_flag: 0..1;
    scaling_list_enabled_flag: 0..1;
    sps_scaling_list_data_present_flag: 0..1;
    amp_enabled_flag: 0..1;
    sample_adaptive_offset_enabled_flag: 0..1;
    pcm_enabled_flag: 0..1;
    pcm_loop_filter_disabled_flag: 0..1;
    long_term_ref_pics_present_flag: 0..1;
    sps_temporal_mvp_enabled_flag: 0..1;
    strong_intra_smoothing_enabled_flag: 0..1;
    vui_parameters_present_flag: 0..1;
    sps_extension_present_flag: 0..1;
    sps_range_extension_flag: 0..1;
    transform_skip_rotation_enabled_flag: 0..1;
    transform_skip_context_enabled_flag: 0..1;
    implicit_rdpcm_enabled_flag: 0..1;
    explicit_rdpcm_enabled_flag: 0..1;
    extended_precision_processing_flag: 0..1;
    intra_smoothing_disabled_flag: 0..1;
    high_precision_offsets_enabled_flag: 0..1;
    persistent_rice_adaptation_enabled_flag: 0..1;
    cabac_bypass_alignment_enabled_flag: 0..1;
    sps_scc_extension_flag: 0..1;
    sps_curr_pic_ref_enabled_flag: 0..1;
    palette_mode_enabled_flag: 0..1;
    sps_palette_predictor_initializers_present_flag: 0..1;
    intra_boundary_filtering_disabled_flag: 0..1;
    reserved: 0..3;
  end;
  PStdVideoH265SpsFlags = ^TStdVideoH265SpsFlags;

type
  TStdVideoH265ShortTermRefPicSetFlags = bitpacked record
    inter_ref_pic_set_prediction_flag: 0..1;
    delta_rps_sign: 0..1;
  end;
  PStdVideoH265ShortTermRefPicSetFlags = ^TStdVideoH265ShortTermRefPicSetFlags;

type
  TStdVideoH265ShortTermRefPicSet = record
    flags: TStdVideoH265ShortTermRefPicSetFlags;
    delta_idx_minus1: Tuint32_t;
    use_delta_flag: Tuint16_t;
    abs_delta_rps_minus1: Tuint16_t;
    used_by_curr_pic_flag: Tuint16_t;
    used_by_curr_pic_s0_flag: Tuint16_t;
    used_by_curr_pic_s1_flag: Tuint16_t;
    reserved1: Tuint16_t;
    reserved2: Tuint8_t;
    reserved3: Tuint8_t;
    num_negative_pics: Tuint8_t;
    num_positive_pics: Tuint8_t;
    delta_poc_s0_minus1: array[0..(STD_VIDEO_H265_MAX_DPB_SIZE) - 1] of Tuint16_t;
    delta_poc_s1_minus1: array[0..(STD_VIDEO_H265_MAX_DPB_SIZE) - 1] of Tuint16_t;
  end;
  PStdVideoH265ShortTermRefPicSet = ^TStdVideoH265ShortTermRefPicSet;

  TStdVideoH265LongTermRefPicsSps = record
    used_by_curr_pic_lt_sps_flag: Tuint32_t;
    lt_ref_pic_poc_lsb_sps: array[0..(STD_VIDEO_H265_MAX_LONG_TERM_REF_PICS_SPS) - 1] of Tuint32_t;
  end;
  PStdVideoH265LongTermRefPicsSps = ^TStdVideoH265LongTermRefPicsSps;

  TStdVideoH265SequenceParameterSet = record
    flags: TStdVideoH265SpsFlags;
    chroma_format_idc: TStdVideoH265ChromaFormatIdc;
    pic_width_in_luma_samples: Tuint32_t;
    pic_height_in_luma_samples: Tuint32_t;
    sps_video_parameter_set_id: Tuint8_t;
    sps_max_sub_layers_minus1: Tuint8_t;
    sps_seq_parameter_set_id: Tuint8_t;
    bit_depth_luma_minus8: Tuint8_t;
    bit_depth_chroma_minus8: Tuint8_t;
    log2_max_pic_order_cnt_lsb_minus4: Tuint8_t;
    log2_min_luma_coding_block_size_minus3: Tuint8_t;
    log2_diff_max_min_luma_coding_block_size: Tuint8_t;
    log2_min_luma_transform_block_size_minus2: Tuint8_t;
    log2_diff_max_min_luma_transform_block_size: Tuint8_t;
    max_transform_hierarchy_depth_inter: Tuint8_t;
    max_transform_hierarchy_depth_intra: Tuint8_t;
    num_short_term_ref_pic_sets: Tuint8_t;
    num_long_term_ref_pics_sps: Tuint8_t;
    pcm_sample_bit_depth_luma_minus1: Tuint8_t;
    pcm_sample_bit_depth_chroma_minus1: Tuint8_t;
    log2_min_pcm_luma_coding_block_size_minus3: Tuint8_t;
    log2_diff_max_min_pcm_luma_coding_block_size: Tuint8_t;
    reserved1: Tuint8_t;
    reserved2: Tuint8_t;
    palette_max_size: Tuint8_t;
    delta_palette_max_predictor_size: Tuint8_t;
    motion_vector_resolution_control_idc: Tuint8_t;
    sps_num_palette_predictor_initializers_minus1: Tuint8_t;
    conf_win_left_offset: Tuint32_t;
    conf_win_right_offset: Tuint32_t;
    conf_win_top_offset: Tuint32_t;
    conf_win_bottom_offset: Tuint32_t;
    pProfileTierLevel: PStdVideoH265ProfileTierLevel;
    pDecPicBufMgr: PStdVideoH265DecPicBufMgr;
    pScalingLists: PStdVideoH265ScalingLists;
    pShortTermRefPicSet: PStdVideoH265ShortTermRefPicSet;
    pLongTermRefPicsSps: PStdVideoH265LongTermRefPicsSps;
    pSequenceParameterSetVui: PStdVideoH265SequenceParameterSetVui;
    pPredictorPaletteEntries: PStdVideoH265PredictorPaletteEntries;
  end;
  PStdVideoH265SequenceParameterSet = ^TStdVideoH265SequenceParameterSet;

type
  TStdVideoH265PpsFlags = bitpacked record
    dependent_slice_segments_enabled_flag: 0..1;
    output_flag_present_flag: 0..1;
    sign_data_hiding_enabled_flag: 0..1;
    cabac_init_present_flag: 0..1;
    constrained_intra_pred_flag: 0..1;
    transform_skip_enabled_flag: 0..1;
    cu_qp_delta_enabled_flag: 0..1;
    pps_slice_chroma_qp_offsets_present_flag: 0..1;
    weighted_pred_flag: 0..1;
    weighted_bipred_flag: 0..1;
    transquant_bypass_enabled_flag: 0..1;
    tiles_enabled_flag: 0..1;
    entropy_coding_sync_enabled_flag: 0..1;
    uniform_spacing_flag: 0..1;
    loop_filter_across_tiles_enabled_flag: 0..1;
    pps_loop_filter_across_slices_enabled_flag: 0..1;
    deblocking_filter_control_present_flag: 0..1;
    deblocking_filter_override_enabled_flag: 0..1;
    pps_deblocking_filter_disabled_flag: 0..1;
    pps_scaling_list_data_present_flag: 0..1;
    lists_modification_present_flag: 0..1;
    slice_segment_header_extension_present_flag: 0..1;
    pps_extension_present_flag: 0..1;
    cross_component_prediction_enabled_flag: 0..1;
    chroma_qp_offset_list_enabled_flag: 0..1;
    pps_curr_pic_ref_enabled_flag: 0..1;
    residual_adaptive_colour_transform_enabled_flag: 0..1;
    pps_slice_act_qp_offsets_present_flag: 0..1;
    pps_palette_predictor_initializers_present_flag: 0..1;
    monochrome_palette_flag: 0..1;
    pps_range_extension_flag: 0..1;
    reserved: 0..1;
  end;
  PStdVideoH265PpsFlags = ^TStdVideoH265PpsFlags;

type
  TStdVideoH265PictureParameterSet = record
    flags: TStdVideoH265PpsFlags;
    pps_pic_parameter_set_id: Tuint8_t;
    pps_seq_parameter_set_id: Tuint8_t;
    sps_video_parameter_set_id: Tuint8_t;
    num_extra_slice_header_bits: Tuint8_t;
    num_ref_idx_l0_default_active_minus1: Tuint8_t;
    num_ref_idx_l1_default_active_minus1: Tuint8_t;
    init_qp_minus26: Tint8_t;
    diff_cu_qp_delta_depth: Tuint8_t;
    pps_cb_qp_offset: Tint8_t;
    pps_cr_qp_offset: Tint8_t;
    pps_beta_offset_div2: Tint8_t;
    pps_tc_offset_div2: Tint8_t;
    log2_parallel_merge_level_minus2: Tuint8_t;
    log2_max_transform_skip_block_size_minus2: Tuint8_t;
    diff_cu_chroma_qp_offset_depth: Tuint8_t;
    chroma_qp_offset_list_len_minus1: Tuint8_t;
    cb_qp_offset_list: array[0..(STD_VIDEO_H265_CHROMA_QP_OFFSET_LIST_SIZE) - 1] of Tint8_t;
    cr_qp_offset_list: array[0..(STD_VIDEO_H265_CHROMA_QP_OFFSET_LIST_SIZE) - 1] of Tint8_t;
    log2_sao_offset_scale_luma: Tuint8_t;
    log2_sao_offset_scale_chroma: Tuint8_t;
    pps_act_y_qp_offset_plus5: Tint8_t;
    pps_act_cb_qp_offset_plus5: Tint8_t;
    pps_act_cr_qp_offset_plus3: Tint8_t;
    pps_num_palette_predictor_initializers: Tuint8_t;
    luma_bit_depth_entry_minus8: Tuint8_t;
    chroma_bit_depth_entry_minus8: Tuint8_t;
    num_tile_columns_minus1: Tuint8_t;
    num_tile_rows_minus1: Tuint8_t;
    reserved1: Tuint8_t;
    reserved2: Tuint8_t;
    column_width_minus1: array[0..(STD_VIDEO_H265_CHROMA_QP_OFFSET_TILE_COLS_LIST_SIZE) - 1] of Tuint16_t;
    row_height_minus1: array[0..(STD_VIDEO_H265_CHROMA_QP_OFFSET_TILE_ROWS_LIST_SIZE) - 1] of Tuint16_t;
    reserved3: Tuint32_t;
    pScalingLists: PStdVideoH265ScalingLists;
    pPredictorPaletteEntries: PStdVideoH265PredictorPaletteEntries;
  end;
  PStdVideoH265PictureParameterSet = ^TStdVideoH265PictureParameterSet;

  // === Konventiert am: 6-6-26 19:13:49 ===


implementation



end.
