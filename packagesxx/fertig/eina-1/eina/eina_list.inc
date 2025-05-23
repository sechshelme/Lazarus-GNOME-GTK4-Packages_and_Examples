{$IFDEF read_interface}

type
  PEina_List = ^TEina_List;
  PPEina_List = ^PEina_List;

  TEina_List_Accounting = record
    last: PEina_List;
    count: dword;
  end;
  PEina_List_Accounting = ^TEina_List_Accounting;

  TEina_List = record
    data: pointer;
    next: PEina_List;
    prev: PEina_List;
    accounting: PEina_List_Accounting;
  end;

function eina_list_append(list: PEina_List; data: pointer): PEina_List; cdecl; external libeina;
function eina_list_prepend(list: PEina_List; data: pointer): PEina_List; cdecl; external libeina;
function eina_list_append_relative(list: PEina_List; data: pointer; relative: pointer): PEina_List; cdecl; external libeina;
function eina_list_append_relative_list(list: PEina_List; data: pointer; relative: PEina_List): PEina_List; cdecl; external libeina;
function eina_list_prepend_relative(list: PEina_List; data: pointer; relative: pointer): PEina_List; cdecl; external libeina;
function eina_list_prepend_relative_list(list: PEina_List; data: pointer; relative: PEina_List): PEina_List; cdecl; external libeina;
function eina_list_sorted_insert(list: PEina_List; func: TEina_Compare_Cb; data: pointer): PEina_List; cdecl; external libeina;
function eina_list_remove(list: PEina_List; data: pointer): PEina_List; cdecl; external libeina;
function eina_list_remove_list(list: PEina_List; remove_list: PEina_List): PEina_List; cdecl; external libeina;
function eina_list_promote_list(list: PEina_List; move_list: PEina_List): PEina_List; cdecl; external libeina;
function eina_list_demote_list(list: PEina_List; move_list: PEina_List): PEina_List; cdecl; external libeina;
function eina_list_data_find(list: PEina_List; data: pointer): pointer; cdecl; external libeina;
function eina_list_data_find_list(list: PEina_List; data: pointer): PEina_List; cdecl; external libeina;
function eina_list_move(to_: PPEina_List; from: PPEina_List; data: pointer): TEina_Bool; cdecl; external libeina;
function eina_list_move_list(to_: PPEina_List; from: PPEina_List; data: PEina_List): TEina_Bool; cdecl; external libeina;
function eina_list_free(list: PEina_List): PEina_List; cdecl; external libeina;
function eina_list_nth(list: PEina_List; n: dword): pointer; cdecl; external libeina;
function eina_list_nth_list(list: PEina_List; n: dword): PEina_List; cdecl; external libeina;
function eina_list_reverse(list: PEina_List): PEina_List; cdecl; external libeina;
function eina_list_reverse_clone(list: PEina_List): PEina_List; cdecl; external libeina;
function eina_list_clone(list: PEina_List): PEina_List; cdecl; external libeina;
function eina_list_sort(list: PEina_List; limit: dword; func: TEina_Compare_Cb): PEina_List; cdecl; external libeina;
function eina_list_shuffle(list: PEina_List; func: TEina_Random_Cb): PEina_List; cdecl; external libeina;
function eina_list_merge(left: PEina_List; right: PEina_List): PEina_List; cdecl; external libeina;
function eina_list_sorted_merge(left: PEina_List; right: PEina_List; func: TEina_Compare_Cb): PEina_List; cdecl; external libeina;
function eina_list_split_list(list: PEina_List; relative: PEina_List; right: PPEina_List): PEina_List; cdecl; external libeina;
function eina_list_search_sorted_near_list(list: PEina_List; func: TEina_Compare_Cb; data: pointer; result_cmp: Plongint): PEina_List; cdecl; external libeina;
function eina_list_search_sorted_list(list: PEina_List; func: TEina_Compare_Cb; data: pointer): PEina_List; cdecl; external libeina;
function eina_list_search_sorted(list: PEina_List; func: TEina_Compare_Cb; data: pointer): pointer; cdecl; external libeina;
function eina_list_search_unsorted_list(list: PEina_List; func: TEina_Compare_Cb; data: pointer): PEina_List; cdecl; external libeina;
function eina_list_search_unsorted(list: PEina_List; func: TEina_Compare_Cb; data: pointer): pointer; cdecl; external libeina;
function eina_list_iterator_new(list: PEina_List): PEina_Iterator; cdecl; external libeina;
function eina_list_iterator_reversed_new(list: PEina_List): PEina_Iterator; cdecl; external libeina;
function eina_list_accessor_new(list: PEina_List): PEina_Accessor; cdecl; external libeina;
function eina_list_data_idx(list: PEina_List; data: pointer): longint; cdecl; external libeina;

// === Konventiert am: 15-5-25 17:12:52 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
