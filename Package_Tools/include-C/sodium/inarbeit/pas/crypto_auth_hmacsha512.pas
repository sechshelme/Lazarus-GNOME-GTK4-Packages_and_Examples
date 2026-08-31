unit crypto_auth_hmacsha512;

interface

uses
  fp_sodium;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef crypto_auth_hmacsha512_H}
{$define crypto_auth_hmacsha512_H}
{$include <stddef.h>}
{$include "crypto_hash_sha512.h"}
{$include "export.h"}
(** unsupported pragma#pragma GCC diagnostic ignored "-Wlong-long"*)

const
  crypto_auth_hmacsha512_BYTES = 64;  

function crypto_auth_hmacsha512_bytes:Tsize_t;cdecl;external libsodium;
const
  crypto_auth_hmacsha512_KEYBYTES = 32;  

function crypto_auth_hmacsha512_keybytes:Tsize_t;cdecl;external libsodium;
function crypto_auth_hmacsha512(out:Pbyte; in:Pbyte; inlen:qword; k:Pbyte):longint;cdecl;external libsodium;
function crypto_auth_hmacsha512_verify(h:Pbyte; in:Pbyte; inlen:qword; k:Pbyte):longint;cdecl;external libsodium;
{ -------------------------------------------------------------------------  }
type
  Pcrypto_auth_hmacsha512_state = ^Tcrypto_auth_hmacsha512_state;
  Tcrypto_auth_hmacsha512_state = record
      ictx : Tcrypto_hash_sha512_state;
      octx : Tcrypto_hash_sha512_state;
    end;

function crypto_auth_hmacsha512_statebytes:Tsize_t;cdecl;external libsodium;
function crypto_auth_hmacsha512_init(state:Pcrypto_auth_hmacsha512_state; key:Pbyte; keylen:Tsize_t):longint;cdecl;external libsodium;
function crypto_auth_hmacsha512_update(state:Pcrypto_auth_hmacsha512_state; in:Pbyte; inlen:qword):longint;cdecl;external libsodium;
function crypto_auth_hmacsha512_final(state:Pcrypto_auth_hmacsha512_state; out:Pbyte):longint;cdecl;external libsodium;
procedure crypto_auth_hmacsha512_keygen(k:array[0..(crypto_auth_hmacsha512_KEYBYTES)-1] of byte);cdecl;external libsodium;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 31-8-26 15:49:02 ===


implementation



end.
