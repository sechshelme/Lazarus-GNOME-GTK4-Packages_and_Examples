
{$IFDEF read_interface}

const
  GST_CAPS_FEATURE_MEMORY_GL_MEMORY = 'memory:GLMemory';

type
  TGstGLMemory = record
    mem: TGstGLBaseMemory;
    tex_id: Tguint;
    tex_target: TGstGLTextureTarget;
    tex_format: TGstGLFormat;
    info: TGstVideoInfo;
    valign: TGstVideoAlignment;
    plane: Tguint;
    tex_scaling: array[0..1] of Tgfloat;
    texture_wrapped: Tgboolean;
    unpack_length: Tguint;
    tex_width: Tguint;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstGLMemory = ^TGstGLMemory;

function gst_gl_video_allocation_params_get_type: TGType; cdecl; external libgstgl;

const
  GST_GL_ALLOCATION_PARAMS_ALLOC_FLAG_VIDEO = 1 shl 3;

type
  TGstGLVideoAllocationParams = record
    parent: TGstGLAllocationParams;
    v_info: PGstVideoInfo;
    plane: Tguint;
    valign: PGstVideoAlignment;
    target: TGstGLTextureTarget;
    tex_format: TGstGLFormat;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstGLVideoAllocationParams = ^TGstGLVideoAllocationParams;

function gst_gl_memory_allocator_get_type: TGType; cdecl; external libgstgl;
function gst_gl_video_allocation_params_init_full(params: PGstGLVideoAllocationParams; struct_size: Tgsize; alloc_flags: Tguint; copy: TGstGLAllocationParamsCopyFunc; Free: TGstGLAllocationParamsFreeFunc;
  context: PGstGLContext; alloc_params: PGstAllocationParams; v_info: PGstVideoInfo; plane: Tguint; valign: PGstVideoAlignment;
  target: TGstGLTextureTarget; tex_format: TGstGLFormat; wrapped_data: Tgpointer; gl_handle: Tgpointer; user_data: Tgpointer;
  notify: TGDestroyNotify): Tgboolean; cdecl; external libgstgl;
function gst_gl_video_allocation_params_new(context: PGstGLContext; alloc_params: PGstAllocationParams; v_info: PGstVideoInfo; plane: Tguint; valign: PGstVideoAlignment;
  target: TGstGLTextureTarget; tex_format: TGstGLFormat): PGstGLVideoAllocationParams; cdecl; external libgstgl;
function gst_gl_video_allocation_params_new_wrapped_data(context: PGstGLContext; alloc_params: PGstAllocationParams; v_info: PGstVideoInfo; plane: Tguint; valign: PGstVideoAlignment;
  target: TGstGLTextureTarget; tex_format: TGstGLFormat; wrapped_data: Tgpointer; user_data: Tgpointer; notify: TGDestroyNotify): PGstGLVideoAllocationParams; cdecl; external libgstgl;
function gst_gl_video_allocation_params_new_wrapped_texture(context: PGstGLContext; alloc_params: PGstAllocationParams; v_info: PGstVideoInfo; plane: Tguint; valign: PGstVideoAlignment;
  target: TGstGLTextureTarget; tex_format: TGstGLFormat; tex_id: Tguint; user_data: Tgpointer; notify: TGDestroyNotify): PGstGLVideoAllocationParams; cdecl; external libgstgl;
function gst_gl_video_allocation_params_new_wrapped_gl_handle(context: PGstGLContext; alloc_params: PGstAllocationParams; v_info: PGstVideoInfo; plane: Tguint; valign: PGstVideoAlignment;
  target: TGstGLTextureTarget; tex_format: TGstGLFormat; gl_handle: Tgpointer; user_data: Tgpointer; notify: TGDestroyNotify): PGstGLVideoAllocationParams; cdecl; external libgstgl;
procedure gst_gl_video_allocation_params_free_data(params: PGstGLVideoAllocationParams); cdecl; external libgstgl;
procedure gst_gl_video_allocation_params_copy_data(src_vid: PGstGLVideoAllocationParams; dest_vid: PGstGLVideoAllocationParams); cdecl; external libgstgl;

type
  TGstGLMemoryAllocator = record
    parent: TGstGLBaseMemoryAllocator;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstGLMemoryAllocator = ^TGstGLMemoryAllocator;

  TGstGLMemoryAllocatorClass = record
    parent_class: TGstGLBaseMemoryAllocatorClass;
    map: TGstGLBaseMemoryAllocatorMapFunction;
    copy: TGstGLBaseMemoryAllocatorCopyFunction;
    unmap: TGstGLBaseMemoryAllocatorUnmapFunction;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstGLMemoryAllocatorClass = ^TGstGLMemoryAllocatorClass;

const
  GST_GL_MEMORY_ALLOCATOR_NAME = 'GLMemory';

function gst_gl_memory_get_type: TGType; cdecl; external libgstgl;
procedure gst_gl_memory_init_once; cdecl; external libgstgl;
function gst_is_gl_memory(mem: PGstMemory): Tgboolean; cdecl; external libgstgl;
procedure gst_gl_memory_init(mem: PGstGLMemory; allocator: PGstAllocator; parent: PGstMemory; context: PGstGLContext; target: TGstGLTextureTarget;
  tex_format: TGstGLFormat; params: PGstAllocationParams; info: PGstVideoInfo; plane: Tguint; valign: PGstVideoAlignment;
  user_data: Tgpointer; notify: TGDestroyNotify); cdecl; external libgstgl;
