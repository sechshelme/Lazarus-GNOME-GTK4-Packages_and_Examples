/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 20-09-2024   15:33                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}


type
  TGstTaskPoolFunction = procedure(user_data: pointer); cdecl;

  TGstTaskPool = record
    obj: TGstObject;
    pool: PGThreadPool;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstTaskPool = ^TGstTaskPool;

  TGstTaskPoolClass = record
    parent_class: TGstObjectClass;
    prepare: procedure(pool: PGstTaskPool; error: PPGError); cdecl;
    cleanup: procedure(pool: PGstTaskPool); cdecl;
    push: function(pool: PGstTaskPool; func: TGstTaskPoolFunction; user_data: Tgpointer; error: PPGError): Tgpointer; cdecl;
    join: procedure(pool: PGstTaskPool; id: Tgpointer); cdecl;
    dispose_handle: procedure(pool: PGstTaskPool; id: Tgpointer); cdecl;
    _gst_reserved: array[0..(GST_PADDING - 1) - 1] of Tgpointer;
  end;
  PGstTaskPoolClass = ^TGstTaskPoolClass;


function gst_task_pool_get_type: TGType; cdecl; external libgstreamer;
function gst_task_pool_new: PGstTaskPool; cdecl; external libgstreamer;
procedure gst_task_pool_prepare(pool: PGstTaskPool; error: PPGError); cdecl; external libgstreamer;
function gst_task_pool_push(pool: PGstTaskPool; func: TGstTaskPoolFunction; user_data: Tgpointer; error: PPGError): Tgpointer; cdecl; external libgstreamer;
procedure gst_task_pool_join(pool: PGstTaskPool; id: Tgpointer); cdecl; external libgstreamer;
procedure gst_task_pool_dispose_handle(pool: PGstTaskPool; id: Tgpointer); cdecl; external libgstreamer;
procedure gst_task_pool_cleanup(pool: PGstTaskPool); cdecl; external libgstreamer;

type
  TGstSharedTaskPoolPrivate = record
  end;
  PGstSharedTaskPoolPrivate = ^TGstSharedTaskPoolPrivate;

  TGstSharedTaskPool = record
    parent: TGstTaskPool;
    priv: PGstSharedTaskPoolPrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstSharedTaskPool = ^TGstSharedTaskPool;

  TGstSharedTaskPoolClass = record
    parent_class: TGstTaskPoolClass;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstSharedTaskPoolClass = ^TGstSharedTaskPoolClass;

function gst_shared_task_pool_get_type: TGType; cdecl; external libgstreamer;
procedure gst_shared_task_pool_set_max_threads(pool: PGstSharedTaskPool; max_threads: Tguint); cdecl; external libgstreamer;
function gst_shared_task_pool_get_max_threads(pool: PGstSharedTaskPool): Tguint; cdecl; external libgstreamer;
function gst_shared_task_pool_new: PGstTaskPool; cdecl; external libgstreamer;

function GST_TASK_POOL_CAST(obj: Pointer): PGstTaskPool;


// === Konventiert am: 14-9-24 14:59:49 ===

function GST_TYPE_TASK_POOL: TGType;
function GST_TASK_POOL(obj: Pointer): PGstTaskPool;
function GST_TASK_POOL_CLASS(klass: Pointer): PGstTaskPoolClass;
function GST_IS_TASK_POOL(obj: Pointer): Tgboolean;
function GST_IS_TASK_POOL_CLASS(klass: Pointer): Tgboolean;
function GST_TASK_POOL_GET_CLASS(obj: Pointer): PGstTaskPoolClass;

function GST_TYPE_SHARED_TASK_POOL: TGType;
function GST_SHARED_TASK_POOL(obj: Pointer): PGstSharedTaskPool;
function GST_SHARED_TASK_POOL_CLASS(klass: Pointer): PGstSharedTaskPoolClass;
function GST_IS_SHARED_TASK_POOL(obj: Pointer): Tgboolean;
function GST_IS_SHARED_TASK_POOL_CLASS(klass: Pointer): Tgboolean;
function GST_SHARED_TASK_POOL_GET_CLASS(obj: Pointer): PGstSharedTaskPoolClass;



{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_TASK_POOL: TGType;
begin
  GST_TYPE_TASK_POOL := gst_task_pool_get_type;
end;

function GST_TASK_POOL(obj: Pointer): PGstTaskPool;
begin
  Result := PGstTaskPool(g_type_check_instance_cast(obj, GST_TYPE_TASK_POOL));
end;

function GST_TASK_POOL_CLASS(klass: Pointer): PGstTaskPoolClass;
begin
  Result := PGstTaskPoolClass(g_type_check_class_cast(klass, GST_TYPE_TASK_POOL));
end;

function GST_IS_TASK_POOL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_TASK_POOL);
end;

function GST_IS_TASK_POOL_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_TASK_POOL);
end;

function GST_TASK_POOL_GET_CLASS(obj: Pointer): PGstTaskPoolClass;
begin
  Result := PGstTaskPoolClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_TYPE_SHARED_TASK_POOL: TGType;
begin
  GST_TYPE_SHARED_TASK_POOL := gst_shared_task_pool_get_type;
end;

function GST_SHARED_TASK_POOL(obj: Pointer): PGstSharedTaskPool;
begin
  Result := PGstSharedTaskPool(g_type_check_instance_cast(obj, GST_TYPE_SHARED_TASK_POOL));
end;

function GST_SHARED_TASK_POOL_CLASS(klass: Pointer): PGstSharedTaskPoolClass;
begin
  Result := PGstSharedTaskPoolClass(g_type_check_class_cast(klass, GST_TYPE_SHARED_TASK_POOL));
end;

function GST_IS_SHARED_TASK_POOL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_SHARED_TASK_POOL);
end;

function GST_IS_SHARED_TASK_POOL_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_SHARED_TASK_POOL);
end;

function GST_SHARED_TASK_POOL_GET_CLASS(obj: Pointer): PGstSharedTaskPoolClass;
begin
  Result := PGstSharedTaskPoolClass(PGTypeInstance(obj)^.g_class);
end;

// =====

function GST_TASK_POOL_CAST(obj: Pointer): PGstTaskPool;
begin
  GST_TASK_POOL_CAST := PGstTaskPool(obj);
end;


{$ENDIF read_implementation}
