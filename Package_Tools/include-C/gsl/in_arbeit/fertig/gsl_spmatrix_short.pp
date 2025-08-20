
unit gsl_spmatrix_short;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_spmatrix_short.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_spmatrix_short.h
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
Pgsl_matrix_short  = ^gsl_matrix_short;
Pgsl_spmatrix_pool  = ^gsl_spmatrix_pool;
Pgsl_spmatrix_short  = ^gsl_spmatrix_short;
Pgsl_vector_short  = ^gsl_vector_short;
Plongint  = ^longint;
Psize_t  = ^size_t;
Psmallint  = ^smallint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ spmatrix/gsl_spmatrix_short.h
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
{$ifndef __GSL_SPMATRIX_SHORT_H__}
{$define __GSL_SPMATRIX_SHORT_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_math.h>}
{$include <gsl/gsl_bst.h>}
{$include <gsl/gsl_vector_short.h>}
{$include <gsl/gsl_matrix_short.h>}
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
   * workspace of size MAX(size1,size2)*MAX(sizeof(short),sizeof(int))
   * used in various routines
    }
{ sparse storage type  }
{ GSL_SPMATRIX_FLG_xxx  }
type
  Pgsl_spmatrix_short = ^Tgsl_spmatrix_short;
  Tgsl_spmatrix_short = record
      size1 : Tsize_t;
      size2 : Tsize_t;
      i : Plongint;
      data : Psmallint;
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
            2 : ( work_atomic : Psmallint );
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

function gsl_spmatrix_short_alloc(n1:Tsize_t; n2:Tsize_t):Pgsl_spmatrix_short;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_spmatrix_short_alloc_nzmax(n1:Tsize_t; n2:Tsize_t; nzmax:Tsize_t; sptype:longint):Pgsl_spmatrix_short;cdecl;external;
procedure gsl_spmatrix_short_free(m:Pgsl_spmatrix_short);cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_short_realloc(nzmax:Tsize_t; m:Pgsl_spmatrix_short):longint;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_short_nnz(m:Pgsl_spmatrix_short):Tsize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_spmatrix_short_type(m:Pgsl_spmatrix_short):Pchar;cdecl;external;
function gsl_spmatrix_short_set_zero(m:Pgsl_spmatrix_short):longint;cdecl;external;
function gsl_spmatrix_short_tree_rebuild(m:Pgsl_spmatrix_short):longint;cdecl;external;
{ compress  }
(* Const before type ignored *)
function gsl_spmatrix_short_csc(dest:Pgsl_spmatrix_short; src:Pgsl_spmatrix_short):longint;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_short_csr(dest:Pgsl_spmatrix_short; src:Pgsl_spmatrix_short):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_spmatrix_short_compress(src:Pgsl_spmatrix_short; sptype:longint):Pgsl_spmatrix_short;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_short_compcol(src:Pgsl_spmatrix_short):Pgsl_spmatrix_short;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_short_ccs(src:Pgsl_spmatrix_short):Pgsl_spmatrix_short;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_short_crs(src:Pgsl_spmatrix_short):Pgsl_spmatrix_short;cdecl;external;
{ copy  }
(* Const before type ignored *)
function gsl_spmatrix_short_memcpy(dest:Pgsl_spmatrix_short; src:Pgsl_spmatrix_short):longint;cdecl;external;
{ file I/O  }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_spmatrix_short_fprintf(stream:PFILE; m:Pgsl_spmatrix_short; format:Pchar):longint;cdecl;external;
function gsl_spmatrix_short_fscanf(stream:PFILE):Pgsl_spmatrix_short;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_short_fwrite(stream:PFILE; m:Pgsl_spmatrix_short):longint;cdecl;external;
function gsl_spmatrix_short_fread(stream:PFILE; m:Pgsl_spmatrix_short):longint;cdecl;external;
{ get/set  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_spmatrix_short_get(m:Pgsl_spmatrix_short; i:Tsize_t; j:Tsize_t):smallint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_spmatrix_short_set(m:Pgsl_spmatrix_short; i:Tsize_t; j:Tsize_t; x:smallint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_spmatrix_short_ptr(m:Pgsl_spmatrix_short; i:Tsize_t; j:Tsize_t):Psmallint;cdecl;external;
{ minmax  }
(* Const before type ignored *)
function gsl_spmatrix_short_minmax(m:Pgsl_spmatrix_short; min_out:Psmallint; max_out:Psmallint):longint;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_short_min_index(m:Pgsl_spmatrix_short; imin_out:Psize_t; jmin_out:Psize_t):longint;cdecl;external;
{ operations  }
(* Const before type ignored *)
function gsl_spmatrix_short_scale(m:Pgsl_spmatrix_short; x:smallint):longint;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_short_scale_columns(m:Pgsl_spmatrix_short; x:Pgsl_vector_short):longint;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_short_scale_rows(m:Pgsl_spmatrix_short; x:Pgsl_vector_short):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_spmatrix_short_add(c:Pgsl_spmatrix_short; a:Pgsl_spmatrix_short; b:Pgsl_spmatrix_short):longint;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_short_dense_add(a:Pgsl_matrix_short; b:Pgsl_spmatrix_short):longint;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_short_dense_sub(a:Pgsl_matrix_short; b:Pgsl_spmatrix_short):longint;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_short_d2sp(T:Pgsl_spmatrix_short; A:Pgsl_matrix_short):longint;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_short_sp2d(A:Pgsl_matrix_short; S:Pgsl_spmatrix_short):longint;cdecl;external;
{$ifndef GSL_DISABLE_DEPRECATED}
(* Const before type ignored *)

function gsl_spmatrix_short_add_to_dense(a:Pgsl_matrix_short; b:Pgsl_spmatrix_short):longint;cdecl;external;
{$endif}
{ properties  }
(* Const before type ignored *)
(* Const before type ignored *)

function gsl_spmatrix_short_equal(a:Pgsl_spmatrix_short; b:Pgsl_spmatrix_short):longint;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_short_norm1(a:Pgsl_spmatrix_short):smallint;cdecl;external;
{ swap  }
function gsl_spmatrix_short_transpose(m:Pgsl_spmatrix_short):longint;cdecl;external;
function gsl_spmatrix_short_transpose2(m:Pgsl_spmatrix_short):longint;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_short_transpose_memcpy(dest:Pgsl_spmatrix_short; src:Pgsl_spmatrix_short):longint;cdecl;external;
{$endif}
{ __GSL_SPMATRIX_SHORT_H__  }

implementation


end.
