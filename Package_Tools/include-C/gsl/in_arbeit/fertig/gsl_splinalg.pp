
unit gsl_splinalg;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_splinalg.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_splinalg.h
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
Pgsl_splinalg_itersolve  = ^gsl_splinalg_itersolve;
Pgsl_splinalg_itersolve_type  = ^gsl_splinalg_itersolve_type;
Pgsl_spmatrix  = ^gsl_spmatrix;
Pgsl_vector  = ^gsl_vector;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gsl_splinalg.h
 * 
 * Copyright (C) 2012-2014 Patrick Alken
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
{$ifndef __GSL_SPLINALG_H__}
{$define __GSL_SPLINALG_H__}
{$include <gsl/gsl_math.h>}
{$include <gsl/gsl_vector.h>}
{$include <gsl/gsl_matrix.h>}
{$include <gsl/gsl_spmatrix.h>}
{$include <gsl/gsl_linalg.h>}
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
  Pgsl_splinalg_itersolve_type = ^Tgsl_splinalg_itersolve_type;
  Tgsl_splinalg_itersolve_type = record
      name : Pchar;
      alloc : function (n:Tsize_t; m:Tsize_t):pointer;cdecl;
      iterate : function (A:Pgsl_spmatrix; b:Pgsl_vector; tol:Tdouble; x:Pgsl_vector; para5:pointer):longint;cdecl;
      normr : function (para1:pointer):Tdouble;cdecl;
      free : procedure (para1:pointer);cdecl;
    end;
(* Const before type ignored *)
{ current residual norm || b - A x ||  }

  Pgsl_splinalg_itersolve = ^Tgsl_splinalg_itersolve;
  Tgsl_splinalg_itersolve = record
      _type : Pgsl_splinalg_itersolve_type;
      normr : Tdouble;
      state : pointer;
    end;
{ available types  }
(* Const before type ignored *)
  var
    gsl_splinalg_itersolve_gmres : Pgsl_splinalg_itersolve_type;cvar;external;
{
 * Prototypes
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function gsl_splinalg_itersolve_alloc(T:Pgsl_splinalg_itersolve_type; n:Tsize_t; m:Tsize_t):Pgsl_splinalg_itersolve;cdecl;external;
procedure gsl_splinalg_itersolve_free(w:Pgsl_splinalg_itersolve);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_splinalg_itersolve_name(w:Pgsl_splinalg_itersolve):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_splinalg_itersolve_iterate(A:Pgsl_spmatrix; b:Pgsl_vector; tol:Tdouble; x:Pgsl_vector; w:Pgsl_splinalg_itersolve):longint;cdecl;external;
(* Const before type ignored *)
function gsl_splinalg_itersolve_normr(w:Pgsl_splinalg_itersolve):Tdouble;cdecl;external;
{$endif}
{ __GSL_SPLINALG_H__  }

implementation


end.
