unit crypto_hash_sha256;

interface

uses
  fp_sodium;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pcrypto_hash_sha256_state = ^Tcrypto_hash_sha256_state;
  Tcrypto_hash_sha256_state = record
    state: array[0..7] of Tuint32_t;
    count: Tuint64_t;
    buf: array[0..63] of Tuint8_t;
  end;

function crypto_hash_sha256_statebytes: Tsize_t; cdecl; external libsodium;
const
  crypto_hash_sha256_BYTES_ = 32;

function crypto_hash_sha256_bytes: Tsize_t; cdecl; external libsodium;
function crypto_hash_sha256(out_: pbyte; in_: pbyte; inlen: qword): longint; cdecl; external libsodium;
function crypto_hash_sha256_init(state: Pcrypto_hash_sha256_state): longint; cdecl; external libsodium;
function crypto_hash_sha256_update(state: Pcrypto_hash_sha256_state; in_: pbyte; inlen: qword): longint; cdecl; external libsodium;
function crypto_hash_sha256_final(state: Pcrypto_hash_sha256_state; out_: pbyte): longint; cdecl; external libsodium;

// === Konventiert am: 31-8-26 17:12:02 ===


implementation



end.
