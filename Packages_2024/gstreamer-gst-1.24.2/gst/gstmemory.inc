
{$IFDEF read_interface}

var
  _gst_memory_type: TGType; cvar;external libgstreamer;

function gst_memory_get_type: TGType; cdecl; external libgstreamer;

type
  PGstMemoryFlags = ^TGstMemoryFlags;
  TGstMemoryFlags = longint;

const
  GST_MEMORY_FLAG_READONLY = GST_MINI_OBJECT_FLAG_LOCK_READONLY;
  GST_MEMORY_FLAG_NO_SHARE = GST_MINI_OBJECT_FLAG_LAST shl 0;
  GST_MEMORY_FLAG_ZERO_PREFIXED = GST_MINI_OBJECT_FLAG_LAST shl 1;
  GST_MEMORY_FLAG_ZERO_PADDED = GST_MINI_OBJECT_FLAG_LAST shl 2;
  GST_MEMORY_FLAG_PHYSICALLY_CONTIGUOUS = GST_MINI_OBJECT_FLAG_LAST shl 3;
  GST_MEMORY_FLAG_NOT_MAPPABLE = GST_MINI_OBJECT_FLAG_LAST shl 4;
  GST_MEMORY_FLAG_LAST = GST_MINI_OBJECT_FLAG_LAST shl 16;


type
  PGstMemory = ^TGstMemory;
  PPGstMemory = ^PGstMemory;

  TGstMemory = record
    mini_object: TGstMiniObject;
    allocator: Pointer;
    //      allocator : PGstAllocator;
    parent: PGstMemory;
    maxsize: Tgsize;
    align: Tgsize;
    offset: Tgsize;
    size: Tgsize;
  end;

  PGstMapFlags = ^TGstMapFlags;
  TGstMapFlags = longint;

const
  GST_MAP_READ = GST_LOCK_FLAG_READ;
  GST_MAP_WRITE = GST_LOCK_FLAG_WRITE;
  GST_MAP_FLAG_LAST = 1 shl 16;

type
  PGstMapInfo = ^TGstMapInfo;

  TGstMapInfo = record
    memory: PGstMemory;
    flags: TGstMapFlags;
    Data: Pguint8;
    size: Tgsize;
    maxsize: Tgsize;
    user_data: array[0..3] of Tgpointer;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  TGstMemoryMapFunction = function(mem: PGstMemory; maxsize: Tgsize; flags: TGstMapFlags): Tgpointer; cdecl;
  TGstMemoryMapFullFunction = function(mem: PGstMemory; info: PGstMapInfo; maxsize: Tgsize): Tgpointer; cdecl;
  TGstMemoryUnmapFunction = procedure(mem: PGstMemory); cdecl;
  TGstMemoryUnmapFullFunction = procedure(mem: PGstMemory; info: PGstMapInfo); cdecl;
  PGstMemoryCopyFunction = ^TGstMemoryCopyFunction;
  TGstMemoryCopyFunction = function(mem: PGstMemory; offset: Tgssize; size: Tgssize): PGstMemory; cdecl;
  PGstMemoryShareFunction = ^TGstMemoryShareFunction;
  TGstMemoryShareFunction = function(mem: PGstMemory; offset: Tgssize; size: Tgssize): PGstMemory; cdecl;
  TGstMemoryIsSpanFunction = function(mem1: PGstMemory; mem2: PGstMemory; offset: Pgsize): Tgboolean; cdecl;

// ausgelagert
// procedure gst_memory_init(mem: PGstMemory; flags: TGstMemoryFlags; allocator: PGstAllocator; parent: PGstMemory; maxsize: Tgsize; align: Tgsize; offset: Tgsize; size: Tgsize); cdecl; external gstreamerlib;
function gst_memory_is_type(mem: PGstMemory; mem_type: Pgchar): Tgboolean; cdecl; external libgstreamer;
function gst_memory_ref(memory: PGstMemory): PGstMemory; cdecl; external libgstreamer;
procedure gst_memory_unref(memory: PGstMemory); cdecl; external libgstreamer;
function gst_memory_get_sizes(mem: PGstMemory; offset: Pgsize; maxsize: Pgsize): Tgsize; cdecl; external libgstreamer;
procedure gst_memory_resize(mem: PGstMemory; offset: Tgssize; size: Tgsize); cdecl; external libgstreamer;
function gst_memory_make_mapped(mem: PGstMemory; info: PGstMapInfo; flags: TGstMapFlags): PGstMemory; cdecl; external libgstreamer;
function gst_memory_map(mem: PGstMemory; info: PGstMapInfo; flags: TGstMapFlags): Tgboolean; cdecl; external libgstreamer;
procedure gst_memory_unmap(mem: PGstMemory; info: PGstMapInfo); cdecl; external libgstreamer;
function gst_memory_copy(mem: PGstMemory; offset: Tgssize; size: Tgssize): PGstMemory; cdecl; external libgstreamer;
function gst_memory_share(mem: PGstMemory; offset: Tgssize; size: Tgssize): PGstMemory; cdecl; external libgstreamer;
function gst_memory_is_span(mem1: PGstMemory; mem2: PGstMemory; offset: Pgsize): Tgboolean; cdecl; external libgstreamer;

type
  PGstMemoryMapInfo = ^TGstMemoryMapInfo;
  TGstMemoryMapInfo = TGstMapInfo;

procedure gst_memory_map_info_clear(info: PGstMemoryMapInfo);

