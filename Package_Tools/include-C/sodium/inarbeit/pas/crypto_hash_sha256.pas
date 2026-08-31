unit crypto_hash_sha256;

interface

uses
  fp_sodium;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef crypto_hash_sha256_H}
{$define crypto_hash_sha256_H}
{
 * WARNING: Unless you absolutely need to use SHA256 for interoperatibility,
 * purposes, you might want to consider crypto_generichash() instead.
 * Unlike SHA256, crypto_generichash() is not vulnerable to length
 * extension attacks.
  }
{$include <stddef.h>}
{$include <stdint.h>}
{$include <stdlib.h>}
{$include "export.h"}
(** unsupported pragma#pragma GCC diagnostic ignored "-Wlong-long"*)
type
  Pcrypto_hash_sha256_state = ^Tcrypto_hash_sha256_state;
  Tcrypto_hash_sha256_state = record
      state : array[0..7] of Tuint32_t;
      count : Tuint64_t;
      buf : array[0..63] of Tuint8_t;
    end;

function crypto_hash_sha256_statebytes:Tsize_t;cdecl;external libsodium;
const
  crypto_hash_sha256_BYTES = 32;  

function crypto_hash_sha256_bytes:Tsize_t;cdecl;external libsodium;
function crypto_hash_sha256(out:Pbyte; in:Pbyte; inlen:qword):longint;cdecl;external libsodium;
function crypto_hash_sha256_init(state:Pcrypto_hash_sha256_state):longint;cdecl;external libsodium;
function crypto_hash_sha256_update(state:Pcrypto_hash_sha256_state; in:Pbyte; inlen:qword):longint;cdecl;external libsodium;
function crypto_hash_sha256_final(state:Pcrypto_hash_sha256_state; out:Pbyte):longint;cdecl;external libsodium;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 31-8-26 17:12:02 ===


implementation



end.
