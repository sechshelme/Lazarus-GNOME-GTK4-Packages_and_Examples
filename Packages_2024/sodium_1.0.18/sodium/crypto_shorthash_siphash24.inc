{$IFDEF read_interface}


const
  crypto_shorthash_siphash24_BYTES_ = 8;

function crypto_shorthash_siphash24_bytes: Tsize_t; cdecl; external libsodium;

const
  crypto_shorthash_siphash24_KEYBYTES_ = 16;

function crypto_shorthash_siphash24_keybytes: Tsize_t; cdecl; external libsodium;
function crypto_shorthash_siphash24(out_: pbyte; in_: pbyte; inlen: qword; k: pbyte): longint; cdecl; external libsodium;

const
  crypto_shorthash_siphashx24_BYTES_ = 16;

function crypto_shorthash_siphashx24_bytes: Tsize_t; cdecl; external libsodium;
const
  crypto_shorthash_siphashx24_KEYBYTES_ = 16;

function crypto_shorthash_siphashx24_keybytes: Tsize_t; cdecl; external libsodium;
function crypto_shorthash_siphashx24(out_: pbyte; in_: pbyte; inlen: qword; k: pbyte): longint; cdecl; external libsodium;

// === Konventiert am: 31-8-26 17:25:51 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
