{$IFDEF read_interface}


const
  crypto_secretbox_xsalsa20poly1305_KEYBYTES_ = 32;

function crypto_secretbox_xsalsa20poly1305_keybytes: Tsize_t; cdecl; external libsodium;

const
  crypto_secretbox_xsalsa20poly1305_NONCEBYTES_ = 24;

function crypto_secretbox_xsalsa20poly1305_noncebytes: Tsize_t; cdecl; external libsodium;

const
  crypto_secretbox_xsalsa20poly1305_MACBYTES_ = 16;

function crypto_secretbox_xsalsa20poly1305_macbytes: Tsize_t; cdecl; external libsodium;

const
  crypto_secretbox_xsalsa20poly1305_MESSAGEBYTES_MAX_ = crypto_stream_xsalsa20_MESSAGEBYTES_MAX_ - crypto_secretbox_xsalsa20poly1305_MACBYTES_;

function crypto_secretbox_xsalsa20poly1305_messagebytes_max: Tsize_t; cdecl; external libsodium;
function crypto_secretbox_xsalsa20poly1305(c: pbyte; m: pbyte; mlen: qword; n: pbyte; k: pbyte): longint; cdecl; external libsodium;
function crypto_secretbox_xsalsa20poly1305_open(m: pbyte; c: pbyte; clen: qword; n: pbyte; k: pbyte): longint; cdecl; external libsodium;
procedure crypto_secretbox_xsalsa20poly1305_keygen(k: pbyte); cdecl; external libsodium;

const
  crypto_secretbox_xsalsa20poly1305_BOXZEROBYTES_ = 16;

function crypto_secretbox_xsalsa20poly1305_boxzerobytes: Tsize_t; cdecl; external libsodium;

const
  crypto_secretbox_xsalsa20poly1305_ZEROBYTES_ = crypto_secretbox_xsalsa20poly1305_BOXZEROBYTES_ + crypto_secretbox_xsalsa20poly1305_MACBYTES_;

function crypto_secretbox_xsalsa20poly1305_zerobytes: Tsize_t; cdecl; external libsodium;

// === Konventiert am: 31-8-26 17:19:00 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
