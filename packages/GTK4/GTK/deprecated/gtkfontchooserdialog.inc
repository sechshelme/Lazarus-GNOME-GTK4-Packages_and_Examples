
{$IFDEF read_interface}

type
  TGtkFontChooserDialog = record
  end;
  PGtkFontChooserDialog = ^TGtkFontChooserDialog;

function gtk_font_chooser_dialog_get_type: TGType; cdecl; external libgtk4;
function gtk_font_chooser_dialog_new(title: PChar; parent: PGtkWindow): PGtkWidget; cdecl; external libgtk4;

// === Konventiert am: 29-7-24 19:53:13 ===

function GTK_TYPE_FONT_CHOOSER_DIALOG: TGType;
function GTK_FONT_CHOOSER_DIALOG(obj: Pointer): PGtkFontChooserDialog;
function GTK_IS_FONT_CHOOSER_DIALOG(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_TYPE_FONT_CHOOSER_DIALOG: TGType;
begin
  GTK_TYPE_FONT_CHOOSER_DIALOG := gtk_font_chooser_dialog_get_type;
end;

function GTK_FONT_CHOOSER_DIALOG(obj: Pointer): PGtkFontChooserDialog;
begin
  Result := PGtkFontChooserDialog(g_type_check_instance_cast(obj, GTK_TYPE_FONT_CHOOSER_DIALOG));
end;

function GTK_IS_FONT_CHOOSER_DIALOG(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_FONT_CHOOSER_DIALOG);
end;



{$ENDIF read_implementation}
