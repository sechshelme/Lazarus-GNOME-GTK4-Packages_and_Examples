{$IFDEF read_interface}


type
  PGdkDragSurfaceSize = type Pointer;

function gdk_drag_surface_size_get_type: TGType; cdecl; external libgtk4;
procedure gdk_drag_surface_size_set_size(size: PGdkDragSurfaceSize; width: longint; height: longint); cdecl; external libgtk4;

// === Konventiert am: 2-7-26 19:17:41 ===

function GDK_TYPE_DRAG_SURFACE_SIZE: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GDK_TYPE_DRAG_SURFACE_SIZE: TGType;
begin
  GDK_TYPE_DRAG_SURFACE_SIZE := gdk_drag_surface_size_get_type;
end;



{$ENDIF read_implementation}
