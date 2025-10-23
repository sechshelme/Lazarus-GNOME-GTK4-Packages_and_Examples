
{$IFDEF read_interface}

type
  TGstCudaBufferPoolPrivate = record
  end;
  PGstCudaBufferPoolPrivate = ^TGstCudaBufferPoolPrivate;

  TGstCudaBufferPool = record
    parent: TGstBufferPool;
    context: PGstCudaContext;
    priv: PGstCudaBufferPoolPrivate;
  end;
  PGstCudaBufferPool = ^TGstCudaBufferPool;

  TGstCudaBufferPoolClass = record
    parent_class: TGstBufferPoolClass;
  end;
  PGstCudaBufferPoolClass = ^TGstCudaBufferPoolClass;


function gst_cuda_buffer_pool_get_type: TGType; cdecl; external libgstcuda;
function gst_cuda_buffer_pool_new(context: PGstCudaContext): PGstBufferPool; cdecl; external libgstcuda;
function gst_buffer_pool_config_get_cuda_stream(config: PGstStructure): PGstCudaStream; cdecl; external libgstcuda;
procedure gst_buffer_pool_config_set_cuda_stream(config: PGstStructure; stream: PGstCudaStream); cdecl; external libgstcuda;
function gst_buffer_pool_config_get_cuda_alloc_method(config: PGstStructure): TGstCudaMemoryAllocMethod; cdecl; external libgstcuda;
procedure gst_buffer_pool_config_set_cuda_alloc_method(config: PGstStructure; method: TGstCudaMemoryAllocMethod); cdecl; external libgstcuda;

function GST_CUDA_BUFFER_POOL_CAST(obj: Pointer): PGstCudaBufferPool;

// === Konventiert am: 11-10-24 15:01:55 ===

function GST_TYPE_CUDA_BUFFER_POOL: TGType;
function GST_CUDA_BUFFER_POOL(obj: Pointer): PGstCudaBufferPool;
function GST_CUDA_BUFFER_POOL_CLASS(klass: Pointer): PGstCudaBufferPoolClass;
function GST_IS_CUDA_BUFFER_POOL(obj: Pointer): Tgboolean;
function GST_IS_CUDA_BUFFER_POOL_CLASS(klass: Pointer): Tgboolean;
function GST_CUDA_BUFFER_POOL_GET_CLASS(obj: Pointer): PGstCudaBufferPoolClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_CUDA_BUFFER_POOL: TGType;
begin
  GST_TYPE_CUDA_BUFFER_POOL := gst_cuda_buffer_pool_get_type;
end;

function GST_CUDA_BUFFER_POOL(obj: Pointer): PGstCudaBufferPool;
begin
  Result := PGstCudaBufferPool(g_type_check_instance_cast(obj, GST_TYPE_CUDA_BUFFER_POOL));
end;

function GST_CUDA_BUFFER_POOL_CLASS(klass: Pointer): PGstCudaBufferPoolClass;
begin
  Result := PGstCudaBufferPoolClass(g_type_check_class_cast(klass, GST_TYPE_CUDA_BUFFER_POOL));
end;

function GST_IS_CUDA_BUFFER_POOL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_CUDA_BUFFER_POOL);
end;

function GST_IS_CUDA_BUFFER_POOL_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_CUDA_BUFFER_POOL);
end;

function GST_CUDA_BUFFER_POOL_GET_CLASS(obj: Pointer): PGstCudaBufferPoolClass;
begin
  Result := PGstCudaBufferPoolClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_CUDA_BUFFER_POOL_CAST(obj: Pointer): PGstCudaBufferPool;
begin
  GST_CUDA_BUFFER_POOL_CAST := PGstCudaBufferPool(obj);
end;


{$ENDIF read_implementation}
