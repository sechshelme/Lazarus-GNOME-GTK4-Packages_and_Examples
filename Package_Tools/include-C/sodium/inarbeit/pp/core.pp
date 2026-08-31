
unit core;
interface

{
  Automatically converted by H2Pas 1.0.0 from core.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    core.h
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


{$ifndef sodium_core_H}
{$define sodium_core_H}
{$include "export.h"}
{ C++ extern C conditionnal removed }

function sodium_init:longint;cdecl;external;
{ ----  }
function sodium_set_misuse_handler(handler:procedure ):longint;cdecl;external;
procedure sodium_misuse;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
