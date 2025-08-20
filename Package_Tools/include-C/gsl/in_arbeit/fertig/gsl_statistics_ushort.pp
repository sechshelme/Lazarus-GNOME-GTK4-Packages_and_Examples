
unit gsl_statistics_ushort;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_statistics_ushort.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_statistics_ushort.h
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
Pword  = ^word;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ statistics/gsl_statistics_ushort.h
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
{$ifndef __GSL_STATISTICS_USHORT_H__}
{$define __GSL_STATISTICS_USHORT_H__}
{$include <stddef.h>}
{$include <stdlib.h>}
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function gsl_stats_ushort_mean(data:Pword; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ushort_variance(data:Pword; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ushort_sd(data:Pword; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ushort_variance_with_fixed_mean(data:Pword; stride:Tsize_t; n:Tsize_t; mean:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ushort_sd_with_fixed_mean(data:Pword; stride:Tsize_t; n:Tsize_t; mean:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ushort_tss(data:Pword; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ushort_tss_m(data:Pword; stride:Tsize_t; n:Tsize_t; mean:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ushort_absdev(data:Pword; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ushort_skew(data:Pword; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ushort_kurtosis(data:Pword; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ushort_lag1_autocorrelation(data:Pword; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ushort_covariance(data1:Pword; stride1:Tsize_t; data2:Pword; stride2:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ushort_correlation(data1:Pword; stride1:Tsize_t; data2:Pword; stride2:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ushort_spearman(data1:Pword; stride1:Tsize_t; data2:Pword; stride2:Tsize_t; n:Tsize_t; 
           work:Pdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ushort_variance_m(data:Pword; stride:Tsize_t; n:Tsize_t; mean:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ushort_sd_m(data:Pword; stride:Tsize_t; n:Tsize_t; mean:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ushort_absdev_m(data:Pword; stride:Tsize_t; n:Tsize_t; mean:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ushort_skew_m_sd(data:Pword; stride:Tsize_t; n:Tsize_t; mean:Tdouble; sd:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ushort_kurtosis_m_sd(data:Pword; stride:Tsize_t; n:Tsize_t; mean:Tdouble; sd:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ushort_lag1_autocorrelation_m(data:Pword; stride:Tsize_t; n:Tsize_t; mean:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ushort_covariance_m(data1:Pword; stride1:Tsize_t; data2:Pword; stride2:Tsize_t; n:Tsize_t; 
           mean1:Tdouble; mean2:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ushort_pvariance(data1:Pword; stride1:Tsize_t; n1:Tsize_t; data2:Pword; stride2:Tsize_t; 
           n2:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ushort_ttest(data1:Pword; stride1:Tsize_t; n1:Tsize_t; data2:Pword; stride2:Tsize_t; 
           n2:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ushort_max(data:Pword; stride:Tsize_t; n:Tsize_t):word;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ushort_min(data:Pword; stride:Tsize_t; n:Tsize_t):word;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure gsl_stats_ushort_minmax(min:Pword; max:Pword; data:Pword; stride:Tsize_t; n:Tsize_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ushort_max_index(data:Pword; stride:Tsize_t; n:Tsize_t):Tsize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ushort_min_index(data:Pword; stride:Tsize_t; n:Tsize_t):Tsize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure gsl_stats_ushort_minmax_index(min_index:Psize_t; max_index:Psize_t; data:Pword; stride:Tsize_t; n:Tsize_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ushort_select(data:Pword; stride:Tsize_t; n:Tsize_t; k:Tsize_t):word;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ushort_median_from_sorted_data(sorted_data:Pword; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ushort_median(sorted_data:Pword; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ushort_quantile_from_sorted_data(sorted_data:Pword; stride:Tsize_t; n:Tsize_t; f:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ushort_trmean_from_sorted_data(trim:Tdouble; sorted_data:Pword; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ushort_gastwirth_from_sorted_data(sorted_data:Pword; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ushort_mad0(data:Pword; stride:Tsize_t; n:Tsize_t; work:Pdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ushort_mad(data:Pword; stride:Tsize_t; n:Tsize_t; work:Pdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ushort_Sn0_from_sorted_data(sorted_data:Pword; stride:Tsize_t; n:Tsize_t; work:Pword):word;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ushort_Sn_from_sorted_data(sorted_data:Pword; stride:Tsize_t; n:Tsize_t; work:Pword):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ushort_Qn0_from_sorted_data(sorted_data:Pword; stride:Tsize_t; n:Tsize_t; work:Pword; work_int:Plongint):word;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ushort_Qn_from_sorted_data(sorted_data:Pword; stride:Tsize_t; n:Tsize_t; work:Pword; work_int:Plongint):Tdouble;cdecl;external;
{$endif}
{ __GSL_STATISTICS_USHORT_H__  }

implementation


end.
