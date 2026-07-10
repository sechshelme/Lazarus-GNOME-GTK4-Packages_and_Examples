unit gtkappchooserwidget;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkAppChooserWidget = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_app_chooser_widget_get_type: TGType; cdecl; external libgtk4; deprecated;
function gtk_app_chooser_widget_new(content_type: pchar): PGtkWidget; cdecl; external libgtk4; deprecated;
procedure gtk_app_chooser_widget_set_show_default(self: PGtkAppChooserWidget; setting: Tgboolean); cdecl; external libgtk4; deprecated;
function gtk_app_chooser_widget_get_show_default(self: PGtkAppChooserWidget): Tgboolean; cdecl; external libgtk4; deprecated;
procedure gtk_app_chooser_widget_set_show_recommended(self: PGtkAppChooserWidget; setting: Tgboolean); cdecl; external libgtk4; deprecated;
function gtk_app_chooser_widget_get_show_recommended(self: PGtkAppChooserWidget): Tgboolean; cdecl; external libgtk4; deprecated;
procedure gtk_app_chooser_widget_set_show_fallback(self: PGtkAppChooserWidget; setting: Tgboolean); cdecl; external libgtk4; deprecated;
function gtk_app_chooser_widget_get_show_fallback(self: PGtkAppChooserWidget): Tgboolean; cdecl; external libgtk4; deprecated;
procedure gtk_app_chooser_widget_set_show_other(self: PGtkAppChooserWidget; setting: Tgboolean); cdecl; external libgtk4; deprecated;
function gtk_app_chooser_widget_get_show_other(self: PGtkAppChooserWidget): Tgboolean; cdecl; external libgtk4; deprecated;
procedure gtk_app_chooser_widget_set_show_all(self: PGtkAppChooserWidget; setting: Tgboolean); cdecl; external libgtk4; deprecated;
function gtk_app_chooser_widget_get_show_all(self: PGtkAppChooserWidget): Tgboolean; cdecl; external libgtk4; deprecated;
procedure gtk_app_chooser_widget_set_default_text(self: PGtkAppChooserWidget; text: pchar); cdecl; external libgtk4; deprecated;
function gtk_app_chooser_widget_get_default_text(self: PGtkAppChooserWidget): pchar; cdecl; external libgtk4; deprecated;

// === Konventiert am: 9-7-26 19:33:40 ===

function GTK_TYPE_APP_CHOOSER_WIDGET: TGType;
function GTK_APP_CHOOSER_WIDGET(obj: Pointer): PGtkAppChooserWidget;
function GTK_IS_APP_CHOOSER_WIDGET(obj: Pointer): Tgboolean;
{$ENDIF read_function}

implementation

function GTK_TYPE_APP_CHOOSER_WIDGET: TGType;
begin
  GTK_TYPE_APP_CHOOSER_WIDGET := gtk_app_chooser_widget_get_type;
end;

function GTK_APP_CHOOSER_WIDGET(obj: Pointer): PGtkAppChooserWidget;
begin
  Result := PGtkAppChooserWidget(g_type_check_instance_cast(obj, GTK_TYPE_APP_CHOOSER_WIDGET));
end;

function GTK_IS_APP_CHOOSER_WIDGET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_APP_CHOOSER_WIDGET);
end;



end.
