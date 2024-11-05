/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 09-10-2024   15:45                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}


function gst_gl_display_x11_get_type:TGType;cdecl;external libgstgl;

type
  TGstGLDisplayX11 = record
    parent: TGstGLDisplay;
    Name: Pgchar;
    display: PDisplay;
    xcb_connection: Pxcb_connection_t;
    foreign_display: Tgboolean;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstGLDisplayX11 = ^TGstGLDisplayX11;

  TGstGLDisplayX11Class = record
    object_class: TGstGLDisplayClass;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstGLDisplayX11Class = ^TGstGLDisplayX11Class;


function gst_gl_display_x11_new(Name: Pgchar): PGstGLDisplayX11; cdecl; external libgstgl;
function gst_gl_display_x11_new_with_display(display: PDisplay): PGstGLDisplayX11; cdecl; external libgstgl;

function GST_GL_DISPLAY_X11_CAST(obj : Pointer) : PGstGLDisplayX11;

// === Konventiert am: 9-10-24 15:45:19 ===

function GST_TYPE_GL_DISPLAY_X11 : TGType;
function GST_GL_DISPLAY_X11(obj : Pointer) : PGstGLDisplayX11;
function GST_GL_DISPLAY_X11_CLASS(klass : Pointer) : PGstGLDisplayX11Class;
function GST_IS_GL_DISPLAY_X11(obj : Pointer) : Tgboolean;
function GST_IS_GL_DISPLAY_X11_CLASS(klass : Pointer) : Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

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

// ====

function GST_GL_DISPLAY_X11_CAST(obj: Pointer): PGstGLDisplayX11;
begin
  GST_GL_DISPLAY_X11_CAST := PGstGLDisplayX11(obj);
end;


{$ENDIF read_implementation}
