
unit double_extras;
interface

{
  Automatically converted by H2Pas 1.0.0 from double_extras.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    double_extras.h
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
Pdouble  = ^double;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
    Copyright (C) 2012 Fredrik Johansson

    This file is part of FLINT.

    FLINT is free software: you can redistribute it and/or modify it under
    the terms of the GNU Lesser General Public License (LGPL) as published
    by the Free Software Foundation; either version 2.1 of the License, or
    (at your option) any later version.  See <https://www.gnu.org/licenses/>.
 }

const
  D_BITS = 53;  
  D_EPS = 2.2204460492503130808e-16;  
  D_INF = HUGE_VAL;  
  D_NAN = HUGE_VAL-HUGE_VAL;  

function d_randtest(state:Tflint_rand_t):Tdouble;cdecl;external;
function d_randtest_signed(state:Tflint_rand_t; minexp:Tslong; maxexp:Tslong):Tdouble;cdecl;external;
function d_randtest_special(state:Tflint_rand_t; minexp:Tslong; maxexp:Tslong):Tdouble;cdecl;external;
(* Const before type ignored *)
function d_polyval(poly:Pdouble; len:longint; x:Tdouble):Tdouble;cdecl;external;
function d_lambertw(x:Tdouble):Tdouble;cdecl;external;
function d_is_nan(x:Tdouble):longint;cdecl;external;
function d_log2(x:Tdouble):Tdouble;cdecl;external;
{$endif}

implementation


end.
