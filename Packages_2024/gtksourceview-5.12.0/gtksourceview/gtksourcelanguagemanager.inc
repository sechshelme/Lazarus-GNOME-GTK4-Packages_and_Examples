{$IFDEF read_interface}


  {G_DECLARE_FINAL_TYPE (GtkSourceLanguageManager, gtk_source_language_manager, GTK_SOURCE, LANGUAGE_MANAGER, GObject) }
type
  TGtkSourceLanguageManager = record
  end;
  PGtkSourceLanguageManager = ^TGtkSourceLanguageManager;

  TGtkSourceLanguageManagerClass = record
    parent_class: TGObjectClass;
  end;
  PGtkSourceLanguageManagerClass = ^TGtkSourceLanguageManagerClass;

function gtk_source_language_manager_get_type: TGType; cdecl; external libgtksourceview5;
function gtk_source_language_manager_new: PGtkSourceLanguageManager; cdecl; external libgtksourceview5;
function gtk_source_language_manager_get_default: PGtkSourceLanguageManager; cdecl; external libgtksourceview5;
function gtk_source_language_manager_get_search_path(lm: PGtkSourceLanguageManager): PPgchar; cdecl; external libgtksourceview5;
procedure gtk_source_language_manager_set_search_path(lm: PGtkSourceLanguageManager; dirs: PPgchar); cdecl; external libgtksourceview5;
procedure gtk_source_language_manager_append_search_path(lm: PGtkSourceLanguageManager; path: Pgchar); cdecl; external libgtksourceview5;
procedure gtk_source_language_manager_prepend_search_path(lm: PGtkSourceLanguageManager; path: Pgchar); cdecl; external libgtksourceview5;
function gtk_source_language_manager_get_language_ids(lm: PGtkSourceLanguageManager): PPgchar; cdecl; external libgtksourceview5;
function gtk_source_language_manager_get_language(lm: PGtkSourceLanguageManager; id: Pgchar): PGtkSourceLanguage; cdecl; external libgtksourceview5;
function gtk_source_language_manager_guess_language(lm: PGtkSourceLanguageManager; filename: Pgchar; content_type: Pgchar): PGtkSourceLanguage; cdecl; external libgtksourceview5;

// === Konventiert am: 29-3-25 13:39:47 ===

function GTK_SOURCE_TYPE_LANGUAGE_MANAGER: TGType;
function GTK_SOURCE_LANGUAGE_MANAGER(obj: Pointer): PGtkSourceLanguageManager;
function GTK_SOURCE_IS_LANGUAGE_MANAGER(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_SOURCE_TYPE_LANGUAGE_MANAGER: TGType;
begin
  Result := gtk_source_language_manager_get_type;
end;

function GTK_SOURCE_LANGUAGE_MANAGER(obj: Pointer): PGtkSourceLanguageManager;
begin
  Result := PGtkSourceLanguageManager(g_type_check_instance_cast(obj, GTK_SOURCE_TYPE_LANGUAGE_MANAGER));
end;

function GTK_SOURCE_IS_LANGUAGE_MANAGER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_SOURCE_TYPE_LANGUAGE_MANAGER);
end;



{$ENDIF read_implementation}
