{$IFDEF read_interface}


type
  TEina_Lalloc_Alloc = function(user_data: pointer; num: longint): TEina_Bool; cdecl;

  TEina_Lalloc = record
  end;
  PEina_Lalloc = ^TEina_Lalloc;


type
  TEina_Lalloc_Free = procedure(user_data: pointer); cdecl;

function eina_lalloc_new(data: pointer; alloc_cb: TEina_Lalloc_Alloc; free_cb: TEina_Lalloc_Free; num_init: longint): PEina_Lalloc; cdecl; external libeina;
procedure eina_lalloc_free(a: PEina_Lalloc); cdecl; external libeina;
function eina_lalloc_elements_add(a: PEina_Lalloc; num: longint): TEina_Bool; cdecl; external libeina;
function eina_lalloc_element_add(a: PEina_Lalloc): TEina_Bool; cdecl; external libeina;

// === Konventiert am: 17-5-25 16:23:53 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
