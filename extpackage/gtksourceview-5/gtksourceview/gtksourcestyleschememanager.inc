{$IFDEF read_interface}


  {G_DECLARE_FINAL_TYPE (GtkSourceStyleSchemeManager, gtk_source_style_scheme_manager, GTK_SOURCE, STYLE_SCHEME_MANAGER, GObject) }
type
  TGtkSourceStyleSchemeManager = record
  end;
  PGtkSourceStyleSchemeManager = ^TGtkSourceStyleSchemeManager;

  TGtkSourceStyleSchemeManagerClass = record
    parent_class: TGObjectClass;
  end;
  PGtkSourceStyleSchemeManagerClass = ^TGtkSourceStyleSchemeManagerClass;

function gtk_source_style_scheme_manager_get_type: TGType; cdecl; external libgtksourceview5;
function gtk_source_style_scheme_manager_new: PGtkSourceStyleSchemeManager; cdecl; external libgtksourceview5;
function gtk_source_style_scheme_manager_get_default: PGtkSourceStyleSchemeManager; cdecl; external libgtksourceview5;
procedure gtk_source_style_scheme_manager_set_search_path(manager: PGtkSourceStyleSchemeManager; path: PPgchar); cdecl; external libgtksourceview5;
procedure gtk_source_style_scheme_manager_append_search_path(manager: PGtkSourceStyleSchemeManager; path: Pgchar); cdecl; external libgtksourceview5;
procedure gtk_source_style_scheme_manager_prepend_search_path(manager: PGtkSourceStyleSchemeManager; path: Pgchar); cdecl; external libgtksourceview5;
function gtk_source_style_scheme_manager_get_search_path(manager: PGtkSourceStyleSchemeManager): PPgchar; cdecl; external libgtksourceview5;
procedure gtk_source_style_scheme_manager_force_rescan(manager: PGtkSourceStyleSchemeManager); cdecl; external libgtksourceview5;
function gtk_source_style_scheme_manager_get_scheme_ids(manager: PGtkSourceStyleSchemeManager): PPgchar; cdecl; external libgtksourceview5;
function gtk_source_style_scheme_manager_get_scheme(manager: PGtkSourceStyleSchemeManager; scheme_id: Pgchar): PGtkSourceStyleScheme; cdecl; external libgtksourceview5;

// === Konventiert am: 29-3-25 15:07:17 ===

function GTK_SOURCE_TYPE_STYLE_SCHEME_MANAGER: TGType;
function GTK_SOURCE_STYLE_SCHEME_MANAGER(obj: Pointer): PGtkSourceStyleSchemeManager;
function GTK_SOURCE_IS_STYLE_SCHEME_MANAGER(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_SOURCE_TYPE_STYLE_SCHEME_MANAGER: TGType;
begin
  Result := gtk_source_style_scheme_manager_get_type;
end;

function GTK_SOURCE_STYLE_SCHEME_MANAGER(obj: Pointer): PGtkSourceStyleSchemeManager;
begin
  Result := PGtkSourceStyleSchemeManager(g_type_check_instance_cast(obj, GTK_SOURCE_TYPE_STYLE_SCHEME_MANAGER));
end;

function GTK_SOURCE_IS_STYLE_SCHEME_MANAGER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_SOURCE_TYPE_STYLE_SCHEME_MANAGER);
end;




{$ENDIF read_implementation}
