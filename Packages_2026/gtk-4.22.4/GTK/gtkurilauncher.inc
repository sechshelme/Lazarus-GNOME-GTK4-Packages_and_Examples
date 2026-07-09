

  {$IFDEF read_struct}
type
  PGtkUriLauncher = type Pointer;

  TGtkUriLauncherClass = record
    parent_class: TGObjectClass;
  end;
  PGtkUriLauncherClass = ^TGtkUriLauncherClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_uri_launcher_get_type: TGType; cdecl; external libgtk4;
function gtk_uri_launcher_new(uri: pchar): PGtkUriLauncher; cdecl; external libgtk4;
function gtk_uri_launcher_get_uri(self: PGtkUriLauncher): pchar; cdecl; external libgtk4;
procedure gtk_uri_launcher_set_uri(self: PGtkUriLauncher; uri: pchar); cdecl; external libgtk4;
procedure gtk_uri_launcher_launch(self: PGtkUriLauncher; parent: PGtkWindow; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgtk4;
function gtk_uri_launcher_launch_finish(self: PGtkUriLauncher; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libgtk4;
function gtk_uri_launcher_can_launch(self: PGtkUriLauncher; parent: PGtkWindow): Tgboolean; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 16:59:55 ===

function GTK_TYPE_URI_LAUNCHER: TGType;
function GTK_URI_LAUNCHER(obj: Pointer): PGtkUriLauncher;
function GTK_IS_URI_LAUNCHER(obj: Pointer): Tgboolean;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GTK_TYPE_URI_LAUNCHER: TGType;
begin
  Result := gtk_uri_launcher_get_type;
end;

function GTK_URI_LAUNCHER(obj: Pointer): PGtkUriLauncher;
begin
  Result := PGtkUriLauncher(g_type_check_instance_cast(obj, GTK_TYPE_URI_LAUNCHER));
end;

function GTK_IS_URI_LAUNCHER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_URI_LAUNCHER);
end;

{$ENDIF read_implementation}
