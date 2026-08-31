
unit crypto_auth;
interface

{
  Automatically converted by H2Pas 1.0.0 from crypto_auth.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    crypto_auth.h
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

function crypto_auth_bytes:Tsize_t;cdecl;external;
const
  crypto_auth_KEYBYTES = crypto_auth_hmacsha512256_KEYBYTES;  

function crypto_auth_keybytes:Tsize_t;cdecl;external;
const
  crypto_auth_PRIMITIVE = 'hmacsha512256';  
(* Const before type ignored *)

function crypto_auth_primitive:Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_auth(out:Pbyte; in:Pbyte; inlen:qword; k:Pbyte):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_auth_verify(h:Pbyte; in:Pbyte; inlen:qword; k:Pbyte):longint;cdecl;external;
procedure crypto_auth_keygen(k:array[0..(crypto_auth_KEYBYTES)-1] of byte);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
