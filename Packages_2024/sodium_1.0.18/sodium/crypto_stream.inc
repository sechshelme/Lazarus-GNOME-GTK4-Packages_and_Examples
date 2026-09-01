{$IFDEF read_interface}


const
  crypto_stream_KEYBYTES_ = crypto_stream_xsalsa20_KEYBYTES_;

function crypto_stream_keybytes: Tsize_t; cdecl; external libsodium;

const
  crypto_stream_NONCEBYTES_ = crypto_stream_xsalsa20_NONCEBYTES_;

function crypto_stream_noncebytes: Tsize_t; cdecl; external libsodium;

const
  crypto_stream_MESSAGEBYTES_MAX_ = crypto_stream_xsalsa20_MESSAGEBYTES_MAX_;

function crypto_stream_messagebytes_max: Tsize_t; cdecl; external libsodium;

const
  crypto_stream_PRIMITIVE_ = 'xsalsa20';

function crypto_stream_primitive: pchar; cdecl; external libsodium;
function crypto_stream(c: pbyte; clen: qword; n: pbyte; k: pbyte): longint; cdecl; external libsodium;
function crypto_stream_xor(c: pbyte; m: pbyte; mlen: qword; n: pbyte; k: pbyte): longint; cdecl; external libsodium;
procedure crypto_stream_keygen(k: pbyte); cdecl; external libsodium;

// === Konventiert am: 31-8-26 17:25:41 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
