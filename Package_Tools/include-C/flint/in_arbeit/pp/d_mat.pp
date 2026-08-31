
unit d_mat;
interface

{
  Automatically converted by H2Pas 1.0.0 from d_mat.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    d_mat.h
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
Pd_mat_struct  = ^d_mat_struct;
Pd_mat_t  = ^d_mat_t;
Pdouble  = ^double;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
    Copyright (C) 2010 William Hart
    Copyright (C) 2010 Fredrik Johansson
    Copyright (C) 2014 Abhinav Baid

    This file is part of FLINT.

    FLINT is free software: you can redistribute it and/or modify it under
    the terms of the GNU Lesser General Public License (LGPL) as published
    by the Free Software Foundation; either version 2.1 of the License, or
    (at your option) any later version.  See <https://www.gnu.org/licenses/>.
 }
{$ifndef D_MAT_H}
{$define D_MAT_H}
{$include "flint.h"}
type
  Pd_mat_struct = ^Td_mat_struct;
  Td_mat_struct = record
      entries : Pdouble;
      r : Tslong;
      c : Tslong;
      rows : ^Pdouble;
    end;

  Pd_mat_t = ^Td_mat_t;
  Td_mat_t = array[0..0] of Td_mat_struct;
{xxxxxxx #define d_mat_entry(mat,i,j) (*((mat)->rows[i] + (j))) }
(* Const before type ignored *)

function d_mat_entry_ptr(mat:Td_mat_t; i:Tslong; j:Tslong):Pdouble;cdecl;external;
(* Const before type ignored *)
function d_mat_get_entry(mat:Td_mat_t; i:Tslong; j:Tslong):Tdouble;cdecl;external;
(* Const before type ignored *)
function d_mat_nrows(mat:Td_mat_t):Tslong;cdecl;external;
(* Const before type ignored *)
function d_mat_ncols(mat:Td_mat_t):Tslong;cdecl;external;
{ Memory management  ******************************************************* }
procedure d_mat_init(mat:Td_mat_t; rows:Tslong; cols:Tslong);cdecl;external;
procedure d_mat_swap(mat1:Td_mat_t; mat2:Td_mat_t);cdecl;external;
procedure d_mat_swap_entrywise(mat1:Td_mat_t; mat2:Td_mat_t);cdecl;external;
(* Const before type ignored *)
procedure d_mat_set(mat1:Td_mat_t; mat2:Td_mat_t);cdecl;external;
procedure d_mat_clear(mat:Td_mat_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function d_mat_equal(mat1:Td_mat_t; mat2:Td_mat_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function d_mat_approx_equal(mat1:Td_mat_t; mat2:Td_mat_t; eps:Tdouble):longint;cdecl;external;
(* Const before type ignored *)
function d_mat_is_zero(mat:Td_mat_t):longint;cdecl;external;
(* Const before type ignored *)
function d_mat_is_approx_zero(mat:Td_mat_t; eps:Tdouble):longint;cdecl;external;
(* Const before type ignored *)
function d_mat_is_empty(mat:Td_mat_t):longint;cdecl;external;
(* Const before type ignored *)
function d_mat_is_square(mat:Td_mat_t):longint;cdecl;external;
procedure d_mat_zero(mat:Td_mat_t);cdecl;external;
procedure d_mat_one(mat:Td_mat_t);cdecl;external;
{ Input and output  ******************************************************** }
(* Const before type ignored *)
procedure d_mat_print(mat:Td_mat_t);cdecl;external;
{ Random matrix generation  ************************************************ }
procedure d_mat_randtest(mat:Td_mat_t; state:Tflint_rand_t; minexp:Tslong; maxexp:Tslong);cdecl;external;
{ Transpose  }
(* Const before type ignored *)
procedure d_mat_transpose(B:Td_mat_t; A:Td_mat_t);cdecl;external;
{ Multiplication  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure d_mat_mul_classical(C:Td_mat_t; A:Td_mat_t; B:Td_mat_t);cdecl;external;
{ Permutations  }
procedure d_mat_swap_rows(mat:Td_mat_t; r:Tslong; s:Tslong);cdecl;external;
{ Gram-Schmidt Orthogonalisation and QR Decomposition  ******************************************************* }
(* Const before type ignored *)
procedure d_mat_gso(B:Td_mat_t; A:Td_mat_t);cdecl;external;
(* Const before type ignored *)
procedure d_mat_qr(Q:Td_mat_t; R:Td_mat_t; A:Td_mat_t);cdecl;external;
{$endif}

implementation


end.
