unit gtksourceview;

interface

uses
  fp_glib2, fp_GDK4, fp_GTK4, gtksourcetypes, gtksourcesnippet, gtksourcebuffer,
  gtksourcemarkattributes, gtksourcecompletion, gtksourcehover, gtksourceindenter, gtksourcegutter, gtksourcespacedrawer;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PGtkSourceViewGutterPosition = ^TGtkSourceViewGutterPosition;
  TGtkSourceViewGutterPosition = longint;

const
  GTK_SOURCE_VIEW_GUTTER_POSITION_LINES = -(30);
  GTK_SOURCE_VIEW_GUTTER_POSITION_MARKS = -(20);

type
  PGtkSourceSmartHomeEndType = ^TGtkSourceSmartHomeEndType;
  TGtkSourceSmartHomeEndType = longint;

const
  GTK_SOURCE_SMART_HOME_END_DISABLED = 0;
  GTK_SOURCE_SMART_HOME_END_BEFORE = 1;
  GTK_SOURCE_SMART_HOME_END_AFTER = 2;
  GTK_SOURCE_SMART_HOME_END_ALWAYS = 3;

type
  PGtkSourceBackgroundPatternType = ^TGtkSourceBackgroundPatternType;
  TGtkSourceBackgroundPatternType = longint;

const
  GTK_SOURCE_BACKGROUND_PATTERN_TYPE_NONE = 0;
  GTK_SOURCE_BACKGROUND_PATTERN_TYPE_GRID = 1;

  {G_DECLARE_DERIVABLE_TYPE (GtkSourceView, gtk_source_view, GTK_SOURCE, VIEW, GtkTextView) }
type
  TGtkSourceViewClass = record
    parent_class: TGtkTextViewClass;
    line_mark_activated: procedure(view: PGtkSourceView; iter: PGtkTextIter; button: Tguint; state: TGdkModifierType; n_presses: Tgint); cdecl;
    show_completion: procedure(view: PGtkSourceView); cdecl;
    move_lines: procedure(view: PGtkSourceView; down: Tgboolean); cdecl;
    move_words: procedure(view: PGtkSourceView; step: Tgint); cdecl;
    push_snippet: procedure(view: PGtkSourceView; snippet: PGtkSourceSnippet; location: PGtkTextIter); cdecl;
    _reserved: array[0..19] of Tgpointer;
  end;
  PGtkSourceViewClass = ^TGtkSourceViewClass;

