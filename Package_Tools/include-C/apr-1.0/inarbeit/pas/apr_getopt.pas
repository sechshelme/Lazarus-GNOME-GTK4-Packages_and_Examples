unit apr_getopt;

interface

uses
  fp_apr, apr_errno;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tapr_getopt_err_fn_t = procedure(arg: Pointer; err: pchar); varargs; cdecl;

  PPapr_getopt_t = ^Papr_getopt_t;
  Papr_getopt_t = ^Tapr_getopt_t;
  Tapr_getopt_t = record
    cont: Papr_pool_t;
    errfn: Tapr_getopt_err_fn_t;
    errarg: pointer;
    ind: longint;
    opt: longint;
    reset: longint;
    argc: longint;
    argv: ^pchar;
    place: pchar;
    interleave: longint;
    skip_start: longint;
    skip_end: longint;
  end;

  Papr_getopt_option_t = ^Tapr_getopt_option_t;
  Tapr_getopt_option_t = record
    name: pchar;
    optch: longint;
    has_arg: longint;
    description: pchar;
  end;

function apr_getopt_init(os: PPapr_getopt_t; cont: Papr_pool_t; argc: longint; argv: PPchar): Tapr_status_t; cdecl; external libapr;
function apr_getopt(os: Papr_getopt_t; opts: pchar; option_ch: pchar; option_arg: PPchar): Tapr_status_t; cdecl; external libapr;
function apr_getopt_long(os: Papr_getopt_t; opts: Papr_getopt_option_t; option_ch: Plongint; option_arg: PPchar): Tapr_status_t; cdecl; external libapr;

// === Konventiert am: 10-9-26 16:37:21 ===


implementation



end.
