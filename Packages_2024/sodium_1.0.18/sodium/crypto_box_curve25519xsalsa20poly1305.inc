{$IFDEF read_interface}


const
  crypto_box_curve25519xsalsa20poly1305_SEEDBYTES_ = 32;

function crypto_box_curve25519xsalsa20poly1305_seedbytes: Tsize_t; cdecl; external libsodium;

const
  crypto_box_curve25519xsalsa20poly1305_PUBLICKEYBYTES_ = 32;

function crypto_box_curve25519xsalsa20poly1305_publickeybytes: Tsize_t; cdecl; external libsodium;

const
  crypto_box_curve25519xsalsa20poly1305_SECRETKEYBYTES_ = 32;

function crypto_box_curve25519xsalsa20poly1305_secretkeybytes: Tsize_t; cdecl; external libsodium;

const
  crypto_box_curve25519xsalsa20poly1305_BEFORENMBYTES_ = 32;

function crypto_box_curve25519xsalsa20poly1305_beforenmbytes: Tsize_t; cdecl; external libsodium;

const
  crypto_box_curve25519xsalsa20poly1305_NONCEBYTES_ = 24;

function crypto_box_curve25519xsalsa20poly1305_noncebytes: Tsize_t; cdecl; external libsodium;

const
  crypto_box_curve25519xsalsa20poly1305_MACBYTES_ = 16;

function crypto_box_curve25519xsalsa20poly1305_macbytes: Tsize_t; cdecl; external libsodium;

const
  crypto_box_curve25519xsalsa20poly1305_MESSAGEBYTES_MAX_ = crypto_stream_xsalsa20_MESSAGEBYTES_MAX_ - crypto_box_curve25519xsalsa20poly1305_MACBYTES_;

function crypto_box_curve25519xsalsa20poly1305_messagebytes_max: Tsize_t; cdecl; external libsodium;
function crypto_box_curve25519xsalsa20poly1305_seed_keypair(pk: pbyte; sk: pbyte; seed: pbyte): longint; cdecl; external libsodium;
function crypto_box_curve25519xsalsa20poly1305_keypair(pk: pbyte; sk: pbyte): longint; cdecl; external libsodium;
function crypto_box_curve25519xsalsa20poly1305_beforenm(k: pbyte; pk: pbyte; sk: pbyte): longint; cdecl; external libsodium;

const
  crypto_box_curve25519xsalsa20poly1305_BOXZEROBYTES_ = 16;

function crypto_box_curve25519xsalsa20poly1305_boxzerobytes: Tsize_t; cdecl; external libsodium;

const
  crypto_box_curve25519xsalsa20poly1305_ZEROBYTES_ = crypto_box_curve25519xsalsa20poly1305_BOXZEROBYTES_ + crypto_box_curve25519xsalsa20poly1305_MACBYTES_;

function crypto_box_curve25519xsalsa20poly1305_zerobytes: Tsize_t; cdecl; external libsodium;
function crypto_box_curve25519xsalsa20poly1305(c: pbyte; m: pbyte; mlen: qword; n: pbyte; pk: pbyte;
  sk: pbyte): longint; cdecl; external libsodium;
function crypto_box_curve25519xsalsa20poly1305_open(m: pbyte; c: pbyte; clen: qword; n: pbyte; pk: pbyte;
  sk: pbyte): longint; cdecl; external libsodium;
function crypto_box_curve25519xsalsa20poly1305_afternm(c: pbyte; m: pbyte; mlen: qword; n: pbyte; k: pbyte): longint; cdecl; external libsodium;
function crypto_box_curve25519xsalsa20poly1305_open_afternm(m: pbyte; c: pbyte; clen: qword; n: pbyte; k: pbyte): longint; cdecl; external libsodium;

// === Konventiert am: 31-8-26 16:26:24 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
