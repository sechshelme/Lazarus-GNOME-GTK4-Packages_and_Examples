
unit view_rh_no;
interface

{
  Automatically converted by H2Pas 1.0.0 from view_rh_no.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    view_rh_no.h
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
{$ifndef cglmc_view_rh_no_h}
{$define cglmc_view_rh_no_h}
{ C++ extern C conditionnal removed }
{$include "../../cglm.h"}

procedure glmc_lookat_rh_no(eye:Tvec3; center:Tvec3; up:Tvec3; dest:Tmat4);cdecl;external;
procedure glmc_look_rh_no(eye:Tvec3; dir:Tvec3; up:Tvec3; dest:Tmat4);cdecl;external;
procedure glmc_look_anyup_rh_no(eye:Tvec3; dir:Tvec3; dest:Tmat4);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ cglmc_view_rh_no_h  }

implementation


end.
