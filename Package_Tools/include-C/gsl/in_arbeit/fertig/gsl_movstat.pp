
unit gsl_movstat;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_movstat.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_movstat.h
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
Pgsl_movstat_accum  = ^gsl_movstat_accum;
Pgsl_movstat_end_t  = ^gsl_movstat_end_t;
Pgsl_movstat_function  = ^gsl_movstat_function;
Pgsl_movstat_workspace  = ^gsl_movstat_workspace;
Pgsl_vector  = ^gsl_vector;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ movstat/gsl_movstat.h
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
{$ifndef __GSL_MOVSTAT_H__}
{$define __GSL_MOVSTAT_H__}
{$include <gsl/gsl_math.h>}
{$include <gsl/gsl_vector.h>}
type
  Pgsl_movstat_end_t = ^Tgsl_movstat_end_t;
  Tgsl_movstat_end_t =  Longint;
  Const
    GSL_MOVSTAT_END_PADZERO = 0;
    GSL_MOVSTAT_END_PADVALUE = 1;
    GSL_MOVSTAT_END_TRUNCATE = 2;
;
{ accumulator struct
 * size          - return number of bytes needed for accumulator with maximum of n elements
 * init          - initialize accumulator state
 * insert        - insert a single sample into accumulator; if there are already n
 *                 samples in accumulator, oldest sample is overwritten
 * delete_oldest - delete oldest sample from accumulator
 * get           - return accumulated value
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
type
  Pgsl_movstat_accum = ^Tgsl_movstat_accum;
  Tgsl_movstat_accum = record
      size : function (n:Tsize_t):Tsize_t;cdecl;
      init : function (n:Tsize_t; vstate:pointer):longint;cdecl;
      insert : function (x:Tdouble; vstate:pointer):longint;cdecl;
      delete_oldest : function (vstate:pointer):longint;cdecl;
      get : function (params:pointer; result:Pdouble; vstate:pointer):longint;cdecl;
    end;
(* Const before type ignored *)

  Pgsl_movstat_function = ^Tgsl_movstat_function;
  Tgsl_movstat_function = record
      _function : function (n:Tsize_t; x:Pdouble; params:pointer):Tdouble;cdecl;
      params : pointer;
    end;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function GSL_MOVSTAT_FN_EVAL(F,n,x : longint) : longint;

{ workspace for moving window statistics  }
{ number of previous samples in window  }
{ number of after samples in window  }
{ window size K = H + J + 1  }
{ workspace, size K  }
{ state workspace for various accumulators  }
{ bytes allocated for 'state'  }
type
  Pgsl_movstat_workspace = ^Tgsl_movstat_workspace;
  Tgsl_movstat_workspace = record
      H : Tsize_t;
      J : Tsize_t;
      K : Tsize_t;
      work : Pdouble;
      state : pointer;
      state_size : Tsize_t;
    end;
{ alloc.c  }
(* Const before type ignored *)

function gsl_movstat_alloc(K:Tsize_t):Pgsl_movstat_workspace;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_movstat_alloc2(H:Tsize_t; J:Tsize_t):Pgsl_movstat_workspace;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_movstat_alloc_with_size(accum_state_size:Tsize_t; H:Tsize_t; J:Tsize_t):Pgsl_movstat_workspace;cdecl;external;
procedure gsl_movstat_free(w:Pgsl_movstat_workspace);cdecl;external;
{ apply.c  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_movstat_apply_accum(endtype:Tgsl_movstat_end_t; x:Pgsl_vector; accum:Pgsl_movstat_accum; accum_params:pointer; y:Pgsl_vector; 
           z:Pgsl_vector; w:Pgsl_movstat_workspace):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_movstat_apply(endtype:Tgsl_movstat_end_t; F:Pgsl_movstat_function; x:Pgsl_vector; y:Pgsl_vector; w:Pgsl_movstat_workspace):longint;cdecl;external;
{ fill.c  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_movstat_fill(endtype:Tgsl_movstat_end_t; x:Pgsl_vector; idx:Tsize_t; H:Tsize_t; J:Tsize_t; 
           window:Pdouble):Tsize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_movstat_mean(endtype:Tgsl_movstat_end_t; x:Pgsl_vector; y:Pgsl_vector; w:Pgsl_movstat_workspace):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_movstat_variance(endtype:Tgsl_movstat_end_t; x:Pgsl_vector; y:Pgsl_vector; w:Pgsl_movstat_workspace):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_movstat_sd(endtype:Tgsl_movstat_end_t; x:Pgsl_vector; y:Pgsl_vector; w:Pgsl_movstat_workspace):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_movstat_median(endtype:Tgsl_movstat_end_t; x:Pgsl_vector; y:Pgsl_vector; w:Pgsl_movstat_workspace):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_movstat_min(endtype:Tgsl_movstat_end_t; x:Pgsl_vector; y:Pgsl_vector; w:Pgsl_movstat_workspace):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_movstat_max(endtype:Tgsl_movstat_end_t; x:Pgsl_vector; y:Pgsl_vector; w:Pgsl_movstat_workspace):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_movstat_minmax(endtype:Tgsl_movstat_end_t; x:Pgsl_vector; y_min:Pgsl_vector; y_max:Pgsl_vector; w:Pgsl_movstat_workspace):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_movstat_mad0(endtype:Tgsl_movstat_end_t; x:Pgsl_vector; xmedian:Pgsl_vector; xmad:Pgsl_vector; w:Pgsl_movstat_workspace):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_movstat_mad(endtype:Tgsl_movstat_end_t; x:Pgsl_vector; xmedian:Pgsl_vector; xmad:Pgsl_vector; w:Pgsl_movstat_workspace):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_movstat_qqr(endtype:Tgsl_movstat_end_t; x:Pgsl_vector; q:Tdouble; xqqr:Pgsl_vector; w:Pgsl_movstat_workspace):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_movstat_Sn(endtype:Tgsl_movstat_end_t; x:Pgsl_vector; xscale:Pgsl_vector; w:Pgsl_movstat_workspace):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_movstat_Qn(endtype:Tgsl_movstat_end_t; x:Pgsl_vector; xscale:Pgsl_vector; w:Pgsl_movstat_workspace):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_movstat_sum(endtype:Tgsl_movstat_end_t; x:Pgsl_vector; y:Pgsl_vector; w:Pgsl_movstat_workspace):longint;cdecl;external;
{ accumulator variables  }
(* Const before type ignored *)
  var
    gsl_movstat_accum_mad : Pgsl_movstat_accum;cvar;external;
(* Const before type ignored *)
    gsl_movstat_accum_max : Pgsl_movstat_accum;cvar;external;
(* Const before type ignored *)
    gsl_movstat_accum_mean : Pgsl_movstat_accum;cvar;external;
(* Const before type ignored *)
    gsl_movstat_accum_median : Pgsl_movstat_accum;cvar;external;
(* Const before type ignored *)
    gsl_movstat_accum_min : Pgsl_movstat_accum;cvar;external;
(* Const before type ignored *)
    gsl_movstat_accum_minmax : Pgsl_movstat_accum;cvar;external;
(* Const before type ignored *)
    gsl_movstat_accum_sd : Pgsl_movstat_accum;cvar;external;
(* Const before type ignored *)
    gsl_movstat_accum_Sn : Pgsl_movstat_accum;cvar;external;
(* Const before type ignored *)
    gsl_movstat_accum_sum : Pgsl_movstat_accum;cvar;external;
(* Const before type ignored *)
    gsl_movstat_accum_Qn : Pgsl_movstat_accum;cvar;external;
(* Const before type ignored *)
    gsl_movstat_accum_qqr : Pgsl_movstat_accum;cvar;external;
(* Const before type ignored *)
    gsl_movstat_accum_userfunc : Pgsl_movstat_accum;cvar;external;
(* Const before type ignored *)
    gsl_movstat_accum_variance : Pgsl_movstat_accum;cvar;external;
{$endif}
{ __GSL_MOVSTAT_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GSL_MOVSTAT_FN_EVAL(F,n,x : longint) : longint;
begin
  GSL_MOVSTAT_FN_EVAL:=F^._function(nxF^.params);
end;


end.
