

  {$IFDEF read_enum}
type
  PGtkTreeModelFlags = ^TGtkTreeModelFlags;
  TGtkTreeModelFlags = longint;
const
  GTK_TREE_MODEL_ITERS_PERSIST = 1 shl 0;
  GTK_TREE_MODEL_LIST_ONLY = 1 shl 1;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGtkTreeModel = type Pointer;
  PPGtkTreeModel = ^PGtkTreeModel;
  PGtkTreePath = type Pointer;
  PPGtkTreePath = ^PGtkTreePath;
  PGtkTreeRowReference = type Pointer;

  PGtkTreeIter = ^TGtkTreeIter;
  TGtkTreeIter = record
    stamp: longint;
    user_data: Tgpointer;
    user_data2: Tgpointer;
    user_data3: Tgpointer;
  end;

  TGtkTreeModelForeachFunc = function(model: PGtkTreeModel; path: PGtkTreePath; iter: PGtkTreeIter; data: Tgpointer): Tgboolean; cdecl;

  PGtkTreeModelIface = ^TGtkTreeModelIface;
  TGtkTreeModelIface = record
    g_iface: TGTypeInterface;
    row_changed: procedure(tree_model: PGtkTreeModel; path: PGtkTreePath; iter: PGtkTreeIter); cdecl;
    row_inserted: procedure(tree_model: PGtkTreeModel; path: PGtkTreePath; iter: PGtkTreeIter); cdecl;
    row_has_child_toggled: procedure(tree_model: PGtkTreeModel; path: PGtkTreePath; iter: PGtkTreeIter); cdecl;
    row_deleted: procedure(tree_model: PGtkTreeModel; path: PGtkTreePath); cdecl;
    rows_reordered: procedure(tree_model: PGtkTreeModel; path: PGtkTreePath; iter: PGtkTreeIter; new_order: Plongint); cdecl;
    get_flags: function(tree_model: PGtkTreeModel): TGtkTreeModelFlags; cdecl;
    get_n_columns: function(tree_model: PGtkTreeModel): longint; cdecl;
    get_column_type: function(tree_model: PGtkTreeModel; index_: longint): TGType; cdecl;
    get_iter: function(tree_model: PGtkTreeModel; iter: PGtkTreeIter; path: PGtkTreePath): Tgboolean; cdecl;
    get_path: function(tree_model: PGtkTreeModel; iter: PGtkTreeIter): PGtkTreePath; cdecl;
    get_value: procedure(tree_model: PGtkTreeModel; iter: PGtkTreeIter; column: longint; value: PGValue); cdecl;
    iter_next: function(tree_model: PGtkTreeModel; iter: PGtkTreeIter): Tgboolean; cdecl;
    iter_previous: function(tree_model: PGtkTreeModel; iter: PGtkTreeIter): Tgboolean; cdecl;
    iter_children: function(tree_model: PGtkTreeModel; iter: PGtkTreeIter; parent: PGtkTreeIter): Tgboolean; cdecl;
    iter_has_child: function(tree_model: PGtkTreeModel; iter: PGtkTreeIter): Tgboolean; cdecl;
    iter_n_children: function(tree_model: PGtkTreeModel; iter: PGtkTreeIter): longint; cdecl;
    iter_nth_child: function(tree_model: PGtkTreeModel; iter: PGtkTreeIter; parent: PGtkTreeIter; n: longint): Tgboolean; cdecl;
    iter_parent: function(tree_model: PGtkTreeModel; iter: PGtkTreeIter; child: PGtkTreeIter): Tgboolean; cdecl;
    ref_node: procedure(tree_model: PGtkTreeModel; iter: PGtkTreeIter); cdecl;
    unref_node: procedure(tree_model: PGtkTreeModel; iter: PGtkTreeIter); cdecl;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_tree_path_new: PGtkTreePath; cdecl; external libgtk4; deprecated;
