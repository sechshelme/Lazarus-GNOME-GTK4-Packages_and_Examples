unit avformat;

interface

uses
  fp_ffmpeg, avio;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


type
  PAVFormatContext = type Pointer;
  PPAVFormatContext = ^PAVFormatContext;
  PAVFrame = type Pointer;
  PAVDeviceInfoList = type Pointer;


function av_get_packet(s: PAVIOContext; pkt: PAVPacket; size: longint): longint; cdecl; external libavformat;
function av_append_packet(s: PAVIOContext; pkt: PAVPacket; size: longint): longint; cdecl; external libavformat;

type
  PAVCodecTag = type Pointer;
  PPAVCodecTag = ^PAVCodecTag;

  TAVProbeData = record
    filename: pchar;
    buf: pbyte;
    buf_size: longint;
    mime_type: pchar;
  end;
  PAVProbeData = ^TAVProbeData;

const
  AVPROBE_SCORE_EXTENSION = 50;
  AVPROBE_SCORE_MIME = 75;
  AVPROBE_SCORE_MAX = 100;
  AVPROBE_PADDING_SIZE = 32;
  AVPROBE_SCORE_RETRY = AVPROBE_SCORE_MAX / 4;
  AVPROBE_SCORE_STREAM_RETRY = (AVPROBE_SCORE_MAX / 4) - 1;
  AVFMT_NOFILE = $0001;
  AVFMT_NEEDNUMBER = $0002;
  AVFMT_EXPERIMENTAL = $0004;
  AVFMT_SHOW_IDS = $0008;
  AVFMT_GLOBALHEADER = $0040;
  AVFMT_NOTIMESTAMPS = $0080;
  AVFMT_GENERIC_INDEX = $0100;
  AVFMT_TS_DISCONT = $0200;
  AVFMT_VARIABLE_FPS = $0400;
  AVFMT_NODIMENSIONS = $0800;
  AVFMT_NOSTREAMS = $1000;
  AVFMT_NOBINSEARCH = $2000;
  AVFMT_NOGENSEARCH = $4000;
  AVFMT_NO_BYTE_SEEK = $8000;

const
  AVFMT_ALLOW_FLUSH = $10000;

const
  AVFMT_TS_NONSTRICT = $20000;
  AVFMT_TS_NEGATIVE = $40000;
  AVFMT_SEEK_TO_PTS = $4000000;

type
  TAVOutputFormat = record
    name: pchar;
    long_name: pchar;
    mime_type: pchar;
    extensions: pchar;
    audio_codec: TAVCodecID;
    video_codec: TAVCodecID;
    subtitle_codec: TAVCodecID;
    flags: longint;
    codec_tag: ^PAVCodecTag;
    priv_class: PAVClass;
  end;
  PAVOutputFormat = ^TAVOutputFormat;

  TAVInputFormat = record
    name: pchar;
    long_name: pchar;
    flags: longint;
    extensions: pchar;
    codec_tag: ^PAVCodecTag;
    priv_class: PAVClass;
    mime_type: pchar;
    raw_codec_id: longint;
    priv_data_size: longint;
    flags_internal: longint;
    read_probe: function(para1: PAVProbeData): longint; cdecl;
    read_header: function(para1: PAVFormatContext): longint; cdecl;
    read_packet: function(para1: PAVFormatContext; pkt: PAVPacket): longint; cdecl;
    read_close: function(para1: PAVFormatContext): longint; cdecl;
    read_seek: function(para1: PAVFormatContext; stream_index: longint; timestamp: Tint64_t; flags: longint): longint; cdecl;
    read_timestamp: function(s: PAVFormatContext; stream_index: longint; pos: Pint64_t; pos_limit: Tint64_t): Tint64_t; cdecl;
    read_play: function(para1: PAVFormatContext): longint; cdecl;
    read_pause: function(para1: PAVFormatContext): longint; cdecl;
    read_seek2: function(s: PAVFormatContext; stream_index: longint; min_ts: Tint64_t; ts: Tint64_t; max_ts: Tint64_t;
      flags: longint): longint; cdecl;
    get_device_list: function(s: PAVFormatContext; device_list: PAVDeviceInfoList): longint; cdecl;
  end;
  PAVInputFormat = ^TAVInputFormat;
  PPAVInputFormat = ^PAVInputFormat;
  TAVStreamParseType = longint;

