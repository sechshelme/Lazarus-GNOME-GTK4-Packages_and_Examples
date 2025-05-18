{$IFDEF read_interface}


type
  PEina_Inlist = ^TEina_Inlist;

  TEina_Inlist = record
    next: PEina_Inlist;
    prev: PEina_Inlist;
    last: PEina_Inlist;
  end;

  TEina_Inlist_Sorted_State = record
  end;
  PEina_Inlist_Sorted_State = ^TEina_Inlist_Sorted_State;

function eina_inlist_append(in_list: PEina_Inlist; in_item: PEina_Inlist): PEina_Inlist; cdecl; external libeina;
function eina_inlist_prepend(in_list: PEina_Inlist; in_item: PEina_Inlist): PEina_Inlist; cdecl; external libeina;
function eina_inlist_append_relative(in_list: PEina_Inlist; in_item: PEina_Inlist; in_relative: PEina_Inlist): PEina_Inlist; cdecl; external libeina;
function eina_inlist_prepend_relative(in_list: PEina_Inlist; in_item: PEina_Inlist; in_relative: PEina_Inlist): PEina_Inlist; cdecl; external libeina;
function eina_inlist_remove(in_list: PEina_Inlist; in_item: PEina_Inlist): PEina_Inlist; cdecl; external libeina;
function eina_inlist_find(in_list: PEina_Inlist; in_item: PEina_Inlist): PEina_Inlist; cdecl; external libeina;
function eina_inlist_promote(list: PEina_Inlist; item: PEina_Inlist): PEina_Inlist; cdecl; external libeina;
function eina_inlist_demote(list: PEina_Inlist; item: PEina_Inlist): PEina_Inlist; cdecl; external libeina;
function eina_inlist_count(list: PEina_Inlist): dword; cdecl; external libeina;
function eina_inlist_iterator_new(in_list: PEina_Inlist): PEina_Iterator; cdecl; external libeina;
function eina_inlist_accessor_new(in_list: PEina_Inlist): PEina_Accessor; cdecl; external libeina;
function eina_inlist_sorted_insert(list: PEina_Inlist; item: PEina_Inlist; func: TEina_Compare_Cb): PEina_Inlist; cdecl; external libeina;
function eina_inlist_sorted_state_new: PEina_Inlist_Sorted_State; cdecl; external libeina;
function eina_inlist_sorted_state_init(state: PEina_Inlist_Sorted_State; list: PEina_Inlist): longint; cdecl; external libeina;
procedure eina_inlist_sorted_state_free(state: PEina_Inlist_Sorted_State); cdecl; external libeina;
function eina_inlist_sorted_state_insert(list: PEina_Inlist; item: PEina_Inlist; func: TEina_Compare_Cb; state: PEina_Inlist_Sorted_State): PEina_Inlist; cdecl; external libeina;
function eina_inlist_sort(head: PEina_Inlist; func: TEina_Compare_Cb): PEina_Inlist; cdecl; external libeina;


// === Konventiert am: 16-5-25 17:19:34 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
