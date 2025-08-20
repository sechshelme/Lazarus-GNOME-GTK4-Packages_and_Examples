
unit gsl_spmatrix_long_double;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_spmatrix_long_double.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_spmatrix_long_double.h
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
PFILE  = ^FILE;
Pgsl_bst_workspace  = ^gsl_bst_workspace;
Pgsl_matrix_long_double  = ^gsl_matrix_long_double;
Pgsl_spmatrix_long_double  = ^gsl_spmatrix_long_double;
Pgsl_spmatrix_pool  = ^gsl_spmatrix_pool;
Pgsl_vector_long_double  = ^gsl_vector_long_double;
Plong_double  = ^long_double;
Plongint  = ^longint;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ spmatrix/gsl_spmatrix_long_double.h
 * 
 * Copyright (C) 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020 Patrick Alken
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
{$ifndef __GSL_SPMATRIX_LONG_DOUBLE_H__}
{$define __GSL_SPMATRIX_LONG_DOUBLE_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_math.h>}
{$include <gsl/gsl_bst.h>}
{$include <gsl/gsl_vector_long_double.h>}
{$include <gsl/gsl_matrix_long_double.h>}
{
 * COO format:
 *
 * If data[n] = A_ij, then:
 *   i = A->i[n]
 *   j = A->p[n]
 *
 * Compressed column format (CSC):
 *
 * If data[n] = A_ij, then:
 *   i = A->i[n]
 *   A->p[j] <= n < A->p[j+1]
 * so that column j is stored in
 * [ data[p[j]], data[p[j] + 1], ..., data[p[j+1] - 1] ]
 *
 * Compressed row format (CSR):
 *
 * If data[n] = A_ij, then:
 *   j = A->i[n]
 *   A->p[i] <= n < A->p[i+1]
 * so that row i is stored in
 * [ data[p[i]], data[p[i] + 1], ..., data[p[i+1] - 1] ]
  }
{ number of rows  }
{ number of columns  }
{ i (size nzmax) contains:
   *
   * COO/CSC: row indices
   * CSR: column indices
    }
{ matrix elements of size nzmax  }
{
   * COO: p[n] = column number of element data[n]
   * CSC: p[j] = index in data of first non-zero element in column j
   * CSR: p[i] = index in data of first non-zero element in row i
    }
{ maximum number of matrix elements  }
{ number of non-zero values in matrix  }
{ binary tree structure  }
{ memory pool for binary tree nodes  }
{ size of individual tree node in bytes  }
{
   * workspace of size MAX(size1,size2)*MAX(sizeof(long_double),sizeof(int))
   * used in various routines
    }
{ sparse storage type  }
{ GSL_SPMATRIX_FLG_xxx  }
type
  Pgsl_spmatrix_long_double = ^Tgsl_spmatrix_long_double;
  Tgsl_spmatrix_long_double = record
      size1 : Tsize_t;
      size2 : Tsize_t;
      i : Plongint;
      data : Plong_double;
      p : Plongint;
      nzmax : Tsize_t;
      nz : Tsize_t;
      tree : Pgsl_bst_workspace;
      pool : Pgsl_spmatrix_pool;
      node_size : Tsize_t;
      work : record
          case longint of
            0 : ( work_void : pointer );
            1 : ( work_int : Plongint );
            2 : ( work_atomic : Plong_double );
          end;
      sptype : longint;
      spflags : Tsize_t;
    end;
{
 * Prototypes
  }
{ allocation / initialization  }
(* Const before type ignored *)
(* Const before type ignored *)

