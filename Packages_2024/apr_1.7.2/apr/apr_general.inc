{$IFDEF read_interface}


const
  APR_ASCII_BLANK = '\040';
  APR_ASCII_CR = '\015';
  APR_ASCII_LF = '\012';
  APR_ASCII_TAB = '\011';

type
  Papr_signum_t = ^Tapr_signum_t;
  Tapr_signum_t = longint;

function apr_initialize: Tapr_status_t; cdecl; external libapr;
function apr_app_initialize(argc: Plongint; argv: PPPchar; env: PPPchar): Tapr_status_t; cdecl; external libapr;
procedure apr_terminate; cdecl; external libapr;
procedure apr_terminate2; cdecl; external libapr;
function apr_generate_random_bytes(buf: pbyte; length: Tapr_size_t): Tapr_status_t; cdecl; external libapr;

// === Konventiert am: 10-9-26 16:37:23 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ENDIF read_implementation}
