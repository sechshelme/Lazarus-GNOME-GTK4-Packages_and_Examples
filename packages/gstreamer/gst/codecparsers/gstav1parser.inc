/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 07-10-2024   14:42                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

  {#warning "The AV1 parsing library is unstable API and may change in future." }
  {#warning "You can define GST_USE_UNSTABLE_API to avoid this warning." }

const
  GST_AV1_MAX_NUM_TEMPORAL_LAYERS = 8;
  GST_AV1_MAX_NUM_SPATIAL_LAYERS = 4;
  GST_AV1_MAX_TILE_WIDTH = 4096;
  GST_AV1_MAX_TILE_AREA = 4096 * 2304;
  GST_AV1_TOTAL_REFS_PER_FRAME = 8;
  GST_AV1_MAX_SEGMENTS = 8;
  GST_AV1_SEG_LVL_MAX = 8;
  GST_AV1_MAX_TILE_COLS = 64;
  GST_AV1_MAX_TILE_ROWS = 64;
  GST_AV1_REFS_PER_FRAME = 7;
  GST_AV1_PRIMARY_REF_NONE = 7;
  GST_AV1_SUPERRES_NUM = 8;
  GST_AV1_SUPERRES_DENOM_MIN = 9;
  GST_AV1_SUPERRES_DENOM_BITS = 3;
  GST_AV1_MAX_LOOP_FILTER = 63;
  GST_AV1_GM_ABS_TRANS_BITS = 12;
  GST_AV1_GM_ABS_TRANS_ONLY_BITS = 9;
  GST_AV1_GM_ABS_ALPHA_BITS = 12;
  GST_AV1_GM_ALPHA_PREC_BITS = 15;
  GST_AV1_GM_TRANS_PREC_BITS = 6;
  GST_AV1_GM_TRANS_ONLY_PREC_BITS = 3;
  GST_AV1_WARPEDMODEL_PREC_BITS = 16;
  GST_AV1_WARP_PARAM_REDUCE_BITS = 6;
  GST_AV1_SELECT_SCREEN_CONTENT_TOOLS = 2;
  GST_AV1_SELECT_INTEGER_MV = 2;
  GST_AV1_RESTORATION_TILESIZE_MAX = 256;
  GST_AV1_SEG_LVL_ALT_Q = 0;
  GST_AV1_SEG_LVL_REF_FRAME = 5;
  GST_AV1_CDEF_MAX = 1 shl 3;
  GST_AV1_MAX_TILE_COUNT = 512;
  GST_AV1_MAX_OPERATING_POINTS = GST_AV1_MAX_NUM_TEMPORAL_LAYERS * GST_AV1_MAX_NUM_SPATIAL_LAYERS;
  GST_AV1_MAX_TEMPORAL_GROUP_SIZE = 255;
  GST_AV1_MAX_TEMPORAL_GROUP_REFERENCES = 7;
  GST_AV1_MAX_NUM_Y_POINTS = 16;
  GST_AV1_MAX_NUM_CB_POINTS = 16;
  GST_AV1_MAX_NUM_CR_POINTS = 16;
  GST_AV1_MAX_NUM_POS_LUMA = 25;
  GST_AV1_MAX_NUM_PLANES = 3;
  GST_AV1_DIV_LUT_PREC_BITS = 14;
  GST_AV1_DIV_LUT_BITS = 8;
  GST_AV1_DIV_LUT_NUM = 1 shl GST_AV1_DIV_LUT_BITS;

type
  PGstAV1ParserResult = ^TGstAV1ParserResult;
  TGstAV1ParserResult = longint;

const
  GST_AV1_PARSER_OK = 0;
  GST_AV1_PARSER_NO_MORE_DATA = 1;
  GST_AV1_PARSER_DROP = 2;
  GST_AV1_PARSER_BITSTREAM_ERROR = 3;
  GST_AV1_PARSER_MISSING_OBU_REFERENCE = 4;
  GST_AV1_PARSER_INVALID_OPERATION = 5;

type
  PGstAV1Profile = ^TGstAV1Profile;
  TGstAV1Profile = longint;

const
  GST_AV1_PROFILE_0 = 0;
  GST_AV1_PROFILE_1 = 1;
  GST_AV1_PROFILE_2 = 2;
  GST_AV1_PROFILE_UNDEFINED = 3;

type
  PGstAV1OBUType = ^TGstAV1OBUType;
  TGstAV1OBUType = longint;

const
  GST_AV1_OBU_RESERVED_0 = 0;
  GST_AV1_OBU_SEQUENCE_HEADER = 1;
  GST_AV1_OBU_TEMPORAL_DELIMITER = 2;
  GST_AV1_OBU_FRAME_HEADER = 3;
  GST_AV1_OBU_TILE_GROUP = 4;
  GST_AV1_OBU_METADATA = 5;
  GST_AV1_OBU_FRAME = 6;
  GST_AV1_OBU_REDUNDANT_FRAME_HEADER = 7;
  GST_AV1_OBU_TILE_LIST = 8;
  GST_AV1_OBU_RESERVED_9 = 9;
  GST_AV1_OBU_RESERVED_10 = 10;
  GST_AV1_OBU_RESERVED_11 = 11;
  GST_AV1_OBU_RESERVED_12 = 12;
  GST_AV1_OBU_RESERVED_13 = 13;
  GST_AV1_OBU_RESERVED_14 = 14;
  GST_AV1_OBU_PADDING = 15;

type
  PGstAV1SeqLevels = ^TGstAV1SeqLevels;
  TGstAV1SeqLevels = longint;

const
  GST_AV1_SEQ_LEVEL_2_0 = 0;
  GST_AV1_SEQ_LEVEL_2_1 = 1;
  GST_AV1_SEQ_LEVEL_2_2 = 2;
  GST_AV1_SEQ_LEVEL_2_3 = 3;
  GST_AV1_SEQ_LEVEL_3_0 = 4;
  GST_AV1_SEQ_LEVEL_3_1 = 5;
  GST_AV1_SEQ_LEVEL_3_2 = 6;
  GST_AV1_SEQ_LEVEL_3_3 = 7;
  GST_AV1_SEQ_LEVEL_4_0 = 8;
  GST_AV1_SEQ_LEVEL_4_1 = 9;
  GST_AV1_SEQ_LEVEL_4_2 = 10;
  GST_AV1_SEQ_LEVEL_4_3 = 11;
  GST_AV1_SEQ_LEVEL_5_0 = 12;
  GST_AV1_SEQ_LEVEL_5_1 = 13;
  GST_AV1_SEQ_LEVEL_5_2 = 14;
  GST_AV1_SEQ_LEVEL_5_3 = 15;
  GST_AV1_SEQ_LEVEL_6_0 = 16;
  GST_AV1_SEQ_LEVEL_6_1 = 17;
  GST_AV1_SEQ_LEVEL_6_2 = 18;
  GST_AV1_SEQ_LEVEL_6_3 = 19;
  GST_AV1_SEQ_LEVEL_7_0 = 20;
  GST_AV1_SEQ_LEVEL_7_1 = 21;
  GST_AV1_SEQ_LEVEL_7_2 = 22;
  GST_AV1_SEQ_LEVEL_7_3 = 23;
  GST_AV1_SEQ_LEVELS = 24;
  GST_AV1_SEQ_LEVEL_MAX = 31;

type
  PGstAV1MetadataType = ^TGstAV1MetadataType;
  TGstAV1MetadataType = longint;

const
  GST_AV1_METADATA_TYPE_RESERVED_0 = 0;
  GST_AV1_METADATA_TYPE_HDR_CLL = 1;
  GST_AV1_METADATA_TYPE_HDR_MDCV = 2;
  GST_AV1_METADATA_TYPE_SCALABILITY = 3;
  GST_AV1_METADATA_TYPE_ITUT_T35 = 4;
  GST_AV1_METADATA_TYPE_TIMECODE = 5;

type
  PGstAV1ScalabilityModes = ^TGstAV1ScalabilityModes;
  TGstAV1ScalabilityModes = longint;

const
  GST_AV1_SCALABILITY_L1T2 = 0;
  GST_AV1_SCALABILITY_L1T3 = 1;
  GST_AV1_SCALABILITY_L2T1 = 2;
  GST_AV1_SCALABILITY_L2T2 = 3;
  GST_AV1_SCALABILITY_L2T3 = 4;
  GST_AV1_SCALABILITY_S2T1 = 5;
  GST_AV1_SCALABILITY_S2T2 = 6;
  GST_AV1_SCALABILITY_S2T3 = 7;
  GST_AV1_SCALABILITY_L2T1h = 8;
  GST_AV1_SCALABILITY_L2T2h = 9;
  GST_AV1_SCALABILITY_L2T3h = 10;
  GST_AV1_SCALABILITY_S2T1h = 11;
  GST_AV1_SCALABILITY_S2T2h = 12;
  GST_AV1_SCALABILITY_S2T3h = 13;
  GST_AV1_SCALABILITY_SS = 14;

type
  PGstAV1ColorPrimaries = ^TGstAV1ColorPrimaries;
  TGstAV1ColorPrimaries = longint;

const
  GST_AV1_CP_BT_709 = 1;
  GST_AV1_CP_UNSPECIFIED = 2;
  GST_AV1_CP_BT_470_M = 4;
  GST_AV1_CP_BT_470_B_G = 5;
  GST_AV1_CP_BT_601 = 6;
  GST_AV1_CP_SMPTE_240 = 7;
  GST_AV1_CP_GENERIC_FILM = 8;
  GST_AV1_CP_BT_2020 = 9;
  GST_AV1_CP_XYZ = 10;
  GST_AV1_CP_SMPTE_431 = 11;
  GST_AV1_CP_SMPTE_432 = 12;
  GST_AV1_CP_EBU_3213 = 22;

type
  PGstAV1TransferCharacteristics = ^TGstAV1TransferCharacteristics;
  TGstAV1TransferCharacteristics = longint;

const
  GST_AV1_TC_RESERVED_0 = 0;
  GST_AV1_TC_BT_709 = 1;
  GST_AV1_TC_UNSPECIFIED = 2;
  GST_AV1_TC_RESERVED_3 = 3;
  GST_AV1_TC_BT_470_M = 4;
  GST_AV1_TC_BT_470_B_G = 5;
  GST_AV1_TC_BT_601 = 6;
  GST_AV1_TC_SMPTE_240 = 7;
  GST_AV1_TC_LINEAR = 8;
  GST_AV1_TC_LOG_100 = 9;
  GST_AV1_TC_LOG_100_SQRT10 = 10;
  GST_AV1_TC_IEC_61966 = 11;
  GST_AV1_TC_BT_1361 = 12;
  GST_AV1_TC_SRGB = 13;
  GST_AV1_TC_BT_2020_10_BIT = 14;
  GST_AV1_TC_BT_2020_12_BIT = 15;
  GST_AV1_TC_SMPTE_2084 = 16;
  GST_AV1_TC_SMPTE_428 = 17;
  GST_AV1_TC_HLG = 18;

type
  PGstAV1MatrixCoefficients = ^TGstAV1MatrixCoefficients;
  TGstAV1MatrixCoefficients = longint;

const
  GST_AV1_MC_IDENTITY = 0;
  GST_AV1_MC_BT_709 = 1;
  GST_AV1_MC_UNSPECIFIED = 2;
  GST_AV1_MC_RESERVED_3 = 3;
  GST_AV1_MC_FCC = 4;
  GST_AV1_MC_BT_470_B_G = 5;
  GST_AV1_MC_BT_601 = 6;
  GST_AV1_MC_SMPTE_240 = 7;
  GST_AV1_MC_SMPTE_YCGCO = 8;
  GST_AV1_MC_BT_2020_NCL = 9;
  GST_AV1_MC_BT_2020_CL = 10;
  GST_AV1_MC_SMPTE_2085 = 11;
  GST_AV1_MC_CHROMAT_NCL = 12;
  GST_AV1_MC_CHROMAT_CL = 13;
  GST_AV1_MC_ICTCP = 14;

type
  PGstAV1ChromaSamplePositions = ^TGstAV1ChromaSamplePositions;
  TGstAV1ChromaSamplePositions = longint;

const
  GST_AV1_CSP_UNKNOWN = 0;
  GST_AV1_CSP_VERTICAL = 1;
  GST_AV1_CSP_COLOCATED = 2;
  GST_AV1_CSP_RESERVED = 3;

type
  PGstAV1FrameType = ^TGstAV1FrameType;
  TGstAV1FrameType = longint;

const
  GST_AV1_KEY_FRAME = 0;
  GST_AV1_INTER_FRAME = 1;
  GST_AV1_INTRA_ONLY_FRAME = 2;
  GST_AV1_SWITCH_FRAME = 3;

type
  PGstAV1InterpolationFilter = ^TGstAV1InterpolationFilter;
  TGstAV1InterpolationFilter = longint;

const
  GST_AV1_INTERPOLATION_FILTER_EIGHTTAP = 0;
  GST_AV1_INTERPOLATION_FILTER_EIGHTTAP_SMOOTH = 1;
  GST_AV1_INTERPOLATION_FILTER_EIGHTTAP_SHARP = 2;
  GST_AV1_INTERPOLATION_FILTER_BILINEAR = 3;
  GST_AV1_INTERPOLATION_FILTER_SWITCHABLE = 4;

type
  PGstAV1TXModes = ^TGstAV1TXModes;
  TGstAV1TXModes = longint;

const
  GST_AV1_TX_MODE_ONLY_4x4 = 0;
  GST_AV1_TX_MODE_LARGEST = 1;
  GST_AV1_TX_MODE_SELECT = 2;

type
  PGstAV1FrameRestorationType = ^TGstAV1FrameRestorationType;
  TGstAV1FrameRestorationType = longint;

const
  GST_AV1_FRAME_RESTORE_NONE = 0;
  GST_AV1_FRAME_RESTORE_WIENER = 1;
  GST_AV1_FRAME_RESTORE_SGRPROJ = 2;
  GST_AV1_FRAME_RESTORE_SWITCHABLE = 3;

type
  PGstAV1ReferenceFrame = ^TGstAV1ReferenceFrame;
  TGstAV1ReferenceFrame = longint;

const
  GST_AV1_REF_INTRA_FRAME = 0;
  GST_AV1_REF_LAST_FRAME = 1;
  GST_AV1_REF_LAST2_FRAME = 2;
  GST_AV1_REF_LAST3_FRAME = 3;
  GST_AV1_REF_GOLDEN_FRAME = 4;
  GST_AV1_REF_BWDREF_FRAME = 5;
  GST_AV1_REF_ALTREF2_FRAME = 6;
  GST_AV1_REF_ALTREF_FRAME = 7;
  GST_AV1_NUM_REF_FRAMES = 8;

type
  PGstAV1WarpModelType = ^TGstAV1WarpModelType;
  TGstAV1WarpModelType = longint;

const
  GST_AV1_WARP_MODEL_IDENTITY = 0;
  GST_AV1_WARP_MODEL_TRANSLATION = 1;
  GST_AV1_WARP_MODEL_ROTZOOM = 2;
  GST_AV1_WARP_MODEL_AFFINE = 3;

type
  TGstAV1OBUHeader = record
    obu_type: TGstAV1OBUType;
    obu_extention_flag: Tgboolean;
    obu_has_size_field: Tgboolean;
    obu_temporal_id: Tguint8;
    obu_spatial_id: Tguint8;
  end;
  PGstAV1OBUHeader = ^TGstAV1OBUHeader;

  TGstAV1OBU = record
    header: TGstAV1OBUHeader;
    obu_type: TGstAV1OBUType;
    Data: Pguint8;
    obu_size: Tguint32;
  end;
  PGstAV1OBU = ^TGstAV1OBU;

  TGstAV1OperatingPoint = record
    seq_level_idx: Tguint8;
    seq_tier: Tguint8;
    idc: Tguint16;
    decoder_model_present_for_this_op: Tgboolean;
    decoder_buffer_delay: Tguint8;
    encoder_buffer_delay: Tguint8;
    low_delay_mode_flag: Tgboolean;
    initial_display_delay_present_for_this_op: Tgboolean;
    initial_display_delay_minus_1: Tguint8;
  end;
  PGstAV1OperatingPoint = ^TGstAV1OperatingPoint;

  TGstAV1DecoderModelInfo = record
    buffer_delay_length_minus_1: Tguint8;
    num_units_in_decoding_tick: Tguint32;
    buffer_removal_time_length_minus_1: Tguint8;
    frame_presentation_time_length_minus_1: Tguint8;
  end;
  PGstAV1DecoderModelInfo = ^TGstAV1DecoderModelInfo;

  TGstAV1TimingInfo = record
    num_units_in_display_tick: Tguint32;
    time_scale: Tguint32;
    equal_picture_interval: Tgboolean;
    num_ticks_per_picture_minus_1: Tguint32;
  end;
  PGstAV1TimingInfo = ^TGstAV1TimingInfo;

  TGstAV1ColorConfig = record
    high_bitdepth: Tgboolean;
    twelve_bit: Tgboolean;
    mono_chrome: Tgboolean;
    color_description_present_flag: Tgboolean;
    color_primaries: TGstAV1ColorPrimaries;
    transfer_characteristics: TGstAV1TransferCharacteristics;
    matrix_coefficients: TGstAV1MatrixCoefficients;
    color_range: Tgboolean;
    subsampling_x: Tguint8;
    subsampling_y: Tguint8;
    chroma_sample_position: TGstAV1ChromaSamplePositions;
    separate_uv_delta_q: Tgboolean;
  end;
  PGstAV1ColorConfig = ^TGstAV1ColorConfig;

  TGstAV1SequenceHeaderOBU = record
    seq_profile: TGstAV1Profile;
    still_picture: Tgboolean;
    reduced_still_picture_header: Tguint8;
    frame_width_bits_minus_1: Tguint8;
    frame_height_bits_minus_1: Tguint8;
    max_frame_width_minus_1: Tguint16;
    max_frame_height_minus_1: Tguint16;
    frame_id_numbers_present_flag: Tgboolean;
    delta_frame_id_length_minus_2: Tguint8;
    additional_frame_id_length_minus_1: Tguint8;
    use_128x128_superblock: Tgboolean;
    enable_filter_intra: Tgboolean;
    enable_intra_edge_filter: Tgboolean;
    enable_interintra_compound: Tgboolean;
    enable_masked_compound: Tgboolean;
    enable_warped_motion: Tgboolean;
    enable_order_hint: Tgboolean;
    enable_dual_filter: Tgboolean;
    enable_jnt_comp: Tgboolean;
    enable_ref_frame_mvs: Tgboolean;
    seq_choose_screen_content_tools: Tgboolean;
    seq_force_screen_content_tools: Tguint8;
    seq_choose_integer_mv: Tgboolean;
    seq_force_integer_mv: Tguint8;
    order_hint_bits_minus_1: Tgint8;
    enable_superres: Tgboolean;
    enable_cdef: Tgboolean;
    enable_restoration: Tgboolean;
    film_grain_params_present: Tguint8;
    operating_points_cnt_minus_1: Tguint8;
    operating_points: array[0..(GST_AV1_MAX_OPERATING_POINTS) - 1] of TGstAV1OperatingPoint;
    decoder_model_info_present_flag: Tgboolean;
    decoder_model_info: TGstAV1DecoderModelInfo;
    initial_display_delay_present_flag: Tguint8;
    timing_info_present_flag: Tgboolean;
    timing_info: TGstAV1TimingInfo;
    color_config: TGstAV1ColorConfig;
    order_hint_bits: Tguint8;
    bit_depth: Tguint8;
    num_planes: Tguint8;
  end;
  PGstAV1SequenceHeaderOBU = ^TGstAV1SequenceHeaderOBU;

  TGstAV1MetadataITUT_T35 = record
    itu_t_t35_country_code: Tguint8;
    itu_t_t35_country_code_extention_byte: Tguint8;
    itu_t_t35_payload_bytes: Pguint8;
  end;
  PGstAV1MetadataITUT_T35 = ^TGstAV1MetadataITUT_T35;

  TGstAV1MetadataHdrCll = record
    max_cll: Tguint16;
    max_fall: Tguint16;
  end;
  PGstAV1MetadataHdrCll = ^TGstAV1MetadataHdrCll;

  TGstAV1MetadataHdrMdcv = record
    primary_chromaticity_x: array[0..2] of Tguint16;
    primary_chromaticity_y: array[0..2] of Tguint16;
    white_point_chromaticity_x: Tguint16;
    white_point_chromaticity_y: Tguint16;
    luminance_max: Tguint32;
    luminance_min: Tguint32;
  end;
  PGstAV1MetadataHdrMdcv = ^TGstAV1MetadataHdrMdcv;

  TGstAV1MetadataScalability = record
    scalability_mode_idc: TGstAV1ScalabilityModes;
    spatial_layers_cnt_minus_1: Tguint8;
    spatial_layer_dimensions_present_flag: Tgboolean;
    spatial_layer_description_present_flag: Tgboolean;
    temporal_group_description_present_flag: Tgboolean;
    spatial_layer_max_width: array[0..(GST_AV1_MAX_NUM_SPATIAL_LAYERS) - 1] of Tguint16;
    spatial_layer_max_height: array[0..(GST_AV1_MAX_NUM_SPATIAL_LAYERS) - 1] of Tguint16;
    spatial_layer_ref_id: array[0..(GST_AV1_MAX_NUM_SPATIAL_LAYERS) - 1] of Tguint8;
    temporal_group_size: Tguint8;
    temporal_group_temporal_id: array[0..(GST_AV1_MAX_TEMPORAL_GROUP_SIZE) - 1] of Tguint8;
    temporal_group_temporal_switching_up_point_flag: array[0..(GST_AV1_MAX_TEMPORAL_GROUP_SIZE) - 1] of Tguint8;
    temporal_group_spatial_switching_up_point_flag: array[0..(GST_AV1_MAX_TEMPORAL_GROUP_SIZE) - 1] of Tguint8;
    temporal_group_ref_cnt: array[0..(GST_AV1_MAX_TEMPORAL_GROUP_SIZE) - 1] of Tguint8;
    temporal_group_ref_pic_diff: array[0..(GST_AV1_MAX_TEMPORAL_GROUP_SIZE) - 1] of array[0..(GST_AV1_MAX_TEMPORAL_GROUP_REFERENCES) - 1] of Tguint8;
  end;
  PGstAV1MetadataScalability = ^TGstAV1MetadataScalability;

  TGstAV1MetadataTimecode = record
    counting_type: Tguint8;
    full_timestamp_flag: Tgboolean;
    discontinuity_flag: Tgboolean;
    cnt_dropped_flag: Tgboolean;
    n_frames: Tguint8;
    seconds_flag: Tgboolean;
    seconds_value: Tguint8;
    minutes_flag: Tgboolean;
    minutes_value: Tguint8;
    hours_flag: Tgboolean;
    hours_value: Tguint8;
    time_offset_length: Tguint8;
    time_offset_value: Tguint32;
  end;
  PGstAV1MetadataTimecode = ^TGstAV1MetadataTimecode;

  TGstAV1MetadataOBU = record
    metadata_type: TGstAV1MetadataType;
    uni: record
      case longint of
        0: (itut_t35: TGstAV1MetadataITUT_T35);
        1: (hdr_cll: TGstAV1MetadataHdrCll);
        2: (hdr_mdcv: TGstAV1MetadataHdrMdcv);
        3: (scalability: TGstAV1MetadataScalability);
        4: (timecode: TGstAV1MetadataTimecode);
      end;
  end;
  PGstAV1MetadataOBU = ^TGstAV1MetadataOBU;

  TGstAV1LoopFilterParams = record
    loop_filter_level: array[0..3] of Tguint8;
    loop_filter_sharpness: Tguint8;
    loop_filter_delta_enabled: Tgboolean;
    loop_filter_delta_update: Tgboolean;
    loop_filter_ref_deltas: array[0..(GST_AV1_TOTAL_REFS_PER_FRAME) - 1] of Tgint8;
    loop_filter_mode_deltas: array[0..1] of Tgint8;
    delta_lf_present: Tgboolean;
    delta_lf_res: Tguint8;
    delta_lf_multi: Tguint8;
  end;
  PGstAV1LoopFilterParams = ^TGstAV1LoopFilterParams;

  TGstAV1QuantizationParams = record
    base_q_idx: Tguint8;
    diff_uv_delta: Tgboolean;
    using_qmatrix: Tgboolean;
    qm_y: Tguint8;
    qm_u: Tguint8;
    qm_v: Tguint8;
    delta_q_present: Tgboolean;
    delta_q_res: Tguint8;
    delta_q_y_dc: Tgint8;
    delta_q_u_dc: Tgint8;
    delta_q_u_ac: Tgint8;
    delta_q_v_dc: Tgint8;
    delta_q_v_ac: Tgint8;
  end;
  PGstAV1QuantizationParams = ^TGstAV1QuantizationParams;

  TGstAV1SegmenationParams = record
    segmentation_enabled: Tgboolean;
    segmentation_update_map: Tguint8;
    segmentation_temporal_update: Tguint8;
    segmentation_update_data: Tguint8;
    feature_enabled: array[0..(GST_AV1_MAX_SEGMENTS) - 1] of array[0..(GST_AV1_SEG_LVL_MAX) - 1] of Tgint8;
    feature_data: array[0..(GST_AV1_MAX_SEGMENTS) - 1] of array[0..(GST_AV1_SEG_LVL_MAX) - 1] of Tgint16;
    seg_id_pre_skip: Tguint8;
    last_active_seg_id: Tguint8;
  end;
  PGstAV1SegmenationParams = ^TGstAV1SegmenationParams;

  TGstAV1TileInfo = record
    uniform_tile_spacing_flag: Tguint8;
    increment_tile_rows_log2: Tgint;
    width_in_sbs_minus_1: array[0..(GST_AV1_MAX_TILE_COLS) - 1] of Tgint;
    height_in_sbs_minus_1: array[0..(GST_AV1_MAX_TILE_ROWS) - 1] of Tgint;
    tile_size_bytes_minus_1: Tgint;
    context_update_tile_id: Tguint8;
    mi_col_starts: array[0..(GST_AV1_MAX_TILE_COLS + 1) - 1] of Tguint32;
    mi_row_starts: array[0..(GST_AV1_MAX_TILE_ROWS + 1) - 1] of Tguint32;
    tile_cols_log2: Tguint8;
    tile_cols: Tguint8;
    tile_rows_log2: Tguint8;
    tile_rows: Tguint8;
    tile_size_bytes: Tguint8;
  end;
  PGstAV1TileInfo = ^TGstAV1TileInfo;

  TGstAV1CDEFParams = record
    cdef_damping: Tguint8;
    cdef_bits: Tguint8;
    cdef_y_pri_strength: array[0..(GST_AV1_CDEF_MAX) - 1] of Tguint8;
    cdef_y_sec_strength: array[0..(GST_AV1_CDEF_MAX) - 1] of Tguint8;
    cdef_uv_pri_strength: array[0..(GST_AV1_CDEF_MAX) - 1] of Tguint8;
    cdef_uv_sec_strength: array[0..(GST_AV1_CDEF_MAX) - 1] of Tguint8;
  end;
  PGstAV1CDEFParams = ^TGstAV1CDEFParams;

  TGstAV1LoopRestorationParams = record
    lr_unit_shift: Tguint8;
    lr_uv_shift: Tgboolean;
    frame_restoration_type: array[0..(GST_AV1_MAX_NUM_PLANES) - 1] of TGstAV1FrameRestorationType;
    loop_restoration_size: array[0..(GST_AV1_MAX_NUM_PLANES) - 1] of Tguint32;
    uses_lr: Tguint8;
  end;
  PGstAV1LoopRestorationParams = ^TGstAV1LoopRestorationParams;

  TGstAV1GlobalMotionParams = record
    is_global: array[0..(GST_AV1_NUM_REF_FRAMES) - 1] of Tgboolean;
    is_rot_zoom: array[0..(GST_AV1_NUM_REF_FRAMES) - 1] of Tgboolean;
    is_translation: array[0..(GST_AV1_NUM_REF_FRAMES) - 1] of Tgboolean;
    gm_params: array[0..(GST_AV1_NUM_REF_FRAMES) - 1] of array[0..5] of Tgint32;
    gm_type: array[0..(GST_AV1_NUM_REF_FRAMES) - 1] of TGstAV1WarpModelType;
    invalid: array[0..(GST_AV1_NUM_REF_FRAMES) - 1] of Tgboolean;
  end;
  PGstAV1GlobalMotionParams = ^TGstAV1GlobalMotionParams;

  TGstAV1FilmGrainParams = record
    apply_grain: Tgboolean;
    grain_seed: Tguint16;
    update_grain: Tgboolean;
    film_grain_params_ref_idx: Tguint8;
    num_y_points: Tguint8;
    point_y_value: array[0..(GST_AV1_MAX_NUM_Y_POINTS) - 1] of Tguint8;
    point_y_scaling: array[0..(GST_AV1_MAX_NUM_Y_POINTS) - 1] of Tguint8;
    chroma_scaling_from_luma: Tguint8;
    num_cb_points: Tguint8;
    point_cb_value: array[0..(GST_AV1_MAX_NUM_CB_POINTS) - 1] of Tguint8;
    point_cb_scaling: array[0..(GST_AV1_MAX_NUM_CB_POINTS) - 1] of Tguint8;
    num_cr_points: Tguint8;
    point_cr_value: array[0..(GST_AV1_MAX_NUM_CR_POINTS) - 1] of Tguint8;
    point_cr_scaling: array[0..(GST_AV1_MAX_NUM_CR_POINTS) - 1] of Tguint8;
    grain_scaling_minus_8: Tguint8;
    ar_coeff_lag: Tguint8;
    ar_coeffs_y_plus_128: array[0..(GST_AV1_MAX_NUM_POS_LUMA) - 1] of Tguint8;
    ar_coeffs_cb_plus_128: array[0..(GST_AV1_MAX_NUM_POS_LUMA) - 1] of Tguint8;
    ar_coeffs_cr_plus_128: array[0..(GST_AV1_MAX_NUM_POS_LUMA) - 1] of Tguint8;
    ar_coeff_shift_minus_6: Tguint8;
    grain_scale_shift: Tguint8;
    cb_mult: Tguint8;
    cb_luma_mult: Tguint8;
    cb_offset: Tguint16;
    cr_mult: Tguint8;
    cr_luma_mult: Tguint8;
    cr_offset: Tguint16;
    overlap_flag: Tgboolean;
    clip_to_restricted_range: Tgboolean;
  end;
  PGstAV1FilmGrainParams = ^TGstAV1FilmGrainParams;

  TGstAV1FrameHeaderOBU = record
    show_existing_frame: Tgboolean;
    frame_to_show_map_idx: Tgint8;
    frame_presentation_time: Tguint32;
    tu_presentation_delay: Tguint32;
    display_frame_id: Tguint32;
    frame_type: TGstAV1FrameType;
    show_frame: Tgboolean;
    showable_frame: Tgboolean;
    error_resilient_mode: Tgboolean;
    disable_cdf_update: Tgboolean;
    allow_screen_content_tools: Tguint8;
    force_integer_mv: Tgboolean;
    current_frame_id: Tguint32;
    frame_size_override_flag: Tgboolean;
    order_hint: Tguint32;
    primary_ref_frame: Tguint8;
    buffer_removal_time_present_flag: Tgboolean;
    buffer_removal_time: array[0..(GST_AV1_MAX_OPERATING_POINTS) - 1] of Tguint32;
    refresh_frame_flags: Tguint8;
    ref_order_hint: array[0..(GST_AV1_NUM_REF_FRAMES) - 1] of Tguint32;
    allow_intrabc: Tgboolean;
    frame_refs_short_signaling: Tgboolean;
    last_frame_idx: Tgint8;
    gold_frame_idx: Tgint8;
    ref_frame_idx: array[0..(GST_AV1_REFS_PER_FRAME) - 1] of Tgint8;
    allow_high_precision_mv: Tgboolean;
    is_motion_mode_switchable: Tgboolean;
    use_ref_frame_mvs: Tgboolean;
    disable_frame_end_update_cdf: Tgboolean;
    allow_warped_motion: Tgboolean;
    reduced_tx_set: Tgboolean;
    render_and_frame_size_different: Tgboolean;
    use_superres: Tgboolean;
    is_filter_switchable: Tgboolean;
    interpolation_filter: TGstAV1InterpolationFilter;
    loop_filter_params: TGstAV1LoopFilterParams;
    quantization_params: TGstAV1QuantizationParams;
    segmentation_params: TGstAV1SegmenationParams;
    tile_info: TGstAV1TileInfo;
    cdef_params: TGstAV1CDEFParams;
    loop_restoration_params: TGstAV1LoopRestorationParams;
    tx_mode_select: Tgboolean;
    skip_mode_present: Tgboolean;
    reference_select: Tgboolean;
    global_motion_params: TGstAV1GlobalMotionParams;
    film_grain_params: TGstAV1FilmGrainParams;
    superres_denom: Tguint32;
    frame_is_intra: Tguint8;
    order_hints: array[0..(GST_AV1_NUM_REF_FRAMES) - 1] of Tguint32;
    ref_frame_sign_bias: array[0..(GST_AV1_NUM_REF_FRAMES) - 1] of Tguint32;
    coded_lossless: Tguint8;
    all_lossless: Tguint8;
    lossless_array: array[0..(GST_AV1_MAX_SEGMENTS) - 1] of Tguint8;
    seg_qm_Level: array[0..2] of array[0..(GST_AV1_MAX_SEGMENTS) - 1] of Tguint8;
    upscaled_width: Tguint32;
    frame_width: Tguint32;
    frame_height: Tguint32;
    render_width: Tguint32;
    render_height: Tguint32;
    tx_mode: TGstAV1TXModes;
    skip_mode_frame: array[0..1] of Tguint8;
    expected_frame_id: array[0..(GST_AV1_REFS_PER_FRAME) - 1] of Tgint32;
    ref_global_motion_params: TGstAV1GlobalMotionParams;
  end;
  PGstAV1FrameHeaderOBU = ^TGstAV1FrameHeaderOBU;

  TGstAV1ReferenceFrameInfo = record
    entry: array[0..(GST_AV1_NUM_REF_FRAMES) - 1] of record
      ref_valid: Tgboolean;
      ref_frame_id: Tguint32;
      ref_upscaled_width: Tguint32;
      ref_frame_width: Tguint32;
      ref_frame_height: Tguint32;
      ref_render_width: Tguint32;
      ref_render_height: Tguint32;
      ref_mi_cols: Tguint32;
      ref_mi_rows: Tguint32;
      ref_frame_type: TGstAV1FrameType;
      ref_subsampling_x: Tguint8;
      ref_subsampling_y: Tguint8;
      ref_bit_depth: Tguint8;
      ref_order_hint: Tguint32;
      ref_segmentation_params: TGstAV1SegmenationParams;
      ref_global_motion_params: TGstAV1GlobalMotionParams;
      ref_lf_params: TGstAV1LoopFilterParams;
      ref_film_grain_params: TGstAV1FilmGrainParams;
      ref_tile_info: TGstAV1TileInfo;
      end;
  end;
  PGstAV1ReferenceFrameInfo = ^TGstAV1ReferenceFrameInfo;

  TGstAV1TileListOBU = record
    output_frame_width_in_tiles_minus_1: Tguint8;
    output_frame_height_in_tiles_minus_1: Tguint8;
    tile_count_minus_1: Tguint16;
    entry: array[0..(GST_AV1_MAX_TILE_COUNT) - 1] of record
      anchor_frame_idx: Tgint8;
      anchor_tile_row: Tguint8;
      anchor_tile_col: Tguint8;
      tile_data_size_minus_1: Tguint16;
      coded_tile_data: Pguint8;
      end;
  end;
  PGstAV1TileListOBU = ^TGstAV1TileListOBU;

  TGstAV1TileGroupOBU = record
    tile_start_and_end_present_flag: Tgboolean;
    tg_start: Tguint8;
    tg_end: Tguint8;
    entry: array[0..(GST_AV1_MAX_TILE_COUNT) - 1] of record
      tile_offset: Tguint32;
      tile_size: Tguint32;
      tile_row: Tguint32;
      tile_col: Tguint32;
      mi_row_start: Tguint32;
      mi_row_end: Tguint32;
      mi_col_start: Tguint32;
      mi_col_end: Tguint32;
      end;
    num_tiles: Tguint32;
  end;
  PGstAV1TileGroupOBU = ^TGstAV1TileGroupOBU;

  TGstAV1FrameOBU = record
    tile_group: TGstAV1TileGroupOBU;
    frame_header: TGstAV1FrameHeaderOBU;
  end;
  PGstAV1FrameOBU = ^TGstAV1FrameOBU;

  TGstAV1Parser = record
    state: record
      operating_point: Tguint32;
      seen_frame_header: Tguint8;
      operating_point_idc: Tguint32;
      sequence_changed: Tgboolean;
      begin_first_frame: Tgboolean;
      upscaled_width: Tguint32;
      frame_width: Tguint32;
      frame_height: Tguint32;
      mi_cols: Tguint32;
      mi_rows: Tguint32;
      render_width: Tguint32;
      render_height: Tguint32;
      prev_frame_id: Tguint32;
      current_frame_id: Tguint32;
      ref_info: TGstAV1ReferenceFrameInfo;
      mi_col_starts: array[0..(GST_AV1_MAX_TILE_COLS + 1) - 1] of Tguint32;
      mi_row_starts: array[0..(GST_AV1_MAX_TILE_ROWS + 1) - 1] of Tguint32;
      tile_cols_log2: Tguint8;
      tile_cols: Tguint8;
      tile_rows_log2: Tguint8;
      tile_rows: Tguint8;
      tile_size_bytes: Tguint8;
      end;
    annex_b: Tgboolean;
    temporal_unit_size: Tguint32;
    temporal_unit_consumed: Tguint32;
    frame_unit_size: Tguint32;
    frame_unit_consumed: Tguint32;
    seq_header: PGstAV1SequenceHeaderOBU;
  end;
  PGstAV1Parser = ^TGstAV1Parser;


procedure gst_av1_parser_reset(parser: PGstAV1Parser; annex_b: Tgboolean); cdecl; external libgstcodecparsers;
procedure gst_av1_parser_reset_annex_b(parser: PGstAV1Parser); cdecl; external libgstcodecparsers;
function gst_av1_parser_identify_one_obu(parser: PGstAV1Parser; Data: Pguint8; size: Tguint32; obu: PGstAV1OBU; consumed: Pguint32): TGstAV1ParserResult; cdecl; external libgstcodecparsers;
function gst_av1_parser_parse_sequence_header_obu(parser: PGstAV1Parser; obu: PGstAV1OBU; seq_header: PGstAV1SequenceHeaderOBU): TGstAV1ParserResult; cdecl; external libgstcodecparsers;
function gst_av1_parser_parse_temporal_delimiter_obu(parser: PGstAV1Parser; obu: PGstAV1OBU): TGstAV1ParserResult; cdecl; external libgstcodecparsers;
function gst_av1_parser_parse_metadata_obu(parser: PGstAV1Parser; obu: PGstAV1OBU; metadata: PGstAV1MetadataOBU): TGstAV1ParserResult; cdecl; external libgstcodecparsers;
function gst_av1_parser_parse_tile_list_obu(parser: PGstAV1Parser; obu: PGstAV1OBU; tile_list: PGstAV1TileListOBU): TGstAV1ParserResult; cdecl; external libgstcodecparsers;
function gst_av1_parser_parse_tile_group_obu(parser: PGstAV1Parser; obu: PGstAV1OBU; tile_group: PGstAV1TileGroupOBU): TGstAV1ParserResult; cdecl; external libgstcodecparsers;
function gst_av1_parser_parse_frame_header_obu(parser: PGstAV1Parser; obu: PGstAV1OBU; frame_header: PGstAV1FrameHeaderOBU): TGstAV1ParserResult; cdecl; external libgstcodecparsers;
function gst_av1_parser_parse_frame_obu(parser: PGstAV1Parser; obu: PGstAV1OBU; frame: PGstAV1FrameOBU): TGstAV1ParserResult; cdecl; external libgstcodecparsers;
function gst_av1_parser_reference_frame_update(parser: PGstAV1Parser; frame_header: PGstAV1FrameHeaderOBU): TGstAV1ParserResult; cdecl; external libgstcodecparsers;
function gst_av1_parser_set_operating_point(parser: PGstAV1Parser; operating_point: Tgint32): TGstAV1ParserResult; cdecl; external libgstcodecparsers;
function gst_av1_parser_new: PGstAV1Parser; cdecl; external libgstcodecparsers;
procedure gst_av1_parser_free(parser: PGstAV1Parser); cdecl; external libgstcodecparsers;

// === Konventiert am: 7-10-24 11:29:46 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
