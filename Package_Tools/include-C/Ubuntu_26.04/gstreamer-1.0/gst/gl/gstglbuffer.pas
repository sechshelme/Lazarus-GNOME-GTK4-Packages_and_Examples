unit gstglbuffer;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, gstglbasememory;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
const
  GST_GL_ALLOCATION_PARAMS_ALLOC_FLAG_BUFFER = 1 shl 4;
  GST_CAPS_FEATURE_MEMORY_GL_BUFFER = 'memory:GLBuffer';
  GST_GL_BUFFER_ALLOCATOR_NAME = 'GLBuffer';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGstGLBuffer = ^TGstGLBuffer;
  TGstGLBuffer = record
    mem: TGstGLBaseMemory;
    id: Tguint;
    target: Tguint;
    usage_hints: Tguint;
  end;

  PGstGLBufferAllocationParams = ^TGstGLBufferAllocationParams;
  TGstGLBufferAllocationParams = record
    parent: TGstGLAllocationParams;
    gl_target: Tguint;
    gl_usage: Tguint;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstGLBufferAllocator = ^TGstGLBufferAllocator;
  TGstGLBufferAllocator = record
    parent: TGstGLBaseMemoryAllocator;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstGLBufferAllocatorClass = ^TGstGLBufferAllocatorClass;
  TGstGLBufferAllocatorClass = record
    parent_class: TGstGLBaseMemoryAllocatorClass;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_gl_buffer_allocator_get_type: TGType; cdecl; external libgstgl;
function gst_gl_buffer_allocation_params_get_type: TGType; cdecl; external libgstgl;
function gst_gl_buffer_allocation_params_new(context: PGstGLContext; alloc_size: Tgsize; alloc_params: PGstAllocationParams; gl_target: Tguint; gl_usage: Tguint): PGstGLBufferAllocationParams; cdecl; external libgstgl;

function gst_gl_buffer_get_type: TGType; cdecl; external libgstgl; deprecated;
procedure gst_gl_buffer_init_once; cdecl; external libgstgl;
function gst_is_gl_buffer(mem: PGstMemory): Tgboolean; cdecl; external libgstgl;

// === Konventiert am: 14-7-26 12:54:41 ===


function GST_GL_BUFFER_ALLOCATOR_CAST(obj: Pointer): PGstGLBufferAllocator;
function GST_TYPE_GL_BUFFER_ALLOCATION_PARAMS: TGType;
function GST_TYPE_GL_BUFFER: TGType;

function GST_TYPE_GL_BUFFER_ALLOCATOR: TGType;
function GST_GL_BUFFER_ALLOCATOR(obj: Pointer): PGstGLBufferAllocator;
function GST_GL_BUFFER_ALLOCATOR_CLASS(klass: Pointer): PGstGLBufferAllocatorClass;
function GST_IS_GL_BUFFER_ALLOCATOR(obj: Pointer): Tgboolean;
function GST_IS_GL_BUFFER_ALLOCATOR_CLASS(klass: Pointer): Tgboolean;
function GST_GL_BUFFER_ALLOCATOR_GET_CLASS(obj: Pointer): PGstGLBufferAllocatorClass;
{$ENDIF read_function}

implementation

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

end.
