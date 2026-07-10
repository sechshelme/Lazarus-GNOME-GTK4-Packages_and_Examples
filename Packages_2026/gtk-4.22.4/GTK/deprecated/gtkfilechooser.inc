

  {$IFDEF read_enum}
type
  PGtkFileChooserAction = ^TGtkFileChooserAction;
  TGtkFileChooserAction = longint;
const
  GTK_FILE_CHOOSER_ACTION_OPEN = 0;
  GTK_FILE_CHOOSER_ACTION_SAVE = 1;
  GTK_FILE_CHOOSER_ACTION_SELECT_FOLDER = 2;

type
  PGtkFileChooserError = ^TGtkFileChooserError;
  TGtkFileChooserError = longint;
const
  GTK_FILE_CHOOSER_ERROR_NONEXISTENT = 0;
  GTK_FILE_CHOOSER_ERROR_BAD_FILENAME = 1;
  GTK_FILE_CHOOSER_ERROR_ALREADY_EXISTS = 2;
  GTK_FILE_CHOOSER_ERROR_INCOMPLETE_HOSTNAME = 3;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGtkFileChooser = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_file_chooser_get_type: TGType; cdecl; external libgtk4; deprecated;
function gtk_file_chooser_error_quark: TGQuark; cdecl; external libgtk4; deprecated;
procedure gtk_file_chooser_set_action(chooser: PGtkFileChooser; action: TGtkFileChooserAction); cdecl; external libgtk4; deprecated;
function gtk_file_chooser_get_action(chooser: PGtkFileChooser): TGtkFileChooserAction; cdecl; external libgtk4; deprecated;
procedure gtk_file_chooser_set_select_multiple(chooser: PGtkFileChooser; select_multiple: Tgboolean); cdecl; external libgtk4; deprecated;
function gtk_file_chooser_get_select_multiple(chooser: PGtkFileChooser): Tgboolean; cdecl; external libgtk4; deprecated;
procedure gtk_file_chooser_set_create_folders(chooser: PGtkFileChooser; create_folders: Tgboolean); cdecl; external libgtk4; deprecated;
function gtk_file_chooser_get_create_folders(chooser: PGtkFileChooser): Tgboolean; cdecl; external libgtk4; deprecated;
procedure gtk_file_chooser_set_current_name(chooser: PGtkFileChooser; name: pchar); cdecl; external libgtk4; deprecated;
function gtk_file_chooser_get_current_name(chooser: PGtkFileChooser): pchar; cdecl; external libgtk4; deprecated;
function gtk_file_chooser_get_file(chooser: PGtkFileChooser): PGFile; cdecl; external libgtk4; deprecated;
function gtk_file_chooser_set_file(chooser: PGtkFileChooser; file_: PGFile; error: PPGError): Tgboolean; cdecl; external libgtk4; deprecated;
function gtk_file_chooser_get_files(chooser: PGtkFileChooser): PGListModel; cdecl; external libgtk4; deprecated;
function gtk_file_chooser_set_current_folder(chooser: PGtkFileChooser; file_: PGFile; error: PPGError): Tgboolean; cdecl; external libgtk4; deprecated;
function gtk_file_chooser_get_current_folder(chooser: PGtkFileChooser): PGFile; cdecl; external libgtk4; deprecated;
procedure gtk_file_chooser_add_filter(chooser: PGtkFileChooser; filter: PGtkFileFilter); cdecl; external libgtk4; deprecated;
procedure gtk_file_chooser_remove_filter(chooser: PGtkFileChooser; filter: PGtkFileFilter); cdecl; external libgtk4; deprecated;
function gtk_file_chooser_get_filters(chooser: PGtkFileChooser): PGListModel; cdecl; external libgtk4; deprecated;
procedure gtk_file_chooser_set_filter(chooser: PGtkFileChooser; filter: PGtkFileFilter); cdecl; external libgtk4; deprecated;
function gtk_file_chooser_get_filter(chooser: PGtkFileChooser): PGtkFileFilter; cdecl; external libgtk4; deprecated;
function gtk_file_chooser_add_shortcut_folder(chooser: PGtkFileChooser; folder: PGFile; error: PPGError): Tgboolean; cdecl; external libgtk4; deprecated;
function gtk_file_chooser_remove_shortcut_folder(chooser: PGtkFileChooser; folder: PGFile; error: PPGError): Tgboolean; cdecl; external libgtk4; deprecated;
function gtk_file_chooser_get_shortcut_folders(chooser: PGtkFileChooser): PGListModel; cdecl; external libgtk4; deprecated;
procedure gtk_file_chooser_add_choice(chooser: PGtkFileChooser; id: pchar; _label: pchar; options: PPchar; option_labels: PPchar); cdecl; external libgtk4; deprecated;
procedure gtk_file_chooser_remove_choice(chooser: PGtkFileChooser; id: pchar); cdecl; external libgtk4; deprecated;
procedure gtk_file_chooser_set_choice(chooser: PGtkFileChooser; id: pchar; option: pchar); cdecl; external libgtk4; deprecated;
function gtk_file_chooser_get_choice(chooser: PGtkFileChooser; id: pchar): pchar; cdecl; external libgtk4; deprecated;

function GTK_FILE_CHOOSER_ERROR: TGQuark;

// === Konventiert am: 9-7-26 19:42:08 ===

function GTK_TYPE_FILE_CHOOSER: TGType;
function GTK_FILE_CHOOSER(obj: Pointer): PGtkFileChooser;
function GTK_IS_FILE_CHOOSER(obj: Pointer): Tgboolean;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GTK_TYPE_FILE_CHOOSER: TGType;
begin
  GTK_TYPE_FILE_CHOOSER := gtk_file_chooser_get_type;
end;

function GTK_FILE_CHOOSER(obj: Pointer): PGtkFileChooser;
begin
  Result := PGtkFileChooser(g_type_check_instance_cast(obj, GTK_TYPE_FILE_CHOOSER));
end;

function GTK_IS_FILE_CHOOSER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_FILE_CHOOSER);
end;


function GTK_FILE_CHOOSER_ERROR: TGQuark;
begin
  GTK_FILE_CHOOSER_ERROR := gtk_file_chooser_error_quark;
end;


{$ENDIF read_implementation}
