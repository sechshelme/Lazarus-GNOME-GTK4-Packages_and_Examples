
{$IFDEF read_interface}

  {#warning "The H.264 parsing library is unstable API and may change in future." }
  {#warning "You can define GST_USE_UNSTABLE_API to avoid this warning." }
const
  GST_H264_MAX_SPS_COUNT = 32;
  GST_H264_MAX_PPS_COUNT = 256;
  GST_H264_MAX_VIEW_COUNT = 1024;
  GST_H264_MAX_VIEW_ID = GST_H264_MAX_VIEW_COUNT - 1;

type
  PGstH264Profile = ^TGstH264Profile;
  TGstH264Profile = longint;

const
  GST_H264_PROFILE_BASELINE = 66;
  GST_H264_PROFILE_MAIN = 77;
  GST_H264_PROFILE_EXTENDED = 88;
  GST_H264_PROFILE_HIGH = 100;
  GST_H264_PROFILE_HIGH10 = 110;
  GST_H264_PROFILE_HIGH_422 = 122;
  GST_H264_PROFILE_HIGH_444 = 244;
  GST_H264_PROFILE_MULTIVIEW_HIGH = 118;
  GST_H264_PROFILE_STEREO_HIGH = 128;
  GST_H264_PROFILE_SCALABLE_BASELINE = 83;
  GST_H264_PROFILE_SCALABLE_HIGH = 86;
  GST_H264_PROFILE_INVALID = -(1);

type
  PGstH264NalUnitType = ^TGstH264NalUnitType;
  TGstH264NalUnitType = longint;

const
  GST_H264_NAL_UNKNOWN = 0;
  GST_H264_NAL_SLICE = 1;
  GST_H264_NAL_SLICE_DPA = 2;
  GST_H264_NAL_SLICE_DPB = 3;
  GST_H264_NAL_SLICE_DPC = 4;
  GST_H264_NAL_SLICE_IDR = 5;
  GST_H264_NAL_SEI = 6;
  GST_H264_NAL_SPS = 7;
  GST_H264_NAL_PPS = 8;
  GST_H264_NAL_AU_DELIMITER = 9;
  GST_H264_NAL_SEQ_END = 10;
  GST_H264_NAL_STREAM_END = 11;
  GST_H264_NAL_FILLER_DATA = 12;
  GST_H264_NAL_SPS_EXT = 13;
  GST_H264_NAL_PREFIX_UNIT = 14;
  GST_H264_NAL_SUBSET_SPS = 15;
  GST_H264_NAL_DEPTH_SPS = 16;
  GST_H264_NAL_RSV_1 = 17;
  GST_H264_NAL_RSV_2 = 18;
  GST_H264_NAL_SLICE_AUX = 19;
  GST_H264_NAL_SLICE_EXT = 20;
  GST_H264_NAL_SLICE_DEPTH = 21;

type
  PGstH264NalUnitExtensionType = ^TGstH264NalUnitExtensionType;
  TGstH264NalUnitExtensionType = longint;

const
  GST_H264_NAL_EXTENSION_NONE = 0;
  GST_H264_NAL_EXTENSION_SVC = 1;
  GST_H264_NAL_EXTENSION_MVC = 2;

type
  PGstH264ParserResult = ^TGstH264ParserResult;
  TGstH264ParserResult = longint;

const
  GST_H264_PARSER_OK = 0;
  GST_H264_PARSER_BROKEN_DATA = 1;
  GST_H264_PARSER_BROKEN_LINK = 2;
  GST_H264_PARSER_ERROR = 3;
  GST_H264_PARSER_NO_NAL = 4;
  GST_H264_PARSER_NO_NAL_END = 5;

type
  PGstH264FramePackingType = ^TGstH264FramePackingType;
  TGstH264FramePackingType = longint;

const
  GST_H264_FRAME_PACKING_NONE = 6;
  GST_H264_FRAME_PACKING_CHECKERBOARD_INTERLEAVING = 0;
  GST_H264_FRAME_PACKING_COLUMN_INTERLEAVING = 1;
  GST_H264_FRAME_PACKING_ROW_INTERLEAVING = 2;
  GST_H264_FRAME_PACKING_SIDE_BY_SIDE = 3;
  GST_H264_FRMAE_PACKING_TOP_BOTTOM = 4;
  GST_H264_FRAME_PACKING_TOP_BOTTOM = 4;
  GST_H264_FRAME_PACKING_TEMPORAL_INTERLEAVING = 5;

type
  PGstH264SEIPayloadType = ^TGstH264SEIPayloadType;
  TGstH264SEIPayloadType = longint;

const
  GST_H264_SEI_BUF_PERIOD = 0;
  GST_H264_SEI_PIC_TIMING = 1;
  GST_H264_SEI_REGISTERED_USER_DATA = 4;
  GST_H264_SEI_USER_DATA_UNREGISTERED = 5;
  GST_H264_SEI_RECOVERY_POINT = 6;
  GST_H264_SEI_STEREO_VIDEO_INFO = 21;
  GST_H264_SEI_FRAME_PACKING = 45;
  GST_H264_SEI_MASTERING_DISPLAY_COLOUR_VOLUME = 137;
  GST_H264_SEI_CONTENT_LIGHT_LEVEL = 144;
  GST_H264_SEI_UNHANDLED_PAYLOAD = -(1);

type
  PGstH264SEIPicStructType = ^TGstH264SEIPicStructType;
  TGstH264SEIPicStructType = longint;

const
  GST_H264_SEI_PIC_STRUCT_FRAME = 0;
  GST_H264_SEI_PIC_STRUCT_TOP_FIELD = 1;
  GST_H264_SEI_PIC_STRUCT_BOTTOM_FIELD = 2;
  GST_H264_SEI_PIC_STRUCT_TOP_BOTTOM = 3;
  GST_H264_SEI_PIC_STRUCT_BOTTOM_TOP = 4;
  GST_H264_SEI_PIC_STRUCT_TOP_BOTTOM_TOP = 5;
  GST_H264_SEI_PIC_STRUCT_BOTTOM_TOP_BOTTOM = 6;
  GST_H264_SEI_PIC_STRUCT_FRAME_DOUBLING = 7;
  GST_H264_SEI_PIC_STRUCT_FRAME_TRIPLING = 8;

type
  PGstH264SliceType = ^TGstH264SliceType;
  TGstH264SliceType = longint;

const
  GST_H264_P_SLICE = 0;
  GST_H264_B_SLICE = 1;
  GST_H264_I_SLICE = 2;
  GST_H264_SP_SLICE = 3;
  GST_H264_SI_SLICE = 4;
  GST_H264_S_P_SLICE = 5;
  GST_H264_S_B_SLICE = 6;
  GST_H264_S_I_SLICE = 7;
  GST_H264_S_SP_SLICE = 8;
  GST_H264_S_SI_SLICE = 9;

type
  PGstCtType = ^TGstCtType;
  TGstCtType = longint;

const
  GST_H264_CT_TYPE_PROGRESSIVE = 0;
  GST_H264_CT_TYPE_INTERLACED = 1;
  GST_H264_CT_TYPE_UNKNOWN = 2;

type
  PGstH264Level = ^TGstH264Level;
  TGstH264Level = longint;

const
  GST_H264_LEVEL_L1 = 10;
  GST_H264_LEVEL_L1B = 9;
  GST_H264_LEVEL_L1_1 = 11;
  GST_H264_LEVEL_L1_2 = 12;
  GST_H264_LEVEL_L1_3 = 13;
  GST_H264_LEVEL_L2 = 20;
  GST_H264_LEVEL_L2_1 = 21;
  GST_H264_LEVEL_L2_2 = 22;
  GST_H264_LEVEL_L3 = 30;
  GST_H264_LEVEL_L3_1 = 31;
  GST_H264_LEVEL_L3_2 = 32;
  GST_H264_LEVEL_L4 = 40;
  GST_H264_LEVEL_L4_1 = 41;
  GST_H264_LEVEL_L4_2 = 42;
  GST_H264_LEVEL_L5 = 50;
  GST_H264_LEVEL_L5_1 = 51;
  GST_H264_LEVEL_L5_2 = 52;
  GST_H264_LEVEL_L6 = 60;
  GST_H264_LEVEL_L6_1 = 61;
  GST_H264_LEVEL_L6_2 = 62;

type
  TGstH264NalUnitExtensionMVC = record
    non_idr_flag: Tguint8;
    priority_id: Tguint8;
    view_id: Tguint16;
    temporal_id: Tguint8;
    anchor_pic_flag: Tguint8;
    inter_view_flag: Tguint8;
  end;
  PGstH264NalUnitExtensionMVC = ^TGstH264NalUnitExtensionMVC;

  TGstH264NalUnit = record
    ref_idc: Tguint16;
    _type: Tguint16;
    idr_pic_flag: Tguint8;
    size: Tguint;
    offset: Tguint;
    sc_offset: Tguint;
    valid: Tgboolean;
    Data: Pguint8;
    header_bytes: Tguint8;
    extension_type: Tguint8;
    extension: record
      case longint of
        0: (mvc: TGstH264NalUnitExtensionMVC);
      end;
  end;
  PGstH264NalUnit = ^TGstH264NalUnit;

  TGstH264HRDParams = record
    cpb_cnt_minus1: Tguint8;
    bit_rate_scale: Tguint8;
    cpb_size_scale: Tguint8;
    bit_rate_value_minus1: array[0..31] of Tguint32;
    cpb_size_value_minus1: array[0..31] of Tguint32;
    cbr_flag: array[0..31] of Tguint8;
    initial_cpb_removal_delay_length_minus1: Tguint8;
    cpb_removal_delay_length_minus1: Tguint8;
    dpb_output_delay_length_minus1: Tguint8;
    time_offset_length: Tguint8;
  end;
  PGstH264HRDParams = ^TGstH264HRDParams;

  TGstH264VUIParams = record
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
    timing_info_present_flag: Tguint8;
    num_units_in_tick: Tguint32;
    time_scale: Tguint32;
    fixed_frame_rate_flag: Tguint8;
    nal_hrd_parameters_present_flag: Tguint8;
    nal_hrd_parameters: TGstH264HRDParams;
    vcl_hrd_parameters_present_flag: Tguint8;
    vcl_hrd_parameters: TGstH264HRDParams;
    low_delay_hrd_flag: Tguint8;
    pic_struct_present_flag: Tguint8;
    bitstream_restriction_flag: Tguint8;
    motion_vectors_over_pic_boundaries_flag: Tguint8;
    max_bytes_per_pic_denom: Tguint32;
    max_bits_per_mb_denom: Tguint32;
    log2_max_mv_length_horizontal: Tguint32;
    log2_max_mv_length_vertical: Tguint32;
    num_reorder_frames: Tguint32;
    max_dec_frame_buffering: Tguint32;
    par_n: Tguint;
    par_d: Tguint;
  end;
  PGstH264VUIParams = ^TGstH264VUIParams;

  TGstH264SPSExtMVCView = record
    view_id: Tguint16;
    num_anchor_refs_l0: Tguint8;
    anchor_ref_l0: array[0..14] of Tguint16;
    num_anchor_refs_l1: Tguint8;
    anchor_ref_l1: array[0..14] of Tguint16;
    num_non_anchor_refs_l0: Tguint8;
    non_anchor_ref_l0: array[0..14] of Tguint16;
    num_non_anchor_refs_l1: Tguint8;
    non_anchor_ref_l1: array[0..14] of Tguint16;
  end;
  PGstH264SPSExtMVCView = ^TGstH264SPSExtMVCView;

  TGstH264SPSExtMVCLevelValueOp = record
    temporal_id: Tguint8;
    num_target_views_minus1: Tguint16;
    target_view_id: Pguint16;
    num_views_minus1: Tguint16;
  end;
  PGstH264SPSExtMVCLevelValueOp = ^TGstH264SPSExtMVCLevelValueOp;

  PGstH264SPSExtMVCLevelValue = ^TGstH264SPSExtMVCLevelValue;

  TGstH264SPSExtMVCLevelValue = record
    level_idc: Tguint8;
    num_applicable_ops_minus1: Tguint16;
    applicable_op: PGstH264SPSExtMVCLevelValueOp;
  end;

  TGstH264SPSExtMVC = record
    num_views_minus1: Tguint16;
    view: PGstH264SPSExtMVCView;
    num_level_values_signalled_minus1: Tguint8;
    level_value: PGstH264SPSExtMVCLevelValue;
  end;
  PGstH264SPSExtMVC = ^TGstH264SPSExtMVC;

  TGstH264SPS = record
    id: Tgint;
    profile_idc: Tguint8;
    constraint_set0_flag: Tguint8;
    constraint_set1_flag: Tguint8;
    constraint_set2_flag: Tguint8;
    constraint_set3_flag: Tguint8;
    constraint_set4_flag: Tguint8;
    constraint_set5_flag: Tguint8;
    level_idc: Tguint8;
    chroma_format_idc: Tguint8;
    separate_colour_plane_flag: Tguint8;
    bit_depth_luma_minus8: Tguint8;
    bit_depth_chroma_minus8: Tguint8;
    qpprime_y_zero_transform_bypass_flag: Tguint8;
    scaling_matrix_present_flag: Tguint8;
    scaling_lists_4x4: array[0..5] of array[0..15] of Tguint8;
    scaling_lists_8x8: array[0..5] of array[0..63] of Tguint8;
    log2_max_frame_num_minus4: Tguint8;
    pic_order_cnt_type: Tguint8;
    log2_max_pic_order_cnt_lsb_minus4: Tguint8;
    delta_pic_order_always_zero_flag: Tguint8;
    offset_for_non_ref_pic: Tgint32;
    offset_for_top_to_bottom_field: Tgint32;
    num_ref_frames_in_pic_order_cnt_cycle: Tguint8;
    offset_for_ref_frame: array[0..254] of Tgint32;
    num_ref_frames: Tguint32;
    gaps_in_frame_num_value_allowed_flag: Tguint8;
    pic_width_in_mbs_minus1: Tguint32;
    pic_height_in_map_units_minus1: Tguint32;
    frame_mbs_only_flag: Tguint8;
    mb_adaptive_frame_field_flag: Tguint8;
    direct_8x8_inference_flag: Tguint8;
    frame_cropping_flag: Tguint8;
    frame_crop_left_offset: Tguint32;
    frame_crop_right_offset: Tguint32;
    frame_crop_top_offset: Tguint32;
    frame_crop_bottom_offset: Tguint32;
    vui_parameters_present_flag: Tguint8;
    vui_parameters: TGstH264VUIParams;
    chroma_array_type: Tguint8;
    max_frame_num: Tguint32;
    Width: Tgint;
    Height: Tgint;
    crop_rect_width: Tgint;
    crop_rect_height: Tgint;
    crop_rect_x: Tgint;
    crop_rect_y: Tgint;
    fps_num_removed: Tgint;
    fps_den_removed: Tgint;
    valid: Tgboolean;
    extension_type: Tguint8;
    extension: record
      case longint of
        0: (mvc: TGstH264SPSExtMVC);
      end;
  end;
  PGstH264SPS = ^TGstH264SPS;

  TGstH264PPS = record
    id: Tgint;
    sequence: PGstH264SPS;
    entropy_coding_mode_flag: Tguint8;
    pic_order_present_flag: Tguint8;
    num_slice_groups_minus1: Tguint32;
    slice_group_map_type: Tguint8;
    run_length_minus1: array[0..7] of Tguint32;
    top_left: array[0..7] of Tguint32;
    bottom_right: array[0..7] of Tguint32;
    slice_group_change_direction_flag: Tguint8;
    slice_group_change_rate_minus1: Tguint32;
    pic_size_in_map_units_minus1: Tguint32;
    slice_group_id: Pguint8;
    num_ref_idx_l0_active_minus1: Tguint8;
    num_ref_idx_l1_active_minus1: Tguint8;
    weighted_pred_flag: Tguint8;
    weighted_bipred_idc: Tguint8;
    pic_init_qp_minus26: Tgint8;
    pic_init_qs_minus26: Tgint8;
    chroma_qp_index_offset: Tgint8;
    deblocking_filter_control_present_flag: Tguint8;
    constrained_intra_pred_flag: Tguint8;
    redundant_pic_cnt_present_flag: Tguint8;
    transform_8x8_mode_flag: Tguint8;
    scaling_lists_4x4: array[0..5] of array[0..15] of Tguint8;
    scaling_lists_8x8: array[0..5] of array[0..63] of Tguint8;
    second_chroma_qp_index_offset: Tgint8;
    valid: Tgboolean;
    pic_scaling_matrix_present_flag: Tguint8;
  end;
  PGstH264PPS = ^TGstH264PPS;

  TGstH264RefPicListModification = record
    modification_of_pic_nums_idc: Tguint8;
    Value: record
      case longint of
        0: (abs_diff_pic_num_minus1: Tguint32);
        1: (long_term_pic_num: Tguint32);
        2: (abs_diff_view_idx_minus1: Tguint32);
      end;
  end;
  PGstH264RefPicListModification = ^TGstH264RefPicListModification;

  TGstH264PredWeightTable = record
    luma_log2_weight_denom: Tguint8;
    chroma_log2_weight_denom: Tguint8;
    luma_weight_l0: array[0..31] of Tgint16;
    luma_offset_l0: array[0..31] of Tgint8;
    chroma_weight_l0: array[0..31] of array[0..1] of Tgint16;
    chroma_offset_l0: array[0..31] of array[0..1] of Tgint8;
    luma_weight_l1: array[0..31] of Tgint16;
    luma_offset_l1: array[0..31] of Tgint8;
    chroma_weight_l1: array[0..31] of array[0..1] of Tgint16;
    chroma_offset_l1: array[0..31] of array[0..1] of Tgint8;
  end;
  PGstH264PredWeightTable = ^TGstH264PredWeightTable;

  TGstH264RefPicMarking = record
    memory_management_control_operation: Tguint8;
    difference_of_pic_nums_minus1: Tguint32;
    long_term_pic_num: Tguint32;
    long_term_frame_idx: Tguint32;
    max_long_term_frame_idx_plus1: Tguint32;
  end;
  PGstH264RefPicMarking = ^TGstH264RefPicMarking;

  TGstH264DecRefPicMarking = record
    no_output_of_prior_pics_flag: Tguint8;
    long_term_reference_flag: Tguint8;
    adaptive_ref_pic_marking_mode_flag: Tguint8;
    ref_pic_marking: array[0..9] of TGstH264RefPicMarking;
    n_ref_pic_marking: Tguint8;
    bit_size: Tguint;
  end;
  PGstH264DecRefPicMarking = ^TGstH264DecRefPicMarking;

  TGstH264SliceHdr = record
    first_mb_in_slice: Tguint32;
    _type: Tguint32;
    pps: PGstH264PPS;
    colour_plane_id: Tguint8;
    frame_num: Tguint16;
    field_pic_flag: Tguint8;
    bottom_field_flag: Tguint8;
    idr_pic_id: Tguint16;
    pic_order_cnt_lsb: Tguint16;
    delta_pic_order_cnt_bottom: Tgint32;
    delta_pic_order_cnt: array[0..1] of Tgint32;
    redundant_pic_cnt: Tguint8;
    direct_spatial_mv_pred_flag: Tguint8;
    num_ref_idx_l0_active_minus1: Tguint8;
    num_ref_idx_l1_active_minus1: Tguint8;
    ref_pic_list_modification_flag_l0: Tguint8;
    n_ref_pic_list_modification_l0: Tguint8;
    ref_pic_list_modification_l0: array[0..31] of TGstH264RefPicListModification;
    ref_pic_list_modification_flag_l1: Tguint8;
    n_ref_pic_list_modification_l1: Tguint8;
    ref_pic_list_modification_l1: array[0..31] of TGstH264RefPicListModification;
    pred_weight_table: TGstH264PredWeightTable;
    dec_ref_pic_marking: TGstH264DecRefPicMarking;
    cabac_init_idc: Tguint8;
    slice_qp_delta: Tgint8;
    slice_qs_delta: Tgint8;
    disable_deblocking_filter_idc: Tguint8;
    slice_alpha_c0_offset_div2: Tgint8;
    slice_beta_offset_div2: Tgint8;
    slice_group_change_cycle: Tguint16;
    max_pic_num: Tguint32;
    valid: Tgboolean;
    header_size: Tguint;
    n_emulation_prevention_bytes: Tguint;
    num_ref_idx_active_override_flag: Tguint8;
    sp_for_switch_flag: Tguint8;
    pic_order_cnt_bit_size: Tguint;
  end;
  PGstH264SliceHdr = ^TGstH264SliceHdr;

  TGstH264ClockTimestamp = record
    ct_type: Tguint8;
    nuit_field_based_flag: Tguint8;
    counting_type: Tguint8;
    full_timestamp_flag: Tguint8;
    discontinuity_flag: Tguint8;
    cnt_dropped_flag: Tguint8;
    n_frames: Tguint8;
    seconds_flag: Tguint8;
    seconds_value: Tguint8;
    minutes_flag: Tguint8;
    minutes_value: Tguint8;
    hours_flag: Tguint8;
    hours_value: Tguint8;
    time_offset: Tguint32;
  end;
  PGstH264ClockTimestamp = ^TGstH264ClockTimestamp;

  TGstH264FramePacking = record
    frame_packing_id: Tguint32;
    frame_packing_cancel_flag: Tguint8;
    frame_packing_type: Tguint8;
    quincunx_sampling_flag: Tguint8;
    content_interpretation_type: Tguint8;
    spatial_flipping_flag: Tguint8;
    frame0_flipped_flag: Tguint8;
    field_views_flag: Tguint8;
    current_frame_is_frame0_flag: Tguint8;
    frame0_self_contained_flag: Tguint8;
    frame1_self_contained_flag: Tguint8;
    frame0_grid_position_x: Tguint8;
    frame0_grid_position_y: Tguint8;
    frame1_grid_position_x: Tguint8;
    frame1_grid_position_y: Tguint8;
    frame_packing_repetition_period: Tguint16;
  end;
  PGstH264FramePacking = ^TGstH264FramePacking;

  TGstH264StereoVideoInfo = record
    field_views_flag: Tguint8;
    top_field_is_left_view_flag: Tguint8;
    current_frame_is_left_view_flag: Tguint8;
    next_frame_is_second_view_flag: Tguint8;
    left_view_self_contained_flag: Tguint8;
    right_view_self_contained_flag: Tguint8;
  end;
  PGstH264StereoVideoInfo = ^TGstH264StereoVideoInfo;

  TGstH264PicTiming = record
    CpbDpbDelaysPresentFlag: Tguint8;
    cpb_removal_delay_length_minus1: Tguint8;
    dpb_output_delay_length_minus1: Tguint8;
    cpb_removal_delay: Tguint32;
    dpb_output_delay: Tguint32;
    pic_struct_present_flag: Tguint8;
    pic_struct: Tguint8;
    clock_timestamp_flag: array[0..2] of Tguint8;
    clock_timestamp: array[0..2] of TGstH264ClockTimestamp;
    time_offset_length: Tguint8;
  end;
  PGstH264PicTiming = ^TGstH264PicTiming;

  TGstH264RegisteredUserData = record
    country_code: Tguint8;
    country_code_extension: Tguint8;
    Data: Pguint8;
    size: Tguint;
  end;
  PGstH264RegisteredUserData = ^TGstH264RegisteredUserData;

  TGstH264UserDataUnregistered = record
    uuid: array[0..15] of Tguint8;
    Data: Pguint8;
    size: Tguint;
  end;
  PGstH264UserDataUnregistered = ^TGstH264UserDataUnregistered;

  TGstH264BufferingPeriod = record
    sps: PGstH264SPS;
    nal_initial_cpb_removal_delay: array[0..31] of Tguint32;
    nal_initial_cpb_removal_delay_offset: array[0..31] of Tguint32;
    vcl_initial_cpb_removal_delay: array[0..31] of Tguint32;
    vcl_initial_cpb_removal_delay_offset: array[0..31] of Tguint32;
  end;
  PGstH264BufferingPeriod = ^TGstH264BufferingPeriod;

  TGstH264RecoveryPoint = record
    recovery_frame_cnt: Tguint32;
    exact_match_flag: Tguint8;
    broken_link_flag: Tguint8;
    changing_slice_group_idc: Tguint8;
  end;
  PGstH264RecoveryPoint = ^TGstH264RecoveryPoint;

  TGstH264MasteringDisplayColourVolume = record
    display_primaries_x: array[0..2] of Tguint16;
    display_primaries_y: array[0..2] of Tguint16;
    white_point_x: Tguint16;
    white_point_y: Tguint16;
    max_display_mastering_luminance: Tguint32;
    min_display_mastering_luminance: Tguint32;
  end;
  PGstH264MasteringDisplayColourVolume = ^TGstH264MasteringDisplayColourVolume;

  TGstH264ContentLightLevel = record
    max_content_light_level: Tguint16;
    max_pic_average_light_level: Tguint16;
  end;
  PGstH264ContentLightLevel = ^TGstH264ContentLightLevel;

  TGstH264SEIUnhandledPayload = record
    payloadType: Tguint;
    Data: Pguint8;
    size: Tguint;
  end;
  PGstH264SEIUnhandledPayload = ^TGstH264SEIUnhandledPayload;

  TGstH264SEIMessage = record
    payloadType: TGstH264SEIPayloadType;
    payload: record
      case longint of
        0: (buffering_period: TGstH264BufferingPeriod);
        1: (pic_timing: TGstH264PicTiming);
        2: (registered_user_data: TGstH264RegisteredUserData);
        3: (recovery_point: TGstH264RecoveryPoint);
        4: (stereo_video_info: TGstH264StereoVideoInfo);
        5: (frame_packing: TGstH264FramePacking);
        6: (mastering_display_colour_volume: TGstH264MasteringDisplayColourVolume);
        7: (content_light_level: TGstH264ContentLightLevel);
        8: (unhandled_payload: TGstH264SEIUnhandledPayload);
        9: (user_data_unregistered: TGstH264UserDataUnregistered);
      end;
  end;
  PGstH264SEIMessage = ^TGstH264SEIMessage;

  TGstH264DecoderConfigRecord = record
    configuration_version: Tguint8;
    profile_indication: Tguint8;
    profile_compatibility: Tguint8;
    level_indication: Tguint8;
    length_size_minus_one: Tguint8;
    sps: PGArray;
    pps: PGArray;
    chroma_format_present: Tgboolean;
    chroma_format: Tguint8;
    bit_depth_luma_minus8: Tguint8;
    bit_depth_chroma_minus8: Tguint8;
    sps_ext: PGArray;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstH264DecoderConfigRecord = ^TGstH264DecoderConfigRecord;
  PPGstH264DecoderConfigRecord = ^PGstH264DecoderConfigRecord;

  TGstH264NalParser = record
    sps: array[0..(GST_H264_MAX_SPS_COUNT) - 1] of TGstH264SPS;
    pps: array[0..(GST_H264_MAX_PPS_COUNT) - 1] of TGstH264PPS;
    last_sps: PGstH264SPS;
    last_pps: PGstH264PPS;
  end;
  PGstH264NalParser = ^TGstH264NalParser;


function gst_h264_nal_parser_new: PGstH264NalParser; cdecl; external libgstcodecparsers;
function gst_h264_parser_identify_nalu(nalparser: PGstH264NalParser; Data: Pguint8; offset: Tguint; size: Tgsize; nalu: PGstH264NalUnit): TGstH264ParserResult; cdecl; external libgstcodecparsers;
function gst_h264_parser_identify_nalu_unchecked(nalparser: PGstH264NalParser; Data: Pguint8; offset: Tguint; size: Tgsize; nalu: PGstH264NalUnit): TGstH264ParserResult; cdecl; external libgstcodecparsers;
function gst_h264_parser_identify_nalu_avc(nalparser: PGstH264NalParser; Data: Pguint8; offset: Tguint; size: Tgsize; nal_length_size: Tguint8;
  nalu: PGstH264NalUnit): TGstH264ParserResult; cdecl; external libgstcodecparsers;
function gst_h264_parser_identify_and_split_nalu_avc(nalparser: PGstH264NalParser; Data: Pguint8; offset: Tguint; size: Tgsize; nal_length_size: Tguint8;
  nalus: PGArray; consumed: Pgsize): TGstH264ParserResult; cdecl; external libgstcodecparsers;
function gst_h264_parser_parse_nal(nalparser: PGstH264NalParser; nalu: PGstH264NalUnit): TGstH264ParserResult; cdecl; external libgstcodecparsers;
function gst_h264_parser_parse_slice_hdr(nalparser: PGstH264NalParser; nalu: PGstH264NalUnit; slice: PGstH264SliceHdr; parse_pred_weight_table: Tgboolean; parse_dec_ref_pic_marking: Tgboolean): TGstH264ParserResult; cdecl; external libgstcodecparsers;
function gst_h264_parser_parse_subset_sps(nalparser: PGstH264NalParser; nalu: PGstH264NalUnit; sps: PGstH264SPS): TGstH264ParserResult; cdecl; external libgstcodecparsers;
function gst_h264_parser_parse_sps(nalparser: PGstH264NalParser; nalu: PGstH264NalUnit; sps: PGstH264SPS): TGstH264ParserResult; cdecl; external libgstcodecparsers;
function gst_h264_parser_parse_pps(nalparser: PGstH264NalParser; nalu: PGstH264NalUnit; pps: PGstH264PPS): TGstH264ParserResult; cdecl; external libgstcodecparsers;
function gst_h264_parser_parse_sei(nalparser: PGstH264NalParser; nalu: PGstH264NalUnit; Messages: PPGArray): TGstH264ParserResult; cdecl; external libgstcodecparsers;
function gst_h264_parser_update_sps(nalparser: PGstH264NalParser; sps: PGstH264SPS): TGstH264ParserResult; cdecl; external libgstcodecparsers;
function gst_h264_parser_update_pps(nalparser: PGstH264NalParser; pps: PGstH264PPS): TGstH264ParserResult; cdecl; external libgstcodecparsers;
procedure gst_h264_nal_parser_free(nalparser: PGstH264NalParser); cdecl; external libgstcodecparsers;
function gst_h264_parse_subset_sps(nalu: PGstH264NalUnit; sps: PGstH264SPS): TGstH264ParserResult; cdecl; external libgstcodecparsers;
function gst_h264_parse_sps(nalu: PGstH264NalUnit; sps: PGstH264SPS): TGstH264ParserResult; cdecl; external libgstcodecparsers;
function gst_h264_parse_pps(nalparser: PGstH264NalParser; nalu: PGstH264NalUnit; pps: PGstH264PPS): TGstH264ParserResult; cdecl; external libgstcodecparsers;
procedure gst_h264_sps_clear(sps: PGstH264SPS); cdecl; external libgstcodecparsers;
procedure gst_h264_pps_clear(pps: PGstH264PPS); cdecl; external libgstcodecparsers;
procedure gst_h264_sei_clear(sei: PGstH264SEIMessage); cdecl; external libgstcodecparsers;
procedure gst_h264_quant_matrix_8x8_get_zigzag_from_raster(out_quant: Pguint8; quant: Pguint8); cdecl; external libgstcodecparsers;
procedure gst_h264_quant_matrix_8x8_get_raster_from_zigzag(out_quant: Pguint8; quant: Pguint8); cdecl; external libgstcodecparsers;
procedure gst_h264_quant_matrix_4x4_get_zigzag_from_raster(out_quant: Pguint8; quant: Pguint8); cdecl; external libgstcodecparsers;
procedure gst_h264_quant_matrix_4x4_get_raster_from_zigzag(out_quant: Pguint8; quant: Pguint8); cdecl; external libgstcodecparsers;
procedure gst_h264_video_calculate_framerate(sps: PGstH264SPS; field_pic_flag: Tguint; pic_struct: Tguint; fps_num: Pgint; fps_den: Pgint); cdecl; external libgstcodecparsers;
function gst_h264_create_sei_memory(start_code_prefix_length: Tguint8; Messages: PGArray): PGstMemory; cdecl; external libgstcodecparsers;
function gst_h264_create_sei_memory_avc(nal_length_size: Tguint8; Messages: PGArray): PGstMemory; cdecl; external libgstcodecparsers;
function gst_h264_parser_insert_sei(nalparser: PGstH264NalParser; au: PGstBuffer; sei: PGstMemory): PGstBuffer; cdecl; external libgstcodecparsers;
function gst_h264_parser_insert_sei_avc(nalparser: PGstH264NalParser; nal_length_size: Tguint8; au: PGstBuffer; sei: PGstMemory): PGstBuffer; cdecl; external libgstcodecparsers;
procedure gst_h264_decoder_config_record_free(config: PGstH264DecoderConfigRecord); cdecl; external libgstcodecparsers;
function gst_h264_parser_parse_decoder_config_record(nalparser: PGstH264NalParser; Data: Pguint8; size: Tgsize; config: PPGstH264DecoderConfigRecord): TGstH264ParserResult; cdecl; external libgstcodecparsers;
function gst_h264_profile_from_string(profile: Pgchar): TGstH264Profile; cdecl; external libgstcodecparsers;
function gst_h264_slice_type_to_string(slice_type: TGstH264SliceType): Pgchar; cdecl; external libgstcodecparsers;

function GST_H264_IS_P_SLICE(slice: PGstH264SliceHdr): Tgboolean;
function GST_H264_IS_B_SLICE(slice: PGstH264SliceHdr): Tgboolean;
function GST_H264_IS_I_SLICE(slice: PGstH264SliceHdr): Tgboolean;
function GST_H264_IS_SP_SLICE(slice: PGstH264SliceHdr): Tgboolean;
function GST_H264_IS_SI_SLICE(slice: PGstH264SliceHdr): Tgboolean;
function GST_H264_IS_SVC_NALU(nalu: PGstH264NalUnit): Tgboolean;
function GST_H264_IS_MVC_NALU(nalu: PGstH264NalUnit): Tgboolean;

// === Konventiert am: 7-10-24 11:29:51 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function GST_H264_IS_P_SLICE(slice: PGstH264SliceHdr): Tgboolean;
begin
  GST_H264_IS_P_SLICE := ((slice^._type) mod 5) = GST_H264_P_SLICE;
end;

function GST_H264_IS_B_SLICE(slice: PGstH264SliceHdr): Tgboolean;
begin
  GST_H264_IS_B_SLICE := ((slice^._type) mod 5) = GST_H264_B_SLICE;
end;

function GST_H264_IS_I_SLICE(slice: PGstH264SliceHdr): Tgboolean;
begin
  GST_H264_IS_I_SLICE := ((slice^._type) mod 5) = GST_H264_I_SLICE;
end;

function GST_H264_IS_SP_SLICE(slice: PGstH264SliceHdr): Tgboolean;
begin
  GST_H264_IS_SP_SLICE := ((slice^._type) mod 5) = GST_H264_SP_SLICE;
end;

function GST_H264_IS_SI_SLICE(slice: PGstH264SliceHdr): Tgboolean;
begin
  GST_H264_IS_SI_SLICE := ((slice^._type) mod 5) = GST_H264_SI_SLICE;
end;

function GST_H264_IS_SVC_NALU(nalu: PGstH264NalUnit): Tgboolean;
begin
  GST_H264_IS_SVC_NALU := (nalu^.extension_type) = GST_H264_NAL_EXTENSION_SVC;
end;

function GST_H264_IS_MVC_NALU(nalu: PGstH264NalUnit): Tgboolean;
begin
  GST_H264_IS_MVC_NALU := (nalu^.extension_type) = GST_H264_NAL_EXTENSION_MVC;
end;


{$ENDIF read_implementation}
