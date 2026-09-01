{$IFDEF read_interface}


procedure sodium_memzero(pnt: pointer; len: Tsize_t); cdecl; external libsodium;
procedure sodium_stackzero(len: Tsize_t); cdecl; external libsodium;
function sodium_memcmp(b1_: pointer; b2_: pointer; len: Tsize_t): longint; cdecl; external libsodium;

function sodium_compare(b1_: pbyte; b2_: pbyte; len: Tsize_t): longint; cdecl; external libsodium;
function sodium_is_zero(n: pbyte; nlen: Tsize_t): longint; cdecl; external libsodium;
procedure sodium_increment(n: pbyte; nlen: Tsize_t); cdecl; external libsodium;
procedure sodium_add(a: pbyte; b: pbyte; len: Tsize_t); cdecl; external libsodium;
procedure sodium_sub(a: pbyte; b: pbyte; len: Tsize_t); cdecl; external libsodium;
function sodium_bin2hex(hex: pchar; hex_maxlen: Tsize_t; bin: pbyte; bin_len: Tsize_t): pchar; cdecl; external libsodium;
function sodium_hex2bin(bin: pbyte; bin_maxlen: Tsize_t; hex: pchar; hex_len: Tsize_t; ignore: pchar;
  bin_len: Psize_t; hex_end: PPchar): longint; cdecl; external libsodium;

const
  sodium_base64_VARIANT_ORIGINAL = 1;
  sodium_base64_VARIANT_ORIGINAL_NO_PADDING = 3;
  sodium_base64_VARIANT_URLSAFE = 5;
  sodium_base64_VARIANT_URLSAFE_NO_PADDING = 7;

function sodium_base64_ENCODED_LEN(BIN_LEN: cardinal; variant: integer): cardinal; inline;

function sodium_base64_encoded_len(bin_len: Tsize_t; variant: longint): Tsize_t; cdecl; external libsodium;
function sodium_bin2base64(b64: pchar; b64_maxlen: Tsize_t; bin: pbyte; bin_len: Tsize_t; variant: longint): pchar; cdecl; external libsodium;
function sodium_base642bin(bin: pbyte; bin_maxlen: Tsize_t; b64: pchar; b64_len: Tsize_t; ignore: pchar;
  bin_len: Psize_t; b64_end: PPchar; variant: longint): longint; cdecl; external libsodium;
function sodium_mlock(addr: pointer; len: Tsize_t): longint; cdecl; external libsodium;
function sodium_munlock(addr: pointer; len: Tsize_t): longint; cdecl; external libsodium;

function sodium_malloc(size: Tsize_t): pointer; cdecl; external libsodium;
function sodium_allocarray(count: Tsize_t; size: Tsize_t): pointer; cdecl; external libsodium;
procedure sodium_free(ptr: pointer); cdecl; external libsodium;
function sodium_mprotect_noaccess(ptr: pointer): longint; cdecl; external libsodium;
function sodium_mprotect_readonly(ptr: pointer): longint; cdecl; external libsodium;
function sodium_mprotect_readwrite(ptr: pointer): longint; cdecl; external libsodium;
function sodium_pad(padded_buflen_p: Psize_t; buf: pbyte; unpadded_buflen: Tsize_t; blocksize: Tsize_t; max_buflen: Tsize_t): longint; cdecl; external libsodium;
function sodium_unpad(unpadded_buflen_p: Psize_t; buf: pbyte; padded_buflen: Tsize_t; blocksize: Tsize_t): longint; cdecl; external libsodium;

function _sodium_alloc_init: longint; cdecl; external libsodium;

// === Konventiert am: 31-8-26 17:33:53 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function sodium_base64_ENCODED_LEN(BIN_LEN: cardinal; variant: integer): cardinal; inline;
begin
  Result := ((BIN_LEN div 3) * 4) +
    ((((BIN_LEN - (BIN_LEN div 3) * 3) or ((BIN_LEN - (BIN_LEN div 3) * 3) shr 1)) and 1) *
    (4 - (not (((variant and 2) shr 1) - 1) and (3 - (BIN_LEN - (BIN_LEN div 3) * 3))))) + 1;
end;

{$ENDIF read_implementation}
