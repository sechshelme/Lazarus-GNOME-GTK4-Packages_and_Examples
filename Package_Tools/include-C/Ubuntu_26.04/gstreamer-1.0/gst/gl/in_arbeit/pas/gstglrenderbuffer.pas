unit gstglrenderbuffer;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, gstglbasememory, gstglformat;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
const
  GST_GL_RENDERBUFFER_ALLOCATOR_NAME = 'GLRenderbuffer';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGstGLRenderbuffer = ^TGstGLRenderbuffer;
  TGstGLRenderbuffer = record
    mem: TGstGLBaseMemory;
    renderbuffer_id: Tguint;
    renderbuffer_format: TGstGLFormat;
    width: Tguint;
    height: Tguint;
    renderbuffer_wrapped: Tgboolean;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstGLRenderbufferAllocator = ^TGstGLRenderbufferAllocator;
  TGstGLRenderbufferAllocator = record
    parent: TGstGLBaseMemoryAllocator;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstGLRenderbufferAllocatorClass = ^TGstGLRenderbufferAllocatorClass;
  TGstGLRenderbufferAllocatorClass = record
    parent_class: TGstGLBaseMemoryAllocatorClass;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstGLRenderbufferAllocationParams = ^TGstGLRenderbufferAllocationParams;
  TGstGLRenderbufferAllocationParams = record
    parent: TGstGLAllocationParams;
    renderbuffer_format: TGstGLFormat;
    width: Tguint;
    height: Tguint;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_gl_renderbuffer_allocator_get_type: TGType; cdecl; external libgstgl;
function gst_gl_renderbuffer_allocation_params_get_type: TGType; cdecl; external libgstgl;

function gst_gl_renderbuffer_allocation_params_new(context: PGstGLContext; alloc_params: PGstAllocationParams; renderbuffer_format: TGstGLFormat; width: Tguint; height: Tguint): PGstGLRenderbufferAllocationParams; cdecl; external libgstgl;
function gst_gl_renderbuffer_allocation_params_new_wrapped(context: PGstGLContext; alloc_params: PGstAllocationParams; renderbuffer_format: TGstGLFormat; width: Tguint; height: Tguint;
  gl_handle: Tgpointer; user_data: Tgpointer; notify: TGDestroyNotify): PGstGLRenderbufferAllocationParams; cdecl; external libgstgl;
function gst_gl_renderbuffer_get_type: TGType; cdecl; external libgstgl; deprecated;
procedure gst_gl_renderbuffer_init_once; cdecl; external libgstgl;
function gst_is_gl_renderbuffer(mem: PGstMemory): Tgboolean; cdecl; external libgstgl;

function gst_gl_renderbuffer_get_width(gl_mem: PGstGLRenderbuffer): Tgint; cdecl; external libgstgl;
function gst_gl_renderbuffer_get_height(gl_mem: PGstGLRenderbuffer): Tgint; cdecl; external libgstgl;
function gst_gl_renderbuffer_get_format(gl_mem: PGstGLRenderbuffer): TGstGLFormat; cdecl; external libgstgl;
function gst_gl_renderbuffer_get_id(gl_mem: PGstGLRenderbuffer): Tguint; cdecl; external libgstgl;

// === Konventiert am: 14-7-26 13:06:41 ===

function GST_GL_RENDERBUFFER_ALLOCATOR_CAST(obj: Pointer): PGstGLRenderbufferAllocator;
function GST_GL_RENDERBUFFER_CAST(obj: Pointer): PGstGLRenderbuffer;
function GST_TYPE_GL_RENDERBUFFER: TGType;

function GST_TYPE_RENDERBUFFER_ALLOCATION_PARAMS: TGType;

function GST_TYPE_GL_RENDERBUFFER_ALLOCATOR: TGType;
function GST_GL_RENDERBUFFER_ALLOCATOR(obj: Pointer): PGstGLRenderbufferAllocator;
function GST_GL_RENDERBUFFER_ALLOCATOR_CLASS(klass: Pointer): PGstGLRenderbufferAllocatorClass;
function GST_IS_GL_RENDERBUFFER_ALLOCATOR(obj: Pointer): Tgboolean;
function GST_IS_GL_RENDERBUFFER_ALLOCATOR_CLASS(klass: Pointer): Tgboolean;
function GST_GL_RENDERBUFFER_ALLOCATOR_GET_CLASS(obj: Pointer): PGstGLRenderbufferAllocatorClass;
{$ENDIF read_function}

implementation

function GST_TYPE_GL_RENDERBUFFER_ALLOCATOR: TGType;
begin
  GST_TYPE_GL_RENDERBUFFER_ALLOCATOR := gst_gl_renderbuffer_allocator_get_type;
end;

function GST_GL_RENDERBUFFER_ALLOCATOR(obj: Pointer): PGstGLRenderbufferAllocator;
begin
  Result := PGstGLRenderbufferAllocator(g_type_check_instance_cast(obj, GST_TYPE_GL_RENDERBUFFER_ALLOCATOR));
end;

function GST_GL_RENDERBUFFER_ALLOCATOR_CLASS(klass: Pointer): PGstGLRenderbufferAllocatorClass;
begin
  Result := PGstGLRenderbufferAllocatorClass(g_type_check_class_cast(klass, GST_TYPE_GL_RENDERBUFFER_ALLOCATOR));
end;

function GST_IS_GL_RENDERBUFFER_ALLOCATOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_GL_RENDERBUFFER_ALLOCATOR);
end;

function GST_IS_GL_RENDERBUFFER_ALLOCATOR_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_GL_RENDERBUFFER_ALLOCATOR);
end;

function GST_GL_RENDERBUFFER_ALLOCATOR_GET_CLASS(obj: Pointer): PGstGLRenderbufferAllocatorClass;
begin
  Result := PGstGLRenderbufferAllocatorClass(PGTypeInstance(obj)^.g_class);
end;


function GST_TYPE_RENDERBUFFER_ALLOCATION_PARAMS: TGType;
begin
  Result := gst_gl_renderbuffer_allocation_params_get_type;
end;

function GST_GL_RENDERBUFFER_ALLOCATOR_CAST(obj: Pointer
  ): PGstGLRenderbufferAllocator;
begin
  GST_GL_RENDERBUFFER_ALLOCATOR_CAST := PGstGLRenderbufferAllocator(obj);
end;

function GST_GL_RENDERBUFFER_CAST(obj: Pointer): PGstGLRenderbuffer;
begin
  GST_GL_RENDERBUFFER_CAST := PGstGLRenderbuffer(obj);
end;

function GST_TYPE_GL_RENDERBUFFER: TGType;
begin
  GST_TYPE_GL_RENDERBUFFER := gst_gl_renderbuffer_get_type;
end;

end.
