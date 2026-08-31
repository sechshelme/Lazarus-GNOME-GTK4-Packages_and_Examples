
unit crypto_shorthash;
interface

{
  Automatically converted by H2Pas 1.0.0 from crypto_shorthash.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    crypto_shorthash
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


{$ifndef crypto_shorthash_H}
{$define crypto_shorthash_H}
{$include <stddef.h>}
{$include "crypto_shorthash_siphash24.h"}
{$include "export.h"}
(** unsupported pragma#pragma GCC diagnostic ignored "-Wlong-long"*)

const
  crypto_shorthash_BYTES = crypto_shorthash_siphash24_BYTES;  

function crypto_shorthash_bytes:Tsize_t;cdecl;external;
const
  crypto_shorthash_KEYBYTES = crypto_shorthash_siphash24_KEYBYTES;  

function crypto_shorthash_keybytes:Tsize_t;cdecl;external;
const
  crypto_shorthash_PRIMITIVE = 'siphash24';  
(* Const before type ignored *)

function crypto_shorthash_primitive:Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_shorthash(out:Pbyte; in:Pbyte; inlen:qword; k:Pbyte):longint;cdecl;external;
procedure crypto_shorthash_keygen(k:array[0..(crypto_shorthash_KEYBYTES)-1] of byte);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
