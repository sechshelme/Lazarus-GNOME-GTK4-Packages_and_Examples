
unit crypto_generichash_blake2b;
interface

{
  Automatically converted by H2Pas 1.0.0 from crypto_generichash_blake2b.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    crypto_generichash_blake2b.h
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
Pcrypto_generichash_blake2b_state  = ^crypto_generichash_blake2b_state;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef crypto_generichash_blake2b_H}
{$define crypto_generichash_blake2b_H}
{$include <stddef.h>}
{$include <stdint.h>}
{$include <stdlib.h>}
{$include "export.h"}
{ CRYPTO_ALIGN(64) }type
  Pcrypto_generichash_blake2b_state = ^Tcrypto_generichash_blake2b_state;
  Tcrypto_generichash_blake2b_state = record
      opaque : array[0..383] of byte;
    end;

const
  crypto_generichash_blake2b_BYTES_MIN = 16;  

function crypto_generichash_blake2b_bytes_min:Tsize_t;cdecl;external;
const
  crypto_generichash_blake2b_BYTES_MAX = 64;  

function crypto_generichash_blake2b_bytes_max:Tsize_t;cdecl;external;
const
  crypto_generichash_blake2b_BYTES = 32;  

function crypto_generichash_blake2b_bytes:Tsize_t;cdecl;external;
const
  crypto_generichash_blake2b_KEYBYTES_MIN = 16;  

function crypto_generichash_blake2b_keybytes_min:Tsize_t;cdecl;external;
const
  crypto_generichash_blake2b_KEYBYTES_MAX = 64;  

function crypto_generichash_blake2b_keybytes_max:Tsize_t;cdecl;external;
const
  crypto_generichash_blake2b_KEYBYTES = 32;  

function crypto_generichash_blake2b_keybytes:Tsize_t;cdecl;external;
const
  crypto_generichash_blake2b_SALTBYTES = 16;  

function crypto_generichash_blake2b_saltbytes:Tsize_t;cdecl;external;
const
  crypto_generichash_blake2b_PERSONALBYTES = 16;  

function crypto_generichash_blake2b_personalbytes:Tsize_t;cdecl;external;
function crypto_generichash_blake2b_statebytes:Tsize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_generichash_blake2b(out:Pbyte; outlen:Tsize_t; in:Pbyte; inlen:qword; key:Pbyte; 
           keylen:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_generichash_blake2b_salt_personal(out:Pbyte; outlen:Tsize_t; in:Pbyte; inlen:qword; key:Pbyte; 
           keylen:Tsize_t; salt:Pbyte; personal:Pbyte):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_generichash_blake2b_init(state:Pcrypto_generichash_blake2b_state; key:Pbyte; keylen:Tsize_t; outlen:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_generichash_blake2b_init_salt_personal(state:Pcrypto_generichash_blake2b_state; key:Pbyte; keylen:Tsize_t; outlen:Tsize_t; salt:Pbyte; 
           personal:Pbyte):longint;cdecl;external;
(* Const before type ignored *)
function crypto_generichash_blake2b_update(state:Pcrypto_generichash_blake2b_state; in:Pbyte; inlen:qword):longint;cdecl;external;
(* Const before type ignored *)
function crypto_generichash_blake2b_final(state:Pcrypto_generichash_blake2b_state; out:Pbyte; outlen:Tsize_t):longint;cdecl;external;
procedure crypto_generichash_blake2b_keygen(k:array[0..(crypto_generichash_blake2b_KEYBYTES)-1] of byte);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
