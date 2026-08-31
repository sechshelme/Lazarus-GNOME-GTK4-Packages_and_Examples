
unit randombytes_internal_random;
interface

{
  Automatically converted by H2Pas 1.0.0 from randombytes_internal_random.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    randombytes_internal_random.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef randombytes_internal_random_H}
{$define randombytes_internal_random_H}
{$include "export.h"}
{$include "randombytes.h"}
{ C++ extern C conditionnal removed }
  var
    randombytes_internal_implementation : Trandombytes_implementation;cvar;external;
{ Backwards compatibility with libsodium < 1.0.18  }

const
  randombytes_salsa20_implementation = randombytes_internal_implementation;  
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
