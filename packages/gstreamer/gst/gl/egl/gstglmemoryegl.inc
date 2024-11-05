/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 09-10-2024   19:05                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

function gst_gl_memory_egl_allocator_get_type: TGType; cdecl; external libgstgl;

type
  TGstGLMemoryEGL = record
    mem: TGstGLMemory;
    image: PGstEGLImage;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstGLMemoryEGL = ^TGstGLMemoryEGL;


function gst_gl_memory_egl_get_type: TGType; cdecl; external libgstgl;
procedure gst_gl_memory_egl_init_once; cdecl; external libgstgl;
function gst_is_gl_memory_egl(mem: PGstMemory): Tgboolean; cdecl; external libgstgl;
function gst_gl_memory_egl_get_image(mem: PGstGLMemoryEGL): Tgpointer; cdecl; external libgstgl;
function gst_gl_memory_egl_get_display(mem: PGstGLMemoryEGL): Tgpointer; cdecl; external libgstgl;

type
  TGstGLMemoryEGLAllocator = record
    parent: TGstGLMemoryAllocator;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstGLMemoryEGLAllocator = ^TGstGLMemoryEGLAllocator;

  TGstGLMemoryEGLAllocatorClass = record
    parent_class: TGstGLMemoryAllocatorClass;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstGLMemoryEGLAllocatorClass = ^TGstGLMemoryEGLAllocatorClass;

function GST_GL_MEMORY_EGL_ALLOCATOR_CAST(obj: Pointer): PGstGLMemoryEGLAllocator;
function GST_TYPE_GL_MEMORY_EGL: TGType;

// === Konventiert am: 9-10-24 09:02:54 ===

function GST_TYPE_GL_MEMORY_EGL_ALLOCATOR: TGType;
function GST_GL_MEMORY_EGL_ALLOCATOR(obj: Pointer): PGstGLMemoryEGLAllocator;
function GST_GL_MEMORY_EGL_ALLOCATOR_CLASS(klass: Pointer): PGstGLMemoryEGLAllocatorClass;
function GST_IS_GL_MEMORY_EGL_ALLOCATOR(obj: Pointer): Tgboolean;
function GST_IS_GL_MEMORY_EGL_ALLOCATOR_CLASS(klass: Pointer): Tgboolean;
function GST_GL_MEMORY_EGL_ALLOCATOR_GET_CLASS(obj: Pointer): PGstGLMemoryEGLAllocatorClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_GL_MEMORY_EGL_ALLOCATOR: TGType;
begin
  GST_TYPE_GL_MEMORY_EGL_ALLOCATOR := gst_gl_memory_egl_allocator_get_type;
end;

function GST_GL_MEMORY_EGL_ALLOCATOR(obj: Pointer): PGstGLMemoryEGLAllocator;
begin
  Result := PGstGLMemoryEGLAllocator(g_type_check_instance_cast(obj, GST_TYPE_GL_MEMORY_EGL_ALLOCATOR));
end;

function GST_GL_MEMORY_EGL_ALLOCATOR_CLASS(klass: Pointer): PGstGLMemoryEGLAllocatorClass;
begin
  Result := PGstGLMemoryEGLAllocatorClass(g_type_check_class_cast(klass, GST_TYPE_GL_MEMORY_EGL_ALLOCATOR));
end;

function GST_IS_GL_MEMORY_EGL_ALLOCATOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_GL_MEMORY_EGL_ALLOCATOR);
end;

function GST_IS_GL_MEMORY_EGL_ALLOCATOR_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_GL_MEMORY_EGL_ALLOCATOR);
end;

function GST_GL_MEMORY_EGL_ALLOCATOR_GET_CLASS(obj: Pointer): PGstGLMemoryEGLAllocatorClass;
begin
  Result := PGstGLMemoryEGLAllocatorClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_GL_MEMORY_EGL_ALLOCATOR_CAST(obj: Pointer): PGstGLMemoryEGLAllocator;
begin
  GST_GL_MEMORY_EGL_ALLOCATOR_CAST := PGstGLMemoryEGLAllocator(obj);
end;

function GST_TYPE_GL_MEMORY_EGL: TGType;
begin
  GST_TYPE_GL_MEMORY_EGL := gst_gl_memory_egl_get_type;
end;


{$ENDIF read_implementation}
