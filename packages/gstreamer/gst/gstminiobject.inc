
{$IFDEF read_interface}


var
  _gst_mini_object_type: TGType; cvar;external libgstreamer;

function gst_mini_object_get_type: TGType; cdecl; external libgstreamer;

type
  PGstMiniObjectFlags = ^TGstMiniObjectFlags;
  TGstMiniObjectFlags = longint;

const
  GST_MINI_OBJECT_FLAG_LOCKABLE = 1 shl 0;
  GST_MINI_OBJECT_FLAG_LOCK_READONLY = 1 shl 1;
  GST_MINI_OBJECT_FLAG_MAY_BE_LEAKED = 1 shl 2;
  GST_MINI_OBJECT_FLAG_LAST = 1 shl 4;

type
  PGstLockFlags = ^TGstLockFlags;
  TGstLockFlags = longint;

const
  GST_LOCK_FLAG_READ = 1 shl 0;
  GST_LOCK_FLAG_WRITE = 1 shl 1;
  GST_LOCK_FLAG_EXCLUSIVE = 1 shl 2;
  GST_LOCK_FLAG_LAST = 1 shl 8;

procedure gst_mini_object_init(mini_object: PGstMiniObject; flags: Tguint; _type: TGType; copy_func: TGstMiniObjectCopyFunction; dispose_func: TGstMiniObjectDisposeFunction;
  free_func: TGstMiniObjectFreeFunction); cdecl; external libgstreamer;
function gst_mini_object_ref(mini_object: PGstMiniObject): PGstMiniObject; cdecl; external libgstreamer;
procedure gst_mini_object_unref(mini_object: PGstMiniObject); cdecl; external libgstreamer;
procedure gst_clear_mini_object(object_ptr: PPGstMiniObject); cdecl; external libgstreamer;

procedure gst_mini_object_weak_ref(obj: PGstMiniObject; notify: TGstMiniObjectNotify; Data: Tgpointer); cdecl; external libgstreamer;
procedure gst_mini_object_weak_unref(obj: PGstMiniObject; notify: TGstMiniObjectNotify; Data: Tgpointer); cdecl; external libgstreamer;
function gst_mini_object_lock(obj: PGstMiniObject; flags: TGstLockFlags): Tgboolean; cdecl; external libgstreamer;
procedure gst_mini_object_unlock(obj: PGstMiniObject; flags: TGstLockFlags); cdecl; external libgstreamer;
function gst_mini_object_is_writable(mini_object: PGstMiniObject): Tgboolean; cdecl; external libgstreamer;
function gst_mini_object_make_writable(mini_object: PGstMiniObject): PGstMiniObject; cdecl; external libgstreamer;
function gst_mini_object_copy(mini_object: PGstMiniObject): PGstMiniObject; cdecl; external libgstreamer;
procedure gst_mini_object_set_qdata(obj: PGstMiniObject; quark: TGQuark; Data: Tgpointer; Destroy: TGDestroyNotify); cdecl; external libgstreamer;
function gst_mini_object_get_qdata(obj: PGstMiniObject; quark: TGQuark): Tgpointer; cdecl; external libgstreamer;
function gst_mini_object_steal_qdata(obj: PGstMiniObject; quark: TGQuark): Tgpointer; cdecl; external libgstreamer;
procedure gst_mini_object_add_parent(obj: PGstMiniObject; parent: PGstMiniObject); cdecl; external libgstreamer;
procedure gst_mini_object_remove_parent(obj: PGstMiniObject; parent: PGstMiniObject); cdecl; external libgstreamer;
function gst_mini_object_replace(olddata: PPGstMiniObject; newdata: PGstMiniObject): Tgboolean; cdecl; external libgstreamer;
function gst_mini_object_take(olddata: PPGstMiniObject; newdata: PGstMiniObject): Tgboolean; cdecl; external libgstreamer;
function gst_mini_object_steal(olddata: PPGstMiniObject): PGstMiniObject; cdecl; external libgstreamer;


function GST_TYPE_MINI_OBJECT: TGType;
function GST_IS_MINI_OBJECT_TYPE(obj:Pointer;_type : TGType) : Tgboolean;
function GST_MINI_OBJECT_CAST(obj: Pointer): PGstMiniObject;
function GST_MINI_OBJECT_CONST_CAST(obj: Pointer): PGstMiniObject;
function GST_MINI_OBJECT(obj: Pointer): PGstMiniObject;

function GST_LOCK_FLAG_READWRITE: TGstLockFlags;
function GST_MINI_OBJECT_REFCOUNT(obj: Pointer): Tgint;
function GST_MINI_OBJECT_REFCOUNT_VALUE(obj: Pointer): Tgint;

function GST_MINI_OBJECT_IS_LOCKABLE(obj: Pointer): Tgboolean;

