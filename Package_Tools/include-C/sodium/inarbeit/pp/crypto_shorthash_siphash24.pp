
unit crypto_shorthash_siphash24;
interface

{
  Automatically converted by H2Pas 1.0.0 from crypto_shorthash_siphash24.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    crypto_shorthash_siphash24.h
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
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef crypto_shorthash_siphash24_H}
{$define crypto_shorthash_siphash24_H}
{$include <stddef.h>}
{$include "export.h"}
(** unsupported pragma#pragma GCC diagnostic ignored "-Wlong-long"*)
{ -- 64-bit output --  }

const
  crypto_shorthash_siphash24_BYTES = 8;  

function crypto_shorthash_siphash24_bytes:Tsize_t;cdecl;external;
const
  crypto_shorthash_siphash24_KEYBYTES = 16;  

function crypto_shorthash_siphash24_keybytes:Tsize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_shorthash_siphash24(out:Pbyte; in:Pbyte; inlen:qword; k:Pbyte):longint;cdecl;external;
{$ifndef SODIUM_LIBRARY_MINIMAL}
{ -- 128-bit output --  }

const
  crypto_shorthash_siphashx24_BYTES = 16;  

function crypto_shorthash_siphashx24_bytes:Tsize_t;cdecl;external;
const
  crypto_shorthash_siphashx24_KEYBYTES = 16;  

function crypto_shorthash_siphashx24_keybytes:Tsize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_shorthash_siphashx24(out:Pbyte; in:Pbyte; inlen:qword; k:Pbyte):longint;cdecl;external;
{$endif}
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
