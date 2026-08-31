unit crypto_auth_hmacsha256;

interface

uses
  fp_sodium;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef crypto_auth_hmacsha256_H}
{$define crypto_auth_hmacsha256_H}
{$include <stddef.h>}
{$include "crypto_hash_sha256.h"}
{$include "export.h"}
(** unsupported pragma#pragma GCC diagnostic ignored "-Wlong-long"*)

const
  crypto_auth_hmacsha256_BYTES = 32;  

function crypto_auth_hmacsha256_bytes:Tsize_t;cdecl;external libsodium;
const
  crypto_auth_hmacsha256_KEYBYTES = 32;  

function crypto_auth_hmacsha256_keybytes:Tsize_t;cdecl;external libsodium;
function crypto_auth_hmacsha256(out:Pbyte; in:Pbyte; inlen:qword; k:Pbyte):longint;cdecl;external libsodium;
function crypto_auth_hmacsha256_verify(h:Pbyte; in:Pbyte; inlen:qword; k:Pbyte):longint;cdecl;external libsodium;
{ -------------------------------------------------------------------------  }
type
  Pcrypto_auth_hmacsha256_state = ^Tcrypto_auth_hmacsha256_state;
  Tcrypto_auth_hmacsha256_state = record
      ictx : Tcrypto_hash_sha256_state;
      octx : Tcrypto_hash_sha256_state;
    end;

function crypto_auth_hmacsha256_statebytes:Tsize_t;cdecl;external libsodium;
function crypto_auth_hmacsha256_init(state:Pcrypto_auth_hmacsha256_state; key:Pbyte; keylen:Tsize_t):longint;cdecl;external libsodium;
function crypto_auth_hmacsha256_update(state:Pcrypto_auth_hmacsha256_state; in:Pbyte; inlen:qword):longint;cdecl;external libsodium;
function crypto_auth_hmacsha256_final(state:Pcrypto_auth_hmacsha256_state; out:Pbyte):longint;cdecl;external libsodium;
procedure crypto_auth_hmacsha256_keygen(k:array[0..(crypto_auth_hmacsha256_KEYBYTES)-1] of byte);cdecl;external libsodium;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 31-8-26 15:49:04 ===


implementation



end.
