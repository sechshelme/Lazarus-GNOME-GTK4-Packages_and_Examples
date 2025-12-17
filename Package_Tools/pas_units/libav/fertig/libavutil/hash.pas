unit hash;

interface

uses
  fp_ffmpeg;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PAVHashContext = type Pointer;
  PPAVHashContext = ^PAVHashContext;

function av_hash_alloc(ctx: PPAVHashContext; name: pchar): longint; cdecl; external libavutil;
function av_hash_names(i: longint): pchar; cdecl; external libavutil;
function av_hash_get_name(ctx: PAVHashContext): pchar; cdecl; external libavutil;

const
  AV_HASH_MAX_SIZE = 64;

function av_hash_get_size(ctx: PAVHashContext): longint; cdecl; external libavutil;
procedure av_hash_init(ctx: PAVHashContext); cdecl; external libavutil;
procedure av_hash_update(ctx: PAVHashContext; src: Puint8_t; len: Tsize_t); cdecl; external libavutil;
procedure av_hash_final(ctx: PAVHashContext; dst: Puint8_t); cdecl; external libavutil;
procedure av_hash_final_bin(ctx: PAVHashContext; dst: Puint8_t; size: longint); cdecl; external libavutil;
procedure av_hash_final_hex(ctx: PAVHashContext; dst: Puint8_t; size: longint); cdecl; external libavutil;
procedure av_hash_final_b64(ctx: PAVHashContext; dst: Puint8_t; size: longint); cdecl; external libavutil;
procedure av_hash_freep(ctx: PPAVHashContext); cdecl; external libavutil;

// === Konventiert am: 14-12-25 17:15:29 ===


implementation



end.
