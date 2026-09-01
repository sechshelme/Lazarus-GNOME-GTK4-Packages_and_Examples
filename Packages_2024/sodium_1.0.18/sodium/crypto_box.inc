{$IFDEF read_interface}


const
  crypto_box_SEEDBYTES_ = crypto_box_curve25519xsalsa20poly1305_SEEDBYTES_;

function crypto_box_seedbytes: Tsize_t; cdecl; external libsodium;

const
  crypto_box_PUBLICKEYBYTES_ = crypto_box_curve25519xsalsa20poly1305_PUBLICKEYBYTES_;

function crypto_box_publickeybytes: Tsize_t; cdecl; external libsodium;

const
  crypto_box_SECRETKEYBYTES_ = crypto_box_curve25519xsalsa20poly1305_SECRETKEYBYTES_;

function crypto_box_secretkeybytes: Tsize_t; cdecl; external libsodium;

const
  crypto_box_NONCEBYTES_ = crypto_box_curve25519xsalsa20poly1305_NONCEBYTES_;

function crypto_box_noncebytes: Tsize_t; cdecl; external libsodium;

const
  crypto_box_MACBYTES_ = crypto_box_curve25519xsalsa20poly1305_MACBYTES_;

function crypto_box_macbytes: Tsize_t; cdecl; external libsodium;

const
  crypto_box_MESSAGEBYTES_MAX_ = crypto_box_curve25519xsalsa20poly1305_MESSAGEBYTES_MAX_;

function crypto_box_messagebytes_max: Tsize_t; cdecl; external libsodium;
const
  crypto_box_PRIMITIVE_ = 'curve25519xsalsa20poly1305';

function crypto_box_primitive: pchar; cdecl; external libsodium;
function crypto_box_seed_keypair(pk: pbyte; sk: pbyte; seed: pbyte): longint; cdecl; external libsodium;
function crypto_box_keypair(pk: pbyte; sk: pbyte): longint; cdecl; external libsodium;
function crypto_box_easy(c: pbyte; m: pbyte; mlen: qword; n: pbyte; pk: pbyte;
  sk: pbyte): longint; cdecl; external libsodium;
function crypto_box_open_easy(m: pbyte; c: pbyte; clen: qword; n: pbyte; pk: pbyte;
  sk: pbyte): longint; cdecl; external libsodium;
function crypto_box_detached(c: pbyte; mac: pbyte; m: pbyte; mlen: qword; n: pbyte;
  pk: pbyte; sk: pbyte): longint; cdecl; external libsodium;
function crypto_box_open_detached(m: pbyte; c: pbyte; mac: pbyte; clen: qword; n: pbyte;
  pk: pbyte; sk: pbyte): longint; cdecl; external libsodium;

const
  crypto_box_BEFORENMBYTES_ = crypto_box_curve25519xsalsa20poly1305_BEFORENMBYTES_;

function crypto_box_beforenmbytes: Tsize_t; cdecl; external libsodium;
function crypto_box_beforenm(k: pbyte; pk: pbyte; sk: pbyte): longint; cdecl; external libsodium;
function crypto_box_easy_afternm(c: pbyte; m: pbyte; mlen: qword; n: pbyte; k: pbyte): longint; cdecl; external libsodium;
function crypto_box_open_easy_afternm(m: pbyte; c: pbyte; clen: qword; n: pbyte; k: pbyte): longint; cdecl; external libsodium;
function crypto_box_detached_afternm(c: pbyte; mac: pbyte; m: pbyte; mlen: qword; n: pbyte;
  k: pbyte): longint; cdecl; external libsodium;
function crypto_box_open_detached_afternm(m: pbyte; c: pbyte; mac: pbyte; clen: qword; n: pbyte;
  k: pbyte): longint; cdecl; external libsodium;

const
  crypto_box_SEALBYTES_ = crypto_box_PUBLICKEYBYTES_ + crypto_box_MACBYTES_;

function crypto_box_sealbytes: Tsize_t; cdecl; external libsodium;
function crypto_box_seal(c: pbyte; m: pbyte; mlen: qword; pk: pbyte): longint; cdecl; external libsodium;
function crypto_box_seal_open(m: pbyte; c: pbyte; clen: qword; pk: pbyte; sk: pbyte): longint; cdecl; external libsodium;

const
  crypto_box_ZEROBYTES_ = crypto_box_curve25519xsalsa20poly1305_ZEROBYTES_;

function crypto_box_zerobytes: Tsize_t; cdecl; external libsodium;

const
  crypto_box_BOXZEROBYTES_ = crypto_box_curve25519xsalsa20poly1305_BOXZEROBYTES_;

function crypto_box_boxzerobytes: Tsize_t; cdecl; external libsodium;
function crypto_box(c: pbyte; m: pbyte; mlen: qword; n: pbyte; pk: pbyte;
  sk: pbyte): longint; cdecl; external libsodium;
function crypto_box_open(m: pbyte; c: pbyte; clen: qword; n: pbyte; pk: pbyte;
  sk: pbyte): longint; cdecl; external libsodium;
function crypto_box_afternm(c: pbyte; m: pbyte; mlen: qword; n: pbyte; k: pbyte): longint; cdecl; external libsodium;
function crypto_box_open_afternm(m: pbyte; c: pbyte; clen: qword; n: pbyte; k: pbyte): longint; cdecl; external libsodium;

// === Konventiert am: 31-8-26 15:48:56 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
