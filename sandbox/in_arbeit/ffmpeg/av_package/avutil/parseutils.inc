{$IFDEF read_interface}


function av_parse_ratio(q: PAVRational; str: pchar; max: longint; log_offset: longint; log_ctx: pointer): longint; cdecl; external libavutil;

function av_parse_ratio_quiet(rate: PAVRational; str: pchar; max: longint): longint;

function av_parse_video_size(width_ptr: Plongint; height_ptr: Plongint; str: pchar): longint; cdecl; external libavutil;
function av_parse_video_rate(rate: PAVRational; str: pchar): longint; cdecl; external libavutil;
function av_parse_color(rgba_color: Puint8_t; color_string: pchar; slen: longint; log_ctx: pointer): longint; cdecl; external libavutil;
function av_get_known_color_name(color_idx: longint; rgb: PPuint8_t): pchar; cdecl; external libavutil;
function av_parse_time(timeval: Pint64_t; timestr: pchar; duration: longint): longint; cdecl; external libavutil;
function av_find_info_tag(arg: pchar; arg_size: longint; tag1: pchar; info: pchar): longint; cdecl; external libavutil;
function av_small_strptime(p: pchar; fmt: pchar; dt: Ptm): pchar; cdecl; external libavutil;
function av_timegm(tm: Ptm): Ttime_t; cdecl; external libavutil;

// === Konventiert am: 14-12-25 17:30:58 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function av_parse_ratio_quiet(rate: PAVRational; str: pchar; max: longint): longint;
begin
  av_parse_ratio_quiet := av_parse_ratio(rate, str, max, AV_LOG_MAX_OFFSET, nil);
end;


{$ENDIF read_implementation}
