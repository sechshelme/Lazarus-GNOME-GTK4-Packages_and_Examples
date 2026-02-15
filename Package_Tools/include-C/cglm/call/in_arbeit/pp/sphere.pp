
unit sphere;
interface

{
  Automatically converted by H2Pas 1.0.0 from sphere.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    sphere.h
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
{$ifndef cglmc_sphere_h}
{$define cglmc_sphere_h}
{ C++ extern C conditionnal removed }
{$include "../cglm.h"}

function glmc_sphere_radii(s:Tvec4):single;cdecl;external;
procedure glmc_sphere_transform(s:Tvec4; m:Tmat4; dest:Tvec4);cdecl;external;
procedure glmc_sphere_merge(s1:Tvec4; s2:Tvec4; dest:Tvec4);cdecl;external;
function glmc_sphere_sphere(s1:Tvec4; s2:Tvec4):Tbool;cdecl;external;
function glmc_sphere_point(s:Tvec4; point:Tvec3):Tbool;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ cglmc_sphere_h  }

implementation


end.