const
  AVSTREAM_PARSE_NONE = 0;
  AVSTREAM_PARSE_FULL = 1;
  AVSTREAM_PARSE_HEADERS = 2;
  AVSTREAM_PARSE_TIMESTAMPS = 3;
  AVSTREAM_PARSE_FULL_ONCE = 4;
  AVSTREAM_PARSE_FULL_RAW = 5;

type
  PAVIndexEntry = type Pointer;

const
  AVINDEX_KEYFRAME = $0001;
  AVINDEX_DISCARD_FRAME = $0002;
  AV_DISPOSITION_DEFAULT = 1 shl 0;
  AV_DISPOSITION_DUB = 1 shl 1;
  AV_DISPOSITION_ORIGINAL = 1 shl 2;
  AV_DISPOSITION_COMMENT = 1 shl 3;
  AV_DISPOSITION_LYRICS = 1 shl 4;
  AV_DISPOSITION_KARAOKE = 1 shl 5;
  AV_DISPOSITION_FORCED = 1 shl 6;
  AV_DISPOSITION_HEARING_IMPAIRED = 1 shl 7;
  AV_DISPOSITION_VISUAL_IMPAIRED = 1 shl 8;
  AV_DISPOSITION_CLEAN_EFFECTS = 1 shl 9;
  AV_DISPOSITION_ATTACHED_PIC = 1 shl 10;
  AV_DISPOSITION_TIMED_THUMBNAILS = 1 shl 11;
  AV_DISPOSITION_NON_DIEGETIC = 1 shl 12;
  AV_DISPOSITION_CAPTIONS = 1 shl 16;
  AV_DISPOSITION_DESCRIPTIONS = 1 shl 17;
  AV_DISPOSITION_METADATA = 1 shl 18;
  AV_DISPOSITION_DEPENDENT = 1 shl 19;
  AV_DISPOSITION_STILL_IMAGE = 1 shl 20;

function av_disposition_from_string(disp: pchar): longint; cdecl; external libavformat;
function av_disposition_to_string(disposition: longint): pchar; cdecl; external libavformat;

const
  AV_PTS_WRAP_IGNORE = 0;
  AV_PTS_WRAP_ADD_OFFSET = 1;
  AV_PTS_WRAP_SUB_OFFSET = -(1);

type
  PAVStream = ^TAVStream;

  TAVStream = record
    av_class: PAVClass;
    index: longint;
    id: longint;
    codecpar: PAVCodecParameters;
    priv_data: pointer;
    time_base: TAVRational;
    start_time: Tint64_t;
    duration: Tint64_t;
    nb_frames: Tint64_t;
    disposition: longint;
    discard: TAVDiscard;
    sample_aspect_ratio: TAVRational;
    metadata: PAVDictionary;
    avg_frame_rate: TAVRational;
    attached_pic: TAVPacket;
    event_flags: longint;
    r_frame_rate: TAVRational;
    pts_wrap_bits: longint;
  end;

const
  AVSTREAM_EVENT_FLAG_METADATA_UPDATED = $0001;
  AVSTREAM_EVENT_FLAG_NEW_PACKETS = 1 shl 1;

function av_stream_get_parser(s: PAVStream): PAVCodecParserContext; cdecl; external libavformat;
function av_stream_get_end_pts(st: PAVStream): Tint64_t; cdecl; external libavformat; deprecated;

const
  AV_PROGRAM_RUNNING = 1;

type
  TAVProgram = record
    id: longint;
    flags: longint;
    discard: TAVDiscard;
    stream_index: Pdword;
    nb_stream_indexes: dword;
    metadata: PAVDictionary;
    program_num: longint;
    pmt_pid: longint;
    pcr_pid: longint;
    pmt_version: longint;
    start_time: Tint64_t;
    end_time: Tint64_t;
    pts_wrap_reference: Tint64_t;
    pts_wrap_behavior: longint;
  end;
  PAVProgram = ^TAVProgram;

const
  AVFMTCTX_NOHEADER = $0001;
  AVFMTCTX_UNSEEKABLE = $0002;

