
{$IFDEF read_interface}

type
  TGstDiscovererStreamInfo = record
  end;
  PGstDiscovererStreamInfo = ^TGstDiscovererStreamInfo;

  PGstDiscovererStreamInfoClass = ^TGstDiscovererStreamInfoClass;
  TGstDiscovererStreamInfoClass = TGObjectClass;

function gst_discoverer_stream_info_get_type: TGType; cdecl; external libgstreamer;
function gst_discoverer_stream_info_get_previous(info: PGstDiscovererStreamInfo): PGstDiscovererStreamInfo; cdecl; external libgstpbutils;
function gst_discoverer_stream_info_get_next(info: PGstDiscovererStreamInfo): PGstDiscovererStreamInfo; cdecl; external libgstpbutils;
function gst_discoverer_stream_info_get_caps(info: PGstDiscovererStreamInfo): PGstCaps; cdecl; external libgstpbutils;
function gst_discoverer_stream_info_get_tags(info: PGstDiscovererStreamInfo): PGstTagList; cdecl; external libgstpbutils;
function gst_discoverer_stream_info_get_toc(info: PGstDiscovererStreamInfo): PGstToc; cdecl; external libgstpbutils;
function gst_discoverer_stream_info_get_stream_id(info: PGstDiscovererStreamInfo): Pgchar; cdecl; external libgstpbutils;
function gst_discoverer_stream_info_get_misc(info: PGstDiscovererStreamInfo): PGstStructure; cdecl; external libgstpbutils; deprecated 'GST_PBUTILS_DEPRECATED_FOR(gst_discoverer_info_get_missing_elements_installer_details)';
function gst_discoverer_stream_info_get_stream_type_nick(info: PGstDiscovererStreamInfo): Pgchar; cdecl; external libgstpbutils;
function gst_discoverer_stream_info_get_stream_number(info: PGstDiscovererStreamInfo): Tgint; cdecl; external libgstpbutils;

type
  TGstDiscovererContainerInfo = record
  end;
  PGstDiscovererContainerInfo = ^TGstDiscovererContainerInfo;

  PGstDiscovererContainerInfoClass = ^TGstDiscovererContainerInfoClass;
  TGstDiscovererContainerInfoClass = TGObjectClass;

function gst_discoverer_container_info_get_type: TGType; cdecl; external libgstpbutils;
function gst_discoverer_container_info_get_streams(info: PGstDiscovererContainerInfo): PGList; cdecl; external libgstpbutils;
function gst_discoverer_container_info_get_tags(info: PGstDiscovererContainerInfo): PGstTagList; cdecl; external libgstpbutils;

type
  TGstDiscovererAudioInfo = record
  end;
  PGstDiscovererAudioInfo = ^TGstDiscovererAudioInfo;

  PGstDiscovererAudioInfoClass = ^TGstDiscovererAudioInfoClass;
  TGstDiscovererAudioInfoClass = TGObjectClass;

function gst_discoverer_audio_info_get_type: TGType; cdecl; external libgstpbutils;
function gst_discoverer_audio_info_get_channels(info: PGstDiscovererAudioInfo): Tguint; cdecl; external libgstpbutils;
function gst_discoverer_audio_info_get_channel_mask(info: PGstDiscovererAudioInfo): Tguint64; cdecl; external libgstpbutils;
function gst_discoverer_audio_info_get_sample_rate(info: PGstDiscovererAudioInfo): Tguint; cdecl; external libgstpbutils;
function gst_discoverer_audio_info_get_depth(info: PGstDiscovererAudioInfo): Tguint; cdecl; external libgstpbutils;
function gst_discoverer_audio_info_get_bitrate(info: PGstDiscovererAudioInfo): Tguint; cdecl; external libgstpbutils;
function gst_discoverer_audio_info_get_max_bitrate(info: PGstDiscovererAudioInfo): Tguint; cdecl; external libgstpbutils;
function gst_discoverer_audio_info_get_language(info: PGstDiscovererAudioInfo): Pgchar; cdecl; external libgstpbutils;

