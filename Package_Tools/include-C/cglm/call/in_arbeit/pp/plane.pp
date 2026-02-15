
unit plane;
interface

{
  Automatically converted by H2Pas 1.0.0 from plane.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    plane.h
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


{
 * Copyright (c), Recep Aslantas.
 *
 * MIT License (MIT), http://opensource.org/licenses/MIT
 * Full license can be found in the LICENSE file
  }
{$ifndef cglmc_plane_h}
{$define cglmc_plane_h}
{ C++ extern C conditionnal removed }
{$include "../cglm.h"}

procedure glmc_plane_normalize(plane:Tvec4);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ cglmc_plane_h  }

implementation


end.
