{$IFDEF read_interface}


  {G_DECLARE_FINAL_TYPE (GtkSourceSnippet, gtk_source_snippet, GTK_SOURCE, SNIPPET, GObject) }
type
  TGtkSourceSnippet = record
  end;
  PGtkSourceSnippet = ^TGtkSourceSnippet;

  TGtkSourceSnippetClass = record
    parent_class: TGObjectClass;
  end;
  PGtkSourceSnippetClass = ^TGtkSourceSnippetClass;

function gtk_source_snippet_get_type: TGType; cdecl; external libgtksourceview5;
function gtk_source_snippet_new(trigger: Pgchar; language_id: Pgchar): PGtkSourceSnippet; cdecl; external libgtksourceview5;
function gtk_source_snippet_new_parsed(Text: pchar; error: PPGError): PGtkSourceSnippet; cdecl; external libgtksourceview5;
function gtk_source_snippet_copy(snippet: PGtkSourceSnippet): PGtkSourceSnippet; cdecl; external libgtksourceview5;
function gtk_source_snippet_get_name(snippet: PGtkSourceSnippet): Pgchar; cdecl; external libgtksourceview5;
procedure gtk_source_snippet_set_name(snippet: PGtkSourceSnippet; Name: Pgchar); cdecl; external libgtksourceview5;
function gtk_source_snippet_get_trigger(snippet: PGtkSourceSnippet): Pgchar; cdecl; external libgtksourceview5;
procedure gtk_source_snippet_set_trigger(snippet: PGtkSourceSnippet; trigger: Pgchar); cdecl; external libgtksourceview5;
function gtk_source_snippet_get_language_id(snippet: PGtkSourceSnippet): Pgchar; cdecl; external libgtksourceview5;
procedure gtk_source_snippet_set_language_id(snippet: PGtkSourceSnippet; language_id: Pgchar); cdecl; external libgtksourceview5;
function gtk_source_snippet_get_description(snippet: PGtkSourceSnippet): Pgchar; cdecl; external libgtksourceview5;
procedure gtk_source_snippet_set_description(snippet: PGtkSourceSnippet; description: Pgchar); cdecl; external libgtksourceview5;
procedure gtk_source_snippet_add_chunk(snippet: PGtkSourceSnippet; chunk: PGtkSourceSnippetChunk); cdecl; external libgtksourceview5;
function gtk_source_snippet_get_n_chunks(snippet: PGtkSourceSnippet): Tguint; cdecl; external libgtksourceview5;
function gtk_source_snippet_get_focus_position(snippet: PGtkSourceSnippet): Tgint; cdecl; external libgtksourceview5;
function gtk_source_snippet_get_nth_chunk(snippet: PGtkSourceSnippet; nth: Tguint): PGtkSourceSnippetChunk; cdecl; external libgtksourceview5;
function gtk_source_snippet_get_context(snippet: PGtkSourceSnippet): PGtkSourceSnippetContext; cdecl; external libgtksourceview5;

// === Konventiert am: 29-3-25 15:14:28 ===

function GTK_SOURCE_TYPE_SNIPPET: TGType;
function GTK_SOURCE_SNIPPET(obj: Pointer): PGtkSourceSnippet;
function GTK_SOURCE_IS_SNIPPET(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_SOURCE_TYPE_SNIPPET: TGType;
begin
  Result := gtk_source_snippet_get_type;
end;

function GTK_SOURCE_SNIPPET(obj: Pointer): PGtkSourceSnippet;
begin
  Result := PGtkSourceSnippet(g_type_check_instance_cast(obj, GTK_SOURCE_TYPE_SNIPPET));
end;

function GTK_SOURCE_IS_SNIPPET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_SOURCE_TYPE_SNIPPET);
end;


{$ENDIF read_implementation}
