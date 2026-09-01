unit crypto_kdf_blake2b;

interface

uses
  fp_sodium;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  crypto_kdf_blake2b_BYTES_MIN_ = 16;

function crypto_kdf_blake2b_bytes_min: Tsize_t; cdecl; external libsodium;

const
  crypto_kdf_blake2b_BYTES_MAX_ = 64;

function crypto_kdf_blake2b_bytes_max: Tsize_t; cdecl; external libsodium;

const
  crypto_kdf_blake2b_CONTEXTBYTES_ = 8;

function crypto_kdf_blake2b_contextbytes: Tsize_t; cdecl; external libsodium;

const
  crypto_kdf_blake2b_KEYBYTES_ = 32;

function crypto_kdf_blake2b_keybytes: Tsize_t; cdecl; external libsodium;
function crypto_kdf_blake2b_derive_from_key(subkey: pbyte; subkey_len: Tsize_t; subkey_id: Tuint64_t; ctx: pchar; key: pbyte): longint; cdecl; external libsodium;

// === Konventiert am: 31-8-26 17:11:55 ===


implementation



end.
