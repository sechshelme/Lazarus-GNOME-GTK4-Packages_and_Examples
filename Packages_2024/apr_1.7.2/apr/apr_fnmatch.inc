{$IFDEF read_interface}


const
  APR_FNM_NOMATCH = 1;
  APR_FNM_NOESCAPE = $01;
  APR_FNM_PATHNAME = $02;
  APR_FNM_PERIOD = $04;
  APR_FNM_CASE_BLIND = $08;

function apr_fnmatch(pattern: pchar; strings: pchar; flags: longint): Tapr_status_t; cdecl; external libapr;
function apr_fnmatch_test(pattern: pchar): longint; cdecl; external libapr;
function apr_match_glob(dir_pattern: pchar; result: PPapr_array_header_t; p: Papr_pool_t): Tapr_status_t; cdecl; external libapr;

// === Konventiert am: 10-9-26 16:37:25 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
