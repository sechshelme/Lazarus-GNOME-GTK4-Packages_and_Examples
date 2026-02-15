
unit bezier;
interface

{
  Automatically converted by H2Pas 1.0.0 from bezier.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    bezier.h
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
{$ifndef cglmc_bezier_h}
{$define cglmc_bezier_h}
{ C++ extern C conditionnal removed }
{$include "../cglm.h"}

function glmc_bezier(s:single; p0:single; c0:single; c1:single; p1:single):single;cdecl;external;
function glmc_hermite(s:single; p0:single; t0:single; t1:single; p1:single):single;cdecl;external;
function glmc_decasteljau(prm:single; p0:single; c0:single; c1:single; p1:single):single;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ cglmc_bezier_h  }

implementation


end.
