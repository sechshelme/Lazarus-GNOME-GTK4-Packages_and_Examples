unit gsl_sf_coupling;

interface

uses
  fp_gsl;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ specfunc/gsl_sf_coupling.h
 * 
 * Copyright (C) 1996,1997,1998,1999,2000,2001,2002 Gerard Jungman
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
{$ifndef __GSL_SF_COUPLING_H__}
{$define __GSL_SF_COUPLING_H__}
{$include <gsl/gsl_sf_result.h>}
{ 3j Symbols:  / ja jb jc \
 *              \ ma mb mc /
 *
 * exceptions: GSL_EDOM, GSL_EOVRFLW
  }

function gsl_sf_coupling_3j_e(two_ja:longint; two_jb:longint; two_jc:longint; two_ma:longint; two_mb:longint; 
           two_mc:longint; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_coupling_3j(two_ja:longint; two_jb:longint; two_jc:longint; two_ma:longint; two_mb:longint; 
           two_mc:longint):Tdouble;cdecl;external libgsl;
{ 6j Symbols:  / ja jb jc \
 *              \ jd je jf /
 *
 * exceptions: GSL_EDOM, GSL_EOVRFLW
  }
function gsl_sf_coupling_6j_e(two_ja:longint; two_jb:longint; two_jc:longint; two_jd:longint; two_je:longint; 
           two_jf:longint; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_coupling_6j(two_ja:longint; two_jb:longint; two_jc:longint; two_jd:longint; two_je:longint; 
           two_jf:longint):Tdouble;cdecl;external libgsl;
{ Racah W coefficients:
 *
 *   W(a b c d; e f) = (-1)^a+b+c+d / a b e \
 *                                    \ d c f /
 *
 * exceptions: GSL_EDOM, GSL_EOVRFLW
  }
function gsl_sf_coupling_RacahW_e(two_ja:longint; two_jb:longint; two_jc:longint; two_jd:longint; two_je:longint; 
           two_jf:longint; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_coupling_RacahW(two_ja:longint; two_jb:longint; two_jc:longint; two_jd:longint; two_je:longint; 
           two_jf:longint):Tdouble;cdecl;external libgsl;
{ 9j Symbols:  / ja jb jc \
 *              | jd je jf |
 *              \ jg jh ji /
 *
 * exceptions: GSL_EDOM, GSL_EOVRFLW
  }
function gsl_sf_coupling_9j_e(two_ja:longint; two_jb:longint; two_jc:longint; two_jd:longint; two_je:longint; 
           two_jf:longint; two_jg:longint; two_jh:longint; two_ji:longint; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_coupling_9j(two_ja:longint; two_jb:longint; two_jc:longint; two_jd:longint; two_je:longint; 
           two_jf:longint; two_jg:longint; two_jh:longint; two_ji:longint):Tdouble;cdecl;external libgsl;
{ INCORRECT version of 6j Symbols:
 * This function actually calculates
 *              / ja jb je \
 *              \ jd jc jf /
 * It represents the original implementation,
 * which had the above permutation of the
 * arguments. This was wrong and confusing,
 * and I had to fix it. Sorry for the trouble.
 * [GJ] Tue Nov 26 12:53:39 MST 2002
 *
 * exceptions: GSL_EDOM, GSL_EOVRFLW
  }
{$ifndef GSL_DISABLE_DEPRECATED}

function gsl_sf_coupling_6j_INCORRECT_e(two_ja:longint; two_jb:longint; two_jc:longint; two_jd:longint; two_je:longint; 
           two_jf:longint; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_coupling_6j_INCORRECT(two_ja:longint; two_jb:longint; two_jc:longint; two_jd:longint; two_je:longint; 
           two_jf:longint):Tdouble;cdecl;external libgsl;
{$endif}
{ !GSL_DISABLE_DEPRECATED  }
{$endif}
{ __GSL_SF_COUPLING_H__  }

// === Konventiert am: 22-8-25 14:04:15 ===


implementation



end.
