
unit gsl_bspline;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_bspline.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_bspline.h
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
Pgsl_bspline_workspace  = ^gsl_bspline_workspace;
Pgsl_matrix  = ^gsl_matrix;
Pgsl_vector  = ^gsl_vector;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ bspline/gsl_bspline.h
 *
 * Copyright (C) 2006 Patrick Alken
 * Copyright (C) 2008 Rhys Ulerich
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
{$ifndef __GSL_BSPLINE_H__}
{$define __GSL_BSPLINE_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_math.h>}
{$include <gsl/gsl_vector.h>}
{$include <gsl/gsl_matrix.h>}
{ spline order  }
{ k - 1 (polynomial order)  }
{ number of polynomial pieces on interval  }
{ number of breakpoints (l + 1)  }
{ number of bspline basis functions (l + k - 1)  }
{ knots vector  }
{ left delta  }
{ right delta  }
{ temporary spline results  }
{ bspline derivative parameters  }
{ work matrix  }
{ temporary derivative results  }
type
  Pgsl_bspline_workspace = ^Tgsl_bspline_workspace;
  Tgsl_bspline_workspace = record
      k : Tsize_t;
      km1 : Tsize_t;
      l : Tsize_t;
      nbreak : Tsize_t;
      n : Tsize_t;
      knots : Pgsl_vector;
      deltal : Pgsl_vector;
      deltar : Pgsl_vector;
      B : Pgsl_vector;
      A : Pgsl_matrix;
      dB : Pgsl_matrix;
    end;
(* Const before type ignored *)
(* Const before type ignored *)

function gsl_bspline_alloc(k:Tsize_t; nbreak:Tsize_t):Pgsl_bspline_workspace;cdecl;external;
procedure gsl_bspline_free(w:Pgsl_bspline_workspace);cdecl;external;
function gsl_bspline_ncoeffs(w:Pgsl_bspline_workspace):Tsize_t;cdecl;external;
function gsl_bspline_order(w:Pgsl_bspline_workspace):Tsize_t;cdecl;external;
function gsl_bspline_nbreak(w:Pgsl_bspline_workspace):Tsize_t;cdecl;external;
function gsl_bspline_breakpoint(i:Tsize_t; w:Pgsl_bspline_workspace):Tdouble;cdecl;external;
function gsl_bspline_greville_abscissa(i:Tsize_t; w:Pgsl_bspline_workspace):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_bspline_knots(breakpts:Pgsl_vector; w:Pgsl_bspline_workspace):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_bspline_knots_uniform(a:Tdouble; b:Tdouble; w:Pgsl_bspline_workspace):longint;cdecl;external;
(* Const before type ignored *)
function gsl_bspline_knots_greville(abscissae:Pgsl_vector; w:Pgsl_bspline_workspace; abserr:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
function gsl_bspline_eval(x:Tdouble; B:Pgsl_vector; w:Pgsl_bspline_workspace):longint;cdecl;external;
(* Const before type ignored *)
function gsl_bspline_eval_nonzero(x:Tdouble; Bk:Pgsl_vector; istart:Psize_t; iend:Psize_t; w:Pgsl_bspline_workspace):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_bspline_deriv_eval(x:Tdouble; nderiv:Tsize_t; dB:Pgsl_matrix; w:Pgsl_bspline_workspace):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_bspline_deriv_eval_nonzero(x:Tdouble; nderiv:Tsize_t; dB:Pgsl_matrix; istart:Psize_t; iend:Psize_t; 
           w:Pgsl_bspline_workspace):longint;cdecl;external;
{$endif}
{ __GSL_BSPLINE_H__  }

implementation


end.
