unit uuid;

interface

uses
  fp_ffmpeg;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



const
  AV_UUID_LEN = 16;

type
  PAVUUID = ^TAVUUID;
  TAVUUID = array[0..(AV_UUID_LEN) - 1] of Tuint8_t;

function av_uuid_parse(in_: pchar; uu: TAVUUID): longint; cdecl; external libavutil;
function av_uuid_urn_parse(in_: pchar; uu: TAVUUID): longint; cdecl; external libavutil;
function av_uuid_parse_range(in_start: pchar; in_end: pchar; uu: TAVUUID): longint; cdecl; external libavutil;
procedure av_uuid_unparse(uu: TAVUUID; out_: pchar); cdecl; external libavutil;

// === Konventiert am: 14-12-25 17:42:05 ===


implementation



end.
