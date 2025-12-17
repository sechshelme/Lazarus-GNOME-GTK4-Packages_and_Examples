{$IFDEF read_interface}


type
  PAVClassCategory = ^TAVClassCategory;
  TAVClassCategory = longint;

const
  AV_CLASS_CATEGORY_NA = 0;
  AV_CLASS_CATEGORY_INPUT = 1;
  AV_CLASS_CATEGORY_OUTPUT = 2;
  AV_CLASS_CATEGORY_MUXER = 3;
  AV_CLASS_CATEGORY_DEMUXER = 4;
  AV_CLASS_CATEGORY_ENCODER = 5;
  AV_CLASS_CATEGORY_DECODER = 6;
  AV_CLASS_CATEGORY_FILTER = 7;
  AV_CLASS_CATEGORY_BITSTREAM_FILTER = 8;
  AV_CLASS_CATEGORY_SWSCALER = 9;
  AV_CLASS_CATEGORY_SWRESAMPLER = 10;
  AV_CLASS_CATEGORY_DEVICE_VIDEO_OUTPUT = 40;
  AV_CLASS_CATEGORY_DEVICE_VIDEO_INPUT = 41;
  AV_CLASS_CATEGORY_DEVICE_AUDIO_OUTPUT = 42;
  AV_CLASS_CATEGORY_DEVICE_AUDIO_INPUT = 43;
  AV_CLASS_CATEGORY_DEVICE_OUTPUT = 44;
  AV_CLASS_CATEGORY_DEVICE_INPUT = 45;
  AV_CLASS_CATEGORY_NB = 46;

type
  TAVOptionRange = record
    str: pchar;
    value_min: double;
    value_max: double;
    component_min: double;
    component_max: double;
    is_range: longint;
  end;
  PAVOptionRange = ^TAVOptionRange;

  TAVOptionRanges = record
    range: ^PAVOptionRange;
    nb_ranges: longint;
    nb_components: longint;
  end;
  PAVOptionRanges = ^TAVOptionRanges;
  PPAVOptionRanges = ^PAVOptionRanges;

  PAVClass = ^TAVClass;

  TAVClass = record
    class_name: pchar;
    item_name: function(ctx: pointer): pchar; cdecl;
    option: Pointer; //  PAVOption;
    version: longint;
    log_level_offset_offset: longint;
    parent_log_context_offset: longint;
    category: TAVClassCategory;
    get_category: function(ctx: pointer): TAVClassCategory; cdecl;
    query_ranges: function(para1: PPAVOptionRanges; obj: pointer; key: pchar; flags: longint): longint; cdecl;
    child_next: function(obj: pointer; prev: pointer): pointer; cdecl;
    child_class_iterate: function(iter: Ppointer): PAVClass; cdecl;
  end;

const
  AV_LOG_QUIET = -(8);
  AV_LOG_PANIC = 0;
  AV_LOG_FATAL = 8;
  AV_LOG_ERROR = 16;
  AV_LOG_WARNING = 24;
  AV_LOG_INFO = 32;
  AV_LOG_VERBOSE = 40;
  AV_LOG_DEBUG = 48;
  AV_LOG_TRACE = 56;
  AV_LOG_MAX_OFFSET = AV_LOG_TRACE - AV_LOG_QUIET;

function AV_LOG_C(x: longint): longint;

procedure av_log(avcl: pointer; level: longint; fmt: pchar); cdecl; varargs; external libavutil;
procedure av_log_once(avcl: pointer; initial_level: longint; subsequent_level: longint; state: Plongint; fmt: pchar); cdecl; varargs; external libavutil;
procedure av_vlog(avcl: pointer; level: longint; fmt: pchar; vl: Tva_list); cdecl; external libavutil;
function av_log_get_level: longint; cdecl; external libavutil;
procedure av_log_set_level(level: longint); cdecl; external libavutil;

type
  Tlog_set_func = procedure(para1: pointer; para2: longint; para3: pchar; para4: Tva_list); cdecl;

procedure av_log_set_callback(callback: Tlog_set_func); cdecl; external libavutil;
procedure av_log_default_callback(avcl: pointer; level: longint; fmt: pchar; vl: Tva_list); cdecl; external libavutil;
function av_default_item_name(ctx: pointer): pchar; cdecl; external libavutil;
function av_default_get_category(ptr: pointer): TAVClassCategory; cdecl; external libavutil;
procedure av_log_format_line(ptr: pointer; level: longint; fmt: pchar; vl: Tva_list; line: pchar;
  line_size: longint; print_prefix: Plongint); cdecl; external libavutil;
function av_log_format_line2(ptr: pointer; level: longint; fmt: pchar; vl: Tva_list; line: pchar;
  line_size: longint; print_prefix: Plongint): longint; cdecl; external libavutil;

const
  AV_LOG_SKIP_REPEATED = 1;
  AV_LOG_PRINT_LEVEL = 2;

procedure av_log_set_flags(arg: longint); cdecl; external libavutil;
function av_log_get_flags: longint; cdecl; external libavutil;

// === Konventiert am: 14-12-25 17:31:21 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function AV_LOG_C(x: longint): longint;
begin
  AV_LOG_C := x shl 8;
end;


{$ENDIF read_implementation}
