

  {$IFDEF read_enum}
const
  GST_GL_MEMORY_PBO_ALLOCATOR_NAME = 'GLMemoryPBO';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGstGLMemoryPBO = ^TGstGLMemoryPBO;
  TGstGLMemoryPBO = record
    mem: TGstGLMemory;
    pbo: PGstGLBuffer;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstGLMemoryPBOAllocator = ^TGstGLMemoryPBOAllocator;
  TGstGLMemoryPBOAllocator = record
    parent: TGstGLMemoryAllocator;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstGLMemoryPBOAllocatorClass = ^TGstGLMemoryPBOAllocatorClass;
  TGstGLMemoryPBOAllocatorClass = record
    parent_class: TGstGLMemoryAllocatorClass;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_gl_memory_pbo_allocator_get_type: TGType; cdecl; external libgstgl;
function gst_gl_memory_pbo_get_type: TGType; cdecl; external libgstgl; deprecated;
procedure gst_gl_memory_pbo_init_once; cdecl; external libgstgl;
function gst_is_gl_memory_pbo(mem: PGstMemory): Tgboolean; cdecl; external libgstgl;
procedure gst_gl_memory_pbo_download_transfer(gl_mem: PGstGLMemoryPBO); cdecl; external libgstgl;
procedure gst_gl_memory_pbo_upload_transfer(gl_mem: PGstGLMemoryPBO); cdecl; external libgstgl;
function gst_gl_memory_pbo_copy_into_texture(gl_mem: PGstGLMemoryPBO; tex_id: Tguint; target: TGstGLTextureTarget; tex_format: TGstGLFormat; width: Tgint;
  height: Tgint; stride: Tgint; respecify: Tgboolean): Tgboolean; cdecl; external libgstgl;

// === Konventiert am: 14-7-26 13:07:32 ===

function GST_GL_MEMORY_PBO_ALLOCATOR_CAST(obj: Pointer): PGstGLMemoryPBOAllocator;
function GST_TYPE_GL_MEMORY_PBO: TGType;

function GST_TYPE_GL_MEMORY_PBO_ALLOCATOR: TGType;
function GST_GL_MEMORY_PBO_ALLOCATOR(obj: Pointer): PGstGLMemoryPBOAllocator;
function GST_GL_MEMORY_PBO_ALLOCATOR_CLASS(klass: Pointer): PGstGLMemoryPBOAllocatorClass;
function GST_IS_GL_MEMORY_PBO_ALLOCATOR(obj: Pointer): Tgboolean;
function GST_IS_GL_MEMORY_PBO_ALLOCATOR_CLASS(klass: Pointer): Tgboolean;
function GST_GL_MEMORY_PBO_ALLOCATOR_GET_CLASS(obj: Pointer): PGstGLMemoryPBOAllocatorClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GST_TYPE_GL_MEMORY_PBO_ALLOCATOR: TGType;
begin
  GST_TYPE_GL_MEMORY_PBO_ALLOCATOR := gst_gl_memory_pbo_allocator_get_type;
end;

function GST_GL_MEMORY_PBO_ALLOCATOR(obj: Pointer): PGstGLMemoryPBOAllocator;
begin
  Result := PGstGLMemoryPBOAllocator(g_type_check_instance_cast(obj, GST_TYPE_GL_MEMORY_PBO_ALLOCATOR));
end;

function GST_GL_MEMORY_PBO_ALLOCATOR_CLASS(klass: Pointer): PGstGLMemoryPBOAllocatorClass;
begin
  Result := PGstGLMemoryPBOAllocatorClass(g_type_check_class_cast(klass, GST_TYPE_GL_MEMORY_PBO_ALLOCATOR));
end;

function GST_IS_GL_MEMORY_PBO_ALLOCATOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_GL_MEMORY_PBO_ALLOCATOR);
end;

function GST_IS_GL_MEMORY_PBO_ALLOCATOR_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_GL_MEMORY_PBO_ALLOCATOR);
end;

function GST_GL_MEMORY_PBO_ALLOCATOR_GET_CLASS(obj: Pointer): PGstGLMemoryPBOAllocatorClass;
begin
  Result := PGstGLMemoryPBOAllocatorClass(PGTypeInstance(obj)^.g_class);
end;


function GST_GL_MEMORY_PBO_ALLOCATOR_CAST(obj: Pointer): PGstGLMemoryPBOAllocator;
begin
  GST_GL_MEMORY_PBO_ALLOCATOR_CAST := PGstGLMemoryPBOAllocator(obj);
end;

function GST_TYPE_GL_MEMORY_PBO: TGType;
begin
  GST_TYPE_GL_MEMORY_PBO := gst_gl_memory_pbo_get_type;
end;

{$ENDIF read_implementation}
