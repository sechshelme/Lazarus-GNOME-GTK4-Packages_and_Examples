{$IFDEF read_interface}



type
  { CRYPTO_ALIGN(64) }
  Pcrypto_generichash_blake2b_state = ^Tcrypto_generichash_blake2b_state;
  Tcrypto_generichash_blake2b_state = record
    opaque: array[0..383] of byte;
  end;

const
  crypto_generichash_blake2b_BYTES_MIN_ = 16;

function crypto_generichash_blake2b_bytes_min: Tsize_t; cdecl; external libsodium;

const
  crypto_generichash_blake2b_BYTES_MAX_ = 64;

function crypto_generichash_blake2b_bytes_max: Tsize_t; cdecl; external libsodium;

const
  crypto_generichash_blake2b_BYTES_ = 32;

function crypto_generichash_blake2b_bytes: Tsize_t; cdecl; external libsodium;

const
  crypto_generichash_blake2b_KEYBYTES_MIN_ = 16;

function crypto_generichash_blake2b_keybytes_min: Tsize_t; cdecl; external libsodium;

const
  crypto_generichash_blake2b_KEYBYTES_MAX_ = 64;

function crypto_generichash_blake2b_keybytes_max: Tsize_t; cdecl; external libsodium;

const
  crypto_generichash_blake2b_KEYBYTES_ = 32;

function crypto_generichash_blake2b_keybytes: Tsize_t; cdecl; external libsodium;

const
  crypto_generichash_blake2b_SALTBYTES_ = 16;

function crypto_generichash_blake2b_saltbytes: Tsize_t; cdecl; external libsodium;

const
  crypto_generichash_blake2b_PERSONALBYTES_ = 16;

function crypto_generichash_blake2b_personalbytes: Tsize_t; cdecl; external libsodium;
function crypto_generichash_blake2b_statebytes: Tsize_t; cdecl; external libsodium;
function crypto_generichash_blake2b(out_: pbyte; outlen: Tsize_t; in_: pbyte; inlen: qword; key: pbyte;
  keylen: Tsize_t): longint; cdecl; external libsodium;
function crypto_generichash_blake2b_salt_personal(out_: pbyte; outlen: Tsize_t; in_: pbyte; inlen: qword; key: pbyte;
  keylen: Tsize_t; salt: pbyte; personal: pbyte): longint; cdecl; external libsodium;
function crypto_generichash_blake2b_init(state: Pcrypto_generichash_blake2b_state; key: pbyte; keylen: Tsize_t; outlen: Tsize_t): longint; cdecl; external libsodium;
function crypto_generichash_blake2b_init_salt_personal(state: Pcrypto_generichash_blake2b_state; key: pbyte; keylen: Tsize_t; outlen: Tsize_t; salt: pbyte;
  personal: pbyte): longint; cdecl; external libsodium;
function crypto_generichash_blake2b_update(state: Pcrypto_generichash_blake2b_state; in_: pbyte; inlen: qword): longint; cdecl; external libsodium;
function crypto_generichash_blake2b_final(state: Pcrypto_generichash_blake2b_state; out_: pbyte; outlen: Tsize_t): longint; cdecl; external libsodium;
procedure crypto_generichash_blake2b_keygen(k: pbyte); cdecl; external libsodium;

// === Konventiert am: 31-8-26 16:25:58 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
