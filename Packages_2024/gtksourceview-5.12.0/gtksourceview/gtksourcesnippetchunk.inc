{$IFDEF read_interface}


  {G_DECLARE_FINAL_TYPE (GtkSourceSnippetChunk, gtk_source_snippet_chunk, GTK_SOURCE, SNIPPET_CHUNK, GInitiallyUnowned) }
type
  TGtkSourceSnippetChunk = record
  end;
  PGtkSourceSnippetChunk = ^TGtkSourceSnippetChunk;

  TGtkSourceSnippetChunkClass = record
    parent_class: TGInitiallyUnownedClass;
  end;
  PGtkSourceSnippetChunkClass = ^TGtkSourceSnippetChunkClass;

function gtk_source_snippet_chunk_get_type: TGType; cdecl; external libgtksourceview5;
function gtk_source_snippet_chunk_new: PGtkSourceSnippetChunk; cdecl; external libgtksourceview5;
function gtk_source_snippet_chunk_copy(chunk: PGtkSourceSnippetChunk): PGtkSourceSnippetChunk; cdecl; external libgtksourceview5;
function gtk_source_snippet_chunk_get_context(chunk: PGtkSourceSnippetChunk): PGtkSourceSnippetContext; cdecl; external libgtksourceview5;
procedure gtk_source_snippet_chunk_set_context(chunk: PGtkSourceSnippetChunk; context: PGtkSourceSnippetContext); cdecl; external libgtksourceview5;
function gtk_source_snippet_chunk_get_spec(chunk: PGtkSourceSnippetChunk): Pgchar; cdecl; external libgtksourceview5;
procedure gtk_source_snippet_chunk_set_spec(chunk: PGtkSourceSnippetChunk; spec: Pgchar); cdecl; external libgtksourceview5;
function gtk_source_snippet_chunk_get_focus_position(chunk: PGtkSourceSnippetChunk): Tgint; cdecl; external libgtksourceview5;
procedure gtk_source_snippet_chunk_set_focus_position(chunk: PGtkSourceSnippetChunk; focus_position: Tgint); cdecl; external libgtksourceview5;
function gtk_source_snippet_chunk_get_text(chunk: PGtkSourceSnippetChunk): Pgchar; cdecl; external libgtksourceview5;
procedure gtk_source_snippet_chunk_set_text(chunk: PGtkSourceSnippetChunk; Text: Pgchar); cdecl; external libgtksourceview5;
function gtk_source_snippet_chunk_get_text_set(chunk: PGtkSourceSnippetChunk): Tgboolean; cdecl; external libgtksourceview5;
procedure gtk_source_snippet_chunk_set_text_set(chunk: PGtkSourceSnippetChunk; text_set: Tgboolean); cdecl; external libgtksourceview5;
function gtk_source_snippet_chunk_get_tooltip_text(chunk: PGtkSourceSnippetChunk): pchar; cdecl; external libgtksourceview5;
procedure gtk_source_snippet_chunk_set_tooltip_text(chunk: PGtkSourceSnippetChunk; tooltip_text: pchar); cdecl; external libgtksourceview5;

// === Konventiert am: 29-3-25 15:16:26 ===

function GTK_SOURCE_TYPE_SNIPPET_CHUNK: TGType;
function GTK_SOURCE_SNIPPET_CHUNK(obj: Pointer): PGtkSourceSnippetChunk;
function GTK_SOURCE_IS_SNIPPET_CHUNK(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_SOURCE_TYPE_SNIPPET_CHUNK: TGType;
begin
  Result := gtk_source_snippet_chunk_get_type;
end;

function GTK_SOURCE_SNIPPET_CHUNK(obj: Pointer): PGtkSourceSnippetChunk;
begin
  Result := PGtkSourceSnippetChunk(g_type_check_instance_cast(obj, GTK_SOURCE_TYPE_SNIPPET_CHUNK));
end;

function GTK_SOURCE_IS_SNIPPET_CHUNK(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_SOURCE_TYPE_SNIPPET_CHUNK);
end;


{$ENDIF read_implementation}
