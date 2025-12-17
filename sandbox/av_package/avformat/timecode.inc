{$IFDEF read_interface}


const
  AV_TIMECODE_STR_SIZE = 23;

type
  TAVTimecodeFlag = longint;

const
  AV_TIMECODE_FLAG_DROPFRAME = 1 shl 0;
  AV_TIMECODE_FLAG_24HOURSMAX = 1 shl 1;
  AV_TIMECODE_FLAG_ALLOWNEGATIVE = 1 shl 2;

type
  TAVTimecode = record
    start: longint;
    flags: Tuint32_t;
    rate: TAVRational;
    fps: dword;
  end;
  PAVTimecode = ^TAVTimecode;

function av_timecode_adjust_ntsc_framenum2(framenum: longint; fps: longint): longint; cdecl; external libavutil;
function av_timecode_get_smpte_from_framenum(tc: PAVTimecode; framenum: longint): Tuint32_t; cdecl; external libavutil;
function av_timecode_get_smpte(rate: TAVRational; drop: longint; hh: longint; mm: longint; ss: longint; ff: longint): Tuint32_t; cdecl; external libavutil;
function av_timecode_make_string(tc: PAVTimecode; buf: pchar; framenum: longint): pchar; cdecl; external libavutil;
function av_timecode_make_smpte_tc_string2(buf: pchar; rate: TAVRational; tcsmpte: Tuint32_t; prevent_df: longint; skip_field: longint): pchar; cdecl; external libavutil;
function av_timecode_make_smpte_tc_string(buf: pchar; tcsmpte: Tuint32_t; prevent_df: longint): pchar; cdecl; external libavutil;
function av_timecode_make_mpeg_tc_string(buf: pchar; tc25bit: Tuint32_t): pchar; cdecl; external libavutil;
function av_timecode_init(tc: PAVTimecode; rate: TAVRational; flags: longint; frame_start: longint; log_ctx: pointer): longint; cdecl; external libavutil;
function av_timecode_init_from_components(tc: PAVTimecode; rate: TAVRational; flags: longint; hh: longint; mm: longint;
  ss: longint; ff: longint; log_ctx: pointer): longint; cdecl; external libavutil;
function av_timecode_init_from_string(tc: PAVTimecode; rate: TAVRational; str: pchar; log_ctx: pointer): longint; cdecl; external libavutil;
function av_timecode_check_frame_rate(rate: TAVRational): longint; cdecl; external libavutil;

// === Konventiert am: 14-12-25 17:42:19 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
