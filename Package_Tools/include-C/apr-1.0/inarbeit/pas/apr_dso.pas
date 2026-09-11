unit apr_dso;

interface

uses
  fp_apr, apr, apr_errno;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Papr_dso_handle_t = type Pointer;
  PPapr_dso_handle_t = ^Papr_dso_handle_t;

  Papr_dso_handle_sym_t = ^Tapr_dso_handle_sym_t;
  Tapr_dso_handle_sym_t = pointer;

function apr_dso_load(res_handle: PPapr_dso_handle_t; path: pchar; ctx: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_dso_unload(handle: Papr_dso_handle_t): Tapr_status_t; cdecl; external libapr;
function apr_dso_sym(ressym: Papr_dso_handle_sym_t; handle: Papr_dso_handle_t; symname: pchar): Tapr_status_t; cdecl; external libapr;
function apr_dso_error(dso: Papr_dso_handle_t; buf: pchar; bufsize: Tapr_size_t): pchar; cdecl; external libapr;

// === Konventiert am: 10-9-26 14:34:43 ===


implementation



end.