function GST_MINI_OBJECT_TYPE(obj: Pointer): TGType;
function GST_MINI_OBJECT_FLAGS(obj: Pointer): Tguint;
function GST_MINI_OBJECT_FLAG_IS_SET(obj: PGstMiniObject; flag: Tguint32): Tgboolean;
procedure GST_MINI_OBJECT_FLAG_SET(var obj: PGstMiniObject; flag: Tguint32);
procedure GST_MINI_OBJECT_FLAG_UNSET(var obj: PGstMiniObject; flag: Tguint32);

procedure gst_clear_mini_object(object_ptr: Pgpointer);



// === Konventiert am: 11-9-24 17:15:38 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_MINI_OBJECT: TGType;
begin
  Result := _gst_mini_object_type;
end;

// #define GST_IS_MINI_OBJECT_TYPE(obj,type)  ((obj) && GST_MINI_OBJECT_TYPE(obj) == (type))
function GST_IS_MINI_OBJECT_TYPE(obj: Pointer; _type: TGType): Tgboolean;
begin
  Result:= (obj<>nil) and (GST_MINI_OBJECT_TYPE(obj)=_type);
//  Result:= obj=_type;
end;

function GST_MINI_OBJECT_CAST(obj: Pointer): PGstMiniObject;
begin
  GST_MINI_OBJECT_CAST := PGstMiniObject(obj);
end;

function GST_MINI_OBJECT_CONST_CAST(obj: Pointer): PGstMiniObject;
begin
  GST_MINI_OBJECT_CONST_CAST := PGstMiniObject(obj);
end;

function GST_MINI_OBJECT(obj: Pointer): PGstMiniObject;
begin
  GST_MINI_OBJECT := GST_MINI_OBJECT_CAST(obj);
end;

function GST_MINI_OBJECT_TYPE(obj: Pointer): TGType;
begin
  GST_MINI_OBJECT_TYPE := GST_MINI_OBJECT_CAST(obj)^._type;
end;

function GST_MINI_OBJECT_FLAGS(obj: Pointer): Tguint;
begin
  GST_MINI_OBJECT_FLAGS := (GST_MINI_OBJECT_CAST(obj))^.flags;
end;

function GST_MINI_OBJECT_FLAG_IS_SET(obj: PGstMiniObject; flag: Tguint32  ): Tgboolean;
begin
  // #define GST_MINI_OBJECT_FLAG_IS_SET(obj,flag)        !!(GST_MINI_OBJECT_FLAGS (obj) & (flag))
  Result := not (not (GST_MINI_OBJECT_FLAGS(obj) and flag) <> 0);
end;

procedure GST_MINI_OBJECT_FLAG_SET(var obj: PGstMiniObject; flag: Tguint32);
begin
  obj^.flags := obj^.flags or flag;
end;

procedure GST_MINI_OBJECT_FLAG_UNSET(var obj: PGstMiniObject; flag: Tguint32);
begin
  obj^.flags := obj^.flags and not flag;
end;

function GST_MINI_OBJECT_IS_LOCKABLE(obj: Pointer): Tgboolean;
begin
  GST_MINI_OBJECT_IS_LOCKABLE := GST_MINI_OBJECT_FLAG_IS_SET(obj, GST_MINI_OBJECT_FLAG_LOCKABLE);
end;

function GST_LOCK_FLAG_READWRITE: TGstLockFlags;
begin
  GST_LOCK_FLAG_READWRITE := TGstLockFlags(GST_LOCK_FLAG_READ or GST_LOCK_FLAG_WRITE);
end;

function GST_MINI_OBJECT_REFCOUNT(obj: Pointer): Tgint;
begin
  GST_MINI_OBJECT_REFCOUNT := (GST_MINI_OBJECT_CAST(obj))^.refcount;
end;

function GST_MINI_OBJECT_REFCOUNT_VALUE(obj: Pointer): Tgint;
begin
  GST_MINI_OBJECT_REFCOUNT_VALUE := g_atomic_int_get(@((GST_MINI_OBJECT_CAST(obj))^.refcount));
end;

//function GST_DEFINE_MINI_OBJECT_TYPE(TypeName,type_name : longint) : longint;
//begin
//  GST_DEFINE_MINI_OBJECT_TYPE:=G_DEFINE_BOXED_TYPE(TypeName,type_name,TGBoxedCopyFunc(gst_mini_object_ref),TGBoxedFreeFunc(gst_mini_object_unref));
//end;

procedure gst_clear_mini_object(object_ptr: Pgpointer);
begin
  // #define     gst_clear_mini_object(object_ptr) g_clear_pointer ((object_ptr), gst_mini_object_unref)
  g_clear_pointer(object_ptr, TGDestroyNotify(@gst_mini_object_unref));
end;


{$ENDIF read_implementation}
