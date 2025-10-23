
{$IFDEF read_interface}

type
  TGstPlayerStreamInfo = record
  end;
  PGstPlayerStreamInfo = ^TGstPlayerStreamInfo;

  TGstPlayerVideoInfo = record
  end;
  PGstPlayerVideoInfo = ^TGstPlayerVideoInfo;

  TGstPlayerAudioInfo = record
  end;
  PGstPlayerAudioInfo = ^TGstPlayerAudioInfo;

  TGstPlayerSubtitleInfo = record
  end;
  PGstPlayerSubtitleInfo = ^TGstPlayerSubtitleInfo;

  TGstPlayerMediaInfo = record
  end;
  PGstPlayerMediaInfo = ^TGstPlayerMediaInfo;

  TGstPlayerStreamInfoClass = record
  end;
  PGstPlayerStreamInfoClass = ^TGstPlayerStreamInfoClass;

  TGstPlayerVideoInfoClass = record
  end;
  PGstPlayerVideoInfoClass = ^TGstPlayerVideoInfoClass;

  TGstPlayerAudioInfoClass = record
  end;
  PGstPlayerAudioInfoClass = ^TGstPlayerAudioInfoClass;

  TGstPlayerSubtitleInfoClass = record
  end;
  PGstPlayerSubtitleInfoClass = ^TGstPlayerSubtitleInfoClass;

  TGstPlayerMediaInfoClass = record
  end;
  PGstPlayerMediaInfoClass = ^TGstPlayerMediaInfoClass;

function gst_player_stream_info_get_type: TGType; cdecl; external libgstplayer;
function gst_player_stream_info_get_index(info: PGstPlayerStreamInfo): Tgint; cdecl; external libgstplayer;
function gst_player_stream_info_get_stream_type(info: PGstPlayerStreamInfo): Pgchar; cdecl; external libgstplayer;
function gst_player_stream_info_get_tags(info: PGstPlayerStreamInfo): PGstTagList; cdecl; external libgstplayer;
function gst_player_stream_info_get_caps(info: PGstPlayerStreamInfo): PGstCaps; cdecl; external libgstplayer;
function gst_player_stream_info_get_codec(info: PGstPlayerStreamInfo): Pgchar; cdecl; external libgstplayer;

function gst_player_video_info_get_type: TGType; cdecl; external libgstplayer;
function gst_player_video_info_get_bitrate(info: PGstPlayerVideoInfo): Tgint; cdecl; external libgstplayer;
function gst_player_video_info_get_max_bitrate(info: PGstPlayerVideoInfo): Tgint; cdecl; external libgstplayer;
function gst_player_video_info_get_width(info: PGstPlayerVideoInfo): Tgint; cdecl; external libgstplayer;
function gst_player_video_info_get_height(info: PGstPlayerVideoInfo): Tgint; cdecl; external libgstplayer;
procedure gst_player_video_info_get_framerate(info: PGstPlayerVideoInfo; fps_n: Pgint; fps_d: Pgint); cdecl; external libgstplayer;
procedure gst_player_video_info_get_pixel_aspect_ratio(info: PGstPlayerVideoInfo; par_n: Pguint; par_d: Pguint); cdecl; external libgstplayer;

function gst_player_audio_info_get_type: TGType; cdecl; external libgstplayer;
function gst_player_audio_info_get_channels(info: PGstPlayerAudioInfo): Tgint; cdecl; external libgstplayer;
function gst_player_audio_info_get_sample_rate(info: PGstPlayerAudioInfo): Tgint; cdecl; external libgstplayer;
function gst_player_audio_info_get_bitrate(info: PGstPlayerAudioInfo): Tgint; cdecl; external libgstplayer;
function gst_player_audio_info_get_max_bitrate(info: PGstPlayerAudioInfo): Tgint; cdecl; external libgstplayer;
function gst_player_audio_info_get_language(info: PGstPlayerAudioInfo): Pgchar; cdecl; external libgstplayer;

function gst_player_subtitle_info_get_type: TGType; cdecl; external libgstplayer;
function gst_player_subtitle_info_get_language(info: PGstPlayerSubtitleInfo): Pgchar; cdecl; external libgstplayer;

