{$IFDEF read_interface}


const
  crypto_verify_16_BYTES_ = 16;

function crypto_verify_16_bytes: Tsize_t; cdecl; external libsodium;
function crypto_verify_16(x: pbyte; y: pbyte): longint; cdecl; external libsodium;

// === Konventiert am: 31-8-26 17:29:03 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
