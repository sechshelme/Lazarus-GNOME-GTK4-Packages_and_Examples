
{$IFDEF read_interface}

type
  TGdkDrop = record
  end;
  PGdkDrop = ^TGdkDrop;

function gdk_drop_get_type: TGType; cdecl; external libgtk4;
function gdk_drop_get_display(self: PGdkDrop): PGdkDisplay; cdecl; external libgtk4;
function gdk_drop_get_device(self: PGdkDrop): PGdkDevice; cdecl; external libgtk4;
function gdk_drop_get_surface(self: PGdkDrop): PGdkSurface; cdecl; external libgtk4;
function gdk_drop_get_formats(self: PGdkDrop): PGdkContentFormats; cdecl; external libgtk4;
function gdk_drop_get_actions(self: PGdkDrop): TGdkDragAction; cdecl; external libgtk4;
function gdk_drop_get_drag(self: PGdkDrop): PGdkDrag; cdecl; external libgtk4;
procedure gdk_drop_status(self: PGdkDrop; actions: TGdkDragAction; preferred: TGdkDragAction); cdecl; external libgtk4;
procedure gdk_drop_finish(self: PGdkDrop; action: TGdkDragAction); cdecl; external libgtk4;
procedure gdk_drop_read_async(self: PGdkDrop; mime_types: PPchar; io_priority: longint; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  user_data: Tgpointer); cdecl; external libgtk4;
function gdk_drop_read_finish(self: PGdkDrop; Result: PGAsyncResult; out_mime_type: PPchar; error: PPGError): PGInputStream; cdecl; external libgtk4;
procedure gdk_drop_read_value_async(self: PGdkDrop; _type: TGType; io_priority: longint; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  user_data: Tgpointer); cdecl; external libgtk4;
function gdk_drop_read_value_finish(self: PGdkDrop; Result: PGAsyncResult; error: PPGError): PGValue; cdecl; external libgtk4;

// === Konventiert am: 31-7-24 19:30:26 ===

function GDK_TYPE_DROP: TGType;
function GDK_DROP(obj: Pointer): PGdkDrop;
function GDK_IS_DROP(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GDK_TYPE_DROP: TGType;
begin
  GDK_TYPE_DROP := gdk_drop_get_type;
end;

function GDK_DROP(obj: Pointer): PGdkDrop;
begin
  Result := PGdkDrop(g_type_check_instance_cast(obj, GDK_TYPE_DROP));
end;

function GDK_IS_DROP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GDK_TYPE_DROP);
end;



{$ENDIF read_implementation}
