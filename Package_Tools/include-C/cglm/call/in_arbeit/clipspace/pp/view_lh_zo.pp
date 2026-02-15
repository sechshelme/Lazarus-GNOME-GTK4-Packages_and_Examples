
unit view_lh_zo;
interface

{
  Automatically converted by H2Pas 1.0.0 from view_lh_zo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    view_lh_zo.h
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
{$ifndef cglmc_view_lh_zo_h}
{$define cglmc_view_lh_zo_h}
{ C++ extern C conditionnal removed }
{$include "../../cglm.h"}

procedure glmc_lookat_lh_zo(eye:Tvec3; center:Tvec3; up:Tvec3; dest:Tmat4);cdecl;external;
procedure glmc_look_lh_zo(eye:Tvec3; dir:Tvec3; up:Tvec3; dest:Tmat4);cdecl;external;
procedure glmc_look_anyup_lh_zo(eye:Tvec3; dir:Tvec3; dest:Tmat4);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ cglmc_view_lh_zo_h  }

implementation


end.
