unit gstgldisplay_wayland;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, gstgldisplay;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGstGLDisplayWayland = ^TGstGLDisplayWayland;
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

  PGstGLDisplayWaylandClass = ^TGstGLDisplayWaylandClass;
  TGstGLDisplayWaylandClass = record
    object_class: TGstGLDisplayClass;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_gl_display_wayland_get_type: TGType; cdecl; external libgstgl;
function gst_gl_display_wayland_new(name: Pgchar): PGstGLDisplayWayland; cdecl; external libgstgl;
function gst_gl_display_wayland_new_with_display(display: Pwl_display): PGstGLDisplayWayland; cdecl; external libgstgl;

// === Konventiert am: 14-7-26 19:46:01 ===

function GST_TYPE_GL_DISPLAY_WAYLAND: TGType;
function GST_GL_DISPLAY_WAYLAND(obj: Pointer): PGstGLDisplayWayland;
function GST_GL_DISPLAY_WAYLAND_CLASS(klass: Pointer): PGstGLDisplayWaylandClass;
function GST_IS_GL_DISPLAY_WAYLAND(obj: Pointer): Tgboolean;
function GST_IS_GL_DISPLAY_WAYLAND_CLASS(klass: Pointer): Tgboolean;
function GST_GL_DISPLAY_WAYLAND_CAST(obj: Pointer): PGstGLDisplayWayland;
{$ENDIF read_function}

implementation

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

function GST_GL_DISPLAY_WAYLAND_CAST(obj: Pointer): PGstGLDisplayWayland;
begin
  GST_GL_DISPLAY_WAYLAND_CAST := PGstGLDisplayWayland(obj);
end;

end.
