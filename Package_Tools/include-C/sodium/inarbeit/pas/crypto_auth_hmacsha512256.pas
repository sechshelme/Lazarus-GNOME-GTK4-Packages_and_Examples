unit crypto_auth_hmacsha512256;

interface

uses
  fp_sodium;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef crypto_auth_hmacsha512256_H}
{$define crypto_auth_hmacsha512256_H}
{$include <stddef.h>}
{$include "crypto_auth_hmacsha512.h"}
{$include "export.h"}
(** unsupported pragma#pragma GCC diagnostic ignored "-Wlong-long"*)

const
  crypto_auth_hmacsha512256_BYTES = 32;  

function crypto_auth_hmacsha512256_bytes:Tsize_t;cdecl;external libsodium;
const
  crypto_auth_hmacsha512256_KEYBYTES = 32;  

function crypto_auth_hmacsha512256_keybytes:Tsize_t;cdecl;external libsodium;
function crypto_auth_hmacsha512256(out:Pbyte; in:Pbyte; inlen:qword; k:Pbyte):longint;cdecl;external libsodium;
function crypto_auth_hmacsha512256_verify(h:Pbyte; in:Pbyte; inlen:qword; k:Pbyte):longint;cdecl;external libsodium;
{ -------------------------------------------------------------------------  }
type
  Pcrypto_auth_hmacsha512256_state = ^Tcrypto_auth_hmacsha512256_state;
  Tcrypto_auth_hmacsha512256_state = Tcrypto_auth_hmacsha512_state;

function crypto_auth_hmacsha512256_statebytes:Tsize_t;cdecl;external libsodium;
function crypto_auth_hmacsha512256_init(state:Pcrypto_auth_hmacsha512256_state; key:Pbyte; keylen:Tsize_t):longint;cdecl;external libsodium;
function crypto_auth_hmacsha512256_update(state:Pcrypto_auth_hmacsha512256_state; in:Pbyte; inlen:qword):longint;cdecl;external libsodium;
function crypto_auth_hmacsha512256_final(state:Pcrypto_auth_hmacsha512256_state; out:Pbyte):longint;cdecl;external libsodium;
procedure crypto_auth_hmacsha512256_keygen(k:array[0..(crypto_auth_hmacsha512256_KEYBYTES)-1] of byte);cdecl;external libsodium;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 31-8-26 15:48:59 ===


implementation



end.
