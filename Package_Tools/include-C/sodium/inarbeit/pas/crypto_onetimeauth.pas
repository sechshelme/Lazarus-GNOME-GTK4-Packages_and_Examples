unit crypto_onetimeauth;

interface

uses
  fp_sodium, crypto_onetimeauth_poly1305;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pcrypto_onetimeauth_state = ^Tcrypto_onetimeauth_state;
  Tcrypto_onetimeauth_state = Tcrypto_onetimeauth_poly1305_state;

function crypto_onetimeauth_statebytes: Tsize_t; cdecl; external libsodium;

const
  crypto_onetimeauth_BYTES_ = crypto_onetimeauth_poly1305_BYTES_;

function crypto_onetimeauth_bytes: Tsize_t; cdecl; external libsodium;

const
  crypto_onetimeauth_KEYBYTES_ = crypto_onetimeauth_poly1305_KEYBYTES_;

function crypto_onetimeauth_keybytes: Tsize_t; cdecl; external libsodium;

const
  crypto_onetimeauth_PRIMITIVE_ = 'poly1305';

function crypto_onetimeauth_primitive: pchar; cdecl; external libsodium;
function crypto_onetimeauth(out_: pbyte; in_: pbyte; inlen: qword; k: pbyte): longint; cdecl; external libsodium;
function crypto_onetimeauth_verify(h: pbyte; in_: pbyte; inlen: qword; k: pbyte): longint; cdecl; external libsodium;
function crypto_onetimeauth_init(state: Pcrypto_onetimeauth_state; key: pbyte): longint; cdecl; external libsodium;
function crypto_onetimeauth_update(state: Pcrypto_onetimeauth_state; in_: pbyte; inlen: qword): longint; cdecl; external libsodium;
function crypto_onetimeauth_final(state: Pcrypto_onetimeauth_state; out_: pbyte): longint; cdecl; external libsodium;
procedure crypto_onetimeauth_keygen(k: pbyte); cdecl; external libsodium;

// === Konventiert am: 31-8-26 17:11:50 ===


implementation



end.
