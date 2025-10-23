
{$IFDEF read_interface}

function gst_mpegts_section_get_type: TGType; cdecl; external libgstmpegts;

type
  PGstMpegtsSectionType = ^TGstMpegtsSectionType;
  TGstMpegtsSectionType = longint;

const
  GST_MPEGTS_SECTION_UNKNOWN = 0;
  GST_MPEGTS_SECTION_PAT = 1;
  GST_MPEGTS_SECTION_PMT = 2;
  GST_MPEGTS_SECTION_CAT = 3;
  GST_MPEGTS_SECTION_TSDT = 4;
  GST_MPEGTS_SECTION_EIT = 5;
  GST_MPEGTS_SECTION_NIT = 6;
  GST_MPEGTS_SECTION_BAT = 7;
  GST_MPEGTS_SECTION_SDT = 8;
  GST_MPEGTS_SECTION_TDT = 9;
  GST_MPEGTS_SECTION_TOT = 10;
  GST_MPEGTS_SECTION_SIT = 11;
  GST_MPEGTS_SECTION_ATSC_TVCT = 12;
  GST_MPEGTS_SECTION_ATSC_CVCT = 13;
  GST_MPEGTS_SECTION_ATSC_MGT = 14;
  GST_MPEGTS_SECTION_ATSC_ETT = 15;
  GST_MPEGTS_SECTION_ATSC_EIT = 16;
  GST_MPEGTS_SECTION_ATSC_STT = 17;
  GST_MPEGTS_SECTION_ATSC_RRT = 18;
  GST_MPEGTS_SECTION_SCTE_SIT = 19;

type
  PGstMpegtsSectionTableID = ^TGstMpegtsSectionTableID;
  TGstMpegtsSectionTableID = longint;

const
  GST_MTS_TABLE_ID_PROGRAM_ASSOCIATION = $00;
  GST_MTS_TABLE_ID_CONDITIONAL_ACCESS = $01;
  GST_MTS_TABLE_ID_TS_PROGRAM_MAP = $02;
  GST_MTS_TABLE_ID_TS_DESCRIPTION = $03;
  GST_MTS_TABLE_ID_14496_SCENE_DESCRIPTION = $04;
  GST_MTS_TABLE_ID_14496_OBJET_DESCRIPTOR = $05;
  GST_MTS_TABLE_ID_METADATA = $06;
  GST_MTS_TABLE_ID_IPMP_CONTROL_INFORMATION = $07;
  GST_MTS_TABLE_ID_14496_SECTION = $08;
  GST_MTS_TABLE_ID_23001_11_SECTION = $09;
  GST_MTS_TABLE_ID_23001_10_SECTION = $0A;
  GST_MTS_TABLE_ID_DSM_CC_MULTIPROTO_ENCAPSULATED_DATA = $3A;
  GST_MTS_TABLE_ID_DSM_CC_U_N_MESSAGES = $3B;
  GST_MTS_TABLE_ID_DSM_CC_DOWNLOAD_DATA_MESSAGES = $3C;
  GST_MTS_TABLE_ID_DSM_CC_STREAM_DESCRIPTORS = $3D;
  GST_MTS_TABLE_ID_DSM_CC_PRIVATE_DATA = $3E;
  GST_MTS_TABLE_ID_DSM_CC_ADDRESSABLE_SECTIONS = $3F;
  GST_MTS_TABLE_ID_UNSET = $FF;

type
  PGstMpegtsSection = ^TGstMpegtsSection;
  TGstMpegtsPacketizeFunc = function(section: PGstMpegtsSection): Tgboolean; cdecl;

  TGstMpegtsSection = record
    parent: TGstMiniObject;
    section_type: TGstMpegtsSectionType;
    pid: Tguint16;
    table_id: Tguint8;
    subtable_extension: Tguint16;
    version_number: Tguint8;
    current_next_indicator: Tgboolean;
    section_number: Tguint8;
    last_section_number: Tguint8;
    crc: Tguint32;
    Data: Pguint8;
    section_length: Tguint;
    cached_parsed: Pgpointer;
    destroy_parsed: TGDestroyNotify;
    offset: Tguint64;
    short_section: Tgboolean;
    packetizer: TGstMpegtsPacketizeFunc;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

function gst_mpegts_section_get_data(section: PGstMpegtsSection): PGBytes; cdecl; external libgstmpegts;

type
  TGstMpegtsPatProgram = record
    program_number: Tguint16;
    network_or_program_map_PID: Tguint16;
  end;
  PGstMpegtsPatProgram = ^TGstMpegtsPatProgram;

