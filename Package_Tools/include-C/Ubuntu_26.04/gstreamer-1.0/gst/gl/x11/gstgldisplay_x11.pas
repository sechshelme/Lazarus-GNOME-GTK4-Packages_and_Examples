unit gstgldisplay_x11;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  xlib, fp_glib2, fp_gst ,gstgldisplay;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGstGLDisplayX11 = ^TGstGLDisplayX11;
  TGstGLDisplayX11 = record
    parent: TGstGLDisplay;
    name: Pgchar;
    display: PDisplay;
    xcb_connection: Pxcb_connection_t;
    foreign_display: Tgboolean;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstGLDisplayX11Class = ^TGstGLDisplayX11Class;
  TGstGLDisplayX11Class = record
    object_class: TGstGLDisplayClass;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_gl_display_x11_get_type: TGType; cdecl; external libgstgl;
function gst_gl_display_x11_new(name: Pgchar): PGstGLDisplayX11; cdecl; external libgstgl;
function gst_gl_display_x11_new_with_display(display: PDisplay): PGstGLDisplayX11; cdecl; external libgstgl;

// === Konventiert am: 14-7-26 19:49:26 ===

function GST_TYPE_GL_DISPLAY_X11: TGType;
function GST_GL_DISPLAY_X11(obj: Pointer): PGstGLDisplayX11;
function GST_GL_DISPLAY_X11_CLASS(klass: Pointer): PGstGLDisplayX11Class;
function GST_IS_GL_DISPLAY_X11(obj: Pointer): Tgboolean;
function GST_IS_GL_DISPLAY_X11_CLASS(klass: Pointer): Tgboolean;
function GST_GL_DISPLAY_X11_CAST(obj: Pointer): PGstGLDisplayX11;
{$ENDIF read_function}


implementation

function GST_TYPE_GL_DISPLAY_X11: TGType;
begin
  GST_TYPE_GL_DISPLAY_X11 := gst_gl_display_x11_get_type;
end;

function GST_GL_DISPLAY_X11(obj: Pointer): PGstGLDisplayX11;
begin
  Result := PGstGLDisplayX11(g_type_check_instance_cast(obj, GST_TYPE_GL_DISPLAY_X11));
end;

function GST_GL_DISPLAY_X11_CLASS(klass: Pointer): PGstGLDisplayX11Class;
begin
  Result := PGstGLDisplayX11Class(g_type_check_class_cast(klass, GST_TYPE_GL_DISPLAY_X11));
end;

function GST_IS_GL_DISPLAY_X11(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_GL_DISPLAY_X11);
end;

function GST_IS_GL_DISPLAY_X11_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_GL_DISPLAY_X11);
end;


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function GST_GL_DISPLAY_X11_CAST(obj: Pointer): PGstGLDisplayX11;
begin
  GST_GL_DISPLAY_X11_CAST := PGstGLDisplayX11(obj);
end;


end.
