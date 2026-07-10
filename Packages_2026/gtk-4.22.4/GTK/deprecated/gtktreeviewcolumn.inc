

  {$IFDEF read_enum}
type
  PGtkTreeViewColumnSizing = ^TGtkTreeViewColumnSizing;
  TGtkTreeViewColumnSizing = longint;
const
  GTK_TREE_VIEW_COLUMN_GROW_ONLY = 0;
  GTK_TREE_VIEW_COLUMN_AUTOSIZE = 1;
  GTK_TREE_VIEW_COLUMN_FIXED = 2;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGtkTreeViewColumn = type Pointer;
  PPGtkTreeViewColumn = ^PGtkTreeViewColumn;

  TGtkTreeCellDataFunc = procedure(tree_column: PGtkTreeViewColumn; cell: PGtkCellRenderer; tree_model: PGtkTreeModel; iter: PGtkTreeIter; data: Tgpointer); cdecl;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_tree_view_column_get_type: TGType; cdecl; external libgtk4; deprecated;
function gtk_tree_view_column_new: PGtkTreeViewColumn; cdecl; external libgtk4; deprecated;
function gtk_tree_view_column_new_with_area(area: PGtkCellArea): PGtkTreeViewColumn; cdecl; external libgtk4; deprecated;
function gtk_tree_view_column_new_with_attributes(title: pchar; cell: PGtkCellRenderer): PGtkTreeViewColumn; cdecl; varargs; external libgtk4; deprecated;
procedure gtk_tree_view_column_pack_start(tree_column: PGtkTreeViewColumn; cell: PGtkCellRenderer; expand: Tgboolean); cdecl; external libgtk4; deprecated;
procedure gtk_tree_view_column_pack_end(tree_column: PGtkTreeViewColumn; cell: PGtkCellRenderer; expand: Tgboolean); cdecl; external libgtk4; deprecated;
procedure gtk_tree_view_column_clear(tree_column: PGtkTreeViewColumn); cdecl; external libgtk4; deprecated;
procedure gtk_tree_view_column_add_attribute(tree_column: PGtkTreeViewColumn; cell_renderer: PGtkCellRenderer; attribute: pchar; column: longint); cdecl; external libgtk4; deprecated;
procedure gtk_tree_view_column_set_attributes(tree_column: PGtkTreeViewColumn; cell_renderer: PGtkCellRenderer); cdecl; varargs; external libgtk4; deprecated;
procedure gtk_tree_view_column_set_cell_data_func(tree_column: PGtkTreeViewColumn; cell_renderer: PGtkCellRenderer; func: TGtkTreeCellDataFunc; func_data: Tgpointer; destroy: TGDestroyNotify); cdecl; external libgtk4; deprecated;
procedure gtk_tree_view_column_clear_attributes(tree_column: PGtkTreeViewColumn; cell_renderer: PGtkCellRenderer); cdecl; external libgtk4; deprecated;
procedure gtk_tree_view_column_set_spacing(tree_column: PGtkTreeViewColumn; spacing: longint); cdecl; external libgtk4; deprecated;
function gtk_tree_view_column_get_spacing(tree_column: PGtkTreeViewColumn): longint; cdecl; external libgtk4; deprecated;
procedure gtk_tree_view_column_set_visible(tree_column: PGtkTreeViewColumn; visible: Tgboolean); cdecl; external libgtk4; deprecated;
function gtk_tree_view_column_get_visible(tree_column: PGtkTreeViewColumn): Tgboolean; cdecl; external libgtk4; deprecated;
procedure gtk_tree_view_column_set_resizable(tree_column: PGtkTreeViewColumn; resizable: Tgboolean); cdecl; external libgtk4; deprecated;
function gtk_tree_view_column_get_resizable(tree_column: PGtkTreeViewColumn): Tgboolean; cdecl; external libgtk4; deprecated;
procedure gtk_tree_view_column_set_sizing(tree_column: PGtkTreeViewColumn; _type: TGtkTreeViewColumnSizing); cdecl; external libgtk4; deprecated;
function gtk_tree_view_column_get_sizing(tree_column: PGtkTreeViewColumn): TGtkTreeViewColumnSizing; cdecl; external libgtk4; deprecated;
function gtk_tree_view_column_get_x_offset(tree_column: PGtkTreeViewColumn): longint; cdecl; external libgtk4; deprecated;
function gtk_tree_view_column_get_width(tree_column: PGtkTreeViewColumn): longint; cdecl; external libgtk4; deprecated;
function gtk_tree_view_column_get_fixed_width(tree_column: PGtkTreeViewColumn): longint; cdecl; external libgtk4; deprecated;
procedure gtk_tree_view_column_set_fixed_width(tree_column: PGtkTreeViewColumn; fixed_width: longint); cdecl; external libgtk4; deprecated;
procedure gtk_tree_view_column_set_min_width(tree_column: PGtkTreeViewColumn; min_width: longint); cdecl; external libgtk4; deprecated;
function gtk_tree_view_column_get_min_width(tree_column: PGtkTreeViewColumn): longint; cdecl; external libgtk4; deprecated;
procedure gtk_tree_view_column_set_max_width(tree_column: PGtkTreeViewColumn; max_width: longint); cdecl; external libgtk4; deprecated;
function gtk_tree_view_column_get_max_width(tree_column: PGtkTreeViewColumn): longint; cdecl; external libgtk4; deprecated;
procedure gtk_tree_view_column_clicked(tree_column: PGtkTreeViewColumn); cdecl; external libgtk4; deprecated;
procedure gtk_tree_view_column_set_title(tree_column: PGtkTreeViewColumn; title: pchar); cdecl; external libgtk4; deprecated;
function gtk_tree_view_column_get_title(tree_column: PGtkTreeViewColumn): pchar; cdecl; external libgtk4; deprecated;
procedure gtk_tree_view_column_set_expand(tree_column: PGtkTreeViewColumn; expand: Tgboolean); cdecl; external libgtk4; deprecated;
function gtk_tree_view_column_get_expand(tree_column: PGtkTreeViewColumn): Tgboolean; cdecl; external libgtk4; deprecated;
procedure gtk_tree_view_column_set_clickable(tree_column: PGtkTreeViewColumn; clickable: Tgboolean); cdecl; external libgtk4; deprecated;
function gtk_tree_view_column_get_clickable(tree_column: PGtkTreeViewColumn): Tgboolean; cdecl; external libgtk4; deprecated;
procedure gtk_tree_view_column_set_widget(tree_column: PGtkTreeViewColumn; widget: PGtkWidget); cdecl; external libgtk4; deprecated;
function gtk_tree_view_column_get_widget(tree_column: PGtkTreeViewColumn): PGtkWidget; cdecl; external libgtk4; deprecated;
procedure gtk_tree_view_column_set_alignment(tree_column: PGtkTreeViewColumn; xalign: single); cdecl; external libgtk4; deprecated;
function gtk_tree_view_column_get_alignment(tree_column: PGtkTreeViewColumn): single; cdecl; external libgtk4; deprecated;
procedure gtk_tree_view_column_set_reorderable(tree_column: PGtkTreeViewColumn; reorderable: Tgboolean); cdecl; external libgtk4; deprecated;
function gtk_tree_view_column_get_reorderable(tree_column: PGtkTreeViewColumn): Tgboolean; cdecl; external libgtk4; deprecated;
procedure gtk_tree_view_column_set_sort_column_id(tree_column: PGtkTreeViewColumn; sort_column_id: longint); cdecl; external libgtk4; deprecated;
function gtk_tree_view_column_get_sort_column_id(tree_column: PGtkTreeViewColumn): longint; cdecl; external libgtk4; deprecated;
procedure gtk_tree_view_column_set_sort_indicator(tree_column: PGtkTreeViewColumn; setting: Tgboolean); cdecl; external libgtk4; deprecated;
function gtk_tree_view_column_get_sort_indicator(tree_column: PGtkTreeViewColumn): Tgboolean; cdecl; external libgtk4; deprecated;
procedure gtk_tree_view_column_set_sort_order(tree_column: PGtkTreeViewColumn; order: TGtkSortType); cdecl; external libgtk4; deprecated;
function gtk_tree_view_column_get_sort_order(tree_column: PGtkTreeViewColumn): TGtkSortType; cdecl; external libgtk4; deprecated;
procedure gtk_tree_view_column_cell_set_cell_data(tree_column: PGtkTreeViewColumn; tree_model: PGtkTreeModel; iter: PGtkTreeIter; is_expander: Tgboolean; is_expanded: Tgboolean); cdecl; external libgtk4; deprecated;
procedure gtk_tree_view_column_cell_get_size(tree_column: PGtkTreeViewColumn; x_offset: Plongint; y_offset: Plongint; width: Plongint; height: Plongint); cdecl; external libgtk4; deprecated;
function gtk_tree_view_column_cell_is_visible(tree_column: PGtkTreeViewColumn): Tgboolean; cdecl; external libgtk4; deprecated;
procedure gtk_tree_view_column_focus_cell(tree_column: PGtkTreeViewColumn; cell: PGtkCellRenderer); cdecl; external libgtk4; deprecated;
function gtk_tree_view_column_cell_get_position(tree_column: PGtkTreeViewColumn; cell_renderer: PGtkCellRenderer; x_offset: Plongint; width: Plongint): Tgboolean; cdecl; external libgtk4; deprecated;
procedure gtk_tree_view_column_queue_resize(tree_column: PGtkTreeViewColumn); cdecl; external libgtk4; deprecated;
function gtk_tree_view_column_get_tree_view(tree_column: PGtkTreeViewColumn): PGtkWidget; cdecl; external libgtk4; deprecated;
function gtk_tree_view_column_get_button(tree_column: PGtkTreeViewColumn): PGtkWidget; cdecl; external libgtk4; deprecated;

// === Konventiert am: 9-7-26 19:51:51 ===

function GTK_TYPE_TREE_VIEW_COLUMN: TGType;
function GTK_TREE_VIEW_COLUMN(obj: Pointer): PGtkTreeViewColumn;
function GTK_IS_TREE_VIEW_COLUMN(obj: Pointer): Tgboolean;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GTK_TYPE_TREE_VIEW_COLUMN: TGType;
begin
  GTK_TYPE_TREE_VIEW_COLUMN := gtk_tree_view_column_get_type;
end;

function GTK_TREE_VIEW_COLUMN(obj: Pointer): PGtkTreeViewColumn;
begin
  Result := PGtkTreeViewColumn(g_type_check_instance_cast(obj, GTK_TYPE_TREE_VIEW_COLUMN));
end;

function GTK_IS_TREE_VIEW_COLUMN(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_TREE_VIEW_COLUMN);
end;



{$ENDIF read_implementation}
