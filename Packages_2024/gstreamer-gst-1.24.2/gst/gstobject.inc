
{$IFDEF read_interface}

type
  PGstObjectFlags = ^TGstObjectFlags;
  TGstObjectFlags = longint;

const
  GST_OBJECT_FLAG_MAY_BE_LEAKED = 1 shl 0;
  GST_OBJECT_FLAG_CONSTRUCTED = 1 shl 1;
  GST_OBJECT_FLAG_LAST = 1 shl 4;

type
  TGstObjectClass = record
    parent_class: TGInitiallyUnownedClass;
    path_string_separator: Pgchar;
    deep_notify: procedure(obj: PGstObject; orig: PGstObject; pspec: PGParamSpec); cdecl;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstObjectClass = ^TGstObjectClass;

function gst_object_get_type: TGType; cdecl; external libgstreamer;
function gst_object_set_name(obj: PGstObject; Name: Pgchar): Tgboolean; cdecl; external libgstreamer;
function gst_object_get_name(obj: PGstObject): Pgchar; cdecl; external libgstreamer;
function gst_object_set_parent(obj: PGstObject; parent: PGstObject): Tgboolean; cdecl; external libgstreamer;
function gst_object_get_parent(obj: PGstObject): PGstObject; cdecl; external libgstreamer;
procedure gst_object_unparent(obj: PGstObject); cdecl; external libgstreamer;
function gst_object_has_as_parent(obj: PGstObject; parent: PGstObject): Tgboolean; cdecl; external libgstreamer;
function gst_object_has_as_ancestor(obj: PGstObject; ancestor: PGstObject): Tgboolean; cdecl; external libgstreamer;
function gst_object_has_ancestor(obj: PGstObject; ancestor: PGstObject): Tgboolean; cdecl; external libgstreamer; deprecated 'GST_DEPRECATED_FOR(gst_object_has_as_ancestor)';
procedure gst_object_default_deep_notify(obj: PGObject; orig: PGstObject; pspec: PGParamSpec; excluded_props: PPgchar); cdecl; external libgstreamer;
function gst_object_ref(obj: Tgpointer): Tgpointer; cdecl; external libgstreamer;
procedure gst_object_unref(obj: Tgpointer); cdecl; external libgstreamer;
procedure gst_clear_object(object_ptr: PPGstObject); cdecl; external libgstreamer;

function gst_object_ref_sink(obj: Tgpointer): Tgpointer; cdecl; external libgstreamer;
function gst_object_replace(oldobj: PPGstObject; newobj: PGstObject): Tgboolean; cdecl; external libgstreamer;
function gst_object_get_path_string(obj: PGstObject): Pgchar; cdecl; external libgstreamer;
function gst_object_check_uniqueness(list: PGList; Name: Pgchar): Tgboolean; cdecl; external libgstreamer;

function gst_object_suggest_next_sync(obj: PGstObject): TGstClockTime; cdecl; external libgstreamer;
function gst_object_sync_values(obj: PGstObject; timestamp: TGstClockTime): Tgboolean; cdecl; external libgstreamer;
function gst_object_has_active_control_bindings(obj: PGstObject): Tgboolean; cdecl; external libgstreamer;
procedure gst_object_set_control_bindings_disabled(obj: PGstObject; disabled: Tgboolean); cdecl; external libgstreamer;
procedure gst_object_set_control_binding_disabled(obj: PGstObject; property_name: Pgchar; disabled: Tgboolean); cdecl; external libgstreamer;
function gst_object_add_control_binding(obj: PGstObject; binding: PGstControlBinding): Tgboolean; cdecl; external libgstreamer;
function gst_object_get_control_binding(obj: PGstObject; property_name: Pgchar): PGstControlBinding; cdecl; external libgstreamer;
function gst_object_remove_control_binding(obj: PGstObject; binding: PGstControlBinding): Tgboolean; cdecl; external libgstreamer;
function gst_object_get_value(obj: PGstObject; property_name: Pgchar; timestamp: TGstClockTime): PGValue; cdecl; external libgstreamer;
function gst_object_get_value_array(obj: PGstObject; property_name: Pgchar; timestamp: TGstClockTime; interval: TGstClockTime; n_values: Tguint;
  values: Tgpointer): Tgboolean; cdecl; external libgstreamer;
function gst_object_get_g_value_array(obj: PGstObject; property_name: Pgchar; timestamp: TGstClockTime; interval: TGstClockTime; n_values: Tguint;
  values: PGValue): Tgboolean; cdecl; external libgstreamer;
function gst_object_get_control_rate(obj: PGstObject): TGstClockTime; cdecl; external libgstreamer;
procedure gst_object_set_control_rate(obj: PGstObject; control_rate: TGstClockTime); cdecl; external libgstreamer;


function GST_OBJECT_CAST(obj: Pointer): PGstObject;
function GST_OBJECT_CLASS_CAST(klass: Pointer): PGstObjectClass;

