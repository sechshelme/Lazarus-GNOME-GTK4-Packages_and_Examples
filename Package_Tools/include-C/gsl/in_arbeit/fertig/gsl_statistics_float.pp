
unit gsl_statistics_float;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_statistics_float.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_statistics_float.h
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
Psingle  = ^single;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ statistics/gsl_statistics_float.h
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
{$ifndef __GSL_STATISTICS_FLOAT_H__}
{$define __GSL_STATISTICS_FLOAT_H__}
{$include <stddef.h>}
{$include <stdlib.h>}
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function gsl_stats_float_mean(data:Psingle; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_float_variance(data:Psingle; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_float_sd(data:Psingle; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_float_variance_with_fixed_mean(data:Psingle; stride:Tsize_t; n:Tsize_t; mean:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_float_sd_with_fixed_mean(data:Psingle; stride:Tsize_t; n:Tsize_t; mean:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_float_tss(data:Psingle; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_float_tss_m(data:Psingle; stride:Tsize_t; n:Tsize_t; mean:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_float_absdev(data:Psingle; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_float_skew(data:Psingle; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_float_kurtosis(data:Psingle; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_float_lag1_autocorrelation(data:Psingle; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_float_covariance(data1:Psingle; stride1:Tsize_t; data2:Psingle; stride2:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_float_correlation(data1:Psingle; stride1:Tsize_t; data2:Psingle; stride2:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_float_spearman(data1:Psingle; stride1:Tsize_t; data2:Psingle; stride2:Tsize_t; n:Tsize_t; 
           work:Pdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_float_variance_m(data:Psingle; stride:Tsize_t; n:Tsize_t; mean:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_float_sd_m(data:Psingle; stride:Tsize_t; n:Tsize_t; mean:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_float_absdev_m(data:Psingle; stride:Tsize_t; n:Tsize_t; mean:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_float_skew_m_sd(data:Psingle; stride:Tsize_t; n:Tsize_t; mean:Tdouble; sd:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_float_kurtosis_m_sd(data:Psingle; stride:Tsize_t; n:Tsize_t; mean:Tdouble; sd:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_float_lag1_autocorrelation_m(data:Psingle; stride:Tsize_t; n:Tsize_t; mean:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_float_covariance_m(data1:Psingle; stride1:Tsize_t; data2:Psingle; stride2:Tsize_t; n:Tsize_t; 
           mean1:Tdouble; mean2:Tdouble):Tdouble;cdecl;external;
{ DEFINED FOR FLOATING POINT TYPES ONLY  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_float_wmean(w:Psingle; wstride:Tsize_t; data:Psingle; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_float_wvariance(w:Psingle; wstride:Tsize_t; data:Psingle; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_float_wsd(w:Psingle; wstride:Tsize_t; data:Psingle; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_float_wvariance_with_fixed_mean(w:Psingle; wstride:Tsize_t; data:Psingle; stride:Tsize_t; n:Tsize_t; 
           mean:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_float_wsd_with_fixed_mean(w:Psingle; wstride:Tsize_t; data:Psingle; stride:Tsize_t; n:Tsize_t; 
           mean:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_float_wtss(w:Psingle; wstride:Tsize_t; data:Psingle; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_float_wtss_m(w:Psingle; wstride:Tsize_t; data:Psingle; stride:Tsize_t; n:Tsize_t; 
           wmean:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_float_wabsdev(w:Psingle; wstride:Tsize_t; data:Psingle; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_float_wskew(w:Psingle; wstride:Tsize_t; data:Psingle; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_float_wkurtosis(w:Psingle; wstride:Tsize_t; data:Psingle; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_float_wvariance_m(w:Psingle; wstride:Tsize_t; data:Psingle; stride:Tsize_t; n:Tsize_t; 
           wmean:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_float_wsd_m(w:Psingle; wstride:Tsize_t; data:Psingle; stride:Tsize_t; n:Tsize_t; 
           wmean:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_float_wabsdev_m(w:Psingle; wstride:Tsize_t; data:Psingle; stride:Tsize_t; n:Tsize_t; 
           wmean:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_float_wskew_m_sd(w:Psingle; wstride:Tsize_t; data:Psingle; stride:Tsize_t; n:Tsize_t; 
           wmean:Tdouble; wsd:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_float_wkurtosis_m_sd(w:Psingle; wstride:Tsize_t; data:Psingle; stride:Tsize_t; n:Tsize_t; 
           wmean:Tdouble; wsd:Tdouble):Tdouble;cdecl;external;
{ END OF FLOATING POINT TYPES  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_float_pvariance(data1:Psingle; stride1:Tsize_t; n1:Tsize_t; data2:Psingle; stride2:Tsize_t; 
           n2:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_float_ttest(data1:Psingle; stride1:Tsize_t; n1:Tsize_t; data2:Psingle; stride2:Tsize_t; 
           n2:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_float_max(data:Psingle; stride:Tsize_t; n:Tsize_t):single;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_float_min(data:Psingle; stride:Tsize_t; n:Tsize_t):single;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure gsl_stats_float_minmax(min:Psingle; max:Psingle; data:Psingle; stride:Tsize_t; n:Tsize_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_float_max_index(data:Psingle; stride:Tsize_t; n:Tsize_t):Tsize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_float_min_index(data:Psingle; stride:Tsize_t; n:Tsize_t):Tsize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure gsl_stats_float_minmax_index(min_index:Psize_t; max_index:Psize_t; data:Psingle; stride:Tsize_t; n:Tsize_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_float_select(data:Psingle; stride:Tsize_t; n:Tsize_t; k:Tsize_t):single;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_float_median_from_sorted_data(sorted_data:Psingle; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_float_median(sorted_data:Psingle; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_float_quantile_from_sorted_data(sorted_data:Psingle; stride:Tsize_t; n:Tsize_t; f:Tdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_float_trmean_from_sorted_data(trim:Tdouble; sorted_data:Psingle; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_float_gastwirth_from_sorted_data(sorted_data:Psingle; stride:Tsize_t; n:Tsize_t):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_float_mad0(data:Psingle; stride:Tsize_t; n:Tsize_t; work:Pdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_float_mad(data:Psingle; stride:Tsize_t; n:Tsize_t; work:Pdouble):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_float_Sn0_from_sorted_data(sorted_data:Psingle; stride:Tsize_t; n:Tsize_t; work:Psingle):single;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_float_Sn_from_sorted_data(sorted_data:Psingle; stride:Tsize_t; n:Tsize_t; work:Psingle):Tdouble;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_float_Qn0_from_sorted_data(sorted_data:Psingle; stride:Tsize_t; n:Tsize_t; work:Psingle; work_int:Plongint):single;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_stats_float_Qn_from_sorted_data(sorted_data:Psingle; stride:Tsize_t; n:Tsize_t; work:Psingle; work_int:Plongint):Tdouble;cdecl;external;
{$endif}
{ __GSL_STATISTICS_FLOAT_H__  }

implementation


end.