type
  TGstDiscovererVideoInfo = record
  end;
  PGstDiscovererVideoInfo = ^TGstDiscovererVideoInfo;

  PGstDiscovererVideoInfoClass = ^TGstDiscovererVideoInfoClass;
  TGstDiscovererVideoInfoClass = TGObjectClass;

function gst_discoverer_video_info_get_type: TGType; cdecl; external libgstpbutils;
function gst_discoverer_video_info_get_width(info: PGstDiscovererVideoInfo): Tguint; cdecl; external libgstpbutils;
function gst_discoverer_video_info_get_height(info: PGstDiscovererVideoInfo): Tguint; cdecl; external libgstpbutils;
function gst_discoverer_video_info_get_depth(info: PGstDiscovererVideoInfo): Tguint; cdecl; external libgstpbutils;
function gst_discoverer_video_info_get_framerate_num(info: PGstDiscovererVideoInfo): Tguint; cdecl; external libgstpbutils;
function gst_discoverer_video_info_get_framerate_denom(info: PGstDiscovererVideoInfo): Tguint; cdecl; external libgstpbutils;
function gst_discoverer_video_info_get_par_num(info: PGstDiscovererVideoInfo): Tguint; cdecl; external libgstpbutils;
function gst_discoverer_video_info_get_par_denom(info: PGstDiscovererVideoInfo): Tguint; cdecl; external libgstpbutils;
function gst_discoverer_video_info_is_interlaced(info: PGstDiscovererVideoInfo): Tgboolean; cdecl; external libgstpbutils;
function gst_discoverer_video_info_get_bitrate(info: PGstDiscovererVideoInfo): Tguint; cdecl; external libgstpbutils;
function gst_discoverer_video_info_get_max_bitrate(info: PGstDiscovererVideoInfo): Tguint; cdecl; external libgstpbutils;
function gst_discoverer_video_info_is_image(info: PGstDiscovererVideoInfo): Tgboolean; cdecl; external libgstpbutils;

type
  TGstDiscovererSubtitleInfo = record
  end;
  PGstDiscovererSubtitleInfo = ^TGstDiscovererSubtitleInfo;

  PGstDiscovererSubtitleInfoClass = ^TGstDiscovererSubtitleInfoClass;
  TGstDiscovererSubtitleInfoClass = TGObjectClass;

function gst_discoverer_subtitle_info_get_type: TGType; cdecl; external libgstpbutils;
function gst_discoverer_subtitle_info_get_language(info: PGstDiscovererSubtitleInfo): Pgchar; cdecl; external libgstpbutils;

type
  PGstDiscovererResult = ^TGstDiscovererResult;
  TGstDiscovererResult = longint;

const
  GST_DISCOVERER_OK = 0;
  GST_DISCOVERER_URI_INVALID = 1;
  GST_DISCOVERER_ERROR = 2;
  GST_DISCOVERER_TIMEOUT = 3;
  GST_DISCOVERER_BUSY = 4;
  GST_DISCOVERER_MISSING_PLUGINS = 5;

type
  PGstDiscovererSerializeFlags = ^TGstDiscovererSerializeFlags;
  TGstDiscovererSerializeFlags = longint;

const
  GST_DISCOVERER_SERIALIZE_BASIC = 0;
  GST_DISCOVERER_SERIALIZE_CAPS = 1 shl 0;
  GST_DISCOVERER_SERIALIZE_TAGS = 1 shl 1;
  GST_DISCOVERER_SERIALIZE_MISC = 1 shl 2;
  GST_DISCOVERER_SERIALIZE_ALL = (GST_DISCOVERER_SERIALIZE_CAPS or GST_DISCOVERER_SERIALIZE_TAGS) or GST_DISCOVERER_SERIALIZE_MISC;

type
  TGstDiscovererInfo = record
  end;
  PGstDiscovererInfo = ^TGstDiscovererInfo;

  PGstDiscovererInfoClass = ^TGstDiscovererInfoClass;
  TGstDiscovererInfoClass = TGObjectClass;

