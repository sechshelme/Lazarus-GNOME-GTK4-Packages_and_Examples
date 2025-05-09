
{$IFDEF read_interface}

type
  PGdkWaylandToplevel = ^TGdkWaylandToplevel;
  TGdkWaylandToplevel = TGdkToplevel;

function gdk_wayland_toplevel_get_type: TGType; cdecl; external libgtk4;

type
  TGdkWaylandToplevelExported= procedure(toplevel: PGdkToplevel; handle: PChar; user_data: Tgpointer); cdecl;

function gdk_wayland_toplevel_export_handle(toplevel: PGdkToplevel; callback: TGdkWaylandToplevelExported; user_data: Tgpointer; destroy_func: TGDestroyNotify): Tgboolean; cdecl; external libgtk4;
procedure gdk_wayland_toplevel_unexport_handle(toplevel: PGdkToplevel); cdecl; external libgtk4; deprecated 'GDK_DEPRECATED_IN_4_12_FOR(gdk_wayland_toplevel_drop_exported_handle)';
procedure gdk_wayland_toplevel_drop_exported_handle(toplevel: PGdkToplevel; handle: PChar); cdecl; external libgtk4;
function gdk_wayland_toplevel_set_transient_for_exported(toplevel: PGdkToplevel; parent_handle_str: PChar): Tgboolean; cdecl; external libgtk4;
procedure gdk_wayland_toplevel_set_application_id(toplevel: PGdkToplevel; application_id: PChar); cdecl; external libgtk4;

// === Konventiert am: 3-8-24 19:19:52 ===

function GDK_TYPE_WAYLAND_TOPLEVEL: TGType;
function GDK_WAYLAND_TOPLEVEL(obj: Pointer): PGdkWaylandToplevel;
function GDK_IS_WAYLAND_TOPLEVEL(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GDK_TYPE_WAYLAND_TOPLEVEL: TGType;
begin
  GDK_TYPE_WAYLAND_TOPLEVEL := gdk_wayland_toplevel_get_type;
end;

function GDK_WAYLAND_TOPLEVEL(obj: Pointer): PGdkWaylandToplevel;
begin
  Result := PGdkWaylandToplevel(g_type_check_instance_cast(obj, GDK_TYPE_WAYLAND_TOPLEVEL));
end;

function GDK_IS_WAYLAND_TOPLEVEL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GDK_TYPE_WAYLAND_TOPLEVEL);
end;



{$ENDIF read_implementation}
