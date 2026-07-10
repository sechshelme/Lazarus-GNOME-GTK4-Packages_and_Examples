unit gtkcolorchooserwidget;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkColorChooserWidget = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_color_chooser_widget_get_type: TGType; cdecl; external libgtk4; deprecated;
function gtk_color_chooser_widget_new: PGtkWidget; cdecl; external libgtk4; deprecated;

// === Konventiert am: 9-7-26 19:42:36 ===

function GTK_TYPE_COLOR_CHOOSER_WIDGET: TGType;
function GTK_COLOR_CHOOSER_WIDGET(obj: Pointer): PGtkColorChooserWidget;
function GTK_IS_COLOR_CHOOSER_WIDGET(obj: Pointer): Tgboolean;
{$ENDIF read_function}

implementation

function GTK_TYPE_COLOR_CHOOSER_WIDGET: TGType;
begin
  GTK_TYPE_COLOR_CHOOSER_WIDGET := gtk_color_chooser_widget_get_type;
end;

function GTK_COLOR_CHOOSER_WIDGET(obj: Pointer): PGtkColorChooserWidget;
begin
  Result := PGtkColorChooserWidget(g_type_check_instance_cast(obj, GTK_TYPE_COLOR_CHOOSER_WIDGET));
end;

function GTK_IS_COLOR_CHOOSER_WIDGET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_COLOR_CHOOSER_WIDGET);
end;



end.
