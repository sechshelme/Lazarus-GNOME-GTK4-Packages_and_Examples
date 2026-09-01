{$IFDEF read_interface}


type
  Pcrypto_hash_sha512_state = ^Tcrypto_hash_sha512_state;
  Tcrypto_hash_sha512_state = record
    state: array[0..7] of Tuint64_t;
    count: array[0..1] of Tuint64_t;
    buf: array[0..127] of Tuint8_t;
  end;

function crypto_hash_sha512_statebytes: Tsize_t; cdecl; external libsodium;

const
  crypto_hash_sha512_BYTES_ = 64;

function crypto_hash_sha512_bytes: Tsize_t; cdecl; external libsodium;
function crypto_hash_sha512(out_: pbyte; in_: pbyte; inlen: qword): longint; cdecl; external libsodium;
function crypto_hash_sha512_init(state: Pcrypto_hash_sha512_state): longint; cdecl; external libsodium;
function crypto_hash_sha512_update(state: Pcrypto_hash_sha512_state; in_: pbyte; inlen: qword): longint; cdecl; external libsodium;
function crypto_hash_sha512_final(state: Pcrypto_hash_sha512_state; out_: pbyte): longint; cdecl; external libsodium;

// === Konventiert am: 31-8-26 17:11:59 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
