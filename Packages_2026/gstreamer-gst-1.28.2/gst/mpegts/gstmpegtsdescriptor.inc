{$IFDEF read_interface}


type
  PGstMpegtsDescriptorType = ^TGstMpegtsDescriptorType;
  TGstMpegtsDescriptorType = longint;
const
  GST_MTS_DESC_RESERVED_00 = $00;
  GST_MTS_DESC_RESERVED_01 = $01;
  GST_MTS_DESC_VIDEO_STREAM = $02;
  GST_MTS_DESC_AUDIO_STREAM = $03;
  GST_MTS_DESC_HIERARCHY = $04;
  GST_MTS_DESC_REGISTRATION = $05;
  GST_MTS_DESC_DATA_STREAM_ALIGNMENT = $06;
  GST_MTS_DESC_TARGET_BACKGROUND_GRID = $07;
  GST_MTS_DESC_VIDEO_WINDOW = $08;
  GST_MTS_DESC_CA = $09;
  GST_MTS_DESC_ISO_639_LANGUAGE = $0A;
  GST_MTS_DESC_SYSTEM_CLOCK = $0B;
  GST_MTS_DESC_MULTIPLEX_BUFFER_UTILISATION = $0C;
  GST_MTS_DESC_COPYRIGHT = $0D;
  GST_MTS_DESC_MAXIMUM_BITRATE = $0E;
  GST_MTS_DESC_PRIVATE_DATA_INDICATOR = $0F;
  GST_MTS_DESC_SMOOTHING_BUFFER = $10;
  GST_MTS_DESC_STD = $11;
  GST_MTS_DESC_IBP = $12;
  GST_MTS_DESC_DSMCC_CAROUSEL_IDENTIFIER = $13;
  GST_MTS_DESC_DSMCC_ASSOCIATION_TAG = $14;
  GST_MTS_DESC_DSMCC_DEFERRED_ASSOCIATION_TAG = $15;
  GST_MTS_DESC_DSMCC_NPT_REFERENCE = $17;
  GST_MTS_DESC_DSMCC_NPT_ENDPOINT = $18;
  GST_MTS_DESC_DSMCC_STREAM_MODE = $19;
  GST_MTS_DESC_DSMCC_STREAM_EVENT = $1A;
  GST_MTS_DESC_MPEG4_VIDEO = $1B;
  GST_MTS_DESC_MPEG4_AUDIO = $1C;
  GST_MTS_DESC_IOD = $1D;
  GST_MTS_DESC_SL = $1E;
  GST_MTS_DESC_FMC = $1F;
  GST_MTS_DESC_EXTERNAL_ES_ID = $20;
  GST_MTS_DESC_MUX_CODE = $21;
  GST_MTS_DESC_FMX_BUFFER_SIZE = $22;
  GST_MTS_DESC_MULTIPLEX_BUFFER = $23;
  GST_MTS_DESC_CONTENT_LABELING = $24;
  GST_MTS_DESC_METADATA_POINTER = $25;
  GST_MTS_DESC_METADATA = $26;
  GST_MTS_DESC_METADATA_STD = $27;
  GST_MTS_DESC_AVC_VIDEO = $28;
  GST_MTS_DESC_IPMP = $29;
  GST_MTS_DESC_AVC_TIMING_AND_HRD = $2A;
  GST_MTS_DESC_MPEG2_AAC_AUDIO = $2B;
  GST_MTS_DESC_FLEX_MUX_TIMING = $2C;
  GST_MTS_DESC_MPEG4_TEXT = $2D;
  GST_MTS_DESC_MPEG4_AUDIO_EXTENSION = $2E;
  GST_MTS_DESC_AUXILIARY_VIDEO_STREAM = $2F;
  GST_MTS_DESC_SVC_EXTENSION = $30;
  GST_MTS_DESC_MVC_EXTENSION = $31;
  GST_MTS_DESC_J2K_VIDEO = $32;
  GST_MTS_DESC_MVC_OPERATION_POINT = $33;
  GST_MTS_DESC_MPEG2_STEREOSCOPIC_VIDEO_FORMAT = $34;
  GST_MTS_DESC_STEREOSCOPIC_PROGRAM_INFO = $35;
  GST_MTS_DESC_STEREOSCOPIC_VIDEO_INFO = $36;
  GST_MTS_DESC_EXTENSION = $3f;

type
  PGstMpegtsExtendedDescriptorType = ^TGstMpegtsExtendedDescriptorType;
  TGstMpegtsExtendedDescriptorType = longint;
