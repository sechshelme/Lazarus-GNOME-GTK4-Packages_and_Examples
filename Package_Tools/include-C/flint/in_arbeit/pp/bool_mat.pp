
unit bool_mat;
interface

{
  Automatically converted by H2Pas 1.0.0 from bool_mat.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    bool_mat.h
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
Pbool_mat_struct  = ^bool_mat_struct;
Pbool_mat_t  = ^bool_mat_t;
PFILE  = ^FILE;
Plongint  = ^longint;
Pslong  = ^slong;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
    Copyright (C) 2016 Arb authors

    This file is part of Arb.

    Arb is free software: you can redistribute it and/or modify it under
    the terms of the GNU Lesser General Public License (LGPL) as published
    by the Free Software Foundation; either version 2.1 of the License, or
    (at your option) any later version.  See <http://www.gnu.org/licenses/>.
 }
{$ifndef BOOL_MAT_H}
{$define BOOL_MAT_H}
type
  Pbool_mat_struct = ^Tbool_mat_struct;
  Tbool_mat_struct = record
      entries : Plongint;
      r : Tslong;
      c : Tslong;
      rows : ^Plongint;
    end;

  Pbool_mat_t = ^Tbool_mat_t;
  Tbool_mat_t = array[0..0] of Tbool_mat_struct;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function bool_mat_nrows(mat : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function bool_mat_ncols(mat : longint) : longint;

(* Const before type ignored *)
function bool_mat_get_entry(mat:Tbool_mat_t; i:Tslong; j:Tslong):longint;cdecl;external;
procedure bool_mat_set_entry(mat:Tbool_mat_t; i:Tslong; j:Tslong; value:longint);cdecl;external;
{ Memory management  }
procedure bool_mat_init(mat:Tbool_mat_t; r:Tslong; c:Tslong);cdecl;external;
procedure bool_mat_clear(mat:Tbool_mat_t);cdecl;external;
procedure bool_mat_swap(mat1:Tbool_mat_t; mat2:Tbool_mat_t);cdecl;external;
{ Conversions  }
(* Const before type ignored *)
procedure bool_mat_set(dest:Tbool_mat_t; src:Tbool_mat_t);cdecl;external;
{ Random generation  }
procedure bool_mat_randtest(mat:Tbool_mat_t; state:Tflint_rand_t);cdecl;external;
procedure bool_mat_randtest_diagonal(mat:Tbool_mat_t; state:Tflint_rand_t);cdecl;external;
procedure bool_mat_randtest_nilpotent(mat:Tbool_mat_t; state:Tflint_rand_t);cdecl;external;
{ I/O  }
{$ifdef FLINT_HAVE_FILE}
(* Const before type ignored *)
procedure bool_mat_fprint(file:PFILE; mat:Tbool_mat_t);cdecl;external;
{$endif}
(* Const before type ignored *)

procedure bool_mat_print(mat:Tbool_mat_t);cdecl;external;
{ Comparisons  }
(* Const before type ignored *)
(* Const before type ignored *)
function bool_mat_equal(mat1:Tbool_mat_t; mat2:Tbool_mat_t):longint;cdecl;external;
(* Const before type ignored *)
function bool_mat_any(mat:Tbool_mat_t):longint;cdecl;external;
(* Const before type ignored *)
function bool_mat_all(mat:Tbool_mat_t):longint;cdecl;external;
(* Const before type ignored *)
function bool_mat_is_diagonal(mat:Tbool_mat_t):longint;cdecl;external;
(* Const before type ignored *)
function bool_mat_is_lower_triangular(mat:Tbool_mat_t):longint;cdecl;external;
(* Const before type ignored *)
function bool_mat_is_transitive(mat:Tbool_mat_t):longint;cdecl;external;
(* Const before type ignored *)
function bool_mat_is_nilpotent(mat:Tbool_mat_t):longint;cdecl;external;
(* Const before type ignored *)
function bool_mat_is_empty(mat:Tbool_mat_t):longint;cdecl;external;
(* Const before type ignored *)
function bool_mat_is_square(mat:Tbool_mat_t):longint;cdecl;external;
{ Special matrices  }
procedure bool_mat_zero(mat:Tbool_mat_t);cdecl;external;
procedure bool_mat_one(mat:Tbool_mat_t);cdecl;external;
procedure bool_mat_directed_path(mat:Tbool_mat_t);cdecl;external;
procedure bool_mat_directed_cycle(mat:Tbool_mat_t);cdecl;external;
{ Transpose  }
(* Const before type ignored *)
procedure bool_mat_transpose(mat1:Tbool_mat_t; mat2:Tbool_mat_t);cdecl;external;
{ Arithmetic  }
(* Const before type ignored *)
procedure bool_mat_complement(mat1:Tbool_mat_t; mat2:Tbool_mat_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure bool_mat_add(res:Tbool_mat_t; mat1:Tbool_mat_t; mat2:Tbool_mat_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure bool_mat_mul(res:Tbool_mat_t; mat1:Tbool_mat_t; mat2:Tbool_mat_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure bool_mat_mul_entrywise(res:Tbool_mat_t; mat1:Tbool_mat_t; mat2:Tbool_mat_t);cdecl;external;
(* Const before type ignored *)
procedure bool_mat_pow_ui(B:Tbool_mat_t; A:Tbool_mat_t; exp:Tulong);cdecl;external;
(* Const before type ignored *)
procedure bool_mat_sqr(B:Tbool_mat_t; A:Tbool_mat_t);cdecl;external;
{ Special functions  }
(* Const before type ignored *)
function bool_mat_trace(mat:Tbool_mat_t):longint;cdecl;external;
(* Const before type ignored *)
function bool_mat_nilpotency_degree(mat:Tbool_mat_t):Tslong;cdecl;external;
(* Const before type ignored *)
procedure bool_mat_transitive_closure(dest:Tbool_mat_t; src:Tbool_mat_t);cdecl;external;
(* Const before type ignored *)
function bool_mat_get_strongly_connected_components(partition:Pslong; A:Tbool_mat_t):Tslong;cdecl;external;
(* Const before type ignored *)
function bool_mat_all_pairs_longest_walk(B:Tfmpz_mat_t; A:Tbool_mat_t):Tslong;cdecl;external;
{$endif}

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function bool_mat_nrows(mat : longint) : longint;
begin
  bool_mat_nrows:=mat^.r;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function bool_mat_ncols(mat : longint) : longint;
begin
  bool_mat_ncols:=mat^.c;
end;


end.
