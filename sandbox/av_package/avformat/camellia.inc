{$IFDEF read_interface}


var
  av_camellia_size: longint; cvar;external libavutil;

type
  PAVCAMELLIA = type Pointer;

function av_camellia_alloc: PAVCAMELLIA; cdecl; external libavutil;
function av_camellia_init(ctx: PAVCAMELLIA; key: Puint8_t; key_bits: longint): longint; cdecl; external libavutil;
procedure av_camellia_crypt(ctx: PAVCAMELLIA; dst: Puint8_t; src: Puint8_t; count: longint; iv: Puint8_t; decrypt: longint); cdecl; external libavutil;

// === Konventiert am: 14-12-25 15:59:59 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
