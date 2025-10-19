
{$IFDEF read_interface}

  {#warning "The Mpeg video parsing library is unstable API and may change in future." }
  {#warning "You can define GST_USE_UNSTABLE_API to avoid this warning." }
type
  PGstMpegVideoPacketTypeCode = ^TGstMpegVideoPacketTypeCode;
  TGstMpegVideoPacketTypeCode = longint;

const
  GST_MPEG_VIDEO_PACKET_PICTURE = $00;
  GST_MPEG_VIDEO_PACKET_SLICE_MIN = $01;
  GST_MPEG_VIDEO_PACKET_SLICE_MAX = $af;
  GST_MPEG_VIDEO_PACKET_USER_DATA = $b2;
  GST_MPEG_VIDEO_PACKET_SEQUENCE = $b3;
  GST_MPEG_VIDEO_PACKET_EXTENSION = $b5;
  GST_MPEG_VIDEO_PACKET_SEQUENCE_END = $b7;
  GST_MPEG_VIDEO_PACKET_GOP = $b8;
  GST_MPEG_VIDEO_PACKET_NONE = $ff;

type
  PGstMpegVideoPacketExtensionCode = ^TGstMpegVideoPacketExtensionCode;
  TGstMpegVideoPacketExtensionCode = longint;

const
  GST_MPEG_VIDEO_PACKET_EXT_SEQUENCE = $01;
  GST_MPEG_VIDEO_PACKET_EXT_SEQUENCE_DISPLAY = $02;
  GST_MPEG_VIDEO_PACKET_EXT_QUANT_MATRIX = $03;
  GST_MPEG_VIDEO_PACKET_EXT_SEQUENCE_SCALABLE = $05;
  GST_MPEG_VIDEO_PACKET_EXT_PICTURE = $08;

type
  PGstMpegVideoSequenceScalableMode = ^TGstMpegVideoSequenceScalableMode;
  TGstMpegVideoSequenceScalableMode = longint;

const
  GST_MPEG_VIDEO_SEQ_SCALABLE_MODE_DATA_PARTITIONING = $00;
  GST_MPEG_VIDEO_SEQ_SCALABLE_MODE_SPATIAL = $01;
  GST_MPEG_VIDEO_SEQ_SCALABLE_MODE_SNR = $02;
  GST_MPEG_VIDEO_SEQ_SCALABLE_MODE_TEMPORAL = $03;

type
  PGstMpegVideoLevel = ^TGstMpegVideoLevel;
  TGstMpegVideoLevel = longint;

const
  GST_MPEG_VIDEO_LEVEL_HIGH_P = $02;
  GST_MPEG_VIDEO_LEVEL_HIGH = $04;
  GST_MPEG_VIDEO_LEVEL_HIGH_1440 = $06;
  GST_MPEG_VIDEO_LEVEL_MAIN = $08;
  GST_MPEG_VIDEO_LEVEL_LOW = $0a;

type
  PGstMpegVideoProfile = ^TGstMpegVideoProfile;
  TGstMpegVideoProfile = longint;

const
  GST_MPEG_VIDEO_PROFILE_422 = $00;
  GST_MPEG_VIDEO_PROFILE_HIGH = $01;
  GST_MPEG_VIDEO_PROFILE_SPATIALLY_SCALABLE = $02;
  GST_MPEG_VIDEO_PROFILE_SNR_SCALABLE = $03;
  GST_MPEG_VIDEO_PROFILE_MAIN = $04;
  GST_MPEG_VIDEO_PROFILE_SIMPLE = $05;

type
  PGstMpegVideoChromaFormat = ^TGstMpegVideoChromaFormat;
  TGstMpegVideoChromaFormat = longint;

const
  GST_MPEG_VIDEO_CHROMA_RES = $00;
  GST_MPEG_VIDEO_CHROMA_420 = $01;
  GST_MPEG_VIDEO_CHROMA_422 = $02;
  GST_MPEG_VIDEO_CHROMA_444 = $03;

type
  PGstMpegVideoPictureType = ^TGstMpegVideoPictureType;
  TGstMpegVideoPictureType = longint;

const
  GST_MPEG_VIDEO_PICTURE_TYPE_I = $01;
  GST_MPEG_VIDEO_PICTURE_TYPE_P = $02;
  GST_MPEG_VIDEO_PICTURE_TYPE_B = $03;
  GST_MPEG_VIDEO_PICTURE_TYPE_D = $04;

type
  PGstMpegVideoPictureStructure = ^TGstMpegVideoPictureStructure;
  TGstMpegVideoPictureStructure = longint;

const
  GST_MPEG_VIDEO_PICTURE_STRUCTURE_TOP_FIELD = $01;
  GST_MPEG_VIDEO_PICTURE_STRUCTURE_BOTTOM_FIELD = $02;
  GST_MPEG_VIDEO_PICTURE_STRUCTURE_FRAME = $03;

type
  TGstMpegVideoSequenceHdr = record
    Width: Tguint16;
    Height: Tguint16;
    aspect_ratio_info: Tguint8;
    frame_rate_code: Tguint8;
    bitrate_value: Tguint32;
    vbv_buffer_size_value: Tguint16;
    constrained_parameters_flag: Tguint8;
    load_intra_quantiser_matrix: Tguint8;
    intra_quantizer_matrix: array[0..63] of Tguint8;
    load_non_intra_quantiser_matrix: Tguint8;
    non_intra_quantizer_matrix: array[0..63] of Tguint8;
    par_w: Tguint;
    par_h: Tguint;
    fps_n: Tguint;
    fps_d: Tguint;
    bitrate: Tguint;
  end;
  PGstMpegVideoSequenceHdr = ^TGstMpegVideoSequenceHdr;

  TGstMpegVideoSequenceExt = record
    profile: Tguint8;
    level: Tguint8;
    progressive: Tguint8;
    chroma_format: Tguint8;
    horiz_size_ext: Tguint8;
    vert_size_ext: Tguint8;
    bitrate_ext: Tguint16;
    vbv_buffer_size_extension: Tguint8;
    low_delay: Tguint8;
    fps_n_ext: Tguint8;
    fps_d_ext: Tguint8;
    profile_level_escape_bit: Tguint8;
  end;
  PGstMpegVideoSequenceExt = ^TGstMpegVideoSequenceExt;

  TGstMpegVideoSequenceDisplayExt = record
    video_format: Tguint8;
    colour_description_flag: Tguint8;
    colour_primaries: Tguint8;
    transfer_characteristics: Tguint8;
    matrix_coefficients: Tguint8;
    display_horizontal_size: Tguint16;
    display_vertical_size: Tguint16;
  end;
  PGstMpegVideoSequenceDisplayExt = ^TGstMpegVideoSequenceDisplayExt;

  TGstMpegVideoSequenceScalableExt = record
    scalable_mode: Tguint8;
    layer_id: Tguint8;
    lower_layer_prediction_horizontal_size: Tguint16;
    lower_layer_prediction_vertical_size: Tguint16;
    horizontal_subsampling_factor_m: Tguint8;
    horizontal_subsampling_factor_n: Tguint8;
    vertical_subsampling_factor_m: Tguint8;
    vertical_subsampling_factor_n: Tguint8;
    picture_mux_enable: Tguint8;
    mux_to_progressive_sequence: Tguint8;
    picture_mux_order: Tguint8;
    picture_mux_factor: Tguint8;
  end;
  PGstMpegVideoSequenceScalableExt = ^TGstMpegVideoSequenceScalableExt;

  TGstMpegVideoQuantMatrixExt = record
    load_intra_quantiser_matrix: Tguint8;
    intra_quantiser_matrix: array[0..63] of Tguint8;
    load_non_intra_quantiser_matrix: Tguint8;
    non_intra_quantiser_matrix: array[0..63] of Tguint8;
    load_chroma_intra_quantiser_matrix: Tguint8;
    chroma_intra_quantiser_matrix: array[0..63] of Tguint8;
    load_chroma_non_intra_quantiser_matrix: Tguint8;
    chroma_non_intra_quantiser_matrix: array[0..63] of Tguint8;
  end;
  PGstMpegVideoQuantMatrixExt = ^TGstMpegVideoQuantMatrixExt;

  TGstMpegVideoPictureHdr = record
    tsn: Tguint16;
    pic_type: Tguint8;
    vbv_delay: Tguint16;
    full_pel_forward_vector: Tguint8;
    full_pel_backward_vector: Tguint8;
    f_code: array[0..1] of array[0..1] of Tguint8;
  end;
  PGstMpegVideoPictureHdr = ^TGstMpegVideoPictureHdr;

  TGstMpegVideoPictureExt = record
    f_code: array[0..1] of array[0..1] of Tguint8;
    intra_dc_precision: Tguint8;
    picture_structure: Tguint8;
    top_field_first: Tguint8;
    frame_pred_frame_dct: Tguint8;
    concealment_motion_vectors: Tguint8;
    q_scale_type: Tguint8;
    intra_vlc_format: Tguint8;
    alternate_scan: Tguint8;
    repeat_first_field: Tguint8;
    chroma_420_type: Tguint8;
    progressive_frame: Tguint8;
    composite_display: Tguint8;
    v_axis: Tguint8;
    field_sequence: Tguint8;
    sub_carrier: Tguint8;
    burst_amplitude: Tguint8;
    sub_carrier_phase: Tguint8;
  end;
  PGstMpegVideoPictureExt = ^TGstMpegVideoPictureExt;

  TGstMpegVideoGop = record
    drop_frame_flag: Tguint8;
    hour: Tguint8;
    minute: Tguint8;
    second: Tguint8;
    frame: Tguint8;
    closed_gop: Tguint8;
    broken_link: Tguint8;
  end;
  PGstMpegVideoGop = ^TGstMpegVideoGop;

  TGstMpegVideoSliceHdr = record
    vertical_position: Tguint8;
    vertical_position_ext: Tguint8;
    priority_breakpoint: Tguint8;
    quantiser_scale_code: Tguint8;
    slice_ext_flag: Tguint8;
    intra_slice: Tguint8;
    slice_picture_id_enable: Tguint8;
    slice_picture_id: Tguint8;
    header_size: Tguint;
    mb_row: Tgint;
    mb_column: Tgint;
  end;
  PGstMpegVideoSliceHdr = ^TGstMpegVideoSliceHdr;

  TGstMpegVideoPacket = record
    Data: Pguint8;
    _type: Tguint8;
    offset: Tguint;
    size: Tgint;
  end;
  PGstMpegVideoPacket = ^TGstMpegVideoPacket;


function gst_mpeg_video_parse(packet: PGstMpegVideoPacket; Data: Pguint8; size: Tgsize; offset: Tguint): Tgboolean; cdecl; external libgstcodecparsers;
function gst_mpeg_video_packet_parse_sequence_header(packet: PGstMpegVideoPacket; seqhdr: PGstMpegVideoSequenceHdr): Tgboolean; cdecl; external libgstcodecparsers;
function gst_mpeg_video_packet_parse_sequence_extension(packet: PGstMpegVideoPacket; seqext: PGstMpegVideoSequenceExt): Tgboolean; cdecl; external libgstcodecparsers;
function gst_mpeg_video_packet_parse_sequence_display_extension(packet: PGstMpegVideoPacket; seqdisplayext: PGstMpegVideoSequenceDisplayExt): Tgboolean; cdecl; external libgstcodecparsers;
function gst_mpeg_video_packet_parse_sequence_scalable_extension(packet: PGstMpegVideoPacket; seqscaleext: PGstMpegVideoSequenceScalableExt): Tgboolean; cdecl; external libgstcodecparsers;
function gst_mpeg_video_packet_parse_picture_header(packet: PGstMpegVideoPacket; pichdr: PGstMpegVideoPictureHdr): Tgboolean; cdecl; external libgstcodecparsers;
function gst_mpeg_video_packet_parse_picture_extension(packet: PGstMpegVideoPacket; picext: PGstMpegVideoPictureExt): Tgboolean; cdecl; external libgstcodecparsers;
function gst_mpeg_video_packet_parse_gop(packet: PGstMpegVideoPacket; gop: PGstMpegVideoGop): Tgboolean; cdecl; external libgstcodecparsers;
function gst_mpeg_video_packet_parse_slice_header(packet: PGstMpegVideoPacket; slice_hdr: PGstMpegVideoSliceHdr; seq_hdr: PGstMpegVideoSequenceHdr; seqscaleext: PGstMpegVideoSequenceScalableExt): Tgboolean; cdecl; external libgstcodecparsers;
function gst_mpeg_video_packet_parse_quant_matrix_extension(packet: PGstMpegVideoPacket; quant: PGstMpegVideoQuantMatrixExt): Tgboolean; cdecl; external libgstcodecparsers;
function gst_mpeg_video_finalise_mpeg2_sequence_header(hdr: PGstMpegVideoSequenceHdr; seqext: PGstMpegVideoSequenceExt; displayext: PGstMpegVideoSequenceDisplayExt): Tgboolean; cdecl; external libgstcodecparsers;
procedure gst_mpeg_video_quant_matrix_get_raster_from_zigzag(out_quant: Pguint8; quant: Pguint8); cdecl; external libgstcodecparsers;
procedure gst_mpeg_video_quant_matrix_get_zigzag_from_raster(out_quant: Pguint8; quant: Pguint8); cdecl; external libgstcodecparsers;

function GST_MPEG_VIDEO_PACKET_IS_SLICE(typecode: longint): Tgboolean;

// === Konventiert am: 7-10-24 11:30:16 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function GST_MPEG_VIDEO_PACKET_IS_SLICE(typecode: longint): Tgboolean;
begin
  GST_MPEG_VIDEO_PACKET_IS_SLICE := (typecode >= GST_MPEG_VIDEO_PACKET_SLICE_MIN) and (typecode <= GST_MPEG_VIDEO_PACKET_SLICE_MAX);
end;


{$ENDIF read_implementation}
