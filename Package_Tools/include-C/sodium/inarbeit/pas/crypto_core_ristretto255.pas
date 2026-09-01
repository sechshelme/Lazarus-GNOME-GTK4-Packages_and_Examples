unit crypto_core_ristretto255;

interface

uses
  fp_sodium;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  crypto_core_ristretto255_BYTES_ = 32;

function crypto_core_ristretto255_bytes: Tsize_t; cdecl; external libsodium;

const
  crypto_core_ristretto255_HASHBYTES_ = 64;

function crypto_core_ristretto255_hashbytes: Tsize_t; cdecl; external libsodium;

const
  crypto_core_ristretto255_SCALARBYTES_ = 32;

function crypto_core_ristretto255_scalarbytes: Tsize_t; cdecl; external libsodium;

const
  crypto_core_ristretto255_NONREDUCEDSCALARBYTES_ = 64;

function crypto_core_ristretto255_nonreducedscalarbytes: Tsize_t; cdecl; external libsodium;
function crypto_core_ristretto255_is_valid_point(p: pbyte): longint; cdecl; external libsodium;
function crypto_core_ristretto255_add(r: pbyte; p: pbyte; q: pbyte): longint; cdecl; external libsodium;
function crypto_core_ristretto255_sub(r: pbyte; p: pbyte; q: pbyte): longint; cdecl; external libsodium;
function crypto_core_ristretto255_from_hash(p: pbyte; r: pbyte): longint; cdecl; external libsodium;
procedure crypto_core_ristretto255_random(p: pbyte); cdecl; external libsodium;
procedure crypto_core_ristretto255_scalar_random(r: pbyte); cdecl; external libsodium;
function crypto_core_ristretto255_scalar_invert(recip: pbyte; s: pbyte): longint; cdecl; external libsodium;
procedure crypto_core_ristretto255_scalar_negate(neg: pbyte; s: pbyte); cdecl; external libsodium;
procedure crypto_core_ristretto255_scalar_complement(comp: pbyte; s: pbyte); cdecl; external libsodium;
procedure crypto_core_ristretto255_scalar_add(z: pbyte; x: pbyte; y: pbyte); cdecl; external libsodium;
procedure crypto_core_ristretto255_scalar_sub(z: pbyte; x: pbyte; y: pbyte); cdecl; external libsodium;
procedure crypto_core_ristretto255_scalar_mul(z: pbyte; x: pbyte; y: pbyte); cdecl; external libsodium;
procedure crypto_core_ristretto255_scalar_reduce(r: pbyte; s: pbyte); cdecl; external libsodium;

// === Konventiert am: 31-8-26 16:26:13 ===


implementation



end.
