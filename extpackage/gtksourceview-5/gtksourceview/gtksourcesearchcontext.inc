{$IFDEF read_interface}


  {G_DECLARE_FINAL_TYPE (GtkSourceSearchContext, gtk_source_search_context, GTK_SOURCE, SEARCH_CONTEXT, GObject) }
type
  TGtkSourceSearchContext = record
  end;
  PGtkSourceSearchContext = ^TGtkSourceSearchContext;

  TGtkSourceSearchContextClass = record
    parent_class: TGObjectClass;
  end;
  PGtkSourceSearchContextClass = ^TGtkSourceSearchContextClass;

function gtk_source_search_context_get_type: TGType; cdecl; external libgtksourceview5;
function gtk_source_search_context_new(buffer: PGtkSourceBuffer; settings: PGtkSourceSearchSettings): PGtkSourceSearchContext; cdecl; external libgtksourceview5;
function gtk_source_search_context_get_buffer(search: PGtkSourceSearchContext): PGtkSourceBuffer; cdecl; external libgtksourceview5;
function gtk_source_search_context_get_settings(search: PGtkSourceSearchContext): PGtkSourceSearchSettings; cdecl; external libgtksourceview5;
function gtk_source_search_context_get_highlight(search: PGtkSourceSearchContext): Tgboolean; cdecl; external libgtksourceview5;
procedure gtk_source_search_context_set_highlight(search: PGtkSourceSearchContext; highlight: Tgboolean); cdecl; external libgtksourceview5;
function gtk_source_search_context_get_match_style(search: PGtkSourceSearchContext): PGtkSourceStyle; cdecl; external libgtksourceview5;
procedure gtk_source_search_context_set_match_style(search: PGtkSourceSearchContext; match_style: PGtkSourceStyle); cdecl; external libgtksourceview5;
function gtk_source_search_context_get_regex_error(search: PGtkSourceSearchContext): PGError; cdecl; external libgtksourceview5;
function gtk_source_search_context_get_occurrences_count(search: PGtkSourceSearchContext): Tgint; cdecl; external libgtksourceview5;
function gtk_source_search_context_get_occurrence_position(search: PGtkSourceSearchContext; match_start: PGtkTextIter; match_end: PGtkTextIter): Tgint; cdecl; external libgtksourceview5;
function gtk_source_search_context_forward(search: PGtkSourceSearchContext; iter: PGtkTextIter; match_start: PGtkTextIter; match_end: PGtkTextIter; has_wrapped_around: Pgboolean): Tgboolean; cdecl; external libgtksourceview5;
procedure gtk_source_search_context_forward_async(search: PGtkSourceSearchContext; iter: PGtkTextIter; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgtksourceview5;
function gtk_source_search_context_forward_finish(search: PGtkSourceSearchContext; Result: PGAsyncResult; match_start: PGtkTextIter; match_end: PGtkTextIter; has_wrapped_around: Pgboolean;
  error: PPGError): Tgboolean; cdecl; external libgtksourceview5;
function gtk_source_search_context_backward(search: PGtkSourceSearchContext; iter: PGtkTextIter; match_start: PGtkTextIter; match_end: PGtkTextIter; has_wrapped_around: Pgboolean): Tgboolean; cdecl; external libgtksourceview5;
procedure gtk_source_search_context_backward_async(search: PGtkSourceSearchContext; iter: PGtkTextIter; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgtksourceview5;
function gtk_source_search_context_backward_finish(search: PGtkSourceSearchContext; Result: PGAsyncResult; match_start: PGtkTextIter; match_end: PGtkTextIter; has_wrapped_around: Pgboolean;
  error: PPGError): Tgboolean; cdecl; external libgtksourceview5;
function gtk_source_search_context_replace(search: PGtkSourceSearchContext; match_start: PGtkTextIter; match_end: PGtkTextIter; replace: Pgchar; replace_length: Tgint;
  error: PPGError): Tgboolean; cdecl; external libgtksourceview5;
function gtk_source_search_context_replace_all(search: PGtkSourceSearchContext; replace: Pgchar; replace_length: Tgint; error: PPGError): Tguint; cdecl; external libgtksourceview5;

// === Konventiert am: 29-3-25 16:47:40 ===

function GTK_SOURCE_TYPE_SEARCH_CONTEXT: TGType;
function GTK_SOURCE_SEARCH_CONTEXT(obj: Pointer): PGtkSourceSearchContext;
function GTK_SOURCE_IS_SEARCH_CONTEXT(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_SOURCE_TYPE_SEARCH_CONTEXT: TGType;
begin
  Result := gtk_source_search_context_get_type;
end;

function GTK_SOURCE_SEARCH_CONTEXT(obj: Pointer): PGtkSourceSearchContext;
begin
  Result := PGtkSourceSearchContext(g_type_check_instance_cast(obj, GTK_SOURCE_TYPE_SEARCH_CONTEXT));
end;

function GTK_SOURCE_IS_SEARCH_CONTEXT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_SOURCE_TYPE_SEARCH_CONTEXT);
end;


{$ENDIF read_implementation}
