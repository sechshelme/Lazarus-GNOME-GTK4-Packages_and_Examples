{$IFDEF read_interface}


const
  VULKAN_VIDEO_CODEC_H264STD_H_ = 1;

const
  STD_VIDEO_H264_CPB_CNT_LIST_SIZE = 32;
  STD_VIDEO_H264_SCALING_LIST_4X4_NUM_LISTS = 6;
  STD_VIDEO_H264_SCALING_LIST_4X4_NUM_ELEMENTS = 16;
  STD_VIDEO_H264_SCALING_LIST_8X8_NUM_LISTS = 6;
  STD_VIDEO_H264_SCALING_LIST_8X8_NUM_ELEMENTS = 64;
  STD_VIDEO_H264_MAX_NUM_LIST_REF = 32;
  STD_VIDEO_H264_MAX_CHROMA_PLANES = 2;
  STD_VIDEO_H264_NO_REFERENCE_PICTURE = $FF;

type
  PStdVideoH264ChromaFormatIdc = ^TStdVideoH264ChromaFormatIdc;
  TStdVideoH264ChromaFormatIdc = longint;

const
  STD_VIDEO_H264_CHROMA_FORMAT_IDC_MONOCHROME = 0;
  STD_VIDEO_H264_CHROMA_FORMAT_IDC_420 = 1;
  STD_VIDEO_H264_CHROMA_FORMAT_IDC_422 = 2;
  STD_VIDEO_H264_CHROMA_FORMAT_IDC_444 = 3;
  STD_VIDEO_H264_CHROMA_FORMAT_IDC_INVALID = $7FFFFFFF;
  STD_VIDEO_H264_CHROMA_FORMAT_IDC_MAX_ENUM = $7FFFFFFF;

type
  PStdVideoH264ProfileIdc = ^TStdVideoH264ProfileIdc;
  TStdVideoH264ProfileIdc = longint;

const
  STD_VIDEO_H264_PROFILE_IDC_BASELINE = 66;
  STD_VIDEO_H264_PROFILE_IDC_MAIN = 77;
  STD_VIDEO_H264_PROFILE_IDC_HIGH = 100;
  STD_VIDEO_H264_PROFILE_IDC_HIGH_444_PREDICTIVE = 244;
  STD_VIDEO_H264_PROFILE_IDC_INVALID = $7FFFFFFF;
  STD_VIDEO_H264_PROFILE_IDC_MAX_ENUM = $7FFFFFFF;

type
  PStdVideoH264LevelIdc = ^TStdVideoH264LevelIdc;
  TStdVideoH264LevelIdc = longint;

const
  STD_VIDEO_H264_LEVEL_IDC_1_0 = 0;
  STD_VIDEO_H264_LEVEL_IDC_1_1 = 1;
  STD_VIDEO_H264_LEVEL_IDC_1_2 = 2;
  STD_VIDEO_H264_LEVEL_IDC_1_3 = 3;
  STD_VIDEO_H264_LEVEL_IDC_2_0 = 4;
  STD_VIDEO_H264_LEVEL_IDC_2_1 = 5;
  STD_VIDEO_H264_LEVEL_IDC_2_2 = 6;
  STD_VIDEO_H264_LEVEL_IDC_3_0 = 7;
  STD_VIDEO_H264_LEVEL_IDC_3_1 = 8;
  STD_VIDEO_H264_LEVEL_IDC_3_2 = 9;
  STD_VIDEO_H264_LEVEL_IDC_4_0 = 10;
  STD_VIDEO_H264_LEVEL_IDC_4_1 = 11;
  STD_VIDEO_H264_LEVEL_IDC_4_2 = 12;
  STD_VIDEO_H264_LEVEL_IDC_5_0 = 13;
  STD_VIDEO_H264_LEVEL_IDC_5_1 = 14;
  STD_VIDEO_H264_LEVEL_IDC_5_2 = 15;
  STD_VIDEO_H264_LEVEL_IDC_6_0 = 16;
  STD_VIDEO_H264_LEVEL_IDC_6_1 = 17;
  STD_VIDEO_H264_LEVEL_IDC_6_2 = 18;
  STD_VIDEO_H264_LEVEL_IDC_INVALID = $7FFFFFFF;
  STD_VIDEO_H264_LEVEL_IDC_MAX_ENUM = $7FFFFFFF;

