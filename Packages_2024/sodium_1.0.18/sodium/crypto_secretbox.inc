{$IFDEF read_interface}


const
  crypto_secretbox_KEYBYTES_ = crypto_secretbox_xsalsa20poly1305_KEYBYTES_;

function crypto_secretbox_keybytes: Tsize_t; cdecl; external libsodium;

const
  crypto_secretbox_NONCEBYTES_ = crypto_secretbox_xsalsa20poly1305_NONCEBYTES_;

function crypto_secretbox_noncebytes: Tsize_t; cdecl; external libsodium;

const
  crypto_secretbox_MACBYTES_ = crypto_secretbox_xsalsa20poly1305_MACBYTES_;

function crypto_secretbox_macbytes: Tsize_t; cdecl; external libsodium;

const
  crypto_secretbox_PRIMITIVE_ = 'xsalsa20poly1305';

function crypto_secretbox_primitive: pchar; cdecl; external libsodium;

const
  crypto_secretbox_MESSAGEBYTES_MAX_ = crypto_secretbox_xsalsa20poly1305_MESSAGEBYTES_MAX_;

function crypto_secretbox_messagebytes_max: Tsize_t; cdecl; external libsodium;
function crypto_secretbox_easy(c: pbyte; m: pbyte; mlen: qword; n: pbyte; k: pbyte): longint; cdecl; external libsodium;
function crypto_secretbox_open_easy(m: pbyte; c: pbyte; clen: qword; n: pbyte; k: pbyte): longint; cdecl; external libsodium;
function crypto_secretbox_detached(c: pbyte; mac: pbyte; m: pbyte; mlen: qword; n: pbyte;
  k: pbyte): longint; cdecl; external libsodium;
function crypto_secretbox_open_detached(m: pbyte; c: pbyte; mac: pbyte; clen: qword; n: pbyte;
  k: pbyte): longint; cdecl; external libsodium;
procedure crypto_secretbox_keygen(k: pbyte); cdecl; external libsodium;

const
  crypto_secretbox_ZEROBYTES_ = crypto_secretbox_xsalsa20poly1305_ZEROBYTES_;

function crypto_secretbox_zerobytes: Tsize_t; cdecl; external libsodium;

const
  crypto_secretbox_BOXZEROBYTES_ = crypto_secretbox_xsalsa20poly1305_BOXZEROBYTES_;

function crypto_secretbox_boxzerobytes: Tsize_t; cdecl; external libsodium;
function crypto_secretbox(c: pbyte; m: pbyte; mlen: qword; n: pbyte; k: pbyte): longint; cdecl; external libsodium;
function crypto_secretbox_open(m: pbyte; c: pbyte; clen: qword; n: pbyte; k: pbyte): longint; cdecl; external libsodium;

// === Konventiert am: 31-8-26 17:19:06 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
