unit crypto_onetimeauth_poly1305;

interface

uses
  fp_sodium;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef crypto_onetimeauth_poly1305_H}
{$define crypto_onetimeauth_poly1305_H}
(** unsupported pragma#pragma GCC diagnostic ignored "-Wlong-long"*)
{$include <stdint.h>}
{$include <stdio.h>}
{$include <stdlib.h>}
{$include <sys/types.h>}
{$include "export.h"}
{CRYPTO_ALIGN(16) }type
  Pcrypto_onetimeauth_poly1305_state = ^Tcrypto_onetimeauth_poly1305_state;
  Tcrypto_onetimeauth_poly1305_state = record
      opaque : array[0..255] of byte;
    end;

function crypto_onetimeauth_poly1305_statebytes:Tsize_t;cdecl;external libsodium;
const
  crypto_onetimeauth_poly1305_BYTES = 16;  

function crypto_onetimeauth_poly1305_bytes:Tsize_t;cdecl;external libsodium;
const
  crypto_onetimeauth_poly1305_KEYBYTES = 32;  

function crypto_onetimeauth_poly1305_keybytes:Tsize_t;cdecl;external libsodium;
function crypto_onetimeauth_poly1305(out:Pbyte; in:Pbyte; inlen:qword; k:Pbyte):longint;cdecl;external libsodium;
function crypto_onetimeauth_poly1305_verify(h:Pbyte; in:Pbyte; inlen:qword; k:Pbyte):longint;cdecl;external libsodium;
function crypto_onetimeauth_poly1305_init(state:Pcrypto_onetimeauth_poly1305_state; key:Pbyte):longint;cdecl;external libsodium;
function crypto_onetimeauth_poly1305_update(state:Pcrypto_onetimeauth_poly1305_state; in:Pbyte; inlen:qword):longint;cdecl;external libsodium;
function crypto_onetimeauth_poly1305_final(state:Pcrypto_onetimeauth_poly1305_state; out:Pbyte):longint;cdecl;external libsodium;
procedure crypto_onetimeauth_poly1305_keygen(k:array[0..(crypto_onetimeauth_poly1305_KEYBYTES)-1] of byte);cdecl;external libsodium;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 31-8-26 17:11:48 ===


implementation



end.
