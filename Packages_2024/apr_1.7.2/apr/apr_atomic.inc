{$IFDEF read_interface}


function apr_atomic_init(p: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_atomic_read32(mem: Papr_uint32_t): Tapr_uint32_t; cdecl; external libapr;
procedure apr_atomic_set32(mem: Papr_uint32_t; val: Tapr_uint32_t); cdecl; external libapr;
function apr_atomic_add32(mem: Papr_uint32_t; val: Tapr_uint32_t): Tapr_uint32_t; cdecl; external libapr;
procedure apr_atomic_sub32(mem: Papr_uint32_t; val: Tapr_uint32_t); cdecl; external libapr;
function apr_atomic_inc32(mem: Papr_uint32_t): Tapr_uint32_t; cdecl; external libapr;
function apr_atomic_dec32(mem: Papr_uint32_t): longint; cdecl; external libapr;
function apr_atomic_cas32(mem: Papr_uint32_t; with_: Tapr_uint32_t; cmp: Tapr_uint32_t): Tapr_uint32_t; cdecl; external libapr;
function apr_atomic_xchg32(mem: Papr_uint32_t; val: Tapr_uint32_t): Tapr_uint32_t; cdecl; external libapr;
function apr_atomic_read64(mem: Papr_uint64_t): Tapr_uint64_t; cdecl; external libapr;
procedure apr_atomic_set64(mem: Papr_uint64_t; val: Tapr_uint64_t); cdecl; external libapr;
function apr_atomic_add64(mem: Papr_uint64_t; val: Tapr_uint64_t): Tapr_uint64_t; cdecl; external libapr;
procedure apr_atomic_sub64(mem: Papr_uint64_t; val: Tapr_uint64_t); cdecl; external libapr;
function apr_atomic_inc64(mem: Papr_uint64_t): Tapr_uint64_t; cdecl; external libapr;
function apr_atomic_dec64(mem: Papr_uint64_t): longint; cdecl; external libapr;
function apr_atomic_cas64(mem: Papr_uint64_t; with_: Tapr_uint64_t; cmp: Tapr_uint64_t): Tapr_uint64_t; cdecl; external libapr;
function apr_atomic_xchg64(mem: Papr_uint64_t; val: Tapr_uint64_t): Tapr_uint64_t; cdecl; external libapr;
function apr_atomic_casptr(mem: Ppointer; with_: pointer; cmp: pointer): pointer; cdecl; external libapr;
function apr_atomic_xchgptr(mem: Ppointer; with_: pointer): pointer; cdecl; external libapr;

// === Konventiert am: 10-9-26 14:34:48 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
