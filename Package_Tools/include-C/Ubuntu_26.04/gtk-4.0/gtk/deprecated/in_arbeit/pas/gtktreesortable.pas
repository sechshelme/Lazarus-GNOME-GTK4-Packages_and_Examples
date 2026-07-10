unit gtktreesortable;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
const
  GTK_TREE_SORTABLE_DEFAULT_SORT_COLUMN_ID = -(1);
  GTK_TREE_SORTABLE_UNSORTED_SORT_COLUMN_ID = -(2);
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  TGtkTreeIterCompareFunc = function(model: PGtkTreeModel; a: PGtkTreeIter; b: PGtkTreeIter; user_data: Tgpointer): longint; cdecl;

  PGtkTreeSortable = type Pointer;

  PGtkTreeSortableIface = ^TGtkTreeSortableIface;
  TGtkTreeSortableIface = record
    g_iface: TGTypeInterface;
    sort_column_changed: procedure(sortable: PGtkTreeSortable); cdecl;
    get_sort_column_id: function(sortable: PGtkTreeSortable; sort_column_id: Plongint; order: PGtkSortType): Tgboolean; cdecl;
    set_sort_column_id: procedure(sortable: PGtkTreeSortable; sort_column_id: longint; order: TGtkSortType); cdecl;
    set_sort_func: procedure(sortable: PGtkTreeSortable; sort_column_id: longint; sort_func: TGtkTreeIterCompareFunc; user_data: Tgpointer; destroy: TGDestroyNotify); cdecl;
    set_default_sort_func: procedure(sortable: PGtkTreeSortable; sort_func: TGtkTreeIterCompareFunc; user_data: Tgpointer; destroy: TGDestroyNotify); cdecl;
    has_default_sort_func: function(sortable: PGtkTreeSortable): Tgboolean; cdecl;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_tree_sortable_get_type: TGType; cdecl; external libgtk4; deprecated;
procedure gtk_tree_sortable_sort_column_changed(sortable: PGtkTreeSortable); cdecl; external libgtk4; deprecated;
function gtk_tree_sortable_get_sort_column_id(sortable: PGtkTreeSortable; sort_column_id: Plongint; order: PGtkSortType): Tgboolean; cdecl; external libgtk4; deprecated;
procedure gtk_tree_sortable_set_sort_column_id(sortable: PGtkTreeSortable; sort_column_id: longint; order: TGtkSortType); cdecl; external libgtk4; deprecated;
procedure gtk_tree_sortable_set_sort_func(sortable: PGtkTreeSortable; sort_column_id: longint; sort_func: TGtkTreeIterCompareFunc; user_data: Tgpointer; destroy: TGDestroyNotify); cdecl; external libgtk4; deprecated;
procedure gtk_tree_sortable_set_default_sort_func(sortable: PGtkTreeSortable; sort_func: TGtkTreeIterCompareFunc; user_data: Tgpointer; destroy: TGDestroyNotify); cdecl; external libgtk4; deprecated;
function gtk_tree_sortable_has_default_sort_func(sortable: PGtkTreeSortable): Tgboolean; cdecl; external libgtk4; deprecated;

// === Konventiert am: 9-7-26 19:52:19 ===

function GTK_TYPE_TREE_SORTABLE: TGType;
function GTK_TREE_SORTABLE(obj: Pointer): PGtkTreeSortable;
function GTK_IS_TREE_SORTABLE(obj: Pointer): Tgboolean;
function GTK_TREE_SORTABLE_GET_IFACE(obj: Pointer): PGtkTreeSortableIface;
{$ENDIF read_function}

implementation

function GTK_TYPE_TREE_SORTABLE: TGType;
begin
  GTK_TYPE_TREE_SORTABLE := gtk_tree_sortable_get_type;
end;

function GTK_TREE_SORTABLE(obj: Pointer): PGtkTreeSortable;
begin
  Result := PGtkTreeSortable(g_type_check_instance_cast(obj, GTK_TYPE_TREE_SORTABLE));
end;

function GTK_IS_TREE_SORTABLE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_TREE_SORTABLE);
end;

function GTK_TREE_SORTABLE_GET_IFACE(obj: Pointer): PGtkTreeSortableIface;
begin
  Result := g_type_interface_peek(obj, GTK_TYPE_TREE_SORTABLE);
end;



end.
