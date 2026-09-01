{$IFDEF read_interface}


const
  crypto_scalarmult_ristretto255_BYTES_ = 32;

function crypto_scalarmult_ristretto255_bytes: Tsize_t; cdecl; external libsodium;

const
  crypto_scalarmult_ristretto255_SCALARBYTES_ = 32;

function crypto_scalarmult_ristretto255_scalarbytes: Tsize_t; cdecl; external libsodium;
function crypto_scalarmult_ristretto255(q: pbyte; n: pbyte; p: pbyte): longint; cdecl; external libsodium;
function crypto_scalarmult_ristretto255_base(q: pbyte; n: pbyte): longint; cdecl; external libsodium;

// === Konventiert am: 31-8-26 17:19:08 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
