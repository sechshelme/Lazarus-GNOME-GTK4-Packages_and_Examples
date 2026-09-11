unit apr_env;

interface

uses
  fp_apr, apr_errno;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function apr_env_get(value: PPchar; envvar: pchar; pool: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_env_set(envvar: pchar; value: pchar; pool: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_env_delete(envvar: pchar; pool: Papr_pool_t): Tapr_status_t; cdecl; external libapr;

// === Konventiert am: 10-9-26 14:34:38 ===


implementation



end.
