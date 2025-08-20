
unit gsl_statistics_int;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_statistics_int.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_statistics_int.h
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
Plongint  = ^longint;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ statistics/gsl_statistics_int.h
 * 
 * Copyright (C) 1996, 1997, 1998, 1999, 2000, 2007 Jim Davies, Brian Gough
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
{$ifndef __GSL_STATISTICS_INT_H__}
{$define __GSL_STATISTICS_INT_H__}
{$include <stddef.h>}
{$include <stdlib.h>}
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function gsl_stats_int_mean(data:Plongint; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_int_variance(data:Plongint; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_int_sd(data:Plongint; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_int_variance_with_fixed_mean(data:Plongint; stride:Tsize_t; n:Tsize_t; mean:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_int_sd_with_fixed_mean(data:Plongint; stride:Tsize_t; n:Tsize_t; mean:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_int_tss(data:Plongint; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_int_tss_m(data:Plongint; stride:Tsize_t; n:Tsize_t; mean:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_int_absdev(data:Plongint; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_int_skew(data:Plongint; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_int_kurtosis(data:Plongint; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_int_lag1_autocorrelation(data:Plongint; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_int_covariance(data1:Plongint; stride1:Tsize_t; data2:Plongint; stride2:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_int_correlation(data1:Plongint; stride1:Tsize_t; data2:Plongint; stride2:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_int_spearman(data1:Plongint; stride1:Tsize_t; data2:Plongint; stride2:Tsize_t; n:Tsize_t; 
           work:Pdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_int_variance_m(data:Plongint; stride:Tsize_t; n:Tsize_t; mean:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_int_sd_m(data:Plongint; stride:Tsize_t; n:Tsize_t; mean:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_int_absdev_m(data:Plongint; stride:Tsize_t; n:Tsize_t; mean:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_int_skew_m_sd(data:Plongint; stride:Tsize_t; n:Tsize_t; mean:Tdouble; sd:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_int_kurtosis_m_sd(data:Plongint; stride:Tsize_t; n:Tsize_t; mean:Tdouble; sd:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_int_lag1_autocorrelation_m(data:Plongint; stride:Tsize_t; n:Tsize_t; mean:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_int_covariance_m(data1:Plongint; stride1:Tsize_t; data2:Plongint; stride2:Tsize_t; n:Tsize_t; 
           mean1:Tdouble; mean2:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_int_pvariance(data1:Plongint; stride1:Tsize_t; n1:Tsize_t; data2:Plongint; stride2:Tsize_t; 
           n2:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_int_ttest(data1:Plongint; stride1:Tsize_t; n1:Tsize_t; data2:Plongint; stride2:Tsize_t; 
           n2:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_int_max(data:Plongint; stride:Tsize_t; n:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_int_min(data:Plongint; stride:Tsize_t; n:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure gsl_stats_int_minmax(min:Plongint; max:Plongint; data:Plongint; stride:Tsize_t; n:Tsize_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_int_max_index(data:Plongint; stride:Tsize_t; n:Tsize_t):Tsize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_int_min_index(data:Plongint; stride:Tsize_t; n:Tsize_t):Tsize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure gsl_stats_int_minmax_index(min_index:Psize_t; max_index:Psize_t; data:Plongint; stride:Tsize_t; n:Tsize_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_int_select(data:Plongint; stride:Tsize_t; n:Tsize_t; k:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_int_median_from_sorted_data(sorted_data:Plongint; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_int_median(sorted_data:Plongint; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_int_quantile_from_sorted_data(sorted_data:Plongint; stride:Tsize_t; n:Tsize_t; f:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_int_trmean_from_sorted_data(trim:Tdouble; sorted_data:Plongint; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_int_gastwirth_from_sorted_data(sorted_data:Plongint; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_int_mad0(data:Plongint; stride:Tsize_t; n:Tsize_t; work:Pdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_int_mad(data:Plongint; stride:Tsize_t; n:Tsize_t; work:Pdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_int_Sn0_from_sorted_data(sorted_data:Plongint; stride:Tsize_t; n:Tsize_t; work:Plongint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_int_Sn_from_sorted_data(sorted_data:Plongint; stride:Tsize_t; n:Tsize_t; work:Plongint):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_int_Qn0_from_sorted_data(sorted_data:Plongint; stride:Tsize_t; n:Tsize_t; work:Plongint; work_int:Plongint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_int_Qn_from_sorted_data(sorted_data:Plongint; stride:Tsize_t; n:Tsize_t; work:Plongint; work_int:Plongint):Tdouble;cdecl;external;
{$endif}
{ __GSL_STATISTICS_INT_H__  }

implementation


end.
