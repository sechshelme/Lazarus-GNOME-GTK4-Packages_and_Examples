{$IFDEF read_interface}

  const
    EINA_ACCESSOR_VERSION = 2;
    _ACCESSOR = $98761232;

type
  PEina_Accessor = ^TEina_Accessor;

  TEina_Accessor_Get_At_Callback = function(it: PEina_Accessor; idx: dword; data: Ppointer): TEina_Bool; cdecl;

  PEina_Accessor_Get_Container_Callback = ^TEina_Accessor_Get_Container_Callback;
  TEina_Accessor_Get_Container_Callback = function(it: PEina_Accessor): pointer; cdecl;

  TEina_Accessor_Free_Callback = procedure(it: PEina_Accessor); cdecl;
  TEina_Accessor_Lock_Callback = function(it: PEina_Accessor): TEina_Bool; cdecl;

  PEina_Accessor_Clone_Callback = ^TEina_Accessor_Clone_Callback;
  TEina_Accessor_Clone_Callback = function(it: PEina_Accessor): PEina_Accessor; cdecl;

  TEina_Accessor = record
    version: longint;
    get_at: TEina_Accessor_Get_At_Callback;
    get_container: TEina_Accessor_Get_Container_Callback;
    free: TEina_Accessor_Free_Callback;
    lock: TEina_Accessor_Lock_Callback;
    unlock: TEina_Accessor_Lock_Callback;
    clone: TEina_Accessor_Clone_Callback;
  end;

function FUNC_ACCESSOR_GET_AT(_Function: Pointer): TEina_Accessor_Get_At_Callback;
function FUNC_ACCESSOR_GET_CONTAINER(_Function: Pointer): TEina_Accessor_Get_Container_Callback;
function FUNC_ACCESSOR_FREE(_Function: Pointer): TEina_Accessor_Free_Callback;
function FUNC_ACCESSOR_LOCK(_Function: Pointer): TEina_Accessor_Lock_Callback;
function FUNC_ACCESSOR_CLONE(_Function: Pointer): TEina_Accessor_Clone_Callback;

procedure eina_accessor_free(accessor: PEina_Accessor); cdecl; external libeina;
function eina_accessor_data_get(accessor: PEina_Accessor; position: dword; data: Ppointer): TEina_Bool; cdecl; external libeina;
function eina_accessor_container_get(accessor: PEina_Accessor): pointer; cdecl; external libeina;
procedure eina_accessor_over(accessor: PEina_Accessor; cb: TEina_Each_Cb; start: dword; end_: dword; fdata: pointer); cdecl; external libeina;
function eina_accessor_lock(accessor: PEina_Accessor): TEina_Bool; cdecl; external libeina;
function eina_accessor_clone(accessor: PEina_Accessor): PEina_Accessor; cdecl; external libeina;
function eina_accessor_unlock(accessor: PEina_Accessor): TEina_Bool; cdecl; external libeina;
function eina_carray_length_accessor_new(arr: Ppointer; step: dword; length: dword): PEina_Accessor; cdecl; external libeina;
function eina_carray_length_ptr_accessor_new(arr: Ppointer; step: dword; length: dword): PEina_Accessor; cdecl; external libeina;

// === Konventiert am: 15-5-25 17:12:42 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function FUNC_ACCESSOR_GET_AT(_Function: Pointer): TEina_Accessor_Get_At_Callback;
begin
  FUNC_ACCESSOR_GET_AT := TEina_Accessor_Get_At_Callback(_Function);
end;

function FUNC_ACCESSOR_GET_CONTAINER(_Function: Pointer): TEina_Accessor_Get_Container_Callback;
begin
  FUNC_ACCESSOR_GET_CONTAINER := TEina_Accessor_Get_Container_Callback(_Function);
end;

function FUNC_ACCESSOR_FREE(_Function: Pointer): TEina_Accessor_Free_Callback;
begin
  FUNC_ACCESSOR_FREE := TEina_Accessor_Free_Callback(_Function);
end;

function FUNC_ACCESSOR_LOCK(_Function: Pointer): TEina_Accessor_Lock_Callback;
begin
  FUNC_ACCESSOR_LOCK := TEina_Accessor_Lock_Callback(_Function);
end;

function FUNC_ACCESSOR_CLONE(_Function: Pointer): TEina_Accessor_Clone_Callback;
begin
  FUNC_ACCESSOR_CLONE := TEina_Accessor_Clone_Callback(_Function);
end;


{$ENDIF read_implementation}
