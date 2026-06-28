unit gliststore;

interface

uses
  fp_glib2;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGListStore = type Pointer;

  TGListStoreClass = record
    parent_class: TGObjectClass;
  end;
  PGListStoreClass = ^TGListStoreClass;

function g_list_store_get_type: TGType; cdecl; external libgio2;
function g_list_store_new(item_type: TGType): PGListStore; cdecl; external libgio2;
procedure g_list_store_insert(store: PGListStore; position: Tguint; item: Tgpointer); cdecl; external libgio2;
function g_list_store_insert_sorted(store: PGListStore; item: Tgpointer; compare_func: TGCompareDataFunc; user_data: Tgpointer): Tguint; cdecl; external libgio2;
procedure g_list_store_sort(store: PGListStore; compare_func: TGCompareDataFunc; user_data: Tgpointer); cdecl; external libgio2;
procedure g_list_store_append(store: PGListStore; item: Tgpointer); cdecl; external libgio2;
procedure g_list_store_remove(store: PGListStore; position: Tguint); cdecl; external libgio2;
procedure g_list_store_remove_all(store: PGListStore); cdecl; external libgio2;
procedure g_list_store_splice(store: PGListStore; position: Tguint; n_removals: Tguint; additions: Pgpointer; n_additions: Tguint); cdecl; external libgio2;
function g_list_store_find(store: PGListStore; item: Tgpointer; position: Pguint): Tgboolean; cdecl; external libgio2;
function g_list_store_find_with_equal_func(store: PGListStore; item: Tgpointer; equal_func: TGEqualFunc; position: Pguint): Tgboolean; cdecl; external libgio2;
function g_list_store_find_with_equal_func_full(store: PGListStore; item: Tgpointer; equal_func: TGEqualFuncFull; user_data: Tgpointer; position: Pguint): Tgboolean; cdecl; external libgio2;

// === Konventiert am: 26-6-26 19:39:55 ===

function G_TYPE_LIST_STORE: TGType;
function G_LIST_STORE(obj: Pointer): PGListStore;
function G_IS_LIST_STORE(obj: Pointer): Tgboolean;

implementation

function G_TYPE_LIST_STORE: TGType;
begin
  Result := g_list_store_get_type;
end;

function G_LIST_STORE(obj: Pointer): PGListStore;
begin
  Result := PGListStore(g_type_check_instance_cast(obj, G_TYPE_LIST_STORE));
end;

function G_IS_LIST_STORE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_LIST_STORE);
end;

end.
