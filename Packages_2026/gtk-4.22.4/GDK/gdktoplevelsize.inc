{$IFDEF read_interface}

type
  PGdkToplevelSize = type Pointer;

function gdk_toplevel_size_get_type: TGType; cdecl; external libgtk4;
procedure gdk_toplevel_size_get_bounds(size: PGdkToplevelSize; bounds_width: Plongint; bounds_height: Plongint); cdecl; external libgtk4;
procedure gdk_toplevel_size_set_size(size: PGdkToplevelSize; width: longint; height: longint); cdecl; external libgtk4;
procedure gdk_toplevel_size_set_min_size(size: PGdkToplevelSize; min_width: longint; min_height: longint); cdecl; external libgtk4;
procedure gdk_toplevel_size_set_shadow_width(size: PGdkToplevelSize; left: longint; right: longint; top: longint; bottom: longint); cdecl; external libgtk4;

// === Konventiert am: 2-7-26 19:29:24 ===

function GDK_TYPE_TOPLEVEL_SIZE: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GDK_TYPE_TOPLEVEL_SIZE: TGType;
begin
  GDK_TYPE_TOPLEVEL_SIZE := gdk_toplevel_size_get_type;
end;



{$ENDIF read_implementation}
