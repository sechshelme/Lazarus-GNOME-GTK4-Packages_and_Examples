
{$IFDEF read_interface}

const
  GST_ALLOCATOR_FD = 'fd';

type
  PGstFdMemoryFlags = ^TGstFdMemoryFlags;
  TGstFdMemoryFlags = longint;

const
  GST_FD_MEMORY_FLAG_NONE = 0;
  GST_FD_MEMORY_FLAG_KEEP_MAPPED = 1 shl 0;
  GST_FD_MEMORY_FLAG_MAP_PRIVATE = 1 shl 1;
  GST_FD_MEMORY_FLAG_DONT_CLOSE = 1 shl 2;

type
  TGstFdAllocator = record
    parent: TGstAllocator;
  end;
  PGstFdAllocator = ^TGstFdAllocator;

  TGstFdAllocatorClass = record
    parent_class: TGstAllocatorClass;
  end;
  PGstFdAllocatorClass = ^TGstFdAllocatorClass;

function gst_fd_allocator_get_type: TGType; cdecl; external libgstallocators;
function gst_fd_allocator_new: PGstAllocator; cdecl; external libgstallocators;
function gst_fd_allocator_alloc(allocator: PGstAllocator; fd: Tgint; size: Tgsize; flags: TGstFdMemoryFlags): PGstMemory; cdecl; external libgstallocators;
function gst_is_fd_memory(mem: PGstMemory): Tgboolean; cdecl; external libgstallocators;
function gst_fd_memory_get_fd(mem: PGstMemory): Tgint; cdecl; external libgstallocators;

function GST_FD_ALLOCATOR_CAST(obj: longint): PGstFdAllocator;

// === Konventiert am: 1-10-24 16:37:32 ===

function GST_TYPE_FD_ALLOCATOR: TGType;
function GST_FD_ALLOCATOR(obj: Pointer): PGstFdAllocator;
function GST_FD_ALLOCATOR_CLASS(klass: Pointer): PGstFdAllocatorClass;
function GST_IS_FD_ALLOCATOR(obj: Pointer): Tgboolean;
function GST_IS_FD_ALLOCATOR_CLASS(klass: Pointer): Tgboolean;
function GST_FD_ALLOCATOR_GET_CLASS(obj: Pointer): PGstFdAllocatorClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_FD_ALLOCATOR: TGType;
begin
  GST_TYPE_FD_ALLOCATOR := gst_fd_allocator_get_type;
end;

function GST_FD_ALLOCATOR(obj: Pointer): PGstFdAllocator;
begin
  Result := PGstFdAllocator(g_type_check_instance_cast(obj, GST_TYPE_FD_ALLOCATOR));
end;

function GST_FD_ALLOCATOR_CLASS(klass: Pointer): PGstFdAllocatorClass;
begin
  Result := PGstFdAllocatorClass(g_type_check_class_cast(klass, GST_TYPE_FD_ALLOCATOR));
end;

function GST_IS_FD_ALLOCATOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_FD_ALLOCATOR);
end;

function GST_IS_FD_ALLOCATOR_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_FD_ALLOCATOR);
end;

function GST_FD_ALLOCATOR_GET_CLASS(obj: Pointer): PGstFdAllocatorClass;
begin
  Result := PGstFdAllocatorClass(PGTypeInstance(obj)^.g_class);
end;


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_FD_ALLOCATOR_CAST(obj: longint): PGstFdAllocator;
begin
  GST_FD_ALLOCATOR_CAST := PGstFdAllocator(obj);
end;


{$ENDIF read_implementation}
