unit gstgldisplay_egl;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, gstgldisplay;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
const
  GST_GL_DISPLAY_EGL_NAME = 'gst.gl.display.egl';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGstGLDisplayEGL = ^TGstGLDisplayEGL;
  TGstGLDisplayEGL = record
    parent: TGstGLDisplay;
    display: Tgpointer;
    foreign_display: Tgboolean;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstGLDisplayEGLClass = ^TGstGLDisplayEGLClass;
  TGstGLDisplayEGLClass = record
    object_class: TGstGLDisplayClass;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_gl_display_egl_get_type: TGType; cdecl; external libgstgl;
function gst_gl_display_egl_new: PGstGLDisplayEGL; cdecl; external libgstgl;
function gst_gl_display_egl_new_surfaceless: PGstGLDisplayEGL; cdecl; external libgstgl;
function gst_gl_display_egl_new_with_egl_display(display: Tgpointer): PGstGLDisplayEGL; cdecl; external libgstgl;
function gst_gl_display_egl_from_gl_display(display: PGstGLDisplay): PGstGLDisplayEGL; cdecl; external libgstgl;
function gst_gl_display_egl_get_from_native(_type: TGstGLDisplayType; display: Tguintptr): Tgpointer; cdecl; external libgstgl;
procedure gst_gl_display_egl_set_foreign(display_egl: PGstGLDisplayEGL; foreign: Tgboolean); cdecl; external libgstgl;

// === Konventiert am: 14-7-26 19:31:58 ===

function GST_TYPE_GL_DISPLAY_EGL: TGType;
function GST_GL_DISPLAY_EGL(obj: Pointer): PGstGLDisplayEGL;
function GST_GL_DISPLAY_EGL_CLASS(klass: Pointer): PGstGLDisplayEGLClass;
function GST_IS_GL_DISPLAY_EGL(obj: Pointer): Tgboolean;
function GST_IS_GL_DISPLAY_EGL_CLASS(klass: Pointer): Tgboolean;
function GST_GL_DISPLAY_EGL_CAST(obj: Pointer): PGstGLDisplayEGL;
{$ENDIF read_function}

implementation

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

function GST_GL_DISPLAY_EGL_CAST(obj: Pointer): PGstGLDisplayEGL;
begin
  GST_GL_DISPLAY_EGL_CAST := PGstGLDisplayEGL(obj);
end;


end.