const
  GST_MTS_DESC_EXT_JXS_VIDEO = $14;

type
  PGstMpegtsMiscDescriptorType = ^TGstMpegtsMiscDescriptorType;
  TGstMpegtsMiscDescriptorType = longint;
const
  GST_MTS_DESC_DTG_LOGICAL_CHANNEL = $83;

type
  PGstMpegtsSCTEDescriptorType = ^TGstMpegtsSCTEDescriptorType;
  TGstMpegtsSCTEDescriptorType = longint;
const
  GST_MTS_DESC_SCTE_STUFFING = $80;
  GST_MTS_DESC_SCTE_AC3 = $81;
  GST_MTS_DESC_SCTE_FRAME_RATE = $82;
  GST_MTS_DESC_SCTE_EXTENDED_VIDEO = $83;
  GST_MTS_DESC_SCTE_COMPONENT_NAME = $84;
  GST_MTS_DESC_SCTE_FREQUENCY_SPEC = $90;
  GST_MTS_DESC_SCTE_MODULATION_PARAMS = $91;
  GST_MTS_DESC_SCTE_TRANSPORT_STREAM_ID = $92;

function gst_mpegts_descriptor_get_type: TGType; cdecl; external libgstmpegts;

type
  PGstMpegtsDescriptor = ^TGstMpegtsDescriptor;
  TGstMpegtsDescriptor = record
    tag: Tguint8;
    tag_extension: Tguint8;
    length: Tguint8;
    data: Pguint8;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

procedure gst_mpegts_descriptor_free(desc: PGstMpegtsDescriptor); cdecl; external libgstmpegts;
function gst_mpegts_descriptor_copy(desc: PGstMpegtsDescriptor): PGstMpegtsDescriptor; cdecl; external libgstmpegts;
function gst_mpegts_parse_descriptors(buffer: Pguint8; buf_len: Tgsize): PGPtrArray; cdecl; external libgstmpegts;
function gst_mpegts_find_descriptor(descriptors: PGPtrArray; tag: Tguint8): PGstMpegtsDescriptor; cdecl; external libgstmpegts;
function gst_mpegts_find_descriptor_with_extension(descriptors: PGPtrArray; tag: Tguint8; tag_extension: Tguint8): PGstMpegtsDescriptor; cdecl; external libgstmpegts;

type
  PGstMpegtsRegistrationId = ^TGstMpegtsRegistrationId;
  TGstMpegtsRegistrationId = longint;
const
  GST_MTS_REGISTRATION_0 = 0;
  GST_MTS_REGISTRATION_AC_3 = (byte('A') shl 24) or (byte('C') shl 16) or (byte('-') shl 8) or byte('3');
  GST_MTS_REGISTRATION_CUEI = (byte('C') shl 24) or (byte('U') shl 16) or (byte('E') shl 8) or byte('I');
  GST_MTS_REGISTRATION_drac = (byte('d') shl 24) or (byte('r') shl 16) or (byte('a') shl 8) or byte('c');
  GST_MTS_REGISTRATION_DTS1 = (byte('D') shl 24) or (byte('T') shl 16) or (byte('S') shl 8) or byte('1');
  GST_MTS_REGISTRATION_DTS2 = (byte('D') shl 24) or (byte('T') shl 16) or (byte('S') shl 8) or byte('2');
  GST_MTS_REGISTRATION_DTS3 = (byte('D') shl 24) or (byte('T') shl 16) or (byte('S') shl 8) or byte('3');
  GST_MTS_REGISTRATION_BSSD = (byte('B') shl 24) or (byte('S') shl 16) or (byte('S') shl 8) or byte('D');
  GST_MTS_REGISTRATION_EAC3 = (byte('E') shl 24) or (byte('A') shl 16) or (byte('C') shl 8) or byte('3');
  GST_MTS_REGISTRATION_ETV1 = (byte('E') shl 24) or (byte('T') shl 16) or (byte('V') shl 8) or byte('1');
  GST_MTS_REGISTRATION_GA94 = (byte('G') shl 24) or (byte('A') shl 16) or (byte('9') shl 8) or byte('4');
  GST_MTS_REGISTRATION_HDMV = (byte('H') shl 24) or (byte('D') shl 16) or (byte('M') shl 8) or byte('V');
  GST_MTS_REGISTRATION_KLVA = (byte('K') shl 24) or (byte('L') shl 16) or (byte('V') shl 8) or byte('A');
  GST_MTS_REGISTRATION_OPUS = (byte('O') shl 24) or (byte('P') shl 16) or (byte('U') shl 8) or byte('S');
  GST_MTS_REGISTRATION_TSHV = (byte('T') shl 24) or (byte('S') shl 16) or (byte('H') shl 8) or byte('V');
  GST_MTS_REGISTRATION_VC_1 = (byte('V') shl 24) or (byte('C') shl 16) or (byte('-') shl 8) or byte('1');
  GST_MTS_REGISTRATION_AC_4 = (byte('A') shl 24) or (byte('C') shl 16) or (byte('-') shl 8) or byte('4');
  GST_MTS_REGISTRATION_OTHER_HEVC = (byte('H') shl 24) or (byte('E') shl 16) or (byte('V') shl 8) or byte('C');

