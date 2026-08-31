
unit crypto_stream;
interface

{
  Automatically converted by H2Pas 1.0.0 from crypto_stream.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    crypto_stream
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


{$ifndef crypto_stream_H}
{$define crypto_stream_H}
{
 *  WARNING: This is just a stream cipher. It is NOT authenticated encryption.
 *  While it provides some protection against eavesdropping, it does NOT
 *  provide any security against active attacks.
 *  Unless you know what you're doing, what you are looking for is probably
 *  the crypto_box functions.
  }
{$include <stddef.h>}
{$include "crypto_stream_xsalsa20.h"}
{$include "export.h"}
(** unsupported pragma#pragma GCC diagnostic ignored "-Wlong-long"*)

const
  crypto_stream_KEYBYTES = crypto_stream_xsalsa20_KEYBYTES;  

function crypto_stream_keybytes:Tsize_t;cdecl;external;
const
  crypto_stream_NONCEBYTES = crypto_stream_xsalsa20_NONCEBYTES;  

function crypto_stream_noncebytes:Tsize_t;cdecl;external;
const
  crypto_stream_MESSAGEBYTES_MAX = crypto_stream_xsalsa20_MESSAGEBYTES_MAX;  

function crypto_stream_messagebytes_max:Tsize_t;cdecl;external;
const
  crypto_stream_PRIMITIVE = 'xsalsa20';  
(* Const before type ignored *)

function crypto_stream_primitive:Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_stream(c:Pbyte; clen:qword; n:Pbyte; k:Pbyte):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_stream_xor(c:Pbyte; m:Pbyte; mlen:qword; n:Pbyte; k:Pbyte):longint;cdecl;external;
procedure crypto_stream_keygen(k:array[0..(crypto_stream_KEYBYTES)-1] of byte);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
