unit crypto_core_ristretto255;

interface

uses
  fp_sodium;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef crypto_core_ristretto255_H}
{$define crypto_core_ristretto255_H}
{$include <stddef.h>}
{$include "export.h"}
{ C++ extern C conditionnal removed }

const
  crypto_core_ristretto255_BYTES = 32;  

function crypto_core_ristretto255_bytes:Tsize_t;cdecl;external libsodium;
const
  crypto_core_ristretto255_HASHBYTES = 64;  

function crypto_core_ristretto255_hashbytes:Tsize_t;cdecl;external libsodium;
const
  crypto_core_ristretto255_SCALARBYTES = 32;  

function crypto_core_ristretto255_scalarbytes:Tsize_t;cdecl;external libsodium;
const
  crypto_core_ristretto255_NONREDUCEDSCALARBYTES = 64;  

function crypto_core_ristretto255_nonreducedscalarbytes:Tsize_t;cdecl;external libsodium;
function crypto_core_ristretto255_is_valid_point(p:Pbyte):longint;cdecl;external libsodium;
function crypto_core_ristretto255_add(r:Pbyte; p:Pbyte; q:Pbyte):longint;cdecl;external libsodium;
function crypto_core_ristretto255_sub(r:Pbyte; p:Pbyte; q:Pbyte):longint;cdecl;external libsodium;
function crypto_core_ristretto255_from_hash(p:Pbyte; r:Pbyte):longint;cdecl;external libsodium;
procedure crypto_core_ristretto255_random(p:Pbyte);cdecl;external libsodium;
procedure crypto_core_ristretto255_scalar_random(r:Pbyte);cdecl;external libsodium;
function crypto_core_ristretto255_scalar_invert(recip:Pbyte; s:Pbyte):longint;cdecl;external libsodium;
procedure crypto_core_ristretto255_scalar_negate(neg:Pbyte; s:Pbyte);cdecl;external libsodium;
procedure crypto_core_ristretto255_scalar_complement(comp:Pbyte; s:Pbyte);cdecl;external libsodium;
procedure crypto_core_ristretto255_scalar_add(z:Pbyte; x:Pbyte; y:Pbyte);cdecl;external libsodium;
procedure crypto_core_ristretto255_scalar_sub(z:Pbyte; x:Pbyte; y:Pbyte);cdecl;external libsodium;
procedure crypto_core_ristretto255_scalar_mul(z:Pbyte; x:Pbyte; y:Pbyte);cdecl;external libsodium;
{
 * The interval `s` is sampled from should be at least 317 bits to ensure almost
 * uniformity of `r` over `L`.
  }
procedure crypto_core_ristretto255_scalar_reduce(r:Pbyte; s:Pbyte);cdecl;external libsodium;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 31-8-26 16:26:13 ===


implementation



end.