function GST_TYPE_MEMORY: TGType;

function GST_MEMORY_CAST(mem: Pointer): PGstMemory;
function GST_MEMORY_FLAGS(mem: Pointer): Tguint;
function GST_MEMORY_FLAG_IS_SET(mem: Pointer; flag: Tguint32): Tgboolean;
procedure GST_MEMORY_FLAG_UNSET(var mem: Pointer; flag: Tguint32);
function GST_MEMORY_IS_READONLY(mem: PGstMemory): Tgboolean;
function GST_MEMORY_IS_NO_SHARE(mem: PGstMemory): Tgboolean;
function GST_MEMORY_IS_ZERO_PREFIXED(mem: PGstMemory): Tgboolean;
function GST_MEMORY_IS_ZERO_PADDED(mem: PGstMemory): Tgboolean;
function GST_MEMORY_IS_PHYSICALLY_CONTIGUOUS(mem: PGstMemory): Tgboolean;
function GST_MEMORY_IS_NOT_MAPPABLE(mem: PGstMemory): Tgboolean;

function GST_MAP_READWRITE: TGstMapFlags;

function gst_memory_lock(m: Pointer; f: TGstLockFlags): Tgboolean;
procedure gst_memory_unlock(m: Pointer; f: TGstLockFlags);
function gst_memory_is_writable(m: Pointer): Tgboolean;
function gst_memory_make_writable(m: Pointer): PGstMemory;

// === Konventiert am: 12-9-24 19:13:01 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

procedure gst_memory_map_info_clear(info: PGstMemoryMapInfo);
begin
  if info^.memory <> nil then begin
    gst_memory_unmap(info^.memory, info);
  end;
end;

function GST_TYPE_MEMORY: TGType;
begin
  Result := _gst_memory_type;
end;

function GST_MEMORY_CAST(mem: Pointer): PGstMemory;
begin
  GST_MEMORY_CAST := PGstMemory(mem);
end;

function GST_MEMORY_FLAGS(mem: Pointer): Tguint;
begin
  GST_MEMORY_FLAGS := GST_MINI_OBJECT_FLAGS(mem);
end;

function GST_MEMORY_FLAG_IS_SET(mem: Pointer; flag: Tguint32): Tgboolean;
begin
  GST_MEMORY_FLAG_IS_SET := GST_MINI_OBJECT_FLAG_IS_SET(mem, flag);
end;

procedure GST_MEMORY_FLAG_UNSET(var mem: Pointer; flag: Tguint32);
begin
  GST_MINI_OBJECT_FLAG_UNSET(mem, flag);
end;

function GST_MEMORY_IS_READONLY(mem: PGstMemory): Tgboolean;
begin
  GST_MEMORY_IS_READONLY := GST_MEMORY_FLAG_IS_SET(mem, GST_MEMORY_FLAG_READONLY);
end;

function GST_MEMORY_IS_NO_SHARE(mem: PGstMemory): Tgboolean;
begin
  GST_MEMORY_IS_NO_SHARE := GST_MEMORY_FLAG_IS_SET(mem, GST_MEMORY_FLAG_NO_SHARE);
end;

function GST_MEMORY_IS_ZERO_PREFIXED(mem: PGstMemory): Tgboolean;
begin
  GST_MEMORY_IS_ZERO_PREFIXED := GST_MEMORY_FLAG_IS_SET(mem, GST_MEMORY_FLAG_ZERO_PREFIXED);
end;

function GST_MEMORY_IS_ZERO_PADDED(mem: PGstMemory): Tgboolean;
begin
  GST_MEMORY_IS_ZERO_PADDED := GST_MEMORY_FLAG_IS_SET(mem, GST_MEMORY_FLAG_ZERO_PADDED);
end;

function GST_MEMORY_IS_PHYSICALLY_CONTIGUOUS(mem: PGstMemory): Tgboolean;
begin
  GST_MEMORY_IS_PHYSICALLY_CONTIGUOUS := GST_MEMORY_FLAG_IS_SET(mem, GST_MEMORY_FLAG_PHYSICALLY_CONTIGUOUS);
end;

function GST_MEMORY_IS_NOT_MAPPABLE(mem: PGstMemory): Tgboolean;
begin
  GST_MEMORY_IS_NOT_MAPPABLE := GST_MEMORY_FLAG_IS_SET(mem, GST_MEMORY_FLAG_NOT_MAPPABLE);
end;

function GST_MAP_READWRITE: TGstMapFlags;
begin
  GST_MAP_READWRITE := TGstMapFlags(GST_MAP_READ or GST_MAP_WRITE);
end;

function gst_memory_lock(m: Pointer; f: TGstLockFlags): Tgboolean;
begin
  gst_memory_lock := gst_mini_object_lock(GST_MINI_OBJECT_CAST(m), f);
end;

procedure gst_memory_unlock(m: Pointer; f: TGstLockFlags);
begin
  gst_mini_object_unlock(GST_MINI_OBJECT_CAST(m), f);
end;

function gst_memory_is_writable(m: Pointer): Tgboolean;
begin
  gst_memory_is_writable := gst_mini_object_is_writable(GST_MINI_OBJECT_CAST(m));
end;

function gst_memory_make_writable(m: Pointer): PGstMemory;
begin
  gst_memory_make_writable := GST_MEMORY_CAST(gst_mini_object_make_writable(GST_MINI_OBJECT_CAST(m)));
end;


{$ENDIF read_implementation}