function gst_mpegts_section_get_pat(section: PGstMpegtsSection): PGPtrArray; cdecl; external libgstmpegts;
function gst_mpegts_pat_program_get_type: TGType; cdecl; external libgstmpegts;
function gst_mpegts_pat_new: PGPtrArray; cdecl; external libgstmpegts;
function gst_mpegts_pat_program_new: PGstMpegtsPatProgram; cdecl; external libgstmpegts;
function gst_mpegts_section_from_pat(programs: PGPtrArray; ts_id: Tguint16): PGstMpegtsSection; cdecl; external libgstmpegts;
function gst_mpegts_section_get_cat(section: PGstMpegtsSection): PGPtrArray; cdecl; external libgstmpegts;

type
  PGstMpegtsStreamType = ^TGstMpegtsStreamType;
  TGstMpegtsStreamType = longint;

const
  GST_MPEGTS_STREAM_TYPE_RESERVED_00 = $00;
  GST_MPEGTS_STREAM_TYPE_VIDEO_MPEG1 = $01;
  GST_MPEGTS_STREAM_TYPE_VIDEO_MPEG2 = $02;
  GST_MPEGTS_STREAM_TYPE_AUDIO_MPEG1 = $03;
  GST_MPEGTS_STREAM_TYPE_AUDIO_MPEG2 = $04;
  GST_MPEGTS_STREAM_TYPE_PRIVATE_SECTIONS = $05;
  GST_MPEGTS_STREAM_TYPE_PRIVATE_PES_PACKETS = $06;
  GST_MPEGTS_STREAM_TYPE_MHEG = $07;
  GST_MPEGTS_STREAM_TYPE_DSM_CC = $08;
  GST_MPEGTS_STREAM_TYPE_H_222_1 = $09;
  GST_MPEGTS_STREAM_TYPE_DSMCC_A = $0a;
  GST_MPEGTS_STREAM_TYPE_DSMCC_B = $0b;
  GST_MPEGTS_STREAM_TYPE_DSMCC_C = $0c;
  GST_MPEGTS_STREAM_TYPE_DSMCC_D = $0d;
  GST_MPEGTS_STREAM_TYPE_AUXILIARY = $0e;
  GST_MPEGTS_STREAM_TYPE_AUDIO_AAC_ADTS = $0f;
  GST_MPEGTS_STREAM_TYPE_VIDEO_MPEG4 = $10;
  GST_MPEGTS_STREAM_TYPE_AUDIO_AAC_LATM = $11;
  GST_MPEGTS_STREAM_TYPE_SL_FLEXMUX_PES_PACKETS = $12;
  GST_MPEGTS_STREAM_TYPE_SL_FLEXMUX_SECTIONS = $13;
  GST_MPEGTS_STREAM_TYPE_SYNCHRONIZED_DOWNLOAD = $14;
  GST_MPEGTS_STREAM_TYPE_METADATA_PES_PACKETS = $15;
  GST_MPEGTS_STREAM_TYPE_METADATA_SECTIONS = $16;
  GST_MPEGTS_STREAM_TYPE_METADATA_DATA_CAROUSEL = $17;
  GST_MPEGTS_STREAM_TYPE_METADATA_OBJECT_CAROUSEL = $18;
  GST_MPEGTS_STREAM_TYPE_METADATA_SYNCHRONIZED_DOWNLOAD = $19;
  GST_MPEGTS_STREAM_TYPE_MPEG2_IPMP = $1a;
  GST_MPEGTS_STREAM_TYPE_VIDEO_H264 = $1b;
  GST_MPEGTS_STREAM_TYPE_AUDIO_AAC_CLEAN = $1c;
  GST_MPEGTS_STREAM_TYPE_MPEG4_TIMED_TEXT = $1d;
  GST_MPEGTS_STREAM_TYPE_VIDEO_RVC = $1e;
  GST_MPEGTS_STREAM_TYPE_VIDEO_H264_SVC_SUB_BITSTREAM = $1f;
  GST_MPEGTS_STREAM_TYPE_VIDEO_H264_MVC_SUB_BITSTREAM = $20;
  GST_MPEGTS_STREAM_TYPE_VIDEO_JP2K = $21;
  GST_MPEGTS_STREAM_TYPE_VIDEO_MPEG2_STEREO_ADDITIONAL_VIEW = $22;
  GST_MPEGTS_STREAM_TYPE_VIDEO_H264_STEREO_ADDITIONAL_VIEW = $23;
  GST_MPEGTS_STREAM_TYPE_VIDEO_HEVC = $24;
  GST_MPEGTS_STREAM_TYPE_IPMP_STREAM = $7f;
  GST_MPEGTS_STREAM_TYPE_USER_PRIVATE_EA = $ea;

