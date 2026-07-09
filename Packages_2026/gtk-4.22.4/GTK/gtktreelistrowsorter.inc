

  {$IFDEF read_struct}
type
  PGtkTreeListRowSorter = type Pointer;

  TGtkTreeListRowSorterClass = record
    parent_class: TGtkSorterClass;
  end;
  PGtkTreeListRowSorterClass = ^TGtkTreeListRowSorterClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_tree_list_row_sorter_get_type: TGType; cdecl; external libgtk4;
function gtk_tree_list_row_sorter_new(sorter: PGtkSorter): PGtkTreeListRowSorter; cdecl; external libgtk4;
function gtk_tree_list_row_sorter_get_sorter(self: PGtkTreeListRowSorter): PGtkSorter; cdecl; external libgtk4;
procedure gtk_tree_list_row_sorter_set_sorter(self: PGtkTreeListRowSorter; sorter: PGtkSorter); cdecl; external libgtk4;

// === Konventiert am: 6-7-26 17:14:02 ===

function GTK_TYPE_TREE_LIST_ROW_SORTER: TGType;
function GTK_TREE_LIST_ROW_SORTER(obj: Pointer): PGtkTreeListRowSorter;
function GTK_IS_TREE_LIST_ROW_SORTER(obj: Pointer): Tgboolean;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GTK_TYPE_TREE_LIST_ROW_SORTER: TGType;
begin
  Result := gtk_tree_list_row_sorter_get_type;
end;

function GTK_TREE_LIST_ROW_SORTER(obj: Pointer): PGtkTreeListRowSorter;
begin
  Result := PGtkTreeListRowSorter(g_type_check_instance_cast(obj, GTK_TYPE_TREE_LIST_ROW_SORTER));
end;

function GTK_IS_TREE_LIST_ROW_SORTER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_TREE_LIST_ROW_SORTER);
end;

{$ENDIF read_implementation}
