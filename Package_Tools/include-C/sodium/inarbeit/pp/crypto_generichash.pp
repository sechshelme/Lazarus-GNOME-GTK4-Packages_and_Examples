
unit crypto_generichash;
interface

{
  Automatically converted by H2Pas 1.0.0 from crypto_generichash.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    crypto_generichash
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
Pcrypto_generichash_state  = ^crypto_generichash_state;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef crypto_generichash_H}
{$define crypto_generichash_H}
{$include <stddef.h>}
{$include "crypto_generichash_blake2b.h"}
{$include "export.h"}
(** unsupported pragma#pragma GCC diagnostic ignored "-Wlong-long"*)

const
  crypto_generichash_BYTES_MIN = crypto_generichash_blake2b_BYTES_MIN;  

function crypto_generichash_bytes_min:Tsize_t;cdecl;external;
const
  crypto_generichash_BYTES_MAX = crypto_generichash_blake2b_BYTES_MAX;  

function crypto_generichash_bytes_max:Tsize_t;cdecl;external;
const
  crypto_generichash_BYTES = crypto_generichash_blake2b_BYTES;  

function crypto_generichash_bytes:Tsize_t;cdecl;external;
const
  crypto_generichash_KEYBYTES_MIN = crypto_generichash_blake2b_KEYBYTES_MIN;  

function crypto_generichash_keybytes_min:Tsize_t;cdecl;external;
const
  crypto_generichash_KEYBYTES_MAX = crypto_generichash_blake2b_KEYBYTES_MAX;  

function crypto_generichash_keybytes_max:Tsize_t;cdecl;external;
const
  crypto_generichash_KEYBYTES = crypto_generichash_blake2b_KEYBYTES;  

function crypto_generichash_keybytes:Tsize_t;cdecl;external;
const
  crypto_generichash_PRIMITIVE = 'blake2b';  
(* Const before type ignored *)

function crypto_generichash_primitive:Pchar;cdecl;external;
{
 * Important when writing bindings for other programming languages:
 * the state address should be 64-bytes aligned.
  }
type
  Pcrypto_generichash_state = ^Tcrypto_generichash_state;
  Tcrypto_generichash_state = Tcrypto_generichash_blake2b_state;

function crypto_generichash_statebytes:Tsize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_generichash(out:Pbyte; outlen:Tsize_t; in:Pbyte; inlen:qword; key:Pbyte; 
           keylen:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_generichash_init(state:Pcrypto_generichash_state; key:Pbyte; keylen:Tsize_t; outlen:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
function crypto_generichash_update(state:Pcrypto_generichash_state; in:Pbyte; inlen:qword):longint;cdecl;external;
(* Const before type ignored *)
function crypto_generichash_final(state:Pcrypto_generichash_state; out:Pbyte; outlen:Tsize_t):longint;cdecl;external;
procedure crypto_generichash_keygen(k:array[0..(crypto_generichash_KEYBYTES)-1] of byte);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
