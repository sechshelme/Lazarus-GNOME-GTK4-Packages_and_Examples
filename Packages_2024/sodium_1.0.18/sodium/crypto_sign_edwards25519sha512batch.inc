{$IFDEF read_interface}


const
  crypto_sign_edwards25519sha512batch_BYTES = 64;
  crypto_sign_edwards25519sha512batch_PUBLICKEYBYTES = 32;
  crypto_sign_edwards25519sha512batch_SECRETKEYBYTES = 32 + 32;
  crypto_sign_edwards25519sha512batch_MESSAGEBYTES_MAX = SODIUM_SIZE_MAX - crypto_sign_edwards25519sha512batch_BYTES;

function crypto_sign_edwards25519sha512batch(sm: pbyte; smlen_p: Pqword; m: pbyte; mlen: qword; sk: pbyte): longint; cdecl; external libsodium;
function crypto_sign_edwards25519sha512batch_open(m: pbyte; mlen_p: Pqword; sm: pbyte; smlen: qword; pk: pbyte): longint; cdecl; external libsodium;
function crypto_sign_edwards25519sha512batch_keypair(pk: pbyte; sk: pbyte): longint; cdecl; external libsodium;

// === Konventiert am: 31-8-26 17:25:44 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
