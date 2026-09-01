{$IFDEF read_interface}


const
  crypto_scalarmult_ed25519_BYTES_ = 32;

function crypto_scalarmult_ed25519_bytes: Tsize_t; cdecl; external libsodium;

const
  crypto_scalarmult_ed25519_SCALARBYTES_ = 32;

function crypto_scalarmult_ed25519_scalarbytes: Tsize_t; cdecl; external libsodium;
function crypto_scalarmult_ed25519(q: pbyte; n: pbyte; p: pbyte): longint; cdecl; external libsodium;
function crypto_scalarmult_ed25519_noclamp(q: pbyte; n: pbyte; p: pbyte): longint; cdecl; external libsodium;
function crypto_scalarmult_ed25519_base(q: pbyte; n: pbyte): longint; cdecl; external libsodium;
function crypto_scalarmult_ed25519_base_noclamp(q: pbyte; n: pbyte): longint; cdecl; external libsodium;

// === Konventiert am: 31-8-26 17:19:11 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
