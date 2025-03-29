{$IFDEF read_interface}


  {G_DECLARE_DERIVABLE_TYPE (GtkSourceGutterRendererText, gtk_source_gutter_renderer_text, GTK_SOURCE, GUTTER_RENDERER_TEXT, GtkSourceGutterRenderer) }

type
  TGtkSourceGutterRendererText = record
    parent_instance: TGtkSourceGutterRenderer;
  end;
  PGtkSourceGutterRendererText = ^TGtkSourceGutterRendererText;

  TGtkSourceGutterRendererTextClass = record
    parent_class: TGtkSourceGutterRendererClass;
    _reserved: array[0..9] of Tgpointer;
  end;
  PGtkSourceGutterRendererTextClass = ^TGtkSourceGutterRendererTextClass;

function gtk_source_gutter_renderer_text_get_type: TGType; cdecl; external libgtksourceview5;
function gtk_source_gutter_renderer_text_new: PGtkSourceGutterRenderer; cdecl; external libgtksourceview5;
procedure gtk_source_gutter_renderer_text_set_markup(renderer: PGtkSourceGutterRendererText; markup: Pgchar; length: Tgint); cdecl; external libgtksourceview5;
procedure gtk_source_gutter_renderer_text_set_text(renderer: PGtkSourceGutterRendererText; Text: Pgchar; length: Tgint); cdecl; external libgtksourceview5;
procedure gtk_source_gutter_renderer_text_measure(renderer: PGtkSourceGutterRendererText; Text: Pgchar; Width: Pgint; Height: Pgint); cdecl; external libgtksourceview5;
procedure gtk_source_gutter_renderer_text_measure_markup(renderer: PGtkSourceGutterRendererText; markup: Pgchar; Width: Pgint; Height: Pgint); cdecl; external libgtksourceview5;

// === Konventiert am: 29-3-25 17:13:52 ===

function GTK_SOURCE_TYPE_GUTTER_RENDERER_TEXT: TGType;
function GTK_SOURCE_GUTTER_RENDERER_TEXT(obj: Pointer): PGtkSourceGutterRendererText;
function GTK_SOURCE_IS_GUTTER_RENDERER_TEXT(obj: Pointer): Tgboolean;
function GTK_SOURCE_GUTTER_RENDERER_TEXT_CLASS(klass: Pointer): PGtkSourceGutterRendererTextClass;
function GTK_SOURCE_IS_GUTTER_RENDERER_TEXT_CLASS(klass: Pointer): Tgboolean;
function GTK_SOURCE_GUTTER_RENDERER_TEXT_GET_CLASS(obj: Pointer): PGtkSourceGutterRendererTextClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_SOURCE_TYPE_GUTTER_RENDERER_TEXT: TGType;
begin
  Result := gtk_source_gutter_renderer_text_get_type;
end;

function GTK_SOURCE_GUTTER_RENDERER_TEXT(obj: Pointer): PGtkSourceGutterRendererText;
begin
  Result := PGtkSourceGutterRendererText(g_type_check_instance_cast(obj, GTK_SOURCE_TYPE_GUTTER_RENDERER_TEXT));
end;

function GTK_SOURCE_IS_GUTTER_RENDERER_TEXT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_SOURCE_TYPE_GUTTER_RENDERER_TEXT);
end;

function GTK_SOURCE_GUTTER_RENDERER_TEXT_CLASS(klass: Pointer): PGtkSourceGutterRendererTextClass;
begin
  Result := PGtkSourceGutterRendererTextClass(g_type_check_class_cast(klass, GTK_SOURCE_TYPE_GUTTER_RENDERER_TEXT));
end;

function GTK_SOURCE_IS_GUTTER_RENDERER_TEXT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_SOURCE_TYPE_GUTTER_RENDERER_TEXT);
end;

function GTK_SOURCE_GUTTER_RENDERER_TEXT_GET_CLASS(obj: Pointer): PGtkSourceGutterRendererTextClass;
begin
  Result := PGtkSourceGutterRendererTextClass(PGTypeInstance(obj)^.g_class);
end;


{$ENDIF read_implementation}
