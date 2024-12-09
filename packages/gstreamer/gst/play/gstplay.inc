
{$IFDEF read_interface}

function gst_play_state_get_type: TGType; cdecl; external libgstplay;
function gst_play_message_get_type: TGType; cdecl; external libgstplay;

type
  TGstPlayVideoRenderer = record
  end;
  PGstPlayVideoRenderer = ^TGstPlayVideoRenderer;

  TGstPlay = record
  end;
  PGstPlay = ^TGstPlay;

  TGstPlayClass = record
  end;
  PGstPlayClass = ^TGstPlayClass;

  TGstPlayMediaInfo = record
  end;
  PGstPlayMediaInfo = ^TGstPlayMediaInfo;
  PPGstPlayMediaInfo = ^PGstPlayMediaInfo;

  TGstPlayAudioInfo = record
  end;
  PGstPlayAudioInfo = ^TGstPlayAudioInfo;

  TGstPlayVideoInfo = record
  end;
  PGstPlayVideoInfo = ^TGstPlayVideoInfo;

  TGstPlaySubtitleInfo = record
  end;
  PGstPlaySubtitleInfo = ^TGstPlaySubtitleInfo;

  TGstVideoMultiviewFramePacking = record
  end;
  PGstVideoMultiviewFramePacking = ^TGstVideoMultiviewFramePacking;

type
  PGstPlayState = ^TGstPlayState;
  TGstPlayState = longint;

const
  GST_PLAY_STATE_STOPPED = 0;
  GST_PLAY_STATE_BUFFERING = 1;
  GST_PLAY_STATE_PAUSED = 2;
  GST_PLAY_STATE_PLAYING = 3;

type
  PGstPlayMessage = ^TGstPlayMessage;
  TGstPlayMessage = longint;

const
  GST_PLAY_MESSAGE_URI_LOADED = 0;
  GST_PLAY_MESSAGE_POSITION_UPDATED = 1;
  GST_PLAY_MESSAGE_DURATION_CHANGED = 2;
  GST_PLAY_MESSAGE_STATE_CHANGED = 3;
  GST_PLAY_MESSAGE_BUFFERING = 4;
  GST_PLAY_MESSAGE_END_OF_STREAM = 5;
  GST_PLAY_MESSAGE_ERROR = 6;
  GST_PLAY_MESSAGE_WARNING = 7;
  GST_PLAY_MESSAGE_VIDEO_DIMENSIONS_CHANGED = 8;
  GST_PLAY_MESSAGE_MEDIA_INFO_UPDATED = 9;
  GST_PLAY_MESSAGE_VOLUME_CHANGED = 10;
  GST_PLAY_MESSAGE_MUTE_CHANGED = 11;
  GST_PLAY_MESSAGE_SEEK_DONE = 12;


function gst_play_state_get_name(state: TGstPlayState): Pgchar; cdecl; external libgstplay;
function gst_play_message_get_name(message_type: TGstPlayMessage): Pgchar; cdecl; external libgstplay;
function gst_play_error_quark: TGQuark; cdecl; external libgstplay;
function gst_play_error_get_type: TGType; cdecl; external libgstplay;

type
  PGstPlayError = ^TGstPlayError;
  TGstPlayError = longint;

const
  GST_PLAY_ERROR_FAILED = 0;

function gst_play_error_get_name(error: TGstPlayError): Pgchar; cdecl; external libgstplay;
function gst_play_color_balance_type_get_type: TGType; cdecl; external libgstplay;

type
  PGstPlayColorBalanceType = ^TGstPlayColorBalanceType;
  TGstPlayColorBalanceType = longint;

const
  GST_PLAY_COLOR_BALANCE_BRIGHTNESS = 0;
  GST_PLAY_COLOR_BALANCE_CONTRAST = 1;
  GST_PLAY_COLOR_BALANCE_SATURATION = 2;
  GST_PLAY_COLOR_BALANCE_HUE = 3;

function gst_play_color_balance_type_get_name(_type: TGstPlayColorBalanceType): Pgchar; cdecl; external libgstplay;

