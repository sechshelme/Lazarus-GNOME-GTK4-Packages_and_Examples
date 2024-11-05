/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 11-10-2024   16:50                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

const
  GST_MAP_CUDA = GST_MAP_FLAG_LAST shl 1;
  GST_CUDA_MEMORY_TYPE_NAME = 'gst.cuda.memory';
  GST_CAPS_FEATURE_MEMORY_CUDA_MEMORY = 'memory:CUDAMemory';

type
  PGstCudaMemoryTransfer = ^TGstCudaMemoryTransfer;
  TGstCudaMemoryTransfer = longint;

const
  GST_CUDA_MEMORY_TRANSFER_NEED_DOWNLOAD = GST_MEMORY_FLAG_LAST shl 0;
  GST_CUDA_MEMORY_TRANSFER_NEED_UPLOAD = GST_MEMORY_FLAG_LAST shl 1;
  GST_CUDA_MEMORY_TRANSFER_NEED_SYNC = GST_MEMORY_FLAG_LAST shl 2;

type
  PGstCudaMemoryAllocMethod = ^TGstCudaMemoryAllocMethod;
  TGstCudaMemoryAllocMethod = longint;

const
  GST_CUDA_MEMORY_ALLOC_UNKNOWN = 0;
  GST_CUDA_MEMORY_ALLOC_MALLOC = 1;
  GST_CUDA_MEMORY_ALLOC_MMAP = 2;

function gst_cuda_memory_alloc_method_get_type: TGType; cdecl; external libgstcuda;

type
  TGstCudaMemoryPrivate = record
  end;
  PGstCudaMemoryPrivate = ^TGstCudaMemoryPrivate;

  TGstCudaMemory = record
    mem: TGstMemory;
    context: PGstCudaContext;
    info: TGstVideoInfo;
    priv: PGstCudaMemoryPrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstCudaMemory = ^TGstCudaMemory;

procedure gst_cuda_memory_init_once; cdecl; external libgstcuda;
function gst_is_cuda_memory(mem: PGstMemory): Tgboolean; cdecl; external libgstcuda;
function gst_cuda_memory_get_stream(mem: PGstCudaMemory): PGstCudaStream; cdecl; external libgstcuda;
procedure gst_cuda_memory_sync(mem: PGstCudaMemory); cdecl; external libgstcuda;
function gst_cuda_memory_get_texture(mem: PGstCudaMemory; plane: Tguint; filter_mode: TCUfilter_mode; texture: PCUtexObject): Tgboolean; cdecl; external libgstcuda;
function gst_cuda_memory_get_user_data(mem: PGstCudaMemory): Tgpointer; cdecl; external libgstcuda;
procedure gst_cuda_memory_set_token_data(mem: PGstCudaMemory; token: Tgint64; Data: Tgpointer; notify: TGDestroyNotify); cdecl; external libgstcuda;
function gst_cuda_memory_get_token_data(mem: PGstCudaMemory; token: Tgint64): Tgpointer; cdecl; external libgstcuda;
function gst_cuda_memory_get_alloc_method(mem: PGstCudaMemory): TGstCudaMemoryAllocMethod; cdecl; external libgstcuda;
function gst_cuda_memory_export(mem: PGstCudaMemory; os_handle: Tgpointer): Tgboolean; cdecl; external libgstcuda;

type
  TGstCudaAllocatorPrivate = record
  end;
  PGstCudaAllocatorPrivate = ^TGstCudaAllocatorPrivate;

  TGstCudaAllocator = record
    parent: TGstAllocator;
    priv: PGstCudaAllocatorPrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstCudaAllocator = ^TGstCudaAllocator;

  TGstCudaAllocatorClass = record
    parent_class: TGstAllocatorClass;
    set_active: function(allocator: PGstCudaAllocator; active: Tgboolean): Tgboolean; cdecl;
    _gst_reserved: array[0..(GST_PADDING_LARGE) - 1] of Tgpointer;
  end;
  PGstCudaAllocatorClass = ^TGstCudaAllocatorClass;

function gst_cuda_allocator_get_type: TGType; cdecl; external libgstcuda;
function gst_cuda_allocator_alloc(allocator: PGstCudaAllocator; context: PGstCudaContext; stream: PGstCudaStream; info: PGstVideoInfo): PGstMemory; cdecl; external libgstcuda;
function gst_cuda_allocator_set_active(allocator: PGstCudaAllocator; active: Tgboolean): Tgboolean; cdecl; external libgstcuda;
function gst_cuda_allocator_alloc_wrapped(allocator: PGstCudaAllocator; context: PGstCudaContext; stream: PGstCudaStream; info: PGstVideoInfo; dev_ptr: TCUdeviceptr;
  user_data: Tgpointer; notify: TGDestroyNotify): PGstMemory; cdecl; external libgstcuda;
function gst_cuda_allocator_virtual_alloc(allocator: PGstCudaAllocator; context: PGstCudaContext; stream: PGstCudaStream; info: PGstVideoInfo; prop: PCUmemAllocationProp;
  granularity_flags: TCUmemAllocationGranularity_flags): PGstMemory; cdecl; external libgstcuda;

type
  TGstCudaPoolAllocatorPrivate = record
  end;
  PGstCudaPoolAllocatorPrivate = ^TGstCudaPoolAllocatorPrivate;

  TGstCudaPoolAllocator = record
    parent: TGstCudaAllocator;
    context: PGstCudaContext;
    stream: PGstCudaStream;
    info: TGstVideoInfo;
    priv: PGstCudaPoolAllocatorPrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstCudaPoolAllocator = ^TGstCudaPoolAllocator;

  TGstCudaPoolAllocatorClass = record
    parent_class: TGstCudaAllocatorClass;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstCudaPoolAllocatorClass = ^TGstCudaPoolAllocatorClass;

