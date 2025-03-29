{$IFDEF read_interface}



{G_DECLARE_DERIVABLE_TYPE (GtkSourceCompletionWords, gtk_source_completion_words, GTK_SOURCE, COMPLETION_WORDS, GObject) }
type
  TGtkSourceCompletionWords = record
    parent_instance: TGObject;
  end;
  PGtkSourceCompletionWords = ^TGtkSourceCompletionWords;

  TGtkSourceCompletionWordsClass = record
    parent_class: TGObjectClass;
    _reserved: array[0..9] of Tgpointer;
  end;
  PGtkSourceCompletionWordsClass = ^TGtkSourceCompletionWordsClass;

function gtk_source_completion_words_get_type: TGType; cdecl; external libgtksourceview5;
function gtk_source_completion_words_new(title:Pgchar):PGtkSourceCompletionWords;cdecl;external libgtksourceview5;
procedure gtk_source_completion_words_register(words:PGtkSourceCompletionWords; buffer:PGtkTextBuffer);cdecl;external libgtksourceview5;
procedure gtk_source_completion_words_unregister(words:PGtkSourceCompletionWords; buffer:PGtkTextBuffer);cdecl;external libgtksourceview5;

// === Konventiert am: 29-3-25 19:19:30 ===

function GTK_SOURCE_TYPE_COMPLETION_WORDS: TGType;
function GTK_SOURCE_COMPLETION_WORDS(obj: Pointer): PGtkSourceCompletionWords;
function GTK_SOURCE_IS_COMPLETION_WORDS(obj: Pointer): Tgboolean;
function GTK_SOURCE_COMPLETION_WORDS_CLASS(klass: Pointer): PGtkSourceCompletionWordsClass;
function GTK_SOURCE_IS_COMPLETION_WORDS_CLASS(klass: Pointer): Tgboolean;
function GTK_SOURCE_COMPLETION_WORDS_GET_CLASS(obj: Pointer): PGtkSourceCompletionWordsClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_SOURCE_TYPE_COMPLETION_WORDS: TGType;
begin
  Result := gtk_source_completion_words_get_type;
end;

function GTK_SOURCE_COMPLETION_WORDS(obj: Pointer): PGtkSourceCompletionWords;
begin
  Result := PGtkSourceCompletionWords(g_type_check_instance_cast(obj, GTK_SOURCE_TYPE_COMPLETION_WORDS));
end;

function GTK_SOURCE_IS_COMPLETION_WORDS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_SOURCE_TYPE_COMPLETION_WORDS);
end;

function GTK_SOURCE_COMPLETION_WORDS_CLASS(klass: Pointer): PGtkSourceCompletionWordsClass;
begin
  Result := PGtkSourceCompletionWordsClass(g_type_check_class_cast(klass, GTK_SOURCE_TYPE_COMPLETION_WORDS));
end;

function GTK_SOURCE_IS_COMPLETION_WORDS_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_SOURCE_TYPE_COMPLETION_WORDS);
end;

function GTK_SOURCE_COMPLETION_WORDS_GET_CLASS(obj: Pointer): PGtkSourceCompletionWordsClass;
begin
  Result := PGtkSourceCompletionWordsClass(PGTypeInstance(obj)^.g_class);
end;


{$ENDIF read_implementation}