function gsl_spmatrix_long_double_alloc(n1:Tsize_t; n2:Tsize_t):Pgsl_spmatrix_long_double;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_spmatrix_long_double_alloc_nzmax(n1:Tsize_t; n2:Tsize_t; nzmax:Tsize_t; sptype:longint):Pgsl_spmatrix_long_double;cdecl;external;
procedure gsl_spmatrix_long_double_free(m:Pgsl_spmatrix_long_double);cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_long_double_realloc(nzmax:Tsize_t; m:Pgsl_spmatrix_long_double):longint;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_long_double_nnz(m:Pgsl_spmatrix_long_double):Tsize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_spmatrix_long_double_type(m:Pgsl_spmatrix_long_double):Pchar;cdecl;external;
function gsl_spmatrix_long_double_set_zero(m:Pgsl_spmatrix_long_double):longint;cdecl;external;
function gsl_spmatrix_long_double_tree_rebuild(m:Pgsl_spmatrix_long_double):longint;cdecl;external;
{ compress  }
(* Const before type ignored *)
function gsl_spmatrix_long_double_csc(dest:Pgsl_spmatrix_long_double; src:Pgsl_spmatrix_long_double):longint;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_long_double_csr(dest:Pgsl_spmatrix_long_double; src:Pgsl_spmatrix_long_double):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_spmatrix_long_double_compress(src:Pgsl_spmatrix_long_double; sptype:longint):Pgsl_spmatrix_long_double;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_long_double_compcol(src:Pgsl_spmatrix_long_double):Pgsl_spmatrix_long_double;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_long_double_ccs(src:Pgsl_spmatrix_long_double):Pgsl_spmatrix_long_double;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_long_double_crs(src:Pgsl_spmatrix_long_double):Pgsl_spmatrix_long_double;cdecl;external;
{ copy  }
(* Const before type ignored *)
function gsl_spmatrix_long_double_memcpy(dest:Pgsl_spmatrix_long_double; src:Pgsl_spmatrix_long_double):longint;cdecl;external;
{ file I/O  }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_spmatrix_long_double_fprintf(stream:PFILE; m:Pgsl_spmatrix_long_double; format:Pchar):longint;cdecl;external;
function gsl_spmatrix_long_double_fscanf(stream:PFILE):Pgsl_spmatrix_long_double;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_long_double_fwrite(stream:PFILE; m:Pgsl_spmatrix_long_double):longint;cdecl;external;
function gsl_spmatrix_long_double_fread(stream:PFILE; m:Pgsl_spmatrix_long_double):longint;cdecl;external;
{ get/set  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_spmatrix_long_double_get(m:Pgsl_spmatrix_long_double; i:Tsize_t; j:Tsize_t):Tlong_double;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_spmatrix_long_double_set(m:Pgsl_spmatrix_long_double; i:Tsize_t; j:Tsize_t; x:Tlong_double):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_spmatrix_long_double_ptr(m:Pgsl_spmatrix_long_double; i:Tsize_t; j:Tsize_t):Plong_double;cdecl;external;
{ minmax  }
(* Const before type ignored *)
function gsl_spmatrix_long_double_minmax(m:Pgsl_spmatrix_long_double; min_out:Plong_double; max_out:Plong_double):longint;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_long_double_min_index(m:Pgsl_spmatrix_long_double; imin_out:Psize_t; jmin_out:Psize_t):longint;cdecl;external;
{ operations  }
(* Const before type ignored *)
function gsl_spmatrix_long_double_scale(m:Pgsl_spmatrix_long_double; x:Tlong_double):longint;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_long_double_scale_columns(m:Pgsl_spmatrix_long_double; x:Pgsl_vector_long_double):longint;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_long_double_scale_rows(m:Pgsl_spmatrix_long_double; x:Pgsl_vector_long_double):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_spmatrix_long_double_add(c:Pgsl_spmatrix_long_double; a:Pgsl_spmatrix_long_double; b:Pgsl_spmatrix_long_double):longint;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_long_double_dense_add(a:Pgsl_matrix_long_double; b:Pgsl_spmatrix_long_double):longint;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_long_double_dense_sub(a:Pgsl_matrix_long_double; b:Pgsl_spmatrix_long_double):longint;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_long_double_d2sp(T:Pgsl_spmatrix_long_double; A:Pgsl_matrix_long_double):longint;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_long_double_sp2d(A:Pgsl_matrix_long_double; S:Pgsl_spmatrix_long_double):longint;cdecl;external;
{$ifndef GSL_DISABLE_DEPRECATED}
(* Const before type ignored *)

function gsl_spmatrix_long_double_add_to_dense(a:Pgsl_matrix_long_double; b:Pgsl_spmatrix_long_double):longint;cdecl;external;
{$endif}
{ properties  }
(* Const before type ignored *)
(* Const before type ignored *)

function gsl_spmatrix_long_double_equal(a:Pgsl_spmatrix_long_double; b:Pgsl_spmatrix_long_double):longint;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_long_double_norm1(a:Pgsl_spmatrix_long_double):Tlong_double;cdecl;external;
{ swap  }
function gsl_spmatrix_long_double_transpose(m:Pgsl_spmatrix_long_double):longint;cdecl;external;
function gsl_spmatrix_long_double_transpose2(m:Pgsl_spmatrix_long_double):longint;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_long_double_transpose_memcpy(dest:Pgsl_spmatrix_long_double; src:Pgsl_spmatrix_long_double):longint;cdecl;external;
{$endif}
{ __GSL_SPMATRIX_LONG_DOUBLE_H__  }

implementation


end.
