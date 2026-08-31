
unit crypto_hash_sha512;
interface

{
  Automatically converted by H2Pas 1.0.0 from crypto_hash_sha512.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    crypto_hash_sha512.h
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
Pcrypto_hash_sha512_state  = ^crypto_hash_sha512_state;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef crypto_hash_sha512_H}
{$define crypto_hash_sha512_H}
{
 * WARNING: Unless you absolutely need to use SHA512 for interoperatibility,
 * purposes, you might want to consider crypto_generichash() instead.
 * Unlike SHA512, crypto_generichash() is not vulnerable to length
 * extension attacks.
  }
{$include <stddef.h>}
{$include <stdint.h>}
{$include <stdlib.h>}
{$include "export.h"}
(** unsupported pragma#pragma GCC diagnostic ignored "-Wlong-long"*)
type
  Pcrypto_hash_sha512_state = ^Tcrypto_hash_sha512_state;
  Tcrypto_hash_sha512_state = record
      state : array[0..7] of Tuint64_t;
      count : array[0..1] of Tuint64_t;
      buf : array[0..127] of Tuint8_t;
    end;

function crypto_hash_sha512_statebytes:Tsize_t;cdecl;external;
const
  crypto_hash_sha512_BYTES = 64;  

function crypto_hash_sha512_bytes:Tsize_t;cdecl;external;
(* Const before type ignored *)
function crypto_hash_sha512(out:Pbyte; in:Pbyte; inlen:qword):longint;cdecl;external;
function crypto_hash_sha512_init(state:Pcrypto_hash_sha512_state):longint;cdecl;external;
(* Const before type ignored *)
function crypto_hash_sha512_update(state:Pcrypto_hash_sha512_state; in:Pbyte; inlen:qword):longint;cdecl;external;
function crypto_hash_sha512_final(state:Pcrypto_hash_sha512_state; out:Pbyte):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