function gst_discoverer_info_get_type: TGType; cdecl; external libgstpbutils;
function gst_discoverer_info_copy(ptr: PGstDiscovererInfo): PGstDiscovererInfo; cdecl; external libgstpbutils;
function gst_discoverer_info_get_uri(info: PGstDiscovererInfo): Pgchar; cdecl; external libgstpbutils;
function gst_discoverer_info_get_result(info: PGstDiscovererInfo): TGstDiscovererResult; cdecl; external libgstpbutils;
function gst_discoverer_info_get_stream_info(info: PGstDiscovererInfo): PGstDiscovererStreamInfo; cdecl; external libgstpbutils;
function gst_discoverer_info_get_stream_list(info: PGstDiscovererInfo): PGList; cdecl; external libgstpbutils;
function gst_discoverer_info_get_duration(info: PGstDiscovererInfo): TGstClockTime; cdecl; external libgstpbutils;
function gst_discoverer_info_get_seekable(info: PGstDiscovererInfo): Tgboolean; cdecl; external libgstpbutils;
function gst_discoverer_info_get_live(info: PGstDiscovererInfo): Tgboolean; cdecl; external libgstpbutils;
function gst_discoverer_info_get_misc(info: PGstDiscovererInfo): PGstStructure; cdecl; external libgstpbutils; deprecated 'GST_PBUTILS_DEPRECATED_FOR(gst_discoverer_info_get_missing_elements_installer_details)';
function gst_discoverer_info_get_tags(info: PGstDiscovererInfo): PGstTagList; cdecl; external libgstpbutils; deprecated 'GST_PBUTILS_DEPRECATED';
function gst_discoverer_info_get_toc(info: PGstDiscovererInfo): PGstToc; cdecl; external libgstpbutils;
function gst_discoverer_info_get_missing_elements_installer_details(info: PGstDiscovererInfo): PPgchar; cdecl; external libgstpbutils;
function gst_discoverer_info_get_streams(info: PGstDiscovererInfo; streamtype: TGType): PGList; cdecl; external libgstpbutils;
function gst_discoverer_info_get_audio_streams(info: PGstDiscovererInfo): PGList; cdecl; external libgstpbutils;
function gst_discoverer_info_get_video_streams(info: PGstDiscovererInfo): PGList; cdecl; external libgstpbutils;
function gst_discoverer_info_get_subtitle_streams(info: PGstDiscovererInfo): PGList; cdecl; external libgstpbutils;
function gst_discoverer_info_get_container_streams(info: PGstDiscovererInfo): PGList; cdecl; external libgstpbutils;
function gst_discoverer_info_to_variant(info: PGstDiscovererInfo; flags: TGstDiscovererSerializeFlags): PGVariant; cdecl; external libgstpbutils;
function gst_discoverer_info_from_variant(variant: PGVariant): PGstDiscovererInfo; cdecl; external libgstpbutils;
procedure gst_discoverer_stream_info_list_free(infos: PGList); cdecl; external libgstpbutils;

type
  TGstDiscovererPrivate = record
  end;
  PGstDiscovererPrivate = ^TGstDiscovererPrivate;

  TGstDiscoverer = record
    parent: TGObject;
    priv: PGstDiscovererPrivate;
    _reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstDiscoverer = ^TGstDiscoverer;

  TGstDiscovererClass = record
    parentclass: TGObjectClass;
    finished: procedure(discoverer: PGstDiscoverer); cdecl;
    starting: procedure(discoverer: PGstDiscoverer); cdecl;
    discovered: procedure(discoverer: PGstDiscoverer; info: PGstDiscovererInfo; err: PGError); cdecl;
    source_setup: procedure(discoverer: PGstDiscoverer; Source: PGstElement); cdecl;
    load_serialize_info: function(dc: PGstDiscoverer; uri: Pgchar): PGstDiscovererInfo; cdecl;
    _reserved: array[0..(GST_PADDING - 1) - 1] of Tgpointer;
  end;
  PGstDiscovererClass = ^TGstDiscovererClass;