type
  TAVChapter = record
    id: Tint64_t;
    time_base: TAVRational;
    start: Tint64_t;
    end_: Tint64_t;
    metadata: PAVDictionary;
  end;
  PAVChapter = ^TAVChapter;

  Tav_format_control_message = function(s: PAVFormatContext; _type: longint; data: pointer; data_size: Tsize_t): longint; cdecl;
  TAVOpenCallback = function(s: PAVFormatContext; pb: PPAVIOContext; url: pchar; flags: longint; int_cb: PAVIOInterruptCB;
    options: PPAVDictionary): longint; cdecl;
  TAVDurationEstimationMethod = longint;

const
  AVFMT_DURATION_FROM_PTS = 0;
  AVFMT_DURATION_FROM_STREAM = 1;
  AVFMT_DURATION_FROM_BITRATE = 2;

  AVFMT_FLAG_GENPTS = $0001;
  AVFMT_FLAG_IGNIDX = $0002;
  AVFMT_FLAG_NONBLOCK = $0004;
  AVFMT_FLAG_IGNDTS = $0008;
  AVFMT_FLAG_NOFILLIN = $0010;
  AVFMT_FLAG_NOPARSE = $0020;
  AVFMT_FLAG_NOBUFFER = $0040;
  AVFMT_FLAG_CUSTOM_IO = $0080;
  AVFMT_FLAG_DISCARD_CORRUPT = $0100;
  AVFMT_FLAG_FLUSH_PACKETS = $0200;
  AVFMT_FLAG_BITEXACT = $0400;
  AVFMT_FLAG_SORT_DTS = $10000;
  AVFMT_FLAG_FAST_SEEK = $80000;
  AVFMT_FLAG_SHORTEST = $100000;
  AVFMT_FLAG_AUTO_BSF = $200000;

  FF_FDEBUG_TS = $0001;
  AVFMT_EVENT_FLAG_METADATA_UPDATED = $0001;
  AVFMT_AVOID_NEG_TS_AUTO = -(1);
  AVFMT_AVOID_NEG_TS_DISABLED = 0;
  AVFMT_AVOID_NEG_TS_MAKE_NON_NEGATIVE = 1;
  AVFMT_AVOID_NEG_TS_MAKE_ZERO = 2;

procedure av_format_inject_global_side_data(s: PAVFormatContext); cdecl; external libavformat;
function av_fmt_ctx_get_duration_estimation_method(ctx: PAVFormatContext): TAVDurationEstimationMethod; cdecl; external libavformat;
function avformat_version: dword; cdecl; external libavformat;
function avformat_configuration: pchar; cdecl; external libavformat;
function avformat_license: pchar; cdecl; external libavformat;
function avformat_network_init: longint; cdecl; external libavformat;
function avformat_network_deinit: longint; cdecl; external libavformat;
function av_muxer_iterate(opaque: Ppointer): PAVOutputFormat; cdecl; external libavformat;
function av_demuxer_iterate(opaque: Ppointer): PAVInputFormat; cdecl; external libavformat;
function avformat_alloc_context: PAVFormatContext; cdecl; external libavformat;
procedure avformat_free_context(s: PAVFormatContext); cdecl; external libavformat;
function avformat_get_class: PAVClass; cdecl; external libavformat;
function av_stream_get_class: PAVClass; cdecl; external libavformat;
function avformat_new_stream(s: PAVFormatContext; c: PAVCodec): PAVStream; cdecl; external libavformat;
function av_stream_add_side_data(st: PAVStream; _type: TAVPacketSideDataType; data: Puint8_t; size: Tsize_t): longint; cdecl; external libavformat; deprecated;
function av_stream_new_side_data(stream: PAVStream; _type: TAVPacketSideDataType; size: Tsize_t): Puint8_t; cdecl; external libavformat; deprecated;
function av_stream_get_side_data(stream: PAVStream; _type: TAVPacketSideDataType; size: Psize_t): Puint8_t; cdecl; external libavformat; deprecated;
function av_new_program(s: PAVFormatContext; id: longint): PAVProgram; cdecl; external libavformat;
function avformat_alloc_output_context2(ctx: PPAVFormatContext; oformat: PAVOutputFormat; format_name: pchar; filename: pchar): longint; cdecl; external libavformat;
function av_find_input_format(short_name: pchar): PAVInputFormat; cdecl; external libavformat;
function av_probe_input_format(pd: PAVProbeData; is_opened: longint): PAVInputFormat; cdecl; external libavformat;
function av_probe_input_format2(pd: PAVProbeData; is_opened: longint; score_max: Plongint): PAVInputFormat; cdecl; external libavformat;
function av_probe_input_format3(pd: PAVProbeData; is_opened: longint; score_ret: Plongint): PAVInputFormat; cdecl; external libavformat;
function av_probe_input_buffer2(pb: PAVIOContext; fmt: PPAVInputFormat; url: pchar; logctx: pointer; offset: dword;
  max_probe_size: dword): longint; cdecl; external libavformat;
