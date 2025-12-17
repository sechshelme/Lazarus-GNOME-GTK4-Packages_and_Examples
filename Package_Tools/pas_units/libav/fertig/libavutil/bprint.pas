unit bprint;

interface

uses
  fp_ffmpeg, avstring;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  AV_BPRINT_SIZE_UNLIMITED: dword = -1;

const
  AV_BPRINT_SIZE_AUTOMATIC = 1;
  AV_BPRINT_SIZE_COUNT_ONLY = 0;

procedure av_bprint_init(buf: PAVBPrint; size_init: dword; size_max: dword); cdecl; external libavutil;
procedure av_bprint_init_for_buffer(buf: PAVBPrint; buffer: pchar; size: dword); cdecl; external libavutil;
procedure av_bprintf(buf: PAVBPrint; fmt: pchar); cdecl; varargs; external libavutil;
procedure av_vbprintf(buf: PAVBPrint; fmt: pchar; vl_arg: Tva_list); cdecl; external libavutil;
procedure av_bprint_chars(buf: PAVBPrint; c: char; n: dword); cdecl; external libavutil;
procedure av_bprint_append_data(buf: PAVBPrint; data: pchar; size: dword); cdecl; external libavutil;

type
  Ptm = type Pointer;

procedure av_bprint_strftime(buf: PAVBPrint; fmt: pchar; tm: Ptm); cdecl; external libavutil;
procedure av_bprint_get_buffer(buf: PAVBPrint; size: dword; mem: PPbyte; actual_size: Pdword); cdecl; external libavutil;
procedure av_bprint_clear(buf: PAVBPrint); cdecl; external libavutil;
function av_bprint_finalize(buf: PAVBPrint; ret_str: PPchar): longint; cdecl; external libavutil;
procedure av_bprint_escape(dstbuf: PAVBPrint; src: pchar; special_chars: pchar; mode: TAVEscapeMode; flags: longint); cdecl; external libavutil;

// === Konventiert am: 14-12-25 15:59:52 ===


implementation


end.
