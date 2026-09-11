unit apr_escape;

interface

uses
  fp_apr, apr, apr_errno;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  APR_ESCAPE_STRING = -(1);
  APR_ESCAPE_LDAP_DN = $01;
  APR_ESCAPE_LDAP_FILTER = $02;
  APR_ESCAPE_LDAP_ALL = $03;

function apr_escape_shell(escaped: pchar; str: pchar; slen: Tapr_ssize_t; len: Papr_size_t): Tapr_status_t; cdecl; external libapr;
function apr_pescape_shell(p: Papr_pool_t; str: pchar): pchar; cdecl; external libapr;
function apr_unescape_url(escaped: pchar; url: pchar; slen: Tapr_ssize_t; forbid: pchar; reserved: pchar; plus: longint; len: Papr_size_t): Tapr_status_t; cdecl; external libapr;
function apr_punescape_url(p: Papr_pool_t; url: pchar; forbid: pchar; reserved: pchar; plus: longint): pchar; cdecl; external libapr;
function apr_escape_path_segment(escaped: pchar; str: pchar; slen: Tapr_ssize_t; len: Papr_size_t): Tapr_status_t; cdecl; external libapr;
function apr_pescape_path_segment(p: Papr_pool_t; str: pchar): pchar; cdecl; external libapr;
function apr_escape_path(escaped: pchar; path: pchar; slen: Tapr_ssize_t; partial: longint; len: Papr_size_t): Tapr_status_t; cdecl; external libapr;
function apr_pescape_path(p: Papr_pool_t; str: pchar; partial: longint): pchar; cdecl; external libapr;
function apr_escape_urlencoded(escaped: pchar; str: pchar; slen: Tapr_ssize_t; len: Papr_size_t): Tapr_status_t; cdecl; external libapr;
function apr_pescape_urlencoded(p: Papr_pool_t; str: pchar): pchar; cdecl; external libapr;
function apr_escape_entity(escaped: pchar; str: pchar; slen: Tapr_ssize_t; toasc: longint; len: Papr_size_t): Tapr_status_t; cdecl; external libapr;
function apr_pescape_entity(p: Papr_pool_t; str: pchar; toasc: longint): pchar; cdecl; external libapr;
function apr_unescape_entity(unescaped: pchar; str: pchar; slen: Tapr_ssize_t; len: Papr_size_t): Tapr_status_t; cdecl; external libapr;
function apr_punescape_entity(p: Papr_pool_t; str: pchar): pchar; cdecl; external libapr;
function apr_escape_echo(escaped: pchar; str: pchar; slen: Tapr_ssize_t; quote: longint; len: Papr_size_t): Tapr_status_t; cdecl; external libapr;
function apr_pescape_echo(p: Papr_pool_t; str: pchar; quote: longint): pchar; cdecl; external libapr;
function apr_escape_hex(dest: pchar; src: pointer; srclen: Tapr_size_t; colon: longint; len: Papr_size_t): Tapr_status_t; cdecl; external libapr;
function apr_pescape_hex(p: Papr_pool_t; src: pointer; slen: Tapr_size_t; colon: longint): pchar; cdecl; external libapr;
function apr_unescape_hex(dest: pointer; str: pchar; slen: Tapr_ssize_t; colon: longint; len: Papr_size_t): Tapr_status_t; cdecl; external libapr;
function apr_punescape_hex(p: Papr_pool_t; str: pchar; colon: longint; len: Papr_size_t): pointer; cdecl; external libapr;
function apr_escape_ldap(dest: pchar; src: pointer; srclen: Tapr_ssize_t; flags: longint; len: Papr_size_t): Tapr_status_t; cdecl; external libapr;
function apr_pescape_ldap(p: Papr_pool_t; src: pointer; slen: Tapr_ssize_t; flags: longint): pchar; cdecl; external libapr;

// === Konventiert am: 10-9-26 14:34:33 ===


implementation



end.