function av_probe_input_buffer(pb: PAVIOContext; fmt: PPAVInputFormat; url: pchar; logctx: pointer; offset: dword;
  max_probe_size: dword): longint; cdecl; external libavformat;
function avformat_open_input(ps: PPAVFormatContext; url: pchar; fmt: PAVInputFormat; options: PPAVDictionary): longint; cdecl; external libavformat;
function avformat_find_stream_info(ic: PAVFormatContext; options: PPAVDictionary): longint; cdecl; external libavformat;
function av_find_program_from_stream(ic: PAVFormatContext; last: PAVProgram; s: longint): PAVProgram; cdecl; external libavformat;
procedure av_program_add_stream_index(ac: PAVFormatContext; progid: longint; idx: dword); cdecl; external libavformat;
function av_find_best_stream(ic: PAVFormatContext; _type: TAVMediaType; wanted_stream_nb: longint; related_stream: longint; decoder_ret: PPAVCodec;
  flags: longint): longint; cdecl; external libavformat;
function av_read_frame(s: PAVFormatContext; pkt: PAVPacket): longint; cdecl; external libavformat;
function av_seek_frame(s: PAVFormatContext; stream_index: longint; timestamp: Tint64_t; flags: longint): longint; cdecl; external libavformat;
function avformat_seek_file(s: PAVFormatContext; stream_index: longint; min_ts: Tint64_t; ts: Tint64_t; max_ts: Tint64_t;
  flags: longint): longint; cdecl; external libavformat;
function avformat_flush(s: PAVFormatContext): longint; cdecl; external libavformat;
function av_read_play(s: PAVFormatContext): longint; cdecl; external libavformat;
function av_read_pause(s: PAVFormatContext): longint; cdecl; external libavformat;
procedure avformat_close_input(s: PPAVFormatContext); cdecl; external libavformat;

const
  AVSEEK_FLAG_BACKWARD = 1;
  AVSEEK_FLAG_BYTE = 2;
  AVSEEK_FLAG_ANY = 4;
  AVSEEK_FLAG_FRAME = 8;

  AVSTREAM_INIT_IN_WRITE_HEADER = 0;
  AVSTREAM_INIT_IN_INIT_OUTPUT = 1;

function avformat_write_header(s: PAVFormatContext; options: PPAVDictionary): longint; cdecl; external libavformat;
function avformat_init_output(s: PAVFormatContext; options: PPAVDictionary): longint; cdecl; external libavformat;
function av_write_frame(s: PAVFormatContext; pkt: PAVPacket): longint; cdecl; external libavformat;
function av_interleaved_write_frame(s: PAVFormatContext; pkt: PAVPacket): longint; cdecl; external libavformat;
function av_write_uncoded_frame(s: PAVFormatContext; stream_index: longint; frame: PAVFrame): longint; cdecl; external libavformat;
function av_interleaved_write_uncoded_frame(s: PAVFormatContext; stream_index: longint; frame: PAVFrame): longint; cdecl; external libavformat;
function av_write_uncoded_frame_query(s: PAVFormatContext; stream_index: longint): longint; cdecl; external libavformat;
function av_write_trailer(s: PAVFormatContext): longint; cdecl; external libavformat;
function av_guess_format(short_name: pchar; filename: pchar; mime_type: pchar): PAVOutputFormat; cdecl; external libavformat;
function av_guess_codec(fmt: PAVOutputFormat; short_name: pchar; filename: pchar; mime_type: pchar; _type: TAVMediaType): TAVCodecID; cdecl; external libavformat;
function av_get_output_timestamp(s: PAVFormatContext; stream: longint; dts: Pint64_t; wall: Pint64_t): longint; cdecl; external libavformat;
procedure av_hex_dump(f: PFILE; buf: Puint8_t; size: longint); cdecl; external libavformat;
procedure av_hex_dump_log(avcl: pointer; level: longint; buf: Puint8_t; size: longint); cdecl; external libavformat;
procedure av_pkt_dump2(f: PFILE; pkt: PAVPacket; dump_payload: longint; st: PAVStream); cdecl; external libavformat;
procedure av_pkt_dump_log2(avcl: pointer; level: longint; pkt: PAVPacket; dump_payload: longint; st: PAVStream); cdecl; external libavformat;
function av_codec_get_id(tags: PPAVCodecTag; tag: dword): TAVCodecID; cdecl; external libavformat;
function av_codec_get_tag(tags: PPAVCodecTag; id: TAVCodecID): dword; cdecl; external libavformat;
function av_codec_get_tag2(tags: PPAVCodecTag; id: TAVCodecID; tag: Pdword): longint; cdecl; external libavformat;
function av_find_default_stream_index(s: PAVFormatContext): longint; cdecl; external libavformat;
function av_index_search_timestamp(st: PAVStream; timestamp: Tint64_t; flags: longint): longint; cdecl; external libavformat;
function avformat_index_get_entries_count(st: PAVStream): longint; cdecl; external libavformat;
function avformat_index_get_entry(st: PAVStream; idx: longint): PAVIndexEntry; cdecl; external libavformat;
function avformat_index_get_entry_from_timestamp(st: PAVStream; wanted_timestamp: Tint64_t; flags: longint): PAVIndexEntry; cdecl; external libavformat;
function av_add_index_entry(st: PAVStream; pos: Tint64_t; timestamp: Tint64_t; size: longint; distance: longint; flags: longint): longint; cdecl; external libavformat;
procedure av_url_split(proto: pchar; proto_size: longint; authorization: pchar; authorization_size: longint; hostname: pchar;
  hostname_size: longint; port_ptr: Plongint; path: pchar; path_size: longint; url: pchar); cdecl; external libavformat;
