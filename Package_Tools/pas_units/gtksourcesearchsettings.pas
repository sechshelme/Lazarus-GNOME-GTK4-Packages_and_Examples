unit gtksourcesearchsettings;

interface

uses
  fp_glib2, fp_GTK4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {G_DECLARE_DERIVABLE_TYPE (GtkSourceSearchSettings, gtk_source_search_settings, GTK_SOURCE, SEARCH_SETTINGS, GObject) }
type
  TGtkSourceSearchSettings = record
    parent_instance: TGObject;
  end;
  PGtkSourceSearchSettings = ^TGtkSourceSearchSettings;

  TGtkSourceSearchSettingsClass = record
    parent_class: TGObjectClass;
    _reserved: array[0..9] of Tgpointer;
  end;
  PGtkSourceSearchSettingsClass = ^TGtkSourceSearchSettingsClass;

function gtk_source_search_settings_get_type: TGType; cdecl; external libgtksourceview5;
function gtk_source_search_settings_new: PGtkSourceSearchSettings; cdecl; external libgtksourceview5;
procedure gtk_source_search_settings_set_search_text(settings: PGtkSourceSearchSettings; search_text: Pgchar); cdecl; external libgtksourceview5;
function gtk_source_search_settings_get_search_text(settings: PGtkSourceSearchSettings): Pgchar; cdecl; external libgtksourceview5;
procedure gtk_source_search_settings_set_case_sensitive(settings: PGtkSourceSearchSettings; case_sensitive: Tgboolean); cdecl; external libgtksourceview5;
function gtk_source_search_settings_get_case_sensitive(settings: PGtkSourceSearchSettings): Tgboolean; cdecl; external libgtksourceview5;
procedure gtk_source_search_settings_set_at_word_boundaries(settings: PGtkSourceSearchSettings; at_word_boundaries: Tgboolean); cdecl; external libgtksourceview5;
function gtk_source_search_settings_get_at_word_boundaries(settings: PGtkSourceSearchSettings): Tgboolean; cdecl; external libgtksourceview5;
procedure gtk_source_search_settings_set_wrap_around(settings: PGtkSourceSearchSettings; wrap_around: Tgboolean); cdecl; external libgtksourceview5;
function gtk_source_search_settings_get_wrap_around(settings: PGtkSourceSearchSettings): Tgboolean; cdecl; external libgtksourceview5;
procedure gtk_source_search_settings_set_regex_enabled(settings: PGtkSourceSearchSettings; regex_enabled: Tgboolean); cdecl; external libgtksourceview5;
function gtk_source_search_settings_get_regex_enabled(settings: PGtkSourceSearchSettings): Tgboolean; cdecl; external libgtksourceview5;
function gtk_source_search_settings_get_visible_only(settings: PGtkSourceSearchSettings): Tgboolean; cdecl; external libgtksourceview5;
procedure gtk_source_search_settings_set_visible_only(settings: PGtkSourceSearchSettings; visible_only: Tgboolean); cdecl; external libgtksourceview5;

// === Konventiert am: 29-3-25 16:53:43 ===

function GTK_SOURCE_TYPE_SEARCH_SETTINGS: TGType;
function GTK_SOURCE_SEARCH_SETTINGS(obj: Pointer): PGtkSourceSearchSettings;
function GTK_SOURCE_IS_SEARCH_SETTINGS(obj: Pointer): Tgboolean;
function GTK_SOURCE_SEARCH_SETTINGS_CLASS(klass: Pointer): PGtkSourceSearchSettingsClass;
function GTK_SOURCE_IS_SEARCH_SETTINGS_CLASS(klass: Pointer): Tgboolean;
function GTK_SOURCE_SEARCH_SETTINGS_GET_CLASS(obj: Pointer): PGtkSourceSearchSettingsClass;

implementation

function GTK_SOURCE_TYPE_SEARCH_SETTINGS: TGType;
begin
  Result := gtk_source_search_settings_get_type;
end;

function GTK_SOURCE_SEARCH_SETTINGS(obj: Pointer): PGtkSourceSearchSettings;
begin
  Result := PGtkSourceSearchSettings(g_type_check_instance_cast(obj, GTK_SOURCE_TYPE_SEARCH_SETTINGS));
end;

function GTK_SOURCE_IS_SEARCH_SETTINGS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_SOURCE_TYPE_SEARCH_SETTINGS);
end;

function GTK_SOURCE_SEARCH_SETTINGS_CLASS(klass: Pointer): PGtkSourceSearchSettingsClass;
begin
  Result := PGtkSourceSearchSettingsClass(g_type_check_class_cast(klass, GTK_SOURCE_TYPE_SEARCH_SETTINGS));
end;

function GTK_SOURCE_IS_SEARCH_SETTINGS_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_SOURCE_TYPE_SEARCH_SETTINGS);
end;

function GTK_SOURCE_SEARCH_SETTINGS_GET_CLASS(obj: Pointer): PGtkSourceSearchSettingsClass;
begin
  Result := PGtkSourceSearchSettingsClass(PGTypeInstance(obj)^.g_class);
end;


end.
