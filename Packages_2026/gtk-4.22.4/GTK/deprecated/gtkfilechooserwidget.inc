

  {$IFDEF read_struct}
type
  PGtkFileChooserWidget = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_file_chooser_widget_get_type: TGType; cdecl; external libgtk4;
function gtk_file_chooser_widget_new(action: TGtkFileChooserAction): PGtkWidget; cdecl; external libgtk4;

// === Konventiert am: 9-7-26 19:45:36 ===

function GTK_TYPE_FILE_CHOOSER_WIDGET: TGType;
function GTK_FILE_CHOOSER_WIDGET(obj: Pointer): PGtkFileChooserWidget;
function GTK_IS_FILE_CHOOSER_WIDGET(obj: Pointer): Tgboolean;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GTK_TYPE_FILE_CHOOSER_WIDGET: TGType;
begin
  GTK_TYPE_FILE_CHOOSER_WIDGET := gtk_file_chooser_widget_get_type;
end;

function GTK_FILE_CHOOSER_WIDGET(obj: Pointer): PGtkFileChooserWidget;
begin
  Result := PGtkFileChooserWidget(g_type_check_instance_cast(obj, GTK_TYPE_FILE_CHOOSER_WIDGET));
end;

function GTK_IS_FILE_CHOOSER_WIDGET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_FILE_CHOOSER_WIDGET);
end;



{$ENDIF read_implementation}
