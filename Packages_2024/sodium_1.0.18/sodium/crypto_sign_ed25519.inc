{$IFDEF read_interface}


type
  Pcrypto_sign_ed25519ph_state = ^Tcrypto_sign_ed25519ph_state;
  Tcrypto_sign_ed25519ph_state = record
    hs: Tcrypto_hash_sha512_state;
  end;

function crypto_sign_ed25519ph_statebytes: Tsize_t; cdecl; external libsodium;

const
  crypto_sign_ed25519_BYTES_ = 64;

function crypto_sign_ed25519_bytes: Tsize_t; cdecl; external libsodium;

const
  crypto_sign_ed25519_SEEDBYTES_ = 32;

function crypto_sign_ed25519_seedbytes: Tsize_t; cdecl; external libsodium;

const
  crypto_sign_ed25519_PUBLICKEYBYTES_ = 32;

function crypto_sign_ed25519_publickeybytes: Tsize_t; cdecl; external libsodium;

const
  crypto_sign_ed25519_SECRETKEYBYTES_ = 32 + 32;

function crypto_sign_ed25519_secretkeybytes: Tsize_t; cdecl; external libsodium;
const
  crypto_sign_ed25519_MESSAGEBYTES_MAX_ = SODIUM_SIZE_MAX - crypto_sign_ed25519_BYTES_;

function crypto_sign_ed25519_messagebytes_max: Tsize_t; cdecl; external libsodium;
function crypto_sign_ed25519(sm: pbyte; smlen_p: Pqword; m: pbyte; mlen: qword; sk: pbyte): longint; cdecl; external libsodium;
function crypto_sign_ed25519_open(m: pbyte; mlen_p: Pqword; sm: pbyte; smlen: qword; pk: pbyte): longint; cdecl; external libsodium;
function crypto_sign_ed25519_detached(sig: pbyte; siglen_p: Pqword; m: pbyte; mlen: qword; sk: pbyte): longint; cdecl; external libsodium;
function crypto_sign_ed25519_verify_detached(sig: pbyte; m: pbyte; mlen: qword; pk: pbyte): longint; cdecl; external libsodium;
function crypto_sign_ed25519_keypair(pk: pbyte; sk: pbyte): longint; cdecl; external libsodium;
function crypto_sign_ed25519_seed_keypair(pk: pbyte; sk: pbyte; seed: pbyte): longint; cdecl; external libsodium;
function crypto_sign_ed25519_pk_to_curve25519(curve25519_pk: pbyte; ed25519_pk: pbyte): longint; cdecl; external libsodium;
function crypto_sign_ed25519_sk_to_curve25519(curve25519_sk: pbyte; ed25519_sk: pbyte): longint; cdecl; external libsodium;
function crypto_sign_ed25519_sk_to_seed(seed: pbyte; sk: pbyte): longint; cdecl; external libsodium;
function crypto_sign_ed25519_sk_to_pk(pk: pbyte; sk: pbyte): longint; cdecl; external libsodium;
function crypto_sign_ed25519ph_init(state: Pcrypto_sign_ed25519ph_state): longint; cdecl; external libsodium;
function crypto_sign_ed25519ph_update(state: Pcrypto_sign_ed25519ph_state; m: pbyte; mlen: qword): longint; cdecl; external libsodium;
function crypto_sign_ed25519ph_final_create(state: Pcrypto_sign_ed25519ph_state; sig: pbyte; siglen_p: Pqword; sk: pbyte): longint; cdecl; external libsodium;
function crypto_sign_ed25519ph_final_verify(state: Pcrypto_sign_ed25519ph_state; sig: pbyte; pk: pbyte): longint; cdecl; external libsodium;

// === Konventiert am: 31-8-26 17:25:46 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
