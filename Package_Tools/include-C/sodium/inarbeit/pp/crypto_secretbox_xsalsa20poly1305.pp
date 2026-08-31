
unit crypto_secretbox_xsalsa20poly1305;
interface

{
  Automatically converted by H2Pas 1.0.0 from crypto_secretbox_xsalsa20poly1305.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    crypto_secretbox_xsalsa20poly1305.h
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


{$ifndef crypto_secretbox_xsalsa20poly1305_H}
{$define crypto_secretbox_xsalsa20poly1305_H}
{$include <stddef.h>}
{$include "crypto_stream_xsalsa20.h"}
{$include "export.h"}
(** unsupported pragma#pragma GCC diagnostic ignored "-Wlong-long"*)

const
  crypto_secretbox_xsalsa20poly1305_KEYBYTES = 32;  

function crypto_secretbox_xsalsa20poly1305_keybytes:Tsize_t;cdecl;external;
const
  crypto_secretbox_xsalsa20poly1305_NONCEBYTES = 24;  

function crypto_secretbox_xsalsa20poly1305_noncebytes:Tsize_t;cdecl;external;
const
  crypto_secretbox_xsalsa20poly1305_MACBYTES = 16;  

function crypto_secretbox_xsalsa20poly1305_macbytes:Tsize_t;cdecl;external;
{ Only for the libsodium API - The NaCl compatibility API would require BOXZEROBYTES extra bytes  }
const
  crypto_secretbox_xsalsa20poly1305_MESSAGEBYTES_MAX = crypto_stream_xsalsa20_MESSAGEBYTES_MAX-crypto_secretbox_xsalsa20poly1305_MACBYTES;  

function crypto_secretbox_xsalsa20poly1305_messagebytes_max:Tsize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_secretbox_xsalsa20poly1305(c:Pbyte; m:Pbyte; mlen:qword; n:Pbyte; k:Pbyte):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_secretbox_xsalsa20poly1305_open(m:Pbyte; c:Pbyte; clen:qword; n:Pbyte; k:Pbyte):longint;cdecl;external;
procedure crypto_secretbox_xsalsa20poly1305_keygen(k:array[0..(crypto_secretbox_xsalsa20poly1305_KEYBYTES)-1] of byte);cdecl;external;
{ -- NaCl compatibility interface ; Requires padding --  }
const
  crypto_secretbox_xsalsa20poly1305_BOXZEROBYTES = 16;  

function crypto_secretbox_xsalsa20poly1305_boxzerobytes:Tsize_t;cdecl;external;
const
  crypto_secretbox_xsalsa20poly1305_ZEROBYTES = crypto_secretbox_xsalsa20poly1305_BOXZEROBYTES+crypto_secretbox_xsalsa20poly1305_MACBYTES;  

function crypto_secretbox_xsalsa20poly1305_zerobytes:Tsize_t;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
