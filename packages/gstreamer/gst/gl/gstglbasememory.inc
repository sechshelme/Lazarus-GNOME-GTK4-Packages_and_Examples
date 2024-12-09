
{$IFDEF read_interface}

function gst_gl_base_memory_get_type:TGType;cdecl;external libgstgl;
function gst_gl_base_memory_allocator_get_type:TGType;cdecl;external libgstgl;

function gst_gl_base_memory_error_quark:TGQuark;cdecl;external libgstgl;

type
  PGstGLBaseMemoryError = ^TGstGLBaseMemoryError;
  TGstGLBaseMemoryError =  Longint;
  Const
    GST_GL_BASE_MEMORY_ERROR_FAILED = 0;
    GST_GL_BASE_MEMORY_ERROR_OLD_LIBS = 1;
    GST_GL_BASE_MEMORY_ERROR_RESOURCE_UNAVAILABLE = 2;
type
  PGstGLBaseMemoryTransfer = ^TGstGLBaseMemoryTransfer;
  TGstGLBaseMemoryTransfer =  Longint;
  Const
    GST_GL_BASE_MEMORY_TRANSFER_NEED_DOWNLOAD = GST_MEMORY_FLAG_LAST shl 0;
    GST_GL_BASE_MEMORY_TRANSFER_NEED_UPLOAD = GST_MEMORY_FLAG_LAST shl 1;
const  GST_MAP_GL = GST_MAP_FLAG_LAST shl 1;
type
  TGstGLBaseMemory = record
      mem : TGstMemory;
      context : PGstGLContext;
      lock : TGMutex;
      map_flags : TGstMapFlags;
      map_count : Tgint;
      gl_map_count : Tgint;
      data : Tgpointer;
      query : PGstGLQuery;
      alloc_size : Tgsize;
      alloc_data : Tgpointer;
      notify : TGDestroyNotify;
      user_data : Tgpointer;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;
  PGstGLBaseMemory = ^TGstGLBaseMemory;

function gst_gl_allocation_params_get_type:TGType;cdecl;external libgstgl;
const
  GST_GL_ALLOCATION_PARAMS_ALLOC_FLAG_ALLOC = 1 shl 0;  
  GST_GL_ALLOCATION_PARAMS_ALLOC_FLAG_WRAP_SYSMEM = 1 shl 1;
  GST_GL_ALLOCATION_PARAMS_ALLOC_FLAG_WRAP_GPU_HANDLE = 1 shl 2;
  GST_GL_ALLOCATION_PARAMS_ALLOC_FLAG_USER = 1 shl 16;
type
  PGstGLAllocationParams = ^TGstGLAllocationParams;

  TGstGLAllocationParamsCopyFunc = procedure (src:PGstGLAllocationParams; dest:PGstGLAllocationParams);cdecl;
  TGstGLAllocationParamsFreeFunc = procedure (params:Tgpointer);cdecl;

  TGstGLAllocationParams = record
      struct_size : Tgsize;
      copy : TGstGLAllocationParamsCopyFunc;
      free : TGstGLAllocationParamsFreeFunc;
      alloc_flags : Tguint;
      alloc_size : Tgsize;
      alloc_params : PGstAllocationParams;
      context : PGstGLContext;
      notify : TGDestroyNotify;
      user_data : Tgpointer;
      wrapped_data : Tgpointer;
      gl_handle : Tgpointer;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_gl_allocation_params_init(params:PGstGLAllocationParams; struct_size:Tgsize; alloc_flags:Tguint; copy:TGstGLAllocationParamsCopyFunc; free:TGstGLAllocationParamsFreeFunc; 
           context:PGstGLContext; alloc_size:Tgsize; alloc_params:PGstAllocationParams; wrapped_data:Tgpointer; gl_handle:Tgpointer; 
           user_data:Tgpointer; notify:TGDestroyNotify):Tgboolean;cdecl;external libgstgl;
