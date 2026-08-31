unit crypto_hash;

interface

uses
  fp_sodium;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef crypto_hash_H}
{$define crypto_hash_H}
{
 * WARNING: Unless you absolutely need to use SHA512 for interoperatibility,
 * purposes, you might want to consider crypto_generichash() instead.
 * Unlike SHA512, crypto_generichash() is not vulnerable to length
 * extension attacks.
  }
{$include <stddef.h>}
{$include "crypto_hash_sha512.h"}
{$include "export.h"}
(** unsupported pragma#pragma GCC diagnostic ignored "-Wlong-long"*)

const
  crypto_hash_BYTES = crypto_hash_sha512_BYTES;  

function crypto_hash_bytes:Tsize_t;cdecl;external libsodium;
function crypto_hash(out:Pbyte; in:Pbyte; inlen:qword):longint;cdecl;external libsodium;
const
  crypto_hash_PRIMITIVE = 'sha512';  

function crypto_hash_primitive:Pchar;cdecl;external libsodium;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 31-8-26 17:12:04 ===


implementation



end.
