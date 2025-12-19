unit packet;

interface

uses
  fp_ffmpeg;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TAVPacketSideDataType = longint;

const
  AV_PKT_DATA_PALETTE = 0;
  AV_PKT_DATA_NEW_EXTRADATA = 1;
  AV_PKT_DATA_PARAM_CHANGE = 2;
  AV_PKT_DATA_H263_MB_INFO = 3;
  AV_PKT_DATA_REPLAYGAIN = 4;
  AV_PKT_DATA_DISPLAYMATRIX = 5;
  AV_PKT_DATA_STEREO3D = 6;
  AV_PKT_DATA_AUDIO_SERVICE_TYPE = 7;
  AV_PKT_DATA_QUALITY_STATS = 8;
  AV_PKT_DATA_FALLBACK_TRACK = 9;
  AV_PKT_DATA_CPB_PROPERTIES = 10;
  AV_PKT_DATA_SKIP_SAMPLES = 11;
  AV_PKT_DATA_JP_DUALMONO = 12;
  AV_PKT_DATA_STRINGS_METADATA = 13;
  AV_PKT_DATA_SUBTITLE_POSITION = 14;
  AV_PKT_DATA_MATROSKA_BLOCKADDITIONAL = 15;
  AV_PKT_DATA_WEBVTT_IDENTIFIER = 16;
  AV_PKT_DATA_WEBVTT_SETTINGS = 17;
  AV_PKT_DATA_METADATA_UPDATE = 18;
  AV_PKT_DATA_MPEGTS_STREAM_ID = 19;
  AV_PKT_DATA_MASTERING_DISPLAY_METADATA = 20;
  AV_PKT_DATA_SPHERICAL = 21;
  AV_PKT_DATA_CONTENT_LIGHT_LEVEL = 22;
  AV_PKT_DATA_A53_CC = 23;
  AV_PKT_DATA_ENCRYPTION_INIT_INFO = 24;
  AV_PKT_DATA_ENCRYPTION_INFO = 25;
  AV_PKT_DATA_AFD = 26;
  AV_PKT_DATA_PRFT = 27;
  AV_PKT_DATA_ICC_PROFILE = 28;
  AV_PKT_DATA_DOVI_CONF = 29;
  AV_PKT_DATA_S12M_TIMECODE = 30;
  AV_PKT_DATA_DYNAMIC_HDR10_PLUS = 31;
  AV_PKT_DATA_NB = 32;

  AV_PKT_DATA_QUALITY_FACTOR = AV_PKT_DATA_QUALITY_STATS;

type
  TAVPacketSideData = record
    data: Puint8_t;
    size: Tsize_t;
    _type: TAVPacketSideDataType;
  end;
  PAVPacketSideData = ^TAVPacketSideData;
  PPAVPacketSideData = ^PAVPacketSideData;

function av_packet_side_data_new(psd: PPAVPacketSideData; pnb_sd: Plongint; _type: TAVPacketSideDataType; size: Tsize_t; flags: longint): PAVPacketSideData; cdecl; external libavcodec;
function av_packet_side_data_add(sd: PPAVPacketSideData; nb_sd: Plongint; _type: TAVPacketSideDataType; data: pointer; size: Tsize_t;
  flags: longint): PAVPacketSideData; cdecl; external libavcodec;
function av_packet_side_data_get(sd: PAVPacketSideData; nb_sd: longint; _type: TAVPacketSideDataType): PAVPacketSideData; cdecl; external libavcodec;
procedure av_packet_side_data_remove(sd: PAVPacketSideData; nb_sd: Plongint; _type: TAVPacketSideDataType); cdecl; external libavcodec;
procedure av_packet_side_data_free(sd: PPAVPacketSideData; nb_sd: Plongint); cdecl; external libavcodec;
function av_packet_side_data_name(_type: TAVPacketSideDataType): pchar; cdecl; external libavcodec;