function gst_gl_memory_copy_into(gl_mem: PGstGLMemory; tex_id: Tguint; target: TGstGLTextureTarget; tex_format: TGstGLFormat; Width: Tgint;
  Height: Tgint): Tgboolean; cdecl; external libgstgl;
function gst_gl_memory_copy_teximage(src: PGstGLMemory; tex_id: Tguint; out_target: TGstGLTextureTarget; out_tex_format: TGstGLFormat; out_width: Tgint;
  out_height: Tgint): Tgboolean; cdecl; external libgstgl;
function gst_gl_memory_read_pixels(gl_mem: PGstGLMemory; write_pointer: Tgpointer): Tgboolean; cdecl; external libgstgl;
procedure gst_gl_memory_texsubimage(gl_mem: PGstGLMemory; read_pointer: Tgpointer); cdecl; external libgstgl;
function gst_gl_memory_get_texture_width(gl_mem: PGstGLMemory): Tgint; cdecl; external libgstgl;
function gst_gl_memory_get_texture_height(gl_mem: PGstGLMemory): Tgint; cdecl; external libgstgl;
function gst_gl_memory_get_texture_format(gl_mem: PGstGLMemory): TGstGLFormat; cdecl; external libgstgl;
function gst_gl_memory_get_texture_target(gl_mem: PGstGLMemory): TGstGLTextureTarget; cdecl; external libgstgl;
function gst_gl_memory_get_texture_id(gl_mem: PGstGLMemory): Tguint; cdecl; external libgstgl;
function gst_gl_memory_setup_buffer(allocator: PGstGLMemoryAllocator; buffer: PGstBuffer; params: PGstGLVideoAllocationParams; tex_formats: PGstGLFormat; wrapped_data: Pgpointer;
  n_wrapped_pointers: Tgsize): Tgboolean; cdecl; external libgstgl;
function gst_gl_memory_allocator_get_default(context: PGstGLContext): PGstGLMemoryAllocator; cdecl; external libgstgl;

function GST_GL_MEMORY_ALLOCATOR_CAST(obj: Pointer): PGstGLMemoryAllocator;
function GST_GL_MEMORY_CAST(obj: Pointer): PGstGLMemory;
function GST_TYPE_GL_VIDEO_ALLOCATION_PARAMS: TGType;
function GST_TYPE_GL_MEMORY: TGType;

// === Konventiert am: 9-10-24 10:21:32 ===

function GST_TYPE_GL_MEMORY_ALLOCATOR: TGType;
function GST_GL_MEMORY_ALLOCATOR(obj: Pointer): PGstGLMemoryAllocator;
function GST_GL_MEMORY_ALLOCATOR_CLASS(klass: Pointer): PGstGLMemoryAllocatorClass;
function GST_IS_GL_MEMORY_ALLOCATOR(obj: Pointer): Tgboolean;
function GST_IS_GL_MEMORY_ALLOCATOR_CLASS(klass: Pointer): Tgboolean;
function GST_GL_MEMORY_ALLOCATOR_GET_CLASS(obj: Pointer): PGstGLMemoryAllocatorClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_GL_MEMORY_ALLOCATOR: TGType;
begin
  GST_TYPE_GL_MEMORY_ALLOCATOR := gst_gl_memory_allocator_get_type;
end;

function GST_GL_MEMORY_ALLOCATOR(obj: Pointer): PGstGLMemoryAllocator;
begin
  Result := PGstGLMemoryAllocator(g_type_check_instance_cast(obj, GST_TYPE_GL_MEMORY_ALLOCATOR));
end;

function GST_GL_MEMORY_ALLOCATOR_CLASS(klass: Pointer): PGstGLMemoryAllocatorClass;
begin
  Result := PGstGLMemoryAllocatorClass(g_type_check_class_cast(klass, GST_TYPE_GL_MEMORY_ALLOCATOR));
end;

function GST_IS_GL_MEMORY_ALLOCATOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_GL_MEMORY_ALLOCATOR);
end;

function GST_IS_GL_MEMORY_ALLOCATOR_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_GL_MEMORY_ALLOCATOR);
end;

function GST_GL_MEMORY_ALLOCATOR_GET_CLASS(obj: Pointer): PGstGLMemoryAllocatorClass;
begin
  Result := PGstGLMemoryAllocatorClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_GL_MEMORY_ALLOCATOR_CAST(obj: Pointer): PGstGLMemoryAllocator;
begin
  GST_GL_MEMORY_ALLOCATOR_CAST := PGstGLMemoryAllocator(obj);
end;

function GST_GL_MEMORY_CAST(obj: Pointer): PGstGLMemory;
begin
  GST_GL_MEMORY_CAST := PGstGLMemory(obj);
end;

function GST_TYPE_GL_VIDEO_ALLOCATION_PARAMS: TGType;
begin
  GST_TYPE_GL_VIDEO_ALLOCATION_PARAMS := gst_gl_video_allocation_params_get_type;
end;

function GST_TYPE_GL_MEMORY: TGType;
begin
  GST_TYPE_GL_MEMORY := gst_gl_memory_get_type;
end;


{$ENDIF read_implementation}