function gst_mpegts_descriptor_from_registration(format_identifier: Pgchar; additional_info: Pguint8; additional_info_length: Tgsize): PGstMpegtsDescriptor; cdecl; external libgstmpegts;
function gst_mpegts_descriptor_parse_registration(descriptor: PGstMpegtsDescriptor; registration_id: Pguint32; additional_info: PPguint8; additional_info_length: Pgsize): Tgboolean; cdecl; external libgstmpegts;
function gst_mpegts_descriptor_parse_ca(descriptor: PGstMpegtsDescriptor; ca_system_id: Pguint16; ca_pid: Pguint16; private_data: PPguint8; private_data_size: Pgsize): Tgboolean; cdecl; external libgstmpegts;

type
  PGstMpegtsIso639AudioType = ^TGstMpegtsIso639AudioType;
  TGstMpegtsIso639AudioType = longint;
const
  GST_MPEGTS_AUDIO_TYPE_UNDEFINED = 0;
  GST_MPEGTS_AUDIO_TYPE_CLEAN_EFFECTS = 1;
  GST_MPEGTS_AUDIO_TYPE_HEARING_IMPAIRED = 2;
  GST_MPEGTS_AUDIO_TYPE_VISUAL_IMPAIRED_COMMENTARY = 3;

type
  PPGstMpegtsISO639LanguageDescriptor = ^PGstMpegtsISO639LanguageDescriptor;
  PGstMpegtsISO639LanguageDescriptor = ^TGstMpegtsISO639LanguageDescriptor;
  TGstMpegtsISO639LanguageDescriptor = record
    nb_language: Tguint;
    language: array[0..63] of Pgchar;
    audio_type: array[0..63] of TGstMpegtsIso639AudioType;
  end;

function gst_mpegts_iso_639_language_get_type: TGType; cdecl; external libgstmpegts;
procedure gst_mpegts_iso_639_language_descriptor_free(desc: PGstMpegtsISO639LanguageDescriptor); cdecl; external libgstmpegts;
function gst_mpegts_descriptor_parse_iso_639_language(descriptor: PGstMpegtsDescriptor; res: PPGstMpegtsISO639LanguageDescriptor): Tgboolean; cdecl; external libgstmpegts;
function gst_mpegts_descriptor_parse_iso_639_language_idx(descriptor: PGstMpegtsDescriptor; idx: Tguint; lang: PPgchar; audio_type: PGstMpegtsIso639AudioType): Tgboolean; cdecl; external libgstmpegts;
function gst_mpegts_descriptor_parse_iso_639_language_nb(descriptor: PGstMpegtsDescriptor): Tguint; cdecl; external libgstmpegts;
function gst_mpegts_descriptor_from_iso_639_language(language: Pgchar): PGstMpegtsDescriptor; cdecl; external libgstmpegts;

type
  PGstMpegtsLogicalChannel = ^TGstMpegtsLogicalChannel;
  TGstMpegtsLogicalChannel = record
    service_id: Tguint16;
    visible_service: Tgboolean;
    logical_channel_number: Tguint16;
  end;

  PGstMpegtsLogicalChannelDescriptor = ^TGstMpegtsLogicalChannelDescriptor;
  TGstMpegtsLogicalChannelDescriptor = record
    nb_channels: Tguint;
    channels: array[0..63] of TGstMpegtsLogicalChannel;
  end;

