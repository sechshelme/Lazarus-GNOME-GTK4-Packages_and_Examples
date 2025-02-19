
{$IFDEF read_interface}

type
  TGtkFontChooserWidget = record
  end;
  PGtkFontChooserWidget = ^TGtkFontChooserWidget;

function gtk_font_chooser_widget_get_type: TGType; cdecl; external libgtk4;
function gtk_font_chooser_widget_new: PGtkWidget; cdecl; external libgtk4;

// === Konventiert am: 29-7-24 19:53:18 ===

function GTK_TYPE_FONT_CHOOSER_WIDGET: TGType;
function GTK_FONT_CHOOSER_WIDGET(obj: Pointer): PGtkFontChooserWidget;
function GTK_IS_FONT_CHOOSER_WIDGET(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_TYPE_FONT_CHOOSER_WIDGET: TGType;
begin
  GTK_TYPE_FONT_CHOOSER_WIDGET := gtk_font_chooser_widget_get_type;
end;

function GTK_FONT_CHOOSER_WIDGET(obj: Pointer): PGtkFontChooserWidget;
begin
  Result := PGtkFontChooserWidget(g_type_check_instance_cast(obj, GTK_TYPE_FONT_CHOOSER_WIDGET));
end;

function GTK_IS_FONT_CHOOSER_WIDGET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_FONT_CHOOSER_WIDGET);
end;



{$ENDIF read_implementation}
