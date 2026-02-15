
unit ray;
interface

{
  Automatically converted by H2Pas 1.0.0 from ray.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ray.h
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
Psingle  = ^single;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (c), Recep Aslantas.
 *
 * MIT License (MIT), http://opensource.org/licenses/MIT
 * Full license can be found in the LICENSE file
  }
{$ifndef cglmc_ray_h}
{$define cglmc_ray_h}
{ C++ extern C conditionnal removed }
{$include "../cglm.h"}

function glmc_ray_triangle(origin:Tvec3; direction:Tvec3; v0:Tvec3; v1:Tvec3; v2:Tvec3; 
           d:Psingle):Tbool;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ cglmc_ray_h  }

implementation


end.
