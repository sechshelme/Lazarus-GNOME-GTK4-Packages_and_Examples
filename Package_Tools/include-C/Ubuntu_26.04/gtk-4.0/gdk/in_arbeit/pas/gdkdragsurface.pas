unit gdkdragsurface;

interface

uses
  fp_glib2, fp_gtk4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGdkDragSurface = type Pointer;
  PGdkDragSurfaceInterface = type Pointer;

function gdk_drag_surface_get_type: TGType; cdecl; external libgtk4;
function gdk_drag_surface_present(drag_surface: PGdkDragSurface; width: longint; height: longint): Tgboolean; cdecl; external libgtk4;

// === Konventiert am: 2-7-26 19:17:30 ===

function GDK_TYPE_DRAG_SURFACE: TGType;
function GDK_DRAG_SURFACE(obj: Pointer): PGdkDragSurface;
function GDK_IS_DRAG_SURFACE(obj: Pointer): Tgboolean;
function GDK_DRAG_SURFACE_GET_IFACE(obj: Pointer): PGdkDragSurfaceInterface;

implementation

function GDK_TYPE_DRAG_SURFACE: TGType;
begin
  Result := gdk_drag_surface_get_type;
end;

function GDK_DRAG_SURFACE(obj: Pointer): PGdkDragSurface;
begin
  Result := PGdkDragSurface(g_type_check_instance_cast(obj, GDK_TYPE_DRAG_SURFACE));
end;

function GDK_IS_DRAG_SURFACE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GDK_TYPE_DRAG_SURFACE);
end;

function GDK_DRAG_SURFACE_GET_IFACE(obj: Pointer): PGdkDragSurfaceInterface;
begin
  Result := g_type_interface_peek(obj, GDK_TYPE_DRAG_SURFACE);
end;

end.
