
unit crypto_hash;
interface

{
  Automatically converted by H2Pas 1.0.0 from crypto_hash.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    crypto_hash
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


{$ifndef crypto_hash_H}
{$define crypto_hash_H}
{
 * WARNING: Unless you absolutely need to use SHA512 for interoperatibility,
 * purposes, you might want to consider crypto_generichash() instead.
 * Unlike SHA512, crypto_generichash() is not vulnerable to length
 * extension attacks.
  }
{$include <stddef.h>}
{$include "crypto_hash_sha512.h"}
{$include "export.h"}
(** unsupported pragma#pragma GCC diagnostic ignored "-Wlong-long"*)

const
  crypto_hash_BYTES = crypto_hash_sha512_BYTES;  

function crypto_hash_bytes:Tsize_t;cdecl;external;
(* Const before type ignored *)
function crypto_hash(out:Pbyte; in:Pbyte; inlen:qword):longint;cdecl;external;
const
  crypto_hash_PRIMITIVE = 'sha512';  
(* Const before type ignored *)

function crypto_hash_primitive:Pchar;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
