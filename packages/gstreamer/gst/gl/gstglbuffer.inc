/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 09-10-2024   19:05                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

function gst_gl_buffer_allocator_get_type: TGType; cdecl; external libgstgl;

type
  TGstGLBuffer = record
    mem: TGstGLBaseMemory;
    id: Tguint;
    target: Tguint;
    usage_hints: Tguint;
  end;
  PGstGLBuffer = ^TGstGLBuffer;

function gst_gl_buffer_allocation_params_get_type: TGType; cdecl; external libgstgl;

const
  GST_GL_ALLOCATION_PARAMS_ALLOC_FLAG_BUFFER = 1 shl 4;

type
  TGstGLBufferAllocationParams = record
    parent: TGstGLAllocationParams;
    gl_target: Tguint;
    gl_usage: Tguint;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstGLBufferAllocationParams = ^TGstGLBufferAllocationParams;


function gst_gl_buffer_allocation_params_new(context: PGstGLContext; alloc_size: Tgsize; alloc_params: PGstAllocationParams; gl_target: Tguint; gl_usage: Tguint): PGstGLBufferAllocationParams; cdecl; external libgstgl;

type
  TGstGLBufferAllocator = record
    parent: TGstGLBaseMemoryAllocator;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstGLBufferAllocator = ^TGstGLBufferAllocator;

  TGstGLBufferAllocatorClass = record
    parent_class: TGstGLBaseMemoryAllocatorClass;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstGLBufferAllocatorClass = ^TGstGLBufferAllocatorClass;

const
  GST_CAPS_FEATURE_MEMORY_GL_BUFFER = 'memory:GLBuffer';
  GST_GL_BUFFER_ALLOCATOR_NAME = 'GLBuffer';

function gst_gl_buffer_get_type: TGType; cdecl; external libgstgl;
procedure gst_gl_buffer_init_once; cdecl; external libgstgl;
function gst_is_gl_buffer(mem: PGstMemory): Tgboolean; cdecl; external libgstgl;

function GST_GL_BUFFER_ALLOCATOR_CAST(obj: Pointer): PGstGLBufferAllocator;
function GST_TYPE_GL_BUFFER_ALLOCATION_PARAMS: TGType;
function GST_TYPE_GL_BUFFER: TGType;

// === Konventiert am: 9-10-24 10:36:48 ===

function GST_TYPE_GL_BUFFER_ALLOCATOR: TGType;
function GST_GL_BUFFER_ALLOCATOR(obj: Pointer): PGstGLBufferAllocator;
function GST_GL_BUFFER_ALLOCATOR_CLASS(klass: Pointer): PGstGLBufferAllocatorClass;
function GST_IS_GL_BUFFER_ALLOCATOR(obj: Pointer): Tgboolean;
function GST_IS_GL_BUFFER_ALLOCATOR_CLASS(klass: Pointer): Tgboolean;
function GST_GL_BUFFER_ALLOCATOR_GET_CLASS(obj: Pointer): PGstGLBufferAllocatorClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_GL_BUFFER_ALLOCATOR: TGType;
begin
  GST_TYPE_GL_BUFFER_ALLOCATOR := gst_gl_buffer_allocator_get_type;
end;

function GST_GL_BUFFER_ALLOCATOR(obj: Pointer): PGstGLBufferAllocator;
begin
  Result := PGstGLBufferAllocator(g_type_check_instance_cast(obj, GST_TYPE_GL_BUFFER_ALLOCATOR));
end;

function GST_GL_BUFFER_ALLOCATOR_CLASS(klass: Pointer): PGstGLBufferAllocatorClass;
begin
  Result := PGstGLBufferAllocatorClass(g_type_check_class_cast(klass, GST_TYPE_GL_BUFFER_ALLOCATOR));
end;

function GST_IS_GL_BUFFER_ALLOCATOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_GL_BUFFER_ALLOCATOR);
end;

function GST_IS_GL_BUFFER_ALLOCATOR_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_GL_BUFFER_ALLOCATOR);
end;

function GST_GL_BUFFER_ALLOCATOR_GET_CLASS(obj: Pointer): PGstGLBufferAllocatorClass;
begin
  Result := PGstGLBufferAllocatorClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_GL_BUFFER_ALLOCATOR_CAST(obj: Pointer): PGstGLBufferAllocator;
begin
  GST_GL_BUFFER_ALLOCATOR_CAST := PGstGLBufferAllocator(obj);
end;

function GST_TYPE_GL_BUFFER_ALLOCATION_PARAMS: TGType;
begin
  GST_TYPE_GL_BUFFER_ALLOCATION_PARAMS := gst_gl_buffer_allocation_params_get_type;
end;

function GST_TYPE_GL_BUFFER: TGType;
begin
  GST_TYPE_GL_BUFFER := gst_gl_buffer_get_type;
end;


{$ENDIF read_implementation}
