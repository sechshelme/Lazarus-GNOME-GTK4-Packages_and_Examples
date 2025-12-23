{$IFDEF read_interface}


var
  av_tea_size: longint; cvar;external libavutil;

type
  PAVTEA = type Pointer;

function av_tea_alloc: PAVTEA; cdecl; external libavutil;
procedure av_tea_init(ctx: PAVTEA; key: Puint8_t; rounds: longint); cdecl; external libavutil;
procedure av_tea_crypt(ctx: PAVTEA; dst: Puint8_t; src: Puint8_t; count: longint; iv: Puint8_t; decrypt: longint); cdecl; external libavutil;

// === Konventiert am: 14-12-25 17:42:26 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