function gst_play_get_type: TGType; cdecl; external libgstplay;
function gst_play_new(video_renderer: PGstPlayVideoRenderer): PGstPlay; cdecl; external libgstplay;
function gst_play_get_message_bus(play: PGstPlay): PGstBus; cdecl; external libgstplay;
procedure gst_play_play(play: PGstPlay); cdecl; external libgstplay;
procedure gst_play_pause(play: PGstPlay); cdecl; external libgstplay;
procedure gst_play_stop(play: PGstPlay); cdecl; external libgstplay;
procedure gst_play_seek(play: PGstPlay; position: TGstClockTime); cdecl; external libgstplay;
procedure gst_play_set_rate(play: PGstPlay; rate: Tgdouble); cdecl; external libgstplay;
function gst_play_get_rate(play: PGstPlay): Tgdouble; cdecl; external libgstplay;
function gst_play_get_uri(play: PGstPlay): Pgchar; cdecl; external libgstplay;
procedure gst_play_set_uri(play: PGstPlay; uri: Pgchar); cdecl; external libgstplay;
function gst_play_get_subtitle_uri(play: PGstPlay): Pgchar; cdecl; external libgstplay;
procedure gst_play_set_subtitle_uri(play: PGstPlay; uri: Pgchar); cdecl; external libgstplay;
function gst_play_get_position(play: PGstPlay): TGstClockTime; cdecl; external libgstplay;
function gst_play_get_duration(play: PGstPlay): TGstClockTime; cdecl; external libgstplay;
function gst_play_get_volume(play: PGstPlay): Tgdouble; cdecl; external libgstplay;
procedure gst_play_set_volume(play: PGstPlay; val: Tgdouble); cdecl; external libgstplay;
function gst_play_get_mute(play: PGstPlay): Tgboolean; cdecl; external libgstplay;
procedure gst_play_set_mute(play: PGstPlay; val: Tgboolean); cdecl; external libgstplay;
function gst_play_get_pipeline(play: PGstPlay): PGstElement; cdecl; external libgstplay;
procedure gst_play_set_video_track_enabled(play: PGstPlay; Enabled: Tgboolean); cdecl; external libgstplay;
procedure gst_play_set_audio_track_enabled(play: PGstPlay; Enabled: Tgboolean); cdecl; external libgstplay;
procedure gst_play_set_subtitle_track_enabled(play: PGstPlay; Enabled: Tgboolean); cdecl; external libgstplay;
function gst_play_set_audio_track(play: PGstPlay; stream_index: Tgint): Tgboolean; cdecl; external libgstplay;
function gst_play_set_video_track(play: PGstPlay; stream_index: Tgint): Tgboolean; cdecl; external libgstplay;
function gst_play_set_subtitle_track(play: PGstPlay; stream_index: Tgint): Tgboolean; cdecl; external libgstplay;
function gst_play_get_media_info(play: PGstPlay): PGstPlayMediaInfo; cdecl; external libgstplay;
function gst_play_get_current_audio_track(play: PGstPlay): PGstPlayAudioInfo; cdecl; external libgstplay;
function gst_play_get_current_video_track(play: PGstPlay): PGstPlayVideoInfo; cdecl; external libgstplay;
function gst_play_get_current_subtitle_track(play: PGstPlay): PGstPlaySubtitleInfo; cdecl; external libgstplay;
function gst_play_set_visualization(play: PGstPlay; Name: Pgchar): Tgboolean; cdecl; external libgstplay;
procedure gst_play_set_visualization_enabled(play: PGstPlay; Enabled: Tgboolean); cdecl; external libgstplay;
function gst_play_get_current_visualization(play: PGstPlay): Pgchar; cdecl; external libgstplay;
function gst_play_has_color_balance(play: PGstPlay): Tgboolean; cdecl; external libgstplay;
procedure gst_play_set_color_balance(play: PGstPlay; _type: TGstPlayColorBalanceType; Value: Tgdouble); cdecl; external libgstplay;
function gst_play_get_color_balance(play: PGstPlay; _type: TGstPlayColorBalanceType): Tgdouble; cdecl; external libgstplay;
function gst_play_get_multiview_mode(play: PGstPlay): TGstVideoMultiviewFramePacking; cdecl; external libgstplay;
procedure gst_play_set_multiview_mode(play: PGstPlay; mode: TGstVideoMultiviewFramePacking); cdecl; external libgstplay;
function gst_play_get_multiview_flags(play: PGstPlay): TGstVideoMultiviewFlags; cdecl; external libgstplay;
procedure gst_play_set_multiview_flags(play: PGstPlay; flags: TGstVideoMultiviewFlags); cdecl; external libgstplay;
function gst_play_get_audio_video_offset(play: PGstPlay): Tgint64; cdecl; external libgstplay;
procedure gst_play_set_audio_video_offset(play: PGstPlay; offset: Tgint64); cdecl; external libgstplay;
function gst_play_get_subtitle_video_offset(play: PGstPlay): Tgint64; cdecl; external libgstplay;
procedure gst_play_set_subtitle_video_offset(play: PGstPlay; offset: Tgint64); cdecl; external libgstplay;
function gst_play_set_config(play: PGstPlay; config: PGstStructure): Tgboolean; cdecl; external libgstplay;
function gst_play_get_config(play: PGstPlay): PGstStructure; cdecl; external libgstplay;
procedure gst_play_config_set_user_agent(config: PGstStructure; agent: Pgchar); cdecl; external libgstplay;
function gst_play_config_get_user_agent(config: PGstStructure): Pgchar; cdecl; external libgstplay;
procedure gst_play_config_set_position_update_interval(config: PGstStructure; interval: Tguint); cdecl; external libgstplay;
function gst_play_config_get_position_update_interval(config: PGstStructure): Tguint; cdecl; external libgstplay;
procedure gst_play_config_set_seek_accurate(config: PGstStructure; accurate: Tgboolean); cdecl; external libgstplay;
function gst_play_config_get_seek_accurate(config: PGstStructure): Tgboolean; cdecl; external libgstplay;
procedure gst_play_config_set_pipeline_dump_in_error_details(config: PGstStructure; Value: Tgboolean); cdecl; external libgstplay;
function gst_play_config_get_pipeline_dump_in_error_details(config: PGstStructure): Tgboolean; cdecl; external libgstplay;