type
  TGstMpegtsPMTStream = record
    stream_type: Tguint8;
    pid: Tguint16;
    descriptors: PGPtrArray;
  end;
  PGstMpegtsPMTStream = ^TGstMpegtsPMTStream;

  TGstMpegtsPMT = record
    pcr_pid: Tguint16;
    program_number: Tguint16;
    descriptors: PGPtrArray;
    streams: PGPtrArray;
  end;
  PGstMpegtsPMT = ^TGstMpegtsPMT;


function gst_mpegts_pmt_get_type: TGType; cdecl; external libgstmpegts;
function gst_mpegts_pmt_stream_get_type: TGType; cdecl; external libgstmpegts;
function gst_mpegts_pmt_new: PGstMpegtsPMT; cdecl; external libgstmpegts;
function gst_mpegts_pmt_stream_new: PGstMpegtsPMTStream; cdecl; external libgstmpegts;
function gst_mpegts_section_get_pmt(section: PGstMpegtsSection): PGstMpegtsPMT; cdecl; external libgstmpegts;
function gst_mpegts_section_from_pmt(pmt: PGstMpegtsPMT; pid: Tguint16): PGstMpegtsSection; cdecl; external libgstmpegts;
function gst_mpegts_section_get_tsdt(section: PGstMpegtsSection): PGPtrArray; cdecl; external libgstmpegts;

function gst_message_new_mpegts_section(parent: PGstObject; section: PGstMpegtsSection): PGstMessage; cdecl; external libgstmpegts;
function gst_event_new_mpegts_section(section: PGstMpegtsSection): PGstEvent; cdecl; external libgstmpegts;
function gst_mpegts_section_send_event(section: PGstMpegtsSection; element: PGstElement): Tgboolean; cdecl; external libgstmpegts;
function gst_event_parse_mpegts_section(event: PGstEvent): PGstMpegtsSection; cdecl; external libgstmpegts;
function gst_message_parse_mpegts_section(message: PGstMessage): PGstMpegtsSection; cdecl; external libgstmpegts;
function gst_mpegts_section_new(pid: Tguint16; Data: Pguint8; data_size: Tgsize): PGstMpegtsSection; cdecl; external libgstmpegts;
function gst_mpegts_section_packetize(section: PGstMpegtsSection; output_size: Pgsize): Pguint8; cdecl; external libgstmpegts;

function GST_TYPE_MPEGTS_SECTION: TGType;
function GST_MPEGTS_SECTION(section: Pointer): PGstMpegtsSection;
function GST_MPEGTS_SECTION_TYPE(section: Pointer): TGstMpegtsSectionType;
function GST_TYPE_MPEGTS_PAT_PROGRAM: TGType;
function GST_TYPE_MPEGTS_PMT: TGType;
function GST_TYPE_MPEGTS_PMT_STREAM: TGType;
function gst_mpegts_section_ref(section: Pointer): PGstMpegtsSection;
procedure gst_mpegts_section_unref(section: Pointer);


// === Konventiert am: 6-10-24 16:40:09 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function GST_TYPE_MPEGTS_SECTION: TGType;
begin
  GST_TYPE_MPEGTS_SECTION := gst_mpegts_section_get_type;
end;

function GST_MPEGTS_SECTION(section: Pointer): PGstMpegtsSection;
begin
  GST_MPEGTS_SECTION := PGstMpegtsSection(section);
end;

function GST_MPEGTS_SECTION_TYPE(section: Pointer): TGstMpegtsSectionType;
begin
  GST_MPEGTS_SECTION_TYPE := (GST_MPEGTS_SECTION(section))^.section_type;
end;

function GST_TYPE_MPEGTS_PAT_PROGRAM: TGType;
begin
  GST_TYPE_MPEGTS_PAT_PROGRAM := gst_mpegts_pat_program_get_type;
end;

function GST_TYPE_MPEGTS_PMT: TGType;
begin
  GST_TYPE_MPEGTS_PMT := gst_mpegts_pmt_get_type;
end;

function GST_TYPE_MPEGTS_PMT_STREAM: TGType;
begin
  GST_TYPE_MPEGTS_PMT_STREAM := gst_mpegts_pmt_stream_get_type;
end;

function gst_mpegts_section_ref(section: Pointer): PGstMpegtsSection;
begin
  gst_mpegts_section_ref := PGstMpegtsSection(gst_mini_object_ref(GST_MINI_OBJECT_CAST(section)));
end;

procedure gst_mpegts_section_unref(section: Pointer);
begin
  gst_mini_object_unref(GST_MINI_OBJECT_CAST(section));
end;


{$ENDIF read_implementation}
