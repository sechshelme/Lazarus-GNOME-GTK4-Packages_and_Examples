
  {$IFDEF read_struct}
type
  TGtkTreeListModelCreateModelFunc = function(item: Tgpointer; user_data: Tgpointer): PGListModel; cdecl;

  PGtkTreeListModel = type Pointer;

  TGtkTreeListModelClass = record
    parent_class: TGObjectClass;
  end;
  PGtkTreeListModelClass = ^TGtkTreeListModelClass;

  PGtkTreeListRow = type Pointer;

  TGtkTreeListRowClass = record
    parent_class: TGObjectClass;
  end;
  PGtkTreeListRowClass = ^TGtkTreeListRowClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_tree_list_model_get_type: TGType; cdecl; external libgtk4;
function gtk_tree_list_model_new(root: PGListModel; passthrough: Tgboolean; autoexpand: Tgboolean; create_func: TGtkTreeListModelCreateModelFunc; user_data: Tgpointer;
  user_destroy: TGDestroyNotify): PGtkTreeListModel; cdecl; external libgtk4;
function gtk_tree_list_model_get_model(self: PGtkTreeListModel): PGListModel; cdecl; external libgtk4;
function gtk_tree_list_model_get_passthrough(self: PGtkTreeListModel): Tgboolean; cdecl; external libgtk4;
procedure gtk_tree_list_model_set_autoexpand(self: PGtkTreeListModel; autoexpand: Tgboolean); cdecl; external libgtk4;
function gtk_tree_list_model_get_autoexpand(self: PGtkTreeListModel): Tgboolean; cdecl; external libgtk4;
function gtk_tree_list_model_get_child_row(self: PGtkTreeListModel; position: Tguint): PGtkTreeListRow; cdecl; external libgtk4;
function gtk_tree_list_model_get_row(self: PGtkTreeListModel; position: Tguint): PGtkTreeListRow; cdecl; external libgtk4;

function gtk_tree_list_row_get_type: TGType; cdecl; external libgtk4;
function gtk_tree_list_row_get_item(self: PGtkTreeListRow): Tgpointer; cdecl; external libgtk4;
procedure gtk_tree_list_row_set_expanded(self: PGtkTreeListRow; expanded: Tgboolean); cdecl; external libgtk4;
function gtk_tree_list_row_get_expanded(self: PGtkTreeListRow): Tgboolean; cdecl; external libgtk4;
function gtk_tree_list_row_is_expandable(self: PGtkTreeListRow): Tgboolean; cdecl; external libgtk4;
function gtk_tree_list_row_get_position(self: PGtkTreeListRow): Tguint; cdecl; external libgtk4;
function gtk_tree_list_row_get_depth(self: PGtkTreeListRow): Tguint; cdecl; external libgtk4;
function gtk_tree_list_row_get_children(self: PGtkTreeListRow): PGListModel; cdecl; external libgtk4;
function gtk_tree_list_row_get_parent(self: PGtkTreeListRow): PGtkTreeListRow; cdecl; external libgtk4;
function gtk_tree_list_row_get_child_row(self: PGtkTreeListRow; position: Tguint): PGtkTreeListRow; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 16:20:02 ===

function GTK_TYPE_TREE_LIST_MODEL: TGType;
function GTK_TREE_LIST_MODEL(obj: Pointer): PGtkTreeListModel;
function GTK_IS_TREE_LIST_MODEL(obj: Pointer): Tgboolean;

function GTK_TYPE_TREE_LIST_ROW: TGType;
function GTK_TREE_LIST_ROW(obj: Pointer): PGtkTreeListRow;
function GTK_IS_TREE_LIST_ROW(obj: Pointer): Tgboolean;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GTK_TYPE_TREE_LIST_MODEL: TGType;
begin
  Result := gtk_tree_list_model_get_type;
end;

function GTK_TREE_LIST_MODEL(obj: Pointer): PGtkTreeListModel;
begin
  Result := PGtkTreeListModel(g_type_check_instance_cast(obj, GTK_TYPE_TREE_LIST_MODEL));
end;

function GTK_IS_TREE_LIST_MODEL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_TREE_LIST_MODEL);
end;


function GTK_TYPE_TREE_LIST_ROW: TGType;
begin
  Result := gtk_tree_list_row_get_type;
end;

function GTK_TREE_LIST_ROW(obj: Pointer): PGtkTreeListRow;
begin
  Result := PGtkTreeListRow(g_type_check_instance_cast(obj, GTK_TYPE_TREE_LIST_ROW));
end;

function GTK_IS_TREE_LIST_ROW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_TREE_LIST_ROW);
end;

{$ENDIF read_implementation}
