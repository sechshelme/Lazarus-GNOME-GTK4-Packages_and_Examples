
unit gsl_spmatrix_ulong;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_spmatrix_ulong.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_spmatrix_ulong.h
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
Pdword  = ^dword;
PFILE  = ^FILE;
Pgsl_bst_workspace  = ^gsl_bst_workspace;
Pgsl_matrix_ulong  = ^gsl_matrix_ulong;
Pgsl_spmatrix_pool  = ^gsl_spmatrix_pool;
Pgsl_spmatrix_ulong  = ^gsl_spmatrix_ulong;
Pgsl_vector_ulong  = ^gsl_vector_ulong;
Plongint  = ^longint;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ spmatrix/gsl_spmatrix_ulong.h
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
{$ifndef __GSL_SPMATRIX_ULONG_H__}
{$define __GSL_SPMATRIX_ULONG_H__}
{$include <stdlib.h>}
{$include <gsl/gsl_math.h>}
{$include <gsl/gsl_bst.h>}
{$include <gsl/gsl_vector_ulong.h>}
{$include <gsl/gsl_matrix_ulong.h>}
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
   * workspace of size MAX(size1,size2)*MAX(sizeof(unsigned long),sizeof(int))
   * used in various routines
    }
{ sparse storage type  }
{ GSL_SPMATRIX_FLG_xxx  }
type
  Pgsl_spmatrix_ulong = ^Tgsl_spmatrix_ulong;
  Tgsl_spmatrix_ulong = record
      size1 : Tsize_t;
      size2 : Tsize_t;
      i : Plongint;
      data : Pdword;
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
            2 : ( work_atomic : Pdword );
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

function gsl_spmatrix_ulong_alloc(n1:Tsize_t; n2:Tsize_t):Pgsl_spmatrix_ulong;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_spmatrix_ulong_alloc_nzmax(n1:Tsize_t; n2:Tsize_t; nzmax:Tsize_t; sptype:longint):Pgsl_spmatrix_ulong;cdecl;external;
procedure gsl_spmatrix_ulong_free(m:Pgsl_spmatrix_ulong);cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_ulong_realloc(nzmax:Tsize_t; m:Pgsl_spmatrix_ulong):longint;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_ulong_nnz(m:Pgsl_spmatrix_ulong):Tsize_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_spmatrix_ulong_type(m:Pgsl_spmatrix_ulong):Pchar;cdecl;external;
function gsl_spmatrix_ulong_set_zero(m:Pgsl_spmatrix_ulong):longint;cdecl;external;
function gsl_spmatrix_ulong_tree_rebuild(m:Pgsl_spmatrix_ulong):longint;cdecl;external;
{ compress  }
(* Const before type ignored *)
function gsl_spmatrix_ulong_csc(dest:Pgsl_spmatrix_ulong; src:Pgsl_spmatrix_ulong):longint;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_ulong_csr(dest:Pgsl_spmatrix_ulong; src:Pgsl_spmatrix_ulong):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_spmatrix_ulong_compress(src:Pgsl_spmatrix_ulong; sptype:longint):Pgsl_spmatrix_ulong;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_ulong_compcol(src:Pgsl_spmatrix_ulong):Pgsl_spmatrix_ulong;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_ulong_ccs(src:Pgsl_spmatrix_ulong):Pgsl_spmatrix_ulong;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_ulong_crs(src:Pgsl_spmatrix_ulong):Pgsl_spmatrix_ulong;cdecl;external;
{ copy  }
(* Const before type ignored *)
function gsl_spmatrix_ulong_memcpy(dest:Pgsl_spmatrix_ulong; src:Pgsl_spmatrix_ulong):longint;cdecl;external;
{ file I/O  }
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_spmatrix_ulong_fprintf(stream:PFILE; m:Pgsl_spmatrix_ulong; format:Pchar):longint;cdecl;external;
function gsl_spmatrix_ulong_fscanf(stream:PFILE):Pgsl_spmatrix_ulong;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_ulong_fwrite(stream:PFILE; m:Pgsl_spmatrix_ulong):longint;cdecl;external;
function gsl_spmatrix_ulong_fread(stream:PFILE; m:Pgsl_spmatrix_ulong):longint;cdecl;external;
{ get/set  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_spmatrix_ulong_get(m:Pgsl_spmatrix_ulong; i:Tsize_t; j:Tsize_t):dword;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_spmatrix_ulong_set(m:Pgsl_spmatrix_ulong; i:Tsize_t; j:Tsize_t; x:dword):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_spmatrix_ulong_ptr(m:Pgsl_spmatrix_ulong; i:Tsize_t; j:Tsize_t):Pdword;cdecl;external;
{ minmax  }
(* Const before type ignored *)
function gsl_spmatrix_ulong_minmax(m:Pgsl_spmatrix_ulong; min_out:Pdword; max_out:Pdword):longint;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_ulong_min_index(m:Pgsl_spmatrix_ulong; imin_out:Psize_t; jmin_out:Psize_t):longint;cdecl;external;
{ operations  }
(* Const before type ignored *)
function gsl_spmatrix_ulong_scale(m:Pgsl_spmatrix_ulong; x:dword):longint;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_ulong_scale_columns(m:Pgsl_spmatrix_ulong; x:Pgsl_vector_ulong):longint;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_ulong_scale_rows(m:Pgsl_spmatrix_ulong; x:Pgsl_vector_ulong):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gsl_spmatrix_ulong_add(c:Pgsl_spmatrix_ulong; a:Pgsl_spmatrix_ulong; b:Pgsl_spmatrix_ulong):longint;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_ulong_dense_add(a:Pgsl_matrix_ulong; b:Pgsl_spmatrix_ulong):longint;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_ulong_dense_sub(a:Pgsl_matrix_ulong; b:Pgsl_spmatrix_ulong):longint;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_ulong_d2sp(T:Pgsl_spmatrix_ulong; A:Pgsl_matrix_ulong):longint;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_ulong_sp2d(A:Pgsl_matrix_ulong; S:Pgsl_spmatrix_ulong):longint;cdecl;external;
{$ifndef GSL_DISABLE_DEPRECATED}
(* Const before type ignored *)

function gsl_spmatrix_ulong_add_to_dense(a:Pgsl_matrix_ulong; b:Pgsl_spmatrix_ulong):longint;cdecl;external;
{$endif}
{ properties  }
(* Const before type ignored *)
(* Const before type ignored *)

function gsl_spmatrix_ulong_equal(a:Pgsl_spmatrix_ulong; b:Pgsl_spmatrix_ulong):longint;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_ulong_norm1(a:Pgsl_spmatrix_ulong):dword;cdecl;external;
{ swap  }
function gsl_spmatrix_ulong_transpose(m:Pgsl_spmatrix_ulong):longint;cdecl;external;
function gsl_spmatrix_ulong_transpose2(m:Pgsl_spmatrix_ulong):longint;cdecl;external;
(* Const before type ignored *)
function gsl_spmatrix_ulong_transpose_memcpy(dest:Pgsl_spmatrix_ulong; src:Pgsl_spmatrix_ulong):longint;cdecl;external;
{$endif}
{ __GSL_SPMATRIX_ULONG_H__  }

implementation


end.