type
  PStdVideoH264PocType = ^TStdVideoH264PocType;
  TStdVideoH264PocType = longint;

const
  STD_VIDEO_H264_POC_TYPE_0 = 0;
  STD_VIDEO_H264_POC_TYPE_1 = 1;
  STD_VIDEO_H264_POC_TYPE_2 = 2;
  STD_VIDEO_H264_POC_TYPE_INVALID = $7FFFFFFF;
  STD_VIDEO_H264_POC_TYPE_MAX_ENUM = $7FFFFFFF;

type
  PStdVideoH264AspectRatioIdc = ^TStdVideoH264AspectRatioIdc;
  TStdVideoH264AspectRatioIdc = longint;

const
  STD_VIDEO_H264_ASPECT_RATIO_IDC_UNSPECIFIED = 0;
  STD_VIDEO_H264_ASPECT_RATIO_IDC_SQUARE = 1;
  STD_VIDEO_H264_ASPECT_RATIO_IDC_12_11 = 2;
  STD_VIDEO_H264_ASPECT_RATIO_IDC_10_11 = 3;
  STD_VIDEO_H264_ASPECT_RATIO_IDC_16_11 = 4;
  STD_VIDEO_H264_ASPECT_RATIO_IDC_40_33 = 5;
  STD_VIDEO_H264_ASPECT_RATIO_IDC_24_11 = 6;
  STD_VIDEO_H264_ASPECT_RATIO_IDC_20_11 = 7;
  STD_VIDEO_H264_ASPECT_RATIO_IDC_32_11 = 8;
  STD_VIDEO_H264_ASPECT_RATIO_IDC_80_33 = 9;
  STD_VIDEO_H264_ASPECT_RATIO_IDC_18_11 = 10;
  STD_VIDEO_H264_ASPECT_RATIO_IDC_15_11 = 11;
  STD_VIDEO_H264_ASPECT_RATIO_IDC_64_33 = 12;
  STD_VIDEO_H264_ASPECT_RATIO_IDC_160_99 = 13;
  STD_VIDEO_H264_ASPECT_RATIO_IDC_4_3 = 14;
  STD_VIDEO_H264_ASPECT_RATIO_IDC_3_2 = 15;
  STD_VIDEO_H264_ASPECT_RATIO_IDC_2_1 = 16;
  STD_VIDEO_H264_ASPECT_RATIO_IDC_EXTENDED_SAR = 255;
  STD_VIDEO_H264_ASPECT_RATIO_IDC_INVALID = $7FFFFFFF;
  STD_VIDEO_H264_ASPECT_RATIO_IDC_MAX_ENUM = $7FFFFFFF;

type
  PStdVideoH264WeightedBipredIdc = ^TStdVideoH264WeightedBipredIdc;
  TStdVideoH264WeightedBipredIdc = longint;

const
  STD_VIDEO_H264_WEIGHTED_BIPRED_IDC_DEFAULT = 0;
  STD_VIDEO_H264_WEIGHTED_BIPRED_IDC_EXPLICIT = 1;
  STD_VIDEO_H264_WEIGHTED_BIPRED_IDC_IMPLICIT = 2;
  STD_VIDEO_H264_WEIGHTED_BIPRED_IDC_INVALID = $7FFFFFFF;
  STD_VIDEO_H264_WEIGHTED_BIPRED_IDC_MAX_ENUM = $7FFFFFFF;

type
  PStdVideoH264ModificationOfPicNumsIdc = ^TStdVideoH264ModificationOfPicNumsIdc;
  TStdVideoH264ModificationOfPicNumsIdc = longint;

const
  STD_VIDEO_H264_MODIFICATION_OF_PIC_NUMS_IDC_SHORT_TERM_SUBTRACT = 0;
  STD_VIDEO_H264_MODIFICATION_OF_PIC_NUMS_IDC_SHORT_TERM_ADD = 1;
  STD_VIDEO_H264_MODIFICATION_OF_PIC_NUMS_IDC_LONG_TERM = 2;
  STD_VIDEO_H264_MODIFICATION_OF_PIC_NUMS_IDC_END = 3;
  STD_VIDEO_H264_MODIFICATION_OF_PIC_NUMS_IDC_INVALID = $7FFFFFFF;
  STD_VIDEO_H264_MODIFICATION_OF_PIC_NUMS_IDC_MAX_ENUM = $7FFFFFFF;

