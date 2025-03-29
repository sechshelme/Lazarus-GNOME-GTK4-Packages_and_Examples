{$IFDEF read_interface}

{G_DECLARE_DERIVABLE_TYPE (GtkSourceCompletionSnippets, gtk_source_completion_snippets, GTK_SOURCE, COMPLETION_SNIPPETS, GObject) }
type
  TGtkSourceCompletionSnippets = record
    parent_instance: TGObject;
  end;
  PGtkSourceCompletionSnippets = ^TGtkSourceCompletionSnippets;

  TGtkSourceCompletionSnippetsClass = record
    parent_class: TGObjectClass;
    _reserved: array[0..9] of Tgpointer;
  end;
  PGtkSourceCompletionSnippetsClass = ^TGtkSourceCompletionSnippetsClass;

function gtk_source_completion_snippets_get_type: TGType; cdecl; external libgtksourceview5;
function gtk_source_completion_snippets_new:PGtkSourceCompletionSnippets;cdecl;external libgtksourceview5;

// === Konventiert am: 29-3-25 19:18:35 ===

function GTK_SOURCE_TYPE_COMPLETION_SNIPPETS: TGType;
function GTK_SOURCE_COMPLETION_SNIPPETS(obj: Pointer): PGtkSourceCompletionSnippets;
function GTK_SOURCE_IS_COMPLETION_SNIPPETS(obj: Pointer): Tgboolean;
function GTK_SOURCE_COMPLETION_SNIPPETS_CLASS(klass: Pointer): PGtkSourceCompletionSnippetsClass;
function GTK_SOURCE_IS_COMPLETION_SNIPPETS_CLASS(klass: Pointer): Tgboolean;
function GTK_SOURCE_COMPLETION_SNIPPETS_GET_CLASS(obj: Pointer): PGtkSourceCompletionSnippetsClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_SOURCE_TYPE_COMPLETION_SNIPPETS: TGType;
begin
  Result := gtk_source_completion_snippets_get_type;
end;

function GTK_SOURCE_COMPLETION_SNIPPETS(obj: Pointer): PGtkSourceCompletionSnippets;
begin
  Result := PGtkSourceCompletionSnippets(g_type_check_instance_cast(obj, GTK_SOURCE_TYPE_COMPLETION_SNIPPETS));
end;

function GTK_SOURCE_IS_COMPLETION_SNIPPETS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_SOURCE_TYPE_COMPLETION_SNIPPETS);
end;

function GTK_SOURCE_COMPLETION_SNIPPETS_CLASS(klass: Pointer): PGtkSourceCompletionSnippetsClass;
begin
  Result := PGtkSourceCompletionSnippetsClass(g_type_check_class_cast(klass, GTK_SOURCE_TYPE_COMPLETION_SNIPPETS));
end;

function GTK_SOURCE_IS_COMPLETION_SNIPPETS_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_SOURCE_TYPE_COMPLETION_SNIPPETS);
end;

function GTK_SOURCE_COMPLETION_SNIPPETS_GET_CLASS(obj: Pointer): PGtkSourceCompletionSnippetsClass;
begin
  Result := PGtkSourceCompletionSnippetsClass(PGTypeInstance(obj)^.g_class);
end;


{$ENDIF read_implementation}