type
  TAVPacket = record
    buf: PAVBufferRef;
    pts: Tint64_t;
    dts: Tint64_t;
    data: Puint8_t;
    size: longint;
    stream_index: longint;
    flags: longint;
    side_data: PAVPacketSideData;
    side_data_elems: longint;
    duration: Tint64_t;
    pos: Tint64_t;
    opaque: pointer;
    opaque_ref: PAVBufferRef;
    time_base: TAVRational;
  end;
  PAVPacket = ^TAVPacket;
  PPAVPacket = ^PAVPacket;

type
  PAVPacketList = ^TAVPacketList;
  TAVPacketList = record
    pkt: TAVPacket;
    next: PAVPacketList;
  end;

const
  AV_PKT_FLAG_KEY = $0001;
  AV_PKT_FLAG_CORRUPT = $0002;
  AV_PKT_FLAG_DISCARD = $0004;
  AV_PKT_FLAG_TRUSTED = $0008;
  AV_PKT_FLAG_DISPOSABLE = $0010;

type
  TAVSideDataParamChangeFlags = longint;

const
  AV_SIDE_DATA_PARAM_CHANGE_CHANNEL_COUNT = $0001;
  AV_SIDE_DATA_PARAM_CHANGE_CHANNEL_LAYOUT = $0002;
  AV_SIDE_DATA_PARAM_CHANGE_SAMPLE_RATE = $0004;
  AV_SIDE_DATA_PARAM_CHANGE_DIMENSIONS = $0008;

function av_packet_alloc: PAVPacket; cdecl; external libavcodec;
function av_packet_clone(src: PAVPacket): PAVPacket; cdecl; external libavcodec;
procedure av_packet_free(pkt: PPAVPacket); cdecl; external libavcodec;
procedure av_init_packet(pkt: PAVPacket); cdecl; external libavcodec;
function av_new_packet(pkt: PAVPacket; size: longint): longint; cdecl; external libavcodec;
procedure av_shrink_packet(pkt: PAVPacket; size: longint); cdecl; external libavcodec;
function av_grow_packet(pkt: PAVPacket; grow_by: longint): longint; cdecl; external libavcodec;
function av_packet_from_data(pkt: PAVPacket; data: Puint8_t; size: longint): longint; cdecl; external libavcodec;
function av_packet_new_side_data(pkt: PAVPacket; _type: TAVPacketSideDataType; size: Tsize_t): Puint8_t; cdecl; external libavcodec;
function av_packet_add_side_data(pkt: PAVPacket; _type: TAVPacketSideDataType; data: Puint8_t; size: Tsize_t): longint; cdecl; external libavcodec;
function av_packet_shrink_side_data(pkt: PAVPacket; _type: TAVPacketSideDataType; size: Tsize_t): longint; cdecl; external libavcodec;
function av_packet_get_side_data(pkt: PAVPacket; _type: TAVPacketSideDataType; size: Psize_t): Puint8_t; cdecl; external libavcodec;
function av_packet_pack_dictionary(dict: PAVDictionary; size: Psize_t): Puint8_t; cdecl; external libavcodec;
function av_packet_unpack_dictionary(data: Puint8_t; size: Tsize_t; dict: PPAVDictionary): longint; cdecl; external libavcodec;
procedure av_packet_free_side_data(pkt: PAVPacket); cdecl; external libavcodec;
function av_packet_ref(dst: PAVPacket; src: PAVPacket): longint; cdecl; external libavcodec;
procedure av_packet_unref(pkt: PAVPacket); cdecl; external libavcodec;
procedure av_packet_move_ref(dst: PAVPacket; src: PAVPacket); cdecl; external libavcodec;
function av_packet_copy_props(dst: PAVPacket; src: PAVPacket): longint; cdecl; external libavcodec;
function av_packet_make_refcounted(pkt: PAVPacket): longint; cdecl; external libavcodec;
function av_packet_make_writable(pkt: PAVPacket): longint; cdecl; external libavcodec;
procedure av_packet_rescale_ts(pkt: PAVPacket; tb_src: TAVRational; tb_dst: TAVRational); cdecl; external libavcodec;

// === Konventiert am: 19-12-25 17:16:12 ===


implementation



end.
