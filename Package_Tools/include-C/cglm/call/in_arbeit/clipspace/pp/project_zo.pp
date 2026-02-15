
unit project_zo;
interface

{
  Automatically converted by H2Pas 1.0.0 from project_zo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    project_zo.h
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
{$ifndef cglmc_project_zo_h}
{$define cglmc_project_zo_h}
{ C++ extern C conditionnal removed }
{$include "../../cglm.h"}

procedure glmc_unprojecti_zo(pos:Tvec3; invMat:Tmat4; vp:Tvec4; dest:Tvec3);cdecl;external;
procedure glmc_project_zo(pos:Tvec3; m:Tmat4; vp:Tvec4; dest:Tvec3);cdecl;external;
function glmc_project_z_zo(pos:Tvec3; m:Tmat4):single;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ cglmc_project_zo_h  }

implementation


end.
