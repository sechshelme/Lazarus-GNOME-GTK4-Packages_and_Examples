{$IFDEF read_interface}


const
  crypto_shorthash_BYTES_ = crypto_shorthash_siphash24_BYTES_;

function crypto_shorthash_bytes: Tsize_t; cdecl; external libsodium;

const
  crypto_shorthash_KEYBYTES_ = crypto_shorthash_siphash24_KEYBYTES_;

function crypto_shorthash_keybytes: Tsize_t; cdecl; external libsodium;

const
  crypto_shorthash_PRIMITIVE_ = 'siphash24';

function crypto_shorthash_primitive: pchar; cdecl; external libsodium;
function crypto_shorthash(out_: pbyte; in_: pbyte; inlen: qword; k: pbyte): longint; cdecl; external libsodium;
procedure crypto_shorthash_keygen(k: pbyte); cdecl; external libsodium;

// === Konventiert am: 31-8-26 17:25:53 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
