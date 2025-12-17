unit lfg;

interface

uses
  fp_ffmpeg;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PAVLFG = type Pointer;

procedure av_lfg_init(c: PAVLFG; seed: dword); cdecl; external libavutil;
function av_lfg_init_from_data(c: PAVLFG; data: Puint8_t; length: dword): longint; cdecl; external libavutil;
procedure av_bmg_get(lfg: PAVLFG; out_: Pdouble); cdecl; external libavutil;

// === Konventiert am: 14-12-25 17:31:23 ===


implementation



end.
