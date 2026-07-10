

  {$IFDEF read_struct}
type
  PGtkFontChooserDialog = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_font_chooser_dialog_get_type: TGType; cdecl; external libgtk4; deprecated;
function gtk_font_chooser_dialog_new(title: pchar; parent: PGtkWindow): PGtkWidget; cdecl; external libgtk4; deprecated;

// === Konventiert am: 9-7-26 19:45:22 ===

function GTK_TYPE_FONT_CHOOSER_DIALOG: TGType;
function GTK_FONT_CHOOSER_DIALOG(obj: Pointer): PGtkFontChooserDialog;
function GTK_IS_FONT_CHOOSER_DIALOG(obj: Pointer): Tgboolean;
{$ENDIF read_function}


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
