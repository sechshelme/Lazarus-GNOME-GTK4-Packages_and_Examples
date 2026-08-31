
unit crypto_kdf_blake2b;
interface

{
  Automatically converted by H2Pas 1.0.0 from crypto_kdf_blake2b.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    crypto_kdf_blake2b.h
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


{$ifndef crypto_kdf_blake2b_H}
{$define crypto_kdf_blake2b_H}
{$include <stddef.h>}
{$include <stdint.h>}
{$include "crypto_kdf_blake2b.h"}
{$include "export.h"}
(** unsupported pragma#pragma GCC diagnostic ignored "-Wlong-long"*)

const
  crypto_kdf_blake2b_BYTES_MIN = 16;  

function crypto_kdf_blake2b_bytes_min:Tsize_t;cdecl;external;
const
  crypto_kdf_blake2b_BYTES_MAX = 64;  

function crypto_kdf_blake2b_bytes_max:Tsize_t;cdecl;external;
const
  crypto_kdf_blake2b_CONTEXTBYTES = 8;  

function crypto_kdf_blake2b_contextbytes:Tsize_t;cdecl;external;
const
  crypto_kdf_blake2b_KEYBYTES = 32;  

function crypto_kdf_blake2b_keybytes:Tsize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_kdf_blake2b_derive_from_key(subkey:Pbyte; subkey_len:Tsize_t; subkey_id:Tuint64_t; ctx:array[0..(crypto_kdf_blake2b_CONTEXTBYTES)-1] of char; key:array[0..(crypto_kdf_blake2b_KEYBYTES)-1] of byte):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
