unit gbase64;

interface

uses
  common_GLIB, gtypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

function g_base64_encode_step(in_: Pguchar; len: Tgsize; break_lines: Tgboolean; out_: Pgchar; state: Pgint; save: Pgint): Tgsize; cdecl; external libglib2;
function g_base64_encode_close(break_lines: Tgboolean; out_: Pgchar; state: Pgint; save: Pgint): Tgsize; cdecl; external libglib2;
function g_base64_encode(data: Pguchar; len: Tgsize): Pgchar; cdecl; external libglib2;
function g_base64_decode_step(in_: Pgchar; len: Tgsize; out_: Pguchar; state: Pgint; save: Pguint): Tgsize; cdecl; external libglib2;
function g_base64_decode(text: Pgchar; out_len: Pgsize): Pguchar; cdecl; external libglib2;
function g_base64_decode_inplace(text: Pgchar; out_len: Pgsize): Pguchar; cdecl; external libglib2;

// === Konventiert am: 22-6-26 16:00:55 ===


implementation



end.
