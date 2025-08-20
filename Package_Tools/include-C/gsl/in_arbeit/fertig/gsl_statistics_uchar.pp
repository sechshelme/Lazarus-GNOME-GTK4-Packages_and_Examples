
unit gsl_statistics_uchar;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_statistics_uchar.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_statistics_uchar.h
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
Pbyte  = ^byte;
Pdouble  = ^double;
Plongint  = ^longint;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ statistics/gsl_statistics_uchar.h
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
{$ifndef __GSL_STATISTICS_UCHAR_H__}
{$define __GSL_STATISTICS_UCHAR_H__}
{$include <stddef.h>}
{$include <stdlib.h>}
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function gsl_stats_uchar_mean(data:Pbyte; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_uchar_variance(data:Pbyte; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_uchar_sd(data:Pbyte; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_uchar_variance_with_fixed_mean(data:Pbyte; stride:Tsize_t; n:Tsize_t; mean:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_uchar_sd_with_fixed_mean(data:Pbyte; stride:Tsize_t; n:Tsize_t; mean:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_uchar_tss(data:Pbyte; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_uchar_tss_m(data:Pbyte; stride:Tsize_t; n:Tsize_t; mean:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_uchar_absdev(data:Pbyte; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_uchar_skew(data:Pbyte; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_uchar_kurtosis(data:Pbyte; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_uchar_lag1_autocorrelation(data:Pbyte; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_uchar_covariance(data1:Pbyte; stride1:Tsize_t; data2:Pbyte; stride2:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_uchar_correlation(data1:Pbyte; stride1:Tsize_t; data2:Pbyte; stride2:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_uchar_spearman(data1:Pbyte; stride1:Tsize_t; data2:Pbyte; stride2:Tsize_t; n:Tsize_t; 
           work:Pdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_uchar_variance_m(data:Pbyte; stride:Tsize_t; n:Tsize_t; mean:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_uchar_sd_m(data:Pbyte; stride:Tsize_t; n:Tsize_t; mean:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_uchar_absdev_m(data:Pbyte; stride:Tsize_t; n:Tsize_t; mean:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_uchar_skew_m_sd(data:Pbyte; stride:Tsize_t; n:Tsize_t; mean:Tdouble; sd:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_uchar_kurtosis_m_sd(data:Pbyte; stride:Tsize_t; n:Tsize_t; mean:Tdouble; sd:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_uchar_lag1_autocorrelation_m(data:Pbyte; stride:Tsize_t; n:Tsize_t; mean:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_uchar_covariance_m(data1:Pbyte; stride1:Tsize_t; data2:Pbyte; stride2:Tsize_t; n:Tsize_t; 
           mean1:Tdouble; mean2:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_uchar_pvariance(data1:Pbyte; stride1:Tsize_t; n1:Tsize_t; data2:Pbyte; stride2:Tsize_t; 
           n2:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_uchar_ttest(data1:Pbyte; stride1:Tsize_t; n1:Tsize_t; data2:Pbyte; stride2:Tsize_t; 
           n2:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_uchar_max(data:Pbyte; stride:Tsize_t; n:Tsize_t):byte;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_uchar_min(data:Pbyte; stride:Tsize_t; n:Tsize_t):byte;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure gsl_stats_uchar_minmax(min:Pbyte; max:Pbyte; data:Pbyte; stride:Tsize_t; n:Tsize_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_uchar_max_index(data:Pbyte; stride:Tsize_t; n:Tsize_t):Tsize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_uchar_min_index(data:Pbyte; stride:Tsize_t; n:Tsize_t):Tsize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure gsl_stats_uchar_minmax_index(min_index:Psize_t; max_index:Psize_t; data:Pbyte; stride:Tsize_t; n:Tsize_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_uchar_select(data:Pbyte; stride:Tsize_t; n:Tsize_t; k:Tsize_t):byte;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_uchar_median_from_sorted_data(sorted_data:Pbyte; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_uchar_median(sorted_data:Pbyte; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_uchar_quantile_from_sorted_data(sorted_data:Pbyte; stride:Tsize_t; n:Tsize_t; f:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_uchar_trmean_from_sorted_data(trim:Tdouble; sorted_data:Pbyte; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_uchar_gastwirth_from_sorted_data(sorted_data:Pbyte; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_uchar_mad0(data:Pbyte; stride:Tsize_t; n:Tsize_t; work:Pdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_uchar_mad(data:Pbyte; stride:Tsize_t; n:Tsize_t; work:Pdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_uchar_Sn0_from_sorted_data(sorted_data:Pbyte; stride:Tsize_t; n:Tsize_t; work:Pbyte):byte;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_uchar_Sn_from_sorted_data(sorted_data:Pbyte; stride:Tsize_t; n:Tsize_t; work:Pbyte):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_uchar_Qn0_from_sorted_data(sorted_data:Pbyte; stride:Tsize_t; n:Tsize_t; work:Pbyte; work_int:Plongint):byte;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_uchar_Qn_from_sorted_data(sorted_data:Pbyte; stride:Tsize_t; n:Tsize_t; work:Pbyte; work_int:Plongint):Tdouble;cdecl;external;
{$endif}
{ __GSL_STATISTICS_UCHAR_H__  }

implementation


end.
