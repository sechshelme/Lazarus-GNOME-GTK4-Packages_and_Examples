{$IFDEF read_interface}


const
  crypto_kdf_BYTES_MIN_ = crypto_kdf_blake2b_BYTES_MIN_;

function crypto_kdf_bytes_min: Tsize_t; cdecl; external libsodium;

const
  crypto_kdf_BYTES_MAX_ = crypto_kdf_blake2b_BYTES_MAX_;

function crypto_kdf_bytes_max: Tsize_t; cdecl; external libsodium;

const
  crypto_kdf_CONTEXTBYTES_ = crypto_kdf_blake2b_CONTEXTBYTES_;

function crypto_kdf_contextbytes: Tsize_t; cdecl; external libsodium;

const
  crypto_kdf_KEYBYTES_ = crypto_kdf_blake2b_KEYBYTES_;

function crypto_kdf_keybytes: Tsize_t; cdecl; external libsodium;

const
  crypto_kdf_PRIMITIVE_ = 'blake2b';

function crypto_kdf_primitive: pchar; cdecl; external libsodium;
function crypto_kdf_derive_from_key(subkey: pbyte; subkey_len: Tsize_t; subkey_id: Tuint64_t; ctx: pchar; key: pbyte): longint; cdecl; external libsodium;
procedure crypto_kdf_keygen(k: pbyte); cdecl; external libsodium;

// === Konventiert am: 31-8-26 17:11:57 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
