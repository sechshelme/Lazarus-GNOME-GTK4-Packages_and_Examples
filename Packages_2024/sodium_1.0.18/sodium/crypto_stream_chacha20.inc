{$IFDEF read_interface}


const
  crypto_stream_chacha20_KEYBYTES_ = 32;

function crypto_stream_chacha20_keybytes: Tsize_t; cdecl; external libsodium;

const
  crypto_stream_chacha20_NONCEBYTES_ = 8;

function crypto_stream_chacha20_noncebytes: Tsize_t; cdecl; external libsodium;

const
  crypto_stream_chacha20_MESSAGEBYTES_MAX_ = SODIUM_SIZE_MAX;

function crypto_stream_chacha20_messagebytes_max: Tsize_t; cdecl; external libsodium;
function crypto_stream_chacha20(c: pbyte; clen: qword; n: pbyte; k: pbyte): longint; cdecl; external libsodium;
function crypto_stream_chacha20_xor(c: pbyte; m: pbyte; mlen: qword; n: pbyte; k: pbyte): longint; cdecl; external libsodium;
function crypto_stream_chacha20_xor_ic(c: pbyte; m: pbyte; mlen: qword; n: pbyte; ic: Tuint64_t;
  k: pbyte): longint; cdecl; external libsodium;
procedure crypto_stream_chacha20_keygen(k: pbyte); cdecl; external libsodium;

const
  crypto_stream_chacha20_ietf_KEYBYTES_ = 32;

function crypto_stream_chacha20_ietf_keybytes: Tsize_t; cdecl; external libsodium;

const
  crypto_stream_chacha20_ietf_NONCEBYTES_ = 12;

function crypto_stream_chacha20_ietf_noncebytes: Tsize_t; cdecl; external libsodium;

const
  crypto_stream_chacha20_ietf_MESSAGEBYTES_MAX_ = SODIUM_SIZE_MAX;

function crypto_stream_chacha20_ietf_messagebytes_max: Tsize_t; cdecl; external libsodium;
function crypto_stream_chacha20_ietf(c: pbyte; clen: qword; n: pbyte; k: pbyte): longint; cdecl; external libsodium;
function crypto_stream_chacha20_ietf_xor(c: pbyte; m: pbyte; mlen: qword; n: pbyte; k: pbyte): longint; cdecl; external libsodium;
function crypto_stream_chacha20_ietf_xor_ic(c: pbyte; m: pbyte; mlen: qword; n: pbyte; ic: Tuint32_t;
  k: pbyte): longint; cdecl; external libsodium;
procedure crypto_stream_chacha20_ietf_keygen(k: pbyte); cdecl; external libsodium;

// === Konventiert am: 31-8-26 17:25:39 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ENDIF read_implementation}
