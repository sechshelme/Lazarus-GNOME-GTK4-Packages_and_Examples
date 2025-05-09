
{$IFDEF read_interface}

type
  TGtkAppChooserDialog = record
  end;
  PGtkAppChooserDialog = ^TGtkAppChooserDialog;

function gtk_app_chooser_dialog_get_type: TGType; cdecl; external libgtk4;
function gtk_app_chooser_dialog_new(parent: PGtkWindow; flags: TGtkDialogFlags; file_: PGFile): PGtkWidget; cdecl; external libgtk4;
function gtk_app_chooser_dialog_new_for_content_type(parent: PGtkWindow; flags: TGtkDialogFlags; content_type: PChar): PGtkWidget; cdecl; external libgtk4;
function gtk_app_chooser_dialog_get_widget(self: PGtkAppChooserDialog): PGtkWidget; cdecl; external libgtk4;
procedure gtk_app_chooser_dialog_set_heading(self: PGtkAppChooserDialog; heading: PChar); cdecl; external libgtk4;
function gtk_app_chooser_dialog_get_heading(self: PGtkAppChooserDialog): PChar; cdecl; external libgtk4;

// === Konventiert am: 29-7-24 14:55:48 ===

function GTK_TYPE_APP_CHOOSER_DIALOG: TGType;
function GTK_APP_CHOOSER_DIALOG(obj: Pointer): PGtkAppChooserDialog;
function GTK_IS_APP_CHOOSER_DIALOG(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_TYPE_APP_CHOOSER_DIALOG: TGType;
begin
  GTK_TYPE_APP_CHOOSER_DIALOG := gtk_app_chooser_dialog_get_type;
end;

function GTK_APP_CHOOSER_DIALOG(obj: Pointer): PGtkAppChooserDialog;
begin
  Result := PGtkAppChooserDialog(g_type_check_instance_cast(obj, GTK_TYPE_APP_CHOOSER_DIALOG));
end;

function GTK_IS_APP_CHOOSER_DIALOG(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_APP_CHOOSER_DIALOG);
end;



{$ENDIF read_implementation}
