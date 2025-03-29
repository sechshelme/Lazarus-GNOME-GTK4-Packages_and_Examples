unit gtksourcegutterlines;

interface

uses
  fp_glib2, fp_GTK4, gtksourcetypes, gtksourcegutterrenderer;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {G_DECLARE_FINAL_TYPE (GtkSourceGutterLines, gtk_source_gutter_lines, GTK_SOURCE, GUTTER_LINES, GObject) }
type
  TGtkSourceGutterLinesClass = record
    parent_class: TGObjectClass;
  end;
  PGtkSourceGutterLinesClass = ^TGtkSourceGutterLinesClass;

function gtk_source_gutter_lines_get_type: TGType; cdecl; external libgtksourceview5;
function gtk_source_gutter_lines_get_first(Lines: PGtkSourceGutterLines): Tguint; cdecl; external libgtksourceview5;
function gtk_source_gutter_lines_get_last(Lines: PGtkSourceGutterLines): Tguint; cdecl; external libgtksourceview5;
procedure gtk_source_gutter_lines_get_iter_at_line(Lines: PGtkSourceGutterLines; iter: PGtkTextIter; line: Tguint); cdecl; external libgtksourceview5;
function gtk_source_gutter_lines_get_view(Lines: PGtkSourceGutterLines): PGtkTextView; cdecl; external libgtksourceview5;
function gtk_source_gutter_lines_get_buffer(Lines: PGtkSourceGutterLines): PGtkTextBuffer; cdecl; external libgtksourceview5;
procedure gtk_source_gutter_lines_add_qclass(Lines: PGtkSourceGutterLines; line: Tguint; qname: TGQuark); cdecl; external libgtksourceview5;
procedure gtk_source_gutter_lines_add_class(Lines: PGtkSourceGutterLines; line: Tguint; Name: Pgchar); cdecl; external libgtksourceview5;
procedure gtk_source_gutter_lines_remove_class(Lines: PGtkSourceGutterLines; line: Tguint; Name: Pgchar); cdecl; external libgtksourceview5;
procedure gtk_source_gutter_lines_remove_qclass(Lines: PGtkSourceGutterLines; line: Tguint; qname: TGQuark); cdecl; external libgtksourceview5;
function gtk_source_gutter_lines_has_class(Lines: PGtkSourceGutterLines; line: Tguint; Name: Pgchar): Tgboolean; cdecl; external libgtksourceview5;
function gtk_source_gutter_lines_has_qclass(Lines: PGtkSourceGutterLines; line: Tguint; qname: TGQuark): Tgboolean; cdecl; external libgtksourceview5;
function gtk_source_gutter_lines_is_cursor(Lines: PGtkSourceGutterLines; line: Tguint): Tgboolean; cdecl; external libgtksourceview5;
function gtk_source_gutter_lines_is_prelit(Lines: PGtkSourceGutterLines; line: Tguint): Tgboolean; cdecl; external libgtksourceview5;
function gtk_source_gutter_lines_is_selected(Lines: PGtkSourceGutterLines; line: Tguint): Tgboolean; cdecl; external libgtksourceview5;
procedure gtk_source_gutter_lines_get_line_yrange(Lines: PGtkSourceGutterLines; line: Tguint; mode: TGtkSourceGutterRendererAlignmentMode; y: Pgint; Height: Pgint); cdecl; external libgtksourceview5;
function gtk_source_gutter_lines_has_any_class(Lines: PGtkSourceGutterLines; line: Tguint): Tgboolean; cdecl; external libgtksourceview5;

// === Konventiert am: 29-3-25 15:57:52 ===

function GTK_SOURCE_TYPE_GUTTER_LINES: TGType;
function GTK_SOURCE_GUTTER_LINES(obj: Pointer): PGtkSourceGutterLines;
function GTK_SOURCE_IS_GUTTER_LINES(obj: Pointer): Tgboolean;

implementation

function GTK_SOURCE_TYPE_GUTTER_LINES: TGType;
begin
  Result := gtk_source_gutter_lines_get_type;
end;

function GTK_SOURCE_GUTTER_LINES(obj: Pointer): PGtkSourceGutterLines;
begin
  Result := PGtkSourceGutterLines(g_type_check_instance_cast(obj, GTK_SOURCE_TYPE_GUTTER_LINES));
end;

function GTK_SOURCE_IS_GUTTER_LINES(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_SOURCE_TYPE_GUTTER_LINES);
end;


end.