function gst_discoverer_get_type: TGType; cdecl; external libgstpbutils;
function gst_discoverer_new(timeout: TGstClockTime; err: PPGError): PGstDiscoverer; cdecl; external libgstpbutils;
procedure gst_discoverer_start(discoverer: PGstDiscoverer); cdecl; external libgstpbutils;
procedure gst_discoverer_stop(discoverer: PGstDiscoverer); cdecl; external libgstpbutils;
function gst_discoverer_discover_uri_async(discoverer: PGstDiscoverer; uri: Pgchar): Tgboolean; cdecl; external libgstpbutils;
function gst_discoverer_discover_uri(discoverer: PGstDiscoverer; uri: Pgchar; err: PPGError): PGstDiscovererInfo; cdecl; external libgstpbutils;

function gst_discoverer_stream_info_ref(info: Pointer): PGstDiscovererStreamInfo;
procedure gst_discoverer_stream_info_unref(info: Pointer);

procedure gst_discoverer_info_unref(info: Pointer);
function gst_discoverer_info_ref(info: Pointer): Pointer;

// === Konventiert am: 26-9-24 19:48:48 ===

function GST_TYPE_DISCOVERER_STREAM_INFO: TGType;
function GST_DISCOVERER_STREAM_INFO(obj: Pointer): PGstDiscovererStreamInfo;
function GST_IS_DISCOVERER_STREAM_INFO(obj: Pointer): Tgboolean;

function GST_TYPE_DISCOVERER_CONTAINER_INFO: TGType;
function GST_DISCOVERER_CONTAINER_INFO(obj: Pointer): PGstDiscovererContainerInfo;
function GST_IS_DISCOVERER_CONTAINER_INFO(obj: Pointer): Tgboolean;

function GST_TYPE_DISCOVERER_AUDIO_INFO: TGType;
function GST_DISCOVERER_AUDIO_INFO(obj: Pointer): PGstDiscovererAudioInfo;
function GST_IS_DISCOVERER_AUDIO_INFO(obj: Pointer): Tgboolean;

function GST_TYPE_DISCOVERER_VIDEO_INFO: TGType;
function GST_DISCOVERER_VIDEO_INFO(obj: Pointer): PGstDiscovererVideoInfo;
function GST_IS_DISCOVERER_VIDEO_INFO(obj: Pointer): Tgboolean;

function GST_TYPE_DISCOVERER_SUBTITLE_INFO: TGType;
function GST_DISCOVERER_SUBTITLE_INFO(obj: Pointer): PGstDiscovererSubtitleInfo;
function GST_IS_DISCOVERER_SUBTITLE_INFO(obj: Pointer): Tgboolean;

function GST_TYPE_DISCOVERER_INFO: TGType;
function GST_DISCOVERER_INFO(obj: Pointer): PGstDiscovererInfo;
function GST_IS_DISCOVERER_INFO(obj: Pointer): Tgboolean;

function GST_TYPE_DISCOVERER: TGType;
function GST_DISCOVERER(obj: Pointer): PGstDiscoverer;
function GST_DISCOVERER_CLASS(klass: Pointer): PGstDiscovererClass;
function GST_IS_DISCOVERER(obj: Pointer): Tgboolean;
function GST_IS_DISCOVERER_CLASS(klass: Pointer): Tgboolean;


