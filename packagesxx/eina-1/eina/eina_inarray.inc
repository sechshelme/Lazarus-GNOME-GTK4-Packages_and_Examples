{$IFDEF read_interface}

const
  EINA_ARRAY_VERSION = 1;

type
  TEina_Inarray = record
    version: longint;
    member_size: dword;
    len: dword;
    max: dword;
    step: dword;
    members: pointer;
  end;
  PEina_Inarray = ^TEina_Inarray;


function eina_inarray_new(member_size: dword; step: dword): PEina_Inarray; cdecl; external libeina;
procedure eina_inarray_free(arr: PEina_Inarray); cdecl; external libeina;
procedure eina_inarray_step_set(arr: PEina_Inarray; sizeof_eina_inarray: dword; member_size: dword; step: dword); cdecl; external libeina;
procedure eina_inarray_flush(arr: PEina_Inarray); cdecl; external libeina;
function eina_inarray_push(arr: PEina_Inarray; data: pointer): longint; cdecl; external libeina;
function eina_inarray_grow(arr: PEina_Inarray; size: dword): pointer; cdecl; external libeina;
function eina_inarray_insert(arr: PEina_Inarray; data: pointer; compare: TEina_Compare_Cb): longint; cdecl; external libeina;
function eina_inarray_insert_sorted(arr: PEina_Inarray; data: pointer; compare: TEina_Compare_Cb): longint; cdecl; external libeina;
function eina_inarray_remove(arr: PEina_Inarray; data: pointer): longint; cdecl; external libeina;
function eina_inarray_pop(arr: PEina_Inarray): pointer; cdecl; external libeina;
function eina_inarray_nth(arr: PEina_Inarray; position: dword): pointer; cdecl; external libeina;
function eina_inarray_insert_at(arr: PEina_Inarray; position: dword; data: pointer): TEina_Bool; cdecl; external libeina;
function eina_inarray_alloc_at(arr: PEina_Inarray; position: dword; member_count: dword): pointer; cdecl; external libeina;
function eina_inarray_replace_at(arr: PEina_Inarray; position: dword; data: pointer): TEina_Bool; cdecl; external libeina;
function eina_inarray_remove_at(arr: PEina_Inarray; position: dword): TEina_Bool; cdecl; external libeina;
procedure eina_inarray_reverse(arr: PEina_Inarray); cdecl; external libeina;
procedure eina_inarray_sort(arr: PEina_Inarray; compare: TEina_Compare_Cb); cdecl; external libeina;
function eina_inarray_search(arr: PEina_Inarray; data: pointer; compare: TEina_Compare_Cb): longint; cdecl; external libeina;
function eina_inarray_search_sorted(arr: PEina_Inarray; data: pointer; compare: TEina_Compare_Cb): longint; cdecl; external libeina;
function eina_inarray_foreach(arr: PEina_Inarray; _function: TEina_Each_Cb; user_data: pointer): TEina_Bool; cdecl; external libeina;
function eina_inarray_foreach_remove(arr: PEina_Inarray; match: TEina_Each_Cb; user_data: pointer): longint; cdecl; external libeina;
function eina_inarray_resize(arr: PEina_Inarray; new_size: dword): TEina_Bool; cdecl; external libeina;
function eina_inarray_count(arr: PEina_Inarray): dword; cdecl; external libeina;
function eina_inarray_iterator_new(arr: PEina_Inarray): PEina_Iterator; cdecl; external libeina;
function eina_inarray_iterator_reversed_new(arr: PEina_Inarray): PEina_Iterator; cdecl; external libeina;
function eina_inarray_accessor_new(arr: PEina_Inarray): PEina_Accessor; cdecl; external libeina;

// === Konventiert am: 14-5-25 19:18:44 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
