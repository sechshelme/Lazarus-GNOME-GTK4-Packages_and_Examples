
{$IFDEF read_interface}

  {#warning "The VP9 parsing library is unstable API and may change in future." }
  {#warning "You can define GST_USE_UNSTABLE_API to avoid this warning." }

const
  GST_VP9_FRAME_MARKER = $02;
  GST_VP9_SYNC_CODE = $498342;
  GST_VP9_SUPERFRAME_MARKER = $06;
  GST_VP9_MAX_LOOP_FILTER = 63;
  GST_VP9_MAX_PROB = 255;
  GST_VP9_REFS_PER_FRAME = 3;
  GST_VP9_REF_FRAMES_LOG2 = 3;
  GST_VP9_REF_FRAMES = 1 shl GST_VP9_REF_FRAMES_LOG2;
  GST_VP9_FRAME_CONTEXTS_LOG2 = 2;
  GST_VP9_MAX_SHARPNESS = 7;
  GST_VP9_MAX_REF_LF_DELTAS = 4;
  GST_VP9_MAX_MODE_LF_DELTAS = 2;
  GST_VP9_SEGMENT_DELTADATA = 0;
  GST_VP9_SEGMENT_ABSDATA = 1;
  GST_VP9_MAX_SEGMENTS = 8;
  GST_VP9_SEG_TREE_PROBS = GST_VP9_MAX_SEGMENTS - 1;
  GST_VP9_PREDICTION_PROBS = 3;
  GST_VP9_MAX_FRAMES_IN_SUPERFRAME = 8;

type
  PGstVp9ParserResult = ^TGstVp9ParserResult;
  TGstVp9ParserResult = longint;

const
  GST_VP9_PARSER_OK = 0;
  GST_VP9_PARSER_BROKEN_DATA = 1;
  GST_VP9_PARSER_ERROR = 2;

type
  PGstVP9Profile = ^TGstVP9Profile;
  TGstVP9Profile = longint;

const
  GST_VP9_PROFILE_0 = 0;
  GST_VP9_PROFILE_1 = 1;
  GST_VP9_PROFILE_2 = 2;
  GST_VP9_PROFILE_3 = 3;
  GST_VP9_PROFILE_UNDEFINED = 4;

type
  PGstVp9FrameType = ^TGstVp9FrameType;
  TGstVp9FrameType = longint;

const
  GST_VP9_KEY_FRAME = 0;
  GST_VP9_INTER_FRAME = 1;

type
  PGstVp9BitDepth = ^TGstVp9BitDepth;
  TGstVp9BitDepth = longint;

const
  GST_VP9_BIT_DEPTH_8 = 8;
  GST_VP9_BIT_DEPTH_10 = 10;
  GST_VP9_BIT_DEPTH_12 = 12;

type
  PGstVp9ColorSpace = ^TGstVp9ColorSpace;
  TGstVp9ColorSpace = longint;

const
  GST_VP9_CS_UNKNOWN = 0;
  GST_VP9_CS_BT_601 = 1;
  GST_VP9_CS_BT_709 = 2;
  GST_VP9_CS_SMPTE_170 = 3;
  GST_VP9_CS_SMPTE_240 = 4;
  GST_VP9_CS_BT_2020 = 5;
  GST_VP9_CS_RESERVED_2 = 6;
  GST_VP9_CS_SRGB = 7;

type
  PGstVp9ColorRange = ^TGstVp9ColorRange;
  TGstVp9ColorRange = longint;

const
  GST_VP9_CR_LIMITED = 0;
  GST_VP9_CR_FULL = 1;

type
  PGstVp9InterpolationFilter = ^TGstVp9InterpolationFilter;
  TGstVp9InterpolationFilter = longint;

const
  GST_VP9_INTERPOLATION_FILTER_EIGHTTAP = 0;
  GST_VP9_INTERPOLATION_FILTER_EIGHTTAP_SMOOTH = 1;
  GST_VP9_INTERPOLATION_FILTER_EIGHTTAP_SHARP = 2;
  GST_VP9_INTERPOLATION_FILTER_BILINEAR = 3;
  GST_VP9_INTERPOLATION_FILTER_SWITCHABLE = 4;

type
  PGstVp9RefFrameType = ^TGstVp9RefFrameType;
  TGstVp9RefFrameType = longint;

const
  GST_VP9_REF_FRAME_INTRA = 0;
  GST_VP9_REF_FRAME_LAST = 1;
  GST_VP9_REF_FRAME_GOLDEN = 2;
  GST_VP9_REF_FRAME_ALTREF = 3;
  GST_VP9_REF_FRAME_MAX = 4;

type
  TGstVp9QuantIndices = record
    y_ac_qi: Tguint8;
    y_dc_delta: Tgint8;
    uv_dc_delta: Tgint8;
    uv_ac_delta: Tgint8;
  end;
  PGstVp9QuantIndices = ^TGstVp9QuantIndices;

  TGstVp9LoopFilter = record
    filter_level: Tgint;
    sharpness_level: Tgint;
    mode_ref_delta_enabled: Tguint8;
    mode_ref_delta_update: Tguint8;
    update_ref_deltas: array[0..(GST_VP9_MAX_REF_LF_DELTAS) - 1] of Tguint8;
    ref_deltas: array[0..(GST_VP9_MAX_REF_LF_DELTAS) - 1] of Tgint8;
    update_mode_deltas: array[0..(GST_VP9_MAX_MODE_LF_DELTAS) - 1] of Tguint8;
    mode_deltas: array[0..(GST_VP9_MAX_MODE_LF_DELTAS) - 1] of Tgint8;
  end;
  PGstVp9LoopFilter = ^TGstVp9LoopFilter;

  TGstVp9SegmentationInfoData = record
    alternate_quantizer_enabled: Tguint8;
    alternate_quantizer: Tgint16;
    alternate_loop_filter_enabled: Tguint8;
    alternate_loop_filter: Tgint8;
    reference_frame_enabled: Tguint8;
    reference_frame: Tgint;
    reference_skip: Tguint8;
  end;
  PGstVp9SegmentationInfoData = ^TGstVp9SegmentationInfoData;

  TGstVp9SegmentationInfo = record
    Enabled: Tguint8;
    update_map: Tguint8;
    update_tree_probs: array[0..(GST_VP9_SEG_TREE_PROBS) - 1] of Tguint8;
    tree_probs: array[0..(GST_VP9_SEG_TREE_PROBS) - 1] of Tguint8;
    update_pred_probs: array[0..(GST_VP9_PREDICTION_PROBS) - 1] of Tguint8;
    pred_probs: array[0..(GST_VP9_PREDICTION_PROBS) - 1] of Tguint8;
    abs_delta: Tguint8;
    temporal_update: Tguint8;
    update_data: Tguint8;
    Data: array[0..(GST_VP9_MAX_SEGMENTS) - 1] of TGstVp9SegmentationInfoData;
  end;
  PGstVp9SegmentationInfo = ^TGstVp9SegmentationInfo;

  TGstVp9FrameHdr = record
    profile: Tguint;
    show_existing_frame: Tguint8;
    frame_to_show: Tgint;
    frame_type: Tguint;
    show_frame: Tguint8;
    error_resilient_mode: Tguint8;
    Width: Tguint32;
    Height: Tguint32;
    display_size_enabled: Tguint8;
    display_width: Tguint32;
    display_height: Tguint32;
    frame_context_idx: Tguint;
    intra_only: Tguint8;
    reset_frame_context: Tgint;
    refresh_frame_flags: Tgint;
    ref_frame_indices: array[0..(GST_VP9_REFS_PER_FRAME) - 1] of Tgint;
    ref_frame_sign_bias: array[0..(GST_VP9_REFS_PER_FRAME) - 1] of Tgint;
    allow_high_precision_mv: Tgint;
    mcomp_filter_type: Tguint8;
    refresh_frame_context: Tgint;
    frame_parallel_decoding_mode: Tgint;
    loopfilter: TGstVp9LoopFilter;
    quant_indices: TGstVp9QuantIndices;
    segmentation: TGstVp9SegmentationInfo;
    log2_tile_rows: Tgint;
    log2_tile_columns: Tgint;
    first_partition_size: Tguint32;
    lossless_flag: Tguint;
    frame_header_length_in_bytes: Tguint32;
  end;
  PGstVp9FrameHdr = ^TGstVp9FrameHdr;

  TGstVp9SuperframeInfo = record
    bytes_per_framesize: Tguint32;
    frames_in_superframe: Tguint32;
    frame_sizes: array[0..(GST_VP9_MAX_FRAMES_IN_SUPERFRAME) - 1] of Tguint32;
    superframe_index_size: Tguint32;
  end;
  PGstVp9SuperframeInfo = ^TGstVp9SuperframeInfo;

  TGstVp9Segmentation = record
    filter_level: array[0..(GST_VP9_MAX_REF_LF_DELTAS) - 1] of array[0..(GST_VP9_MAX_MODE_LF_DELTAS) - 1] of Tguint8;
    luma_ac_quant_scale: Tgint16;
    luma_dc_quant_scale: Tgint16;
    chroma_ac_quant_scale: Tgint16;
    chroma_dc_quant_scale: Tgint16;
    reference_frame_enabled: Tguint8;
    reference_frame: Tgint;
    reference_skip: Tguint8;
  end;
  PGstVp9Segmentation = ^TGstVp9Segmentation;

type
  TGstVp9Parser = record
    priv: pointer;
    subsampling_x: Tgint;
    subsampling_y: Tgint;
    bit_depth: Tguint;
    color_space: Tguint;
    color_range: Tguint;
    mb_segment_tree_probs: array[0..(GST_VP9_SEG_TREE_PROBS) - 1] of Tguint8;
    segment_pred_probs: array[0..(GST_VP9_PREDICTION_PROBS) - 1] of Tguint8;
    segmentation: array[0..(GST_VP9_MAX_SEGMENTS) - 1] of TGstVp9Segmentation;
  end;
  PGstVp9Parser = ^TGstVp9Parser;

function gst_vp9_parser_new: PGstVp9Parser; cdecl; external libgstcodecparsers;
function gst_vp9_parser_parse_frame_header(parser: PGstVp9Parser; frame_hdr: PGstVp9FrameHdr; Data: Pguint8; size: Tgsize): TGstVp9ParserResult; cdecl; external libgstcodecparsers;
function gst_vp9_parser_parse_superframe_info(parser: PGstVp9Parser; superframe_info: PGstVp9SuperframeInfo; Data: Pguint8; size: Tgsize): TGstVp9ParserResult; cdecl; external libgstcodecparsers;
procedure gst_vp9_parser_free(parser: PGstVp9Parser); cdecl; external libgstcodecparsers;

// === Konventiert am: 7-10-24 11:30:35 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
