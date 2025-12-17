unit base64;

interface

uses
  fp_ffmpeg;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function av_base64_decode(out_: Puint8_t; in_: pchar; out_size: longint): longint; cdecl; external libavutil;

function AV_BASE64_DECODE_SIZE(x: longint): longint;

function av_base64_encode(out_: pchar; out_size: longint; in_: Puint8_t; in_size: longint): pchar; cdecl; external libavutil;

function AV_BASE64_SIZE(x: longint): longint;


// === Konventiert am: 14-12-25 15:59:47 ===


implementation


function AV_BASE64_DECODE_SIZE(x: longint): longint;
begin
  AV_BASE64_DECODE_SIZE := (x * 3) div 4;
end;

function AV_BASE64_SIZE(x: longint): longint;
begin
  AV_BASE64_SIZE := ((x + 2)) div 3 * 4 + 1;
end;


end.