type
  PStdVideoH264MemMgmtControlOp = ^TStdVideoH264MemMgmtControlOp;
  TStdVideoH264MemMgmtControlOp = longint;

const
  STD_VIDEO_H264_MEM_MGMT_CONTROL_OP_END = 0;
  STD_VIDEO_H264_MEM_MGMT_CONTROL_OP_UNMARK_SHORT_TERM = 1;
  STD_VIDEO_H264_MEM_MGMT_CONTROL_OP_UNMARK_LONG_TERM = 2;
  STD_VIDEO_H264_MEM_MGMT_CONTROL_OP_MARK_LONG_TERM = 3;
  STD_VIDEO_H264_MEM_MGMT_CONTROL_OP_SET_MAX_LONG_TERM_INDEX = 4;
  STD_VIDEO_H264_MEM_MGMT_CONTROL_OP_UNMARK_ALL = 5;
  STD_VIDEO_H264_MEM_MGMT_CONTROL_OP_MARK_CURRENT_AS_LONG_TERM = 6;
  STD_VIDEO_H264_MEM_MGMT_CONTROL_OP_INVALID = $7FFFFFFF;
  STD_VIDEO_H264_MEM_MGMT_CONTROL_OP_MAX_ENUM = $7FFFFFFF;

type
  PStdVideoH264CabacInitIdc = ^TStdVideoH264CabacInitIdc;
  TStdVideoH264CabacInitIdc = longint;

const
  STD_VIDEO_H264_CABAC_INIT_IDC_0 = 0;
  STD_VIDEO_H264_CABAC_INIT_IDC_1 = 1;
  STD_VIDEO_H264_CABAC_INIT_IDC_2 = 2;
  STD_VIDEO_H264_CABAC_INIT_IDC_INVALID = $7FFFFFFF;
  STD_VIDEO_H264_CABAC_INIT_IDC_MAX_ENUM = $7FFFFFFF;

type
  PStdVideoH264DisableDeblockingFilterIdc = ^TStdVideoH264DisableDeblockingFilterIdc;
  TStdVideoH264DisableDeblockingFilterIdc = longint;

const
  STD_VIDEO_H264_DISABLE_DEBLOCKING_FILTER_IDC_DISABLED = 0;
  STD_VIDEO_H264_DISABLE_DEBLOCKING_FILTER_IDC_ENABLED = 1;
  STD_VIDEO_H264_DISABLE_DEBLOCKING_FILTER_IDC_PARTIAL = 2;
  STD_VIDEO_H264_DISABLE_DEBLOCKING_FILTER_IDC_INVALID = $7FFFFFFF;
  STD_VIDEO_H264_DISABLE_DEBLOCKING_FILTER_IDC_MAX_ENUM = $7FFFFFFF;

type
  PStdVideoH264SliceType = ^TStdVideoH264SliceType;
  TStdVideoH264SliceType = longint;

const
  STD_VIDEO_H264_SLICE_TYPE_P = 0;
  STD_VIDEO_H264_SLICE_TYPE_B = 1;
  STD_VIDEO_H264_SLICE_TYPE_I = 2;
  STD_VIDEO_H264_SLICE_TYPE_INVALID = $7FFFFFFF;
  STD_VIDEO_H264_SLICE_TYPE_MAX_ENUM = $7FFFFFFF;

type
  PStdVideoH264PictureType = ^TStdVideoH264PictureType;
  TStdVideoH264PictureType = longint;

const
  STD_VIDEO_H264_PICTURE_TYPE_P = 0;
  STD_VIDEO_H264_PICTURE_TYPE_B = 1;
  STD_VIDEO_H264_PICTURE_TYPE_I = 2;
  STD_VIDEO_H264_PICTURE_TYPE_IDR = 5;
  STD_VIDEO_H264_PICTURE_TYPE_INVALID = $7FFFFFFF;
  STD_VIDEO_H264_PICTURE_TYPE_MAX_ENUM = $7FFFFFFF;

type
  PStdVideoH264NonVclNaluType = ^TStdVideoH264NonVclNaluType;
  TStdVideoH264NonVclNaluType = longint;

