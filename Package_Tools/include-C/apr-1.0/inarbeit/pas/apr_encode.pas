unit apr_encode;

interface

uses
  fp_apr, apr, apr_errno;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



const
  APR_ENCODE_STRING = -(1);
  APR_ENCODE_NONE = 0;
  APR_ENCODE_RELAXED = 1;
  APR_ENCODE_NOPADDING = 2;
  APR_ENCODE_URL = 4;
  APR_ENCODE_BASE64URL = APR_ENCODE_NOPADDING or APR_ENCODE_URL;
  APR_ENCODE_BASE32HEX = 8;
  APR_ENCODE_COLON = 16;
  APR_ENCODE_LOWER = 32;

function apr_encode_base64(dest: pchar; src: pchar; slen: Tapr_ssize_t; flags: longint; len: Papr_size_t): Tapr_status_t; cdecl; external libapr;
function apr_encode_base64_binary(dest: pchar; src: pbyte; slen: Tapr_ssize_t; flags: longint; len: Papr_size_t): Tapr_status_t; cdecl; external libapr;
function apr_pencode_base64(p: Papr_pool_t; src: pchar; slen: Tapr_ssize_t; flags: longint; len: Papr_size_t): pchar; cdecl; external libapr;
function apr_pencode_base64_binary(p: Papr_pool_t; src: pbyte; slen: Tapr_ssize_t; flags: longint; len: Papr_size_t): pchar; cdecl; external libapr;
function apr_decode_base64(dest: pchar; src: pchar; slen: Tapr_ssize_t; flags: longint; len: Papr_size_t): Tapr_status_t; cdecl; external libapr;
function apr_decode_base64_binary(dest: pbyte; src: pchar; slen: Tapr_ssize_t; flags: longint; len: Papr_size_t): Tapr_status_t; cdecl; external libapr;
function apr_pdecode_base64(p: Papr_pool_t; src: pchar; slen: Tapr_ssize_t; flags: longint; len: Papr_size_t): pchar; cdecl; external libapr;
function apr_pdecode_base64_binary(p: Papr_pool_t; src: pchar; slen: Tapr_ssize_t; flags: longint; len: Papr_size_t): pbyte; cdecl; external libapr;
function apr_encode_base32(dest: pchar; src: pchar; slen: Tapr_ssize_t; flags: longint; len: Papr_size_t): Tapr_status_t; cdecl; external libapr;
function apr_encode_base32_binary(dest: pchar; src: pbyte; slen: Tapr_ssize_t; flags: longint; len: Papr_size_t): Tapr_status_t; cdecl; external libapr;
function apr_pencode_base32(p: Papr_pool_t; src: pchar; slen: Tapr_ssize_t; flags: longint; len: Papr_size_t): pchar; cdecl; external libapr;
function apr_pencode_base32_binary(p: Papr_pool_t; src: pbyte; slen: Tapr_ssize_t; flags: longint; len: Papr_size_t): pchar; cdecl; external libapr;
function apr_decode_base32(dest: pchar; src: pchar; slen: Tapr_ssize_t; flags: longint; len: Papr_size_t): Tapr_status_t; cdecl; external libapr;
function apr_decode_base32_binary(dest: pbyte; src: pchar; slen: Tapr_ssize_t; flags: longint; len: Papr_size_t): Tapr_status_t; cdecl; external libapr;
function apr_pdecode_base32(p: Papr_pool_t; src: pchar; slen: Tapr_ssize_t; flags: longint; len: Papr_size_t): pchar; cdecl; external libapr;
function apr_pdecode_base32_binary(p: Papr_pool_t; src: pchar; slen: Tapr_ssize_t; flags: longint; len: Papr_size_t): pbyte; cdecl; external libapr;
function apr_encode_base16(dest: pchar; src: pchar; slen: Tapr_ssize_t; flags: longint; len: Papr_size_t): Tapr_status_t; cdecl; external libapr;
function apr_encode_base16_binary(dest: pchar; src: pbyte; slen: Tapr_ssize_t; flags: longint; len: Papr_size_t): Tapr_status_t; cdecl; external libapr;
function apr_pencode_base16(p: Papr_pool_t; src: pchar; slen: Tapr_ssize_t; flags: longint; len: Papr_size_t): pchar; cdecl; external libapr;
function apr_pencode_base16_binary(p: Papr_pool_t; src: pbyte; slen: Tapr_ssize_t; flags: longint; len: Papr_size_t): pchar; cdecl; external libapr;
function apr_decode_base16(dest: pchar; src: pchar; slen: Tapr_ssize_t; flags: longint; len: Papr_size_t): Tapr_status_t; cdecl; external libapr;
function apr_decode_base16_binary(dest: pbyte; src: pchar; slen: Tapr_ssize_t; flags: longint; len: Papr_size_t): Tapr_status_t; cdecl; external libapr;
function apr_pdecode_base16(p: Papr_pool_t; src: pchar; slen: Tapr_ssize_t; flags: longint; len: Papr_size_t): pchar; cdecl; external libapr;
function apr_pdecode_base16_binary(p: Papr_pool_t; src: pchar; slen: Tapr_ssize_t; flags: longint; len: Papr_size_t): pbyte; cdecl; external libapr;

// === Konventiert am: 10-9-26 14:34:41 ===


implementation



end.
