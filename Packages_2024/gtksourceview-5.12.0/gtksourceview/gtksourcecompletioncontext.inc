{$IFDEF read_interface}


type
  PGtkSourceCompletionActivation = ^TGtkSourceCompletionActivation;
  TGtkSourceCompletionActivation = longint;

const
  GTK_SOURCE_COMPLETION_ACTIVATION_NONE = 0;
  GTK_SOURCE_COMPLETION_ACTIVATION_INTERACTIVE = 1;
  GTK_SOURCE_COMPLETION_ACTIVATION_USER_REQUESTED = 2;

  {G_DECLARE_FINAL_TYPE (GtkSourceCompletionContext, gtk_source_completion_context, GTK_SOURCE, COMPLETION_CONTEXT, GObject) }

type
  TGtkSourceCompletionContext = record
  end;
  PGtkSourceCompletionContext = ^TGtkSourceCompletionContext;

  TGtkSourceCompletionContextClass = record
    parent_class: TGObjectClass;
  end;
  PGtkSourceCompletionContextClass = ^TGtkSourceCompletionContextClass;

function gtk_source_completion_context_get_type: TGType; cdecl; external libgtksourceview5;
function gtk_source_completion_context_get_completion(self: PGtkSourceCompletionContext): PGtkSourceCompletion; cdecl; external libgtksourceview5;
function gtk_source_completion_context_get_activation(self: PGtkSourceCompletionContext): TGtkSourceCompletionActivation; cdecl; external libgtksourceview5;
function gtk_source_completion_context_get_bounds(self: PGtkSourceCompletionContext; begin_: PGtkTextIter; end_: PGtkTextIter): Tgboolean; cdecl; external libgtksourceview5;
function gtk_source_completion_context_get_empty(self: PGtkSourceCompletionContext): Tgboolean; cdecl; external libgtksourceview5;
function gtk_source_completion_context_get_word(self: PGtkSourceCompletionContext): pchar; cdecl; external libgtksourceview5;
function gtk_source_completion_context_get_busy(self: PGtkSourceCompletionContext): Tgboolean; cdecl; external libgtksourceview5;
function gtk_source_completion_context_get_view(self: PGtkSourceCompletionContext): PGtkSourceView; cdecl; external libgtksourceview5;
function gtk_source_completion_context_get_buffer(self: PGtkSourceCompletionContext): PGtkSourceBuffer; cdecl; external libgtksourceview5;
function gtk_source_completion_context_get_language(self: PGtkSourceCompletionContext): PGtkSourceLanguage; cdecl; external libgtksourceview5;
procedure gtk_source_completion_context_set_proposals_for_provider(self: PGtkSourceCompletionContext; provider: PGtkSourceCompletionProvider; results: PGListModel); cdecl; external libgtksourceview5;
function gtk_source_completion_context_get_proposals_for_provider(self: PGtkSourceCompletionContext; provider: PGtkSourceCompletionProvider): PGListModel; cdecl; external libgtksourceview5;
function gtk_source_completion_context_list_providers(self: PGtkSourceCompletionContext): PGListModel; cdecl; external libgtksourceview5;

// === Konventiert am: 29-3-25 15:33:10 ===

function GTK_SOURCE_TYPE_COMPLETION_CONTEXT: TGType;
function GTK_SOURCE_COMPLETION_CONTEXT(obj: Pointer): PGtkSourceCompletionContext;
function GTK_SOURCE_IS_COMPLETION_CONTEXT(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_SOURCE_TYPE_COMPLETION_CONTEXT: TGType;
begin
  Result := gtk_source_completion_context_get_type;
end;

function GTK_SOURCE_COMPLETION_CONTEXT(obj: Pointer): PGtkSourceCompletionContext;
begin
  Result := PGtkSourceCompletionContext(g_type_check_instance_cast(obj, GTK_SOURCE_TYPE_COMPLETION_CONTEXT));
end;

function GTK_SOURCE_IS_COMPLETION_CONTEXT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_SOURCE_TYPE_COMPLETION_CONTEXT);
end;


{$ENDIF read_implementation}
