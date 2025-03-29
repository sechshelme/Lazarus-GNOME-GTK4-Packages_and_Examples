{$IFDEF read_interface}

type
  PGtkSourceGutterRendererAlignmentMode = ^TGtkSourceGutterRendererAlignmentMode;
  TGtkSourceGutterRendererAlignmentMode = longint;

const
  GTK_SOURCE_GUTTER_RENDERER_ALIGNMENT_MODE_CELL = 0;
  GTK_SOURCE_GUTTER_RENDERER_ALIGNMENT_MODE_FIRST = 1;
  GTK_SOURCE_GUTTER_RENDERER_ALIGNMENT_MODE_LAST = 2;
  {G_DECLARE_DERIVABLE_TYPE (GtkSourceGutterRenderer, gtk_source_gutter_renderer, GTK_SOURCE, GUTTER_RENDERER, GtkWidget) }
type
  TGtkSourceGutterRenderer = record
    parent_instance: TGtkWidget;
  end;
  PGtkSourceGutterRenderer = ^TGtkSourceGutterRenderer;

  TGtkSourceGutterRendererClass = record
    parent_class: TGtkWidgetClass;
    query_data: procedure(renderer: PGtkSourceGutterRenderer; Lines: PGtkSourceGutterLines; line: Tguint); cdecl;
    begin_: procedure(renderer: PGtkSourceGutterRenderer; Lines: PGtkSourceGutterLines); cdecl;
    snapshot_line: procedure(renderer: PGtkSourceGutterRenderer; snapshot: PGtkSnapshot; Lines: PGtkSourceGutterLines; line: Tguint); cdecl;
    end_: procedure(renderer: PGtkSourceGutterRenderer); cdecl;
    change_view: procedure(renderer: PGtkSourceGutterRenderer; old_view: PGtkSourceView); cdecl;
    change_buffer: procedure(renderer: PGtkSourceGutterRenderer; old_buffer: PGtkSourceBuffer); cdecl;
    query_activatable: function(renderer: PGtkSourceGutterRenderer; iter: PGtkTextIter; area: PGdkRectangle): Tgboolean; cdecl;
    activate: procedure(renderer: PGtkSourceGutterRenderer; iter: PGtkTextIter; area: PGdkRectangle; button: Tguint; state: TGdkModifierType;
      n_presses: Tgint); cdecl;
    _reserved: array[0..19] of Tgpointer;
  end;
  PGtkSourceGutterRendererClass = ^TGtkSourceGutterRendererClass;

function gtk_source_gutter_renderer_get_type: TGType; cdecl; external libgtksourceview5;
function gtk_source_gutter_renderer_get_xalign(renderer: PGtkSourceGutterRenderer): Tgfloat; cdecl; external libgtksourceview5;
procedure gtk_source_gutter_renderer_set_xalign(renderer: PGtkSourceGutterRenderer; xalign: Tgfloat); cdecl; external libgtksourceview5;
function gtk_source_gutter_renderer_get_yalign(renderer: PGtkSourceGutterRenderer): Tgfloat; cdecl; external libgtksourceview5;
procedure gtk_source_gutter_renderer_set_yalign(renderer: PGtkSourceGutterRenderer; yalign: Tgfloat); cdecl; external libgtksourceview5;
function gtk_source_gutter_renderer_get_xpad(renderer: PGtkSourceGutterRenderer): Tgint; cdecl; external libgtksourceview5;
procedure gtk_source_gutter_renderer_set_xpad(renderer: PGtkSourceGutterRenderer; xpad: Tgint); cdecl; external libgtksourceview5;
function gtk_source_gutter_renderer_get_ypad(renderer: PGtkSourceGutterRenderer): Tgint; cdecl; external libgtksourceview5;
procedure gtk_source_gutter_renderer_set_ypad(renderer: PGtkSourceGutterRenderer; ypad: Tgint); cdecl; external libgtksourceview5;
function gtk_source_gutter_renderer_get_alignment_mode(renderer: PGtkSourceGutterRenderer): TGtkSourceGutterRendererAlignmentMode; cdecl; external libgtksourceview5;
procedure gtk_source_gutter_renderer_set_alignment_mode(renderer: PGtkSourceGutterRenderer; mode: TGtkSourceGutterRendererAlignmentMode); cdecl; external libgtksourceview5;
function gtk_source_gutter_renderer_get_buffer(renderer: PGtkSourceGutterRenderer): PGtkSourceBuffer; cdecl; external libgtksourceview5;
function gtk_source_gutter_renderer_get_view(renderer: PGtkSourceGutterRenderer): PGtkSourceView; cdecl; external libgtksourceview5;
procedure gtk_source_gutter_renderer_activate(renderer: PGtkSourceGutterRenderer; iter: PGtkTextIter; area: PGdkRectangle; button: Tguint; state: TGdkModifierType;
  n_presses: Tgint); cdecl; external libgtksourceview5;
function gtk_source_gutter_renderer_query_activatable(renderer: PGtkSourceGutterRenderer; iter: PGtkTextIter; area: PGdkRectangle): Tgboolean; cdecl; external libgtksourceview5;
procedure gtk_source_gutter_renderer_align_cell(renderer: PGtkSourceGutterRenderer; line: Tguint; Width: Tgfloat; Height: Tgfloat; x: Pgfloat;
  y: Pgfloat); cdecl; external libgtksourceview5;

// === Konventiert am: 29-3-25 15:55:14 ===

function GTK_SOURCE_TYPE_GUTTER_RENDERER: TGType;
function GTK_SOURCE_GUTTER_RENDERER(obj: Pointer): PGtkSourceGutterRenderer;
function GTK_SOURCE_IS_GUTTER_RENDERER(obj: Pointer): Tgboolean;
function GTK_SOURCE_GUTTER_RENDERER_CLASS(klass: Pointer): PGtkSourceGutterRendererClass;
function GTK_SOURCE_IS_GUTTER_RENDERER_CLASS(klass: Pointer): Tgboolean;
function GTK_SOURCE_GUTTER_RENDERER_GET_CLASS(obj: Pointer): PGtkSourceGutterRendererClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_SOURCE_TYPE_GUTTER_RENDERER: TGType;
begin
  Result := gtk_source_gutter_renderer_get_type;
end;

function GTK_SOURCE_GUTTER_RENDERER(obj: Pointer): PGtkSourceGutterRenderer;
begin
  Result := PGtkSourceGutterRenderer(g_type_check_instance_cast(obj, GTK_SOURCE_TYPE_GUTTER_RENDERER));
end;

function GTK_SOURCE_IS_GUTTER_RENDERER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_SOURCE_TYPE_GUTTER_RENDERER);
end;

function GTK_SOURCE_GUTTER_RENDERER_CLASS(klass: Pointer): PGtkSourceGutterRendererClass;
begin
  Result := PGtkSourceGutterRendererClass(g_type_check_class_cast(klass, GTK_SOURCE_TYPE_GUTTER_RENDERER));
end;

function GTK_SOURCE_IS_GUTTER_RENDERER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_SOURCE_TYPE_GUTTER_RENDERER);
end;

function GTK_SOURCE_GUTTER_RENDERER_GET_CLASS(obj: Pointer): PGtkSourceGutterRendererClass;
begin
  Result := PGtkSourceGutterRendererClass(PGTypeInstance(obj)^.g_class);
end;


{$ENDIF read_implementation}