function gst_gl_allocation_params_copy(src:PGstGLAllocationParams):PGstGLAllocationParams;cdecl;external libgstgl;
procedure gst_gl_allocation_params_free(params:PGstGLAllocationParams);cdecl;external libgstgl;
procedure gst_gl_allocation_params_free_data(params:PGstGLAllocationParams);cdecl;external libgstgl;
procedure gst_gl_allocation_params_copy_data(src:PGstGLAllocationParams; dest:PGstGLAllocationParams);cdecl;external libgstgl;
type
  PGstGLBaseMemoryAllocator = ^TGstGLBaseMemoryAllocator;

  PGstGLBaseMemoryAllocatorAllocFunction = ^TGstGLBaseMemoryAllocatorAllocFunction;
  TGstGLBaseMemoryAllocatorAllocFunction = function (allocator:PGstGLBaseMemoryAllocator; params:PGstGLAllocationParams):PGstGLBaseMemory;cdecl;
  TGstGLBaseMemoryAllocatorCreateFunction = function (mem:PGstGLBaseMemory; error:PPGError):Tgboolean;cdecl;
  TGstGLBaseMemoryAllocatorMapFunction = function (mem:PGstGLBaseMemory; info:PGstMapInfo; maxsize:Tgsize):Tgpointer;cdecl;
  TGstGLBaseMemoryAllocatorUnmapFunction = procedure (mem:PGstGLBaseMemory; info:PGstMapInfo);cdecl;
  PGstGLBaseMemoryAllocatorCopyFunction = ^TGstGLBaseMemoryAllocatorCopyFunction;
  TGstGLBaseMemoryAllocatorCopyFunction = function (mem:PGstGLBaseMemory; offset:Tgssize; size:Tgssize):PGstGLBaseMemory;cdecl;
  TGstGLBaseMemoryAllocatorDestroyFunction = procedure (mem:PGstGLBaseMemory);cdecl;
  TGstGLBaseMemoryAllocator = record
      parent : TGstAllocator;
      fallback_mem_copy : TGstMemoryCopyFunction;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

  TGstGLBaseMemoryAllocatorClass = record
      parent_class : TGstAllocatorClass;
      alloc : TGstGLBaseMemoryAllocatorAllocFunction;
      create : TGstGLBaseMemoryAllocatorCreateFunction;
      map : TGstGLBaseMemoryAllocatorMapFunction;
      unmap : TGstGLBaseMemoryAllocatorUnmapFunction;
      copy : TGstGLBaseMemoryAllocatorCopyFunction;
      destroy : TGstGLBaseMemoryAllocatorDestroyFunction;
      _padding : array[0..(GST_PADDING)-1] of Tgpointer;
    end;
  PGstGLBaseMemoryAllocatorClass = ^TGstGLBaseMemoryAllocatorClass;

const
  GST_GL_BASE_MEMORY_ALLOCATOR_NAME = 'GLBaseMemory';  

procedure gst_gl_base_memory_init_once;cdecl;external libgstgl;
function gst_is_gl_base_memory(mem:PGstMemory):Tgboolean;cdecl;external libgstgl;
procedure gst_gl_base_memory_init(mem:PGstGLBaseMemory; allocator:PGstAllocator; parent:PGstMemory; context:PGstGLContext; params:PGstAllocationParams; 
            size:Tgsize; user_data:Tgpointer; notify:TGDestroyNotify);cdecl;external libgstgl;
function gst_gl_base_memory_alloc_data(gl_mem:PGstGLBaseMemory):Tgboolean;cdecl;external libgstgl;
function gst_gl_base_memory_memcpy(src:PGstGLBaseMemory; dest:PGstGLBaseMemory; offset:Tgssize; size:Tgssize):Tgboolean;cdecl;external libgstgl;
function gst_gl_base_memory_alloc(allocator:PGstGLBaseMemoryAllocator; params:PGstGLAllocationParams):PGstGLBaseMemory;cdecl;external libgstgl;

  function GST_GL_BASE_MEMORY_ALLOCATOR_CAST(obj : Pointer) : PGstGLBaseMemoryAllocator;
  function GST_GL_BASE_MEMORY_CAST(mem : Pointer) : PGstGLBaseMemory;
  function GST_TYPE_GL_BASE_MEMORY : TGType;
  function GST_GL_BASE_MEMORY_ERROR : longint;
