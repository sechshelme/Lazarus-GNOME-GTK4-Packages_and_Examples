unit apr_cstr;

interface

uses
  fp_apr, apr, apr_errno, apr_tables;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function apr_cstr_split(input: pchar; sep_chars: pchar; chop_whitespace: longint; pool: Papr_pool_t): Papr_array_header_t; cdecl; external libapr;
procedure apr_cstr_split_append(ar: Papr_array_header_t; input: pchar; sep_chars: pchar; chop_whitespace: longint; pool: Papr_pool_t); cdecl; external libapr;
function apr_cstr_match_glob_list(str: pchar; list: Papr_array_header_t): longint; cdecl; external libapr;
function apr_cstr_match_list(str: pchar; list: Papr_array_header_t): longint; cdecl; external libapr;
function apr_cstr_tokenize(sep: pchar; str: PPchar): pchar; cdecl; external libapr;
function apr_cstr_count_newlines(msg: pchar): longint; cdecl; external libapr;
function apr_cstr_casecmp(str1: pchar; str2: pchar): longint; cdecl; external libapr;
function apr_cstr_casecmpn(str1: pchar; str2: pchar; n: Tapr_size_t): longint; cdecl; external libapr;
function apr_cstr_strtoi64(n: Papr_int64_t; str: pchar; minval: Tapr_int64_t; maxval: Tapr_int64_t; base: longint): Tapr_status_t; cdecl; external libapr;
function apr_cstr_atoi64(n: Papr_int64_t; str: pchar): Tapr_status_t; cdecl; external libapr;
function apr_cstr_atoi(n: Plongint; str: pchar): Tapr_status_t; cdecl; external libapr;
function apr_cstr_strtoui64(n: Papr_uint64_t; str: pchar; minval: Tapr_uint64_t; maxval: Tapr_uint64_t; base: longint): Tapr_status_t; cdecl; external libapr;
function apr_cstr_atoui64(n: Papr_uint64_t; str: pchar): Tapr_status_t; cdecl; external libapr;
function apr_cstr_atoui(n: Pdword; str: pchar): Tapr_status_t; cdecl; external libapr;
function apr_cstr_skip_prefix(str: pchar; prefix: pchar): pchar; cdecl; external libapr;

// === Konventiert am: 10-9-26 14:34:46 ===


implementation



end.