function gst_mpegts_logical_channel_descriptor_get_type: TGType; cdecl; external libgstmpegts;
function gst_mpegts_logical_channel_get_type: TGType; cdecl; external libgstmpegts;
function gst_mpegts_descriptor_parse_logical_channel(descriptor: PGstMpegtsDescriptor; res: PGstMpegtsLogicalChannelDescriptor): Tgboolean; cdecl; external libgstmpegts;
function gst_mpegts_descriptor_from_custom(tag: Tguint8; data: Pguint8; length: Tgsize): PGstMpegtsDescriptor; cdecl; external libgstmpegts;
function gst_mpegts_descriptor_from_custom_with_extension(tag: Tguint8; tag_extension: Tguint8; data: Pguint8; length: Tgsize): PGstMpegtsDescriptor; cdecl; external libgstmpegts;

type
  PGstMpegtsMetadataFormat = ^TGstMpegtsMetadataFormat;
  TGstMpegtsMetadataFormat = longint;
const
  GST_MPEGTS_METADATA_FORMAT_TEM = $10;
  GST_MPEGTS_METADATA_FORMAT_BIM = $11;
  GST_MPEGTS_METADATA_FORMAT_APPLICATION_FORMAT = $3f;
  GST_MPEGTS_METADATA_FORMAT_IDENTIFIER_FIELD = $ff;

type
  PGstMpegtsMetadataApplicationFormat = ^TGstMpegtsMetadataApplicationFormat;
  TGstMpegtsMetadataApplicationFormat = longint;
const
  GST_MPEGTS_METADATA_APPLICATION_FORMAT_ISAN = $0010;
  GST_MPEGTS_METADATA_APPLICATION_FORMAT_VSAN = $0011;
  GST_MPEGTS_METADATA_APPLICATION_FORMAT_IDENTIFIER_FIELD = $ffff;

type
  PPGstMpegtsMetadataDescriptor = ^PGstMpegtsMetadataDescriptor;
  PGstMpegtsMetadataDescriptor = ^TGstMpegtsMetadataDescriptor;
  TGstMpegtsMetadataDescriptor = record
    metadata_application_format: TGstMpegtsMetadataApplicationFormat;
    metadata_format: TGstMpegtsMetadataFormat;
    metadata_format_identifier: Tguint32;
    metadata_service_id: Tguint8;
    decoder_config_flags: Tguint8;
    dsm_cc_flag: Tgboolean;
  end;

function gst_mpegts_metadata_descriptor_get_type: TGType; cdecl; external libgstmpegts;
function gst_mpegts_descriptor_from_metadata(metadata_descriptor: PGstMpegtsMetadataDescriptor): PGstMpegtsDescriptor; cdecl; external libgstmpegts;
function gst_mpegts_descriptor_parse_metadata(descriptor: PGstMpegtsDescriptor; res: PPGstMpegtsMetadataDescriptor): Tgboolean; cdecl; external libgstmpegts;
function gst_mpegts_descriptor_parse_metadata_std(descriptor: PGstMpegtsDescriptor; metadata_input_leak_rate: Pguint32; metadata_buffer_size: Pguint32; metadata_output_leak_rate: Pguint32): Tgboolean; cdecl; external libgstmpegts;
function gst_mpegts_pes_metadata_meta_api_get_type: TGType; cdecl; external libgstmpegts;
function gst_mpegts_pes_metadata_meta_get_info: PGstMetaInfo; cdecl; external libgstmpegts;

type
  PGstMpegtsPESMetadataMeta = ^TGstMpegtsPESMetadataMeta;
  TGstMpegtsPESMetadataMeta = record
    meta: TGstMeta;
    metadata_service_id: Tguint8;
    flags: Tguint8;
  end;

function gst_buffer_add_mpegts_pes_metadata_meta(buffer: PGstBuffer): PGstMpegtsPESMetadataMeta; cdecl; external libgstmpegts;

type
  PGstMpegtsMetadataPointerDescriptor = ^TGstMpegtsMetadataPointerDescriptor;
  TGstMpegtsMetadataPointerDescriptor = record
    metadata_application_format: TGstMpegtsMetadataApplicationFormat;
    metadata_format: TGstMpegtsMetadataFormat;
    metadata_format_identifier: Tguint32;
    metadata_service_id: Tguint8;
    program_number: Tguint16;
  end;

function gst_mpegts_metadata_pointer_descriptor_get_type: TGType; cdecl; external libgstmpegts;
function gst_mpegts_descriptor_from_metadata_pointer(metadata_pointer_descriptor: PGstMpegtsMetadataPointerDescriptor): PGstMpegtsDescriptor; cdecl; external libgstmpegts;

