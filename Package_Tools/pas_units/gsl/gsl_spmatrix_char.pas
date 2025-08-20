unit gsl_spmatrix_char;

interface

uses
  fp_gsl;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ spmatrix/gsl_spmatrix_char.h
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
{$ifndef __GSL_SPMATRIX_CHAR_H__}
{$define __GSL_SPMATRIX_CHAR_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_math.h>}
{$include <gsl/gsl_bst.h>}
{$include <gsl/gsl_vector_char.h>}
{$include <gsl/gsl_matrix_char.h>}
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
   * workspace of size MAX(size1,size2)*MAX(sizeof(char),sizeof(int))
   * used in various routines
    }
{ sparse storage type  }
{ GSL_SPMATRIX_FLG_xxx  }
type
  Pgsl_spmatrix_char = ^Tgsl_spmatrix_char;
  Tgsl_spmatrix_char = record
      size1 : Tsize_t;
      size2 : Tsize_t;
      i : Plongint;
      data : Pchar;
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
            2 : ( work_atomic : Pchar );
          end;
      sptype : longint;
      spflags : Tsize_t;
    end;
{
 * Prototypes
  }
{ allocation / initialization  }

function gsl_spmatrix_char_alloc(n1:Tsize_t; n2:Tsize_t):Pgsl_spmatrix_char;cdecl;external libgsl;
function gsl_spmatrix_char_alloc_nzmax(n1:Tsize_t; n2:Tsize_t; nzmax:Tsize_t; sptype:longint):Pgsl_spmatrix_char;cdecl;external libgsl;
procedure gsl_spmatrix_char_free(m:Pgsl_spmatrix_char);cdecl;external libgsl;
function gsl_spmatrix_char_realloc(nzmax:Tsize_t; m:Pgsl_spmatrix_char):longint;cdecl;external libgsl;
function gsl_spmatrix_char_nnz(m:Pgsl_spmatrix_char):Tsize_t;cdecl;external libgsl;
function gsl_spmatrix_char_type(m:Pgsl_spmatrix_char):Pchar;cdecl;external libgsl;
function gsl_spmatrix_char_set_zero(m:Pgsl_spmatrix_char):longint;cdecl;external libgsl;
function gsl_spmatrix_char_tree_rebuild(m:Pgsl_spmatrix_char):longint;cdecl;external libgsl;
{ compress  }
function gsl_spmatrix_char_csc(dest:Pgsl_spmatrix_char; src:Pgsl_spmatrix_char):longint;cdecl;external libgsl;
function gsl_spmatrix_char_csr(dest:Pgsl_spmatrix_char; src:Pgsl_spmatrix_char):longint;cdecl;external libgsl;
function gsl_spmatrix_char_compress(src:Pgsl_spmatrix_char; sptype:longint):Pgsl_spmatrix_char;cdecl;external libgsl;
function gsl_spmatrix_char_compcol(src:Pgsl_spmatrix_char):Pgsl_spmatrix_char;cdecl;external libgsl;
function gsl_spmatrix_char_ccs(src:Pgsl_spmatrix_char):Pgsl_spmatrix_char;cdecl;external libgsl;
function gsl_spmatrix_char_crs(src:Pgsl_spmatrix_char):Pgsl_spmatrix_char;cdecl;external libgsl;
{ copy  }
function gsl_spmatrix_char_memcpy(dest:Pgsl_spmatrix_char; src:Pgsl_spmatrix_char):longint;cdecl;external libgsl;
{ file I/O  }
function gsl_spmatrix_char_fprintf(stream:PFILE; m:Pgsl_spmatrix_char; format:Pchar):longint;cdecl;external libgsl;
function gsl_spmatrix_char_fscanf(stream:PFILE):Pgsl_spmatrix_char;cdecl;external libgsl;
function gsl_spmatrix_char_fwrite(stream:PFILE; m:Pgsl_spmatrix_char):longint;cdecl;external libgsl;
function gsl_spmatrix_char_fread(stream:PFILE; m:Pgsl_spmatrix_char):longint;cdecl;external libgsl;
{ get/set  }
function gsl_spmatrix_char_get(m:Pgsl_spmatrix_char; i:Tsize_t; j:Tsize_t):char;cdecl;external libgsl;
function gsl_spmatrix_char_set(m:Pgsl_spmatrix_char; i:Tsize_t; j:Tsize_t; x:char):longint;cdecl;external libgsl;
function gsl_spmatrix_char_ptr(m:Pgsl_spmatrix_char; i:Tsize_t; j:Tsize_t):Pchar;cdecl;external libgsl;
{ minmax  }
function gsl_spmatrix_char_minmax(m:Pgsl_spmatrix_char; min_out:Pchar; max_out:Pchar):longint;cdecl;external libgsl;
function gsl_spmatrix_char_min_index(m:Pgsl_spmatrix_char; imin_out:Psize_t; jmin_out:Psize_t):longint;cdecl;external libgsl;
{ operations  }
function gsl_spmatrix_char_scale(m:Pgsl_spmatrix_char; x:char):longint;cdecl;external libgsl;
function gsl_spmatrix_char_scale_columns(m:Pgsl_spmatrix_char; x:Pgsl_vector_char):longint;cdecl;external libgsl;
function gsl_spmatrix_char_scale_rows(m:Pgsl_spmatrix_char; x:Pgsl_vector_char):longint;cdecl;external libgsl;
function gsl_spmatrix_char_add(c:Pgsl_spmatrix_char; a:Pgsl_spmatrix_char; b:Pgsl_spmatrix_char):longint;cdecl;external libgsl;
function gsl_spmatrix_char_dense_add(a:Pgsl_matrix_char; b:Pgsl_spmatrix_char):longint;cdecl;external libgsl;
function gsl_spmatrix_char_dense_sub(a:Pgsl_matrix_char; b:Pgsl_spmatrix_char):longint;cdecl;external libgsl;
function gsl_spmatrix_char_d2sp(T:Pgsl_spmatrix_char; A:Pgsl_matrix_char):longint;cdecl;external libgsl;
function gsl_spmatrix_char_sp2d(A:Pgsl_matrix_char; S:Pgsl_spmatrix_char):longint;cdecl;external libgsl;
{$ifndef GSL_DISABLE_DEPRECATED}

function gsl_spmatrix_char_add_to_dense(a:Pgsl_matrix_char; b:Pgsl_spmatrix_char):longint;cdecl;external libgsl;
{$endif}
{ properties  }

function gsl_spmatrix_char_equal(a:Pgsl_spmatrix_char; b:Pgsl_spmatrix_char):longint;cdecl;external libgsl;
function gsl_spmatrix_char_norm1(a:Pgsl_spmatrix_char):char;cdecl;external libgsl;
{ swap  }
function gsl_spmatrix_char_transpose(m:Pgsl_spmatrix_char):longint;cdecl;external libgsl;
function gsl_spmatrix_char_transpose2(m:Pgsl_spmatrix_char):longint;cdecl;external libgsl;
function gsl_spmatrix_char_transpose_memcpy(dest:Pgsl_spmatrix_char; src:Pgsl_spmatrix_char):longint;cdecl;external libgsl;
{$endif}
{ __GSL_SPMATRIX_CHAR_H__  }

// === Konventiert am: 20-8-25 17:32:51 ===


implementation



end.
