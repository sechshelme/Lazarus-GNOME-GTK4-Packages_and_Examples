unit rltypedefs;

interface

uses
  fp_readline;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TFunction = function: longint; cdecl;
  TVFunction = procedure; cdecl;
  TCPFunction = function: pchar; cdecl;
  TCPPFunction = function: PPchar; cdecl;

type
  Trl_command_func_t = function(para1: longint; para2: longint): longint; cdecl;
  Trl_compentry_func_t = function(para1: pchar; para2: longint): pchar; cdecl;
  Trl_completion_func_t = function(para1: pchar; para2: longint; para3: longint): PPchar; cdecl;
  Trl_quote_func_t = function(para1: pchar; para2: longint; para3: pchar): pchar; cdecl;
  Trl_dequote_func_t = function(para1: pchar; para2: longint): pchar; cdecl;
  Trl_compignore_func_t = function(para1: PPchar): longint; cdecl;
  Trl_compdisp_func_t = procedure(para1: PPchar; para2: longint; para3: longint); cdecl;
  Trl_hook_func_t = function(para1: pointer): longint; cdecl;
  Trl_getc_func_t = function(para1: PFILE): longint; cdecl;
  Trl_linebuf_func_t = function(para1: pchar; para2: longint): longint; cdecl;
  Trl_intfunc_t = function(para1: longint): longint; cdecl;

type
  Trl_ivoidfunc_t = Trl_hook_func_t;

type
  Trl_icpfunc_t = function(para1: pchar): longint; cdecl;
  Trl_icppfunc_t = function(para1: PPchar): longint; cdecl;
  Trl_voidfunc_t = procedure(para1: pointer); cdecl;
  Trl_vintfunc_t = procedure(para1: longint); cdecl;
  Trl_vcpfunc_t = procedure(para1: pchar); cdecl;
  Trl_vcppfunc_t = procedure(para1: PPchar); cdecl;
  Trl_cpvfunc_t = function: pchar; cdecl;
  Trl_cpifunc_t = function(para1: longint): pchar; cdecl;
  Trl_cpcpfunc_t = function(para1: pchar): pchar; cdecl;
  Trl_cpcppfunc_t = function(para1: PPchar): pchar; cdecl;

  // === Konventiert am: 27-8-25 16:55:26 ===


implementation



end.
