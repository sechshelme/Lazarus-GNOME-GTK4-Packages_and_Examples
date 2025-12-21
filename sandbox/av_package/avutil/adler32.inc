{$IFDEF read_interface}


type
  PAVAdler = ^TAVAdler;
  TAVAdler = Tuint32_t;

function av_adler32_update(adler: TAVAdler; buf: Puint8_t; len: Tsize_t): TAVAdler; cdecl; external libavutil;

// === Konventiert am: 14-12-25 15:59:30 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
