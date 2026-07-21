

  {$IFDEF read_struct}
type
  PGstRTSPSessionMediaPrivate = type Pointer;

  PGstRTSPSessionMedia = ^TGstRTSPSessionMedia;
  TGstRTSPSessionMedia = record
    parent: TGObject;
    priv: PGstRTSPSessionMediaPrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstRTSPSessionMediaClass = ^TGstRTSPSessionMediaClass;
  TGstRTSPSessionMediaClass = record
    parent_class: TGObjectClass;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_rtsp_session_media_get_type: TGType; cdecl; external libgstrtspserver;
function gst_rtsp_session_media_new(path: Pgchar; media: PGstRTSPMedia): PGstRTSPSessionMedia; cdecl; external libgstrtspserver;
function gst_rtsp_session_media_matches(media: PGstRTSPSessionMedia; path: Pgchar; matched: Pgint): Tgboolean; cdecl; external libgstrtspserver;
function gst_rtsp_session_media_get_media(media: PGstRTSPSessionMedia): PGstRTSPMedia; cdecl; external libgstrtspserver;
function gst_rtsp_session_media_get_base_time(media: PGstRTSPSessionMedia): TGstClockTime; cdecl; external libgstrtspserver;
function gst_rtsp_session_media_set_state(media: PGstRTSPSessionMedia; state: TGstState): Tgboolean; cdecl; external libgstrtspserver;
procedure gst_rtsp_session_media_set_rtsp_state(media: PGstRTSPSessionMedia; state: TGstRTSPState); cdecl; external libgstrtspserver;
function gst_rtsp_session_media_get_rtsp_state(media: PGstRTSPSessionMedia): TGstRTSPState; cdecl; external libgstrtspserver;
function gst_rtsp_session_media_set_transport(media: PGstRTSPSessionMedia; stream: PGstRTSPStream; tr: PGstRTSPTransport): PGstRTSPStreamTransport; cdecl; external libgstrtspserver;
function gst_rtsp_session_media_get_transport(media: PGstRTSPSessionMedia; idx: Tguint): PGstRTSPStreamTransport; cdecl; external libgstrtspserver;
function gst_rtsp_session_media_get_transports(media: PGstRTSPSessionMedia): PGPtrArray; cdecl; external libgstrtspserver;
function gst_rtsp_session_media_alloc_channels(media: PGstRTSPSessionMedia; range: PGstRTSPRange): Tgboolean; cdecl; external libgstrtspserver;
function gst_rtsp_session_media_get_rtpinfo(media: PGstRTSPSessionMedia): Pgchar; cdecl; external libgstrtspserver;

// === Konventiert am: 20-7-26 13:44:10 ===

function GST_TYPE_RTSP_SESSION_MEDIA: TGType;
function GST_RTSP_SESSION_MEDIA(obj: Pointer): PGstRTSPSessionMedia;
function GST_RTSP_SESSION_MEDIA_CLASS(klass: Pointer): PGstRTSPSessionMediaClass;
function GST_IS_RTSP_SESSION_MEDIA(obj: Pointer): Tgboolean;
function GST_IS_RTSP_SESSION_MEDIA_CLASS(klass: Pointer): Tgboolean;
function GST_RTSP_SESSION_MEDIA_GET_CLASS(obj: Pointer): PGstRTSPSessionMediaClass;
function GST_RTSP_SESSION_MEDIA_CAST(obj: Pointer): PGstRTSPSessionMedia;
function GST_RTSP_SESSION_MEDIA_CLASS_CAST(klass: Pointer): PGstRTSPSessionMediaClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GST_TYPE_RTSP_SESSION_MEDIA: TGType;
begin
  Result := gst_rtsp_session_media_get_type;
end;

function GST_RTSP_SESSION_MEDIA(obj: Pointer): PGstRTSPSessionMedia;
begin
  Result := PGstRTSPSessionMedia(g_type_check_instance_cast(obj, GST_TYPE_RTSP_SESSION_MEDIA));
end;

function GST_RTSP_SESSION_MEDIA_CLASS(klass: Pointer): PGstRTSPSessionMediaClass;
begin
  Result := PGstRTSPSessionMediaClass(g_type_check_class_cast(klass, GST_TYPE_RTSP_SESSION_MEDIA));
end;

function GST_IS_RTSP_SESSION_MEDIA(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_RTSP_SESSION_MEDIA);
end;

function GST_IS_RTSP_SESSION_MEDIA_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_RTSP_SESSION_MEDIA);
end;

function GST_RTSP_SESSION_MEDIA_GET_CLASS(obj: Pointer): PGstRTSPSessionMediaClass;
begin
  Result := PGstRTSPSessionMediaClass(PGTypeInstance(obj)^.g_class);
end;

function GST_RTSP_SESSION_MEDIA_CAST(obj: Pointer): PGstRTSPSessionMedia;
begin
  Result := PGstRTSPSessionMedia(obj);
end;

function GST_RTSP_SESSION_MEDIA_CLASS_CAST(klass: Pointer): PGstRTSPSessionMediaClass;
begin
  Result := PGstRTSPSessionMediaClass(klass);
end;

{$ENDIF read_implementation}
