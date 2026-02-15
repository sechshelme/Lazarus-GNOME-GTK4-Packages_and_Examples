
unit curve;
interface

{
  Automatically converted by H2Pas 1.0.0 from curve.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    curve.h
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
{$ifndef cglmc_curve_h}
{$define cglmc_curve_h}
{ C++ extern C conditionnal removed }
{$include "../cglm.h"}

function glmc_smc(s:single; m:Tmat4; c:Tvec4):single;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ cglmc_curve_h  }

implementation


end.
