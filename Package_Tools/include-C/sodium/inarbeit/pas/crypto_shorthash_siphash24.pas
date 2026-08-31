unit crypto_shorthash_siphash24;

interface

uses
  fp_sodium;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef crypto_shorthash_siphash24_H}
{$define crypto_shorthash_siphash24_H}
{$include <stddef.h>}
{$include "export.h"}
(** unsupported pragma#pragma GCC diagnostic ignored "-Wlong-long"*)
{ -- 64-bit output --  }

const
  crypto_shorthash_siphash24_BYTES = 8;  

function crypto_shorthash_siphash24_bytes:Tsize_t;cdecl;external libsodium;
const
  crypto_shorthash_siphash24_KEYBYTES = 16;  

function crypto_shorthash_siphash24_keybytes:Tsize_t;cdecl;external libsodium;
function crypto_shorthash_siphash24(out:Pbyte; in:Pbyte; inlen:qword; k:Pbyte):longint;cdecl;external libsodium;
{$ifndef SODIUM_LIBRARY_MINIMAL}
{ -- 128-bit output --  }

const
  crypto_shorthash_siphashx24_BYTES = 16;  

function crypto_shorthash_siphashx24_bytes:Tsize_t;cdecl;external libsodium;
const
  crypto_shorthash_siphashx24_KEYBYTES = 16;  

function crypto_shorthash_siphashx24_keybytes:Tsize_t;cdecl;external libsodium;
function crypto_shorthash_siphashx24(out:Pbyte; in:Pbyte; inlen:qword; k:Pbyte):longint;cdecl;external libsodium;
{$endif}
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 31-8-26 17:25:51 ===


implementation



end.
