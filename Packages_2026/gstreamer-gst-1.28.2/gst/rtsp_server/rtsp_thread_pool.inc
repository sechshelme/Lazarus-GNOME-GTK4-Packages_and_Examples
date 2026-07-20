

  {$IFDEF read_enum}
type
  PGstRTSPThreadType = ^TGstRTSPThreadType;
  TGstRTSPThreadType = longint;
const
  GST_RTSP_THREAD_TYPE_CLIENT = 0;
  GST_RTSP_THREAD_TYPE_MEDIA = 1;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGstRTSPThread = ^TGstRTSPThread;
  TGstRTSPThread = record
    mini_object: TGstMiniObject;
    _type: TGstRTSPThreadType;
    context: PGMainContext;
    loop: PGMainLoop;
  end;

  PGstRTSPThreadPoolPrivate = type Pointer;

  PGstRTSPThreadPool = ^TGstRTSPThreadPool;
  TGstRTSPThreadPool = record
    parent: TGObject;
    priv: PGstRTSPThreadPoolPrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstRTSPThreadPoolClass = ^TGstRTSPThreadPoolClass;
  TGstRTSPThreadPoolClass = record
    parent_class: TGObjectClass;
    pool: PGThreadPool;
    get_thread: function(pool: PGstRTSPThreadPool; _type: TGstRTSPThreadType; ctx: PGstRTSPContext): PGstRTSPThread; cdecl;
    configure_thread: procedure(pool: PGstRTSPThreadPool; thread: PGstRTSPThread; ctx: PGstRTSPContext); cdecl;
    thread_enter: procedure(pool: PGstRTSPThreadPool; thread: PGstRTSPThread); cdecl;
    thread_leave: procedure(pool: PGstRTSPThreadPool; thread: PGstRTSPThread); cdecl;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_rtsp_thread_get_type: TGType; cdecl; external libgstrtsp;
function gst_rtsp_thread_new(_type: TGstRTSPThreadType): PGstRTSPThread; cdecl; external libgstrtsp;
function gst_rtsp_thread_reuse(thread: PGstRTSPThread): Tgboolean; cdecl; external libgstrtsp;
procedure gst_rtsp_thread_stop(thread: PGstRTSPThread); cdecl; external libgstrtsp;

function gst_rtsp_thread_pool_get_type: TGType; cdecl; external libgstrtsp;
function gst_rtsp_thread_pool_new: PGstRTSPThreadPool; cdecl; external libgstrtsp;
procedure gst_rtsp_thread_pool_set_max_threads(pool: PGstRTSPThreadPool; max_threads: Tgint); cdecl; external libgstrtsp;
function gst_rtsp_thread_pool_get_max_threads(pool: PGstRTSPThreadPool): Tgint; cdecl; external libgstrtsp;
function gst_rtsp_thread_pool_get_thread(pool: PGstRTSPThreadPool; _type: TGstRTSPThreadType; ctx: PGstRTSPContext): PGstRTSPThread; cdecl; external libgstrtsp;
procedure gst_rtsp_thread_pool_cleanup; cdecl; external libgstrtsp;

// === Konventiert am: 20-7-26 13:42:30 ===

function GST_TYPE_RTSP_THREAD_POOL: TGType;
function GST_RTSP_THREAD_POOL(obj: Pointer): PGstRTSPThreadPool;
function GST_RTSP_THREAD_POOL_CLASS(klass: Pointer): PGstRTSPThreadPoolClass;
function GST_IS_RTSP_THREAD_POOL(obj: Pointer): Tgboolean;
function GST_IS_RTSP_THREAD_POOL_CLASS(klass: Pointer): Tgboolean;
function GST_RTSP_THREAD_POOL_GET_CLASS(obj: Pointer): PGstRTSPThreadPoolClass;
function GST_RTSP_THREAD_POOL_CAST(obj: Pointer): PGstRTSPThreadPool;
function GST_RTSP_THREAD_POOL_CLASS_CAST(klass: Pointer): PGstRTSPThreadPoolClass;

function GST_TYPE_RTSP_THREAD: TGType;
function GST_IS_RTSP_THREAD(obj: Pointer): Tgboolean;
function GST_RTSP_THREAD_CAST(obj: Pointer): PGstRTSPThread;
function GST_RTSP_THREAD(obj: Pointer): PGstRTSPThread;

function gst_rtsp_thread_ref(thread: PGstRTSPThread): PGstRTSPThread;
procedure gst_rtsp_thread_unref(thread: PGstRTSPThread);
{$ENDIF read_function}


{$IFDEF read_implementation}

function GST_TYPE_RTSP_THREAD_POOL: TGType;
begin
  Result := gst_rtsp_thread_pool_get_type;
end;

function GST_RTSP_THREAD_POOL(obj: Pointer): PGstRTSPThreadPool;
begin
  Result := PGstRTSPThreadPool(g_type_check_instance_cast(obj, GST_TYPE_RTSP_THREAD_POOL));
end;

function GST_RTSP_THREAD_POOL_CLASS(klass: Pointer): PGstRTSPThreadPoolClass;
begin
  Result := PGstRTSPThreadPoolClass(g_type_check_class_cast(klass, GST_TYPE_RTSP_THREAD_POOL));
end;

function GST_IS_RTSP_THREAD_POOL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_RTSP_THREAD_POOL);
end;

function GST_IS_RTSP_THREAD_POOL_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_RTSP_THREAD_POOL);
end;

function GST_RTSP_THREAD_POOL_GET_CLASS(obj: Pointer): PGstRTSPThreadPoolClass;
begin
  Result := PGstRTSPThreadPoolClass(PGTypeInstance(obj)^.g_class);
end;

function GST_RTSP_THREAD_POOL_CAST(obj: Pointer): PGstRTSPThreadPool;
begin
  Result := PGstRTSPThreadPool(obj);
end;

function GST_RTSP_THREAD_POOL_CLASS_CAST(klass: Pointer): PGstRTSPThreadPoolClass;
begin
  Result := PGstRTSPThreadPoolClass(klass);
end;


function GST_TYPE_RTSP_THREAD: TGType;
begin
  Result := gst_rtsp_thread_get_type;
end;

function GST_IS_RTSP_THREAD(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_RTSP_THREAD);
end;

function GST_RTSP_THREAD_CAST(obj: Pointer): PGstRTSPThread;
begin
  Result := PGstRTSPThread(obj);
end;

function GST_RTSP_THREAD(obj: Pointer): PGstRTSPThread;
begin
  Result := PGstRTSPThread(obj);
end;

function gst_rtsp_thread_ref(thread: PGstRTSPThread): PGstRTSPThread;
begin
  Result := PGstRTSPThread(gst_mini_object_ref(PGstMiniObject(thread)));
end;

procedure gst_rtsp_thread_unref(thread: PGstRTSPThread);
begin
  gst_mini_object_unref(PGstMiniObject(thread));
end;

{$ENDIF read_implementation}
