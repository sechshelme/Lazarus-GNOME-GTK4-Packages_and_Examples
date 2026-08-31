
unit crypto_auth_hmacsha512;
interface

{
  Automatically converted by H2Pas 1.0.0 from crypto_auth_hmacsha512.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    crypto_auth_hmacsha512
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
Pcrypto_auth_hmacsha512_state  = ^crypto_auth_hmacsha512_state;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef crypto_auth_hmacsha512_H}
{$define crypto_auth_hmacsha512_H}
{$include <stddef.h>}
{$include "crypto_hash_sha512.h"}
{$include "export.h"}
(** unsupported pragma#pragma GCC diagnostic ignored "-Wlong-long"*)

const
  crypto_auth_hmacsha512_BYTES = 64;  

function crypto_auth_hmacsha512_bytes:Tsize_t;cdecl;external;
const
  crypto_auth_hmacsha512_KEYBYTES = 32;  

function crypto_auth_hmacsha512_keybytes:Tsize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_auth_hmacsha512(out:Pbyte; in:Pbyte; inlen:qword; k:Pbyte):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_auth_hmacsha512_verify(h:Pbyte; in:Pbyte; inlen:qword; k:Pbyte):longint;cdecl;external;
{ -------------------------------------------------------------------------  }
type
  Pcrypto_auth_hmacsha512_state = ^Tcrypto_auth_hmacsha512_state;
  Tcrypto_auth_hmacsha512_state = record
      ictx : Tcrypto_hash_sha512_state;
      octx : Tcrypto_hash_sha512_state;
    end;

function crypto_auth_hmacsha512_statebytes:Tsize_t;cdecl;external;
(* Const before type ignored *)
function crypto_auth_hmacsha512_init(state:Pcrypto_auth_hmacsha512_state; key:Pbyte; keylen:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
function crypto_auth_hmacsha512_update(state:Pcrypto_auth_hmacsha512_state; in:Pbyte; inlen:qword):longint;cdecl;external;
function crypto_auth_hmacsha512_final(state:Pcrypto_auth_hmacsha512_state; out:Pbyte):longint;cdecl;external;
procedure crypto_auth_hmacsha512_keygen(k:array[0..(crypto_auth_hmacsha512_KEYBYTES)-1] of byte);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
