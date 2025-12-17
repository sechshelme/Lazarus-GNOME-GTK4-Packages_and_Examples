{$IFDEF read_interface}


type
  PAVExpr = type Pointer;
  PPAVExpr = PAVExpr;

type
  Texpr_func1 = function(opaque: Pointer; arg: double): double; cdecl;
  Pexpr_func1 = ^Texpr_func1;

  Texpr_func2 = function(opaque: Pointer; arg1, arg2: double): double; cdecl;
  Pexpr_func2 = ^Texpr_func2;

function av_expr_parse_and_eval(res: PDouble; s: pchar; const_names: PPChar; const_values: PDouble;
  func1_names: PPChar; funcs1: Pexpr_func1; func2_names: PPChar; funcs2: Pexpr_func2;
  opaque: Pointer; log_offset: integer; log_ctx: Pointer): integer; cdecl; external libavutil;
function av_expr_parse(expr: PPAVExpr; s: pchar; const_names: PPAnsiChar;
  func1_names: PPAnsiChar; funcs1: Pexpr_func1; func2_names: PPAnsiChar; funcs2: Pexpr_func2;
  log_offset: integer; log_ctx: Pointer): integer; cdecl; external libavutil;
function av_expr_eval(e: PAVExpr; const_values: Pdouble; opaque: pointer): double; cdecl; external libavutil;
function av_expr_count_vars(e: PAVExpr; counter: Pdword; size: longint): longint; cdecl; external libavutil;
function av_expr_count_func(e: PAVExpr; counter: Pdword; size: longint; arg: longint): longint; cdecl; external libavutil;
procedure av_expr_free(e: PAVExpr); cdecl; external libavutil;
function av_strtod(numstr: pchar; tail: PPchar): double; cdecl; external libavutil;

// === Konventiert am: 14-12-25 17:00:46 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