function gst_player_media_info_get_type: TGType; cdecl; external libgstplayer;
function gst_player_media_info_get_uri(info: PGstPlayerMediaInfo): Pgchar; cdecl; external libgstplayer;
function gst_player_media_info_is_seekable(info: PGstPlayerMediaInfo): Tgboolean; cdecl; external libgstplayer;
function gst_player_media_info_is_live(info: PGstPlayerMediaInfo): Tgboolean; cdecl; external libgstplayer;
function gst_player_media_info_get_duration(info: PGstPlayerMediaInfo): TGstClockTime; cdecl; external libgstplayer;
function gst_player_media_info_get_stream_list(info: PGstPlayerMediaInfo): PGList; cdecl; external libgstplayer;
function gst_player_media_info_get_number_of_streams(info: PGstPlayerMediaInfo): Tguint; cdecl; external libgstplayer;
function gst_player_media_info_get_video_streams(info: PGstPlayerMediaInfo): PGList; cdecl; external libgstplayer;
function gst_player_media_info_get_number_of_video_streams(info: PGstPlayerMediaInfo): Tguint; cdecl; external libgstplayer;
function gst_player_media_info_get_audio_streams(info: PGstPlayerMediaInfo): PGList; cdecl; external libgstplayer;
function gst_player_media_info_get_number_of_audio_streams(info: PGstPlayerMediaInfo): Tguint; cdecl; external libgstplayer;
function gst_player_media_info_get_subtitle_streams(info: PGstPlayerMediaInfo): PGList; cdecl; external libgstplayer;
function gst_player_media_info_get_number_of_subtitle_streams(info: PGstPlayerMediaInfo): Tguint; cdecl; external libgstplayer;
function gst_player_media_info_get_tags(info: PGstPlayerMediaInfo): PGstTagList; cdecl; external libgstplayer;
function gst_player_media_info_get_title(info: PGstPlayerMediaInfo): Pgchar; cdecl; external libgstplayer;
function gst_player_media_info_get_container_format(info: PGstPlayerMediaInfo): Pgchar; cdecl; external libgstplayer;
function gst_player_media_info_get_image_sample(info: PGstPlayerMediaInfo): PGstSample; cdecl; external libgstplayer;
function gst_player_get_video_streams(info: PGstPlayerMediaInfo): PGList; cdecl; external libgstplayer;
function gst_player_get_audio_streams(info: PGstPlayerMediaInfo): PGList; cdecl; external libgstplayer;
function gst_player_get_subtitle_streams(info: PGstPlayerMediaInfo): PGList; cdecl; external libgstplayer;

// === Konventiert am: 8-10-24 18:49:41 ===

function GST_TYPE_PLAYER_STREAM_INFO: TGType;
function GST_PLAYER_STREAM_INFO(obj: Pointer): PGstPlayerStreamInfo;
function GST_PLAYER_STREAM_INFO_CLASS(klass: Pointer): PGstPlayerStreamInfo;
function GST_IS_PLAYER_STREAM_INFO(obj: Pointer): Tgboolean;
function GST_IS_PLAYER_STREAM_INFO_CLASS(klass: Pointer): Tgboolean;

function GST_TYPE_PLAYER_VIDEO_INFO: TGType;
function GST_PLAYER_VIDEO_INFO(obj: Pointer): PGstPlayerVideoInfo;
function GST_PLAYER_VIDEO_INFO_CLASS(klass: Pointer): PGstPlayerVideoInfoClass;
function GST_IS_PLAYER_VIDEO_INFO(obj: Pointer): Tgboolean;
function GST_IS_PLAYER_VIDEO_INFO_CLASS(klass: Pointer): Tgboolean;

function GST_TYPE_PLAYER_AUDIO_INFO: TGType;
function GST_PLAYER_AUDIO_INFO(obj: Pointer): PGstPlayerAudioInfo;
function GST_PLAYER_AUDIO_INFO_CLASS(klass: Pointer): PGstPlayerAudioInfoClass;
function GST_IS_PLAYER_AUDIO_INFO(obj: Pointer): Tgboolean;
function GST_IS_PLAYER_AUDIO_INFO_CLASS(klass: Pointer): Tgboolean;

function GST_TYPE_PLAYER_SUBTITLE_INFO: TGType;
function GST_PLAYER_SUBTITLE_INFO(obj: Pointer): PGstPlayerSubtitleInfo;
function GST_PLAYER_SUBTITLE_INFO_CLASS(klass: Pointer): PGstPlayerSubtitleInfoClass;
function GST_IS_PLAYER_SUBTITLE_INFO(obj: Pointer): Tgboolean;
function GST_IS_PLAYER_SUBTITLE_INFO_CLASS(klass: Pointer): Tgboolean;

