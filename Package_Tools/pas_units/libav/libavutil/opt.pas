unit opt;

interface

uses
  fp_ffmpeg, rational, dict, pixfmt, samplefmt, channel_layout, log;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TAVOptionType = longint;

const
  AV_OPT_TYPE_FLAGS = 0;
  AV_OPT_TYPE_INT = 1;
  AV_OPT_TYPE_INT64 = 2;
  AV_OPT_TYPE_DOUBLE = 3;
  AV_OPT_TYPE_FLOAT = 4;
  AV_OPT_TYPE_STRING = 5;
  AV_OPT_TYPE_RATIONAL = 6;
  AV_OPT_TYPE_BINARY = 7;
  AV_OPT_TYPE_DICT = 8;
  AV_OPT_TYPE_UINT64 = 9;
  AV_OPT_TYPE_CONST = 10;
  AV_OPT_TYPE_IMAGE_SIZE = 11;
  AV_OPT_TYPE_PIXEL_FMT = 12;
  AV_OPT_TYPE_SAMPLE_FMT = 13;
  AV_OPT_TYPE_VIDEO_RATE = 14;
  AV_OPT_TYPE_DURATION = 15;
  AV_OPT_TYPE_COLOR = 16;
  AV_OPT_TYPE_CHANNEL_LAYOUT = 17;
  AV_OPT_TYPE_BOOL = 18;
  AV_OPT_TYPE_CHLAYOUT = 19;

type
  TAVOption = record
    name: pchar;
    help: pchar;
    offset: longint;
    _type: TAVOptionType;
    default_val: record
      case longint of
        0: (i64: Tint64_t);
        1: (dbl: double);
        2: (str: pchar);
        3: (q: TAVRational);
      end;
    min: double;
    max: double;
    flags: longint;
    unit_: pchar;
  end;
  PAVOption = ^TAVOption;

const
  AV_OPT_FLAG_ENCODING_PARAM = 1;
  AV_OPT_FLAG_DECODING_PARAM = 2;
  AV_OPT_FLAG_AUDIO_PARAM = 8;
  AV_OPT_FLAG_VIDEO_PARAM = 16;
  AV_OPT_FLAG_SUBTITLE_PARAM = 32;
  AV_OPT_FLAG_EXPORT = 64;
  AV_OPT_FLAG_READONLY = 128;

  AV_OPT_FLAG_BSF_PARAM = 1 shl 8;
  AV_OPT_FLAG_RUNTIME_PARAM = 1 shl 15;
  AV_OPT_FLAG_FILTERING_PARAM = 1 shl 16;
  AV_OPT_FLAG_DEPRECATED = 1 shl 17;
  AV_OPT_FLAG_CHILD_CONSTS = 1 shl 18;

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

function av_opt_show2(obj: pointer; av_log_obj: pointer; req_flags: longint; rej_flags: longint): longint; cdecl; external libavutil;
procedure av_opt_set_defaults(s: pointer); cdecl; external libavutil;
procedure av_opt_set_defaults2(s: pointer; mask: longint; flags: longint); cdecl; external libavutil;
function av_set_options_string(ctx: pointer; opts: pchar; key_val_sep: pchar; pairs_sep: pchar): longint; cdecl; external libavutil;
function av_opt_set_from_string(ctx: pointer; opts: pchar; shorthand: PPchar; key_val_sep: pchar; pairs_sep: pchar): longint; cdecl; external libavutil;
procedure av_opt_free(obj: pointer); cdecl; external libavutil;
function av_opt_flag_is_set(obj: pointer; field_name: pchar; flag_name: pchar): longint; cdecl; external libavutil;
function av_opt_set_dict(obj: pointer; options: PPAVDictionary): longint; cdecl; external libavutil;
function av_opt_set_dict2(obj: pointer; options: PPAVDictionary; search_flags: longint): longint; cdecl; external libavutil;
function av_opt_get_key_value(ropts: PPchar; key_val_sep: pchar; pairs_sep: pchar; flags: dword; rkey: PPchar; rval: PPchar): longint; cdecl; external libavutil;

const
  AV_OPT_FLAG_IMPLICIT_KEY = 1;

function av_opt_eval_flags(obj: pointer; o: PAVOption; val: pchar; flags_out: Plongint): longint; cdecl; external libavutil;
function av_opt_eval_int(obj: pointer; o: PAVOption; val: pchar; int_out: Plongint): longint; cdecl; external libavutil;
function av_opt_eval_int64(obj: pointer; o: PAVOption; val: pchar; int64_out: Pint64_t): longint; cdecl; external libavutil;
function av_opt_eval_float(obj: pointer; o: PAVOption; val: pchar; float_out: Psingle): longint; cdecl; external libavutil;
function av_opt_eval_double(obj: pointer; o: PAVOption; val: pchar; double_out: Pdouble): longint; cdecl; external libavutil;
function av_opt_eval_q(obj: pointer; o: PAVOption; val: pchar; q_out: PAVRational): longint; cdecl; external libavutil;

const
  AV_OPT_SEARCH_CHILDREN = 1 shl 0;
  AV_OPT_SEARCH_FAKE_OBJ = 1 shl 1;
  AV_OPT_ALLOW_NULL = 1 shl 2;
  AV_OPT_MULTI_COMPONENT_RANGE = 1 shl 12;

