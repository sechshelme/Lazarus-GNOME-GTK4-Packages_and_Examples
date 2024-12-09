
{$IFDEF read_interface}

type
  PGstVideoAncillary = ^TGstVideoAncillary;

  TGstVideoAncillary = record
    DID: Tguint8;
    SDID_block_number: Tguint8;
    data_count: Tguint8;
    Data: array[0..255] of Tguint8;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstVideoAncillaryDID = ^TGstVideoAncillaryDID;
  TGstVideoAncillaryDID = longint;

const
  GST_VIDEO_ANCILLARY_DID_UNDEFINED = $00;
  GST_VIDEO_ANCILLARY_DID_DELETION = $80;
  GST_VIDEO_ANCILLARY_DID_HANC_3G_AUDIO_DATA_FIRST = $a0;
  GST_VIDEO_ANCILLARY_DID_HANC_3G_AUDIO_DATA_LAST = $a7;
  GST_VIDEO_ANCILLARY_DID_HANC_HDTV_AUDIO_DATA_FIRST = $e0;
  GST_VIDEO_ANCILLARY_DID_HANC_HDTV_AUDIO_DATA_LAST = $e7;
  GST_VIDEO_ANCILLARY_DID_HANC_SDTV_AUDIO_DATA_1_FIRST = $ec;
  GST_VIDEO_ANCILLARY_DID_HANC_SDTV_AUDIO_DATA_1_LAST = $ef;
  GST_VIDEO_ANCILLARY_DID_CAMERA_POSITION = $f0;
  GST_VIDEO_ANCILLARY_DID_HANC_ERROR_DETECTION = $f4;
  GST_VIDEO_ANCILLARY_DID_HANC_SDTV_AUDIO_DATA_2_FIRST = $f8;
  GST_VIDEO_ANCILLARY_DID_HANC_SDTV_AUDIO_DATA_2_LAST = $ff;


type
  PGstVideoAncillaryDID16 = ^TGstVideoAncillaryDID16;
  TGstVideoAncillaryDID16 = longint;

const
  GST_VIDEO_ANCILLARY_DID16_S334_EIA_708 = $6101;
  GST_VIDEO_ANCILLARY_DID16_S334_EIA_608 = $6102;
  GST_VIDEO_ANCILLARY_DID16_S2016_3_AFD_BAR = $4105;

type
  PGstAncillaryMetaField = ^TGstAncillaryMetaField;
  TGstAncillaryMetaField = longint;

const
  GST_ANCILLARY_META_FIELD_PROGRESSIVE = $00;
  GST_ANCILLARY_META_FIELD_INTERLACED_FIRST = $10;
  GST_ANCILLARY_META_FIELD_INTERLACED_SECOND = $11;

type
  PGstAncillaryMeta = ^TGstAncillaryMeta;

  TGstAncillaryMeta = record
    meta: TGstMeta;
    field: TGstAncillaryMetaField;
    c_not_y_channel: Tgboolean;
    line: Tguint16;
    offset: Tguint16;
    DID: Tguint16;
    SDID_block_number: Tguint16;
    data_count: Tguint16;
    Data: Pguint16;
    checksum: Tguint16;
  end;

function gst_ancillary_meta_api_get_type: TGType; cdecl; external libgstvideo;
function gst_ancillary_meta_get_info: PGstMetaInfo; cdecl; external libgstvideo;

function gst_buffer_add_ancillary_meta(buffer: PGstBuffer): PGstAncillaryMeta; cdecl; external libgstvideo;

type
  PGstVideoAFDValue = ^TGstVideoAFDValue;
  TGstVideoAFDValue = longint;

const
  GST_VIDEO_AFD_UNAVAILABLE = 0;
  GST_VIDEO_AFD_16_9_TOP_ALIGNED = 2;
  GST_VIDEO_AFD_14_9_TOP_ALIGNED = 3;
  GST_VIDEO_AFD_GREATER_THAN_16_9 = 4;
  GST_VIDEO_AFD_4_3_FULL_16_9_FULL = 8;
  GST_VIDEO_AFD_4_3_FULL_4_3_PILLAR = 9;
  GST_VIDEO_AFD_16_9_LETTER_16_9_FULL = 10;
  GST_VIDEO_AFD_14_9_LETTER_14_9_PILLAR = 11;
  GST_VIDEO_AFD_4_3_FULL_14_9_CENTER = 13;
  GST_VIDEO_AFD_16_9_LETTER_14_9_CENTER = 14;
  GST_VIDEO_AFD_16_9_LETTER_4_3_CENTER = 15;

type
  PGstVideoAFDSpec = ^TGstVideoAFDSpec;
  TGstVideoAFDSpec = longint;

const
  GST_VIDEO_AFD_SPEC_DVB_ETSI = 0;
  GST_VIDEO_AFD_SPEC_ATSC_A53 = 1;
  GST_VIDEO_AFD_SPEC_SMPTE_ST2016_1 = 2;

