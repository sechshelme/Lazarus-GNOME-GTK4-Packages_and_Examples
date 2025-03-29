unit gtksourcestyleschemechooserwidget;

interface

uses
  fp_glib2, fp_GTK4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {G_DECLARE_DERIVABLE_TYPE (GtkSourceStyleSchemeChooserWidget, gtk_source_style_scheme_chooser_widget, GTK_SOURCE, STYLE_SCHEME_CHOOSER_WIDGET, GtkWidget) }

type
  TGtkSourceStyleSchemeChooserWidget = record
    parent_instance: TGtkWidget;
  end;
  PGtkSourceStyleSchemeChooserWidget = ^TGtkSourceStyleSchemeChooserWidget;

  TGtkSourceStyleSchemeChooserWidgetClass = record
    parent: TGtkWidgetClass;
    _reserved: array[0..9] of Tgpointer;
  end;
  PGtkSourceStyleSchemeChooserWidgetClass = ^TGtkSourceStyleSchemeChooserWidgetClass;

function gtk_source_style_scheme_chooser_widget_get_type: TGType; cdecl; external libgtksourceview5;
function gtk_source_style_scheme_chooser_widget_new: PGtkWidget; cdecl; external libgtksourceview5;

// === Konventiert am: 29-3-25 17:37:46 ===

function GTK_SOURCE_TYPE_STYLE_SCHEME_CHOOSER_WIDGET: TGType;
function GTK_SOURCE_STYLE_SCHEME_CHOOSER_WIDGET(obj: Pointer): PGtkSourceStyleSchemeChooserWidget;
function GTK_SOURCE_IS_STYLE_SCHEME_CHOOSER_WIDGET(obj: Pointer): Tgboolean;
function GTK_SOURCE_STYLE_SCHEME_CHOOSER_WIDGET_CLASS(klass: Pointer): PGtkSourceStyleSchemeChooserWidgetClass;
function GTK_SOURCE_IS_STYLE_SCHEME_CHOOSER_WIDGET_CLASS(klass: Pointer): Tgboolean;
function GTK_SOURCE_STYLE_SCHEME_CHOOSER_WIDGET_GET_CLASS(obj: Pointer): PGtkSourceStyleSchemeChooserWidgetClass;

implementation

function GTK_SOURCE_TYPE_STYLE_SCHEME_CHOOSER_WIDGET: TGType;
begin
  Result := gtk_source_style_scheme_chooser_widget_get_type;
end;

function GTK_SOURCE_STYLE_SCHEME_CHOOSER_WIDGET(obj: Pointer): PGtkSourceStyleSchemeChooserWidget;
begin
  Result := PGtkSourceStyleSchemeChooserWidget(g_type_check_instance_cast(obj, GTK_SOURCE_TYPE_STYLE_SCHEME_CHOOSER_WIDGET));
end;

function GTK_SOURCE_IS_STYLE_SCHEME_CHOOSER_WIDGET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_SOURCE_TYPE_STYLE_SCHEME_CHOOSER_WIDGET);
end;

function GTK_SOURCE_STYLE_SCHEME_CHOOSER_WIDGET_CLASS(klass: Pointer): PGtkSourceStyleSchemeChooserWidgetClass;
begin
  Result := PGtkSourceStyleSchemeChooserWidgetClass(g_type_check_class_cast(klass, GTK_SOURCE_TYPE_STYLE_SCHEME_CHOOSER_WIDGET));
end;

function GTK_SOURCE_IS_STYLE_SCHEME_CHOOSER_WIDGET_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_SOURCE_TYPE_STYLE_SCHEME_CHOOSER_WIDGET);
end;

function GTK_SOURCE_STYLE_SCHEME_CHOOSER_WIDGET_GET_CLASS(obj: Pointer): PGtkSourceStyleSchemeChooserWidgetClass;
begin
  Result := PGtkSourceStyleSchemeChooserWidgetClass(PGTypeInstance(obj)^.g_class);
end;


end.
