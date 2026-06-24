{$IFDEF read_interface}


type
  PPGSList = ^PGSList;
  PGSList = ^TGSList;
  TGSList = record
    data: Tgpointer;
    next: PGSList;
  end;

function g_slist_alloc: PGSList; cdecl; external libglib2;
procedure g_slist_free(list: PGSList); cdecl; external libglib2;
procedure g_slist_free_1(list: PGSList); cdecl; external libglib2;

procedure g_slist_free_full(list: PGSList; free_func: TGDestroyNotify); cdecl; external libglib2;
function g_slist_append(list: PGSList; data: Tgpointer): PGSList; cdecl; external libglib2;
function g_slist_prepend(list: PGSList; data: Tgpointer): PGSList; cdecl; external libglib2;
function g_slist_insert(list: PGSList; data: Tgpointer; position: Tgint): PGSList; cdecl; external libglib2;
function g_slist_insert_sorted(list: PGSList; data: Tgpointer; func: TGCompareFunc): PGSList; cdecl; external libglib2;
function g_slist_insert_sorted_with_data(list: PGSList; data: Tgpointer; func: TGCompareDataFunc; user_data: Tgpointer): PGSList; cdecl; external libglib2;
function g_slist_insert_before(slist: PGSList; sibling: PGSList; data: Tgpointer): PGSList; cdecl; external libglib2;
function g_slist_concat(list1: PGSList; list2: PGSList): PGSList; cdecl; external libglib2;
function g_slist_remove(list: PGSList; data: Tgconstpointer): PGSList; cdecl; external libglib2;
function g_slist_remove_all(list: PGSList; data: Tgconstpointer): PGSList; cdecl; external libglib2;
function g_slist_remove_link(list: PGSList; link_: PGSList): PGSList; cdecl; external libglib2;
function g_slist_delete_link(list: PGSList; link_: PGSList): PGSList; cdecl; external libglib2;
function g_slist_reverse(list: PGSList): PGSList; cdecl; external libglib2;
function g_slist_copy(list: PGSList): PGSList; cdecl; external libglib2;
function g_slist_copy_deep(list: PGSList; func: TGCopyFunc; user_data: Tgpointer): PGSList; cdecl; external libglib2;
function g_slist_nth(list: PGSList; n: Tguint): PGSList; cdecl; external libglib2;
function g_slist_find(list: PGSList; data: Tgconstpointer): PGSList; cdecl; external libglib2;
function g_slist_find_custom(list: PGSList; data: Tgconstpointer; func: TGCompareFunc): PGSList; cdecl; external libglib2;
function g_slist_position(list: PGSList; llink: PGSList): Tgint; cdecl; external libglib2;
function g_slist_index(list: PGSList; data: Tgconstpointer): Tgint; cdecl; external libglib2;
function g_slist_last(list: PGSList): PGSList; cdecl; external libglib2;
function g_slist_length(list: PGSList): Tguint; cdecl; external libglib2;
procedure g_slist_foreach(list: PGSList; func: TGFunc; user_data: Tgpointer); cdecl; external libglib2;
function g_slist_sort(list: PGSList; compare_func: TGCompareFunc): PGSList; cdecl; external libglib2;
function g_slist_sort_with_data(list: PGSList; compare_func: TGCompareDataFunc; user_data: Tgpointer): PGSList; cdecl; external libglib2;
function g_slist_nth_data(list: PGSList; n: Tguint): Tgpointer; cdecl; external libglib2;
procedure g_clear_slist(slist_ptr: PPGSList; destroy: TGDestroyNotify); cdecl; external libglib2;

function g_slist_next(slist: PGSList): PGSList;

// === Konventiert am: 22-6-26 19:22:57 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function g_slist_next(slist: PGSList): PGSList;
var
  if_local1: PGSList;
begin
  if slist <> nil then begin
    if_local1 := (PGSList(slist))^.Next;
  end else begin
    if_local1 := nil;
  end;
  g_slist_next := if_local1;
end;

{$ENDIF read_implementation}