function GST_OBJECT_REFCOUNT(obj: Pointer): Tguint;
function GST_OBJECT_REFCOUNT_VALUE(obj: Pointer): Tgint;
function GST_OBJECT_GET_LOCK(obj: Pointer): PGMutex;
procedure GST_OBJECT_LOCK(obj: Pointer);

function GST_OBJECT_TRYLOCK(obj: Pointer): Tgboolean;
procedure GST_OBJECT_UNLOCK(obj: Pointer);
function GST_OBJECT_NAME(obj: Pointer): Pgchar;
function GST_OBJECT_PARENT(obj: Pointer): PGstObject;
function GST_OBJECT_FLAGS(obj: Pointer): Tguint32;
function GST_OBJECT_FLAG_IS_SET(obj: Pointer; flag: TGstObjectFlags): Tgboolean;

procedure GST_OBJECT_FLAG_SET(var obj: PGstObject; flag: Tguint32);
procedure GST_OBJECT_FLAG_UNSET(var obj: PGstObject; flag: Tguint32);

// === Konventiert am: 11-9-24 13:47:40 ===

function GST_TYPE_OBJECT: TGType;
function GST_OBJECT(obj: Pointer): PGstObject;
function GST_OBJECT_CLASS(klass: Pointer): PGstObjectClass;
function GST_IS_OBJECT(obj: Pointer): Tgboolean;
function GST_IS_OBJECT_CLASS(klass: Pointer): Tgboolean;
function GST_OBJECT_GET_CLASS(obj: Pointer): PGstObjectClass;


{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_OBJECT: TGType;
begin
  GST_TYPE_OBJECT := gst_object_get_type;
end;

function GST_OBJECT(obj: Pointer): PGstObject;
begin
  Result := PGstObject(g_type_check_instance_cast(obj, GST_TYPE_OBJECT));
end;

function GST_OBJECT_CLASS(klass: Pointer): PGstObjectClass;
begin
  Result := PGstObjectClass(g_type_check_class_cast(klass, GST_TYPE_OBJECT));
end;

function GST_IS_OBJECT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_OBJECT);
end;

function GST_IS_OBJECT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_OBJECT);
end;

function GST_OBJECT_GET_CLASS(obj: Pointer): PGstObjectClass;
begin
  Result := PGstObjectClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_OBJECT_CAST(obj: Pointer): PGstObject;
begin
  GST_OBJECT_CAST := PGstObject(obj);
end;

function GST_OBJECT_CLASS_CAST(klass: Pointer): PGstObjectClass;
begin
  GST_OBJECT_CLASS_CAST := PGstObjectClass(klass);
end;

function GST_OBJECT_REFCOUNT(obj: Pointer): Tguint;
begin
  GST_OBJECT_REFCOUNT := (PGObject(obj))^.ref_count;
end;

function GST_OBJECT_REFCOUNT_VALUE(obj: Pointer): Tgint;
begin
  // #define GST_OBJECT_REFCOUNT_VALUE(obj)          g_atomic_int_get ((gint *) &GST_OBJECT_REFCOUNT(obj))
  Result := g_atomic_int_get(@PGObject(obj)^.ref_count);
end;

function GST_OBJECT_GET_LOCK(obj: Pointer): PGMutex;
begin
  GST_OBJECT_GET_LOCK := @PGstObject(obj)^.lock;
end;

procedure GST_OBJECT_LOCK(obj: Pointer);
begin
  g_mutex_lock(GST_OBJECT_GET_LOCK(obj));
end;

function GST_OBJECT_TRYLOCK(obj: Pointer): Tgboolean;
begin
  GST_OBJECT_TRYLOCK := g_mutex_trylock(GST_OBJECT_GET_LOCK(obj));
end;

procedure GST_OBJECT_UNLOCK(obj: Pointer);
begin
  g_mutex_unlock(GST_OBJECT_GET_LOCK(obj));
end;

function GST_OBJECT_NAME(obj: Pointer): Pgchar;
begin
  GST_OBJECT_NAME := (GST_OBJECT_CAST(obj))^.Name;
end;

function GST_OBJECT_PARENT(obj: Pointer): PGstObject;
begin
  GST_OBJECT_PARENT := (GST_OBJECT_CAST(obj))^.parent;
end;

function GST_OBJECT_FLAGS(obj: Pointer): Tguint32;
begin
  GST_OBJECT_FLAGS := (GST_OBJECT_CAST(obj))^.flags;
end;

function GST_OBJECT_FLAG_IS_SET(obj: Pointer; flag: TGstObjectFlags): Tgboolean;
begin
  GST_OBJECT_FLAG_IS_SET := ((GST_OBJECT_FLAGS(obj)) and flag) = flag;
end;

procedure GST_OBJECT_FLAG_SET(var obj: PGstObject; flag: Tguint32);
begin
  obj^.flags := obj^.flags or flag;
end;

procedure GST_OBJECT_FLAG_UNSET(var obj: PGstObject; flag: Tguint32);
begin
  obj^.flags := obj^.flags and not flag;
end;


{$ENDIF read_implementation}
