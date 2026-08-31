
unit crypto_onetimeauth;
interface

{
  Automatically converted by H2Pas 1.0.0 from crypto_onetimeauth.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    crypto_onetimeauth
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
Pchar  = ^char;
Pcrypto_onetimeauth_state  = ^crypto_onetimeauth_state;
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

function crypto_onetimeauth_statebytes:Tsize_t;cdecl;external;
const
  crypto_onetimeauth_BYTES = crypto_onetimeauth_poly1305_BYTES;  

function crypto_onetimeauth_bytes:Tsize_t;cdecl;external;
const
  crypto_onetimeauth_KEYBYTES = crypto_onetimeauth_poly1305_KEYBYTES;  

function crypto_onetimeauth_keybytes:Tsize_t;cdecl;external;
const
  crypto_onetimeauth_PRIMITIVE = 'poly1305';  
(* Const before type ignored *)

function crypto_onetimeauth_primitive:Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_onetimeauth(out:Pbyte; in:Pbyte; inlen:qword; k:Pbyte):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_onetimeauth_verify(h:Pbyte; in:Pbyte; inlen:qword; k:Pbyte):longint;cdecl;external;
(* Const before type ignored *)
function crypto_onetimeauth_init(state:Pcrypto_onetimeauth_state; key:Pbyte):longint;cdecl;external;
(* Const before type ignored *)
function crypto_onetimeauth_update(state:Pcrypto_onetimeauth_state; in:Pbyte; inlen:qword):longint;cdecl;external;
function crypto_onetimeauth_final(state:Pcrypto_onetimeauth_state; out:Pbyte):longint;cdecl;external;
procedure crypto_onetimeauth_keygen(k:array[0..(crypto_onetimeauth_KEYBYTES)-1] of byte);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
