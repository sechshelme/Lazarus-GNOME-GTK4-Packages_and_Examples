{$IFDEF read_interface}


const
  crypto_scalarmult_curve25519_BYTES_ = 32;  

function crypto_scalarmult_curve25519_bytes:Tsize_t;cdecl;external libsodium;

const
  crypto_scalarmult_curve25519_SCALARBYTES_ = 32;  

function crypto_scalarmult_curve25519_scalarbytes:Tsize_t;cdecl;external libsodium;
function crypto_scalarmult_curve25519(q:Pbyte; n:Pbyte; p:Pbyte):longint;cdecl;external libsodium;
function crypto_scalarmult_curve25519_base(q:Pbyte; n:Pbyte):longint;cdecl;external libsodium;

// === Konventiert am: 31-8-26 17:19:39 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
