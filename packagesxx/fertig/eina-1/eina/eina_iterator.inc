{$IFDEF read_interface}


  const
    EINA_ITERATOR_VERSION = 1;
    _ITERATOR = $98761233;

type
  PEina_Iterator = ^TEina_Iterator;

  TEina_Iterator_Next_Callback = function(it: PEina_Iterator; data: Ppointer): TEina_Bool; cdecl;

  PEina_Iterator_Get_Container_Callback = ^TEina_Iterator_Get_Container_Callback;
  TEina_Iterator_Get_Container_Callback = function(it: PEina_Iterator): pointer; cdecl;

  TEina_Iterator_Free_Callback = procedure(it: PEina_Iterator); cdecl;
  TEina_Iterator_Lock_Callback = function(it: PEina_Iterator): TEina_Bool; cdecl;

  TEina_Iterator = record
    version: longint;
    next: TEina_Iterator_Next_Callback;
    get_container: TEina_Iterator_Get_Container_Callback;
    free: TEina_Iterator_Free_Callback;
    lock: TEina_Iterator_Lock_Callback;
    unlock: TEina_Iterator_Lock_Callback;
  end;

function FUNC_ITERATOR_NEXT(_Function: Pointer): TEina_Iterator_Next_Callback;
function FUNC_ITERATOR_GET_CONTAINER(_Function: Pointer): TEina_Iterator_Get_Container_Callback;
function FUNC_ITERATOR_FREE(_Function: Pointer): TEina_Iterator_Free_Callback;
function FUNC_ITERATOR_LOCK(_Function: Pointer): TEina_Iterator_Lock_Callback;

procedure eina_iterator_free(iterator: PEina_Iterator); cdecl; external libeina;
function eina_iterator_container_get(iterator: PEina_Iterator): pointer; cdecl; external libeina;
function eina_iterator_next(iterator: PEina_Iterator; data: Ppointer): TEina_Bool; cdecl; external libeina;
procedure eina_iterator_foreach(iterator: PEina_Iterator; callback: TEina_Each_Cb; fdata: pointer); cdecl; external libeina;
function eina_iterator_lock(iterator: PEina_Iterator): TEina_Bool; cdecl; external libeina;
function eina_iterator_unlock(iterator: PEina_Iterator): TEina_Bool; cdecl; external libeina;
function eina_carray_iterator_new(arr: Ppointer): PEina_Iterator; cdecl; external libeina;
function eina_carray_length_iterator_new(arr: Ppointer; step: dword; length: dword): PEina_Iterator; cdecl; external libeina;
function eina_iterator_filter_new(original: PEina_Iterator; filter: TEina_Each_Cb; free_cb: TEina_Free_Cb; data: pointer): PEina_Iterator; cdecl; external libeina;
function eina_multi_iterator_internal_new(it: PEina_Iterator; args: array of const): PEina_Iterator; cdecl; external libeina;
function eina_multi_iterator_internal_new(it: PEina_Iterator): PEina_Iterator; cdecl; external libeina;
function eina_iterator_processed_new(iterator: PEina_Iterator; process: TEina_Process_Cb; free_cb: TEina_Free_Cb; fdata: pointer): PEina_Iterator; cdecl; external libeina;

// === Konventiert am: 15-5-25 17:12:49 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function FUNC_ITERATOR_NEXT(_Function: Pointer): TEina_Iterator_Next_Callback;
begin
  FUNC_ITERATOR_NEXT := TEina_Iterator_Next_Callback(_Function);
end;

function FUNC_ITERATOR_GET_CONTAINER(_Function: Pointer
  ): TEina_Iterator_Get_Container_Callback;
begin
  FUNC_ITERATOR_GET_CONTAINER := TEina_Iterator_Get_Container_Callback(_Function);
end;

function FUNC_ITERATOR_FREE(_Function: Pointer): TEina_Iterator_Free_Callback;
begin
  FUNC_ITERATOR_FREE := TEina_Iterator_Free_Callback(_Function);
end;

function FUNC_ITERATOR_LOCK(_Function: Pointer): TEina_Iterator_Lock_Callback;
begin
  FUNC_ITERATOR_LOCK := TEina_Iterator_Lock_Callback(_Function);
end;


{$ENDIF read_implementation}
