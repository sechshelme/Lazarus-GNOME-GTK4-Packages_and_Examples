
{$IFDEF read_interface}

type
  TGdkDragSurfaceSize = record
  end;
  PGdkDragSurfaceSize = ^TGdkDragSurfaceSize;

function gdk_drag_surface_size_get_type: TGType; cdecl; external libgtk4;
procedure gdk_drag_surface_size_set_size(size: PGdkDragSurfaceSize; Width: longint; Height: longint); cdecl; external libgtk4;

// === Konventiert am: 2-8-24 17:10:39 ===

function GDK_TYPE_DRAG_SURFACE_SIZE: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GDK_TYPE_DRAG_SURFACE_SIZE: TGType;
begin
  GDK_TYPE_DRAG_SURFACE_SIZE := gdk_drag_surface_size_get_type;
end;



{$ENDIF read_implementation}