function GST_TYPE_GL_ALLOCATION_PARAMS : longint;

// === Konventiert am: 9-10-24 09:14:43 ===

function GST_TYPE_GL_BASE_MEMORY_ALLOCATOR : TGType;
function GST_GL_BASE_MEMORY_ALLOCATOR(obj : Pointer) : PGstGLBaseMemoryAllocator;
function GST_GL_BASE_MEMORY_ALLOCATOR_CLASS(klass : Pointer) : PGstGLBaseMemoryAllocatorClass;
function GST_IS_GL_BASE_MEMORY_ALLOCATOR(obj : Pointer) : Tgboolean;
function GST_IS_GL_BASE_MEMORY_ALLOCATOR_CLASS(klass : Pointer) : Tgboolean;
function GST_GL_BASE_MEMORY_ALLOCATOR_GET_CLASS(obj : Pointer) : PGstGLBaseMemoryAllocatorClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_GL_BASE_MEMORY_ALLOCATOR : TGType;
  begin
    GST_TYPE_GL_BASE_MEMORY_ALLOCATOR:=gst_gl_base_memory_allocator_get_type;
  end;

function GST_GL_BASE_MEMORY_ALLOCATOR(obj : Pointer) : PGstGLBaseMemoryAllocator;
begin
  Result := PGstGLBaseMemoryAllocator(g_type_check_instance_cast(obj, GST_TYPE_GL_BASE_MEMORY_ALLOCATOR));
end;

function GST_GL_BASE_MEMORY_ALLOCATOR_CLASS(klass : Pointer) : PGstGLBaseMemoryAllocatorClass;
begin
  Result := PGstGLBaseMemoryAllocatorClass(g_type_check_class_cast(klass, GST_TYPE_GL_BASE_MEMORY_ALLOCATOR));
end;

function GST_IS_GL_BASE_MEMORY_ALLOCATOR(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_GL_BASE_MEMORY_ALLOCATOR);
end;

function GST_IS_GL_BASE_MEMORY_ALLOCATOR_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_GL_BASE_MEMORY_ALLOCATOR);
end;

function GST_GL_BASE_MEMORY_ALLOCATOR_GET_CLASS(obj : Pointer) : PGstGLBaseMemoryAllocatorClass;
begin
  Result := PGstGLBaseMemoryAllocatorClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_GL_BASE_MEMORY_ALLOCATOR_CAST(obj: Pointer
  ): PGstGLBaseMemoryAllocator;
begin
  GST_GL_BASE_MEMORY_ALLOCATOR_CAST:=PGstGLBaseMemoryAllocator(obj);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GL_BASE_MEMORY_CAST(mem: Pointer): PGstGLBaseMemory;
begin
  GST_GL_BASE_MEMORY_CAST:=PGstGLBaseMemory(mem);
end;

{ was #define dname def_expr }
function GST_TYPE_GL_BASE_MEMORY: TGType; { return type might be wrong }
  begin
    GST_TYPE_GL_BASE_MEMORY:=gst_gl_base_memory_get_type;
  end;

{ was #define dname def_expr }
function GST_GL_BASE_MEMORY_ERROR : longint; { return type might be wrong }
  begin
    GST_GL_BASE_MEMORY_ERROR:=gst_gl_base_memory_error_quark;
  end;

{ was #define dname def_expr }
function GST_TYPE_GL_ALLOCATION_PARAMS : longint; { return type might be wrong }
  begin
    GST_TYPE_GL_ALLOCATION_PARAMS:=gst_gl_allocation_params_get_type;
  end;


{$ENDIF read_implementation}