const
  STD_VIDEO_H264_NON_VCL_NALU_TYPE_SPS = 0;
  STD_VIDEO_H264_NON_VCL_NALU_TYPE_PPS = 1;
  STD_VIDEO_H264_NON_VCL_NALU_TYPE_AUD = 2;
  STD_VIDEO_H264_NON_VCL_NALU_TYPE_PREFIX = 3;
  STD_VIDEO_H264_NON_VCL_NALU_TYPE_END_OF_SEQUENCE = 4;
  STD_VIDEO_H264_NON_VCL_NALU_TYPE_END_OF_STREAM = 5;
  STD_VIDEO_H264_NON_VCL_NALU_TYPE_PRECODED = 6;
  STD_VIDEO_H264_NON_VCL_NALU_TYPE_INVALID = $7FFFFFFF;
  STD_VIDEO_H264_NON_VCL_NALU_TYPE_MAX_ENUM = $7FFFFFFF;

type
  PStdVideoH264SpsVuiFlags = ^TStdVideoH264SpsVuiFlags;

  TStdVideoH264SpsVuiFlags = bitpacked record
    aspect_ratio_info_present_flag: 0..1;
    overscan_info_present_flag: 0..1;
    overscan_appropriate_flag: 0..1;
    video_signal_type_present_flag: 0..1;
    video_full_range_flag: 0..1;
    color_description_present_flag: 0..1;
    chroma_loc_info_present_flag: 0..1;
    timing_info_present_flag: 0..1;
    fixed_frame_rate_flag: 0..1;
    bitstream_restriction_flag: 0..1;
    nal_hrd_parameters_present_flag: 0..1;
    vcl_hrd_parameters_present_flag: 0..1;
  end;

type
  TStdVideoH264HrdParameters = record
    cpb_cnt_minus1: Tuint8_t;
    bit_rate_scale: Tuint8_t;
    cpb_size_scale: Tuint8_t;
    reserved1: Tuint8_t;
    bit_rate_value_minus1: array[0..(STD_VIDEO_H264_CPB_CNT_LIST_SIZE) - 1] of Tuint32_t;
    cpb_size_value_minus1: array[0..(STD_VIDEO_H264_CPB_CNT_LIST_SIZE) - 1] of Tuint32_t;
    cbr_flag: array[0..(STD_VIDEO_H264_CPB_CNT_LIST_SIZE) - 1] of Tuint8_t;
    initial_cpb_removal_delay_length_minus1: Tuint32_t;
    cpb_removal_delay_length_minus1: Tuint32_t;
    dpb_output_delay_length_minus1: Tuint32_t;
    time_offset_length: Tuint32_t;
  end;
  PStdVideoH264HrdParameters = ^TStdVideoH264HrdParameters;

  TStdVideoH264SequenceParameterSetVui = record
    flags: TStdVideoH264SpsVuiFlags;
    aspect_ratio_idc: TStdVideoH264AspectRatioIdc;
    sar_width: Tuint16_t;
    sar_height: Tuint16_t;
    video_format: Tuint8_t;
    colour_primaries: Tuint8_t;
    transfer_characteristics: Tuint8_t;
    matrix_coefficients: Tuint8_t;
    num_units_in_tick: Tuint32_t;
    time_scale: Tuint32_t;
    max_num_reorder_frames: Tuint8_t;
    max_dec_frame_buffering: Tuint8_t;
    chroma_sample_loc_type_top_field: Tuint8_t;
    chroma_sample_loc_type_bottom_field: Tuint8_t;
    reserved1: Tuint32_t;
    pHrdParameters: PStdVideoH264HrdParameters;
  end;
  PStdVideoH264SequenceParameterSetVui = ^TStdVideoH264SequenceParameterSetVui;

  TStdVideoH264SpsFlags = bitpacked record
    constraint_set0_flag: 0..1;
    constraint_set1_flag: 0..1;
    constraint_set2_flag: 0..1;
    constraint_set3_flag: 0..1;
    constraint_set4_flag: 0..1;
    constraint_set5_flag: 0..1;
    direct_8x8_inference_flag: 0..1;
    mb_adaptive_frame_field_flag: 0..1;
    frame_mbs_only_flag: 0..1;
    delta_pic_order_always_zero_flag: 0..1;
    separate_colour_plane_flag: 0..1;
    gaps_in_frame_num_value_allowed_flag: 0..1;
    qpprime_y_zero_transform_bypass_flag: 0..1;
    frame_cropping_flag: 0..1;
    seq_scaling_matrix_present_flag: 0..1;
    vui_parameters_present_flag: 0..1;
  end;
  PStdVideoH264SpsFlags = ^TStdVideoH264SpsFlags;