procedure av_dump_format(ic: PAVFormatContext; index: longint; url: pchar; is_output: longint); cdecl; external libavformat;

const
  AV_FRAME_FILENAME_FLAGS_MULTIPLE = 1;

function av_get_frame_filename2(buf: pchar; buf_size: longint; path: pchar; number: longint; flags: longint): longint; cdecl; external libavformat;
function av_get_frame_filename(buf: pchar; buf_size: longint; path: pchar; number: longint): longint; cdecl; external libavformat;
function av_filename_number_test(filename: pchar): longint; cdecl; external libavformat;
function av_sdp_create(ac: PPAVFormatContext; n_files: longint; buf: pchar; size: longint): longint; cdecl; external libavformat;
function av_match_ext(filename: pchar; extensions: pchar): longint; cdecl; external libavformat;
function avformat_query_codec(ofmt: PAVOutputFormat; codec_id: TAVCodecID; std_compliance: longint): longint; cdecl; external libavformat;
function avformat_get_riff_video_tags: PAVCodecTag; cdecl; external libavformat;
function avformat_get_riff_audio_tags: PAVCodecTag; cdecl; external libavformat;
function avformat_get_mov_video_tags: PAVCodecTag; cdecl; external libavformat;
function avformat_get_mov_audio_tags: PAVCodecTag; cdecl; external libavformat;
function av_guess_sample_aspect_ratio(format: PAVFormatContext; stream: PAVStream; frame: PAVFrame): TAVRational; cdecl; external libavformat;
function av_guess_frame_rate(ctx: PAVFormatContext; stream: PAVStream; frame: PAVFrame): TAVRational; cdecl; external libavformat;
function avformat_match_stream_specifier(s: PAVFormatContext; st: PAVStream; spec: pchar): longint; cdecl; external libavformat;
function avformat_queue_attached_pictures(s: PAVFormatContext): longint; cdecl; external libavformat;

type
  TAVTimebaseSource = longint;

const
  AVFMT_TBCF_AUTO = -(1);
  AVFMT_TBCF_DECODER = (-(1)) + 1;
  AVFMT_TBCF_DEMUXER = (-(1)) + 2;
  AVFMT_TBCF_R_FRAMERATE = (-(1)) + 3;

function avformat_transfer_internal_stream_timing_info(ofmt: PAVOutputFormat; ost: PAVStream; ist: PAVStream; copy_tb: TAVTimebaseSource): longint; cdecl; external libavformat;
function av_stream_get_codec_timebase(st: PAVStream): TAVRational; cdecl; external libavformat;

// === Konventiert am: 14-12-25 15:21:18 ===


implementation


end.
