{$IFDEF read_interface}


type
  {CRYPTO_ALIGN(16) }
  Pcrypto_onetimeauth_poly1305_state = ^Tcrypto_onetimeauth_poly1305_state;
  Tcrypto_onetimeauth_poly1305_state = record
    opaque: array[0..255] of byte;
  end;

function crypto_onetimeauth_poly1305_statebytes: Tsize_t; cdecl; external libsodium;

const
  crypto_onetimeauth_poly1305_BYTES_ = 16;

function crypto_onetimeauth_poly1305_bytes: Tsize_t; cdecl; external libsodium;

const
  crypto_onetimeauth_poly1305_KEYBYTES_ = 32;

function crypto_onetimeauth_poly1305_keybytes: Tsize_t; cdecl; external libsodium;
function crypto_onetimeauth_poly1305(out_: pbyte; in_: pbyte; inlen: qword; k: pbyte): longint; cdecl; external libsodium;
function crypto_onetimeauth_poly1305_verify(h: pbyte; in_: pbyte; inlen: qword; k: pbyte): longint; cdecl; external libsodium;
function crypto_onetimeauth_poly1305_init(state: Pcrypto_onetimeauth_poly1305_state; key: pbyte): longint; cdecl; external libsodium;
function crypto_onetimeauth_poly1305_update(state: Pcrypto_onetimeauth_poly1305_state; in_: pbyte; inlen: qword): longint; cdecl; external libsodium;
function crypto_onetimeauth_poly1305_final(state: Pcrypto_onetimeauth_poly1305_state; out_: pbyte): longint; cdecl; external libsodium;
procedure crypto_onetimeauth_poly1305_keygen(k: pbyte); cdecl; external libsodium;

// === Konventiert am: 31-8-26 17:11:48 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
