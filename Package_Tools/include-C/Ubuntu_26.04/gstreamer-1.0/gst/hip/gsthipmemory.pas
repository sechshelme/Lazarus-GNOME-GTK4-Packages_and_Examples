unit gsthipmemory;

interface

uses
  fp_glib2, fp_gst, fp_gst_video, gsthipdevice, gsthip_enums, gsthipstream, gsthipevent;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  GST_HIP_MEMORY_NAME = 'HIPMemory';
  GST_CAPS_FEATURE_MEMORY_HIP_MEMORY = 'memory:HIPMemory';

type
  PGstHipMemoryTransfer = ^TGstHipMemoryTransfer;
  TGstHipMemoryTransfer = longint;
const
  GST_HIP_MEMORY_TRANSFER_NEED_DOWNLOAD = GST_MEMORY_FLAG_LAST shl 0;
  GST_HIP_MEMORY_TRANSFER_NEED_UPLOAD = GST_MEMORY_FLAG_LAST shl 1;

type
  PGstHipMemoryPrivate = type Pointer;

  PGstHipMemory = ^TGstHipMemory;
  TGstHipMemory = record
    mem: TGstMemory;
    device: PGstHipDevice;
    info: TGstVideoInfo;
    priv: PGstHipMemoryPrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

function gst_is_hip_memory(mem: PGstMemory): Tgboolean; cdecl; external libgsthip;
function gst_hip_memory_get_texture(mem: PGstHipMemory; plane: Tguint; filter_mode: THIPfilter_mode; address_mode: THIPaddress_mode; texture: PhipTextureObject_t): Tgboolean; cdecl; external libgsthip;
function gst_hip_memory_get_stream(mem: PGstHipMemory): PGstHipStream; cdecl; external libgsthip;
procedure gst_hip_memory_set_event(mem: PGstHipMemory; event: PGstHipEvent); cdecl; external libgsthip;
procedure gst_hip_memory_sync(mem: PGstHipMemory); cdecl; external libgsthip;

type
  PGstHipAllocatorPrivate = type Pointer;

  PGstHipAllocator = ^TGstHipAllocator;
  TGstHipAllocator = record
    allocator: TGstAllocator;
    priv: PGstHipAllocatorPrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstHipAllocatorClass = ^TGstHipAllocatorClass;
  TGstHipAllocatorClass = record
    allocator_class: TGstAllocatorClass;
    set_active: function(allocator: PGstHipAllocator; active: Tgboolean): Tgboolean; cdecl;
    _gst_reserved: array[0..(GST_PADDING_LARGE) - 1] of Tgpointer;
  end;

function gst_hip_allocator_get_type: TGType; cdecl; external libgsthip;
function gst_hip_allocator_alloc(allocator: PGstHipAllocator; device: PGstHipDevice; info: PGstVideoInfo): PGstMemory; cdecl; external libgsthip;
function gst_hip_allocator_set_active(allocator: PGstHipAllocator; active: Tgboolean): Tgboolean; cdecl; external libgsthip;

type
  PGstHipPoolAllocatorPrivate = type Pointer;

  PGstHipPoolAllocator = ^TGstHipPoolAllocator;
  TGstHipPoolAllocator = record
    parent: TGstHipAllocator;
    device: PGstHipDevice;
    info: TGstVideoInfo;
    priv: PGstHipPoolAllocatorPrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstHipPoolAllocatorClass = ^TGstHipPoolAllocatorClass;
  TGstHipPoolAllocatorClass = record
    parent_class: TGstHipAllocatorClass;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;


function gst_hip_pool_allocator_get_type: TGType; cdecl; external libgsthip;
function gst_hip_pool_allocator_new(device: PGstHipDevice; info: PGstVideoInfo): PGstHipPoolAllocator; cdecl; external libgsthip;
function gst_hip_pool_allocator_acquire_memory(allocator: PGstHipPoolAllocator; memory: PPGstMemory): TGstFlowReturn; cdecl; external libgsthip;

// === Konventiert am: 22-7-26 17:16:18 ===

function GST_HIP_MEMORY_CAST(obj: Pointer): PGstHipMemory;

function GST_TYPE_HIP_ALLOCATOR: TGType;
function GST_HIP_ALLOCATOR(obj: Pointer): PGstHipAllocator;
function GST_HIP_ALLOCATOR_CLASS(klass: Pointer): PGstHipAllocatorClass;
function GST_IS_HIP_ALLOCATOR(obj: Pointer): Tgboolean;
function GST_IS_HIP_ALLOCATOR_CLASS(klass: Pointer): Tgboolean;
function GST_HIP_ALLOCATOR_GET_CLASS(obj: Pointer): PGstHipAllocatorClass;
function GST_HIP_ALLOCATOR_CAST(obj: Pointer): PGstHipAllocator;