function GST_TYPE_PLAYER_MEDIA_INFO: TGType;
function GST_PLAYER_MEDIA_INFO(obj: Pointer): PGstPlayerMediaInfo;
function GST_PLAYER_MEDIA_INFO_CLASS(klass: Pointer): PGstPlayerMediaInfoClass;
function GST_IS_PLAYER_MEDIA_INFO(obj: Pointer): Tgboolean;
function GST_IS_PLAYER_MEDIA_INFO_CLASS(klass: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_PLAYER_STREAM_INFO: TGType;
begin
  GST_TYPE_PLAYER_STREAM_INFO := gst_player_stream_info_get_type;
end;

function GST_PLAYER_STREAM_INFO(obj: Pointer): PGstPlayerStreamInfo;
begin
  Result := PGstPlayerStreamInfo(g_type_check_instance_cast(obj, GST_TYPE_PLAYER_STREAM_INFO));
end;

function GST_PLAYER_STREAM_INFO_CLASS(klass: Pointer): PGstPlayerStreamInfo;
begin
  Result := PGstPlayerStreamInfo(g_type_check_class_cast(klass, GST_TYPE_PLAYER_STREAM_INFO));
end;

function GST_IS_PLAYER_STREAM_INFO(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_PLAYER_STREAM_INFO);
end;

function GST_IS_PLAYER_STREAM_INFO_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_PLAYER_STREAM_INFO);
end;

// ====

function GST_TYPE_PLAYER_VIDEO_INFO: TGType;
begin
  GST_TYPE_PLAYER_VIDEO_INFO := gst_player_video_info_get_type;
end;

function GST_PLAYER_VIDEO_INFO(obj: Pointer): PGstPlayerVideoInfo;
begin
  Result := PGstPlayerVideoInfo(g_type_check_instance_cast(obj, GST_TYPE_PLAYER_VIDEO_INFO));
end;

function GST_PLAYER_VIDEO_INFO_CLASS(klass: Pointer): PGstPlayerVideoInfoClass;
begin
  Result := PGstPlayerVideoInfoClass(g_type_check_class_cast(klass, GST_TYPE_PLAYER_VIDEO_INFO));
end;

function GST_IS_PLAYER_VIDEO_INFO(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_PLAYER_VIDEO_INFO);
end;

function GST_IS_PLAYER_VIDEO_INFO_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_PLAYER_VIDEO_INFO);
end;

// ====

function GST_TYPE_PLAYER_AUDIO_INFO: TGType;
begin
  GST_TYPE_PLAYER_AUDIO_INFO := gst_player_audio_info_get_type;
end;

function GST_PLAYER_AUDIO_INFO(obj: Pointer): PGstPlayerAudioInfo;
begin
  Result := PGstPlayerAudioInfo(g_type_check_instance_cast(obj, GST_TYPE_PLAYER_AUDIO_INFO));
end;

function GST_PLAYER_AUDIO_INFO_CLASS(klass: Pointer): PGstPlayerAudioInfoClass;
begin
  Result := PGstPlayerAudioInfoClass(g_type_check_class_cast(klass, GST_TYPE_PLAYER_AUDIO_INFO));
end;

function GST_IS_PLAYER_AUDIO_INFO(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_PLAYER_AUDIO_INFO);
end;

function GST_IS_PLAYER_AUDIO_INFO_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_PLAYER_AUDIO_INFO);
end;

// ====

function GST_TYPE_PLAYER_SUBTITLE_INFO: TGType;
begin
  GST_TYPE_PLAYER_SUBTITLE_INFO := gst_player_subtitle_info_get_type;
end;

function GST_PLAYER_SUBTITLE_INFO(obj: Pointer): PGstPlayerSubtitleInfo;
begin
  Result := PGstPlayerSubtitleInfo(g_type_check_instance_cast(obj, GST_TYPE_PLAYER_SUBTITLE_INFO));
end;

function GST_PLAYER_SUBTITLE_INFO_CLASS(klass: Pointer): PGstPlayerSubtitleInfoClass;
begin
  Result := PGstPlayerSubtitleInfoClass(g_type_check_class_cast(klass, GST_TYPE_PLAYER_SUBTITLE_INFO));
end;

function GST_IS_PLAYER_SUBTITLE_INFO(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_PLAYER_SUBTITLE_INFO);
end;

function GST_IS_PLAYER_SUBTITLE_INFO_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_PLAYER_SUBTITLE_INFO);
end;

// ====

function GST_TYPE_PLAYER_MEDIA_INFO: TGType;
begin
  GST_TYPE_PLAYER_MEDIA_INFO := gst_player_media_info_get_type;
end;

function GST_PLAYER_MEDIA_INFO(obj: Pointer): PGstPlayerMediaInfo;
begin
  Result := PGstPlayerMediaInfo(g_type_check_instance_cast(obj, GST_TYPE_PLAYER_MEDIA_INFO));
end;

function GST_PLAYER_MEDIA_INFO_CLASS(klass: Pointer): PGstPlayerMediaInfoClass;
begin
  Result := PGstPlayerMediaInfoClass(g_type_check_class_cast(klass, GST_TYPE_PLAYER_MEDIA_INFO));
end;

function GST_IS_PLAYER_MEDIA_INFO(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_PLAYER_MEDIA_INFO);
end;

function GST_IS_PLAYER_MEDIA_INFO_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_PLAYER_MEDIA_INFO);
end;


{$ENDIF read_implementation}
