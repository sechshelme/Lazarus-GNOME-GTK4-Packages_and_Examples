
{$IFDEF read_interface}

type
  TGstPlayStreamInfo = record
  end;
  PGstPlayStreamInfo = ^TGstPlayStreamInfo;

  TGstPlayVideoInfoClass = record
  end;
  PGstPlayVideoInfoClass = ^TGstPlayVideoInfoClass;

  TGstPlayAudioInfoClass = record
  end;
  PGstPlayAudioInfoClass = ^TGstPlayAudioInfoClass;

  TGstPlaySubtitleInfoClass = record
  end;
  PGstPlaySubtitleInfoClass = ^TGstPlaySubtitleInfoClass;

  TGstPlayMediaInfoClass = record
  end;
  PGstPlayMediaInfoClass = ^TGstPlayMediaInfoClass;

function gst_play_stream_info_get_type: TGType; cdecl; external libgstplay;
function gst_play_stream_info_get_index(info: PGstPlayStreamInfo): Tgint; cdecl; external libgstplay;
function gst_play_stream_info_get_stream_type(info: PGstPlayStreamInfo): Pgchar; cdecl; external libgstplay;
function gst_play_stream_info_get_tags(info: PGstPlayStreamInfo): PGstTagList; cdecl; external libgstplay;
function gst_play_stream_info_get_caps(info: PGstPlayStreamInfo): PGstCaps; cdecl; external libgstplay;
function gst_play_stream_info_get_codec(info: PGstPlayStreamInfo): Pgchar; cdecl; external libgstplay;

function gst_play_video_info_get_type: TGType; cdecl; external libgstplay;
function gst_play_video_info_get_bitrate(info: PGstPlayVideoInfo): Tgint; cdecl; external libgstplay;
function gst_play_video_info_get_max_bitrate(info: PGstPlayVideoInfo): Tgint; cdecl; external libgstplay;
function gst_play_video_info_get_width(info: PGstPlayVideoInfo): Tgint; cdecl; external libgstplay;
function gst_play_video_info_get_height(info: PGstPlayVideoInfo): Tgint; cdecl; external libgstplay;
procedure gst_play_video_info_get_framerate(info: PGstPlayVideoInfo; fps_n: Pgint; fps_d: Pgint); cdecl; external libgstplay;
procedure gst_play_video_info_get_pixel_aspect_ratio(info: PGstPlayVideoInfo; par_n: Pguint; par_d: Pguint); cdecl; external libgstplay;

function gst_play_audio_info_get_type: TGType; cdecl; external libgstplay;
function gst_play_audio_info_get_channels(info: PGstPlayAudioInfo): Tgint; cdecl; external libgstplay;
function gst_play_audio_info_get_sample_rate(info: PGstPlayAudioInfo): Tgint; cdecl; external libgstplay;
function gst_play_audio_info_get_bitrate(info: PGstPlayAudioInfo): Tgint; cdecl; external libgstplay;
function gst_play_audio_info_get_max_bitrate(info: PGstPlayAudioInfo): Tgint; cdecl; external libgstplay;
function gst_play_audio_info_get_language(info: PGstPlayAudioInfo): Pgchar; cdecl; external libgstplay;

function gst_play_subtitle_info_get_type: TGType; cdecl; external libgstplay;
function gst_play_subtitle_info_get_language(info: PGstPlaySubtitleInfo): Pgchar; cdecl; external libgstplay;