function gtk_tree_path_new_from_string(path: pchar): PGtkTreePath; cdecl; external libgtk4; deprecated;
function gtk_tree_path_new_from_indices(first_index: longint): PGtkTreePath; cdecl; varargs; external libgtk4; deprecated;
function gtk_tree_path_new_from_indicesv(indices: Plongint; length: Tgsize): PGtkTreePath; cdecl; external libgtk4; deprecated;
function gtk_tree_path_to_string(path: PGtkTreePath): pchar; cdecl; external libgtk4; deprecated;
function gtk_tree_path_new_first: PGtkTreePath; cdecl; external libgtk4; deprecated;
procedure gtk_tree_path_append_index(path: PGtkTreePath; index_: longint); cdecl; external libgtk4; deprecated;
procedure gtk_tree_path_prepend_index(path: PGtkTreePath; index_: longint); cdecl; external libgtk4; deprecated;
function gtk_tree_path_get_depth(path: PGtkTreePath): longint; cdecl; external libgtk4; deprecated;
function gtk_tree_path_get_indices(path: PGtkTreePath): Plongint; cdecl; external libgtk4; deprecated;
function gtk_tree_path_get_indices_with_depth(path: PGtkTreePath; depth: Plongint): Plongint; cdecl; external libgtk4; deprecated;
procedure gtk_tree_path_free(path: PGtkTreePath); cdecl; external libgtk4; deprecated;
function gtk_tree_path_copy(path: PGtkTreePath): PGtkTreePath; cdecl; external libgtk4; deprecated;
function gtk_tree_path_get_type: TGType; cdecl; external libgtk4; deprecated;
function gtk_tree_path_compare(a: PGtkTreePath; b: PGtkTreePath): longint; cdecl; external libgtk4; deprecated;
procedure gtk_tree_path_next(path: PGtkTreePath); cdecl; external libgtk4; deprecated;
function gtk_tree_path_prev(path: PGtkTreePath): Tgboolean; cdecl; external libgtk4; deprecated;
function gtk_tree_path_up(path: PGtkTreePath): Tgboolean; cdecl; external libgtk4; deprecated;
procedure gtk_tree_path_down(path: PGtkTreePath); cdecl; external libgtk4; deprecated;
function gtk_tree_path_is_ancestor(path: PGtkTreePath; descendant: PGtkTreePath): Tgboolean; cdecl; external libgtk4; deprecated;
function gtk_tree_path_is_descendant(path: PGtkTreePath; ancestor: PGtkTreePath): Tgboolean; cdecl; external libgtk4; deprecated;
function gtk_tree_row_reference_get_type: TGType; cdecl; external libgtk4; deprecated;
function gtk_tree_row_reference_new(model: PGtkTreeModel; path: PGtkTreePath): PGtkTreeRowReference; cdecl; external libgtk4; deprecated;
function gtk_tree_row_reference_new_proxy(proxy: PGObject; model: PGtkTreeModel; path: PGtkTreePath): PGtkTreeRowReference; cdecl; external libgtk4; deprecated;
function gtk_tree_row_reference_get_path(reference: PGtkTreeRowReference): PGtkTreePath; cdecl; external libgtk4; deprecated;
function gtk_tree_row_reference_get_model(reference: PGtkTreeRowReference): PGtkTreeModel; cdecl; external libgtk4; deprecated;
function gtk_tree_row_reference_valid(reference: PGtkTreeRowReference): Tgboolean; cdecl; external libgtk4; deprecated;
function gtk_tree_row_reference_copy(reference: PGtkTreeRowReference): PGtkTreeRowReference; cdecl; external libgtk4; deprecated;
procedure gtk_tree_row_reference_free(reference: PGtkTreeRowReference); cdecl; external libgtk4; deprecated;
procedure gtk_tree_row_reference_inserted(proxy: PGObject; path: PGtkTreePath); cdecl; external libgtk4; deprecated;
procedure gtk_tree_row_reference_deleted(proxy: PGObject; path: PGtkTreePath); cdecl; external libgtk4; deprecated;
procedure gtk_tree_row_reference_reordered(proxy: PGObject; path: PGtkTreePath; iter: PGtkTreeIter; new_order: Plongint); cdecl; external libgtk4; deprecated;
function gtk_tree_iter_copy(iter: PGtkTreeIter): PGtkTreeIter; cdecl; external libgtk4; deprecated;
procedure gtk_tree_iter_free(iter: PGtkTreeIter); cdecl; external libgtk4; deprecated;
function gtk_tree_iter_get_type: TGType; cdecl; external libgtk4; deprecated;
function gtk_tree_model_get_type: TGType; cdecl; external libgtk4; deprecated;
function gtk_tree_model_get_flags(tree_model: PGtkTreeModel): TGtkTreeModelFlags; cdecl; external libgtk4; deprecated;
function gtk_tree_model_get_n_columns(tree_model: PGtkTreeModel): longint; cdecl; external libgtk4; deprecated;
function gtk_tree_model_get_column_type(tree_model: PGtkTreeModel; index_: longint): TGType; cdecl; external libgtk4; deprecated;
function gtk_tree_model_get_iter(tree_model: PGtkTreeModel; iter: PGtkTreeIter; path: PGtkTreePath): Tgboolean; cdecl; external libgtk4; deprecated;
function gtk_tree_model_get_iter_from_string(tree_model: PGtkTreeModel; iter: PGtkTreeIter; path_string: pchar): Tgboolean; cdecl; external libgtk4; deprecated;
function gtk_tree_model_get_string_from_iter(tree_model: PGtkTreeModel; iter: PGtkTreeIter): pchar; cdecl; external libgtk4; deprecated;
function gtk_tree_model_get_iter_first(tree_model: PGtkTreeModel; iter: PGtkTreeIter): Tgboolean; cdecl; external libgtk4; deprecated;
function gtk_tree_model_get_path(tree_model: PGtkTreeModel; iter: PGtkTreeIter): PGtkTreePath; cdecl; external libgtk4; deprecated;
procedure gtk_tree_model_get_value(tree_model: PGtkTreeModel; iter: PGtkTreeIter; column: longint; value: PGValue); cdecl; external libgtk4; deprecated;
function gtk_tree_model_iter_previous(tree_model: PGtkTreeModel; iter: PGtkTreeIter): Tgboolean; cdecl; external libgtk4; deprecated;
function gtk_tree_model_iter_next(tree_model: PGtkTreeModel; iter: PGtkTreeIter): Tgboolean; cdecl; external libgtk4; deprecated;
function gtk_tree_model_iter_children(tree_model: PGtkTreeModel; iter: PGtkTreeIter; parent: PGtkTreeIter): Tgboolean; cdecl; external libgtk4; deprecated;
function gtk_tree_model_iter_has_child(tree_model: PGtkTreeModel; iter: PGtkTreeIter): Tgboolean; cdecl; external libgtk4; deprecated;
function gtk_tree_model_iter_n_children(tree_model: PGtkTreeModel; iter: PGtkTreeIter): longint; cdecl; external libgtk4; deprecated;
function gtk_tree_model_iter_nth_child(tree_model: PGtkTreeModel; iter: PGtkTreeIter; parent: PGtkTreeIter; n: longint): Tgboolean; cdecl; external libgtk4; deprecated;
function gtk_tree_model_iter_parent(tree_model: PGtkTreeModel; iter: PGtkTreeIter; child: PGtkTreeIter): Tgboolean; cdecl; external libgtk4; deprecated;
procedure gtk_tree_model_ref_node(tree_model: PGtkTreeModel; iter: PGtkTreeIter); cdecl; external libgtk4; deprecated;
procedure gtk_tree_model_unref_node(tree_model: PGtkTreeModel; iter: PGtkTreeIter); cdecl; external libgtk4; deprecated;
procedure gtk_tree_model_get(tree_model: PGtkTreeModel; iter: PGtkTreeIter); cdecl; varargs; external libgtk4; deprecated;
procedure gtk_tree_model_get_valist(tree_model: PGtkTreeModel; iter: PGtkTreeIter; var_args: Tva_list); cdecl; external libgtk4; deprecated;
procedure gtk_tree_model_foreach(model: PGtkTreeModel; func: TGtkTreeModelForeachFunc; user_data: Tgpointer); cdecl; external libgtk4; deprecated;
procedure gtk_tree_model_row_changed(tree_model: PGtkTreeModel; path: PGtkTreePath; iter: PGtkTreeIter); cdecl; external libgtk4; deprecated;
procedure gtk_tree_model_row_inserted(tree_model: PGtkTreeModel; path: PGtkTreePath; iter: PGtkTreeIter); cdecl; external libgtk4; deprecated;
procedure gtk_tree_model_row_has_child_toggled(tree_model: PGtkTreeModel; path: PGtkTreePath; iter: PGtkTreeIter); cdecl; external libgtk4; deprecated;
procedure gtk_tree_model_row_deleted(tree_model: PGtkTreeModel; path: PGtkTreePath); cdecl; external libgtk4; deprecated;
procedure gtk_tree_model_rows_reordered(tree_model: PGtkTreeModel; path: PGtkTreePath; iter: PGtkTreeIter; new_order: Plongint); cdecl; external libgtk4; deprecated;
procedure gtk_tree_model_rows_reordered_with_length(tree_model: PGtkTreeModel; path: PGtkTreePath; iter: PGtkTreeIter; new_order: Plongint; length: longint); cdecl; external libgtk4; deprecated;

