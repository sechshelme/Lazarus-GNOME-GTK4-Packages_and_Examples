{$IFDEF read_interface}


function sodium_init: longint; cdecl; external libsodium;
function sodium_set_misuse_handler(handler: Tprocedure): longint; cdecl; external libsodium;
procedure sodium_misuse; cdecl; external libsodium;

// === Konventiert am: 31-8-26 15:49:17 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
