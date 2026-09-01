{$IFDEF read_interface}


type
  Pcrypto_sign_state = ^Tcrypto_sign_state;
  Tcrypto_sign_state = Tcrypto_sign_ed25519ph_state;

function crypto_sign_statebytes: Tsize_t; cdecl; external libsodium;

const
  crypto_sign_BYTES_ = crypto_sign_ed25519_BYTES_;

function crypto_sign_bytes: Tsize_t; cdecl; external libsodium;

const
  crypto_sign_SEEDBYTES_ = crypto_sign_ed25519_SEEDBYTES_;

function crypto_sign_seedbytes: Tsize_t; cdecl; external libsodium;

const
  crypto_sign_PUBLICKEYBYTES_ = crypto_sign_ed25519_PUBLICKEYBYTES_;

function crypto_sign_publickeybytes: Tsize_t; cdecl; external libsodium;

const
  crypto_sign_SECRETKEYBYTES_ = crypto_sign_ed25519_SECRETKEYBYTES_;

function crypto_sign_secretkeybytes: Tsize_t; cdecl; external libsodium;

const
  crypto_sign_MESSAGEBYTES_MAX_ = crypto_sign_ed25519_MESSAGEBYTES_MAX_;

function crypto_sign_messagebytes_max: Tsize_t; cdecl; external libsodium;

const
  crypto_sign_PRIMITIVE_ = 'ed25519';

function crypto_sign_primitive: pchar; cdecl; external libsodium;
function crypto_sign_seed_keypair(pk: pbyte; sk: pbyte; seed: pbyte): longint; cdecl; external libsodium;
function crypto_sign_keypair(pk: pbyte; sk: pbyte): longint; cdecl; external libsodium;
function crypto_sign(sm: pbyte; smlen_p: Pqword; m: pbyte; mlen: qword; sk: pbyte): longint; cdecl; external libsodium;
function crypto_sign_open(m: pbyte; mlen_p: Pqword; sm: pbyte; smlen: qword; pk: pbyte): longint; cdecl; external libsodium;
function crypto_sign_detached(sig: pbyte; siglen_p: Pqword; m: pbyte; mlen: qword; sk: pbyte): longint; cdecl; external libsodium;
function crypto_sign_verify_detached(sig: pbyte; m: pbyte; mlen: qword; pk: pbyte): longint; cdecl; external libsodium;
function crypto_sign_init(state: Pcrypto_sign_state): longint; cdecl; external libsodium;
function crypto_sign_update(state: Pcrypto_sign_state; m: pbyte; mlen: qword): longint; cdecl; external libsodium;
function crypto_sign_final_create(state: Pcrypto_sign_state; sig: pbyte; siglen_p: Pqword; sk: pbyte): longint; cdecl; external libsodium;
function crypto_sign_final_verify(state: Pcrypto_sign_state; sig: pbyte; pk: pbyte): longint; cdecl; external libsodium;

// === Konventiert am: 31-8-26 17:25:49 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
