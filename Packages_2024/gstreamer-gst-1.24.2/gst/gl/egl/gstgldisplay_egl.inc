
{$IFDEF read_interface}

function gst_gl_display_egl_get_type: TGType; cdecl; external libgstgl;

type
  TGstGLDisplayEGL = record
    parent: TGstGLDisplay;
    display: Tgpointer;
    foreign_display: Tgboolean;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstGLDisplayEGL = ^TGstGLDisplayEGL;

  TGstGLDisplayEGLClass = record
    object_class: TGstGLDisplayClass;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstGLDisplayEGLClass = ^TGstGLDisplayEGLClass;


function gst_gl_display_egl_new: PGstGLDisplayEGL; cdecl; external libgstgl;
function gst_gl_display_egl_new_surfaceless: PGstGLDisplayEGL; cdecl; external libgstgl;
function gst_gl_display_egl_new_with_egl_display(display: Tgpointer): PGstGLDisplayEGL; cdecl; external libgstgl;
function gst_gl_display_egl_from_gl_display(display: PGstGLDisplay): PGstGLDisplayEGL; cdecl; external libgstgl;
function gst_gl_display_egl_get_from_native(_type: TGstGLDisplayType; display: Tguintptr): Tgpointer; cdecl; external libgstgl;

const
  GST_GL_DISPLAY_EGL_NAME = 'gst.gl.display.egl';

function GST_GL_DISPLAY_EGL_CAST(obj: Pointer): PGstGLDisplayEGL;

// === Konventiert am: 9-10-24 09:01:09 ===

function GST_TYPE_GL_DISPLAY_EGL: TGType;
function GST_GL_DISPLAY_EGL(obj: Pointer): PGstGLDisplayEGL;
function GST_GL_DISPLAY_EGL_CLASS(klass: Pointer): PGstGLDisplayEGLClass;
function GST_IS_GL_DISPLAY_EGL(obj: Pointer): Tgboolean;
function GST_IS_GL_DISPLAY_EGL_CLASS(klass: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_GL_DISPLAY_EGL: TGType;
begin
  GST_TYPE_GL_DISPLAY_EGL := gst_gl_display_egl_get_type;
end;

function GST_GL_DISPLAY_EGL(obj: Pointer): PGstGLDisplayEGL;
begin
  Result := PGstGLDisplayEGL(g_type_check_instance_cast(obj, GST_TYPE_GL_DISPLAY_EGL));
end;

function GST_GL_DISPLAY_EGL_CLASS(klass: Pointer): PGstGLDisplayEGLClass;
begin
  Result := PGstGLDisplayEGLClass(g_type_check_class_cast(klass, GST_TYPE_GL_DISPLAY_EGL));
end;

function GST_IS_GL_DISPLAY_EGL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_GL_DISPLAY_EGL);
end;

function GST_IS_GL_DISPLAY_EGL_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_GL_DISPLAY_EGL);
end;

// ====

function GST_GL_DISPLAY_EGL_CAST(obj: Pointer): PGstGLDisplayEGL;
begin
  GST_GL_DISPLAY_EGL_CAST := PGstGLDisplayEGL(obj);
end;


{$ENDIF read_implementation}
