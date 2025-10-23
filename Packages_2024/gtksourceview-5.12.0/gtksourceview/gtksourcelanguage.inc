{$IFDEF read_interface}


  {G_DECLARE_FINAL_TYPE (GtkSourceLanguage, gtk_source_language, GTK_SOURCE, LANGUAGE, GObject) }
type
  TGtkSourceLanguage = record
  end;
  PGtkSourceLanguage = ^TGtkSourceLanguage;

  TGtkSourceLanguageClass = record
    parent_class: TGObjectClass;
  end;
  PGtkSourceLanguageClass = ^TGtkSourceLanguageClass;

function gtk_source_language_get_type: TGType; cdecl; external libgtksourceview5;
function gtk_source_language_get_id(language: PGtkSourceLanguage): Pgchar; cdecl; external libgtksourceview5;
function gtk_source_language_get_name(language: PGtkSourceLanguage): Pgchar; cdecl; external libgtksourceview5;
function gtk_source_language_get_section(language: PGtkSourceLanguage): Pgchar; cdecl; external libgtksourceview5;
function gtk_source_language_get_hidden(language: PGtkSourceLanguage): Tgboolean; cdecl; external libgtksourceview5;
function gtk_source_language_get_metadata(language: PGtkSourceLanguage; Name: Pgchar): Pgchar; cdecl; external libgtksourceview5;
function gtk_source_language_get_mime_types(language: PGtkSourceLanguage): PPgchar; cdecl; external libgtksourceview5;
function gtk_source_language_get_globs(language: PGtkSourceLanguage): PPgchar; cdecl; external libgtksourceview5;
function gtk_source_language_get_style_ids(language: PGtkSourceLanguage): PPgchar; cdecl; external libgtksourceview5;
function gtk_source_language_get_style_name(language: PGtkSourceLanguage; style_id: Pgchar): Pgchar; cdecl; external libgtksourceview5;
function gtk_source_language_get_style_fallback(language: PGtkSourceLanguage; style_id: Pgchar): Pgchar; cdecl; external libgtksourceview5;

// === Konventiert am: 29-3-25 13:46:23 ===

function GTK_SOURCE_TYPE_LANGUAGE: TGType;
function GTK_SOURCE_LANGUAGE(obj: Pointer): PGtkSourceLanguage;
function GTK_SOURCE_IS_LANGUAGE(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_SOURCE_TYPE_LANGUAGE: TGType;
begin
  Result := gtk_source_language_get_type;
end;

function GTK_SOURCE_LANGUAGE(obj: Pointer): PGtkSourceLanguage;
begin
  Result := PGtkSourceLanguage(g_type_check_instance_cast(obj, GTK_SOURCE_TYPE_LANGUAGE));
end;

function GTK_SOURCE_IS_LANGUAGE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_SOURCE_TYPE_LANGUAGE);
end;


{$ENDIF read_implementation}
