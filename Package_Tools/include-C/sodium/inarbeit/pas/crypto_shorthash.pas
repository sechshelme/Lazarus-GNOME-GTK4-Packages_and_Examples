unit crypto_shorthash;

interface

uses
  fp_sodium;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef crypto_shorthash_H}
{$define crypto_shorthash_H}
{$include <stddef.h>}
{$include "crypto_shorthash_siphash24.h"}
{$include "export.h"}
(** unsupported pragma#pragma GCC diagnostic ignored "-Wlong-long"*)

const
  crypto_shorthash_BYTES = crypto_shorthash_siphash24_BYTES;  

function crypto_shorthash_bytes:Tsize_t;cdecl;external libsodium;
const
  crypto_shorthash_KEYBYTES = crypto_shorthash_siphash24_KEYBYTES;  

function crypto_shorthash_keybytes:Tsize_t;cdecl;external libsodium;
const
  crypto_shorthash_PRIMITIVE = 'siphash24';  

function crypto_shorthash_primitive:Pchar;cdecl;external libsodium;
function crypto_shorthash(out:Pbyte; in:Pbyte; inlen:qword; k:Pbyte):longint;cdecl;external libsodium;
procedure crypto_shorthash_keygen(k:array[0..(crypto_shorthash_KEYBYTES)-1] of byte);cdecl;external libsodium;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 31-8-26 17:25:53 ===


implementation



end.
