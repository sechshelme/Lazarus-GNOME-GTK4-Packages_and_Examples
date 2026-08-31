unit crypto_onetimeauth;

interface

uses
  fp_sodium;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef crypto_onetimeauth_H}
{$define crypto_onetimeauth_H}
{$include <stddef.h>}
{$include "crypto_onetimeauth_poly1305.h"}
{$include "export.h"}
(** unsupported pragma#pragma GCC diagnostic ignored "-Wlong-long"*)
type
  Pcrypto_onetimeauth_state = ^Tcrypto_onetimeauth_state;
  Tcrypto_onetimeauth_state = Tcrypto_onetimeauth_poly1305_state;

function crypto_onetimeauth_statebytes:Tsize_t;cdecl;external libsodium;
const
  crypto_onetimeauth_BYTES = crypto_onetimeauth_poly1305_BYTES;  

function crypto_onetimeauth_bytes:Tsize_t;cdecl;external libsodium;
const
  crypto_onetimeauth_KEYBYTES = crypto_onetimeauth_poly1305_KEYBYTES;  

function crypto_onetimeauth_keybytes:Tsize_t;cdecl;external libsodium;
const
  crypto_onetimeauth_PRIMITIVE = 'poly1305';  

function crypto_onetimeauth_primitive:Pchar;cdecl;external libsodium;
function crypto_onetimeauth(out:Pbyte; in:Pbyte; inlen:qword; k:Pbyte):longint;cdecl;external libsodium;
function crypto_onetimeauth_verify(h:Pbyte; in:Pbyte; inlen:qword; k:Pbyte):longint;cdecl;external libsodium;
function crypto_onetimeauth_init(state:Pcrypto_onetimeauth_state; key:Pbyte):longint;cdecl;external libsodium;
function crypto_onetimeauth_update(state:Pcrypto_onetimeauth_state; in:Pbyte; inlen:qword):longint;cdecl;external libsodium;
function crypto_onetimeauth_final(state:Pcrypto_onetimeauth_state; out:Pbyte):longint;cdecl;external libsodium;
procedure crypto_onetimeauth_keygen(k:array[0..(crypto_onetimeauth_KEYBYTES)-1] of byte);cdecl;external libsodium;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 31-8-26 17:11:50 ===


implementation



end.
