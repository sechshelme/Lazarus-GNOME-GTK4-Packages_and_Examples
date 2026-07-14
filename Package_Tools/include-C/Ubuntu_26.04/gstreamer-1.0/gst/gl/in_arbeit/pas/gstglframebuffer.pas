unit gstglframebuffer;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, gstglmemory, gstglbasememory;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  TGstGLFramebufferFunc = function(stuff: Tgpointer): Tgboolean; cdecl;

  PGstGLFramebufferPrivate = type Pointer;

  PGstGLFramebuffer = ^TGstGLFramebuffer;
  TGstGLFramebuffer = record
    obj: TGstObject;
    context: PGstGLContext;
    fbo_id: Tguint;
    attachments: PGArray;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
    priv: PGstGLFramebufferPrivate;
  end;

  PGstGLFramebufferClass = ^TGstGLFramebufferClass;
  TGstGLFramebufferClass = record
    object_class: TGstObjectClass;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_gl_framebuffer_get_type: TGType; cdecl; external libgstgl;
function gst_gl_framebuffer_new(context: PGstGLContext): PGstGLFramebuffer; cdecl; external libgstgl;
function gst_gl_framebuffer_new_with_default_depth(context: PGstGLContext; width: Tguint; height: Tguint): PGstGLFramebuffer; cdecl; external libgstgl;
function gst_gl_framebuffer_get_id(fb: PGstGLFramebuffer): Tguint; cdecl; external libgstgl;
procedure gst_gl_framebuffer_attach(fb: PGstGLFramebuffer; attachment_point: Tguint; mem: PGstGLBaseMemory); cdecl; external libgstgl;
procedure gst_gl_framebuffer_bind(fb: PGstGLFramebuffer); cdecl; external libgstgl;
procedure gst_gl_context_clear_framebuffer(context: PGstGLContext); cdecl; external libgstgl;
procedure gst_gl_framebuffer_get_effective_dimensions(fb: PGstGLFramebuffer; width: Pguint; height: Pguint); cdecl; external libgstgl;
function gst_gl_context_check_framebuffer_status(context: PGstGLContext; fbo_target: Tguint): Tgboolean; cdecl; external libgstgl;
function gst_gl_framebuffer_draw_to_texture(fb: PGstGLFramebuffer; mem: PGstGLMemory; func: TGstGLFramebufferFunc; user_data: Tgpointer): Tgboolean; cdecl; external libgstgl;

// === Konventiert am: 14-7-26 13:01:49 ===

function GST_TYPE_GL_FRAMEBUFFER: TGType;
function GST_GL_FRAMEBUFFER(obj: Pointer): PGstGLFramebuffer;
function GST_GL_FRAMEBUFFER_CLASS(klass: Pointer): PGstGLFramebufferClass;
function GST_IS_GL_FRAMEBUFFER(obj: Pointer): Tgboolean;
function GST_IS_GL_FRAMEBUFFER_CLASS(klass: Pointer): Tgboolean;
function GST_GL_FRAMEBUFFER_CAST(obj: Pointer): PGstGLFramebuffer;
{$ENDIF read_function}

implementation

function GST_TYPE_GL_FRAMEBUFFER: TGType;
begin
  GST_TYPE_GL_FRAMEBUFFER := gst_gl_framebuffer_get_type;
end;

function GST_GL_FRAMEBUFFER(obj: Pointer): PGstGLFramebuffer;
begin
  Result := PGstGLFramebuffer(g_type_check_instance_cast(obj, GST_TYPE_GL_FRAMEBUFFER));
end;

function GST_GL_FRAMEBUFFER_CLASS(klass: Pointer): PGstGLFramebufferClass;
begin
  Result := PGstGLFramebufferClass(g_type_check_class_cast(klass, GST_TYPE_GL_FRAMEBUFFER));
end;

function GST_IS_GL_FRAMEBUFFER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_GL_FRAMEBUFFER);
end;

function GST_IS_GL_FRAMEBUFFER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_GL_FRAMEBUFFER);
end;


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GL_FRAMEBUFFER_CAST(obj: Pointer): PGstGLFramebuffer;
begin
  GST_GL_FRAMEBUFFER_CAST := PGstGLFramebuffer(obj);
end;


end.
