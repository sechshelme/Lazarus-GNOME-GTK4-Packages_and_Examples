
unit randombytes_sysrandom;
interface

{
  Automatically converted by H2Pas 1.0.0 from randombytes_sysrandom.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    randombytes_sysrandom.h
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


{$ifndef randombytes_sysrandom_H}
{$define randombytes_sysrandom_H}
{$include "export.h"}
{$include "randombytes.h"}
{ C++ extern C conditionnal removed }
  var
    randombytes_sysrandom_implementation : Trandombytes_implementation;cvar;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
