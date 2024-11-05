/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 07-10-2024   14:42                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

  {#warning "The MPEG4 parsing library is unstable API and may change in future." }
  {#warning "You can define GST_USE_UNSTABLE_API to avoid this warning." }
type
  PGstMpeg4StartCode = ^TGstMpeg4StartCode;
  TGstMpeg4StartCode = longint;

const
  GST_MPEG4_VIDEO_OBJ_FIRST = $00;
  GST_MPEG4_VIDEO_OBJ_LAST = $1f;
  GST_MPEG4_VIDEO_LAYER_FIRST = $20;
  GST_MPEG4_VIDEO_LAYER_LAST = $2f;
  GST_MPEG4_VISUAL_OBJ_SEQ_START = $b0;
  GST_MPEG4_VISUAL_OBJ_SEQ_END = $b1;
  GST_MPEG4_USER_DATA = $b2;
  GST_MPEG4_GROUP_OF_VOP = $b3;
  GST_MPEG4_VIDEO_SESSION_ERR = $b4;
  GST_MPEG4_VISUAL_OBJ = $b5;
  GST_MPEG4_VIDEO_OBJ_PLANE = $b6;
  GST_MPEG4_FBA = $ba;
  GST_MPEG4_FBA_PLAN = $bb;
  GST_MPEG4_MESH = $bc;
  GST_MPEG4_MESH_PLAN = $bd;
  GST_MPEG4_STILL_TEXTURE_OBJ = $be;
  GST_MPEG4_TEXTURE_SPATIAL = $bf;
  GST_MPEG4_TEXTURE_SNR_LAYER = $c0;
  GST_MPEG4_TEXTURE_TILE = $c1;
  GST_MPEG4_SHAPE_LAYER = $c2;
  GST_MPEG4_STUFFING = $c3;
  GST_MPEG4_SYSTEM_FIRST = $c6;
  GST_MPEG4_SYSTEM_LAST = $ff;
  GST_MPEG4_RESYNC = $fff;

type
  PGstMpeg4VisualObjectType = ^TGstMpeg4VisualObjectType;
  TGstMpeg4VisualObjectType = longint;

const
  GST_MPEG4_VIDEO_ID = $01;
  GST_MPEG4_STILL_TEXTURE_ID = $02;
  GST_MPEG4_STILL_MESH_ID = $03;
  GST_MPEG4_STILL_FBA_ID = $04;
  GST_MPEG4_STILL_3D_MESH_ID = $05;

type
  PGstMpeg4AspectRatioInfo = ^TGstMpeg4AspectRatioInfo;
  TGstMpeg4AspectRatioInfo = longint;

const
  GST_MPEG4_SQUARE = $01;
  GST_MPEG4_625_TYPE_4_3 = $02;
  GST_MPEG4_525_TYPE_4_3 = $03;
  GST_MPEG4_625_TYPE_16_9 = $04;
  GST_MPEG4_525_TYPE_16_9 = $05;
  GST_MPEG4_EXTENDED_PAR = $0f;

type
  PGstMpeg4ParseResult = ^TGstMpeg4ParseResult;
  TGstMpeg4ParseResult = longint;

const
  GST_MPEG4_PARSER_OK = 0;
  GST_MPEG4_PARSER_BROKEN_DATA = 1;
  GST_MPEG4_PARSER_NO_PACKET = 2;
  GST_MPEG4_PARSER_NO_PACKET_END = 3;
  GST_MPEG4_PARSER_ERROR = 4;

type
  PGstMpeg4VideoObjectCodingType = ^TGstMpeg4VideoObjectCodingType;
  TGstMpeg4VideoObjectCodingType = longint;

const
  GST_MPEG4_I_VOP = $0;
  GST_MPEG4_P_VOP = $1;
  GST_MPEG4_B_VOP = $2;
  GST_MPEG4_S_VOP = $3;

type
  PGstMpeg4ChromaFormat = ^TGstMpeg4ChromaFormat;
  TGstMpeg4ChromaFormat = longint;

const
  GST_MPEG4_CHROMA_4_2_0 = $01;

type
  PGstMpeg4VideoObjectLayerShape = ^TGstMpeg4VideoObjectLayerShape;
  TGstMpeg4VideoObjectLayerShape = longint;

const
  GST_MPEG4_RECTANGULAR = 0;
  GST_MPEG4_BINARY = 1;
  GST_MPEG4_BINARY_ONLY = 2;
  GST_MPEG4_GRAYSCALE = 3;

type
  PGstMpeg4SpriteEnable = ^TGstMpeg4SpriteEnable;
  TGstMpeg4SpriteEnable = longint;

const
  GST_MPEG4_SPRITE_UNUSED = 0;
  GST_MPEG4_SPRITE_STATIC = 1;
  GST_MPEG4_SPRITE_GMG = 2;

type
  PGstMpeg4Profile = ^TGstMpeg4Profile;
  TGstMpeg4Profile = longint;

const
  GST_MPEG4_PROFILE_CORE = 0;
  GST_MPEG4_PROFILE_MAIN = 1;
  GST_MPEG4_PROFILE_N_BIT = 2;
  GST_MPEG4_PROFILE_SIMPLE = 3;
  GST_MPEG4_PROFILE_HYBRID = 4;
  GST_MPEG4_PROFILE_RESERVED = 5;
  GST_MPEG4_PROFILE_SIMPLE_FBA = 6;
  GST_MPEG4_PROFILE_CORE_STUDIO = 7;
  GST_MPEG4_PROFILE_SIMPLE_STUDIO = 8;
  GST_MPEG4_PROFILE_CORE_SCALABLE = 9;
  GST_MPEG4_PROFILE_ADVANCED_CORE = 10;
  GST_MPEG4_PROFILE_ADVANCED_SIMPLE = 11;
  GST_MPEG4_PROFILE_SIMPLE_SCALABLE = 12;
  GST_MPEG4_PROFILE_SCALABLE_TEXTURE = 13;
  GST_MPEG4_PROFILE_SIMPLE_FACE_ANIMATION = 14;
  GST_MPEG4_PROFILE_BASIC_ANIMATED_TEXTURE = 15;
  GST_MPEG4_PROFILE_ADVANCED_REALTIME_SIMPLE = 16;
  GST_MPEG4_PROFILE_ADVANCED_SCALABLE_TEXTURE = 17;
  GST_MPEG4_PROFILE_FINE_GRANULARITY_SCALABLE = 18;
  GST_MPEG4_PROFILE_ADVANCED_CODING_EFFICIENCY = 19;

type
  PGstMpeg4Level = ^TGstMpeg4Level;
  TGstMpeg4Level = longint;

const
  GST_MPEG4_LEVEL0 = 0;
  GST_MPEG4_LEVEL1 = 1;
  GST_MPEG4_LEVEL2 = 2;
  GST_MPEG4_LEVEL3 = 3;
  GST_MPEG4_LEVEL3b = 4;
  GST_MPEG4_LEVEL4 = 5;
  GST_MPEG4_LEVEL5 = 6;
  GST_MPEG4_LEVEL_RESERVED = 7;

type
  TGstMpeg4VisualObjectSequence = record
    profile_and_level_indication: Tguint8;
    level: TGstMpeg4Level;
    profile: TGstMpeg4Profile;
  end;
  PGstMpeg4VisualObjectSequence = ^TGstMpeg4VisualObjectSequence;

  TGstMpeg4VisualObject = record
    is_identifier: Tguint8;
    verid: Tguint8;
    priority: Tguint8;
    _type: TGstMpeg4VisualObjectType;
  end;
  PGstMpeg4VisualObject = ^TGstMpeg4VisualObject;

  TGstMpeg4VideoSignalType = record
    _type: Tguint8;
    format: Tguint8;
    range: Tguint8;
    color_description: Tguint8;
    color_primaries: Tguint8;
    transfer_characteristics: Tguint8;
    matrix_coefficients: Tguint8;
  end;
  PGstMpeg4VideoSignalType = ^TGstMpeg4VideoSignalType;

  TGstMpeg4VideoPlaneShortHdr = record
    temporal_reference: Tguint8;
    split_screen_indicator: Tguint8;
    document_camera_indicator: Tguint8;
    full_picture_freeze_release: Tguint8;
    source_format: Tguint8;
    picture_coding_type: Tguint8;
    vop_quant: Tguint8;
    pei: Tguint8;
    psupp: Tguint8;
    gob_header_empty: Tguint8;
    gob_number: Tguint8;
    gob_frame_id: Tguint8;
    quant_scale: Tguint8;
    vop_width: Tguint16;
    vop_height: Tguint16;
    num_macroblocks_in_gob: Tguint16;
    num_gobs_in_vop: Tguint8;
    size: Tguint;
  end;
  PGstMpeg4VideoPlaneShortHdr = ^TGstMpeg4VideoPlaneShortHdr;

  TGstMpeg4VideoObjectLayer = record
    random_accessible_vol: Tguint8;
    video_object_type_indication: Tguint8;
    is_object_layer_identifier: Tguint8;
    verid: Tguint8;
    priority: Tguint8;
    aspect_ratio_info: TGstMpeg4AspectRatioInfo;
    par_width: Tguint8;
    par_height: Tguint8;
    control_parameters: Tguint8;
    chroma_format: TGstMpeg4ChromaFormat;
    low_delay: Tguint8;
    vbv_parameters: Tguint8;
    first_half_bitrate: Tguint16;
    latter_half_bitrate: Tguint16;
    first_half_vbv_buffer_size: Tguint16;
    latter_half_vbv_buffer_size: Tguint16;
    first_half_vbv_occupancy: Tguint16;
    latter_half_vbv_occupancy: Tguint16;
    bit_rate: Tguint32;
    vbv_buffer_size: Tguint32;
    shape: TGstMpeg4VideoObjectLayerShape;
    shape_extension: Tguint8;
    vop_time_increment_resolution: Tguint16;
    vop_time_increment_bits: Tguint8;
    fixed_vop_rate: Tguint8;
    fixed_vop_time_increment: Tguint16;
    Width: Tguint16;
    Height: Tguint16;
    interlaced: Tguint8;
    obmc_disable: Tguint8;
    sprite_enable: TGstMpeg4SpriteEnable;
    sprite_width: Tguint16;
    sprite_height: Tguint16;
    sprite_left_coordinate: Tguint16;
    sprite_top_coordinate: Tguint16;
    no_of_sprite_warping_points: Tguint8;
    sprite_warping_accuracy: Tguint8;
    sprite_brightness_change: Tguint8;
    low_latency_sprite_enable: Tguint8;
    sadct_disable: Tguint8;
    not_8_bit: Tguint8;
    quant_precision: Tguint8;
    bits_per_pixel: Tguint8;
    no_gray_quant_update: Tguint8;
    composition_method: Tguint8;
    linear_composition: Tguint8;
    quant_type: Tguint8;
    load_intra_quant_mat: Tguint8;
    intra_quant_mat: array[0..63] of Tguint8;
    load_non_intra_quant_mat: Tguint8;
    non_intra_quant_mat: array[0..63] of Tguint8;
    quarter_sample: Tguint8;
    complexity_estimation_disable: Tguint8;
    resync_marker_disable: Tguint8;
    data_partitioned: Tguint8;
    reversible_vlc: Tguint8;
    newpred_enable: Tguint8;
    reduced_resolution_vop_enable: Tguint8;
    scalability: Tguint8;
    enhancement_type: Tguint8;
    short_hdr: TGstMpeg4VideoPlaneShortHdr;
  end;
  PGstMpeg4VideoObjectLayer = ^TGstMpeg4VideoObjectLayer;

  TGstMpeg4SpriteTrajectory = record
    vop_ref_points: array[0..62] of Tguint16;
    sprite_ref_points: array[0..62] of Tguint16;
  end;
  PGstMpeg4SpriteTrajectory = ^TGstMpeg4SpriteTrajectory;

  TGstMpeg4GroupOfVOP = record
    hours: Tguint8;
    minutes: Tguint8;
    seconds: Tguint8;
    closed: Tguint8;
    broken_link: Tguint8;
  end;
  PGstMpeg4GroupOfVOP = ^TGstMpeg4GroupOfVOP;

  TGstMpeg4VideoObjectPlane = record
    coding_type: TGstMpeg4VideoObjectCodingType;
    modulo_time_base: Tguint8;
    time_increment: Tguint16;
    coded: Tguint8;
    id: Tguint16;
    id_for_prediction_indication: Tguint8;
    id_for_prediction: Tguint16;
    Width: Tguint16;
    Height: Tguint16;
    horizontal_mc_spatial_ref: Tguint16;
    vertical_mc_spatial_ref: Tguint16;
    rounding_type: Tguint8;
    background_composition: Tguint8;
    change_conv_ratio_disable: Tguint8;
    constant_alpha: Tguint8;
    constant_alpha_value: Tguint8;
    reduced_resolution: Tguint8;
    intra_dc_vlc_thr: Tguint8;
    top_field_first: Tguint8;
    alternate_vertical_scan_flag: Tguint8;
    quant: Tguint16;
    fcode_forward: Tguint8;
    fcode_backward: Tguint8;
    shape_coding_type: Tguint8;
    load_backward_shape: Tguint8;
    ref_select_code: Tguint8;
    mb_height: Tguint16;
    mb_width: Tguint16;
    mb_num: Tguint;
    size: Tguint;
  end;
  PGstMpeg4VideoObjectPlane = ^TGstMpeg4VideoObjectPlane;

  TGstMpeg4VideoPacketHdr = record
    header_extension_code: Tguint8;
    macroblock_number: Tguint16;
    quant_scale: Tguint16;
    size: Tguint;
  end;
  PGstMpeg4VideoPacketHdr = ^TGstMpeg4VideoPacketHdr;

  TGstMpeg4Packet = record
    Data: Pguint8;
    offset: Tguint;
    size: Tgsize;
    marker_size: Tguint;
    _type: TGstMpeg4StartCode;
  end;
  PGstMpeg4Packet = ^TGstMpeg4Packet;


function gst_h263_parse(packet: PGstMpeg4Packet; Data: Pguint8; offset: Tguint; size: Tgsize): TGstMpeg4ParseResult; cdecl; external libgstcodecparsers;
function gst_mpeg4_parse(packet: PGstMpeg4Packet; skip_user_data: Tgboolean; vop: PGstMpeg4VideoObjectPlane; Data: Pguint8; offset: Tguint;
  size: Tgsize): TGstMpeg4ParseResult; cdecl; external libgstcodecparsers;
function gst_mpeg4_parse_video_object_plane(vop: PGstMpeg4VideoObjectPlane; sprite_trajectory: PGstMpeg4SpriteTrajectory; vol: PGstMpeg4VideoObjectLayer; Data: Pguint8; size: Tgsize): TGstMpeg4ParseResult; cdecl; external libgstcodecparsers;
function gst_mpeg4_parse_group_of_vop(gov: PGstMpeg4GroupOfVOP; Data: Pguint8; size: Tgsize): TGstMpeg4ParseResult; cdecl; external libgstcodecparsers;
function gst_mpeg4_parse_video_object_layer(vol: PGstMpeg4VideoObjectLayer; vo: PGstMpeg4VisualObject; Data: Pguint8; size: Tgsize): TGstMpeg4ParseResult; cdecl; external libgstcodecparsers;
function gst_mpeg4_parse_visual_object(vo: PGstMpeg4VisualObject; signal_type: PGstMpeg4VideoSignalType; Data: Pguint8; size: Tgsize): TGstMpeg4ParseResult; cdecl; external libgstcodecparsers;
function gst_mpeg4_parse_visual_object_sequence(vos: PGstMpeg4VisualObjectSequence; Data: Pguint8; size: Tgsize): TGstMpeg4ParseResult; cdecl; external libgstcodecparsers;
function gst_mpeg4_parse_video_plane_short_header(shorthdr: PGstMpeg4VideoPlaneShortHdr; Data: Pguint8; size: Tgsize): TGstMpeg4ParseResult; cdecl; external libgstcodecparsers;
function gst_mpeg4_parse_video_packet_header(videopackethdr: PGstMpeg4VideoPacketHdr; vol: PGstMpeg4VideoObjectLayer; vop: PGstMpeg4VideoObjectPlane; sprite_trajectory: PGstMpeg4SpriteTrajectory; Data: Pguint8;
  size: Tgsize): TGstMpeg4ParseResult; cdecl; external libgstcodecparsers;

// === Konventiert am: 7-10-24 11:30:07 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
