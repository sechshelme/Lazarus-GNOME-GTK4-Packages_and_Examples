
unit gsl_rstat;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_rstat.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_rstat.h
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
Pgsl_rstat_quantile_workspace  = ^gsl_rstat_quantile_workspace;
Pgsl_rstat_workspace  = ^gsl_rstat_workspace;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ rstat/gsl_rstat.h
 * 
 * Copyright (C) 2015 Patrick Alken
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
{$ifndef __GSL_RSTAT_H__}
{$define __GSL_RSTAT_H__}
{$include <stdlib.h>}
{ p-quantile  }
{ heights q_i  }
{ positions n_i  }
{ desired positions n_i'  }
{ increments dn_i'  }
{ number of data added  }
type
  Pgsl_rstat_quantile_workspace = ^Tgsl_rstat_quantile_workspace;
  Tgsl_rstat_quantile_workspace = record
      p : Tdouble;
      q : array[0..4] of Tdouble;
      npos : array[0..4] of longint;
      np : array[0..4] of Tdouble;
      dnp : array[0..4] of Tdouble;
      n : Tsize_t;
    end;
(* Const before type ignored *)

function gsl_rstat_quantile_alloc(p:Tdouble):Pgsl_rstat_quantile_workspace;cdecl;external;
procedure gsl_rstat_quantile_free(w:Pgsl_rstat_quantile_workspace);cdecl;external;
function gsl_rstat_quantile_reset(w:Pgsl_rstat_quantile_workspace):longint;cdecl;external;
(* Const before type ignored *)
function gsl_rstat_quantile_add(x:Tdouble; w:Pgsl_rstat_quantile_workspace):longint;cdecl;external;
function gsl_rstat_quantile_get(w:Pgsl_rstat_quantile_workspace):Tdouble;cdecl;external;
{ minimum value added  }
{ maximum value added  }
{ current mean  }
{ M_k = sum_i=1..n [ x_i - mean_n ]^k  }
{ number of data points added  }
{ median workspace  }
type
  Pgsl_rstat_workspace = ^Tgsl_rstat_workspace;
  Tgsl_rstat_workspace = record
      min : Tdouble;
      max : Tdouble;
      mean : Tdouble;
      M2 : Tdouble;
      M3 : Tdouble;
      M4 : Tdouble;
      n : Tsize_t;
      median_workspace_p : Pgsl_rstat_quantile_workspace;
    end;

function gsl_rstat_alloc:Pgsl_rstat_workspace;cdecl;external;
procedure gsl_rstat_free(w:Pgsl_rstat_workspace);cdecl;external;
(* Const before type ignored *)
function gsl_rstat_n(w:Pgsl_rstat_workspace):Tsize_t;cdecl;external;
(* Const before type ignored *)
function gsl_rstat_add(x:Tdouble; w:Pgsl_rstat_workspace):longint;cdecl;external;
(* Const before type ignored *)
function gsl_rstat_min(w:Pgsl_rstat_workspace):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_rstat_max(w:Pgsl_rstat_workspace):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_rstat_mean(w:Pgsl_rstat_workspace):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_rstat_variance(w:Pgsl_rstat_workspace):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_rstat_sd(w:Pgsl_rstat_workspace):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_rstat_rms(w:Pgsl_rstat_workspace):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_rstat_sd_mean(w:Pgsl_rstat_workspace):Tdouble;cdecl;external;
function gsl_rstat_median(w:Pgsl_rstat_workspace):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_rstat_skew(w:Pgsl_rstat_workspace):Tdouble;cdecl;external;
(* Const before type ignored *)
function gsl_rstat_kurtosis(w:Pgsl_rstat_workspace):Tdouble;cdecl;external;
function gsl_rstat_reset(w:Pgsl_rstat_workspace):longint;cdecl;external;
{$endif}
{ __GSL_RSTAT_H__  }

implementation


end.
