{$IFDEF read_interface}


const
  crypto_core_ed25519_BYTES_ = 32;

function crypto_core_ed25519_bytes: Tsize_t; cdecl; external libsodium;

const
  crypto_core_ed25519_UNIFORMBYTES_ = 32;

function crypto_core_ed25519_uniformbytes: Tsize_t; cdecl; external libsodium;

const
  crypto_core_ed25519_HASHBYTES_ = 64;

function crypto_core_ed25519_hashbytes: Tsize_t; cdecl; external libsodium;

const
  crypto_core_ed25519_SCALARBYTES_ = 32;

function crypto_core_ed25519_scalarbytes: Tsize_t; cdecl; external libsodium;

const
  crypto_core_ed25519_NONREDUCEDSCALARBYTES_ = 64;

function crypto_core_ed25519_nonreducedscalarbytes: Tsize_t; cdecl; external libsodium;
function crypto_core_ed25519_is_valid_point(p: pbyte): longint; cdecl; external libsodium;
function crypto_core_ed25519_add(r: pbyte; p: pbyte; q: pbyte): longint; cdecl; external libsodium;
function crypto_core_ed25519_sub(r: pbyte; p: pbyte; q: pbyte): longint; cdecl; external libsodium;
function crypto_core_ed25519_from_uniform(p: pbyte; r: pbyte): longint; cdecl; external libsodium;
function crypto_core_ed25519_from_hash(p: pbyte; h: pbyte): longint; cdecl; external libsodium;
procedure crypto_core_ed25519_random(p: pbyte); cdecl; external libsodium;
procedure crypto_core_ed25519_scalar_random(r: pbyte); cdecl; external libsodium;
function crypto_core_ed25519_scalar_invert(recip: pbyte; s: pbyte): longint; cdecl; external libsodium;
procedure crypto_core_ed25519_scalar_negate(neg: pbyte; s: pbyte); cdecl; external libsodium;
procedure crypto_core_ed25519_scalar_complement(comp: pbyte; s: pbyte); cdecl; external libsodium;
procedure crypto_core_ed25519_scalar_add(z: pbyte; x: pbyte; y: pbyte); cdecl; external libsodium;
procedure crypto_core_ed25519_scalar_sub(z: pbyte; x: pbyte; y: pbyte); cdecl; external libsodium;
procedure crypto_core_ed25519_scalar_mul(z: pbyte; x: pbyte; y: pbyte); cdecl; external libsodium;
procedure crypto_core_ed25519_scalar_reduce(r: pbyte; s: pbyte); cdecl; external libsodium;

// === Konventiert am: 31-8-26 16:26:22 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
