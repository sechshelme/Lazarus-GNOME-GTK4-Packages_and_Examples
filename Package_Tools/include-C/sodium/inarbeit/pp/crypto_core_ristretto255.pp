
unit crypto_core_ristretto255;
interface

{
  Automatically converted by H2Pas 1.0.0 from crypto_core_ristretto255.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    crypto_core_ristretto255.h
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


{$ifndef crypto_core_ristretto255_H}
{$define crypto_core_ristretto255_H}
{$include <stddef.h>}
{$include "export.h"}
{ C++ extern C conditionnal removed }

const
  crypto_core_ristretto255_BYTES = 32;  

function crypto_core_ristretto255_bytes:Tsize_t;cdecl;external;
const
  crypto_core_ristretto255_HASHBYTES = 64;  

function crypto_core_ristretto255_hashbytes:Tsize_t;cdecl;external;
const
  crypto_core_ristretto255_SCALARBYTES = 32;  

function crypto_core_ristretto255_scalarbytes:Tsize_t;cdecl;external;
const
  crypto_core_ristretto255_NONREDUCEDSCALARBYTES = 64;  

function crypto_core_ristretto255_nonreducedscalarbytes:Tsize_t;cdecl;external;
(* Const before type ignored *)
function crypto_core_ristretto255_is_valid_point(p:Pbyte):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_core_ristretto255_add(r:Pbyte; p:Pbyte; q:Pbyte):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_core_ristretto255_sub(r:Pbyte; p:Pbyte; q:Pbyte):longint;cdecl;external;
(* Const before type ignored *)
function crypto_core_ristretto255_from_hash(p:Pbyte; r:Pbyte):longint;cdecl;external;
procedure crypto_core_ristretto255_random(p:Pbyte);cdecl;external;
procedure crypto_core_ristretto255_scalar_random(r:Pbyte);cdecl;external;
(* Const before type ignored *)
function crypto_core_ristretto255_scalar_invert(recip:Pbyte; s:Pbyte):longint;cdecl;external;
(* Const before type ignored *)
procedure crypto_core_ristretto255_scalar_negate(neg:Pbyte; s:Pbyte);cdecl;external;
(* Const before type ignored *)
procedure crypto_core_ristretto255_scalar_complement(comp:Pbyte; s:Pbyte);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure crypto_core_ristretto255_scalar_add(z:Pbyte; x:Pbyte; y:Pbyte);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure crypto_core_ristretto255_scalar_sub(z:Pbyte; x:Pbyte; y:Pbyte);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure crypto_core_ristretto255_scalar_mul(z:Pbyte; x:Pbyte; y:Pbyte);cdecl;external;
{
 * The interval `s` is sampled from should be at least 317 bits to ensure almost
 * uniformity of `r` over `L`.
  }
(* Const before type ignored *)
procedure crypto_core_ristretto255_scalar_reduce(r:Pbyte; s:Pbyte);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
