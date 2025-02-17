
{$IFDEF read_interface}

type
  PGdkWaylandDisplay = ^TGdkWaylandDisplay;
  TGdkWaylandDisplay = TGdkDisplay;

  TGdkWaylandDisplayClass = record
  end;
  PGdkWaylandDisplayClass = ^TGdkWaylandDisplayClass;

function gdk_wayland_display_get_type: TGType; cdecl; external libgtk4;
function gdk_wayland_display_get_wl_display(display: PGdkDisplay): Pwl_display; cdecl; external libgtk4;
function gdk_wayland_display_get_wl_compositor(display: PGdkDisplay): Pwl_compositor; cdecl; external libgtk4;
procedure gdk_wayland_display_set_cursor_theme(display: PGdkDisplay; Name: PChar; size: longint); cdecl; external libgtk4;
function gdk_wayland_display_get_startup_notification_id(display: PGdkDisplay): PChar; cdecl; external libgtk4; deprecated 'GDK_DEPRECATED_IN_4_10';
procedure gdk_wayland_display_set_startup_notification_id(display: PGdkDisplay; startup_id: PChar); cdecl; external libgtk4; deprecated 'GDK_DEPRECATED_IN_4_10_FOR(gdk_toplevel_set_startup_id)';
function gdk_wayland_display_query_registry(display: PGdkDisplay; global: PChar): Tgboolean; cdecl; external libgtk4;
function gdk_wayland_display_get_egl_display(display: PGdkDisplay): Tgpointer; cdecl; external libgtk4;

// === Konventiert am: 3-8-24 19:19:18 ===

function GDK_TYPE_WAYLAND_DISPLAY: TGType;
function GDK_WAYLAND_DISPLAY(obj: Pointer): PGdkWaylandDisplay;
function GDK_WAYLAND_DISPLAY_CLASS(klass: Pointer): PGdkWaylandDisplayClass;
function GDK_IS_WAYLAND_DISPLAY(obj: Pointer): Tgboolean;
function GDK_IS_WAYLAND_DISPLAY_CLASS(klass: Pointer): Tgboolean;
function GDK_WAYLAND_DISPLAY_GET_CLASS(obj: Pointer): PGdkWaylandDisplayClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GDK_TYPE_WAYLAND_DISPLAY: TGType;
begin
  GDK_TYPE_WAYLAND_DISPLAY := gdk_wayland_display_get_type;
end;

function GDK_WAYLAND_DISPLAY(obj: Pointer): PGdkWaylandDisplay;
begin
  Result := PGdkWaylandDisplay(g_type_check_instance_cast(obj, GDK_TYPE_WAYLAND_DISPLAY));
end;

function GDK_WAYLAND_DISPLAY_CLASS(klass: Pointer): PGdkWaylandDisplayClass;
begin
  Result := PGdkWaylandDisplayClass(g_type_check_class_cast(klass, GDK_TYPE_WAYLAND_DISPLAY));
end;

function GDK_IS_WAYLAND_DISPLAY(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GDK_TYPE_WAYLAND_DISPLAY);
end;

function GDK_IS_WAYLAND_DISPLAY_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GDK_TYPE_WAYLAND_DISPLAY);
end;

function GDK_WAYLAND_DISPLAY_GET_CLASS(obj: Pointer): PGdkWaylandDisplayClass;
begin
  Result := PGdkWaylandDisplayClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