type
  TStdVideoH264ScalingLists = record
    scaling_list_present_mask: Tuint16_t;
    use_default_scaling_matrix_mask: Tuint16_t;
    ScalingList4x4: array[0..(STD_VIDEO_H264_SCALING_LIST_4X4_NUM_LISTS) - 1] of array[0..(STD_VIDEO_H264_SCALING_LIST_4X4_NUM_ELEMENTS) - 1] of Tuint8_t;
    ScalingList8x8: array[0..(STD_VIDEO_H264_SCALING_LIST_8X8_NUM_LISTS) - 1] of array[0..(STD_VIDEO_H264_SCALING_LIST_8X8_NUM_ELEMENTS) - 1] of Tuint8_t;
  end;
  PStdVideoH264ScalingLists = ^TStdVideoH264ScalingLists;

  TStdVideoH264SequenceParameterSet = record
    flags: TStdVideoH264SpsFlags;
    profile_idc: TStdVideoH264ProfileIdc;
    level_idc: TStdVideoH264LevelIdc;
    chroma_format_idc: TStdVideoH264ChromaFormatIdc;
    seq_parameter_set_id: Tuint8_t;
    bit_depth_luma_minus8: Tuint8_t;
    bit_depth_chroma_minus8: Tuint8_t;
    log2_max_frame_num_minus4: Tuint8_t;
    pic_order_cnt_type: TStdVideoH264PocType;
    offset_for_non_ref_pic: Tint32_t;
    offset_for_top_to_bottom_field: Tint32_t;
    log2_max_pic_order_cnt_lsb_minus4: Tuint8_t;
    num_ref_frames_in_pic_order_cnt_cycle: Tuint8_t;
    max_num_ref_frames: Tuint8_t;
    reserved1: Tuint8_t;
    pic_width_in_mbs_minus1: Tuint32_t;
    pic_height_in_map_units_minus1: Tuint32_t;
    frame_crop_left_offset: Tuint32_t;
    frame_crop_right_offset: Tuint32_t;
    frame_crop_top_offset: Tuint32_t;
    frame_crop_bottom_offset: Tuint32_t;
    reserved2: Tuint32_t;
    pOffsetForRefFrame: Pint32_t;
    pScalingLists: PStdVideoH264ScalingLists;
    pSequenceParameterSetVui: PStdVideoH264SequenceParameterSetVui;
  end;
  PStdVideoH264SequenceParameterSet = ^TStdVideoH264SequenceParameterSet;

  TStdVideoH264PpsFlags =bitpacked record
    transform_8x8_mode_flag: 0..1;
    redundant_pic_cnt_present_flag: 0..1;
    constrained_intra_pred_flag: 0..1;
    deblocking_filter_control_present_flag: 0..1;
    weighted_pred_flag: 0..1;
    bottom_field_pic_order_in_frame_present_flag: 0..1;
    entropy_coding_mode_flag: 0..1;
    pic_scaling_matrix_present_flag: 0..1;
  end;
  PStdVideoH264PpsFlags = ^TStdVideoH264PpsFlags;

type
  TStdVideoH264PictureParameterSet = record
    flags: TStdVideoH264PpsFlags;
    seq_parameter_set_id: Tuint8_t;
    pic_parameter_set_id: Tuint8_t;
    num_ref_idx_l0_default_active_minus1: Tuint8_t;
    num_ref_idx_l1_default_active_minus1: Tuint8_t;
    weighted_bipred_idc: TStdVideoH264WeightedBipredIdc;
    pic_init_qp_minus26: Tint8_t;
    pic_init_qs_minus26: Tint8_t;
    chroma_qp_index_offset: Tint8_t;
    second_chroma_qp_index_offset: Tint8_t;
    pScalingLists: PStdVideoH264ScalingLists;
  end;
  PStdVideoH264PictureParameterSet = ^TStdVideoH264PictureParameterSet;

  // === Konventiert am: 6-6-26 19:13:59 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
