{$IFDEF read_interface}


const
  crypto_hash_BYTES_ = crypto_hash_sha512_BYTES_;

function crypto_hash_bytes: Tsize_t; cdecl; external libsodium;
function crypto_hash(out_: pbyte; in_: pbyte; inlen: qword): longint; cdecl; external libsodium;

const
  crypto_hash_PRIMITIVE_ = 'sha512';

function crypto_hash_primitive: pchar; cdecl; external libsodium;

// === Konventiert am: 31-8-26 17:12:04 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
