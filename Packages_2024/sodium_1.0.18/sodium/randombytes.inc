{$IFDEF read_interface}


type
  Prandombytes_implementation = ^Trandombytes_implementation;
  Trandombytes_implementation = record
    implementation_name: function: pchar; cdecl;
    random: function: Tuint32_t; cdecl;
    stir: procedure; cdecl;
    uniform: function(upper_bound: Tuint32_t): Tuint32_t; cdecl;
    buf: procedure(buf: pointer; size: Tsize_t); cdecl;
    close: function: longint; cdecl;
  end;

const
  randombytes_BYTES_MAX = $ffffffff;
  randombytes_SEEDBYTES_ = 32;

function randombytes_seedbytes: Tsize_t; cdecl; external libsodium;
procedure randombytes_buf(buf: pointer; size: Tsize_t); cdecl; external libsodium;
procedure randombytes_buf_deterministic(buf: pointer; size: Tsize_t; seed: pbyte); cdecl; external libsodium;
function randombytes_random: Tuint32_t; cdecl; external libsodium;
function randombytes_uniform(upper_bound: Tuint32_t): Tuint32_t; cdecl; external libsodium;
procedure randombytes_stir; cdecl; external libsodium;
function randombytes_close: longint; cdecl; external libsodium;
function randombytes_set_implementation(impl: Prandombytes_implementation): longint; cdecl; external libsodium;
function randombytes_implementation_name: pchar; cdecl; external libsodium;
procedure randombytes(buf: pbyte; buf_len: qword); cdecl; external libsodium;

// === Konventiert am: 31-8-26 17:34:02 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