type
  PGstVideoAFDMeta = ^TGstVideoAFDMeta;

  TGstVideoAFDMeta = record
    meta: TGstMeta;
    field: Tguint8;
    spec: TGstVideoAFDSpec;
    afd: TGstVideoAFDValue;
  end;

function gst_video_afd_meta_api_get_type: TGType; cdecl; external libgstvideo;
function gst_video_afd_meta_get_info: PGstMetaInfo; cdecl; external libgstvideo;


function gst_buffer_add_video_afd_meta(buffer: PGstBuffer; field: Tguint8; spec: TGstVideoAFDSpec; afd: TGstVideoAFDValue): PGstVideoAFDMeta; cdecl; external libgstvideo;

type
  PGstVideoBarMeta = ^TGstVideoBarMeta;

  TGstVideoBarMeta = record
    meta: TGstMeta;
    field: Tguint8;
    is_letterbox: Tgboolean;
    bar_data1: Tguint;
    bar_data2: Tguint;
  end;

function gst_video_bar_meta_api_get_type: TGType; cdecl; external libgstvideo;
function gst_video_bar_meta_get_info: PGstMetaInfo; cdecl; external libgstvideo;


function gst_buffer_add_video_bar_meta(buffer: PGstBuffer; field: Tguint8; is_letterbox: Tgboolean; bar_data1: Tguint; bar_data2: Tguint): PGstVideoBarMeta; cdecl; external libgstvideo;

type
  PGstVideoCaptionType = ^TGstVideoCaptionType;
  TGstVideoCaptionType = longint;

const
  GST_VIDEO_CAPTION_TYPE_UNKNOWN = 0;
  GST_VIDEO_CAPTION_TYPE_CEA608_RAW = 1;
  GST_VIDEO_CAPTION_TYPE_CEA608_S334_1A = 2;
  GST_VIDEO_CAPTION_TYPE_CEA708_RAW = 3;
  GST_VIDEO_CAPTION_TYPE_CEA708_CDP = 4;

function gst_video_caption_type_from_caps(caps: PGstCaps): TGstVideoCaptionType; cdecl; external libgstvideo;
function gst_video_caption_type_to_caps(_type: TGstVideoCaptionType): PGstCaps; cdecl; external libgstvideo;

type
  PGstVideoCaptionMeta = ^TGstVideoCaptionMeta;

  TGstVideoCaptionMeta = record
    meta: TGstMeta;
    caption_type: TGstVideoCaptionType;
    Data: Pguint8;
    size: Tgsize;
  end;

function gst_video_caption_meta_api_get_type: TGType; cdecl; external libgstvideo;
function gst_video_caption_meta_get_info: PGstMetaInfo; cdecl; external libgstvideo;

function gst_buffer_add_video_caption_meta(buffer: PGstBuffer; caption_type: TGstVideoCaptionType; Data: Pguint8; size: Tgsize): PGstVideoCaptionMeta; cdecl; external libgstvideo;
function gst_video_vbi_parser_get_type: TGType; cdecl; external libgstvideo;

type
  PGstVideoVBIParserResult = ^TGstVideoVBIParserResult;
  TGstVideoVBIParserResult = longint;

const
  GST_VIDEO_VBI_PARSER_RESULT_DONE = 0;
  GST_VIDEO_VBI_PARSER_RESULT_OK = 1;
  GST_VIDEO_VBI_PARSER_RESULT_ERROR = 2;

type
  TGstVideoVBIParser = record
  end;
  PGstVideoVBIParser = ^TGstVideoVBIParser;

  TGstVideoVBIEncoder = record
  end;
  PGstVideoVBIEncoder = ^TGstVideoVBIEncoder;

function gst_video_vbi_parser_get_ancillary(parser: PGstVideoVBIParser; anc: PGstVideoAncillary): TGstVideoVBIParserResult; cdecl; external libgstvideo;
function gst_video_vbi_parser_new(format: TGstVideoFormat; pixel_width: Tguint32): PGstVideoVBIParser; cdecl; external libgstvideo;
function gst_video_vbi_parser_copy(parser: PGstVideoVBIParser): PGstVideoVBIParser; cdecl; external libgstvideo;
procedure gst_video_vbi_parser_free(parser: PGstVideoVBIParser); cdecl; external libgstvideo;
procedure gst_video_vbi_parser_add_line(parser: PGstVideoVBIParser; Data: Pguint8); cdecl; external libgstvideo;
function gst_video_vbi_encoder_get_type: TGType; cdecl; external libgstvideo;
function gst_video_vbi_encoder_new(format: TGstVideoFormat; pixel_width: Tguint32): PGstVideoVBIEncoder; cdecl; external libgstvideo;
function gst_video_vbi_encoder_copy(encoder: PGstVideoVBIEncoder): PGstVideoVBIEncoder; cdecl; external libgstvideo;
procedure gst_video_vbi_encoder_free(encoder: PGstVideoVBIEncoder); cdecl; external libgstvideo;
function gst_video_vbi_encoder_add_ancillary(encoder: PGstVideoVBIEncoder; composite: Tgboolean; DID: Tguint8; SDID_block_number: Tguint8; Data: Pguint8;
  data_count: Tguint): Tgboolean; cdecl; external libgstvideo;
