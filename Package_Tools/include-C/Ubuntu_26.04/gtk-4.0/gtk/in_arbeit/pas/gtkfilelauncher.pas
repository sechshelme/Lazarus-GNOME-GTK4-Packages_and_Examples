unit gtkfilelauncher;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtkwindow;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkFileLauncher = type Pointer;

  TGtkFileLauncherClass = record
    parent_class: TGObjectClass;
  end;
  PGtkFileLauncherClass = ^TGtkFileLauncherClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_file_launcher_get_type: TGType; cdecl; external libgtk4;
function gtk_file_launcher_new(file_: PGFile): PGtkFileLauncher; cdecl; external libgtk4;
function gtk_file_launcher_get_file(self: PGtkFileLauncher): PGFile; cdecl; external libgtk4;
procedure gtk_file_launcher_set_file(self: PGtkFileLauncher; file_: PGFile); cdecl; external libgtk4;
function gtk_file_launcher_get_always_ask(self: PGtkFileLauncher): Tgboolean; cdecl; external libgtk4;
procedure gtk_file_launcher_set_always_ask(self: PGtkFileLauncher; always_ask: Tgboolean); cdecl; external libgtk4;
function gtk_file_launcher_get_writable(self: PGtkFileLauncher): Tgboolean; cdecl; external libgtk4;
procedure gtk_file_launcher_set_writable(self: PGtkFileLauncher; writable: Tgboolean); cdecl; external libgtk4;
procedure gtk_file_launcher_launch(self: PGtkFileLauncher; parent: PGtkWindow; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgtk4;
function gtk_file_launcher_launch_finish(self: PGtkFileLauncher; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libgtk4;
procedure gtk_file_launcher_open_containing_folder(self: PGtkFileLauncher; parent: PGtkWindow; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgtk4;
function gtk_file_launcher_open_containing_folder_finish(self: PGtkFileLauncher; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 16:29:27 ===

function GTK_TYPE_FILE_LAUNCHER: TGType;
function GTK_FILE_LAUNCHER(obj: Pointer): PGtkFileLauncher;
function GTK_IS_FILE_LAUNCHER(obj: Pointer): Tgboolean;
{$ENDIF read_function}

implementation

function GTK_TYPE_FILE_LAUNCHER: TGType;
begin
  Result := gtk_file_launcher_get_type;
end;

function GTK_FILE_LAUNCHER(obj: Pointer): PGtkFileLauncher;
begin
  Result := PGtkFileLauncher(g_type_check_instance_cast(obj, GTK_TYPE_FILE_LAUNCHER));
end;

function GTK_IS_FILE_LAUNCHER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_FILE_LAUNCHER);
end;

end.
