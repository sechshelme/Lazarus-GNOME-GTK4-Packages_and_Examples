{$IFDEF read_interface}


var
  av_sha_size: longint; cvar;external libavutil;

type
  PAVSHA = type Pointer;

function av_sha_alloc: PAVSHA; cdecl; external libavutil;
function av_sha_init(context: PAVSHA; bits: longint): longint; cdecl; external libavutil;
procedure av_sha_update(ctx: PAVSHA; data: Puint8_t; len: Tsize_t); cdecl; external libavutil;
procedure av_sha_final(context: PAVSHA; digest: Puint8_t); cdecl; external libavutil;

// === Konventiert am: 14-12-25 17:37:15 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