function av_opt_find(obj: pointer; name: pchar; unit_: pchar; opt_flags: longint; search_flags: longint): PAVOption; cdecl; external libavutil;
function av_opt_find2(obj: pointer; name: pchar; unit_: pchar; opt_flags: longint; search_flags: longint; target_obj: Ppointer): PAVOption; cdecl; external libavutil;
function av_opt_next(obj: pointer; prev: PAVOption): PAVOption; cdecl; external libavutil;
function av_opt_child_next(obj: pointer; prev: pointer): pointer; cdecl; external libavutil;
function av_opt_child_class_iterate(parent: PAVClass; iter: Ppointer): PAVClass; cdecl; external libavutil;
function av_opt_set(obj: pointer; name: pchar; val: pchar; search_flags: longint): longint; cdecl; external libavutil;
function av_opt_set_int(obj: pointer; name: pchar; val: Tint64_t; search_flags: longint): longint; cdecl; external libavutil;
function av_opt_set_double(obj: pointer; name: pchar; val: double; search_flags: longint): longint; cdecl; external libavutil;
function av_opt_set_q(obj: pointer; name: pchar; val: TAVRational; search_flags: longint): longint; cdecl; external libavutil;
function av_opt_set_bin(obj: pointer; name: pchar; val: Puint8_t; size: longint; search_flags: longint): longint; cdecl; external libavutil;
function av_opt_set_image_size(obj: pointer; name: pchar; w: longint; h: longint; search_flags: longint): longint; cdecl; external libavutil;
function av_opt_set_pixel_fmt(obj: pointer; name: pchar; fmt: TAVPixelFormat; search_flags: longint): longint; cdecl; external libavutil;
function av_opt_set_sample_fmt(obj: pointer; name: pchar; fmt: TAVSampleFormat; search_flags: longint): longint; cdecl; external libavutil;
function av_opt_set_video_rate(obj: pointer; name: pchar; val: TAVRational; search_flags: longint): longint; cdecl; external libavutil;

function av_opt_set_channel_layout(obj: pointer; name: pchar; ch_layout: Tint64_t; search_flags: longint): longint; cdecl; external libavutil; deprecated;

function av_opt_set_chlayout(obj: pointer; name: pchar; layout: PAVChannelLayout; search_flags: longint): longint; cdecl; external libavutil;
function av_opt_set_dict_val(obj: pointer; name: pchar; val: PAVDictionary; search_flags: longint): longint; cdecl; external libavutil;
function av_opt_get(obj: pointer; name: pchar; search_flags: longint; out_val: PPuint8_t): longint; cdecl; external libavutil;
function av_opt_get_int(obj: pointer; name: pchar; search_flags: longint; out_val: Pint64_t): longint; cdecl; external libavutil;
function av_opt_get_double(obj: pointer; name: pchar; search_flags: longint; out_val: Pdouble): longint; cdecl; external libavutil;
function av_opt_get_q(obj: pointer; name: pchar; search_flags: longint; out_val: PAVRational): longint; cdecl; external libavutil;
function av_opt_get_image_size(obj: pointer; name: pchar; search_flags: longint; w_out: Plongint; h_out: Plongint): longint; cdecl; external libavutil;
function av_opt_get_pixel_fmt(obj: pointer; name: pchar; search_flags: longint; out_fmt: PAVPixelFormat): longint; cdecl; external libavutil;
function av_opt_get_sample_fmt(obj: pointer; name: pchar; search_flags: longint; out_fmt: PAVSampleFormat): longint; cdecl; external libavutil;
function av_opt_get_video_rate(obj: pointer; name: pchar; search_flags: longint; out_val: PAVRational): longint; cdecl; external libavutil;

function av_opt_get_channel_layout(obj: pointer; name: pchar; search_flags: longint; ch_layout: Pint64_t): longint; cdecl; external libavutil; deprecated;

function av_opt_get_chlayout(obj: pointer; name: pchar; search_flags: longint; layout: PAVChannelLayout): longint; cdecl; external libavutil;
function av_opt_get_dict_val(obj: pointer; name: pchar; search_flags: longint; out_val: PPAVDictionary): longint; cdecl; external libavutil;
function av_opt_ptr(avclass: PAVClass; obj: pointer; name: pchar): pointer; cdecl; external libavutil;
procedure av_opt_freep_ranges(ranges: PPAVOptionRanges); cdecl; external libavutil;
function av_opt_query_ranges(para1: PPAVOptionRanges; obj: pointer; key: pchar; flags: longint): longint; cdecl; external libavutil;
function av_opt_copy(dest: pointer; src: pointer): longint; cdecl; external libavutil;
function av_opt_query_ranges_default(para1: PPAVOptionRanges; obj: pointer; key: pchar; flags: longint): longint; cdecl; external libavutil;
function av_opt_is_set_to_default(obj: pointer; o: PAVOption): longint; cdecl; external libavutil;
function av_opt_is_set_to_default_by_name(obj: pointer; name: pchar; search_flags: longint): longint; cdecl; external libavutil;

const
  AV_OPT_SERIALIZE_SKIP_DEFAULTS = $00000001;
  AV_OPT_SERIALIZE_OPT_FLAGS_EXACT = $00000002;

function av_opt_serialize(obj: pointer; opt_flags: longint; flags: longint; buffer: PPchar; key_val_sep: char;
  pairs_sep: char): longint; cdecl; external libavutil;

// === Konventiert am: 14-12-25 17:31:00 ===


implementation



end.
