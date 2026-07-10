

  {$IFDEF read_struct}
type
  PGtkFileChooserDialog = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_file_chooser_dialog_get_type: TGType; cdecl; external libgtk4; deprecated;
function gtk_file_chooser_dialog_new(title: pchar; parent: PGtkWindow; action: TGtkFileChooserAction; first_button_text: pchar): PGtkWidget; cdecl; varargs; external libgtk4; deprecated;

// === Konventiert am: 9-7-26 19:42:02 ===

function GTK_TYPE_FILE_CHOOSER_DIALOG: TGType;
function GTK_FILE_CHOOSER_DIALOG(obj: Pointer): PGtkFileChooserDialog;
function GTK_IS_FILE_CHOOSER_DIALOG(obj: Pointer): Tgboolean;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GTK_TYPE_FILE_CHOOSER_DIALOG: TGType;
begin
  GTK_TYPE_FILE_CHOOSER_DIALOG := gtk_file_chooser_dialog_get_type;
end;

function GTK_FILE_CHOOSER_DIALOG(obj: Pointer): PGtkFileChooserDialog;
begin
  Result := PGtkFileChooserDialog(g_type_check_instance_cast(obj, GTK_TYPE_FILE_CHOOSER_DIALOG));
end;

function GTK_IS_FILE_CHOOSER_DIALOG(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_FILE_CHOOSER_DIALOG);
end;

{$ENDIF read_implementation}