function gst_play_media_info_get_type: TGType; cdecl; external libgstplay;
function gst_play_media_info_get_uri(info: PGstPlayMediaInfo): Pgchar; cdecl; external libgstplay;
function gst_play_media_info_is_seekable(info: PGstPlayMediaInfo): Tgboolean; cdecl; external libgstplay;
function gst_play_media_info_is_live(info: PGstPlayMediaInfo): Tgboolean; cdecl; external libgstplay;
function gst_play_media_info_get_duration(info: PGstPlayMediaInfo): TGstClockTime; cdecl; external libgstplay;
function gst_play_media_info_get_stream_list(info: PGstPlayMediaInfo): PGList; cdecl; external libgstplay;
function gst_play_media_info_get_number_of_streams(info: PGstPlayMediaInfo): Tguint; cdecl; external libgstplay;
function gst_play_media_info_get_video_streams(info: PGstPlayMediaInfo): PGList; cdecl; external libgstplay;
function gst_play_media_info_get_number_of_video_streams(info: PGstPlayMediaInfo): Tguint; cdecl; external libgstplay;
function gst_play_media_info_get_audio_streams(info: PGstPlayMediaInfo): PGList; cdecl; external libgstplay;
function gst_play_media_info_get_number_of_audio_streams(info: PGstPlayMediaInfo): Tguint; cdecl; external libgstplay;
function gst_play_media_info_get_subtitle_streams(info: PGstPlayMediaInfo): PGList; cdecl; external libgstplay;
function gst_play_media_info_get_number_of_subtitle_streams(info: PGstPlayMediaInfo): Tguint; cdecl; external libgstplay;
function gst_play_media_info_get_tags(info: PGstPlayMediaInfo): PGstTagList; cdecl; external libgstplay;
function gst_play_media_info_get_title(info: PGstPlayMediaInfo): Pgchar; cdecl; external libgstplay;
function gst_play_media_info_get_container_format(info: PGstPlayMediaInfo): Pgchar; cdecl; external libgstplay;
function gst_play_media_info_get_image_sample(info: PGstPlayMediaInfo): PGstSample; cdecl; external libgstplay;
function gst_play_get_video_streams(info: PGstPlayMediaInfo): PGList; cdecl; external libgstplay;
function gst_play_get_audio_streams(info: PGstPlayMediaInfo): PGList; cdecl; external libgstplay;
function gst_play_get_subtitle_streams(info: PGstPlayMediaInfo): PGList; cdecl; external libgstplay;

// === Konventiert am: 11-10-24 19:17:10 ===

function GST_TYPE_PLAY_STREAM_INFO: TGType;
function GST_PLAY_STREAM_INFO(obj: Pointer): PGstPlayStreamInfo;
function GST_PLAY_STREAM_INFO_CLASS(klass: Pointer): PGstPlayStreamInfo;
function GST_IS_PLAY_STREAM_INFO(obj: Pointer): Tgboolean;
function GST_IS_PLAY_STREAM_INFO_CLASS(klass: Pointer): Tgboolean;

function GST_TYPE_PLAY_VIDEO_INFO: TGType;
function GST_PLAY_VIDEO_INFO(obj: Pointer): PGstPlayVideoInfo;
function GST_PLAY_VIDEO_INFO_CLASS(klass: Pointer): PGstPlayVideoInfoClass;
function GST_IS_PLAY_VIDEO_INFO(obj: Pointer): Tgboolean;
function GST_IS_PLAY_VIDEO_INFO_CLASS(klass: Pointer): Tgboolean;

function GST_TYPE_PLAY_AUDIO_INFO: TGType;
function GST_PLAY_AUDIO_INFO(obj: Pointer): PGstPlayAudioInfo;
function GST_PLAY_AUDIO_INFO_CLASS(klass: Pointer): PGstPlayAudioInfoClass;
function GST_IS_PLAY_AUDIO_INFO(obj: Pointer): Tgboolean;
function GST_IS_PLAY_AUDIO_INFO_CLASS(klass: Pointer): Tgboolean;

function GST_TYPE_PLAY_SUBTITLE_INFO: TGType;
function GST_PLAY_SUBTITLE_INFO(obj: Pointer): PGstPlaySubtitleInfo;
function GST_PLAY_SUBTITLE_INFO_CLASS(klass: Pointer): PGstPlaySubtitleInfoClass;
function GST_IS_PLAY_SUBTITLE_INFO(obj: Pointer): Tgboolean;
function GST_IS_PLAY_SUBTITLE_INFO_CLASS(klass: Pointer): Tgboolean;

function GST_TYPE_PLAY_MEDIA_INFO: TGType;
function GST_PLAY_MEDIA_INFO(obj: Pointer): PGstPlayMediaInfo;
function GST_PLAY_MEDIA_INFO_CLASS(klass: Pointer): PGstPlayMediaInfoClass;
function GST_IS_PLAY_MEDIA_INFO(obj: Pointer): Tgboolean;
function GST_IS_PLAY_MEDIA_INFO_CLASS(klass: Pointer): Tgboolean;


