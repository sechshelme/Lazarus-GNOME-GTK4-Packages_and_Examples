
unit crypto_onetimeauth_poly1305;
interface

{
  Automatically converted by H2Pas 1.0.0 from crypto_onetimeauth_poly1305.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    crypto_onetimeauth_poly1305.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pbyte  = ^byte;
Pcrypto_onetimeauth_poly1305_state  = ^crypto_onetimeauth_poly1305_state;
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

function crypto_onetimeauth_poly1305_statebytes:Tsize_t;cdecl;external;
const
  crypto_onetimeauth_poly1305_BYTES = 16;  

function crypto_onetimeauth_poly1305_bytes:Tsize_t;cdecl;external;
const
  crypto_onetimeauth_poly1305_KEYBYTES = 32;  

function crypto_onetimeauth_poly1305_keybytes:Tsize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_onetimeauth_poly1305(out:Pbyte; in:Pbyte; inlen:qword; k:Pbyte):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_onetimeauth_poly1305_verify(h:Pbyte; in:Pbyte; inlen:qword; k:Pbyte):longint;cdecl;external;
(* Const before type ignored *)
function crypto_onetimeauth_poly1305_init(state:Pcrypto_onetimeauth_poly1305_state; key:Pbyte):longint;cdecl;external;
(* Const before type ignored *)
function crypto_onetimeauth_poly1305_update(state:Pcrypto_onetimeauth_poly1305_state; in:Pbyte; inlen:qword):longint;cdecl;external;
function crypto_onetimeauth_poly1305_final(state:Pcrypto_onetimeauth_poly1305_state; out:Pbyte):longint;cdecl;external;
procedure crypto_onetimeauth_poly1305_keygen(k:array[0..(crypto_onetimeauth_poly1305_KEYBYTES)-1] of byte);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
