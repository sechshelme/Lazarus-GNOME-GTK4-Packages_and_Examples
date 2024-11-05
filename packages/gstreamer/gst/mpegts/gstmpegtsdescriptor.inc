/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 06-10-2024   17:58                        //
//                                                         //
/////////////////////////////////////////////////////////////

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
  TGstMpegtsDescriptor = record
    tag: Tguint8;
    tag_extension: Tguint8;
    length: Tguint8;
    Data: Pguint8;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstMpegtsDescriptor = ^TGstMpegtsDescriptor;

procedure gst_mpegts_descriptor_free(desc: PGstMpegtsDescriptor); cdecl; external libgstmpegts;
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
  TGstMpegtsISO639LanguageDescriptor = record
    nb_language: Tguint;
    language: array[0..63] of Pgchar;
    audio_type: array[0..63] of TGstMpegtsIso639AudioType;
  end;
  PGstMpegtsISO639LanguageDescriptor = ^TGstMpegtsISO639LanguageDescriptor;
  PPGstMpegtsISO639LanguageDescriptor = ^PGstMpegtsISO639LanguageDescriptor;

function gst_mpegts_iso_639_language_get_type: TGType; cdecl; external libgstmpegts;
procedure gst_mpegts_iso_639_language_descriptor_free(desc: PGstMpegtsISO639LanguageDescriptor); cdecl; external libgstmpegts;
function gst_mpegts_descriptor_parse_iso_639_language(descriptor: PGstMpegtsDescriptor; res: PPGstMpegtsISO639LanguageDescriptor): Tgboolean; cdecl; external libgstmpegts;
function gst_mpegts_descriptor_parse_iso_639_language_idx(descriptor: PGstMpegtsDescriptor; idx: Tguint; lang: PPgchar; audio_type: PGstMpegtsIso639AudioType): Tgboolean; cdecl; external libgstmpegts;
function gst_mpegts_descriptor_parse_iso_639_language_nb(descriptor: PGstMpegtsDescriptor): Tguint; cdecl; external libgstmpegts;
function gst_mpegts_descriptor_from_iso_639_language(language: Pgchar): PGstMpegtsDescriptor; cdecl; external libgstmpegts;
function gst_mpegts_descriptor_parse_metadata(descriptor: PGstMpegtsDescriptor; res: PPGstMpegtsMetadataDescriptor): Tgboolean; cdecl; external libgstmpegts;
function gst_mpegts_descriptor_parse_metadata_std(descriptor: PGstMpegtsDescriptor; metadata_input_leak_rate: Pguint32; metadata_buffer_size: Pguint32; metadata_output_leak_rate: Pguint32): Tgboolean; cdecl; external libgstmpegts;

type
  TGstMpegtsLogicalChannel = record
    service_id: Tguint16;
    visible_service: Tgboolean;
    logical_channel_number: Tguint16;
  end;
  PGstMpegtsLogicalChannel = ^TGstMpegtsLogicalChannel;

  TGstMpegtsLogicalChannelDescriptor = record
    nb_channels: Tguint;
    channels: array[0..63] of TGstMpegtsLogicalChannel;
  end;
  PGstMpegtsLogicalChannelDescriptor = ^TGstMpegtsLogicalChannelDescriptor;

function gst_mpegts_logical_channel_descriptor_get_type: TGType; cdecl; external libgstmpegts;
function gst_mpegts_logical_channel_get_type: TGType; cdecl; external libgstmpegts;
function gst_mpegts_descriptor_parse_logical_channel(descriptor: PGstMpegtsDescriptor; res: PGstMpegtsLogicalChannelDescriptor): Tgboolean; cdecl; external libgstmpegts;
function gst_mpegts_descriptor_from_custom(tag: Tguint8; Data: Pguint8; length: Tgsize): PGstMpegtsDescriptor; cdecl; external libgstmpegts;
function gst_mpegts_descriptor_from_custom_with_extension(tag: Tguint8; tag_extension: Tguint8; Data: Pguint8; length: Tgsize): PGstMpegtsDescriptor; cdecl; external libgstmpegts;

function GST_TYPE_MPEGTS_DESCRIPTOR: TGType;
function GST_TYPE_MPEGTS_ISO_639_LANGUAGE: TGType;
function GST_TYPE_MPEGTS_LOGICAL_CHANNEL_DESCRIPTOR: TGType;
function GST_TYPE_MPEGTS_LOGICAL_CHANNEL: TGType;

// === Konventiert am: 6-10-24 16:39:48 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_MPEGTS_DESCRIPTOR: TGType;
begin
  GST_TYPE_MPEGTS_DESCRIPTOR := gst_mpegts_descriptor_get_type;
end;

function GST_TYPE_MPEGTS_ISO_639_LANGUAGE: TGType;
begin
  GST_TYPE_MPEGTS_ISO_639_LANGUAGE := gst_mpegts_iso_639_language_get_type;
end;

function GST_TYPE_MPEGTS_LOGICAL_CHANNEL_DESCRIPTOR: TGType;
begin
  GST_TYPE_MPEGTS_LOGICAL_CHANNEL_DESCRIPTOR := gst_mpegts_logical_channel_descriptor_get_type;
end;

function GST_TYPE_MPEGTS_LOGICAL_CHANNEL: TGType;
begin
  GST_TYPE_MPEGTS_LOGICAL_CHANNEL := gst_mpegts_logical_channel_get_type;
end;


{$ENDIF read_implementation}
