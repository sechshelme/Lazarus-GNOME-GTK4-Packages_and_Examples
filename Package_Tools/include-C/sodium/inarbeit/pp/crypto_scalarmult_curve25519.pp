
unit crypto_scalarmult_curve25519;
interface

{
  Automatically converted by H2Pas 1.0.0 from crypto_scalarmult_curve25519.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    crypto_scalarmult_curve25519.h
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


{$ifndef crypto_scalarmult_curve25519_H}
{$define crypto_scalarmult_curve25519_H}
{$include <stddef.h>}
{$include "export.h"}
{ C++ extern C conditionnal removed }

const
  crypto_scalarmult_curve25519_BYTES = 32;  

function crypto_scalarmult_curve25519_bytes:Tsize_t;cdecl;external;
const
  crypto_scalarmult_curve25519_SCALARBYTES = 32;  

function crypto_scalarmult_curve25519_scalarbytes:Tsize_t;cdecl;external;
{
 * NOTE: Do not use the result of this function directly for key exchange.
 *
 * Hash the result with the public keys in order to compute a shared
 * secret key: H(q || client_pk || server_pk)
 *
 * Or unless this is not an option, use the crypto_kx() API instead.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_scalarmult_curve25519(q:Pbyte; n:Pbyte; p:Pbyte):longint;cdecl;external;
(* Const before type ignored *)
function crypto_scalarmult_curve25519_base(q:Pbyte; n:Pbyte):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
