{$IFDEF read_interface}


  {G_DECLARE_FINAL_TYPE (GtkSourceSnippetManager, gtk_source_snippet_manager, GTK_SOURCE, SNIPPET_MANAGER, GObject) }
type
  TGtkSourceSnippetManager = record
  end;
  PGtkSourceSnippetManager = ^TGtkSourceSnippetManager;

  TGtkSourceSnippetManagerClass = record
    parent_class: TGObjectClass;
  end;
  PGtkSourceSnippetManagerClass = ^TGtkSourceSnippetManagerClass;

function gtk_source_snippet_manager_get_type: TGType; cdecl; external libgtksourceview5;
function gtk_source_snippet_manager_get_default: PGtkSourceSnippetManager; cdecl; external libgtksourceview5;
function gtk_source_snippet_manager_get_search_path(self: PGtkSourceSnippetManager): PPgchar; cdecl; external libgtksourceview5;
procedure gtk_source_snippet_manager_set_search_path(self: PGtkSourceSnippetManager; dirs: PPgchar); cdecl; external libgtksourceview5;
function gtk_source_snippet_manager_get_snippet(self: PGtkSourceSnippetManager; group: Pgchar; language_id: Pgchar; trigger: Pgchar): PGtkSourceSnippet; cdecl; external libgtksourceview5;
function gtk_source_snippet_manager_list_groups(self: PGtkSourceSnippetManager): PPgchar; cdecl; external libgtksourceview5;
function gtk_source_snippet_manager_list_matching(self: PGtkSourceSnippetManager; group: Pgchar; language_id: Pgchar; trigger_prefix: Pgchar): PGListModel; cdecl; external libgtksourceview5;
function gtk_source_snippet_manager_list_all(self: PGtkSourceSnippetManager): PGListModel; cdecl; external libgtksourceview5;

// === Konventiert am: 29-3-25 17:25:03 ===

function GTK_SOURCE_TYPE_SNIPPET_MANAGER: TGType;
function GTK_SOURCE_SNIPPET_MANAGER(obj: Pointer): PGtkSourceSnippetManager;
function GTK_SOURCE_IS_SNIPPET_MANAGER(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_SOURCE_TYPE_SNIPPET_MANAGER: TGType;
begin
  Result := gtk_source_snippet_manager_get_type;
end;

function GTK_SOURCE_SNIPPET_MANAGER(obj: Pointer): PGtkSourceSnippetManager;
begin
  Result := PGtkSourceSnippetManager(g_type_check_instance_cast(obj, GTK_SOURCE_TYPE_SNIPPET_MANAGER));
end;

function GTK_SOURCE_IS_SNIPPET_MANAGER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_SOURCE_TYPE_SNIPPET_MANAGER);
end;


{$ENDIF read_implementation}