type
  PGstPlaySnapshotFormat = ^TGstPlaySnapshotFormat;
  TGstPlaySnapshotFormat = longint;

const
  GST_PLAY_THUMBNAIL_RAW_NATIVE = 0;
  GST_PLAY_THUMBNAIL_RAW_xRGB = (0) + 1;
  GST_PLAY_THUMBNAIL_RAW_BGRx = (0) + 2;
  GST_PLAY_THUMBNAIL_JPG = (0) + 3;
  GST_PLAY_THUMBNAIL_PNG = (0) + 4;

function gst_play_get_video_snapshot(play: PGstPlay; format: TGstPlaySnapshotFormat; config: PGstStructure): PGstSample; cdecl; external libgstplay;
function gst_play_is_play_message(msg: PGstMessage): Tgboolean; cdecl; external libgstplay;
procedure gst_play_message_parse_type(msg: PGstMessage; _type: PGstPlayMessage); cdecl; external libgstplay;
procedure gst_play_message_parse_duration_updated(msg: PGstMessage; duration: PGstClockTime); cdecl; external libgstplay;
procedure gst_play_message_parse_position_updated(msg: PGstMessage; position: PGstClockTime); cdecl; external libgstplay;
procedure gst_play_message_parse_state_changed(msg: PGstMessage; state: PGstPlayState); cdecl; external libgstplay;
procedure gst_play_message_parse_buffering_percent(msg: PGstMessage; percent: Pguint); cdecl; external libgstplay;
procedure gst_play_message_parse_error(msg: PGstMessage; error: PPGError; details: PPGstStructure); cdecl; external libgstplay;
procedure gst_play_message_parse_warning(msg: PGstMessage; error: PPGError; details: PPGstStructure); cdecl; external libgstplay;
procedure gst_play_message_parse_video_dimensions_changed(msg: PGstMessage; Width: Pguint; Height: Pguint); cdecl; external libgstplay;
procedure gst_play_message_parse_media_info_updated(msg: PGstMessage; info: PPGstPlayMediaInfo); cdecl; external libgstplay;
procedure gst_play_message_parse_volume_changed(msg: PGstMessage; volume: Pgdouble); cdecl; external libgstplay;
procedure gst_play_message_parse_muted_changed(msg: PGstMessage; muted: Pgboolean); cdecl; external libgstplay;

function GST_TYPE_PLAY_STATE: TGType;
function GST_TYPE_PLAY_MESSAGE: TGType;
function GST_PLAY_ERROR: TGQuark;
function GST_TYPE_PLAY_ERROR: TGType;
function GST_TYPE_PLAY_COLOR_BALANCE_TYPE: TGType;
function GST_PLAY_CAST(obj: Pointer): PGstPlay;

// === Konventiert am: 11-10-24 19:16:47 ===

function GST_TYPE_PLAY: TGType;
function GST_PLAY(obj: Pointer): PGstPlay;
function GST_PLAY_CLASS(klass: Pointer): PGstPlayClass;
function GST_IS_PLAY(obj: Pointer): Tgboolean;
function GST_IS_PLAY_CLASS(klass: Pointer): Tgboolean;
function GST_PLAY_GET_CLASS(obj: Pointer): PGstPlayClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_PLAY: TGType;
begin
  GST_TYPE_PLAY := gst_play_get_type;
end;

function GST_PLAY(obj: Pointer): PGstPlay;
begin
  Result := PGstPlay(g_type_check_instance_cast(obj, GST_TYPE_PLAY));
end;

function GST_PLAY_CLASS(klass: Pointer): PGstPlayClass;
begin
  Result := PGstPlayClass(g_type_check_class_cast(klass, GST_TYPE_PLAY));
end;

function GST_IS_PLAY(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_PLAY);
end;

function GST_IS_PLAY_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_PLAY);
end;

function GST_PLAY_GET_CLASS(obj: Pointer): PGstPlayClass;
begin
  Result := PGstPlayClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_TYPE_PLAY_STATE: TGType;
begin
  GST_TYPE_PLAY_STATE := gst_play_state_get_type;
end;

function GST_TYPE_PLAY_MESSAGE: TGType;
begin
  GST_TYPE_PLAY_MESSAGE := gst_play_message_get_type;
end;

function GST_PLAY_ERROR: TGQuark;
begin
  GST_PLAY_ERROR := gst_play_error_quark;
end;

function GST_TYPE_PLAY_ERROR: TGType;
begin
  GST_TYPE_PLAY_ERROR := gst_play_error_get_type;
end;

function GST_TYPE_PLAY_COLOR_BALANCE_TYPE: TGType;
begin
  GST_TYPE_PLAY_COLOR_BALANCE_TYPE := gst_play_color_balance_type_get_type;
end;

function GST_PLAY_CAST(obj: Pointer): PGstPlay;
begin
  GST_PLAY_CAST := PGstPlay(obj);
end;


{$ENDIF read_implementation}
