
unit gsl_filter;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_filter.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_filter.h
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
Pgsl_filter_end_t  = ^gsl_filter_end_t;
Pgsl_filter_gaussian_workspace  = ^gsl_filter_gaussian_workspace;
Pgsl_filter_impulse_workspace  = ^gsl_filter_impulse_workspace;
Pgsl_filter_median_workspace  = ^gsl_filter_median_workspace;
Pgsl_filter_rmedian_workspace  = ^gsl_filter_rmedian_workspace;
Pgsl_filter_scale_t  = ^gsl_filter_scale_t;
Pgsl_movstat_accum  = ^gsl_movstat_accum;
Pgsl_movstat_workspace  = ^gsl_movstat_workspace;
Pgsl_vector  = ^gsl_vector;
Pgsl_vector_int  = ^gsl_vector_int;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ filter/gsl_filter.h
 * 
 * Copyright (C) 2018 Patrick Alken
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
{$ifndef __GSL_FILTER_H__}
{$define __GSL_FILTER_H__}
{$include <gsl/gsl_math.h>}
{$include <gsl/gsl_vector.h>}
{$include <gsl/gsl_movstat.h>}
{ end point handling methods  }
type
  Pgsl_filter_end_t = ^Tgsl_filter_end_t;
  Tgsl_filter_end_t =  Longint;
  Const
    GSL_FILTER_END_PADZERO = GSL_MOVSTAT_END_PADZERO;
    GSL_FILTER_END_PADVALUE = GSL_MOVSTAT_END_PADVALUE;
    GSL_FILTER_END_TRUNCATE = GSL_MOVSTAT_END_TRUNCATE;
;
{ robust scale estimates  }
{ median absolute deviation  }
{ interquartile range  }
{ S_n scale statistic  }
{ Q_n scale statistic  }
type
  Pgsl_filter_scale_t = ^Tgsl_filter_scale_t;
  Tgsl_filter_scale_t =  Longint;
  Const
    GSL_FILTER_SCALE_MAD = 0;
    GSL_FILTER_SCALE_IQR = 1;
    GSL_FILTER_SCALE_SN = 2;
    GSL_FILTER_SCALE_QN = 3;
;
{ workspace for Gaussian filter  }
{ window size  }
{ Gaussian kernel, size K  }
type
  Pgsl_filter_gaussian_workspace = ^Tgsl_filter_gaussian_workspace;
  Tgsl_filter_gaussian_workspace = record
      K : Tsize_t;
      kernel : Pdouble;
      movstat_workspace_p : Pgsl_movstat_workspace;
    end;
(* Const before type ignored *)

function gsl_filter_gaussian_alloc(K:Tsize_t):Pgsl_filter_gaussian_workspace;cdecl;external;
procedure gsl_filter_gaussian_free(w:Pgsl_filter_gaussian_workspace);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_filter_gaussian(endtype:Tgsl_filter_end_t; alpha:Tdouble; order:Tsize_t; x:Pgsl_vector; y:Pgsl_vector; 
           w:Pgsl_filter_gaussian_workspace):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_filter_gaussian_kernel(alpha:Tdouble; order:Tsize_t; normalize:longint; kernel:Pgsl_vector):longint;cdecl;external;
{ workspace for standard median filter  }
type
  Pgsl_filter_median_workspace = ^Tgsl_filter_median_workspace;
  Tgsl_filter_median_workspace = record
      movstat_workspace_p : Pgsl_movstat_workspace;
    end;
(* Const before type ignored *)

function gsl_filter_median_alloc(K:Tsize_t):Pgsl_filter_median_workspace;cdecl;external;
procedure gsl_filter_median_free(w:Pgsl_filter_median_workspace);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_filter_median(endtype:Tgsl_filter_end_t; x:Pgsl_vector; y:Pgsl_vector; w:Pgsl_filter_median_workspace):longint;cdecl;external;
{ workspace for recursive median filter  }
{ window half-length (K / 2)  }
{ window size  }
{ workspace for min/max accumulator  }
{ array holding first window  }
(* Const before type ignored *)
{ minimum/maximum accumulator  }
type
  Pgsl_filter_rmedian_workspace = ^Tgsl_filter_rmedian_workspace;
  Tgsl_filter_rmedian_workspace = record
      H : Tsize_t;
      K : Tsize_t;
      state : pointer;
      window : Pdouble;
      minmaxacc : Pgsl_movstat_accum;
      movstat_workspace_p : Pgsl_movstat_workspace;
    end;
(* Const before type ignored *)

function gsl_filter_rmedian_alloc(K:Tsize_t):Pgsl_filter_rmedian_workspace;cdecl;external;
procedure gsl_filter_rmedian_free(w:Pgsl_filter_rmedian_workspace);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_filter_rmedian(para1:Tgsl_filter_end_t; x:Pgsl_vector; y:Pgsl_vector; w:Pgsl_filter_rmedian_workspace):longint;cdecl;external;
type
  Pgsl_filter_impulse_workspace = ^Tgsl_filter_impulse_workspace;
  Tgsl_filter_impulse_workspace = record
      movstat_workspace_p : Pgsl_movstat_workspace;
    end;
(* Const before type ignored *)

function gsl_filter_impulse_alloc(K:Tsize_t):Pgsl_filter_impulse_workspace;cdecl;external;
procedure gsl_filter_impulse_free(w:Pgsl_filter_impulse_workspace);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_filter_impulse(endtype:Tgsl_filter_end_t; scale_type:Tgsl_filter_scale_t; t:Tdouble; x:Pgsl_vector; y:Pgsl_vector; 
           xmedian:Pgsl_vector; xsigma:Pgsl_vector; noutlier:Psize_t; ioutlier:Pgsl_vector_int; w:Pgsl_filter_impulse_workspace):longint;cdecl;external;
{$endif}
{ __GSL_FILTER_H__  }

implementation


end.
