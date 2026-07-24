{$IFDEF read_interface}


type
  PGstCudaMemoryPoolPrivate = type Pointer;

  PPGstCudaMemoryPool = ^PGstCudaMemoryPool;
  PGstCudaMemoryPool = ^TGstCudaMemoryPool;
  TGstCudaMemoryPool = record
    parent: TGstMiniObject;
    context: PGstCudaContext;
    priv: PGstCudaMemoryPoolPrivate;
  end;

function gst_cuda_memory_pool_get_type: TGType; cdecl; external libgstcuda;
function gst_cuda_memory_pool_new(context: PGstCudaContext; props: PCUmemPoolProps): PGstCudaMemoryPool; cdecl; external libgstcuda;
function gst_cuda_memory_pool_get_handle(pool: PGstCudaMemoryPool): TCUmemoryPool; cdecl; external libgstcuda;
function gst_cuda_memory_pool_ref(pool: PGstCudaMemoryPool): PGstCudaMemoryPool; cdecl; external libgstcuda;
procedure gst_cuda_memory_pool_unref(pool: PGstCudaMemoryPool); cdecl; external libgstcuda;
procedure gst_clear_cuda_memory_pool(pool: PPGstCudaMemoryPool); cdecl; external libgstcuda;

// === Konventiert am: 24-7-26 15:39:12 ===

function GST_TYPE_CUDA_MEMORY_POOL: TGType;
function GST_IS_CUDA_MEMORY_POOL(obj: Pointer): boolean;
function GST_CUDA_MEMORY_POOL(obj: Pointer): PGstCudaMemoryPool;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_CUDA_MEMORY_POOL: TGType;
begin
  GST_TYPE_CUDA_MEMORY_POOL := gst_cuda_memory_pool_get_type;
end;

function GST_IS_CUDA_MEMORY_POOL(obj: Pointer): boolean;
begin
  GST_IS_CUDA_MEMORY_POOL := GST_IS_MINI_OBJECT_TYPE(obj, GST_TYPE_CUDA_MEMORY_POOL);
end;

function GST_CUDA_MEMORY_POOL(obj: Pointer): PGstCudaMemoryPool;
begin
  GST_CUDA_MEMORY_POOL := PGstCudaMemoryPool(obj);
end;

{$ENDIF read_implementation}
