{$IFDEF read_interface}


const
  crypto_verify_32_BYTES_ = 32;

function crypto_verify_32_bytes: Tsize_t; cdecl; external libsodium;
function crypto_verify_32(x: pbyte; y: pbyte): longint; cdecl; external libsodium;

// === Konventiert am: 31-8-26 17:29:00 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
