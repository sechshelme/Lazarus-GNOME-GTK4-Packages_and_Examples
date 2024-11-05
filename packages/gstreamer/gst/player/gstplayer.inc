/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 08-10-2024   19:23                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}


function gst_player_state_get_type: TGType; cdecl; external libgstplayer;

type
  TGstPlayerVideoRenderer = record
  end;
  PGstPlayerVideoRenderer = ^TGstPlayerVideoRenderer;

  TGstPlayerSignalDispatcher = record
  end;
  PGstPlayerSignalDispatcher = ^TGstPlayerSignalDispatcher;

type
  PGstPlayerState = ^TGstPlayerState;
  TGstPlayerState = longint;

const
  GST_PLAYER_STATE_STOPPED = 0;
  GST_PLAYER_STATE_BUFFERING = 1;
  GST_PLAYER_STATE_PAUSED = 2;
  GST_PLAYER_STATE_PLAYING = 3;

function gst_player_state_get_name(state: TGstPlayerState): Pgchar; cdecl; external libgstplayer;
function gst_player_error_quark: TGQuark; cdecl; external libgstplayer;
function gst_player_error_get_type: TGType; cdecl; external libgstplayer;

type
  PGstPlayerError = ^TGstPlayerError;
  TGstPlayerError = longint;

const
  GST_PLAYER_ERROR_FAILED = 0;

function gst_player_error_get_name(error: TGstPlayerError): Pgchar; cdecl; external libgstplayer;
function gst_player_color_balance_type_get_type: TGType; cdecl; external libgstplayer;

type
  PGstPlayerColorBalanceType = ^TGstPlayerColorBalanceType;
  TGstPlayerColorBalanceType = longint;

const
  GST_PLAYER_COLOR_BALANCE_BRIGHTNESS = 0;
  GST_PLAYER_COLOR_BALANCE_CONTRAST = 1;
  GST_PLAYER_COLOR_BALANCE_SATURATION = 2;
  GST_PLAYER_COLOR_BALANCE_HUE = 3;

type
  TGstPlayer = record
  end;
  PGstPlayer = ^TGstPlayer;

  TGstPlayerClass = record
  end;
  PGstPlayerClass = ^TGstPlayerClass;