{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_DISCOVERER_STREAM_INFO: TGType;
begin
  GST_TYPE_DISCOVERER_STREAM_INFO := gst_discoverer_stream_info_get_type;
end;

function GST_DISCOVERER_STREAM_INFO(obj: Pointer): PGstDiscovererStreamInfo;
begin
  Result := PGstDiscovererStreamInfo(g_type_check_instance_cast(obj, GST_TYPE_DISCOVERER_STREAM_INFO));
end;

function GST_IS_DISCOVERER_STREAM_INFO(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_DISCOVERER_STREAM_INFO);
end;

// ====

function GST_TYPE_DISCOVERER_CONTAINER_INFO: TGType;
begin
  GST_TYPE_DISCOVERER_CONTAINER_INFO := gst_discoverer_container_info_get_type;
end;

function GST_DISCOVERER_CONTAINER_INFO(obj: Pointer): PGstDiscovererContainerInfo;
begin
  Result := PGstDiscovererContainerInfo(g_type_check_instance_cast(obj, GST_TYPE_DISCOVERER_CONTAINER_INFO));
end;

function GST_IS_DISCOVERER_CONTAINER_INFO(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_DISCOVERER_CONTAINER_INFO);
end;

// ====

function GST_TYPE_DISCOVERER_AUDIO_INFO: TGType;
begin
  GST_TYPE_DISCOVERER_AUDIO_INFO := gst_discoverer_audio_info_get_type;
end;

function GST_DISCOVERER_AUDIO_INFO(obj: Pointer): PGstDiscovererAudioInfo;
begin
  Result := PGstDiscovererAudioInfo(g_type_check_instance_cast(obj, GST_TYPE_DISCOVERER_AUDIO_INFO));
end;

function GST_IS_DISCOVERER_AUDIO_INFO(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_DISCOVERER_AUDIO_INFO);
end;

// ====

function GST_TYPE_DISCOVERER_VIDEO_INFO: TGType;
begin
  GST_TYPE_DISCOVERER_VIDEO_INFO := gst_discoverer_video_info_get_type;
end;

function GST_DISCOVERER_VIDEO_INFO(obj: Pointer): PGstDiscovererVideoInfo;
begin
  Result := PGstDiscovererVideoInfo(g_type_check_instance_cast(obj, GST_TYPE_DISCOVERER_VIDEO_INFO));
end;

function GST_IS_DISCOVERER_VIDEO_INFO(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_DISCOVERER_VIDEO_INFO);
end;

// ====

function GST_TYPE_DISCOVERER_SUBTITLE_INFO: TGType;
begin
  GST_TYPE_DISCOVERER_SUBTITLE_INFO := gst_discoverer_subtitle_info_get_type;
end;

function GST_DISCOVERER_SUBTITLE_INFO(obj: Pointer): PGstDiscovererSubtitleInfo;
begin
  Result := PGstDiscovererSubtitleInfo(g_type_check_instance_cast(obj, GST_TYPE_DISCOVERER_SUBTITLE_INFO));
end;

function GST_IS_DISCOVERER_SUBTITLE_INFO(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_DISCOVERER_SUBTITLE_INFO);
end;

// ====

function GST_TYPE_DISCOVERER_INFO: TGType;
begin
  GST_TYPE_DISCOVERER_INFO := gst_discoverer_info_get_type;
end;

function GST_DISCOVERER_INFO(obj: Pointer): PGstDiscovererInfo;
begin
  Result := PGstDiscovererInfo(g_type_check_instance_cast(obj, GST_TYPE_DISCOVERER_INFO));
end;

function GST_IS_DISCOVERER_INFO(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_DISCOVERER_INFO);
end;

// ====

function GST_TYPE_DISCOVERER: TGType;
begin
  GST_TYPE_DISCOVERER := gst_discoverer_get_type;
end;

function GST_DISCOVERER(obj: Pointer): PGstDiscoverer;
begin
  Result := PGstDiscoverer(g_type_check_instance_cast(obj, GST_TYPE_DISCOVERER));
end;

function GST_DISCOVERER_CLASS(klass: Pointer): PGstDiscovererClass;
begin
  Result := PGstDiscovererClass(g_type_check_class_cast(klass, GST_TYPE_DISCOVERER));
end;

function GST_IS_DISCOVERER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_DISCOVERER);
end;

function GST_IS_DISCOVERER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_DISCOVERER);
end;

// ====


function gst_discoverer_stream_info_ref(info: Pointer): PGstDiscovererStreamInfo;
begin
  gst_discoverer_stream_info_ref := PGstDiscovererStreamInfo(g_object_ref(PGObject(info)));
end;

procedure gst_discoverer_stream_info_unref(info: Pointer);
begin
  g_object_unref(PGObject(info));
end;

procedure gst_discoverer_info_unref(info: Pointer);
begin
  g_object_unref(PGObject(info));
end;

function gst_discoverer_info_ref(info: Pointer): Pointer;
begin
  Result := g_object_ref(PGObject(info));
end;




{$ENDIF read_implementation}
