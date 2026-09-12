{$IFDEF read_interface}


function apr_strnatcmp(a: pchar; b: pchar): longint; cdecl; external libapr;
function apr_strnatcasecmp(a: pchar; b: pchar): longint; cdecl; external libapr;
function apr_pstrdup(p: Papr_pool_t; s: pchar): pchar; cdecl; external libapr;
function apr_pstrmemdup(p: Papr_pool_t; s: pchar; n: Tapr_size_t): pchar; cdecl; external libapr;
function apr_pstrndup(p: Papr_pool_t; s: pchar; n: Tapr_size_t): pchar; cdecl; external libapr;
function apr_pmemdup(p: Papr_pool_t; m: pointer; n: Tapr_size_t): pointer; cdecl; external libapr;
function apr_pstrcat(p: Papr_pool_t): pchar; cdecl; varargs; external libapr;
function apr_pstrcatv(p: Papr_pool_t; vec: Piovec; nvec: Tapr_size_t; nbytes: Papr_size_t): pchar; cdecl; external libapr;
function apr_pvsprintf(p: Papr_pool_t; fmt: pchar; ap: Tva_list): pchar; cdecl; external libapr;
function apr_psprintf(p: Papr_pool_t; fmt: pchar): pchar; cdecl; varargs; external libapr;
function apr_cpystrn(dst: pchar; src: pchar; dst_size: Tapr_size_t): pchar; cdecl; external libapr;
function apr_collapse_spaces(dest: pchar; src: pchar): pchar; cdecl; external libapr;
function apr_tokenize_to_argv(arg_str: pchar; argv_out: PPPchar; token_context: Papr_pool_t): Tapr_status_t; cdecl; external libapr;
function apr_strtok(str: pchar; sep: pchar; last: PPchar): pchar; cdecl; external libapr;
function apr_snprintf(buf: pchar; len: Tapr_size_t; format: pchar): longint; cdecl; varargs; external libapr;
function apr_vsnprintf(buf: pchar; len: Tapr_size_t; format: pchar; ap: Tva_list): longint; cdecl; external libapr;
function apr_itoa(p: Papr_pool_t; n: longint): pchar; cdecl; external libapr;
function apr_ltoa(p: Papr_pool_t; n: longint): pchar; cdecl; external libapr;
function apr_off_t_toa(p: Papr_pool_t; n: Tapr_off_t): pchar; cdecl; external libapr;
function apr_strtoff(offset: Papr_off_t; buf: pchar; end_: PPchar; base: longint): Tapr_status_t; cdecl; external libapr;
function apr_strtoi64(buf: pchar; end_: PPchar; base: longint): Tapr_int64_t; cdecl; external libapr;
function apr_atoi64(buf: pchar): Tapr_int64_t; cdecl; external libapr;
function apr_strfsize(size: Tapr_off_t; buf: pchar): pchar; cdecl; external libapr;

// === Konventiert am: 10-9-26 16:58:50 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
