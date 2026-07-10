

  {$IFDEF read_struct}
type
  PGtkTreeSelection = type Pointer;

  TGtkTreeSelectionFunc = function(selection: PGtkTreeSelection; model: PGtkTreeModel; path: PGtkTreePath; path_currently_selected: Tgboolean; data: Tgpointer): Tgboolean; cdecl;
  TGtkTreeSelectionForeachFunc = procedure(model: PGtkTreeModel; path: PGtkTreePath; iter: PGtkTreeIter; data: Tgpointer); cdecl;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_tree_selection_get_type: TGType; cdecl; external libgtk4; deprecated;
procedure gtk_tree_selection_set_mode(selection: PGtkTreeSelection; _type: TGtkSelectionMode); cdecl; external libgtk4; deprecated;
function gtk_tree_selection_get_mode(selection: PGtkTreeSelection): TGtkSelectionMode; cdecl; external libgtk4; deprecated;
procedure gtk_tree_selection_set_select_function(selection: PGtkTreeSelection; func: TGtkTreeSelectionFunc; data: Tgpointer; destroy: TGDestroyNotify); cdecl; external libgtk4; deprecated;
function gtk_tree_selection_get_user_data(selection: PGtkTreeSelection): Tgpointer; cdecl; external libgtk4; deprecated;
function gtk_tree_selection_get_tree_view(selection: PGtkTreeSelection): PGtkTreeView; cdecl; external libgtk4; deprecated;
function gtk_tree_selection_get_select_function(selection: PGtkTreeSelection): TGtkTreeSelectionFunc; cdecl; external libgtk4; deprecated;
function gtk_tree_selection_get_selected(selection: PGtkTreeSelection; model: PPGtkTreeModel; iter: PGtkTreeIter): Tgboolean; cdecl; external libgtk4; deprecated;
function gtk_tree_selection_get_selected_rows(selection: PGtkTreeSelection; model: PPGtkTreeModel): PGList; cdecl; external libgtk4; deprecated;
function gtk_tree_selection_count_selected_rows(selection: PGtkTreeSelection): longint; cdecl; external libgtk4; deprecated;
procedure gtk_tree_selection_selected_foreach(selection: PGtkTreeSelection; func: TGtkTreeSelectionForeachFunc; data: Tgpointer); cdecl; external libgtk4; deprecated;
procedure gtk_tree_selection_select_path(selection: PGtkTreeSelection; path: PGtkTreePath); cdecl; external libgtk4; deprecated;
procedure gtk_tree_selection_unselect_path(selection: PGtkTreeSelection; path: PGtkTreePath); cdecl; external libgtk4; deprecated;
procedure gtk_tree_selection_select_iter(selection: PGtkTreeSelection; iter: PGtkTreeIter); cdecl; external libgtk4; deprecated;
procedure gtk_tree_selection_unselect_iter(selection: PGtkTreeSelection; iter: PGtkTreeIter); cdecl; external libgtk4; deprecated;
function gtk_tree_selection_path_is_selected(selection: PGtkTreeSelection; path: PGtkTreePath): Tgboolean; cdecl; external libgtk4; deprecated;
function gtk_tree_selection_iter_is_selected(selection: PGtkTreeSelection; iter: PGtkTreeIter): Tgboolean; cdecl; external libgtk4; deprecated;
procedure gtk_tree_selection_select_all(selection: PGtkTreeSelection); cdecl; external libgtk4; deprecated;
procedure gtk_tree_selection_unselect_all(selection: PGtkTreeSelection); cdecl; external libgtk4; deprecated;
procedure gtk_tree_selection_select_range(selection: PGtkTreeSelection; start_path: PGtkTreePath; end_path: PGtkTreePath); cdecl; external libgtk4; deprecated;
procedure gtk_tree_selection_unselect_range(selection: PGtkTreeSelection; start_path: PGtkTreePath; end_path: PGtkTreePath); cdecl; external libgtk4; deprecated;

// === Konventiert am: 9-7-26 19:52:25 ===

function GTK_TYPE_TREE_SELECTION: TGType;
function GTK_TREE_SELECTION(obj: Pointer): PGtkTreeSelection;
function GTK_IS_TREE_SELECTION(obj: Pointer): Tgboolean;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GTK_TYPE_TREE_SELECTION: TGType;
begin
  GTK_TYPE_TREE_SELECTION := gtk_tree_selection_get_type;
end;

function GTK_TREE_SELECTION(obj: Pointer): PGtkTreeSelection;
begin
  Result := PGtkTreeSelection(g_type_check_instance_cast(obj, GTK_TYPE_TREE_SELECTION));
end;

function GTK_IS_TREE_SELECTION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_TREE_SELECTION);
end;



{$ENDIF read_implementation}
