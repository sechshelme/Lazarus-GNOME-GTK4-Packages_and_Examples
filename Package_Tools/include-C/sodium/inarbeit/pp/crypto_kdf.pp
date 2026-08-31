
unit crypto_kdf;
interface

{
  Automatically converted by H2Pas 1.0.0 from crypto_kdf.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    crypto_kdf
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


{$ifndef crypto_kdf_H}
{$define crypto_kdf_H}
{$include <stddef.h>}
{$include <stdint.h>}
{$include "crypto_kdf_blake2b.h"}
{$include "export.h"}
(** unsupported pragma#pragma GCC diagnostic ignored "-Wlong-long"*)

const
  crypto_kdf_BYTES_MIN = crypto_kdf_blake2b_BYTES_MIN;  

function crypto_kdf_bytes_min:Tsize_t;cdecl;external;
const
  crypto_kdf_BYTES_MAX = crypto_kdf_blake2b_BYTES_MAX;  

function crypto_kdf_bytes_max:Tsize_t;cdecl;external;
const
  crypto_kdf_CONTEXTBYTES = crypto_kdf_blake2b_CONTEXTBYTES;  

function crypto_kdf_contextbytes:Tsize_t;cdecl;external;
const
  crypto_kdf_KEYBYTES = crypto_kdf_blake2b_KEYBYTES;  

function crypto_kdf_keybytes:Tsize_t;cdecl;external;
const
  crypto_kdf_PRIMITIVE = 'blake2b';  
(* Const before type ignored *)

function crypto_kdf_primitive:Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_kdf_derive_from_key(subkey:Pbyte; subkey_len:Tsize_t; subkey_id:Tuint64_t; ctx:array[0..(crypto_kdf_CONTEXTBYTES)-1] of char; key:array[0..(crypto_kdf_KEYBYTES)-1] of byte):longint;cdecl;external;
procedure crypto_kdf_keygen(k:array[0..(crypto_kdf_KEYBYTES)-1] of byte);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
