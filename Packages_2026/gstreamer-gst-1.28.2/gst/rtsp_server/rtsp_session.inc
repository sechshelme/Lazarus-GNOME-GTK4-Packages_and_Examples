

  {$IFDEF read_enum}
type
  PGstRTSPFilterResult = ^TGstRTSPFilterResult;
  TGstRTSPFilterResult = longint;
const
  GST_RTSP_FILTER_REMOVE = 0;
  GST_RTSP_FILTER_KEEP = 1;
  GST_RTSP_FILTER_REF = 2;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGstRTSPSessionPrivate = type Pointer;

  PGstRTSPSession = ^TGstRTSPSession;
  TGstRTSPSession = record
    parent: TGObject;
    priv: PGstRTSPSessionPrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstRTSPSessionClass = ^TGstRTSPSessionClass;
  TGstRTSPSessionClass = record
    parent_class: TGObjectClass;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  TGstRTSPSessionFilterFunc = function(sess: PGstRTSPSession; media: PGstRTSPSessionMedia; user_data: Tgpointer): TGstRTSPFilterResult; cdecl;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_rtsp_session_get_type: TGType; cdecl; external libgstrtsp;
function gst_rtsp_session_new(sessionid: Pgchar): PGstRTSPSession; cdecl; external libgstrtsp;
function gst_rtsp_session_get_sessionid(session: PGstRTSPSession): Pgchar; cdecl; external libgstrtsp;
function gst_rtsp_session_get_header(session: PGstRTSPSession): Pgchar; cdecl; external libgstrtsp;
procedure gst_rtsp_session_set_timeout(session: PGstRTSPSession; timeout: Tguint); cdecl; external libgstrtsp;
function gst_rtsp_session_get_timeout(session: PGstRTSPSession): Tguint; cdecl; external libgstrtsp;
procedure gst_rtsp_session_touch(session: PGstRTSPSession); cdecl; external libgstrtsp;
procedure gst_rtsp_session_prevent_expire(session: PGstRTSPSession); cdecl; external libgstrtsp;
procedure gst_rtsp_session_allow_expire(session: PGstRTSPSession); cdecl; external libgstrtsp;
function gst_rtsp_session_next_timeout_usec(session: PGstRTSPSession; now: Tgint64): Tgint; cdecl; external libgstrtsp;
function gst_rtsp_session_is_expired_usec(session: PGstRTSPSession; now: Tgint64): Tgboolean; cdecl; external libgstrtsp;
function gst_rtsp_session_next_timeout(session: PGstRTSPSession; now: PGTimeVal): Tgint; cdecl; external libgstrtsp; deprecated;
function gst_rtsp_session_is_expired(session: PGstRTSPSession; now: PGTimeVal): Tgboolean; cdecl; external libgstrtsp; deprecated;
function gst_rtsp_session_manage_media(sess: PGstRTSPSession; path: Pgchar; media: PGstRTSPMedia): PGstRTSPSessionMedia; cdecl; external libgstrtsp;
function gst_rtsp_session_release_media(sess: PGstRTSPSession; media: PGstRTSPSessionMedia): Tgboolean; cdecl; external libgstrtsp;
function gst_rtsp_session_get_media(sess: PGstRTSPSession; path: Pgchar; matched: Pgint): PGstRTSPSessionMedia; cdecl; external libgstrtsp;
function gst_rtsp_session_dup_media(sess: PGstRTSPSession; path: Pgchar; matched: Pgint): PGstRTSPSessionMedia; cdecl; external libgstrtsp;

function gst_rtsp_session_filter(sess: PGstRTSPSession; func: TGstRTSPSessionFilterFunc; user_data: Tgpointer): PGList; cdecl; external libgstrtsp;

// === Konventiert am: 20-7-26 13:44:14 ===

function GST_TYPE_RTSP_SESSION: TGType;
function GST_RTSP_SESSION(obj: Pointer): PGstRTSPSession;
function GST_RTSP_SESSION_CLASS(klass: Pointer): PGstRTSPSessionClass;
function GST_IS_RTSP_SESSION(obj: Pointer): Tgboolean;
function GST_IS_RTSP_SESSION_CLASS(klass: Pointer): Tgboolean;
function GST_RTSP_SESSION_GET_CLASS(obj: Pointer): PGstRTSPSessionClass;
function GST_RTSP_SESSION_CAST(obj: Pointer): PGstRTSPSession;
function GST_RTSP_SESSION_CLASS_CAST(klass: Pointer): PGstRTSPSessionClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GST_TYPE_RTSP_SESSION: TGType;
begin
  Result := gst_rtsp_session_get_type;
end;

function GST_RTSP_SESSION(obj: Pointer): PGstRTSPSession;
begin
  Result := PGstRTSPSession(g_type_check_instance_cast(obj, GST_TYPE_RTSP_SESSION));
end;

function GST_RTSP_SESSION_CLASS(klass: Pointer): PGstRTSPSessionClass;
begin
  Result := PGstRTSPSessionClass(g_type_check_class_cast(klass, GST_TYPE_RTSP_SESSION));
end;

function GST_IS_RTSP_SESSION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_RTSP_SESSION);
end;

function GST_IS_RTSP_SESSION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_RTSP_SESSION);
end;

function GST_RTSP_SESSION_GET_CLASS(obj: Pointer): PGstRTSPSessionClass;
begin
  Result := PGstRTSPSessionClass(PGTypeInstance(obj)^.g_class);
end;

function GST_RTSP_SESSION_CAST(obj: Pointer): PGstRTSPSession;
begin
  Result := PGstRTSPSession(obj);
end;

function GST_RTSP_SESSION_CLASS_CAST(klass: Pointer): PGstRTSPSessionClass;
begin
  Result := PGstRTSPSessionClass(klass);
end;

{$ENDIF read_implementation}
