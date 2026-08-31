unit crypto_auth_hmacsha512256;

interface

uses
  fp_sodium, crypto_auth_hmacsha512;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  crypto_auth_hmacsha512256_BYTES_ = 32;

function crypto_auth_hmacsha512256_bytes: Tsize_t; cdecl; external libsodium;

const
  crypto_auth_hmacsha512256_KEYBYTES_ = 32;

function crypto_auth_hmacsha512256_keybytes: Tsize_t; cdecl; external libsodium;
function crypto_auth_hmacsha512256(out_: pbyte; in_: pbyte; inlen: qword; k: pbyte): longint; cdecl; external libsodium;
function crypto_auth_hmacsha512256_verify(h: pbyte; in_: pbyte; inlen: qword; k: pbyte): longint; cdecl; external libsodium;

type
  Pcrypto_auth_hmacsha512256_state = ^Tcrypto_auth_hmacsha512256_state;
  Tcrypto_auth_hmacsha512256_state = Tcrypto_auth_hmacsha512_state;

function crypto_auth_hmacsha512256_statebytes: Tsize_t; cdecl; external libsodium;
function crypto_auth_hmacsha512256_init(state: Pcrypto_auth_hmacsha512256_state; key: pbyte; keylen: Tsize_t): longint; cdecl; external libsodium;
function crypto_auth_hmacsha512256_update(state: Pcrypto_auth_hmacsha512256_state; in_: pbyte; inlen: qword): longint; cdecl; external libsodium;
function crypto_auth_hmacsha512256_final(state: Pcrypto_auth_hmacsha512256_state; out_: pbyte): longint; cdecl; external libsodium;
procedure crypto_auth_hmacsha512256_keygen(k: pbyte); cdecl; external libsodium;

// === Konventiert am: 31-8-26 15:48:59 ===


implementation



end.
