{$IFDEF read_interface}


const
  crypto_auth_BYTES_ = crypto_auth_hmacsha512256_BYTES_;

function crypto_auth_bytes: Tsize_t; cdecl; external libsodium;

const
  crypto_auth_KEYBYTES_ = crypto_auth_hmacsha512256_KEYBYTES_;

function crypto_auth_keybytes: Tsize_t; cdecl; external libsodium;

const
  crypto_auth_PRIMITIVE_ = 'hmacsha512256';

function crypto_auth_primitive: pchar; cdecl; external libsodium;
function crypto_auth(out_: pbyte; in_: pbyte; inlen: qword; k: pbyte): longint; cdecl; external libsodium;
function crypto_auth_verify(h: pbyte; in_: pbyte; inlen: qword; k: pbyte): longint; cdecl; external libsodium;
procedure crypto_auth_keygen(k: pbyte); cdecl; external libsodium;

// === Konventiert am: 31-8-26 15:49:07 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
