{$IFDEF read_interface}

type
  TAVXTEA = record
    key: array[0..15] of Tuint32_t;
  end;
  PAVXTEA = ^TAVXTEA;

function av_xtea_alloc: PAVXTEA; cdecl; external libavutil;
procedure av_xtea_init(ctx: PAVXTEA; key: Puint8_t); cdecl; external libavutil;
procedure av_xtea_le_init(ctx: PAVXTEA; key: Puint8_t); cdecl; external libavutil;
procedure av_xtea_crypt(ctx: PAVXTEA; dst: Puint8_t; src: Puint8_t; count: longint; iv: Puint8_t; decrypt: longint); cdecl; external libavutil;
procedure av_xtea_le_crypt(ctx: PAVXTEA; dst: Puint8_t; src: Puint8_t; count: longint; iv: Puint8_t; decrypt: longint); cdecl; external libavutil;

// === Konventiert am: 14-12-25 17:41:50 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
