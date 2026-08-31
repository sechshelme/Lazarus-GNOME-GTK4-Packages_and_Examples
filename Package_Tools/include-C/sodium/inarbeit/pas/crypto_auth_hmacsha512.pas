unit crypto_auth_hmacsha512;

interface

uses
  fp_sodium, crypto_hash_sha512;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  crypto_auth_hmacsha512_BYTES_ = 64;

function crypto_auth_hmacsha512_bytes: Tsize_t; cdecl; external libsodium;

const
  crypto_auth_hmacsha512_KEYBYTES_ = 32;

function crypto_auth_hmacsha512_keybytes: Tsize_t; cdecl; external libsodium;
function crypto_auth_hmacsha512(out_: pbyte; in_: pbyte; inlen: qword; k: pbyte): longint; cdecl; external libsodium;
function crypto_auth_hmacsha512_verify(h: pbyte; in_: pbyte; inlen: qword; k: pbyte): longint; cdecl; external libsodium;

type
  Pcrypto_auth_hmacsha512_state = ^Tcrypto_auth_hmacsha512_state;
  Tcrypto_auth_hmacsha512_state = record
    ictx: Tcrypto_hash_sha512_state;
    octx: Tcrypto_hash_sha512_state;
  end;

function crypto_auth_hmacsha512_statebytes: Tsize_t; cdecl; external libsodium;
function crypto_auth_hmacsha512_init(state: Pcrypto_auth_hmacsha512_state; key: pbyte; keylen: Tsize_t): longint; cdecl; external libsodium;
function crypto_auth_hmacsha512_update(state: Pcrypto_auth_hmacsha512_state; in_: pbyte; inlen: qword): longint; cdecl; external libsodium;
function crypto_auth_hmacsha512_final(state: Pcrypto_auth_hmacsha512_state; out_: pbyte): longint; cdecl; external libsodium;
procedure crypto_auth_hmacsha512_keygen(k: pbyte); cdecl; external libsodium;

// === Konventiert am: 31-8-26 15:49:02 ===


implementation



end.
