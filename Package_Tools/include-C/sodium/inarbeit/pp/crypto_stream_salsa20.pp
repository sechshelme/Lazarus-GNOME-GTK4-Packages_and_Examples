
unit crypto_stream_salsa20;
interface

{
  Automatically converted by H2Pas 1.0.0 from crypto_stream_salsa20.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    crypto_stream_salsa20
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


{$ifndef crypto_stream_salsa20_H}
{$define crypto_stream_salsa20_H}
{
 *  WARNING: This is just a stream cipher. It is NOT authenticated encryption.
 *  While it provides some protection against eavesdropping, it does NOT
 *  provide any security against active attacks.
 *  Unless you know what you're doing, what you are looking for is probably
 *  the crypto_box functions.
  }
{$include <stddef.h>}
{$include <stdint.h>}
{$include "export.h"}
(** unsupported pragma#pragma GCC diagnostic ignored "-Wlong-long"*)

const
  crypto_stream_salsa20_KEYBYTES = 32;  

function crypto_stream_salsa20_keybytes:Tsize_t;cdecl;external;
const
  crypto_stream_salsa20_NONCEBYTES = 8;  

function crypto_stream_salsa20_noncebytes:Tsize_t;cdecl;external;
const
  crypto_stream_salsa20_MESSAGEBYTES_MAX = SODIUM_SIZE_MAX;  

function crypto_stream_salsa20_messagebytes_max:Tsize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_stream_salsa20(c:Pbyte; clen:qword; n:Pbyte; k:Pbyte):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_stream_salsa20_xor(c:Pbyte; m:Pbyte; mlen:qword; n:Pbyte; k:Pbyte):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_stream_salsa20_xor_ic(c:Pbyte; m:Pbyte; mlen:qword; n:Pbyte; ic:Tuint64_t; 
           k:Pbyte):longint;cdecl;external;
procedure crypto_stream_salsa20_keygen(k:array[0..(crypto_stream_salsa20_KEYBYTES)-1] of byte);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