function GST_TYPE_HIP_POOL_ALLOCATOR: TGType;
function GST_HIP_POOL_ALLOCATOR(obj: Pointer): PGstHipPoolAllocator;
function GST_HIP_POOL_ALLOCATOR_CLASS(klass: Pointer): PGstHipPoolAllocatorClass;
function GST_IS_HIP_POOL_ALLOCATOR(obj: Pointer): Tgboolean;
function GST_IS_HIP_POOL_ALLOCATOR_CLASS(klass: Pointer): Tgboolean;
function GST_HIP_POOL_ALLOCATOR_GET_CLASS(obj: Pointer): PGstHipPoolAllocatorClass;
function GST_HIP_POOL_ALLOCATOR_CAST(obj: Pointer): PGstHipPoolAllocator;

function GST_MAP_HIP: TGstMapFlags;
function GST_MAP_READ_HIP: TGstMapFlags;
function GST_MAP_WRITE_HIP: TGstMapFlags;

implementation

// === GstHipMemory ===

function GST_HIP_MEMORY_CAST(obj: Pointer): PGstHipMemory;
begin
  Result := PGstHipMemory(obj);
end;

// === GstHipAllocator ===

function GST_TYPE_HIP_ALLOCATOR: TGType;
begin
  Result := gst_hip_allocator_get_type;
end;

function GST_HIP_ALLOCATOR(obj: Pointer): PGstHipAllocator;
begin
  Result := PGstHipAllocator(g_type_check_instance_cast(obj, GST_TYPE_HIP_ALLOCATOR));
end;

function GST_HIP_ALLOCATOR_CLASS(klass: Pointer): PGstHipAllocatorClass;
begin
  Result := PGstHipAllocatorClass(g_type_check_class_cast(klass, GST_TYPE_HIP_ALLOCATOR));
end;

function GST_IS_HIP_ALLOCATOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_HIP_ALLOCATOR);
end;

function GST_IS_HIP_ALLOCATOR_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_HIP_ALLOCATOR);
end;

function GST_HIP_ALLOCATOR_GET_CLASS(obj: Pointer): PGstHipAllocatorClass;
begin
  Result := PGstHipAllocatorClass(PGTypeInstance(obj)^.g_class);
end;

function GST_HIP_ALLOCATOR_CAST(obj: Pointer): PGstHipAllocator;
begin
  Result := PGstHipAllocator(obj);
end;

// === GstHipPoolAllocator ===

function GST_TYPE_HIP_POOL_ALLOCATOR: TGType;
begin
  Result := gst_hip_pool_allocator_get_type;
end;

function GST_HIP_POOL_ALLOCATOR(obj: Pointer): PGstHipPoolAllocator;
begin
  Result := PGstHipPoolAllocator(g_type_check_instance_cast(obj, GST_TYPE_HIP_POOL_ALLOCATOR));
end;

function GST_HIP_POOL_ALLOCATOR_CLASS(klass: Pointer): PGstHipPoolAllocatorClass;
begin
  Result := PGstHipPoolAllocatorClass(g_type_check_class_cast(klass, GST_TYPE_HIP_POOL_ALLOCATOR));
end;

function GST_IS_HIP_POOL_ALLOCATOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_HIP_POOL_ALLOCATOR);
end;

function GST_IS_HIP_POOL_ALLOCATOR_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_HIP_POOL_ALLOCATOR);
end;

function GST_HIP_POOL_ALLOCATOR_GET_CLASS(obj: Pointer): PGstHipPoolAllocatorClass;
begin
  Result := PGstHipPoolAllocatorClass(PGTypeInstance(obj)^.g_class);
end;

function GST_HIP_POOL_ALLOCATOR_CAST(obj: Pointer): PGstHipPoolAllocator;
begin
  Result := PGstHipPoolAllocator(obj);
end;

function GST_MAP_HIP: TGstMapFlags;
begin
  Result := TGstMapFlags(GST_MAP_FLAG_LAST shl 1);
end;

function GST_MAP_READ_HIP: TGstMapFlags;
begin
  Result := TGstMapFlags(GST_MAP_READ or GST_MAP_HIP);
end;

function GST_MAP_WRITE_HIP: TGstMapFlags;
begin
  Result := TGstMapFlags(GST_MAP_WRITE or GST_MAP_HIP);
end;



end.
