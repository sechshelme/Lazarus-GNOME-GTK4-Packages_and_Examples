
unit gsl_spmatrix_long;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_spmatrix_long.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_spmatrix_long
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
Pgsl_matrix_long  = ^gsl_matrix_long;
Pgsl_spmatrix_long  = ^gsl_spmatrix_long;
Pgsl_spmatrix_pool  = ^gsl_spmatrix_pool;
Pgsl_vector_long  = ^gsl_vector_long;
Plongint  = ^longint;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ spmatrix/gsl_spmatrix_long.h
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
{$ifndef __GSL_SPMATRIX_LONG_H__}
{$define __GSL_SPMATRIX_LONG_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_math.h>}
{$include <gsl/gsl_bst.h>}
{$include <gsl/gsl_vector_long.h>}
{$include <gsl/gsl_matrix_long.h>}
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
   * workspace of size MAX(size1,size2)*MAX(sizeof(long),sizeof(int))
   * used in various routines
    }
{ sparse storage type  }
{ GSL_SPMATRIX_FLG_xxx  }
type
  Pgsl_spmatrix_long = ^Tgsl_spmatrix_long;
  Tgsl_spmatrix_long = record
      size1 : Tsize_t;
      size2 : Tsize_t;
      i : Plongint;
      data : Plongint;
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
            2 : ( work_atomic : Plongint );
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

function gsl_spmatrix_long_alloc(n1:Tsize_t; n2:Tsize_t):Pgsl_spmatrix_long;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_spmatrix_long_alloc_nzmax(n1:Tsize_t; n2:Tsize_t; nzmax:Tsize_t; sptype:longint):Pgsl_spmatrix_long;cdecl;external;
procedure gsl_spmatrix_long_free(m:Pgsl_spmatrix_long);cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_long_realloc(nzmax:Tsize_t; m:Pgsl_spmatrix_long):longint;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_long_nnz(m:Pgsl_spmatrix_long):Tsize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_spmatrix_long_type(m:Pgsl_spmatrix_long):Pchar;cdecl;external;
function gsl_spmatrix_long_set_zero(m:Pgsl_spmatrix_long):longint;cdecl;external;
function gsl_spmatrix_long_tree_rebuild(m:Pgsl_spmatrix_long):longint;cdecl;external;
{ compress  }
(* Const before type ignored *)
function gsl_spmatrix_long_csc(dest:Pgsl_spmatrix_long; src:Pgsl_spmatrix_long):longint;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_long_csr(dest:Pgsl_spmatrix_long; src:Pgsl_spmatrix_long):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_spmatrix_long_compress(src:Pgsl_spmatrix_long; sptype:longint):Pgsl_spmatrix_long;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_long_compcol(src:Pgsl_spmatrix_long):Pgsl_spmatrix_long;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_long_ccs(src:Pgsl_spmatrix_long):Pgsl_spmatrix_long;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_long_crs(src:Pgsl_spmatrix_long):Pgsl_spmatrix_long;cdecl;external;
{ copy  }
(* Const before type ignored *)
function gsl_spmatrix_long_memcpy(dest:Pgsl_spmatrix_long; src:Pgsl_spmatrix_long):longint;cdecl;external;
{ file I/O  }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_spmatrix_long_fprintf(stream:PFILE; m:Pgsl_spmatrix_long; format:Pchar):longint;cdecl;external;
function gsl_spmatrix_long_fscanf(stream:PFILE):Pgsl_spmatrix_long;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_long_fwrite(stream:PFILE; m:Pgsl_spmatrix_long):longint;cdecl;external;
function gsl_spmatrix_long_fread(stream:PFILE; m:Pgsl_spmatrix_long):longint;cdecl;external;
{ get/set  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_spmatrix_long_get(m:Pgsl_spmatrix_long; i:Tsize_t; j:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_spmatrix_long_set(m:Pgsl_spmatrix_long; i:Tsize_t; j:Tsize_t; x:longint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_spmatrix_long_ptr(m:Pgsl_spmatrix_long; i:Tsize_t; j:Tsize_t):Plongint;cdecl;external;
{ minmax  }
(* Const before type ignored *)
function gsl_spmatrix_long_minmax(m:Pgsl_spmatrix_long; min_out:Plongint; max_out:Plongint):longint;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_long_min_index(m:Pgsl_spmatrix_long; imin_out:Psize_t; jmin_out:Psize_t):longint;cdecl;external;
{ operations  }
(* Const before type ignored *)
function gsl_spmatrix_long_scale(m:Pgsl_spmatrix_long; x:longint):longint;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_long_scale_columns(m:Pgsl_spmatrix_long; x:Pgsl_vector_long):longint;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_long_scale_rows(m:Pgsl_spmatrix_long; x:Pgsl_vector_long):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_spmatrix_long_add(c:Pgsl_spmatrix_long; a:Pgsl_spmatrix_long; b:Pgsl_spmatrix_long):longint;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_long_dense_add(a:Pgsl_matrix_long; b:Pgsl_spmatrix_long):longint;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_long_dense_sub(a:Pgsl_matrix_long; b:Pgsl_spmatrix_long):longint;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_long_d2sp(T:Pgsl_spmatrix_long; A:Pgsl_matrix_long):longint;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_long_sp2d(A:Pgsl_matrix_long; S:Pgsl_spmatrix_long):longint;cdecl;external;
{$ifndef GSL_DISABLE_DEPRECATED}
(* Const before type ignored *)

function gsl_spmatrix_long_add_to_dense(a:Pgsl_matrix_long; b:Pgsl_spmatrix_long):longint;cdecl;external;
{$endif}
{ properties  }
(* Const before type ignored *)
(* Const before type ignored *)

function gsl_spmatrix_long_equal(a:Pgsl_spmatrix_long; b:Pgsl_spmatrix_long):longint;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_long_norm1(a:Pgsl_spmatrix_long):longint;cdecl;external;
{ swap  }
function gsl_spmatrix_long_transpose(m:Pgsl_spmatrix_long):longint;cdecl;external;
function gsl_spmatrix_long_transpose2(m:Pgsl_spmatrix_long):longint;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_long_transpose_memcpy(dest:Pgsl_spmatrix_long; src:Pgsl_spmatrix_long):longint;cdecl;external;
{$endif}
{ __GSL_SPMATRIX_LONG_H__  }

implementation


end.
