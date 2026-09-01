{$IFDEF read_interface}


const
  crypto_verify_64_BYTES_ = 64;

function crypto_verify_64_bytes: Tsize_t; cdecl; external libsodium;
function crypto_verify_64(x: pbyte; y: pbyte): longint; cdecl; external libsodium;

// === Konventiert am: 31-8-26 17:28:58 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
