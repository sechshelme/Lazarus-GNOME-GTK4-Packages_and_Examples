
unit gsl_poly;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_poly.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_poly.h
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
Pgsl_complex  = ^gsl_complex;
Pgsl_poly_complex_workspace  = ^gsl_poly_complex_workspace;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ poly/gsl_poly.h
 * 
 * Copyright (C) 1996, 1997, 1998, 1999, 2000, 2004, 2007 Brian Gough
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
{$ifndef __GSL_POLY_H__}
{$define __GSL_POLY_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_inline.h>}
{$include <gsl/gsl_complex.h>}
{ Evaluate polynomial
 *
 * c[0] + c[1] x + c[2] x^2 + ... + c[len-1] x^(len-1)
 *
 * exceptions: none
  }
{ real polynomial, real x  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function gsl_poly_eval(c:Pdouble; len:longint; x:Tdouble):Tdouble;cdecl;external;
{ real polynomial, complex x  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_poly_complex_eval(c:Pdouble; len:longint; z:Tgsl_complex):Tgsl_complex;cdecl;external;
{ complex polynomial, complex x  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_complex_poly_complex_eval(c:Pgsl_complex; len:longint; z:Tgsl_complex):Tgsl_complex;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_poly_eval_derivs(c:Pdouble; lenc:Tsize_t; x:Tdouble; res:Pdouble; lenres:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_poly_dd_taylor(c:Pdouble; xp:Tdouble; dd:Pdouble; x:Pdouble; size:Tsize_t; 
           w:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_poly_dd_hermite_init(dd:Pdouble; z:Pdouble; xa:Pdouble; ya:Pdouble; dya:Pdouble; 
           size:Tsize_t):longint;cdecl;external;
{ Solve for real or complex roots of the standard quadratic equation,
 * returning the number of real roots.
 *
 * Roots are returned ordered.
  }
function gsl_poly_solve_quadratic(a:Tdouble; b:Tdouble; c:Tdouble; x0:Pdouble; x1:Pdouble):longint;cdecl;external;
function gsl_poly_complex_solve_quadratic(a:Tdouble; b:Tdouble; c:Tdouble; z0:Pgsl_complex; z1:Pgsl_complex):longint;cdecl;external;
{ Solve for real roots of the cubic equation
 * x^3 + a x^2 + b x + c = 0, returning the
 * number of real roots.
 *
 * Roots are returned ordered.
  }
function gsl_poly_solve_cubic(a:Tdouble; b:Tdouble; c:Tdouble; x0:Pdouble; x1:Pdouble; 
           x2:Pdouble):longint;cdecl;external;
function gsl_poly_complex_solve_cubic(a:Tdouble; b:Tdouble; c:Tdouble; z0:Pgsl_complex; z1:Pgsl_complex; 
           z2:Pgsl_complex):longint;cdecl;external;
{ Solve for the complex roots of a general real polynomial  }
type
  Pgsl_poly_complex_workspace = ^Tgsl_poly_complex_workspace;
  Tgsl_poly_complex_workspace = record
      nc : Tsize_t;
      matrix : Pdouble;
    end;

function gsl_poly_complex_workspace_alloc(n:Tsize_t):Pgsl_poly_complex_workspace;cdecl;external;
procedure gsl_poly_complex_workspace_free(w:Pgsl_poly_complex_workspace);cdecl;external;
(* Const before type ignored *)
function gsl_poly_complex_solve(a:Pdouble; n:Tsize_t; w:Pgsl_poly_complex_workspace; z:Tgsl_complex_packed_ptr):longint;cdecl;external;
{$endif}
{ __GSL_POLY_H__  }

implementation


end.
