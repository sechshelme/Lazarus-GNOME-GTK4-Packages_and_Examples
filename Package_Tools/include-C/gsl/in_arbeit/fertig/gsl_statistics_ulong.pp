
unit gsl_statistics_ulong;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_statistics_ulong.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_statistics_ulong.h
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
Pdword  = ^dword;
Plongint  = ^longint;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ statistics/gsl_statistics_ulong.h
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
{$ifndef __GSL_STATISTICS_ULONG_H__}
{$define __GSL_STATISTICS_ULONG_H__}
{$include <stddef.h>}
{$include <stdlib.h>}
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function gsl_stats_ulong_mean(data:Pdword; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ulong_variance(data:Pdword; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ulong_sd(data:Pdword; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ulong_variance_with_fixed_mean(data:Pdword; stride:Tsize_t; n:Tsize_t; mean:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ulong_sd_with_fixed_mean(data:Pdword; stride:Tsize_t; n:Tsize_t; mean:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ulong_tss(data:Pdword; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ulong_tss_m(data:Pdword; stride:Tsize_t; n:Tsize_t; mean:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ulong_absdev(data:Pdword; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ulong_skew(data:Pdword; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ulong_kurtosis(data:Pdword; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ulong_lag1_autocorrelation(data:Pdword; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ulong_covariance(data1:Pdword; stride1:Tsize_t; data2:Pdword; stride2:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ulong_correlation(data1:Pdword; stride1:Tsize_t; data2:Pdword; stride2:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ulong_spearman(data1:Pdword; stride1:Tsize_t; data2:Pdword; stride2:Tsize_t; n:Tsize_t; 
           work:Pdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ulong_variance_m(data:Pdword; stride:Tsize_t; n:Tsize_t; mean:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ulong_sd_m(data:Pdword; stride:Tsize_t; n:Tsize_t; mean:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ulong_absdev_m(data:Pdword; stride:Tsize_t; n:Tsize_t; mean:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ulong_skew_m_sd(data:Pdword; stride:Tsize_t; n:Tsize_t; mean:Tdouble; sd:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ulong_kurtosis_m_sd(data:Pdword; stride:Tsize_t; n:Tsize_t; mean:Tdouble; sd:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ulong_lag1_autocorrelation_m(data:Pdword; stride:Tsize_t; n:Tsize_t; mean:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ulong_covariance_m(data1:Pdword; stride1:Tsize_t; data2:Pdword; stride2:Tsize_t; n:Tsize_t; 
           mean1:Tdouble; mean2:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ulong_pvariance(data1:Pdword; stride1:Tsize_t; n1:Tsize_t; data2:Pdword; stride2:Tsize_t; 
           n2:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ulong_ttest(data1:Pdword; stride1:Tsize_t; n1:Tsize_t; data2:Pdword; stride2:Tsize_t; 
           n2:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ulong_max(data:Pdword; stride:Tsize_t; n:Tsize_t):dword;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ulong_min(data:Pdword; stride:Tsize_t; n:Tsize_t):dword;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure gsl_stats_ulong_minmax(min:Pdword; max:Pdword; data:Pdword; stride:Tsize_t; n:Tsize_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ulong_max_index(data:Pdword; stride:Tsize_t; n:Tsize_t):Tsize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ulong_min_index(data:Pdword; stride:Tsize_t; n:Tsize_t):Tsize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure gsl_stats_ulong_minmax_index(min_index:Psize_t; max_index:Psize_t; data:Pdword; stride:Tsize_t; n:Tsize_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ulong_select(data:Pdword; stride:Tsize_t; n:Tsize_t; k:Tsize_t):dword;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ulong_median_from_sorted_data(sorted_data:Pdword; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ulong_median(sorted_data:Pdword; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ulong_quantile_from_sorted_data(sorted_data:Pdword; stride:Tsize_t; n:Tsize_t; f:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ulong_trmean_from_sorted_data(trim:Tdouble; sorted_data:Pdword; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ulong_gastwirth_from_sorted_data(sorted_data:Pdword; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ulong_mad0(data:Pdword; stride:Tsize_t; n:Tsize_t; work:Pdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ulong_mad(data:Pdword; stride:Tsize_t; n:Tsize_t; work:Pdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ulong_Sn0_from_sorted_data(sorted_data:Pdword; stride:Tsize_t; n:Tsize_t; work:Pdword):dword;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ulong_Sn_from_sorted_data(sorted_data:Pdword; stride:Tsize_t; n:Tsize_t; work:Pdword):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ulong_Qn0_from_sorted_data(sorted_data:Pdword; stride:Tsize_t; n:Tsize_t; work:Pdword; work_int:Plongint):dword;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_ulong_Qn_from_sorted_data(sorted_data:Pdword; stride:Tsize_t; n:Tsize_t; work:Pdword; work_int:Plongint):Tdouble;cdecl;external;
{$endif}
{ __GSL_STATISTICS_ULONG_H__  }

implementation


end.