function gtk_source_view_get_type: TGType; cdecl; external libgtksourceview5;
function gtk_source_view_new: PGtkWidget; cdecl; external libgtksourceview5;
function gtk_source_view_new_with_buffer(buffer: PGtkSourceBuffer): PGtkWidget; cdecl; external libgtksourceview5;
procedure gtk_source_view_set_show_line_numbers(view: PGtkSourceView; Show: Tgboolean); cdecl; external libgtksourceview5;
function gtk_source_view_get_show_line_numbers(view: PGtkSourceView): Tgboolean; cdecl; external libgtksourceview5;
procedure gtk_source_view_set_tab_width(view: PGtkSourceView; Width: Tguint); cdecl; external libgtksourceview5;
function gtk_source_view_get_tab_width(view: PGtkSourceView): Tguint; cdecl; external libgtksourceview5;
procedure gtk_source_view_set_indent_width(view: PGtkSourceView; Width: Tgint); cdecl; external libgtksourceview5;
function gtk_source_view_get_indent_width(view: PGtkSourceView): Tgint; cdecl; external libgtksourceview5;
procedure gtk_source_view_set_auto_indent(view: PGtkSourceView; enable: Tgboolean); cdecl; external libgtksourceview5;
function gtk_source_view_get_auto_indent(view: PGtkSourceView): Tgboolean; cdecl; external libgtksourceview5;
procedure gtk_source_view_set_insert_spaces_instead_of_tabs(view: PGtkSourceView; enable: Tgboolean); cdecl; external libgtksourceview5;
function gtk_source_view_get_insert_spaces_instead_of_tabs(view: PGtkSourceView): Tgboolean; cdecl; external libgtksourceview5;
procedure gtk_source_view_set_indent_on_tab(view: PGtkSourceView; enable: Tgboolean); cdecl; external libgtksourceview5;
function gtk_source_view_get_indent_on_tab(view: PGtkSourceView): Tgboolean; cdecl; external libgtksourceview5;
procedure gtk_source_view_indent_lines(view: PGtkSourceView; start: PGtkTextIter; end_: PGtkTextIter); cdecl; external libgtksourceview5;
procedure gtk_source_view_unindent_lines(view: PGtkSourceView; start: PGtkTextIter; end_: PGtkTextIter); cdecl; external libgtksourceview5;
procedure gtk_source_view_set_highlight_current_line(view: PGtkSourceView; highlight: Tgboolean); cdecl; external libgtksourceview5;
function gtk_source_view_get_highlight_current_line(view: PGtkSourceView): Tgboolean; cdecl; external libgtksourceview5;
procedure gtk_source_view_set_show_right_margin(view: PGtkSourceView; Show: Tgboolean); cdecl; external libgtksourceview5;
function gtk_source_view_get_show_right_margin(view: PGtkSourceView): Tgboolean; cdecl; external libgtksourceview5;
procedure gtk_source_view_set_right_margin_position(view: PGtkSourceView; pos: Tguint); cdecl; external libgtksourceview5;
function gtk_source_view_get_right_margin_position(view: PGtkSourceView): Tguint; cdecl; external libgtksourceview5;
procedure gtk_source_view_set_show_line_marks(view: PGtkSourceView; Show: Tgboolean); cdecl; external libgtksourceview5;
function gtk_source_view_get_show_line_marks(view: PGtkSourceView): Tgboolean; cdecl; external libgtksourceview5;
procedure gtk_source_view_set_mark_attributes(view: PGtkSourceView; category: Pgchar; attributes: PGtkSourceMarkAttributes; priority: Tgint); cdecl; external libgtksourceview5;
function gtk_source_view_get_mark_attributes(view: PGtkSourceView; category: Pgchar; priority: Pgint): PGtkSourceMarkAttributes; cdecl; external libgtksourceview5;
procedure gtk_source_view_set_smart_backspace(view: PGtkSourceView; smart_backspace: Tgboolean); cdecl; external libgtksourceview5;
function gtk_source_view_get_smart_backspace(view: PGtkSourceView): Tgboolean; cdecl; external libgtksourceview5;
procedure gtk_source_view_set_smart_home_end(view: PGtkSourceView; smart_home_end: TGtkSourceSmartHomeEndType); cdecl; external libgtksourceview5;
function gtk_source_view_get_smart_home_end(view: PGtkSourceView): TGtkSourceSmartHomeEndType; cdecl; external libgtksourceview5;
procedure gtk_source_view_set_enable_snippets(view: PGtkSourceView; enable_snippets: Tgboolean); cdecl; external libgtksourceview5;
function gtk_source_view_get_enable_snippets(view: PGtkSourceView): Tgboolean; cdecl; external libgtksourceview5;
function gtk_source_view_get_visual_column(view: PGtkSourceView; iter: PGtkTextIter): Tguint; cdecl; external libgtksourceview5;
function gtk_source_view_get_completion(view: PGtkSourceView): PGtkSourceCompletion; cdecl; external libgtksourceview5;
function gtk_source_view_get_hover(view: PGtkSourceView): PGtkSourceHover; cdecl; external libgtksourceview5;
function gtk_source_view_get_indenter(view: PGtkSourceView): PGtkSourceIndenter; cdecl; external libgtksourceview5;
procedure gtk_source_view_set_indenter(view: PGtkSourceView; indenter: PGtkSourceIndenter); cdecl; external libgtksourceview5;
function gtk_source_view_get_gutter(view: PGtkSourceView; window_type: TGtkTextWindowType): PGtkSourceGutter; cdecl; external libgtksourceview5;
procedure gtk_source_view_set_background_pattern(view: PGtkSourceView; background_pattern: TGtkSourceBackgroundPatternType); cdecl; external libgtksourceview5;
function gtk_source_view_get_background_pattern(view: PGtkSourceView): TGtkSourceBackgroundPatternType; cdecl; external libgtksourceview5;
function gtk_source_view_get_space_drawer(view: PGtkSourceView): PGtkSourceSpaceDrawer; cdecl; external libgtksourceview5;
procedure gtk_source_view_push_snippet(view: PGtkSourceView; snippet: PGtkSourceSnippet; location: PGtkTextIter); cdecl; external libgtksourceview5;

// === Konventiert am: 29-3-25 15:11:19 ===

function GTK_SOURCE_TYPE_VIEW: TGType;
function GTK_SOURCE_VIEW(obj: Pointer): PGtkSourceView;
function GTK_SOURCE_IS_VIEW(obj: Pointer): Tgboolean;
function GTK_SOURCE_VIEW_CLASS(klass: Pointer): PGtkSourceViewClass;
function GTK_SOURCE_IS_VIEW_CLASS(klass: Pointer): Tgboolean;
function GTK_SOURCE_VIEW_GET_CLASS(obj: Pointer): PGtkSourceViewClass;

implementation

function GTK_SOURCE_TYPE_VIEW: TGType;
begin
  Result := gtk_source_view_get_type;
end;

function GTK_SOURCE_VIEW(obj: Pointer): PGtkSourceView;
begin
  Result := PGtkSourceView(g_type_check_instance_cast(obj, GTK_SOURCE_TYPE_VIEW));
end;

function GTK_SOURCE_IS_VIEW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_SOURCE_TYPE_VIEW);
end;

function GTK_SOURCE_VIEW_CLASS(klass: Pointer): PGtkSourceViewClass;
begin
  Result := PGtkSourceViewClass(g_type_check_class_cast(klass, GTK_SOURCE_TYPE_VIEW));
end;

function GTK_SOURCE_IS_VIEW_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_SOURCE_TYPE_VIEW);
end;

function GTK_SOURCE_VIEW_GET_CLASS(obj: Pointer): PGtkSourceViewClass;
begin
  Result := PGtkSourceViewClass(PGTypeInstance(obj)^.g_class);
end;


end.
