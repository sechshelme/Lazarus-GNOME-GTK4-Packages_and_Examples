unit crypto_auth;

interface

uses
  fp_sodium;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef crypto_auth_H}
{$define crypto_auth_H}
{$include <stddef.h>}
{$include "crypto_auth_hmacsha512256.h"}
{$include "export.h"}
(** unsupported pragma#pragma GCC diagnostic ignored "-Wlong-long"*)

const
  crypto_auth_BYTES = crypto_auth_hmacsha512256_BYTES;  

function crypto_auth_bytes:Tsize_t;cdecl;external libsodium;
const
  crypto_auth_KEYBYTES = crypto_auth_hmacsha512256_KEYBYTES;  

function crypto_auth_keybytes:Tsize_t;cdecl;external libsodium;
const
  crypto_auth_PRIMITIVE = 'hmacsha512256';  

function crypto_auth_primitive:Pchar;cdecl;external libsodium;
function crypto_auth(out:Pbyte; in:Pbyte; inlen:qword; k:Pbyte):longint;cdecl;external libsodium;
function crypto_auth_verify(h:Pbyte; in:Pbyte; inlen:qword; k:Pbyte):longint;cdecl;external libsodium;
procedure crypto_auth_keygen(k:array[0..(crypto_auth_KEYBYTES)-1] of byte);cdecl;external libsodium;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 31-8-26 15:49:07 ===


implementation



end.
