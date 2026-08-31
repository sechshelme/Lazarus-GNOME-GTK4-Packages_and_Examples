
unit crypto_secretbox_xchacha20poly1305;
interface

{
  Automatically converted by H2Pas 1.0.0 from crypto_secretbox_xchacha20poly1305.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    crypto_secretbox_xchacha20poly1305.h
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


{$ifndef crypto_secretbox_xchacha20poly1305_H}
{$define crypto_secretbox_xchacha20poly1305_H}
{$include <stddef.h>}
{$include "crypto_stream_xchacha20.h"}
{$include "export.h"}
(** unsupported pragma#pragma GCC diagnostic ignored "-Wlong-long"*)

const
  crypto_secretbox_xchacha20poly1305_KEYBYTES = 32;  

function crypto_secretbox_xchacha20poly1305_keybytes:Tsize_t;cdecl;external;
const
  crypto_secretbox_xchacha20poly1305_NONCEBYTES = 24;  

function crypto_secretbox_xchacha20poly1305_noncebytes:Tsize_t;cdecl;external;
const
  crypto_secretbox_xchacha20poly1305_MACBYTES = 16;  

function crypto_secretbox_xchacha20poly1305_macbytes:Tsize_t;cdecl;external;
const
  crypto_secretbox_xchacha20poly1305_MESSAGEBYTES_MAX = crypto_stream_xchacha20_MESSAGEBYTES_MAX-crypto_secretbox_xchacha20poly1305_MACBYTES;  

function crypto_secretbox_xchacha20poly1305_messagebytes_max:Tsize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_secretbox_xchacha20poly1305_easy(c:Pbyte; m:Pbyte; mlen:qword; n:Pbyte; k:Pbyte):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_secretbox_xchacha20poly1305_open_easy(m:Pbyte; c:Pbyte; clen:qword; n:Pbyte; k:Pbyte):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_secretbox_xchacha20poly1305_detached(c:Pbyte; mac:Pbyte; m:Pbyte; mlen:qword; n:Pbyte; 
           k:Pbyte):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_secretbox_xchacha20poly1305_open_detached(m:Pbyte; c:Pbyte; mac:Pbyte; clen:qword; n:Pbyte; 
           k:Pbyte):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