procedure gst_video_vbi_encoder_write_line(encoder: PGstVideoVBIEncoder; Data: Pguint8); cdecl; external libgstvideo;

function GST_VIDEO_ANCILLARY_DID16(anc: PGstVideoAncillary): longint;
function GST_ANCILLARY_META_API_TYPE: TGType;
function GST_ANCILLARY_META_INFO: PGstMetaInfo;
function gst_buffer_get_ancillary_meta(b: PGstBuffer): PGstAncillaryMeta;
function gst_buffer_iterate_ancillary_meta(b: PGstBuffer; s: Pgpointer): PGstAncillaryMeta;
function GST_VIDEO_AFD_META_API_TYPE: TGType;
function GST_VIDEO_AFD_META_INFO: PGstMetaInfo;
function gst_buffer_get_video_afd_meta(b: PGstBuffer): PGstVideoAFDMeta;
function GST_VIDEO_BAR_META_API_TYPE: TGType;
function GST_VIDEO_BAR_META_INFO: PGstMetaInfo;
function gst_buffer_get_video_bar_meta(b: PGstBuffer): PGstVideoBarMeta;
function GST_VIDEO_CAPTION_META_API_TYPE: TGType;
function GST_VIDEO_CAPTION_META_INFO: PGstMetaInfo;
function gst_buffer_get_video_caption_meta(b: PGstBuffer): PGstVideoCaptionMeta;


// === Konventiert am: 29-9-24 13:56:15 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function GST_VIDEO_ANCILLARY_DID16(anc: PGstVideoAncillary): longint;
begin
  GST_VIDEO_ANCILLARY_DID16 := ((Tguint16(anc^.DID)) shl 8) or (Tguint16(anc^.SDID_block_number));
end;

function GST_ANCILLARY_META_API_TYPE: TGType;
begin
  GST_ANCILLARY_META_API_TYPE := gst_ancillary_meta_api_get_type;
end;

function GST_ANCILLARY_META_INFO: PGstMetaInfo;
begin
  GST_ANCILLARY_META_INFO := gst_ancillary_meta_get_info;
end;

function gst_buffer_get_ancillary_meta(b: PGstBuffer): PGstAncillaryMeta;
begin
  gst_buffer_get_ancillary_meta := PGstAncillaryMeta(gst_buffer_get_meta(b, GST_ANCILLARY_META_API_TYPE));
end;

function gst_buffer_iterate_ancillary_meta(b: PGstBuffer; s: Pgpointer): PGstAncillaryMeta;
begin
  gst_buffer_iterate_ancillary_meta := PGstAncillaryMeta(gst_buffer_iterate_meta_filtered(b, s, GST_ANCILLARY_META_API_TYPE));
end;

function GST_VIDEO_AFD_META_API_TYPE: TGType;
begin
  GST_VIDEO_AFD_META_API_TYPE := gst_video_afd_meta_api_get_type;
end;

function GST_VIDEO_AFD_META_INFO: PGstMetaInfo;
begin
  GST_VIDEO_AFD_META_INFO := gst_video_afd_meta_get_info;
end;

function gst_buffer_get_video_afd_meta(b: PGstBuffer): PGstVideoAFDMeta;
begin
  gst_buffer_get_video_afd_meta := PGstVideoAFDMeta(gst_buffer_get_meta(b, GST_VIDEO_AFD_META_API_TYPE));
end;

function GST_VIDEO_BAR_META_API_TYPE: TGType;
begin
  GST_VIDEO_BAR_META_API_TYPE := gst_video_bar_meta_api_get_type;
end;

function GST_VIDEO_BAR_META_INFO: PGstMetaInfo;
begin
  GST_VIDEO_BAR_META_INFO := gst_video_bar_meta_get_info;
end;

function gst_buffer_get_video_bar_meta(b: PGstBuffer): PGstVideoBarMeta;
begin
  gst_buffer_get_video_bar_meta := PGstVideoBarMeta(gst_buffer_get_meta(b, GST_VIDEO_BAR_META_API_TYPE));
end;

function GST_VIDEO_CAPTION_META_API_TYPE: TGType;
begin
  GST_VIDEO_CAPTION_META_API_TYPE := gst_video_caption_meta_api_get_type;
end;

function GST_VIDEO_CAPTION_META_INFO: PGstMetaInfo;
begin
  GST_VIDEO_CAPTION_META_INFO := gst_video_caption_meta_get_info;
end;

function gst_buffer_get_video_caption_meta(b: PGstBuffer): PGstVideoCaptionMeta;
begin
  gst_buffer_get_video_caption_meta := PGstVideoCaptionMeta(gst_buffer_get_meta(b, GST_VIDEO_CAPTION_META_API_TYPE));
end;


{$ENDIF read_implementation}
