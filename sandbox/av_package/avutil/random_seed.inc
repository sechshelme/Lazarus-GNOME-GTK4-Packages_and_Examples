{$IFDEF read_interface}


function av_get_random_seed: Tuint32_t; cdecl; external libavutil;
function av_random_bytes(buf: Puint8_t; len: Tsize_t): longint; cdecl; external libavutil;

// === Konventiert am: 14-12-25 17:37:01 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