function gst_player_color_balance_type_get_name(_type: TGstPlayerColorBalanceType): Pgchar; cdecl; external libgstplayer;
function gst_player_get_type: TGType; cdecl; external libgstplayer;
function gst_player_new(video_renderer: PGstPlayerVideoRenderer; signal_dispatcher: PGstPlayerSignalDispatcher): PGstPlayer; cdecl; external libgstplayer;
procedure gst_player_play(player: PGstPlayer); cdecl; external libgstplayer;
procedure gst_player_pause(player: PGstPlayer); cdecl; external libgstplayer;
procedure gst_player_stop(player: PGstPlayer); cdecl; external libgstplayer;
procedure gst_player_seek(player: PGstPlayer; position: TGstClockTime); cdecl; external libgstplayer;
procedure gst_player_set_rate(player: PGstPlayer; rate: Tgdouble); cdecl; external libgstplayer;
function gst_player_get_rate(player: PGstPlayer): Tgdouble; cdecl; external libgstplayer;
function gst_player_get_uri(player: PGstPlayer): Pgchar; cdecl; external libgstplayer;
procedure gst_player_set_uri(player: PGstPlayer; uri: Pgchar); cdecl; external libgstplayer;
function gst_player_get_subtitle_uri(player: PGstPlayer): Pgchar; cdecl; external libgstplayer;
procedure gst_player_set_subtitle_uri(player: PGstPlayer; uri: Pgchar); cdecl; external libgstplayer;
function gst_player_get_position(player: PGstPlayer): TGstClockTime; cdecl; external libgstplayer;
function gst_player_get_duration(player: PGstPlayer): TGstClockTime; cdecl; external libgstplayer;
function gst_player_get_volume(player: PGstPlayer): Tgdouble; cdecl; external libgstplayer;
procedure gst_player_set_volume(player: PGstPlayer; val: Tgdouble); cdecl; external libgstplayer;
function gst_player_get_mute(player: PGstPlayer): Tgboolean; cdecl; external libgstplayer;
procedure gst_player_set_mute(player: PGstPlayer; val: Tgboolean); cdecl; external libgstplayer;
function gst_player_get_pipeline(player: PGstPlayer): PGstElement; cdecl; external libgstplayer;
procedure gst_player_set_video_track_enabled(player: PGstPlayer; Enabled: Tgboolean); cdecl; external libgstplayer;
procedure gst_player_set_audio_track_enabled(player: PGstPlayer; Enabled: Tgboolean); cdecl; external libgstplayer;
procedure gst_player_set_subtitle_track_enabled(player: PGstPlayer; Enabled: Tgboolean); cdecl; external libgstplayer;
function gst_player_set_audio_track(player: PGstPlayer; stream_index: Tgint): Tgboolean; cdecl; external libgstplayer;
function gst_player_set_video_track(player: PGstPlayer; stream_index: Tgint): Tgboolean; cdecl; external libgstplayer;
function gst_player_set_subtitle_track(player: PGstPlayer; stream_index: Tgint): Tgboolean; cdecl; external libgstplayer;
function gst_player_get_media_info(player: PGstPlayer): PGstPlayerMediaInfo; cdecl; external libgstplayer;
function gst_player_get_current_audio_track(player: PGstPlayer): PGstPlayerAudioInfo; cdecl; external libgstplayer;
function gst_player_get_current_video_track(player: PGstPlayer): PGstPlayerVideoInfo; cdecl; external libgstplayer;
function gst_player_get_current_subtitle_track(player: PGstPlayer): PGstPlayerSubtitleInfo; cdecl; external libgstplayer;
function gst_player_set_visualization(player: PGstPlayer; Name: Pgchar): Tgboolean; cdecl; external libgstplayer;
procedure gst_player_set_visualization_enabled(player: PGstPlayer; Enabled: Tgboolean); cdecl; external libgstplayer;
function gst_player_get_current_visualization(player: PGstPlayer): Pgchar; cdecl; external libgstplayer;
function gst_player_has_color_balance(player: PGstPlayer): Tgboolean; cdecl; external libgstplayer;
procedure gst_player_set_color_balance(player: PGstPlayer; _type: TGstPlayerColorBalanceType; Value: Tgdouble); cdecl; external libgstplayer;
function gst_player_get_color_balance(player: PGstPlayer; _type: TGstPlayerColorBalanceType): Tgdouble; cdecl; external libgstplayer;
function gst_player_get_multiview_mode(player: PGstPlayer): TGstVideoMultiviewFramePacking; cdecl; external libgstplayer;
procedure gst_player_set_multiview_mode(player: PGstPlayer; mode: TGstVideoMultiviewFramePacking); cdecl; external libgstplayer;
function gst_player_get_multiview_flags(player: PGstPlayer): TGstVideoMultiviewFlags; cdecl; external libgstplayer;
procedure gst_player_set_multiview_flags(player: PGstPlayer; flags: TGstVideoMultiviewFlags); cdecl; external libgstplayer;
function gst_player_get_audio_video_offset(player: PGstPlayer): Tgint64; cdecl; external libgstplayer;
procedure gst_player_set_audio_video_offset(player: PGstPlayer; offset: Tgint64); cdecl; external libgstplayer;
function gst_player_get_subtitle_video_offset(player: PGstPlayer): Tgint64; cdecl; external libgstplayer;
procedure gst_player_set_subtitle_video_offset(player: PGstPlayer; offset: Tgint64); cdecl; external libgstplayer;
function gst_player_set_config(player: PGstPlayer; config: PGstStructure): Tgboolean; cdecl; external libgstplayer;
function gst_player_get_config(player: PGstPlayer): PGstStructure; cdecl; external libgstplayer;
procedure gst_player_config_set_user_agent(config: PGstStructure; agent: Pgchar); cdecl; external libgstplayer;
function gst_player_config_get_user_agent(config: PGstStructure): Pgchar; cdecl; external libgstplayer;
procedure gst_player_config_set_position_update_interval(config: PGstStructure; interval: Tguint); cdecl; external libgstplayer;
function gst_player_config_get_position_update_interval(config: PGstStructure): Tguint; cdecl; external libgstplayer;
procedure gst_player_config_set_seek_accurate(config: PGstStructure; accurate: Tgboolean); cdecl; external libgstplayer;
function gst_player_config_get_seek_accurate(config: PGstStructure): Tgboolean; cdecl; external libgstplayer;