function gst_cuda_pool_allocator_get_type: TGType; cdecl; external libgstcuda;
function gst_cuda_pool_allocator_new(context: PGstCudaContext; stream: PGstCudaStream; info: PGstVideoInfo): PGstCudaPoolAllocator; cdecl; external libgstcuda;
function gst_cuda_pool_allocator_new_for_virtual_memory(context: PGstCudaContext; stream: PGstCudaStream; info: PGstVideoInfo; prop: PCUmemAllocationProp; granularity_flags: TCUmemAllocationGranularity_flags): PGstCudaPoolAllocator; cdecl; external libgstcuda;
function gst_cuda_pool_allocator_acquire_memory(allocator: PGstCudaPoolAllocator; memory: PPGstMemory): TGstFlowReturn; cdecl; external libgstcuda;

function GST_CUDA_ALLOCATOR_CAST(obj: Pointer): PGstCudaAllocator;
function GST_CUDA_MEMORY_CAST(mem: Pointer): PGstCudaMemory;
function GST_TYPE_CUDA_MEMORY_ALLOC_METHOD: TGType;

// === Konventiert am: 11-10-24 15:02:19 ===

function GST_TYPE_CUDA_ALLOCATOR: TGType;
function GST_CUDA_ALLOCATOR(obj: Pointer): PGstCudaAllocator;
function GST_CUDA_ALLOCATOR_CLASS(klass: Pointer): PGstCudaAllocatorClass;
function GST_IS_CUDA_ALLOCATOR(obj: Pointer): Tgboolean;
function GST_IS_CUDA_ALLOCATOR_CLASS(klass: Pointer): Tgboolean;
function GST_CUDA_ALLOCATOR_GET_CLASS(obj: Pointer): PGstCudaAllocatorClass;

function GST_TYPE_CUDA_POOL_ALLOCATOR: TGType;
function GST_CUDA_POOL_ALLOCATOR(obj: Pointer): PGstCudaPoolAllocator;
function GST_CUDA_POOL_ALLOCATOR_CLASS(klass: Pointer): PGstCudaPoolAllocatorClass;
function GST_IS_CUDA_POOL_ALLOCATOR(obj: Pointer): Tgboolean;
function GST_IS_CUDA_POOL_ALLOCATOR_CLASS(klass: Pointer): Tgboolean;
function GST_CUDA_POOL_ALLOCATOR_GET_CLASS(obj: Pointer): PGstCudaPoolAllocatorClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_CUDA_ALLOCATOR: TGType;
begin
  GST_TYPE_CUDA_ALLOCATOR := gst_cuda_allocator_get_type;
end;

function GST_CUDA_ALLOCATOR(obj: Pointer): PGstCudaAllocator;
begin
  Result := PGstCudaAllocator(g_type_check_instance_cast(obj, GST_TYPE_CUDA_ALLOCATOR));
end;

function GST_CUDA_ALLOCATOR_CLASS(klass: Pointer): PGstCudaAllocatorClass;
begin
  Result := PGstCudaAllocatorClass(g_type_check_class_cast(klass, GST_TYPE_CUDA_ALLOCATOR));
end;

function GST_IS_CUDA_ALLOCATOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_CUDA_ALLOCATOR);
end;

function GST_IS_CUDA_ALLOCATOR_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_CUDA_ALLOCATOR);
end;

function GST_CUDA_ALLOCATOR_GET_CLASS(obj: Pointer): PGstCudaAllocatorClass;
begin
  Result := PGstCudaAllocatorClass(PGTypeInstance(obj)^.g_class);
end;

// =====

function GST_TYPE_CUDA_POOL_ALLOCATOR: TGType;
begin
  GST_TYPE_CUDA_POOL_ALLOCATOR := gst_cuda_pool_allocator_get_type;
end;

function GST_CUDA_POOL_ALLOCATOR(obj: Pointer): PGstCudaPoolAllocator;
begin
  Result := PGstCudaPoolAllocator(g_type_check_instance_cast(obj, GST_TYPE_CUDA_POOL_ALLOCATOR));
end;

function GST_CUDA_POOL_ALLOCATOR_CLASS(klass: Pointer): PGstCudaPoolAllocatorClass;
begin
  Result := PGstCudaPoolAllocatorClass(g_type_check_class_cast(klass, GST_TYPE_CUDA_POOL_ALLOCATOR));
end;

function GST_IS_CUDA_POOL_ALLOCATOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_CUDA_POOL_ALLOCATOR);
end;

function GST_IS_CUDA_POOL_ALLOCATOR_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_CUDA_POOL_ALLOCATOR);
end;

function GST_CUDA_POOL_ALLOCATOR_GET_CLASS(obj: Pointer): PGstCudaPoolAllocatorClass;
begin
  Result := PGstCudaPoolAllocatorClass(PGTypeInstance(obj)^.g_class);
end;

// =====

function GST_CUDA_ALLOCATOR_CAST(obj: Pointer): PGstCudaAllocator;
begin
  GST_CUDA_ALLOCATOR_CAST := PGstCudaAllocator(obj);
end;

function GST_CUDA_MEMORY_CAST(mem: Pointer): PGstCudaMemory;
begin
  GST_CUDA_MEMORY_CAST := PGstCudaMemory(mem);
end;

function GST_TYPE_CUDA_MEMORY_ALLOC_METHOD: TGType;
begin
  GST_TYPE_CUDA_MEMORY_ALLOC_METHOD := gst_cuda_memory_alloc_method_get_type;
end;


{$ENDIF read_implementation}
