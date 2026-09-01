unit crypto_generichash;

interface

uses
  fp_sodium, crypto_generichash_blake2b;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  crypto_generichash_BYTES_MIN_ = crypto_generichash_blake2b_BYTES_MIN_;

function crypto_generichash_bytes_min: Tsize_t; cdecl; external libsodium;

const
  crypto_generichash_BYTES_MAX_ = crypto_generichash_blake2b_BYTES_MAX_;

function crypto_generichash_bytes_max: Tsize_t; cdecl; external libsodium;

const
  crypto_generichash_BYTES_ = crypto_generichash_blake2b_BYTES_;

function crypto_generichash_bytes: Tsize_t; cdecl; external libsodium;

const
  crypto_generichash_KEYBYTES_MIN_ = crypto_generichash_blake2b_KEYBYTES_MIN_;

function crypto_generichash_keybytes_min: Tsize_t; cdecl; external libsodium;

const
  crypto_generichash_KEYBYTES_MAX_ = crypto_generichash_blake2b_KEYBYTES_MAX_;

function crypto_generichash_keybytes_max: Tsize_t; cdecl; external libsodium;

const
  crypto_generichash_KEYBYTES_ = crypto_generichash_blake2b_KEYBYTES_;

function crypto_generichash_keybytes: Tsize_t; cdecl; external libsodium;

const
  crypto_generichash_PRIMITIV_E = 'blake2b';

function crypto_generichash_primitive: pchar; cdecl; external libsodium;

type
  Pcrypto_generichash_state = ^Tcrypto_generichash_state;
  Tcrypto_generichash_state = Tcrypto_generichash_blake2b_state;

function crypto_generichash_statebytes: Tsize_t; cdecl; external libsodium;
function crypto_generichash(out_: pbyte; outlen: Tsize_t; in_: pbyte; inlen: qword; key: pbyte;
  keylen: Tsize_t): longint; cdecl; external libsodium;
function crypto_generichash_init(state: Pcrypto_generichash_state; key: pbyte; keylen: Tsize_t; outlen: Tsize_t): longint; cdecl; external libsodium;
function crypto_generichash_update(state: Pcrypto_generichash_state; in_: pbyte; inlen: qword): longint; cdecl; external libsodium;
function crypto_generichash_final(state: Pcrypto_generichash_state; out_: pbyte; outlen: Tsize_t): longint; cdecl; external libsodium;
procedure crypto_generichash_keygen(k: pbyte); cdecl; external libsodium;

// === Konventiert am: 31-8-26 16:26:02 ===


implementation



end.
