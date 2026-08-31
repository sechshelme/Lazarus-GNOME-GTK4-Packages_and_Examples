
unit crypto_verify_16;
interface

{
  Automatically converted by H2Pas 1.0.0 from crypto_verify_16.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    crypto_verify_16.h
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


{$ifndef crypto_verify_16_H}
{$define crypto_verify_16_H}
{$include <stddef.h>}
{$include "export.h"}
{ C++ extern C conditionnal removed }

const
  crypto_verify_16_BYTES = 16;  

function crypto_verify_16_bytes:Tsize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function crypto_verify_16(x:Pbyte; y:Pbyte):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
