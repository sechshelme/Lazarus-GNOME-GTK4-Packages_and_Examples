unit md5;

interface

uses
  fp_ffmpeg;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


var
  av_md5_size: longint; cvar;external libavutil;

type
  PAVMD5 = type Pointer;

function av_md5_alloc: PAVMD5; cdecl; external libavutil;
procedure av_md5_init(ctx: PAVMD5); cdecl; external libavutil;
procedure av_md5_update(ctx: PAVMD5; src: Puint8_t; len: Tsize_t); cdecl; external libavutil;
procedure av_md5_final(ctx: PAVMD5; dst: Puint8_t); cdecl; external libavutil;
procedure av_md5_sum(dst: Puint8_t; src: Puint8_t; len: Tsize_t); cdecl; external libavutil;

// === Konventiert am: 14-12-25 17:31:11 ===


implementation



end.
