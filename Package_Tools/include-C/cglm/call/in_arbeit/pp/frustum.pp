
unit frustum;
interface

{
  Automatically converted by H2Pas 1.0.0 from frustum.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    frustum.h
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
{$ifndef cglmc_frustum_h}
{$define cglmc_frustum_h}
{ C++ extern C conditionnal removed }
{$include "../cglm.h"}

procedure glmc_frustum_planes(m:Tmat4; dest:array[0..5] of Tvec4);cdecl;external;
procedure glmc_frustum_corners(invMat:Tmat4; dest:array[0..7] of Tvec4);cdecl;external;
procedure glmc_frustum_center(corners:array[0..7] of Tvec4; dest:Tvec4);cdecl;external;
procedure glmc_frustum_box(corners:array[0..7] of Tvec4; m:Tmat4; box:array[0..1] of Tvec3);cdecl;external;
procedure glmc_frustum_corners_at(corners:array[0..7] of Tvec4; splitDist:single; farDist:single; planeCorners:array[0..3] of Tvec4);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ cglmc_frustum_h  }

implementation


end.
