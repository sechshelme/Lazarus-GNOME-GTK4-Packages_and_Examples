{$IFDEF read_interface}

type
  PEina_Array_Iterator = ^TEina_Array_Iterator;
  TEina_Array_Iterator = ^pointer;

const
  EINA_ARRAY_VERSION = 1;

type
  TEina_Array = record
    version: longint;
    data: ^pointer;
    total: dword;
    count: dword;
    step: dword;
  end;
  PEina_Array = ^TEina_Array;

function eina_array_new(step: dword): PEina_Array; cdecl; external libeina;
procedure eina_array_free(arr: PEina_Array); cdecl; external libeina;
procedure eina_array_step_set(arr: PEina_Array; sizeof_eina_array: dword; step: dword); cdecl; external libeina;
procedure eina_array_flush(arr: PEina_Array); cdecl; external libeina;

type
  Tkeep_func = function(data: pointer; gdata: pointer): TEina_Bool;

function eina_array_remove(arr: PEina_Array; keep: Tkeep_func; gdata: pointer): TEina_Bool; cdecl; external libeina;
function eina_array_iterator_new(arr: PEina_Array): PEina_Iterator; cdecl; external libeina;
function eina_array_accessor_new(arr: PEina_Array): PEina_Accessor; cdecl; external libeina;

// === Konventiert am: 15-5-25 17:59:19 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
