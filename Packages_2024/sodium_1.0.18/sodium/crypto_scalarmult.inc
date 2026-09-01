{$IFDEF read_interface}


const
  crypto_scalarmult_BYTES_ = crypto_scalarmult_curve25519_BYTES_;

function crypto_scalarmult_bytes: Tsize_t; cdecl; external libsodium;

const
  crypto_scalarmult_SCALARBYTES_ = crypto_scalarmult_curve25519_SCALARBYTES_;

function crypto_scalarmult_scalarbytes: Tsize_t; cdecl; external libsodium;

const
  crypto_scalarmult_PRIMITIVE_ = 'curve25519';

function crypto_scalarmult_primitive: pchar; cdecl; external libsodium;
function crypto_scalarmult_base(q: pbyte; n: pbyte): longint; cdecl; external libsodium;
function crypto_scalarmult(q: pbyte; n: pbyte; p: pbyte): longint; cdecl; external libsodium;

// === Konventiert am: 31-8-26 17:19:13 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
