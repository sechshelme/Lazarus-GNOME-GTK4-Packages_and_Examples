unit apr_hash;

interface

uses
  fp_apr, apr;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  APR_HASH_KEY_STRING = -(1);

type
  Papr_hash_t = type Pointer;
  Papr_hash_index_t = type Pointer;

  Tapr_hashfunc_t = function(key: pchar; klen: Papr_ssize_t): dword; cdecl;

function apr_hashfunc_default(key: pchar; klen: Papr_ssize_t): dword; cdecl; external libapr;
function apr_hash_make(pool: Papr_pool_t): Papr_hash_t; cdecl; external libapr;
function apr_hash_make_custom(pool: Papr_pool_t; hash_func: Tapr_hashfunc_t): Papr_hash_t; cdecl; external libapr;
function apr_hash_copy(pool: Papr_pool_t; h: Papr_hash_t): Papr_hash_t; cdecl; external libapr;
procedure apr_hash_set(ht: Papr_hash_t; key: pointer; klen: Tapr_ssize_t; val: pointer); cdecl; external libapr;
function apr_hash_get(ht: Papr_hash_t; key: pointer; klen: Tapr_ssize_t): pointer; cdecl; external libapr;
function apr_hash_first(p: Papr_pool_t; ht: Papr_hash_t): Papr_hash_index_t; cdecl; external libapr;
function apr_hash_next(hi: Papr_hash_index_t): Papr_hash_index_t; cdecl; external libapr;
procedure apr_hash_this(hi: Papr_hash_index_t; key: Ppointer; klen: Papr_ssize_t; val: Ppointer); cdecl; external libapr;
function apr_hash_this_key(hi: Papr_hash_index_t): pointer; cdecl; external libapr;
function apr_hash_this_key_len(hi: Papr_hash_index_t): Tapr_ssize_t; cdecl; external libapr;
function apr_hash_this_val(hi: Papr_hash_index_t): pointer; cdecl; external libapr;
function apr_hash_count(ht: Papr_hash_t): dword; cdecl; external libapr;
procedure apr_hash_clear(ht: Papr_hash_t); cdecl; external libapr;
function apr_hash_overlay(p: Papr_pool_t; overlay: Papr_hash_t; base: Papr_hash_t): Papr_hash_t; cdecl; external libapr;
function apr_hash_merge(p: Papr_pool_t; h1: Papr_hash_t; h2: Papr_hash_t; merger: pointer; data: pointer): Papr_hash_t; cdecl; external libapr;

type
  Tapr_hash_do_callback_fn_t = function(rec: Pointer; key: Pointer; klen: Tapr_ssize_t; value: Pointer): longint; cdecl;

function apr_hash_do(comp: Tapr_hash_do_callback_fn_t; rec: pointer; ht: Papr_hash_t): longint; cdecl; external libapr;

// === Konventiert am: 10-9-26 16:37:16 ===


implementation



end.
