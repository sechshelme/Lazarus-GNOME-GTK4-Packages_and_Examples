{$IFDEF read_interface}


function gdk_cursor_get_type: TGType; cdecl; external libgtk4;
function gdk_cursor_new_from_texture(texture: PGdkTexture; hotspot_x: longint; hotspot_y: longint; fallback: PGdkCursor): PGdkCursor; cdecl; external libgtk4;
function gdk_cursor_new_from_name(name: pchar; fallback: PGdkCursor): PGdkCursor; cdecl; external libgtk4;

type
  TGdkCursorGetTextureCallback = function(cursor: PGdkCursor; cursor_size: longint; scale: double; width: Plongint; height: Plongint; hotspot_x: Plongint; hotspot_y: Plongint; data: Tgpointer): PGdkTexture; cdecl;

function gdk_cursor_new_from_callback(callback: TGdkCursorGetTextureCallback; data: Tgpointer; destroy: TGDestroyNotify; fallback: PGdkCursor): PGdkCursor; cdecl; external libgtk4;
function gdk_cursor_get_fallback(cursor: PGdkCursor): PGdkCursor; cdecl; external libgtk4;
function gdk_cursor_get_name(cursor: PGdkCursor): pchar; cdecl; external libgtk4;
function gdk_cursor_get_texture(cursor: PGdkCursor): PGdkTexture; cdecl; external libgtk4;
function gdk_cursor_get_hotspot_x(cursor: PGdkCursor): longint; cdecl; external libgtk4;
function gdk_cursor_get_hotspot_y(cursor: PGdkCursor): longint; cdecl; external libgtk4;

// === Konventiert am: 2-7-26 19:12:11 ===

function GDK_TYPE_CURSOR: TGType;
function GDK_CURSOR(obj: Pointer): PGdkCursor;
function GDK_IS_CURSOR(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GDK_TYPE_CURSOR: TGType;
begin
  GDK_TYPE_CURSOR := gdk_cursor_get_type;
end;

function GDK_CURSOR(obj: Pointer): PGdkCursor;
begin
  Result := PGdkCursor(g_type_check_instance_cast(obj, GDK_TYPE_CURSOR));
end;

function GDK_IS_CURSOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GDK_TYPE_CURSOR);
end;



{$ENDIF read_implementation}