type
  PGstPlayerSnapshotFormat = ^TGstPlayerSnapshotFormat;
  TGstPlayerSnapshotFormat = longint;

const
  GST_PLAYER_THUMBNAIL_RAW_NATIVE = 0;
  GST_PLAYER_THUMBNAIL_RAW_xRGB = 1;
  GST_PLAYER_THUMBNAIL_RAW_BGRx = 2;
  GST_PLAYER_THUMBNAIL_JPG = 3;
  GST_PLAYER_THUMBNAIL_PNG = 4;

function gst_player_get_video_snapshot(player: PGstPlayer; format: TGstPlayerSnapshotFormat; config: PGstStructure): PGstSample; cdecl; external libgstplayer;

function GST_PLAYER_CAST(obj: Pointer): PGstPlayer;
function GST_TYPE_PLAYER_STATE: TGType;
function GST_PLAYER_ERROR: TGQuark;
function GST_TYPE_PLAYER_ERROR: TGType;
function GST_TYPE_PLAYER_COLOR_BALANCE_TYPE: TGType;

// === Konventiert am: 8-10-24 18:48:09 ===

function GST_TYPE_PLAYER: TGType;
function GST_PLAYER(obj: Pointer): PGstPlayer;
function GST_PLAYER_CLASS(klass: Pointer): PGstPlayerClass;
function GST_IS_PLAYER(obj: Pointer): Tgboolean;
function GST_IS_PLAYER_CLASS(klass: Pointer): Tgboolean;
function GST_PLAYER_GET_CLASS(obj: Pointer): PGstPlayerClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_PLAYER: TGType;
begin
  GST_TYPE_PLAYER := gst_player_get_type;
end;

function GST_PLAYER(obj: Pointer): PGstPlayer;
begin
  Result := PGstPlayer(g_type_check_instance_cast(obj, GST_TYPE_PLAYER));
end;

function GST_PLAYER_CLASS(klass: Pointer): PGstPlayerClass;
begin
  Result := PGstPlayerClass(g_type_check_class_cast(klass, GST_TYPE_PLAYER));
end;

function GST_IS_PLAYER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_PLAYER);
end;

function GST_IS_PLAYER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_PLAYER);
end;

function GST_PLAYER_GET_CLASS(obj: Pointer): PGstPlayerClass;
begin
  Result := PGstPlayerClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_PLAYER_CAST(obj: Pointer): PGstPlayer;
begin
  GST_PLAYER_CAST := PGstPlayer(obj);
end;

function GST_TYPE_PLAYER_STATE: TGType;
begin
  GST_TYPE_PLAYER_STATE := gst_player_state_get_type;
end;

function GST_PLAYER_ERROR: TGQuark;
begin
  GST_PLAYER_ERROR := gst_player_error_quark;
end;

function GST_TYPE_PLAYER_ERROR: TGType;
begin
  GST_TYPE_PLAYER_ERROR := gst_player_error_get_type;
end;

function GST_TYPE_PLAYER_COLOR_BALANCE_TYPE: TGType;
begin
  GST_TYPE_PLAYER_COLOR_BALANCE_TYPE := gst_player_color_balance_type_get_type;
end;


{$ENDIF read_implementation}
