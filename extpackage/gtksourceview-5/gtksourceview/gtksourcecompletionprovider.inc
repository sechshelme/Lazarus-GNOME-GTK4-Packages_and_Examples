{$IFDEF read_interface}


  {G_DECLARE_INTERFACE (GtkSourceCompletionProvider, gtk_source_completion_provider, GTK_SOURCE, COMPLETION_PROVIDER, GObject) }
type
  TGtkSourceCompletionProviderInterface = record
    parent_iface: TGTypeInterface;
    get_title: function(self: PGtkSourceCompletionProvider): pchar; cdecl;
    get_priority: function(self: PGtkSourceCompletionProvider; context: PGtkSourceCompletionContext): longint; cdecl;
    is_trigger: function(self: PGtkSourceCompletionProvider; iter: PGtkTextIter; ch: Tgunichar): Tgboolean; cdecl;
    key_activates: function(self: PGtkSourceCompletionProvider; context: PGtkSourceCompletionContext; proposal: PGtkSourceCompletionProposal; keyval: Tguint; state: TGdkModifierType): Tgboolean; cdecl;
    populate: function(self: PGtkSourceCompletionProvider; context: PGtkSourceCompletionContext; error: PPGError): PGListModel; cdecl;
    populate_async: procedure(self: PGtkSourceCompletionProvider; context: PGtkSourceCompletionContext; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl;
    populate_finish: function(self: PGtkSourceCompletionProvider; Result: PGAsyncResult; error: PPGError): PGListModel; cdecl;
    refilter: procedure(self: PGtkSourceCompletionProvider; context: PGtkSourceCompletionContext; model: PGListModel); cdecl;
    display: procedure(self: PGtkSourceCompletionProvider; context: PGtkSourceCompletionContext; proposal: PGtkSourceCompletionProposal; cell: PGtkSourceCompletionCell); cdecl;
    activate: procedure(self: PGtkSourceCompletionProvider; context: PGtkSourceCompletionContext; proposal: PGtkSourceCompletionProposal); cdecl;
    list_alternates: function(self: PGtkSourceCompletionProvider; context: PGtkSourceCompletionContext; proposal: PGtkSourceCompletionProposal): PGPtrArray; cdecl;
  end;
  PGtkSourceCompletionProviderInterface = ^TGtkSourceCompletionProviderInterface;

function gtk_source_completion_provider_get_type: TGType; cdecl; external libgtksourceview5;
function gtk_source_completion_provider_get_title(self: PGtkSourceCompletionProvider): pchar; cdecl; external libgtksourceview5;
function gtk_source_completion_provider_get_priority(self: PGtkSourceCompletionProvider; context: PGtkSourceCompletionContext): longint; cdecl; external libgtksourceview5;
function gtk_source_completion_provider_is_trigger(self: PGtkSourceCompletionProvider; iter: PGtkTextIter; ch: Tgunichar): Tgboolean; cdecl; external libgtksourceview5;
function gtk_source_completion_provider_key_activates(self: PGtkSourceCompletionProvider; context: PGtkSourceCompletionContext; proposal: PGtkSourceCompletionProposal; keyval: Tguint; state: TGdkModifierType): Tgboolean; cdecl; external libgtksourceview5;
procedure gtk_source_completion_provider_populate_async(self: PGtkSourceCompletionProvider; context: PGtkSourceCompletionContext; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgtksourceview5;
function gtk_source_completion_provider_populate_finish(self: PGtkSourceCompletionProvider; Result: PGAsyncResult; error: PPGError): PGListModel; cdecl; external libgtksourceview5;
procedure gtk_source_completion_provider_refilter(self: PGtkSourceCompletionProvider; context: PGtkSourceCompletionContext; model: PGListModel); cdecl; external libgtksourceview5;
procedure gtk_source_completion_provider_display(self: PGtkSourceCompletionProvider; context: PGtkSourceCompletionContext; proposal: PGtkSourceCompletionProposal; cell: PGtkSourceCompletionCell); cdecl; external libgtksourceview5;
procedure gtk_source_completion_provider_activate(self: PGtkSourceCompletionProvider; context: PGtkSourceCompletionContext; proposal: PGtkSourceCompletionProposal); cdecl; external libgtksourceview5;
function gtk_source_completion_provider_list_alternates(self: PGtkSourceCompletionProvider; context: PGtkSourceCompletionContext; proposal: PGtkSourceCompletionProposal): PGPtrArray; cdecl; external libgtksourceview5;

// === Konventiert am: 29-3-25 15:30:01 ===

function GTK_SOURCE_TYPE_COMPLETION_PROVIDER: TGType;
function GTK_SOURCE_COMPLETION_PROVIDER(obj: Pointer): PGtkSourceCompletionProvider;
function GTK_SOURCE_IS_COMPLETION_PROVIDER(obj: Pointer): Tgboolean;
function GTK_SOURCE_COMPLETION_PROVIDER_GET_IFACE(obj: Pointer): PGtkSourceCompletionProviderInterface;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_SOURCE_TYPE_COMPLETION_PROVIDER: TGType;
begin
  Result := gtk_source_completion_provider_get_type;
end;

function GTK_SOURCE_COMPLETION_PROVIDER(obj: Pointer): PGtkSourceCompletionProvider;
begin
  Result := PGtkSourceCompletionProvider(g_type_check_instance_cast(obj, GTK_SOURCE_TYPE_COMPLETION_PROVIDER));
end;

function GTK_SOURCE_IS_COMPLETION_PROVIDER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_SOURCE_TYPE_COMPLETION_PROVIDER);
end;

function GTK_SOURCE_COMPLETION_PROVIDER_GET_IFACE(obj: Pointer): PGtkSourceCompletionProviderInterface;
begin
  Result := g_type_interface_peek(obj, GTK_SOURCE_TYPE_COMPLETION_PROVIDER);
end;


{$ENDIF read_implementation}
