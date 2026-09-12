{$IFDEF read_interface}


type
  Papr_crypto_hash_t = ^Tapr_crypto_hash_t;

  Tapr_crypto_hash_init_t = procedure(hash: Papr_crypto_hash_t); cdecl;
  Tapr_crypto_hash_add_t = procedure(hash: Papr_crypto_hash_t; data: pointer; bytes: Tapr_size_t); cdecl;
  Tapr_crypto_hash_finish_t = procedure(hash: Papr_crypto_hash_t; result: pbyte); cdecl;

  Tapr_crypto_hash_t = record
    init: Tapr_crypto_hash_init_t;
    add: Tapr_crypto_hash_add_t;
    finish: Tapr_crypto_hash_finish_t;
    size: Tapr_size_t;
    data: pointer;
  end;

function apr_crypto_sha256_new(p: Papr_pool_t): Papr_crypto_hash_t; cdecl; external libapr;

type
  Papr_random_t = type Pointer;

procedure apr_random_init(g: Papr_random_t; p: Papr_pool_t; pool_hash: Papr_crypto_hash_t; key_hash: Papr_crypto_hash_t; prng_hash: Papr_crypto_hash_t); cdecl; external libapr;
function apr_random_standard_new(p: Papr_pool_t): Papr_random_t; cdecl; external libapr;
procedure apr_random_add_entropy(g: Papr_random_t; entropy_: pointer; bytes: Tapr_size_t); cdecl; external libapr;
function apr_random_insecure_bytes(g: Papr_random_t; random: pointer; bytes: Tapr_size_t): Tapr_status_t; cdecl; external libapr;
function apr_random_secure_bytes(g: Papr_random_t; random: pointer; bytes: Tapr_size_t): Tapr_status_t; cdecl; external libapr;
procedure apr_random_barrier(g: Papr_random_t); cdecl; external libapr;
function apr_random_secure_ready(r: Papr_random_t): Tapr_status_t; cdecl; external libapr;
function apr_random_insecure_ready(r: Papr_random_t): Tapr_status_t; cdecl; external libapr;
procedure apr_random_after_fork(proc: Papr_proc_t); cdecl; external libapr;

// === Konventiert am: 10-9-26 16:50:17 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
