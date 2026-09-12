{$IFDEF read_interface}


type
  Tapr_abortfunc_t = function(retcode: longint): longint; cdecl;

function apr_pool_initialize: Tapr_status_t; cdecl; external libapr;
procedure apr_pool_terminate; cdecl; external libapr;
function apr_pool_create_ex(newpool: PPapr_pool_t; parent: Papr_pool_t; abort_fn: Tapr_abortfunc_t; allocator: Papr_allocator_t): Tapr_status_t; cdecl; external libapr;
function apr_pool_create_core_ex(newpool: PPapr_pool_t; abort_fn: Tapr_abortfunc_t; allocator: Papr_allocator_t): Tapr_status_t; cdecl; external libapr;
function apr_pool_create_unmanaged_ex(newpool: PPapr_pool_t; abort_fn: Tapr_abortfunc_t; allocator: Papr_allocator_t): Tapr_status_t; cdecl; external libapr;
function apr_pool_create_ex_debug(newpool: PPapr_pool_t; parent: Papr_pool_t; abort_fn: Tapr_abortfunc_t; allocator: Papr_allocator_t; file_line: pchar): Tapr_status_t; cdecl; external libapr;
function apr_pool_create_core_ex_debug(newpool: PPapr_pool_t; abort_fn: Tapr_abortfunc_t; allocator: Papr_allocator_t; file_line: pchar): Tapr_status_t; cdecl; external libapr;
function apr_pool_create_unmanaged_ex_debug(newpool: PPapr_pool_t; abort_fn: Tapr_abortfunc_t; allocator: Papr_allocator_t; file_line: pchar): Tapr_status_t; cdecl; external libapr;
function apr_pool_allocator_get(pool: Papr_pool_t): Papr_allocator_t; cdecl; external libapr;
procedure apr_pool_clear(p: Papr_pool_t); cdecl; external libapr;
procedure apr_pool_clear_debug(p: Papr_pool_t; file_line: pchar); cdecl; external libapr;
procedure apr_pool_destroy(p: Papr_pool_t); cdecl; external libapr;
procedure apr_pool_destroy_debug(p: Papr_pool_t; file_line: pchar); cdecl; external libapr;
function apr_palloc(p: Papr_pool_t; size: Tapr_size_t): pointer; cdecl; external libapr;
function apr_palloc_debug(p: Papr_pool_t; size: Tapr_size_t; file_line: pchar): pointer; cdecl; external libapr;
function apr_pcalloc_debug(p: Papr_pool_t; size: Tapr_size_t; file_line: pchar): pointer; cdecl; external libapr;
procedure apr_pool_abort_set(abortfunc: Tapr_abortfunc_t; pool: Papr_pool_t); cdecl; external libapr;
function apr_pool_abort_get(pool: Papr_pool_t): Tapr_abortfunc_t; cdecl; external libapr;
function apr_pool_parent_get(pool: Papr_pool_t): Papr_pool_t; cdecl; external libapr;
function apr_pool_is_ancestor(a: Papr_pool_t; b: Papr_pool_t): longint; cdecl; external libapr;
procedure apr_pool_tag(pool: Papr_pool_t; tag: pchar); cdecl; external libapr;
function apr_pool_userdata_set(data: pointer; key: pchar; cleanup: Pointer; pool: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_pool_userdata_setn(data: pointer; key: pchar; cleanup: Pointer; pool: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_pool_userdata_get(data: Ppointer; key: pchar; pool: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
procedure apr_pool_cleanup_register(p: Papr_pool_t; data: pointer; plain_cleanup: Pointer; child_cleanup: Pointer); cdecl; external libapr;
procedure apr_pool_pre_cleanup_register(p: Papr_pool_t; data: pointer; plain_cleanup: Pointer); cdecl; external libapr;
procedure apr_pool_cleanup_kill(p: Papr_pool_t; data: pointer; cleanup: Pointer); cdecl; external libapr;
procedure apr_pool_child_cleanup_set(p: Papr_pool_t; data: pointer; plain_cleanup: Pointer; child_cleanup: Pointer); cdecl; external libapr;
function apr_pool_cleanup_run(p: Papr_pool_t; data: pointer; cleanup: Pointer): Tapr_status_t; cdecl; external libapr;
function apr_pool_cleanup_null(data: pointer): Tapr_status_t; cdecl; external libapr;
procedure apr_pool_cleanup_for_exec; cdecl; external libapr;

function apr_pool_create(newpool: PPapr_pool_t; parent: Papr_pool_t): Tapr_status_t;
function apr_pool_create_core(newpool: PPapr_pool_t): Tapr_status_t;
function apr_pool_create_unmanaged(newpool: PPapr_pool_t): Tapr_status_t;

function apr_pcalloc(p: Papr_pool_t; size: Tapr_size_t): Pointer;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function apr_pool_create(newpool: PPapr_pool_t; parent: Papr_pool_t): Tapr_status_t;
begin
  Result := apr_pool_create_ex(newpool, parent, nil, nil);
end;

function apr_pool_create_core(newpool: PPapr_pool_t): Tapr_status_t;
begin
  Result := apr_pool_create_unmanaged_ex(newpool, nil, nil);
end;

function apr_pool_create_unmanaged(newpool: PPapr_pool_t): Tapr_status_t;
begin
  Result := apr_pool_create_unmanaged_ex(newpool, nil, nil);
end;

function apr_pcalloc(p: Papr_pool_t; size: Tapr_size_t): Pointer;
begin
  Result := apr_palloc(p, size);
  FillChar(Result^, size, 0);
end;

{$ENDIF read_implementation}
