
{$IFDEF read_interface}

type
  TGtkFileChooserDialog = record
  end;
  PGtkFileChooserDialog = ^TGtkFileChooserDialog;

function gtk_file_chooser_dialog_get_type: TGType; cdecl; external libgtk4;
function gtk_file_chooser_dialog_new(title: PChar; parent: PGtkWindow; action: TGtkFileChooserAction; first_button_text: PChar): PGtkWidget; varargs cdecl; external libgtk4;

// === Konventiert am: 29-7-24 19:42:30 ===

function GTK_TYPE_FILE_CHOOSER_DIALOG: TGType;
function GTK_FILE_CHOOSER_DIALOG(obj: Pointer): PGtkFileChooserDialog;
function GTK_IS_FILE_CHOOSER_DIALOG(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


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
