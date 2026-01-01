{$IFDEF read_interface}


function fribidi_debug_status: longint; cdecl; external libfribidi;
function fribidi_set_debug(state: longint): longint; cdecl; external libfribidi;

// === Konventiert am: 31-12-25 16:08:54 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
