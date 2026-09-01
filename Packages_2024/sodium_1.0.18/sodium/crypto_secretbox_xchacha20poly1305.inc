{$IFDEF read_interface}


const
  crypto_secretbox_xchacha20poly1305_KEYBYTES_ = 32;

function crypto_secretbox_xchacha20poly1305_keybytes: Tsize_t; cdecl; external libsodium;

const
  crypto_secretbox_xchacha20poly1305_NONCEBYTES_ = 24;

function crypto_secretbox_xchacha20poly1305_noncebytes: Tsize_t; cdecl; external libsodium;

const
  crypto_secretbox_xchacha20poly1305_MACBYTES_ = 16;

function crypto_secretbox_xchacha20poly1305_macbytes: Tsize_t; cdecl; external libsodium;

const
  crypto_secretbox_xchacha20poly1305_MESSAGEBYTES_MAX_ = crypto_stream_xchacha20_MESSAGEBYTES_MAX_ - crypto_secretbox_xchacha20poly1305_MACBYTES_;

function crypto_secretbox_xchacha20poly1305_messagebytes_max: Tsize_t; cdecl; external libsodium;
function crypto_secretbox_xchacha20poly1305_easy(c: pbyte; m: pbyte; mlen: qword; n: pbyte; k: pbyte): longint; cdecl; external libsodium;
function crypto_secretbox_xchacha20poly1305_open_easy(m: pbyte; c: pbyte; clen: qword; n: pbyte; k: pbyte): longint; cdecl; external libsodium;
function crypto_secretbox_xchacha20poly1305_detached(c: pbyte; mac: pbyte; m: pbyte; mlen: qword; n: pbyte;
  k: pbyte): longint; cdecl; external libsodium;
function crypto_secretbox_xchacha20poly1305_open_detached(m: pbyte; c: pbyte; mac: pbyte; clen: qword; n: pbyte;
  k: pbyte): longint; cdecl; external libsodium;

// === Konventiert am: 31-8-26 17:19:03 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
