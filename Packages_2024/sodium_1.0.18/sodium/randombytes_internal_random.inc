{$IFDEF read_interface}


var
  randombytes_internal_implementation: Trandombytes_implementation; cvar;external libsodium;
  randombytes_salsa20_implementation: Trandombytes_implementation absolute randombytes_internal_implementation;

  // === Konventiert am: 31-8-26 17:34:00 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
