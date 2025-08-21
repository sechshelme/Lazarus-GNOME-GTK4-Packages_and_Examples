
unit gsl_multilarge;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_multilarge.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_multilarge.h
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
Pchar  = ^char;
Pdouble  = ^double;
Pgsl_matrix  = ^gsl_matrix;
Pgsl_multilarge_linear_type  = ^gsl_multilarge_linear_type;
Pgsl_multilarge_linear_workspace  = ^gsl_multilarge_linear_workspace;
Pgsl_vector  = ^gsl_vector;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gsl_multilarge.h
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
{$ifndef __GSL_MULTILARGE_H__}
{$define __GSL_MULTILARGE_H__}
{$include <gsl/gsl_math.h>}
{$include <gsl/gsl_vector.h>}
{$include <gsl/gsl_matrix.h>}
{$include <gsl/gsl_types.h>}
{ iteration solver type  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
type
  Pgsl_multilarge_linear_type = ^Tgsl_multilarge_linear_type;
  Tgsl_multilarge_linear_type = record
      name : Pchar;
      alloc : function (p:Tsize_t):pointer;cdecl;
      reset : function (para1:pointer):longint;cdecl;
      accumulate : function (X:Pgsl_matrix; y:Pgsl_vector; para3:pointer):longint;cdecl;
      solve : function (lambda:Tdouble; c:Pgsl_vector; rnorm:Pdouble; snorm:Pdouble; para5:pointer):longint;cdecl;
      rcond : function (rcond:Pdouble; para2:pointer):longint;cdecl;
      lcurve : function (reg_param:Pgsl_vector; rho:Pgsl_vector; eta:Pgsl_vector; para4:pointer):longint;cdecl;
      matrix_ptr : function (para1:pointer):Pgsl_matrix;cdecl;
      rhs_ptr : function (para1:pointer):Pgsl_vector;cdecl;
      free : procedure (para1:pointer);cdecl;
    end;
(* Const before type ignored *)

  Pgsl_multilarge_linear_workspace = ^Tgsl_multilarge_linear_workspace;
  Tgsl_multilarge_linear_workspace = record
      _type : Pgsl_multilarge_linear_type;
      state : pointer;
      p : Tsize_t;
    end;
{ available types  }
(* Const before type ignored *)
  var
    gsl_multilarge_linear_normal : Pgsl_multilarge_linear_type;cvar;external;
(* Const before type ignored *)
    gsl_multilarge_linear_tsqr : Pgsl_multilarge_linear_type;cvar;external;
{
 * Prototypes
  }
(* Const before type ignored *)
(* Const before type ignored *)

function gsl_multilarge_linear_alloc(T:Pgsl_multilarge_linear_type; p:Tsize_t):Pgsl_multilarge_linear_workspace;cdecl;external;
procedure gsl_multilarge_linear_free(w:Pgsl_multilarge_linear_workspace);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multilarge_linear_name(w:Pgsl_multilarge_linear_workspace):Pchar;cdecl;external;
function gsl_multilarge_linear_reset(w:Pgsl_multilarge_linear_workspace):longint;cdecl;external;
function gsl_multilarge_linear_accumulate(X:Pgsl_matrix; y:Pgsl_vector; w:Pgsl_multilarge_linear_workspace):longint;cdecl;external;
(* Const before type ignored *)
function gsl_multilarge_linear_solve(lambda:Tdouble; c:Pgsl_vector; rnorm:Pdouble; snorm:Pdouble; w:Pgsl_multilarge_linear_workspace):longint;cdecl;external;
function gsl_multilarge_linear_rcond(rcond:Pdouble; w:Pgsl_multilarge_linear_workspace):longint;cdecl;external;
function gsl_multilarge_linear_lcurve(reg_param:Pgsl_vector; rho:Pgsl_vector; eta:Pgsl_vector; w:Pgsl_multilarge_linear_workspace):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multilarge_linear_wstdform1(L:Pgsl_vector; X:Pgsl_matrix; w:Pgsl_vector; y:Pgsl_vector; Xs:Pgsl_matrix; 
           ys:Pgsl_vector; work:Pgsl_multilarge_linear_workspace):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multilarge_linear_stdform1(L:Pgsl_vector; X:Pgsl_matrix; y:Pgsl_vector; Xs:Pgsl_matrix; ys:Pgsl_vector; 
           work:Pgsl_multilarge_linear_workspace):longint;cdecl;external;
function gsl_multilarge_linear_L_decomp(L:Pgsl_matrix; tau:Pgsl_vector):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multilarge_linear_wstdform2(LQR:Pgsl_matrix; Ltau:Pgsl_vector; X:Pgsl_matrix; w:Pgsl_vector; y:Pgsl_vector; 
           Xs:Pgsl_matrix; ys:Pgsl_vector; work:Pgsl_multilarge_linear_workspace):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multilarge_linear_stdform2(LQR:Pgsl_matrix; Ltau:Pgsl_vector; X:Pgsl_matrix; y:Pgsl_vector; Xs:Pgsl_matrix; 
           ys:Pgsl_vector; work:Pgsl_multilarge_linear_workspace):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multilarge_linear_genform1(L:Pgsl_vector; cs:Pgsl_vector; c:Pgsl_vector; work:Pgsl_multilarge_linear_workspace):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multilarge_linear_genform2(LQR:Pgsl_matrix; Ltau:Pgsl_vector; cs:Pgsl_vector; c:Pgsl_vector; work:Pgsl_multilarge_linear_workspace):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multilarge_linear_matrix_ptr(work:Pgsl_multilarge_linear_workspace):Pgsl_matrix;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_multilarge_linear_rhs_ptr(work:Pgsl_multilarge_linear_workspace):Pgsl_vector;cdecl;external;
{$endif}
{ __GSL_MULTILARGE_H__  }

implementation


end.