{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_PLAY_STREAM_INFO: TGType;
begin
  GST_TYPE_PLAY_STREAM_INFO := gst_play_stream_info_get_type;
end;

function GST_PLAY_STREAM_INFO(obj: Pointer): PGstPlayStreamInfo;
begin
  Result := PGstPlayStreamInfo(g_type_check_instance_cast(obj, GST_TYPE_PLAY_STREAM_INFO));
end;

function GST_PLAY_STREAM_INFO_CLASS(klass: Pointer): PGstPlayStreamInfo;
begin
  Result := PGstPlayStreamInfo(g_type_check_class_cast(klass, GST_TYPE_PLAY_STREAM_INFO));
end;

function GST_IS_PLAY_STREAM_INFO(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_PLAY_STREAM_INFO);
end;

function GST_IS_PLAY_STREAM_INFO_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_PLAY_STREAM_INFO);
end;

// ====

function GST_TYPE_PLAY_VIDEO_INFO: TGType;
begin
  GST_TYPE_PLAY_VIDEO_INFO := gst_play_video_info_get_type;
end;

function GST_PLAY_VIDEO_INFO(obj: Pointer): PGstPlayVideoInfo;
begin
  Result := PGstPlayVideoInfo(g_type_check_instance_cast(obj, GST_TYPE_PLAY_VIDEO_INFO));
end;

function GST_PLAY_VIDEO_INFO_CLASS(klass: Pointer): PGstPlayVideoInfoClass;
begin
  Result := PGstPlayVideoInfoClass(g_type_check_class_cast(klass, GST_TYPE_PLAY_VIDEO_INFO));
end;

function GST_IS_PLAY_VIDEO_INFO(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_PLAY_VIDEO_INFO);
end;

function GST_IS_PLAY_VIDEO_INFO_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_PLAY_VIDEO_INFO);
end;

// ====

function GST_TYPE_PLAY_AUDIO_INFO: TGType;
begin
  GST_TYPE_PLAY_AUDIO_INFO := gst_play_audio_info_get_type;
end;

function GST_PLAY_AUDIO_INFO(obj: Pointer): PGstPlayAudioInfo;
begin
  Result := PGstPlayAudioInfo(g_type_check_instance_cast(obj, GST_TYPE_PLAY_AUDIO_INFO));
end;

function GST_PLAY_AUDIO_INFO_CLASS(klass: Pointer): PGstPlayAudioInfoClass;
begin
  Result := PGstPlayAudioInfoClass(g_type_check_class_cast(klass, GST_TYPE_PLAY_AUDIO_INFO));
end;

function GST_IS_PLAY_AUDIO_INFO(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_PLAY_AUDIO_INFO);
end;

function GST_IS_PLAY_AUDIO_INFO_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_PLAY_AUDIO_INFO);
end;

// ====

function GST_TYPE_PLAY_SUBTITLE_INFO: TGType;
begin
  GST_TYPE_PLAY_SUBTITLE_INFO := gst_play_subtitle_info_get_type;
end;

function GST_PLAY_SUBTITLE_INFO(obj: Pointer): PGstPlaySubtitleInfo;
begin
  Result := PGstPlaySubtitleInfo(g_type_check_instance_cast(obj, GST_TYPE_PLAY_SUBTITLE_INFO));
end;

function GST_PLAY_SUBTITLE_INFO_CLASS(klass: Pointer): PGstPlaySubtitleInfoClass;
begin
  Result := PGstPlaySubtitleInfoClass(g_type_check_class_cast(klass, GST_TYPE_PLAY_SUBTITLE_INFO));
end;

function GST_IS_PLAY_SUBTITLE_INFO(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_PLAY_SUBTITLE_INFO);
end;

function GST_IS_PLAY_SUBTITLE_INFO_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_PLAY_SUBTITLE_INFO);
end;

// ====

function GST_TYPE_PLAY_MEDIA_INFO: TGType;
begin
  GST_TYPE_PLAY_MEDIA_INFO := gst_play_media_info_get_type;
end;

function GST_PLAY_MEDIA_INFO(obj: Pointer): PGstPlayMediaInfo;
begin
  Result := PGstPlayMediaInfo(g_type_check_instance_cast(obj, GST_TYPE_PLAY_MEDIA_INFO));
end;

function GST_PLAY_MEDIA_INFO_CLASS(klass: Pointer): PGstPlayMediaInfoClass;
begin
  Result := PGstPlayMediaInfoClass(g_type_check_class_cast(klass, GST_TYPE_PLAY_MEDIA_INFO));
end;

function GST_IS_PLAY_MEDIA_INFO(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_PLAY_MEDIA_INFO);
end;

function GST_IS_PLAY_MEDIA_INFO_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_PLAY_MEDIA_INFO);
end;


{$ENDIF read_implementation}
