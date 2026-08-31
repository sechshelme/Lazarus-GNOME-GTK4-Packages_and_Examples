unit crypto_kdf_blake2b;

interface

uses
  fp_sodium;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef crypto_kdf_blake2b_H}
{$define crypto_kdf_blake2b_H}
{$include <stddef.h>}
{$include <stdint.h>}
{$include "crypto_kdf_blake2b.h"}
{$include "export.h"}
(** unsupported pragma#pragma GCC diagnostic ignored "-Wlong-long"*)

const
  crypto_kdf_blake2b_BYTES_MIN = 16;  

function crypto_kdf_blake2b_bytes_min:Tsize_t;cdecl;external libsodium;
const
  crypto_kdf_blake2b_BYTES_MAX = 64;  

function crypto_kdf_blake2b_bytes_max:Tsize_t;cdecl;external libsodium;
const
  crypto_kdf_blake2b_CONTEXTBYTES = 8;  

function crypto_kdf_blake2b_contextbytes:Tsize_t;cdecl;external libsodium;
const
  crypto_kdf_blake2b_KEYBYTES = 32;  

function crypto_kdf_blake2b_keybytes:Tsize_t;cdecl;external libsodium;
function crypto_kdf_blake2b_derive_from_key(subkey:Pbyte; subkey_len:Tsize_t; subkey_id:Tuint64_t; ctx:array[0..(crypto_kdf_blake2b_CONTEXTBYTES)-1] of char; key:array[0..(crypto_kdf_blake2b_KEYBYTES)-1] of byte):longint;cdecl;external libsodium;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 31-8-26 17:11:55 ===


implementation



end.
