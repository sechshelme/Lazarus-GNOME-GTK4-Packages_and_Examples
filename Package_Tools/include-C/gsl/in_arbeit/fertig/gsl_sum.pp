
unit gsl_sum;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_sum.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_sum.h
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
Pgsl_sum_levin_u_workspace  = ^gsl_sum_levin_u_workspace;
Pgsl_sum_levin_utrunc_workspace  = ^gsl_sum_levin_utrunc_workspace;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ sum/gsl_sum.h
 * 
 * Copyright (C) 1996, 1997, 1998, 1999, 2000, 2007 Gerard Jungman, Brian Gough
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
{$ifndef __GSL_SUM_H__}
{$define __GSL_SUM_H__}
{$include <stdlib.h>}
{  Workspace for Levin U Transform with error estimation,
 *   
 *   size        = number of terms the workspace can handle
 *   sum_plain   = simple sum of series
 *   q_num       = backward diagonal of numerator; length = size
 *   q_den       = backward diagonal of denominator; length = size
 *   dq_num      = table of numerator derivatives; length = size**2
 *   dq_den      = table of denominator derivatives; length = size**2
 *   dsum        = derivative of sum wrt term i; length = size
  }
{ position in array  }
{ number of calls  }
type
  Pgsl_sum_levin_u_workspace = ^Tgsl_sum_levin_u_workspace;
  Tgsl_sum_levin_u_workspace = record
      size : Tsize_t;
      i : Tsize_t;
      terms_used : Tsize_t;
      sum_plain : Tdouble;
      q_num : Pdouble;
      q_den : Pdouble;
      dq_num : Pdouble;
      dq_den : Pdouble;
      dsum : Pdouble;
    end;

function gsl_sum_levin_u_alloc(n:Tsize_t):Pgsl_sum_levin_u_workspace;cdecl;external;
procedure gsl_sum_levin_u_free(w:Pgsl_sum_levin_u_workspace);cdecl;external;
{ Basic Levin-u acceleration method.
 *
 *   array       = array of series elements
 *   n           = size of array
 *   sum_accel   = result of summation acceleration
 *   err         = estimated error   
 *
 * See [Fessler et al., ACM TOMS 9, 346 (1983) and TOMS-602]
  }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sum_levin_u_accel(array:Pdouble; n:Tsize_t; w:Pgsl_sum_levin_u_workspace; sum_accel:Pdouble; abserr:Pdouble):longint;cdecl;external;
{ Basic Levin-u acceleration method with constraints on the terms
 * used,
 *
 *   array       = array of series elements
 *   n           = size of array
 *   min_terms   = minimum number of terms to sum
 *   max_terms   = maximum number of terms to sum
 *   sum_accel   = result of summation acceleration
 *   err         = estimated error   
 *
 * See [Fessler et al., ACM TOMS 9, 346 (1983) and TOMS-602] 
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sum_levin_u_minmax(array:Pdouble; n:Tsize_t; min_terms:Tsize_t; max_terms:Tsize_t; w:Pgsl_sum_levin_u_workspace; 
           sum_accel:Pdouble; abserr:Pdouble):longint;cdecl;external;
{ Basic Levin-u step w/o reference to the array of terms.
 * We only need to specify the value of the current term
 * to execute the step. See TOMS-745.
 *
 * sum = t0 + ... + t_n-1 + term;  term = t_n
 *
 *   term   = value of the series term to be added
 *   n      = position of term in series (starting from 0)
 *   sum_accel = result of summation acceleration
 *   sum_plain = simple sum of series
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sum_levin_u_step(term:Tdouble; n:Tsize_t; nmax:Tsize_t; w:Pgsl_sum_levin_u_workspace; sum_accel:Pdouble):longint;cdecl;external;
{ The following functions perform the same calculation without
   estimating the errors. They require O(N) storage instead of O(N^2).
   This may be useful for summing many similar series where the size
   of the error has already been estimated reliably and is not
   expected to change.   }
{ position in array  }
{ number of calls  }
type
  Pgsl_sum_levin_utrunc_workspace = ^Tgsl_sum_levin_utrunc_workspace;
  Tgsl_sum_levin_utrunc_workspace = record
      size : Tsize_t;
      i : Tsize_t;
      terms_used : Tsize_t;
      sum_plain : Tdouble;
      q_num : Pdouble;
      q_den : Pdouble;
      dsum : Pdouble;
    end;

function gsl_sum_levin_utrunc_alloc(n:Tsize_t):Pgsl_sum_levin_utrunc_workspace;cdecl;external;
procedure gsl_sum_levin_utrunc_free(w:Pgsl_sum_levin_utrunc_workspace);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sum_levin_utrunc_accel(array:Pdouble; n:Tsize_t; w:Pgsl_sum_levin_utrunc_workspace; sum_accel:Pdouble; abserr_trunc:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sum_levin_utrunc_minmax(array:Pdouble; n:Tsize_t; min_terms:Tsize_t; max_terms:Tsize_t; w:Pgsl_sum_levin_utrunc_workspace; 
           sum_accel:Pdouble; abserr_trunc:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_sum_levin_utrunc_step(term:Tdouble; n:Tsize_t; w:Pgsl_sum_levin_utrunc_workspace; sum_accel:Pdouble):longint;cdecl;external;
{$endif}
{ __GSL_SUM_H__  }

implementation


end.