type
  PGstMpegtsJpegXsDescriptor = ^TGstMpegtsJpegXsDescriptor;
  TGstMpegtsJpegXsDescriptor = record
    descriptor_version: Tguint8;
    horizontal_size: Tguint16;
    vertical_size: Tguint16;
    brat: Tguint32;
    frat: Tguint32;
    schar: Tguint16;
    Ppih: Tguint16;
    Plev: Tguint16;
    max_buffer_size: Tguint32;
    buffer_model_type: Tguint8;
    colour_primaries: Tguint8;
    transfer_characteristics: Tguint8;
    matrix_coefficients: Tguint8;
    video_full_range_flag: Tgboolean;
    still_mode: Tgboolean;
    mdm_flag: Tgboolean;
    X_c0: Tguint16;
    Y_c0: Tguint16;
    X_c1: Tguint16;
    Y_c1: Tguint16;
    X_c2: Tguint16;
    Y_c2: Tguint16;
    X_wp: Tguint16;
    Y_wp: Tguint16;
    L_max: Tguint32;
    L_min: Tguint32;
    MaxCLL: Tguint16;
    MaxFALL: Tguint16;
  end;

function gst_mpegts_jpeg_xs_descriptor_get_type: TGType; cdecl; external libgstmpegts;
function gst_mpegts_descriptor_parse_jpeg_xs(descriptor: PGstMpegtsDescriptor; res: PGstMpegtsJpegXsDescriptor): Tgboolean; cdecl; external libgstmpegts;
function gst_mpegts_descriptor_from_jpeg_xs(jpegxs: PGstMpegtsJpegXsDescriptor): PGstMpegtsDescriptor; cdecl; external libgstmpegts;

// === Konventiert am: 24-7-26 11:14:37 ===

function GST_MPEGTS_REG_TO_UINT32(a, b, c, d: byte): cardinal;

function GST_TYPE_MPEGTS_DESCRIPTOR: TGType;
function GST_TYPE_MPEGTS_ISO_639_LANGUAGE: TGType;
function GST_TYPE_MPEGTS_LOGICAL_CHANNEL_DESCRIPTOR: TGType;
function GST_TYPE_MPEGTS_LOGICAL_CHANNEL: TGType;
function GST_TYPE_MPEGTS_METADATA_DESCRIPTOR: TGType;
function GST_TYPE_MPEGTS_METADATA_POINTER_DESCRIPTOR: TGType;
function GST_TYPE_MPEGTS_JPEG_XS_DESCRIPTOR: TGType;
function GST_MPEGTS_PES_METADATA_META_API_TYPE: TGType;
function GST_MPEGTS_PES_METADATA_META_INFO: PGstMetaInfo;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_MPEGTS_REG_TO_UINT32(a, b, c, d: byte): cardinal; inline;
begin
  Result := (cardinal(a) shl 24) or (cardinal(b) shl 16) or (cardinal(c) shl 8) or cardinal(d);
end;

function GST_TYPE_MPEGTS_DESCRIPTOR: TGType;
begin
  Result := gst_mpegts_descriptor_get_type;
end;

function GST_TYPE_MPEGTS_ISO_639_LANGUAGE: TGType;
begin
  Result := gst_mpegts_iso_639_language_get_type;
end;

function GST_TYPE_MPEGTS_LOGICAL_CHANNEL_DESCRIPTOR: TGType;
begin
  Result := gst_mpegts_logical_channel_descriptor_get_type;
end;

function GST_TYPE_MPEGTS_LOGICAL_CHANNEL: TGType;
begin
  Result := gst_mpegts_logical_channel_get_type;
end;

function GST_TYPE_MPEGTS_METADATA_DESCRIPTOR: TGType;
begin
  Result := gst_mpegts_metadata_descriptor_get_type;
end;

function GST_MPEGTS_PES_METADATA_META_API_TYPE: TGType;
begin
  Result := gst_mpegts_pes_metadata_meta_api_get_type;
end;

function GST_MPEGTS_PES_METADATA_META_INFO: PGstMetaInfo;
begin
  Result := gst_mpegts_pes_metadata_meta_get_info;
end;

function GST_TYPE_MPEGTS_METADATA_POINTER_DESCRIPTOR: TGType;
begin
  Result := gst_mpegts_metadata_pointer_descriptor_get_type;
end;

function GST_TYPE_MPEGTS_JPEG_XS_DESCRIPTOR: TGType;
begin
  Result := gst_mpegts_jpeg_xs_descriptor_get_type;
end;

{$ENDIF read_implementation}