// === Konventiert am: 9-7-26 19:52:54 ===

function GTK_TYPE_TREE_MODEL: TGType;
function GTK_TREE_MODEL(obj: Pointer): PGtkTreeModel;
function GTK_IS_TREE_MODEL(obj: Pointer): Tgboolean;
function GTK_TREE_MODEL_GET_IFACE(obj: Pointer): PGtkTreeModelIface;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GTK_TYPE_TREE_MODEL: TGType;
begin
  GTK_TYPE_TREE_MODEL := gtk_tree_model_get_type;
end;

function GTK_TREE_MODEL(obj: Pointer): PGtkTreeModel;
begin
  Result := PGtkTreeModel(g_type_check_instance_cast(obj, GTK_TYPE_TREE_MODEL));
end;

function GTK_IS_TREE_MODEL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_TREE_MODEL);
end;

function GTK_TREE_MODEL_GET_IFACE(obj: Pointer): PGtkTreeModelIface;
begin
  Result := g_type_interface_peek(obj, GTK_TYPE_TREE_MODEL);
end;


{ was #define dname def_expr }
function GTK_TYPE_TREE_ITER: longint; { return type might be wrong }
begin
  GTK_TYPE_TREE_ITER := gtk_tree_iter_get_type;
end;

{ was #define dname def_expr }
function GTK_TYPE_TREE_PATH: longint; { return type might be wrong }
begin
  GTK_TYPE_TREE_PATH := gtk_tree_path_get_type;
end;

{ was #define dname def_expr }
function GTK_TYPE_TREE_ROW_REFERENCE: longint; { return type might be wrong }
begin
  GTK_TYPE_TREE_ROW_REFERENCE := gtk_tree_row_reference_get_type;
end;


{$ENDIF read_implementation}
