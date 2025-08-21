
unit gsl_chebyshev;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_chebyshev.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_chebyshev.h
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
Pgsl_cheb_series  = ^gsl_cheb_series;
Pgsl_cheb_series_struct  = ^gsl_cheb_series_struct;
Pgsl_function  = ^gsl_function;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ cheb/gsl_chebyshev.h
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
{$ifndef __GSL_CHEBYSHEV_H__}
{$define __GSL_CHEBYSHEV_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_math.h>}
{$include <gsl/gsl_mode.h>}
{ data for a Chebyshev series over a given interval  }
{ coefficients                 }
{ order of expansion           }
{ lower interval point         }
{ upper interval point         }
{ The following exists (mostly) for the benefit
   * of the implementation. It is an effective single
   * precision order, for use in single precision
   * evaluation. Users can use it if they like, but
   * only they know how to calculate it, since it is
   * specific to the approximated function. By default,
   * order_sp = order.
   * It is used explicitly only by the gsl_cheb_eval_mode
   * functions, which are not meant for casual use.
    }
{ Additional elements not used by specfunc  }
{ function evaluated at chebyschev points   }
type
  Pgsl_cheb_series_struct = ^Tgsl_cheb_series_struct;
  Tgsl_cheb_series_struct = record
      c : Pdouble;
      order : Tsize_t;
      a : Tdouble;
      b : Tdouble;
      order_sp : Tsize_t;
      f : Pdouble;
    end;

  Tgsl_cheb_series_struct = Tgsl_cheb_series;
{ Calculate a Chebyshev series of specified order over
 * a specified interval, for a given function.
 * Return 0 on failure.
  }
(* Const before type ignored *)

function gsl_cheb_alloc(order:Tsize_t):Pgsl_cheb_series;cdecl;external;
{ Free a Chebyshev series previously calculated with gsl_cheb_alloc().
  }
procedure gsl_cheb_free(cs:Pgsl_cheb_series);cdecl;external;
{ Calculate a Chebyshev series using the storage provided.
 * Uses the interval (a,b) and the order with which it
 * was initially created.
 *
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_cheb_init(cs:Pgsl_cheb_series; func:Pgsl_function; a:Tdouble; b:Tdouble):longint;cdecl;external;
{ Return the order, size of coefficient array and coefficient array ptr  }
(* Const before type ignored *)
function gsl_cheb_order(cs:Pgsl_cheb_series):Tsize_t;cdecl;external;
(* Const before type ignored *)
function gsl_cheb_size(cs:Pgsl_cheb_series):Tsize_t;cdecl;external;
(* Const before type ignored *)
function gsl_cheb_coeffs(cs:Pgsl_cheb_series):Pdouble;cdecl;external;
{ Evaluate a Chebyshev series at a given point.
 * No errors can occur for a struct obtained from gsl_cheb_new().
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_cheb_eval(cs:Pgsl_cheb_series; x:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_cheb_eval_err(cs:Pgsl_cheb_series; x:Tdouble; result:Pdouble; abserr:Pdouble):longint;cdecl;external;
{ Evaluate a Chebyshev series at a given point, to (at most) the given order.
 * No errors can occur for a struct obtained from gsl_cheb_new().
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_cheb_eval_n(cs:Pgsl_cheb_series; order:Tsize_t; x:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_cheb_eval_n_err(cs:Pgsl_cheb_series; order:Tsize_t; x:Tdouble; result:Pdouble; abserr:Pdouble):longint;cdecl;external;
{ Evaluate a Chebyshev series at a given point, using the default
 * order for double precision mode(s) and the single precision
 * order for other modes.
 * No errors can occur for a struct obtained from gsl_cheb_new().
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_cheb_eval_mode(cs:Pgsl_cheb_series; x:Tdouble; mode:Tgsl_mode_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_cheb_eval_mode_e(cs:Pgsl_cheb_series; x:Tdouble; mode:Tgsl_mode_t; result:Pdouble; abserr:Pdouble):longint;cdecl;external;
{ Compute the derivative of a Chebyshev series.
  }
(* Const before type ignored *)
function gsl_cheb_calc_deriv(deriv:Pgsl_cheb_series; cs:Pgsl_cheb_series):longint;cdecl;external;
{ Compute the integral of a Chebyshev series. The
 * integral is fixed by the condition that it equals zero at
 * the left end-point, ie it is precisely
 *       Integrate[cs(t; a,b), t, a, x]
  }
(* Const before type ignored *)
function gsl_cheb_calc_integ(integ:Pgsl_cheb_series; cs:Pgsl_cheb_series):longint;cdecl;external;
{$endif}
{ __GSL_CHEBYSHEV_H__  }

implementation


end.
