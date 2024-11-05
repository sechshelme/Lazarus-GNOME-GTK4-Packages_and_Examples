/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 09-10-2024   19:05                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

function gst_gl_framebuffer_get_type: TGType; cdecl; external libgstgl;

type
  TGstGLFramebufferFunc = function(stuff: Tgpointer): Tgboolean; cdecl;

  TGstGLFramebufferPrivate = record
  end;
  PGstGLFramebufferPrivate = ^TGstGLFramebufferPrivate;

  TGstGLFramebuffer = record
    _object: TGstObject;
    context: PGstGLContext;
    fbo_id: Tguint;
    attachments: PGArray;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
    priv: PGstGLFramebufferPrivate;
  end;
  PGstGLFramebuffer = ^TGstGLFramebuffer;

  TGstGLFramebufferClass = record
    object_class: TGstObjectClass;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstGLFramebufferClass = ^TGstGLFramebufferClass;

function gst_gl_framebuffer_new(context: PGstGLContext): PGstGLFramebuffer; cdecl; external libgstgl;
function gst_gl_framebuffer_new_with_default_depth(context: PGstGLContext; Width: Tguint; Height: Tguint): PGstGLFramebuffer; cdecl; external libgstgl;
function gst_gl_framebuffer_get_id(fb: PGstGLFramebuffer): Tguint; cdecl; external libgstgl;
procedure gst_gl_framebuffer_attach(fb: PGstGLFramebuffer; attachment_point: Tguint; mem: PGstGLBaseMemory); cdecl; external libgstgl;
procedure gst_gl_framebuffer_bind(fb: PGstGLFramebuffer); cdecl; external libgstgl;
procedure gst_gl_context_clear_framebuffer(context: PGstGLContext); cdecl; external libgstgl;
procedure gst_gl_framebuffer_get_effective_dimensions(fb: PGstGLFramebuffer; Width: Pguint; Height: Pguint); cdecl; external libgstgl;
function gst_gl_context_check_framebuffer_status(context: PGstGLContext; fbo_target: Tguint): Tgboolean; cdecl; external libgstgl;
function gst_gl_framebuffer_draw_to_texture(fb: PGstGLFramebuffer; mem: PGstGLMemory; func: TGstGLFramebufferFunc; user_data: Tgpointer): Tgboolean; cdecl; external libgstgl;

function GST_GL_FRAMEBUFFER_CAST(obj: Pointer): PGstGLFramebuffer;


// === Konventiert am: 9-10-24 12:30:27 ===

function GST_TYPE_GL_FRAMEBUFFER: TGType;
function GST_GL_FRAMEBUFFER(obj: Pointer): PGstGLFramebuffer;
function GST_GL_FRAMEBUFFER_CLASS(klass: Pointer): PGstGLFramebufferClass;
function GST_IS_GL_FRAMEBUFFER(obj: Pointer): Tgboolean;
function GST_IS_GL_FRAMEBUFFER_CLASS(klass: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

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

// ====

function GST_GL_FRAMEBUFFER_CAST(obj: Pointer): PGstGLFramebuffer;
begin
  GST_GL_FRAMEBUFFER_CAST := PGstGLFramebuffer(obj);
end;


{$ENDIF read_implementation}
