
{$IFDEF read_interface}

function gst_gl_overlay_compositor_get_type: TGType; cdecl; external libgstgl;

type
  PGstGLOverlayCompositor = ^TGstGLOverlayCompositor;

  TGstGLOverlayCompositor = record
    parent: TGstObject;
    context: PGstGLContext;
    last_window_width: Tguint;
    last_window_height: Tguint;
    overlays: PGList;
    shader: PGstGLShader;
    position_attrib: Tgint;
    texcoord_attrib: Tgint;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  TGstGLOverlayCompositorClass = record
    object_class: TGstObjectClass;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstGLOverlayCompositorClass = ^TGstGLOverlayCompositorClass;


function gst_gl_overlay_compositor_new(context: PGstGLContext): PGstGLOverlayCompositor; cdecl; external libgstgl;
procedure gst_gl_overlay_compositor_free_overlays(compositor: PGstGLOverlayCompositor); cdecl; external libgstgl;
procedure gst_gl_overlay_compositor_upload_overlays(compositor: PGstGLOverlayCompositor; buf: PGstBuffer); cdecl; external libgstgl;
procedure gst_gl_overlay_compositor_draw_overlays(compositor: PGstGLOverlayCompositor); cdecl; external libgstgl;
function gst_gl_overlay_compositor_add_caps(caps: PGstCaps): PGstCaps; cdecl; external libgstgl;

function GST_GL_OVERLAY_COMPOSITOR_CAST(obj: Pointer): PGstGLOverlayCompositor;

// === Konventiert am: 9-10-24 14:58:15 ===

function GST_TYPE_GL_OVERLAY_COMPOSITOR: TGType;
function GST_GL_OVERLAY_COMPOSITOR(obj: Pointer): PGstGLOverlayCompositor;
function GST_GL_OVERLAY_COMPOSITOR_CLASS(klass: Pointer): PGstGLOverlayCompositorClass;
function GST_IS_GL_OVERLAY_COMPOSITOR(obj: Pointer): Tgboolean;
function GST_IS_GL_OVERLAY_COMPOSITOR_CLASS(klass: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_GL_OVERLAY_COMPOSITOR: TGType;
begin
  GST_TYPE_GL_OVERLAY_COMPOSITOR := gst_gl_overlay_compositor_get_type;
end;

function GST_GL_OVERLAY_COMPOSITOR(obj: Pointer): PGstGLOverlayCompositor;
begin
  Result := PGstGLOverlayCompositor(g_type_check_instance_cast(obj, GST_TYPE_GL_OVERLAY_COMPOSITOR));
end;

function GST_GL_OVERLAY_COMPOSITOR_CLASS(klass: Pointer): PGstGLOverlayCompositorClass;
begin
  Result := PGstGLOverlayCompositorClass(g_type_check_class_cast(klass, GST_TYPE_GL_OVERLAY_COMPOSITOR));
end;

function GST_IS_GL_OVERLAY_COMPOSITOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_GL_OVERLAY_COMPOSITOR);
end;

function GST_IS_GL_OVERLAY_COMPOSITOR_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_GL_OVERLAY_COMPOSITOR);
end;


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GL_OVERLAY_COMPOSITOR_CAST(obj: Pointer): PGstGLOverlayCompositor;
begin
  GST_GL_OVERLAY_COMPOSITOR_CAST := PGstGLOverlayCompositor(obj);
end;


{$ENDIF read_implementation}
