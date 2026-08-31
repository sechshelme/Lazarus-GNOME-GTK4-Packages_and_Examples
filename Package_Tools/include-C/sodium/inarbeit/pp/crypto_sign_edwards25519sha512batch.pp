
unit crypto_sign_edwards25519sha512batch;
interface

{
  Automatically converted by H2Pas 1.0.0 from crypto_sign_edwards25519sha512batch.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    crypto_sign_edwards25519sha512batch.h
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
Pqword  = ^qword;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef crypto_sign_edwards25519sha512batch_H}
{$define crypto_sign_edwards25519sha512batch_H}
{
 * WARNING: This construction was a prototype, which should not be used
 * any more in new projects.
 *
 * crypto_sign_edwards25519sha512batch is provided for applications
 * initially built with NaCl, but as recommended by the author of this
 * construction, new applications should use ed25519 instead.
 *
 * In Sodium, you should use the high-level crypto_sign_*() functions instead.
  }
{$include <stddef.h>}
{$include "export.h"}
(** unsupported pragma#pragma GCC diagnostic ignored "-Wlong-long"*)

const
  crypto_sign_edwards25519sha512batch_BYTES = 64;  
  crypto_sign_edwards25519sha512batch_PUBLICKEYBYTES = 32;  
  crypto_sign_edwards25519sha512batch_SECRETKEYBYTES = 32+32;  
  crypto_sign_edwards25519sha512batch_MESSAGEBYTES_MAX = SODIUM_SIZE_MAX-crypto_sign_edwards25519sha512batch_BYTES;  
(* Const before type ignored *)
(* Const before type ignored *)

function crypto_sign_edwards25519sha512batch(sm:Pbyte; smlen_p:Pqword; m:Pbyte; mlen:qword; sk:Pbyte):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_sign_edwards25519sha512batch_open(m:Pbyte; mlen_p:Pqword; sm:Pbyte; smlen:qword; pk:Pbyte):longint;cdecl;external;
function crypto_sign_edwards25519sha512batch_keypair(pk:Pbyte; sk:Pbyte):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
