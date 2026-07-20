unit rtsp_session_pool;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, rtsp_session;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGstRTSPSessionPoolPrivate = type Pointer;

  PGstRTSPSessionPool = ^TGstRTSPSessionPool;
  TGstRTSPSessionPool = record
    parent: TGObject;
    priv: PGstRTSPSessionPoolPrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstRTSPSessionPoolClass = ^TGstRTSPSessionPoolClass;
  TGstRTSPSessionPoolClass = record
    parent_class: TGObjectClass;
    create_session_id: function(pool: PGstRTSPSessionPool): Pgchar; cdecl;
    create_session: function(pool: PGstRTSPSessionPool; id: Pgchar): PGstRTSPSession; cdecl;
    session_removed: procedure(pool: PGstRTSPSessionPool; session: PGstRTSPSession); cdecl;
    _gst_reserved: array[0..(GST_PADDING_LARGE - 1) - 1] of Tgpointer;
  end;

  TGstRTSPSessionPoolFunc = function(pool: PGstRTSPSessionPool; user_data: Tgpointer): Tgboolean; cdecl;
  TGstRTSPSessionPoolFilterFunc = function(pool: PGstRTSPSessionPool; session: PGstRTSPSession; user_data: Tgpointer): TGstRTSPFilterResult; cdecl;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_rtsp_session_pool_get_type: TGType; cdecl; external libgstrtsp;
function gst_rtsp_session_pool_new: PGstRTSPSessionPool; cdecl; external libgstrtsp;
procedure gst_rtsp_session_pool_set_max_sessions(pool: PGstRTSPSessionPool; max: Tguint); cdecl; external libgstrtsp;
function gst_rtsp_session_pool_get_max_sessions(pool: PGstRTSPSessionPool): Tguint; cdecl; external libgstrtsp;
function gst_rtsp_session_pool_get_n_sessions(pool: PGstRTSPSessionPool): Tguint; cdecl; external libgstrtsp;
function gst_rtsp_session_pool_create(pool: PGstRTSPSessionPool): PGstRTSPSession; cdecl; external libgstrtsp;
function gst_rtsp_session_pool_find(pool: PGstRTSPSessionPool; sessionid: Pgchar): PGstRTSPSession; cdecl; external libgstrtsp;
function gst_rtsp_session_pool_remove(pool: PGstRTSPSessionPool; sess: PGstRTSPSession): Tgboolean; cdecl; external libgstrtsp;
function gst_rtsp_session_pool_filter(pool: PGstRTSPSessionPool; func: TGstRTSPSessionPoolFilterFunc; user_data: Tgpointer): PGList; cdecl; external libgstrtsp;
function gst_rtsp_session_pool_cleanup(pool: PGstRTSPSessionPool): Tguint; cdecl; external libgstrtsp;
function gst_rtsp_session_pool_create_watch(pool: PGstRTSPSessionPool): PGSource; cdecl; external libgstrtsp;

// === Konventiert am: 20-7-26 13:43:37 ===

function GST_TYPE_RTSP_SESSION_POOL: TGType;
function GST_RTSP_SESSION_POOL(obj: Pointer): PGstRTSPSessionPool;
function GST_RTSP_SESSION_POOL_CLASS(klass: Pointer): PGstRTSPSessionPoolClass;
function GST_IS_RTSP_SESSION_POOL(obj: Pointer): Tgboolean;
function GST_IS_RTSP_SESSION_POOL_CLASS(klass: Pointer): Tgboolean;
function GST_RTSP_SESSION_POOL_GET_CLASS(obj: Pointer): PGstRTSPSessionPoolClass;
function GST_RTSP_SESSION_POOL_CAST(obj: Pointer): PGstRTSPSessionPool;
function GST_RTSP_SESSION_POOL_CLASS_CAST(klass: Pointer): PGstRTSPSessionPoolClass;
{$ENDIF read_function}

implementation

function GST_TYPE_RTSP_SESSION_POOL: TGType;
begin
  Result := gst_rtsp_session_pool_get_type;
end;

function GST_RTSP_SESSION_POOL(obj: Pointer): PGstRTSPSessionPool;
begin
  Result := PGstRTSPSessionPool(g_type_check_instance_cast(obj, GST_TYPE_RTSP_SESSION_POOL));
end;

function GST_RTSP_SESSION_POOL_CLASS(klass: Pointer): PGstRTSPSessionPoolClass;
begin
  Result := PGstRTSPSessionPoolClass(g_type_check_class_cast(klass, GST_TYPE_RTSP_SESSION_POOL));
end;

function GST_IS_RTSP_SESSION_POOL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_RTSP_SESSION_POOL);
end;

function GST_IS_RTSP_SESSION_POOL_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_RTSP_SESSION_POOL);
end;

function GST_RTSP_SESSION_POOL_GET_CLASS(obj: Pointer): PGstRTSPSessionPoolClass;
begin
  Result := PGstRTSPSessionPoolClass(PGTypeInstance(obj)^.g_class);
end;

function GST_RTSP_SESSION_POOL_CAST(obj: Pointer): PGstRTSPSessionPool;
begin
  Result := PGstRTSPSessionPool(obj);
end;

function GST_RTSP_SESSION_POOL_CLASS_CAST(klass: Pointer): PGstRTSPSessionPoolClass;
begin
  Result := PGstRTSPSessionPoolClass(klass);
end;

end.
