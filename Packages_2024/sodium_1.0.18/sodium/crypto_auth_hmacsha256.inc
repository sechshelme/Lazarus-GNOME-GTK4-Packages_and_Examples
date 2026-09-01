{$IFDEF read_interface}


const
  crypto_auth_hmacsha256_BYTES_ = 32;

function crypto_auth_hmacsha256_bytes: Tsize_t; cdecl; external libsodium;

const
  crypto_auth_hmacsha256_KEYBYTES_ = 32;

function crypto_auth_hmacsha256_keybytes: Tsize_t; cdecl; external libsodium;
function crypto_auth_hmacsha256(out_: pbyte; in_: pbyte; inlen: qword; k: pbyte): longint; cdecl; external libsodium;
function crypto_auth_hmacsha256_verify(h: pbyte; in_: pbyte; inlen: qword; k: pbyte): longint; cdecl; external libsodium;

type
  Pcrypto_auth_hmacsha256_state = ^Tcrypto_auth_hmacsha256_state;
  Tcrypto_auth_hmacsha256_state = record
    ictx: Tcrypto_hash_sha256_state;
    octx: Tcrypto_hash_sha256_state;
  end;

function crypto_auth_hmacsha256_statebytes: Tsize_t; cdecl; external libsodium;
function crypto_auth_hmacsha256_init(state: Pcrypto_auth_hmacsha256_state; key: pbyte; keylen: Tsize_t): longint; cdecl; external libsodium;
function crypto_auth_hmacsha256_update(state: Pcrypto_auth_hmacsha256_state; in_: pbyte; inlen: qword): longint; cdecl; external libsodium;
function crypto_auth_hmacsha256_final(state: Pcrypto_auth_hmacsha256_state; out_: pbyte): longint; cdecl; external libsodium;
procedure crypto_auth_hmacsha256_keygen(k: pbyte); cdecl; external libsodium;

// === Konventiert am: 31-8-26 15:49:04 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
