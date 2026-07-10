unit gtktreestore;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtktreemodel;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkTreeStorePrivate = type Pointer;

  PGtkTreeStore = ^TGtkTreeStore;
  TGtkTreeStore = record
    parent: TGObject;
    priv: PGtkTreeStorePrivate;
  end;

  PGtkTreeStoreClass = ^TGtkTreeStoreClass;
  TGtkTreeStoreClass = record
    parent_class: TGObjectClass;
    padding: array[0..7] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_tree_store_get_type: TGType; cdecl; external libgtk4; deprecated;
function gtk_tree_store_new(n_columns: longint): PGtkTreeStore; cdecl; varargs; external libgtk4; deprecated;
function gtk_tree_store_newv(n_columns: longint; types: PGType): PGtkTreeStore; cdecl; external libgtk4; deprecated;
procedure gtk_tree_store_set_column_types(tree_store: PGtkTreeStore; n_columns: longint; types: PGType); cdecl; external libgtk4; deprecated;
procedure gtk_tree_store_set_value(tree_store: PGtkTreeStore; iter: PGtkTreeIter; column: longint; value: PGValue); cdecl; external libgtk4; deprecated;
procedure gtk_tree_store_set(tree_store: PGtkTreeStore; iter: PGtkTreeIter); cdecl; varargs; external libgtk4; deprecated;
procedure gtk_tree_store_set_valuesv(tree_store: PGtkTreeStore; iter: PGtkTreeIter; columns: Plongint; values: PGValue; n_values: longint); cdecl; external libgtk4; deprecated;
procedure gtk_tree_store_set_valist(tree_store: PGtkTreeStore; iter: PGtkTreeIter; var_args: Tva_list); cdecl; external libgtk4; deprecated;
function gtk_tree_store_remove(tree_store: PGtkTreeStore; iter: PGtkTreeIter): Tgboolean; cdecl; external libgtk4; deprecated;
procedure gtk_tree_store_insert(tree_store: PGtkTreeStore; iter: PGtkTreeIter; parent: PGtkTreeIter; position: longint); cdecl; external libgtk4; deprecated;
procedure gtk_tree_store_insert_before(tree_store: PGtkTreeStore; iter: PGtkTreeIter; parent: PGtkTreeIter; sibling: PGtkTreeIter); cdecl; external libgtk4; deprecated;
procedure gtk_tree_store_insert_after(tree_store: PGtkTreeStore; iter: PGtkTreeIter; parent: PGtkTreeIter; sibling: PGtkTreeIter); cdecl; external libgtk4; deprecated;
procedure gtk_tree_store_insert_with_values(tree_store: PGtkTreeStore; iter: PGtkTreeIter; parent: PGtkTreeIter; position: longint); cdecl; varargs; external libgtk4; deprecated;
procedure gtk_tree_store_insert_with_valuesv(tree_store: PGtkTreeStore; iter: PGtkTreeIter; parent: PGtkTreeIter; position: longint; columns: Plongint; values: PGValue; n_values: longint); cdecl; external libgtk4; deprecated;
procedure gtk_tree_store_prepend(tree_store: PGtkTreeStore; iter: PGtkTreeIter; parent: PGtkTreeIter); cdecl; external libgtk4; deprecated;
procedure gtk_tree_store_append(tree_store: PGtkTreeStore; iter: PGtkTreeIter; parent: PGtkTreeIter); cdecl; external libgtk4; deprecated;
function gtk_tree_store_is_ancestor(tree_store: PGtkTreeStore; iter: PGtkTreeIter; descendant: PGtkTreeIter): Tgboolean; cdecl; external libgtk4; deprecated;
function gtk_tree_store_iter_depth(tree_store: PGtkTreeStore; iter: PGtkTreeIter): longint; cdecl; external libgtk4; deprecated;
procedure gtk_tree_store_clear(tree_store: PGtkTreeStore); cdecl; external libgtk4; deprecated;
function gtk_tree_store_iter_is_valid(tree_store: PGtkTreeStore; iter: PGtkTreeIter): Tgboolean; cdecl; external libgtk4; deprecated;
procedure gtk_tree_store_reorder(tree_store: PGtkTreeStore; parent: PGtkTreeIter; new_order: Plongint); cdecl; external libgtk4; deprecated;
procedure gtk_tree_store_swap(tree_store: PGtkTreeStore; a: PGtkTreeIter; b: PGtkTreeIter); cdecl; external libgtk4; deprecated;
procedure gtk_tree_store_move_before(tree_store: PGtkTreeStore; iter: PGtkTreeIter; position: PGtkTreeIter); cdecl; external libgtk4; deprecated;
procedure gtk_tree_store_move_after(tree_store: PGtkTreeStore; iter: PGtkTreeIter; position: PGtkTreeIter); cdecl; external libgtk4; deprecated;

// === Konventiert am: 9-7-26 19:52:09 ===

function GTK_TYPE_TREE_STORE: TGType;
function GTK_TREE_STORE(obj: Pointer): PGtkTreeStore;
function GTK_TREE_STORE_CLASS(klass: Pointer): PGtkTreeStoreClass;
function GTK_IS_TREE_STORE(obj: Pointer): Tgboolean;
function GTK_IS_TREE_STORE_CLASS(klass: Pointer): Tgboolean;
function GTK_TREE_STORE_GET_CLASS(obj: Pointer): PGtkTreeStoreClass;
{$ENDIF read_function}

implementation

function GTK_TYPE_TREE_STORE: TGType;
begin
  GTK_TYPE_TREE_STORE := gtk_tree_store_get_type;
end;

function GTK_TREE_STORE(obj: Pointer): PGtkTreeStore;
begin
  Result := PGtkTreeStore(g_type_check_instance_cast(obj, GTK_TYPE_TREE_STORE));
end;

function GTK_TREE_STORE_CLASS(klass: Pointer): PGtkTreeStoreClass;
begin
  Result := PGtkTreeStoreClass(g_type_check_class_cast(klass, GTK_TYPE_TREE_STORE));
end;

function GTK_IS_TREE_STORE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_TREE_STORE);
end;

function GTK_IS_TREE_STORE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_TREE_STORE);
end;

function GTK_TREE_STORE_GET_CLASS(obj: Pointer): PGtkTreeStoreClass;
begin
  Result := PGtkTreeStoreClass(PGTypeInstance(obj)^.g_class);
end;



end.
