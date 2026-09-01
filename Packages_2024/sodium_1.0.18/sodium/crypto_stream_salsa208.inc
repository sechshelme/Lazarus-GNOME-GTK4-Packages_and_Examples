{$IFDEF read_interface}


const
  crypto_stream_salsa208_KEYBYTES_ = 32;

function crypto_stream_salsa208_keybytes: Tsize_t; cdecl; external libsodium; deprecated;

const
  crypto_stream_salsa208_NONCEBYTES_ = 8;

function crypto_stream_salsa208_noncebytes: Tsize_t; cdecl; external libsodium; deprecated;

const
  crypto_stream_salsa208_MESSAGEBYTES_MAX_ = SODIUM_SIZE_MAX;

function crypto_stream_salsa208_messagebytes_max: Tsize_t; cdecl; external libsodium; deprecated;
function crypto_stream_salsa208(c: pbyte; clen: qword; n: pbyte; k: pbyte): longint; cdecl; external libsodium; deprecated;
function crypto_stream_salsa208_xor(c: pbyte; m: pbyte; mlen: qword; n: pbyte; k: pbyte): longint; cdecl; external libsodium; deprecated;
procedure crypto_stream_salsa208_keygen(k: pbyte); cdecl; external libsodium; deprecated;

// === Konventiert am: 31-8-26 17:25:35 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
