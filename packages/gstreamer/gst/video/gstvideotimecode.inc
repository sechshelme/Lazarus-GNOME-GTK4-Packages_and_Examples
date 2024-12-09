
{$IFDEF read_interface}

type
  PGstVideoTimeCodeFlags = ^TGstVideoTimeCodeFlags;
  TGstVideoTimeCodeFlags = longint;

const
  GST_VIDEO_TIME_CODE_FLAGS_NONE = 0;
  GST_VIDEO_TIME_CODE_FLAGS_DROP_FRAME = 1 shl 0;
  GST_VIDEO_TIME_CODE_FLAGS_INTERLACED = 1 shl 1;

type
  PGstVideoTimeCodeConfig = ^TGstVideoTimeCodeConfig;

  TGstVideoTimeCodeConfig = record
    fps_n: Tguint;
    fps_d: Tguint;
    flags: TGstVideoTimeCodeFlags;
    latest_daily_jam: PGDateTime;
  end;

  PGstVideoTimeCode = ^TGstVideoTimeCode;

  TGstVideoTimeCode = record
    config: TGstVideoTimeCodeConfig;
    hours: Tguint;
    minutes: Tguint;
    seconds: Tguint;
    frames: Tguint;
    field_count: Tguint;
  end;

  PGstVideoTimeCodeInterval = ^TGstVideoTimeCodeInterval;

  TGstVideoTimeCodeInterval = record
    hours: Tguint;
    minutes: Tguint;
    seconds: Tguint;
    frames: Tguint;
  end;

function gst_video_time_code_get_type: TGType; cdecl; external libgstvideo;
function gst_video_time_code_new(fps_n: Tguint; fps_d: Tguint; latest_daily_jam: PGDateTime; flags: TGstVideoTimeCodeFlags; hours: Tguint;
  minutes: Tguint; seconds: Tguint; frames: Tguint; field_count: Tguint): PGstVideoTimeCode; cdecl; external libgstvideo;
function gst_video_time_code_new_empty: PGstVideoTimeCode; cdecl; external libgstvideo;
function gst_video_time_code_new_from_string(tc_str: Pgchar): PGstVideoTimeCode; cdecl; external libgstvideo;
function gst_video_time_code_new_from_date_time(fps_n: Tguint; fps_d: Tguint; dt: PGDateTime; flags: TGstVideoTimeCodeFlags; field_count: Tguint): PGstVideoTimeCode; cdecl; external libgstvideo;
function gst_video_time_code_new_from_date_time_full(fps_n: Tguint; fps_d: Tguint; dt: PGDateTime; flags: TGstVideoTimeCodeFlags; field_count: Tguint): PGstVideoTimeCode; cdecl; external libgstvideo;
procedure gst_video_time_code_free(tc: PGstVideoTimeCode); cdecl; external libgstvideo;
function gst_video_time_code_copy(tc: PGstVideoTimeCode): PGstVideoTimeCode; cdecl; external libgstvideo;
procedure gst_video_time_code_init(tc: PGstVideoTimeCode; fps_n: Tguint; fps_d: Tguint; latest_daily_jam: PGDateTime; flags: TGstVideoTimeCodeFlags;
  hours: Tguint; minutes: Tguint; seconds: Tguint; frames: Tguint; field_count: Tguint); cdecl; external libgstvideo;
procedure gst_video_time_code_init_from_date_time(tc: PGstVideoTimeCode; fps_n: Tguint; fps_d: Tguint; dt: PGDateTime; flags: TGstVideoTimeCodeFlags;
  field_count: Tguint); cdecl; external libgstvideo;
function gst_video_time_code_init_from_date_time_full(tc: PGstVideoTimeCode; fps_n: Tguint; fps_d: Tguint; dt: PGDateTime; flags: TGstVideoTimeCodeFlags;
  field_count: Tguint): Tgboolean; cdecl; external libgstvideo;
procedure gst_video_time_code_clear(tc: PGstVideoTimeCode); cdecl; external libgstvideo;
function gst_video_time_code_is_valid(tc: PGstVideoTimeCode): Tgboolean; cdecl; external libgstvideo;
function gst_video_time_code_compare(tc1: PGstVideoTimeCode; tc2: PGstVideoTimeCode): Tgint; cdecl; external libgstvideo;
procedure gst_video_time_code_increment_frame(tc: PGstVideoTimeCode); cdecl; external libgstvideo;
procedure gst_video_time_code_add_frames(tc: PGstVideoTimeCode; frames: Tgint64); cdecl; external libgstvideo;
function gst_video_time_code_to_string(tc: PGstVideoTimeCode): Pgchar; cdecl; external libgstvideo;
function gst_video_time_code_to_date_time(tc: PGstVideoTimeCode): PGDateTime; cdecl; external libgstvideo;
function gst_video_time_code_nsec_since_daily_jam(tc: PGstVideoTimeCode): Tguint64; cdecl; external libgstvideo;
function gst_video_time_code_frames_since_daily_jam(tc: PGstVideoTimeCode): Tguint64; cdecl; external libgstvideo;
function gst_video_time_code_add_interval(tc: PGstVideoTimeCode; tc_inter: PGstVideoTimeCodeInterval): PGstVideoTimeCode; cdecl; external libgstvideo;
function gst_video_time_code_interval_get_type: TGType; cdecl; external libgstvideo;
function gst_video_time_code_interval_new(hours: Tguint; minutes: Tguint; seconds: Tguint; frames: Tguint): PGstVideoTimeCodeInterval; cdecl; external libgstvideo;
function gst_video_time_code_interval_new_from_string(tc_inter_str: Pgchar): PGstVideoTimeCodeInterval; cdecl; external libgstvideo;
procedure gst_video_time_code_interval_free(tc: PGstVideoTimeCodeInterval); cdecl; external libgstvideo;
function gst_video_time_code_interval_copy(tc: PGstVideoTimeCodeInterval): PGstVideoTimeCodeInterval; cdecl; external libgstvideo;
procedure gst_video_time_code_interval_init(tc: PGstVideoTimeCodeInterval; hours: Tguint; minutes: Tguint; seconds: Tguint; frames: Tguint); cdecl; external libgstvideo;
procedure gst_video_time_code_interval_clear(tc: PGstVideoTimeCodeInterval); cdecl; external libgstvideo;

function GST_TYPE_VIDEO_TIME_CODE: TGType;
function GST_TYPE_VIDEO_TIME_CODE_INTERVAL: TGType;


// === Konventiert am: 29-9-24 17:47:51 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function GST_TYPE_VIDEO_TIME_CODE: TGType;
begin
  GST_TYPE_VIDEO_TIME_CODE := gst_video_time_code_get_type;
end;

function GST_TYPE_VIDEO_TIME_CODE_INTERVAL: TGType;
begin
  GST_TYPE_VIDEO_TIME_CODE_INTERVAL := gst_video_time_code_interval_get_type;
end;


{$ENDIF read_implementation}
