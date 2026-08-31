unit crypto_core_ed25519;

interface

uses
  fp_sodium;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef crypto_core_ed25519_H}
{$define crypto_core_ed25519_H}
{$include <stddef.h>}
{$include "export.h"}
{ C++ extern C conditionnal removed }

const
  crypto_core_ed25519_BYTES = 32;  

function crypto_core_ed25519_bytes:Tsize_t;cdecl;external libsodium;
const
  crypto_core_ed25519_UNIFORMBYTES = 32;  

function crypto_core_ed25519_uniformbytes:Tsize_t;cdecl;external libsodium;
const
  crypto_core_ed25519_HASHBYTES = 64;  

function crypto_core_ed25519_hashbytes:Tsize_t;cdecl;external libsodium;
const
  crypto_core_ed25519_SCALARBYTES = 32;  

function crypto_core_ed25519_scalarbytes:Tsize_t;cdecl;external libsodium;
const
  crypto_core_ed25519_NONREDUCEDSCALARBYTES = 64;  

function crypto_core_ed25519_nonreducedscalarbytes:Tsize_t;cdecl;external libsodium;
function crypto_core_ed25519_is_valid_point(p:Pbyte):longint;cdecl;external libsodium;
function crypto_core_ed25519_add(r:Pbyte; p:Pbyte; q:Pbyte):longint;cdecl;external libsodium;
function crypto_core_ed25519_sub(r:Pbyte; p:Pbyte; q:Pbyte):longint;cdecl;external libsodium;
function crypto_core_ed25519_from_uniform(p:Pbyte; r:Pbyte):longint;cdecl;external libsodium;
function crypto_core_ed25519_from_hash(p:Pbyte; h:Pbyte):longint;cdecl;external libsodium;
procedure crypto_core_ed25519_random(p:Pbyte);cdecl;external libsodium;
procedure crypto_core_ed25519_scalar_random(r:Pbyte);cdecl;external libsodium;
function crypto_core_ed25519_scalar_invert(recip:Pbyte; s:Pbyte):longint;cdecl;external libsodium;
procedure crypto_core_ed25519_scalar_negate(neg:Pbyte; s:Pbyte);cdecl;external libsodium;
procedure crypto_core_ed25519_scalar_complement(comp:Pbyte; s:Pbyte);cdecl;external libsodium;
procedure crypto_core_ed25519_scalar_add(z:Pbyte; x:Pbyte; y:Pbyte);cdecl;external libsodium;
procedure crypto_core_ed25519_scalar_sub(z:Pbyte; x:Pbyte; y:Pbyte);cdecl;external libsodium;
procedure crypto_core_ed25519_scalar_mul(z:Pbyte; x:Pbyte; y:Pbyte);cdecl;external libsodium;
{
 * The interval `s` is sampled from should be at least 317 bits to ensure almost
 * uniformity of `r` over `L`.
  }
procedure crypto_core_ed25519_scalar_reduce(r:Pbyte; s:Pbyte);cdecl;external libsodium;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 31-8-26 16:26:22 ===


implementation



end.
