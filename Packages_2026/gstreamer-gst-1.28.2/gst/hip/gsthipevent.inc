{$IFDEF read_interface}


type
  PGstHipEventPoolPrivate = type Pointer;

  PGstHipEventPool = ^TGstHipEventPool;
  TGstHipEventPool = record
    parent: TGstObject;
    priv: PGstHipEventPoolPrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstHipEvent = type Pointer;
  PPGstHipEvent = ^PGstHipEvent;

  PGstHipEventPoolClass = ^TGstHipEventPoolClass;
  TGstHipEventPoolClass = record
    parent_class: TGstObjectClass;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;


function gst_hip_event_pool_get_type: TGType; cdecl; external libgsthip;
function gst_hip_event_get_type: TGType; cdecl; external libgsthip;
function gst_hip_event_pool_new(vendor: TGstHipVendor; device_id: Tguint): PGstHipEventPool; cdecl; external libgsthip;
function gst_hip_event_pool_acquire(pool: PGstHipEventPool; event: PPGstHipEvent): Tgboolean; cdecl; external libgsthip;
function gst_hip_event_get_vendor(event: PGstHipEvent): TGstHipVendor; cdecl; external libgsthip;
function gst_hip_event_get_device_id(event: PGstHipEvent): Tguint; cdecl; external libgsthip;
function gst_hip_event_record(event: PGstHipEvent; stream: ThipStream_t): ThipError_t; cdecl; external libgsthip;
function gst_hip_event_query(event: PGstHipEvent): ThipError_t; cdecl; external libgsthip;
function gst_hip_event_synchronize(event: PGstHipEvent): ThipError_t; cdecl; external libgsthip;
function gst_hip_event_ref(event: PGstHipEvent): PGstHipEvent; cdecl; external libgsthip;
procedure gst_hip_event_unref(event: PGstHipEvent); cdecl; external libgsthip;
procedure gst_clear_hip_event(event: PPGstHipEvent); cdecl; external libgsthip;

// === Konventiert am: 22-7-26 17:15:50 ===

function GST_TYPE_HIP_EVENT_POOL: TGType;
function GST_HIP_EVENT_POOL(obj: Pointer): PGstHipEventPool;
function GST_HIP_EVENT_POOL_CLASS(klass: Pointer): PGstHipEventPoolClass;
function GST_IS_HIP_EVENT_POOL(obj: Pointer): Tgboolean;
function GST_IS_HIP_EVENT_POOL_CLASS(klass: Pointer): Tgboolean;
function GST_HIP_EVENT_POOL_GET_CLASS(obj: Pointer): PGstHipEventPoolClass;
function GST_HIP_EVENT_POOL_CAST(obj: Pointer): PGstHipEventPool;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_HIP_EVENT_POOL: TGType;
begin
  GST_TYPE_HIP_EVENT_POOL := gst_hip_event_pool_get_type;
end;

function GST_HIP_EVENT_POOL(obj: Pointer): PGstHipEventPool;
begin
  Result := PGstHipEventPool(g_type_check_instance_cast(obj, GST_TYPE_HIP_EVENT_POOL));
end;

function GST_HIP_EVENT_POOL_CLASS(klass: Pointer): PGstHipEventPoolClass;
begin
  Result := PGstHipEventPoolClass(g_type_check_class_cast(klass, GST_TYPE_HIP_EVENT_POOL));
end;

function GST_IS_HIP_EVENT_POOL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_HIP_EVENT_POOL);
end;

function GST_IS_HIP_EVENT_POOL_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_HIP_EVENT_POOL);
end;

function GST_HIP_EVENT_POOL_GET_CLASS(obj: Pointer): PGstHipEventPoolClass;
begin
  Result := PGstHipEventPoolClass(PGTypeInstance(obj)^.g_class);
end;

function GST_HIP_EVENT_POOL_CAST(obj: Pointer): PGstHipEventPool;
begin
  GST_HIP_EVENT_POOL_CAST := PGstHipEventPool(obj);
end;


{$ENDIF read_implementation}
