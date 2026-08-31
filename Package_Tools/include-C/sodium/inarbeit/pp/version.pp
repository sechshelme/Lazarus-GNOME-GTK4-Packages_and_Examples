
unit version;
interface

{
  Automatically converted by H2Pas 1.0.0 from version.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    version.h
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
Pchar  = ^char;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef sodium_version_H}
{$define sodium_version_H}
{$include "export.h"}

const
  SODIUM_VERSION_STRING = '1.0.18';  
  SODIUM_LIBRARY_VERSION_MAJOR = 10;  
  SODIUM_LIBRARY_VERSION_MINOR = 3;  
{ C++ extern C conditionnal removed }
(* Const before type ignored *)

function sodium_version_string:Pchar;cdecl;external;
function sodium_library_version_major:longint;cdecl;external;
function sodium_library_version_minor:longint;cdecl;external;
function sodium_library_minimal:longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
