
unit gsl_sf_trig;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_sf_trig.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_sf_trig.h
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
Pgsl_sf_result  = ^gsl_sf_result;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ specfunc/gsl_sf_trig.h
 * 
 * Copyright (C) 1996, 1997, 1998, 1999, 2000 Gerard Jungman
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or (at
 * your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
  }
{ Author:  G. Jungman  }
{$ifndef __GSL_SF_TRIG_H__}
{$define __GSL_SF_TRIG_H__}
{$include <gsl/gsl_sf_result.h>}
{ Sin(x) with GSL semantics. This is actually important
 * because we want to control the error estimate, and trying
 * to guess the error for the standard library implementation
 * every time it is used would be a little goofy.
  }

function gsl_sf_sin_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_sin(x:Tdouble):Tdouble;cdecl;external;
{ Cos(x) with GSL semantics.
  }
function gsl_sf_cos_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_cos(x:Tdouble):Tdouble;cdecl;external;
{ Hypot(x,y) with GSL semantics.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_hypot_e(x:Tdouble; y:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_hypot(x:Tdouble; y:Tdouble):Tdouble;cdecl;external;
{ Sin(z) for complex z
 *
 * exceptions: GSL_EOVRFLW
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_complex_sin_e(zr:Tdouble; zi:Tdouble; szr:Pgsl_sf_result; szi:Pgsl_sf_result):longint;cdecl;external;
{ Cos(z) for complex z
 *
 * exceptions: GSL_EOVRFLW
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_complex_cos_e(zr:Tdouble; zi:Tdouble; czr:Pgsl_sf_result; czi:Pgsl_sf_result):longint;cdecl;external;
{ Log(Sin(z)) for complex z
 *
 * exceptions: GSL_EDOM, GSL_ELOSS
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_complex_logsin_e(zr:Tdouble; zi:Tdouble; lszr:Pgsl_sf_result; lszi:Pgsl_sf_result):longint;cdecl;external;
{ Sinc(x) = sin(pi x) / (pi x)
 *
 * exceptions: none
  }
function gsl_sf_sinc_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_sinc(x:Tdouble):Tdouble;cdecl;external;
{ Log(Sinh(x)), x > 0
 *
 * exceptions: GSL_EDOM
  }
(* Const before type ignored *)
function gsl_sf_lnsinh_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_lnsinh(x:Tdouble):Tdouble;cdecl;external;
{ Log(Cosh(x))
 *
 * exceptions: none
  }
(* Const before type ignored *)
function gsl_sf_lncosh_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_lncosh(x:Tdouble):Tdouble;cdecl;external;
{ Convert polar to rectlinear coordinates.
 *
 * exceptions: GSL_ELOSS
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_polar_to_rect(r:Tdouble; theta:Tdouble; x:Pgsl_sf_result; y:Pgsl_sf_result):longint;cdecl;external;
{ Convert rectilinear to polar coordinates.
 * return argument in range [-pi, pi]
 *
 * exceptions: GSL_EDOM
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_rect_to_polar(x:Tdouble; y:Tdouble; r:Pgsl_sf_result; theta:Pgsl_sf_result):longint;cdecl;external;
{ Sin(x) for quantity with an associated error.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_sin_err_e(x:Tdouble; dx:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
{ Cos(x) for quantity with an associated error.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sf_cos_err_e(x:Tdouble; dx:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
{ Force an angle to lie in the range (-pi,pi].
 *
 * exceptions: GSL_ELOSS
  }
function gsl_sf_angle_restrict_symm_e(theta:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_angle_restrict_symm(theta:Tdouble):Tdouble;cdecl;external;
{ Force an angle to lie in the range [0, 2pi)
 *
 * exceptions: GSL_ELOSS
  }
function gsl_sf_angle_restrict_pos_e(theta:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_angle_restrict_pos(theta:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_sf_angle_restrict_symm_err_e(theta:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
(* Const before type ignored *)
function gsl_sf_angle_restrict_pos_err_e(theta:Tdouble; result:Pgsl_sf_result):longint;cdecl;external;
{$endif}
{ __GSL_SF_TRIG_H__  }

implementation


end.
