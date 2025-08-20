unit gsl_spmatrix_int;

interface

uses
  fp_gsl;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ spmatrix/gsl_spmatrix_int.h
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
{$ifndef __GSL_SPMATRIX_INT_H__}
{$define __GSL_SPMATRIX_INT_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_math.h>}
{$include <gsl/gsl_bst.h>}
{$include <gsl/gsl_vector_int.h>}
{$include <gsl/gsl_matrix_int.h>}
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
   * workspace of size MAX(size1,size2)*MAX(sizeof(int),sizeof(int))
   * used in various routines
    }
{ sparse storage type  }
{ GSL_SPMATRIX_FLG_xxx  }
type
  Pgsl_spmatrix_int = ^Tgsl_spmatrix_int;
  Tgsl_spmatrix_int = record
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

function gsl_spmatrix_int_alloc(n1:Tsize_t; n2:Tsize_t):Pgsl_spmatrix_int;cdecl;external libgsl;
function gsl_spmatrix_int_alloc_nzmax(n1:Tsize_t; n2:Tsize_t; nzmax:Tsize_t; sptype:longint):Pgsl_spmatrix_int;cdecl;external libgsl;
procedure gsl_spmatrix_int_free(m:Pgsl_spmatrix_int);cdecl;external libgsl;
function gsl_spmatrix_int_realloc(nzmax:Tsize_t; m:Pgsl_spmatrix_int):longint;cdecl;external libgsl;
function gsl_spmatrix_int_nnz(m:Pgsl_spmatrix_int):Tsize_t;cdecl;external libgsl;
function gsl_spmatrix_int_type(m:Pgsl_spmatrix_int):Pchar;cdecl;external libgsl;
function gsl_spmatrix_int_set_zero(m:Pgsl_spmatrix_int):longint;cdecl;external libgsl;
function gsl_spmatrix_int_tree_rebuild(m:Pgsl_spmatrix_int):longint;cdecl;external libgsl;
{ compress  }
function gsl_spmatrix_int_csc(dest:Pgsl_spmatrix_int; src:Pgsl_spmatrix_int):longint;cdecl;external libgsl;
function gsl_spmatrix_int_csr(dest:Pgsl_spmatrix_int; src:Pgsl_spmatrix_int):longint;cdecl;external libgsl;
function gsl_spmatrix_int_compress(src:Pgsl_spmatrix_int; sptype:longint):Pgsl_spmatrix_int;cdecl;external libgsl;
function gsl_spmatrix_int_compcol(src:Pgsl_spmatrix_int):Pgsl_spmatrix_int;cdecl;external libgsl;
function gsl_spmatrix_int_ccs(src:Pgsl_spmatrix_int):Pgsl_spmatrix_int;cdecl;external libgsl;
function gsl_spmatrix_int_crs(src:Pgsl_spmatrix_int):Pgsl_spmatrix_int;cdecl;external libgsl;
{ copy  }
function gsl_spmatrix_int_memcpy(dest:Pgsl_spmatrix_int; src:Pgsl_spmatrix_int):longint;cdecl;external libgsl;
{ file I/O  }
function gsl_spmatrix_int_fprintf(stream:PFILE; m:Pgsl_spmatrix_int; format:Pchar):longint;cdecl;external libgsl;
function gsl_spmatrix_int_fscanf(stream:PFILE):Pgsl_spmatrix_int;cdecl;external libgsl;
function gsl_spmatrix_int_fwrite(stream:PFILE; m:Pgsl_spmatrix_int):longint;cdecl;external libgsl;
function gsl_spmatrix_int_fread(stream:PFILE; m:Pgsl_spmatrix_int):longint;cdecl;external libgsl;
{ get/set  }
function gsl_spmatrix_int_get(m:Pgsl_spmatrix_int; i:Tsize_t; j:Tsize_t):longint;cdecl;external libgsl;
function gsl_spmatrix_int_set(m:Pgsl_spmatrix_int; i:Tsize_t; j:Tsize_t; x:longint):longint;cdecl;external libgsl;
function gsl_spmatrix_int_ptr(m:Pgsl_spmatrix_int; i:Tsize_t; j:Tsize_t):Plongint;cdecl;external libgsl;
{ minmax  }
function gsl_spmatrix_int_minmax(m:Pgsl_spmatrix_int; min_out:Plongint; max_out:Plongint):longint;cdecl;external libgsl;
function gsl_spmatrix_int_min_index(m:Pgsl_spmatrix_int; imin_out:Psize_t; jmin_out:Psize_t):longint;cdecl;external libgsl;
{ operations  }
function gsl_spmatrix_int_scale(m:Pgsl_spmatrix_int; x:longint):longint;cdecl;external libgsl;
function gsl_spmatrix_int_scale_columns(m:Pgsl_spmatrix_int; x:Pgsl_vector_int):longint;cdecl;external libgsl;
function gsl_spmatrix_int_scale_rows(m:Pgsl_spmatrix_int; x:Pgsl_vector_int):longint;cdecl;external libgsl;
function gsl_spmatrix_int_add(c:Pgsl_spmatrix_int; a:Pgsl_spmatrix_int; b:Pgsl_spmatrix_int):longint;cdecl;external libgsl;
function gsl_spmatrix_int_dense_add(a:Pgsl_matrix_int; b:Pgsl_spmatrix_int):longint;cdecl;external libgsl;
function gsl_spmatrix_int_dense_sub(a:Pgsl_matrix_int; b:Pgsl_spmatrix_int):longint;cdecl;external libgsl;
function gsl_spmatrix_int_d2sp(T:Pgsl_spmatrix_int; A:Pgsl_matrix_int):longint;cdecl;external libgsl;
function gsl_spmatrix_int_sp2d(A:Pgsl_matrix_int; S:Pgsl_spmatrix_int):longint;cdecl;external libgsl;
{$ifndef GSL_DISABLE_DEPRECATED}

function gsl_spmatrix_int_add_to_dense(a:Pgsl_matrix_int; b:Pgsl_spmatrix_int):longint;cdecl;external libgsl;
{$endif}
{ properties  }

function gsl_spmatrix_int_equal(a:Pgsl_spmatrix_int; b:Pgsl_spmatrix_int):longint;cdecl;external libgsl;
function gsl_spmatrix_int_norm1(a:Pgsl_spmatrix_int):longint;cdecl;external libgsl;
{ swap  }
function gsl_spmatrix_int_transpose(m:Pgsl_spmatrix_int):longint;cdecl;external libgsl;
function gsl_spmatrix_int_transpose2(m:Pgsl_spmatrix_int):longint;cdecl;external libgsl;
function gsl_spmatrix_int_transpose_memcpy(dest:Pgsl_spmatrix_int; src:Pgsl_spmatrix_int):longint;cdecl;external libgsl;
{$endif}
{ __GSL_SPMATRIX_INT_H__  }

// === Konventiert am: 20-8-25 17:34:08 ===


implementation



end.
