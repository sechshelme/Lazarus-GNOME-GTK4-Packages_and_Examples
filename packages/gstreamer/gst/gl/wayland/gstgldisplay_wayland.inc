/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 09-10-2024   15:45                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

function gst_gl_display_wayland_get_type:TGType;cdecl;external libgstgl;

type
  TGstGLDisplayWayland = record
    parent: TGstGLDisplay;
    display: Pwl_display;
    registry: Pwl_registry;
    compositor: Pwl_compositor;
    subcompositor: Pwl_subcompositor;
    shell: Pwl_shell;
    foreign_display: Tgboolean;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstGLDisplayWayland = ^TGstGLDisplayWayland;

  TGstGLDisplayWaylandClass = record
    object_class: TGstGLDisplayClass;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstGLDisplayWaylandClass = ^TGstGLDisplayWaylandClass;


function gst_gl_display_wayland_new(Name: Pgchar): PGstGLDisplayWayland; cdecl; external libgstgl;
function gst_gl_display_wayland_new_with_display(display: Pwl_display): PGstGLDisplayWayland; cdecl; external libgstgl;

function GST_GL_DISPLAY_WAYLAND_CAST(obj : Pointer) : PGstGLDisplayWayland;

// === Konventiert am: 9-10-24 15:43:41 ===

function GST_TYPE_GL_DISPLAY_WAYLAND : TGType;
function GST_GL_DISPLAY_WAYLAND(obj : Pointer) : PGstGLDisplayWayland;
function GST_GL_DISPLAY_WAYLAND_CLASS(klass : Pointer) : PGstGLDisplayWaylandClass;
function GST_IS_GL_DISPLAY_WAYLAND(obj : Pointer) : Tgboolean;
function GST_IS_GL_DISPLAY_WAYLAND_CLASS(klass : Pointer) : Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_GL_DISPLAY_WAYLAND: TGType;
begin
  GST_TYPE_GL_DISPLAY_WAYLAND := gst_gl_display_wayland_get_type;
end;

function GST_GL_DISPLAY_WAYLAND(obj: Pointer): PGstGLDisplayWayland;
begin
  Result := PGstGLDisplayWayland(g_type_check_instance_cast(obj, GST_TYPE_GL_DISPLAY_WAYLAND));
end;

function GST_GL_DISPLAY_WAYLAND_CLASS(klass: Pointer): PGstGLDisplayWaylandClass;
begin
  Result := PGstGLDisplayWaylandClass(g_type_check_class_cast(klass, GST_TYPE_GL_DISPLAY_WAYLAND));
end;

function GST_IS_GL_DISPLAY_WAYLAND(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_GL_DISPLAY_WAYLAND);
end;

function GST_IS_GL_DISPLAY_WAYLAND_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_GL_DISPLAY_WAYLAND);
end;

// ====

function GST_GL_DISPLAY_WAYLAND_CAST(obj: Pointer): PGstGLDisplayWayland;
begin
  GST_GL_DISPLAY_WAYLAND_CAST := PGstGLDisplayWayland(obj);
end;


{$ENDIF read_implementation}
