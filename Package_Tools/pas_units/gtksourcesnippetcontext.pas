unit gtksourcesnippetcontext;

interface

uses
  fp_glib2, fp_GTK4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {G_DECLARE_FINAL_TYPE (GtkSourceSnippetContext, gtk_source_snippet_context, GTK_SOURCE, SNIPPET_CONTEXT, GObject) }
type
  TGtkSourceSnippetContext = record
  end;
  PGtkSourceSnippetContext = ^TGtkSourceSnippetContext;

  TGtkSourceSnippetContextClass = record
    parent_class: TGObjectClass;
  end;
  PGtkSourceSnippetContextClass = ^TGtkSourceSnippetContextClass;

function gtk_source_snippet_context_get_type: TGType; cdecl; external libgtksourceview5;
function gtk_source_snippet_context_new: PGtkSourceSnippetContext; cdecl; external libgtksourceview5;
procedure gtk_source_snippet_context_clear_variables(self: PGtkSourceSnippetContext); cdecl; external libgtksourceview5;
procedure gtk_source_snippet_context_set_variable(self: PGtkSourceSnippetContext; key: Pgchar; Value: Pgchar); cdecl; external libgtksourceview5;
procedure gtk_source_snippet_context_set_constant(self: PGtkSourceSnippetContext; key: Pgchar; Value: Pgchar); cdecl; external libgtksourceview5;
function gtk_source_snippet_context_get_variable(self: PGtkSourceSnippetContext; key: Pgchar): Pgchar; cdecl; external libgtksourceview5;
function gtk_source_snippet_context_expand(self: PGtkSourceSnippetContext; input: Pgchar): Pgchar; cdecl; external libgtksourceview5;
procedure gtk_source_snippet_context_set_tab_width(self: PGtkSourceSnippetContext; tab_width: Tgint); cdecl; external libgtksourceview5;
procedure gtk_source_snippet_context_set_use_spaces(self: PGtkSourceSnippetContext; use_spaces: Tgboolean); cdecl; external libgtksourceview5;
procedure gtk_source_snippet_context_set_line_prefix(self: PGtkSourceSnippetContext; line_prefix: Pgchar); cdecl; external libgtksourceview5;

// === Konventiert am: 29-3-25 15:18:08 ===

function GTK_SOURCE_TYPE_SNIPPET_CONTEXT: TGType;
function GTK_SOURCE_SNIPPET_CONTEXT(obj: Pointer): PGtkSourceSnippetContext;
function GTK_SOURCE_IS_SNIPPET_CONTEXT(obj: Pointer): Tgboolean;

implementation

function GTK_SOURCE_TYPE_SNIPPET_CONTEXT: TGType;
begin
  Result := gtk_source_snippet_context_get_type;
end;

function GTK_SOURCE_SNIPPET_CONTEXT(obj: Pointer): PGtkSourceSnippetContext;
begin
  Result := PGtkSourceSnippetContext(g_type_check_instance_cast(obj, GTK_SOURCE_TYPE_SNIPPET_CONTEXT));
end;

function GTK_SOURCE_IS_SNIPPET_CONTEXT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_SOURCE_TYPE_SNIPPET_CONTEXT);
end;




end.
