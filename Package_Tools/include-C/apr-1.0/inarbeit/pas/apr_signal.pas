unit apr_signal;

interface

uses
  fp_apr, apr_errno;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tapr_sigfunc_t = procedure(para1: longint); cdecl;

function apr_signal(signo: longint; func: Tapr_sigfunc_t): Tapr_sigfunc_t; cdecl; external libapr;
function apr_signal_description_get(signum: longint): pchar; cdecl; external libapr;
procedure apr_signal_init(pglobal: Papr_pool_t); cdecl; external libapr;
function apr_signal_block(signum: longint): Tapr_status_t; cdecl; external libapr;
function apr_signal_unblock(signum: longint): Tapr_status_t; cdecl; external libapr;

// === Konventiert am: 10-9-26 16:47:15 ===


implementation



end.
