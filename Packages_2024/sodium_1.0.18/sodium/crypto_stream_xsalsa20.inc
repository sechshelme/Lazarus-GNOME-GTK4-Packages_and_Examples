{$IFDEF read_interface}



const
  crypto_stream_xsalsa20_KEYBYTES_ = 32;

function crypto_stream_xsalsa20_keybytes: Tsize_t; cdecl; external libsodium;

const
  crypto_stream_xsalsa20_NONCEBYTES_ = 24;

function crypto_stream_xsalsa20_noncebytes: Tsize_t; cdecl; external libsodium;

const
  crypto_stream_xsalsa20_MESSAGEBYTES_MAX_ = SODIUM_SIZE_MAX;

function crypto_stream_xsalsa20_messagebytes_max: Tsize_t; cdecl; external libsodium;
function crypto_stream_xsalsa20(c: pbyte; clen: qword; n: pbyte; k: pbyte): longint; cdecl; external libsodium;
function crypto_stream_xsalsa20_xor(c: pbyte; m: pbyte; mlen: qword; n: pbyte; k: pbyte): longint; cdecl; external libsodium;
function crypto_stream_xsalsa20_xor_ic(c: pbyte; m: pbyte; mlen: qword; n: pbyte; ic: Tuint64_t;
  k: pbyte): longint; cdecl; external libsodium;
procedure crypto_stream_xsalsa20_keygen(k: pbyte); cdecl; external libsodium;

// === Konventiert am: 31-8-26 17:29:05 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
