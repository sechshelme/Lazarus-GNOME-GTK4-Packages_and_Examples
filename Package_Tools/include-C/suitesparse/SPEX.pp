
unit SPEX;
interface

{
  Automatically converted by H2Pas 1.0.0 from SPEX.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    SPEX.h
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
Pbool  = ^bool;
Pchar  = ^char;
Pdouble  = ^double;
PFILE  = ^FILE;
Pint64_t  = ^int64_t;
Plongint  = ^longint;
Pmpfr_t  = ^mpfr_t;
Pmpq_t  = ^mpq_t;
Pmpz_t  = ^mpz_t;
Psize_t  = ^size_t;
PSPEX_col_order  = ^SPEX_col_order;
PSPEX_info  = ^SPEX_info;
PSPEX_kind  = ^SPEX_kind;
PSPEX_LU_analysis  = ^SPEX_LU_analysis;
PSPEX_matrix  = ^SPEX_matrix;
PSPEX_options  = ^SPEX_options;
PSPEX_pivot  = ^SPEX_pivot;
PSPEX_type  = ^SPEX_type;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{------------------------------------------------------------------------------ }
{ SPEX_Left_LU/Include/SPEX.h: user #include file for SPEX_Left_LU. }
{------------------------------------------------------------------------------ }
{ SPEX_Left_LU: (c) 2019-2023, Chris Lourenco (US Naval Academy), Jinhao Chen, }
{ Erick Moreno-Centeno, Timothy A. Davis, Texas A&M.  All Rights Reserved. }
{ SPDX-License-Identifier: GPL-2.0-or-later or LGPL-3.0-or-later }
{------------------------------------------------------------------------------ }
{$ifndef SPEX_LEFT_LU_H}
{$define SPEX_LEFT_LU_H}
{ This software package exactly solves a sparse system of linear equations }
{ using the SPEX Left LU factorization. This code accompanies the paper (submitted }
{ to ACM Transactions on Mathematical Software): }
{    "Algorithm 1021: SPEX Left LU: Exactly Solving Sparse Linear Systems via }
{    A Sparse Left-Looking Integer-Preserving LU Factorization", C. Lourenco, }
{    J. Chen, E. Moreno-Centeno, T. Davis, ACM Trans. Mathematical Software, }
{    June 2022. https://doi.org/10.1145/3519024 }
{    The theory associated with this software can be found in the paper }
{    (published in SIAM journal on matrix analysis and applications): }
{    "Exact Solution of Sparse Linear Systems via Left-Looking }
{     Roundoff-Error-Free LU Factorization in Time Proportional to }
{     Arithmetic Work", C. Lourenco, A. R. Escobedo, E. Moreno-Centeno, }
{     T. Davis, SIAM J. Matrix Analysis and Applications.  pp 609-638, }
{     vol 40, no 2, 2019. }
{    If you use this code, you must first download and install the GMP and }
{    MPFR libraries. GMP and MPFR can be found at: }
{              https://gmplib.org/ }
{              http://www.mpfr.org/ }
{    If you use SPEX Left LU for a publication, we request that you please cite }
{    the above two papers. }
{------------------------------------------------------------------------------ }
{------------------------------------------------------------------------------ }
{-------------------------Authors---------------------------------------------- }
{------------------------------------------------------------------------------ }
{------------------------------------------------------------------------------ }
{    Christopher Lourenco, Jinhao Chen, Erick Moreno-Centeno, and Timothy Davis }
{ }
{------------------------------------------------------------------------------ }
{------------------------------------------------------------------------------ }
{-------------------------Contact Information---------------------------------- }
{------------------------------------------------------------------------------ }
{------------------------------------------------------------------------------ }
{    Please contact Chris Lourenco (chrisjlourenco@gmail.com) }
{    or Tim Davis (timdavis@aldenmath.com, DrTimothyAldenDavis@gmail.com, }
{                  davis@tamu.edu) }
{------------------------------------------------------------------------------ }
{------------------------------------------------------------------------------ }
{-------------------------Copyright-------------------------------------------- }
{------------------------------------------------------------------------------ }
{------------------------------------------------------------------------------ }
{    SPEX Left LU is free software; you can redistribute it and/or modify }
{     it under the terms of either: }
{ }
{        * the GNU Lesser General Public License as published by the }
{          Free Software Foundation; either version 3 of the License, }
{          or (at your option) any later version. }
{ }
{     or }
{ }
{        * the GNU General Public License as published by the Free Software }
{          Foundation; either version 2 of the License, or (at your option) any }
{          later version. }
{ }
{    or both in parallel, as here. }
{ }
{    See license.txt for license info. }
{ }
{ This software is copyright by Christopher Lourenco, Jinhao Chen, Erick }
{ Moreno-Centeno and Timothy A. Davis. All Rights Reserved. }
{ }
{------------------------------------------------------------------------------ }
{------------------------------------------------------------------------------ }
{---------------------------DISCLAIMER----------------------------------------- }
{------------------------------------------------------------------------------ }
{------------------------------------------------------------------------------ }
{ SPEX Left LU is distributed in the hope that it will be useful, but }
{ WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY }
{ or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License }
{ for more details. }
{------------------------------------------------------------------------------ }
{------------------------------------------------------------------------------ }
{--------------------------Summary--------------------------------------------- }
{------------------------------------------------------------------------------ }
{------------------------------------------------------------------------------ }
{    This software package solves the linear system Ax = b exactly. The input }
{    matrix and right hand side vectors are stored as either integers, double }
{    precision numbers, multiple precision floating points (through the mpfr }
{    library) or as rational numbers (as a collection of numerators and }
{    denominators using the GMP mpq_t data structure). Appropriate routines }
{    within the code transform the input into an integral matrix in compressed }
{    column form. }
{    This package computes the factorization PAQ = LDU. Note that we store the }
{    "functional" form of the factorization by only storing L and U. The user }
{    is given some freedom to select the permutation matrices P and Q. The }
{    recommended default settings select Q using the COLAMD column ordering }
{    and select P via a partial pivoting scheme in which the diagonal entry }
{    in column k is selected if it is the same magnitude as the smallest }
{    entry, otherwise the smallest entry is selected as the kth pivot. }
{    Alternative strategies allowed to select Q include the AMD column }
{    ordering or no column permutation (Q=I).  For pivots, there are a variety }
{    of potential schemes including traditional partial pivoting, diagonal }
{    pivoting, tolerance pivoting etc. This package does not allow pivoting }
{    based on sparsity criterion. }
{    The factors L and U are computed via integer preserving operations via }
{    integer-preserving Gaussian elimination. The key part of this algorithm }
{    is a Roundoff Error Free (REF) sparse triangular solve function which }
{    exploits sparsity to reduce the number of operations that must be }
{    performed. }
{    Once L and U are computed, a simplified version of the triangular solve }
{    is performed which assumes the vector b is dense. The final solution }
{    vector x is gauranteed to be exact. This vector can be output in one of }
{    three ways: 1) full precision rational arithmetic (as a sequence of }
{    numerators and denominators) using the GMP mpq_t data type, 2) double }
{    precision while not exact will produce a solution accurate to machine }
{    roundoff unless the size of the associated solution exceeds double }
{    precision (i.e., the solution is 10^500 or something), 3) variable }
{    precision floating point using the GMP mpfr_t data type. The associated }
{    precision is user defined. }
{------------------------------------------------------------------------------ }
{------------------------------------------------------------------------------ }
{---------------------Include files required by SPEX Left LU------------------- }
{------------------------------------------------------------------------------ }
{------------------------------------------------------------------------------ }
{$include <stdio.h>}
{$include <stdbool.h>}
{$include <stdint.h>}
{$include <stdlib.h>}
{$include <string.h>}
{$include <gmp.h>}
{$include <mpfr.h>}
{$include "SuiteSparse_config.h"}
{ #include "SPEX_Util.h" }
{------------------------------------------------------------------------------ }
{ SPEX_Util/Include/SPEX_Util.h: Include file for utility functions for SPEX }
{------------------------------------------------------------------------------ }
{ SPEX_Util: (c) 2019-2022, Chris Lourenco (US Naval Academy), Jinhao Chen, }
{ Erick Moreno-Centeno, Timothy A. Davis, Texas A&M.  All Rights Reserved. }
{ SPDX-License-Identifier: GPL-2.0-or-later or LGPL-3.0-or-later }
{------------------------------------------------------------------------------ }
{$ifndef SPEX_UTIL_H}
{$define SPEX_UTIL_H}
{ SPEX_Util is a collection of utility functions for the SParse EXact package. }
{ Included are several routines for memory management, matrix operations, and  }
{ wrappers to the GMP library. }
{ }
{ This is the global include file and should be included in all SPEX_* packages }
{ }
{ }
{------------------------------------------------------------------------------ }
{------------------------------------------------------------------------------ }
{-------------------------Authors---------------------------------------------- }
{------------------------------------------------------------------------------ }
{------------------------------------------------------------------------------ }
{ Unless otherwise noted all Utility functions are authored by: }
{ }
{    Christopher Lourenco, Jinhao Chen, Erick Moreno-Centeno, and Timothy Davis }
{ }
{------------------------------------------------------------------------------ }
{------------------------------------------------------------------------------ }
{-------------------------Contact Information---------------------------------- }
{------------------------------------------------------------------------------ }
{------------------------------------------------------------------------------ }
{    Please contact Chris Lourenco (chrisjlourenco@gmail.com, lourenco@usna.edu) }
{    or Tim Davis (timdavis@aldenmath.com, DrTimothyAldenDavis@gmail.com, }
{                  davis@tamu.edu) }
{------------------------------------------------------------------------------ }
{------------------------------------------------------------------------------ }
{-------------------------Copyright-------------------------------------------- }
{------------------------------------------------------------------------------ }
{------------------------------------------------------------------------------ }
{    SPEX is free software; you can redistribute it and/or modify }
{     it under the terms of either: }
{ }
{        * the GNU Lesser General Public License as published by the }
{          Free Software Foundation; either version 3 of the License, }
{          or (at your option) any later version. }
{ }
{     or }
{ }
{        * the GNU General Public License as published by the Free Software }
{          Foundation; either version 2 of the License, or (at your option) any }
{          later version. }
{ }
{    or both in parallel, as here. }
{ }
{    See license.txt for license info. }
{ }
{ This software is copyright by Christopher Lourenco, Jinhao Chen, Erick }
{ Moreno-Centeno and Timothy A. Davis. All Rights Reserved. }
{ }
{------------------------------------------------------------------------------ }
{------------------------------------------------------------------------------ }
{---------------------------DISCLAIMER----------------------------------------- }
{------------------------------------------------------------------------------ }
{------------------------------------------------------------------------------ }
{ SPEX is distributed in the hope that it will be useful, but }
{ WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY }
{ or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License }
{ for more details. }
{------------------------------------------------------------------------------ }
{------------------------------------------------------------------------------ }
{---------------------Include files required by SPEX -------------------------- }
{------------------------------------------------------------------------------ }
{------------------------------------------------------------------------------ }
{ #include <stdio.h> }
{ #include <stdbool.h> }
{ #include <stdint.h> }
{ #include <stdlib.h> }
{ #include <string.h> }
{ #include <gmp.h> }
{ #include <mpfr.h> }
{$include <math.h>}
{$include <time.h>}
{ #include <stdint.h> }
{$include <inttypes.h>}
{$include <assert.h>}
{$include "SuiteSparse_config.h"}
{------------------------------------------------------------------------------ }
{ Version }
{------------------------------------------------------------------------------ }

const
  SPEX_DATE = 'Jan 20, 2024';  
  SPEX_VERSION = '2.3.2';  
  SPEX_VERSION_MAJOR = 2;  
  SPEX_VERSION_MINOR = 3;  
  SPEX_VERSION_SUB = 2;  
{------------------------------------------------------------------------------ }
{ version }
{------------------------------------------------------------------------------ }

procedure SPEX_version(version:array[0..2] of longint);cdecl;external;
{------------------------------------------------------------------------------ }
{ Error codes }
{------------------------------------------------------------------------------ }
{ Most SPEX functions return a code that indicates if it was successful }
{ or not. Otherwise the code returns a pointer to the object that was created }
{ or it returns void (in the case that an object was deleted) }
{ all is well }
{ out of memory }
{ the input matrix A is singular }
{ one or more input arguments are incorrect }
{ The solution is incorrect }
{ The input matrix is unsymmetric (for Cholesky) }
{ SPEX used without proper initialization }
type
  PSPEX_info = ^TSPEX_info;
  TSPEX_info =  Longint;
  Const
    SPEX_OK = 0;
    SPEX_OUT_OF_MEMORY = -(1);
    SPEX_SINGULAR = -(2);
    SPEX_INCORRECT_INPUT = -(3);
    SPEX_INCORRECT = -(4);
    SPEX_UNSYMMETRIC = -(5);
    SPEX_PANIC = -(6);
;
{------------------------------------------------------------------------------ }
{ Pivot scheme codes }
{------------------------------------------------------------------------------ }
{ A code in SPEX_options to tell SPEX what type of pivoting to use for pivoting }
{ in unsymmetric LU factorization. }
{ Smallest pivot }
{ Diagonal pivoting }
{ First nonzero per column chosen as pivot }
{ Diagonal pivoting with tol for smallest pivot. }
{   (Default) }
{ Diagonal pivoting with tol. for largest pivot }
{ Largest pivot }
type
  PSPEX_pivot = ^TSPEX_pivot;
  TSPEX_pivot =  Longint;
  Const
    SPEX_SMALLEST = 0;
    SPEX_DIAGONAL = 1;
    SPEX_FIRST_NONZERO = 2;
    SPEX_TOL_SMALLEST = 3;
    SPEX_TOL_LARGEST = 4;
    SPEX_LARGEST = 5;
;
{------------------------------------------------------------------------------ }
{ Column ordering scheme codes }
{------------------------------------------------------------------------------ }
{ A code in SPEX_options to tell SPEX which column ordering to used prior to  }
{ exact factorization }
{ None: A is factorized as-is }
{ COLAMD: Default }
{ AMD }
type
  PSPEX_col_order = ^TSPEX_col_order;
  TSPEX_col_order =  Longint;
  Const
    SPEX_NO_ORDERING = 0;
    SPEX_COLAMD = 1;
    SPEX_AMD = 2;
;
{------------------------------------------------------------------------------ }
{------------------------------------------------------------------------------ }
{-------------------------Data Structures-------------------------------------- }
{------------------------------------------------------------------------------ }
{------------------------------------------------------------------------------ }
{ This struct serves as a global struct to define all user-selectable options. }
{ row pivoting scheme used. }
{ column ordering scheme used }
{ tolerance for the row-pivotin methods }
{ SPEX_TOL_SMALLEST and SPEX_TOL_LARGEST }
{ 0: print nothing, 1: just errors, }
{ 2: terse (basic stats from COLAMD/AMD and }
{ SPEX Left LU), 3: all, with matrices and results }
{ Precision used to output file if MPFR is chosen }
{ Type of MPFR rounding used }
{ Set true if the solution to the system should be }
{ checked.  Intended for debugging only; SPEX is }
{ guaranteed to return the exact solution. }
type
  PSPEX_options = ^TSPEX_options;
  TSPEX_options = record
      pivot : TSPEX_pivot;
      order : TSPEX_col_order;
      tol : Tdouble;
      print_level : longint;
      prec : Tint32_t;
      round : Tmpfr_rnd_t;
      check : Tbool;
    end;
{ Purpose: Create SPEX_options object with default parameters }
{ upon successful allocation, which are defined in SPEX_util_nternal.h }
{ To free it, simply use SPEX_FREE (*option). }

function SPEX_create_default_options(option:PPSPEX_options):TSPEX_info;cdecl;external;
{------------------------------------------------------------------------------ }
{ SPEX_matrix: a sparse CSC, sparse triplet, or dense matrix }
{------------------------------------------------------------------------------ }
{ SPEX uses a single matrix data type, SPEX_matrix, which can be held in }
{ one of three kinds of formats:  sparse CSC (compressed sparse column), }
{ sparse triplet, and dense: }
{ matrix is in compressed sparse column format }
{ matrix is in sparse triplet format }
{ matrix is in dense format }
type
  PSPEX_kind = ^TSPEX_kind;
  TSPEX_kind =  Longint;
  Const
    SPEX_CSC = 0;
    SPEX_TRIPLET = 1;
    SPEX_DENSE = 2;
;
{ Each of the three formats can have values of 5 different data types: mpz_t, }
{ mpq_t, mpfr_t, int64_t, and double: }
{ matrix of mpz_t integers }
{ matrix of mpq_t rational numbers }
{ matrix of mpfr_t }
{ matrix of int64_t integers }
{ matrix of doubles }
type
  PSPEX_type = ^TSPEX_type;
  TSPEX_type =  Longint;
  Const
    SPEX_MPZ = 0;
    SPEX_MPQ = 1;
    SPEX_MPFR = 2;
    SPEX_INT64 = 3;
    SPEX_FP64 = 4;
;
{ This gives a total of 15 different matrix types.  Not all functions accept }
{ all 15 matrices types, however. }
{ Suppose A is an m-by-n matrix with nz <= nzmax entries. }
{ The p, i, j, and x components are defined as: }
{ (0) SPEX_CSC:  A sparse matrix in CSC (compressed sparse column) format. }
{      A->p is an int64_t array of size n+1, A->i is an int64_t array of size }
{      nzmax (with nz <= nzmax), and A->x.type is an array of size nzmax of }
{      matrix entries ('type' is one of mpz, mpq, mpfr, int64, or fp64).  The }
{      row indices of column j appear in A->i [A->p [j] ... A->p [j+1]-1], and }
{      the values appear in the same locations in A->x.type.  The A->j array }
{      is NULL.  A->nz is ignored; nz is A->p [A->n]. }
{ (1) SPEX_TRIPLET:  A sparse matrix in triplet format.  A->i and A->j are }
{      both int64_t arrays of size nzmax, and A->x.type is an array of values }
{      of the same size.  The kth tuple has row index A->i [k], column index }
{      A->j [k], and value A->x.type [k], with 0 <= k < A->nz.  The A->p array }
{      is NULL. }
{ (2) SPEX_DENSE:  A dense matrix.  The integer arrays A->p, A->i, and A->j }
{      are all NULL.  A->x.type is a pointer to an array of size m*n, stored }
{      in column-oriented format.  The value of A(i,j) is A->x.type [p] }
{      with p = i + j*A->m.  A->nz is ignored; nz is A->m * A->n. }
{ The SPEX_matrix may contain 'shallow' components, A->p, A->i, A->j, and }
{ A->x.  For example, if A->p_shallow is true, then a non-NULL A->p is a }
{ pointer to a read-only array, and the A->p array is not freed by }
{ SPEX_matrix_free.  If A->p is NULL (for a triplet or dense matrix), then }
{ A->p_shallow has no effect. }
{ number of rows }
{ number of columns }
{ size of A->i, A->j, and A->x }
{ # nonzeros in a triplet matrix . }
{ Ignored for CSC and dense matrices. }
{ CSC, triplet, or dense }
{ mpz, mpq, mpfr, int64, or fp64 (double) }
{ if CSC: column pointers, an array size is n+1. }
{ if triplet or dense: A->p is NULL. }
{ if true, A->p is shallow. }
{ if CSC or triplet: row indices, of size nzmax. }
{ if dense: A->i is NULL. }
{ if true, A->i is shallow. }
{ if triplet: column indices, of size nzmax. }
{ if CSC or dense: A->j is NULL. }
{ if true, A->j is shallow. }
{ A->x.type has size nzmax. }
{ A->x.mpz }
{ A->x.mpq }
{ A->x.mpfr }
{ A->x.int64 }
{ A->x.fp64 }
{ if true, A->x.type is shallow. }
{ scale factor for mpz matrices (never shallow) }
{ For all matrices who's type is not mpz, }
{ mpz_scale = 1.  }
type
  PSPEX_matrix = ^TSPEX_matrix;
  TSPEX_matrix = record
      m : Tint64_t;
      n : Tint64_t;
      nzmax : Tint64_t;
      nz : Tint64_t;
      kind : TSPEX_kind;
      _type : TSPEX_type;
      p : Pint64_t;
      p_shallow : Tbool;
      i : Pint64_t;
      i_shallow : Tbool;
      j : Pint64_t;
      j_shallow : Tbool;
      x : record
          case longint of
            0 : ( mpz : Pmpz_t );
            1 : ( mpq : Pmpq_t );
            2 : ( mpfr : Pmpfr_t );
            3 : ( int64xxxxxx : Pint64_t );
            4 : ( fp64 : Pdouble );
          end;
      x_shallow : Tbool;
      scale : Tmpq_t;
    end;
{------------------------------------------------------------------------------ }
{ SPEX_matrix_allocate: allocate an m-by-n SPEX_matrix }
{------------------------------------------------------------------------------ }
{ if shallow is false: All components (p,i,j,x) are allocated and set to zero, }
{                      and then shallow flags are all false. }
{ if shallow is true:  All components (p,i,j,x) are NULL, and their shallow }
{                      flags are all true.  The user can then set A->p, }
{                      A->i, A->j, and/or A->x accordingly, from their own }
{                      arrays. }
{ matrix to allocate }
{ CSC, triplet, or dense }
{ mpz, mpq, mpfr, int64, or double }
{ # of rows }
{ # of columns }
{ max # of entries }
{ if true, matrix is shallow.  A->p, A->i, A->j, }
{ A->x are all returned as NULL and must be set }
{ by the caller.  All A->*_shallow are returned }
{ as true. }
{ If true, and the data types are mpz, mpq, or }
{ mpfr, the entries are initialized (using the }
{ appropriate SPEX_mp*_init function). If false, }
{ the mpz, mpq, and mpfr arrays are allocated but }
{ not initialized. Meaningless for data types  }
{ FP64 or INT64 }
(* Const before type ignored *)

function SPEX_matrix_allocate(A_handle:PPSPEX_matrix; kind:TSPEX_kind; _type:TSPEX_type; m:Tint64_t; n:Tint64_t; 
           nzmax:Tint64_t; shallow:Tbool; init:Tbool; option:PSPEX_options):TSPEX_info;cdecl;external;
{------------------------------------------------------------------------------ }
{ SPEX_matrix_free: free a SPEX_matrix }
{------------------------------------------------------------------------------ }
{ matrix to free }
(* Const before type ignored *)
function SPEX_matrix_free(A_handle:PPSPEX_matrix; option:PSPEX_options):TSPEX_info;cdecl;external;
{------------------------------------------------------------------------------ }
{ SPEX_matrix_nnz: # of entries in a matrix }
{------------------------------------------------------------------------------ }
{ find the # of entries in A }
{ # of entries in A, -1 if A is NULL }
(* Const before type ignored *)
{ matrix to query }
(* Const before type ignored *)
function SPEX_matrix_nnz(nnz:Pint64_t; A:PSPEX_matrix; option:PSPEX_options):TSPEX_info;cdecl;external;
{------------------------------------------------------------------------------ }
{ SPEX_matrix_copy: makes a copy of a matrix }
{------------------------------------------------------------------------------ }
{ SPEX_matrix_copy: make a copy of a SPEX_matrix, into another kind and type. }
{ matrix to create (never shallow) }
{ inputs, not modified: }
{ C->kind: CSC, triplet, or dense }
{ C->type: mpz_t, mpq_t, mpfr_t, int64_t, or double }
{ matrix to make a copy of (may be shallow) }
(* Const before type ignored *)
function SPEX_matrix_copy(C_handle:PPSPEX_matrix; C_kind:TSPEX_kind; C_type:TSPEX_type; A:PSPEX_matrix; option:PSPEX_options):TSPEX_info;cdecl;external;
{------------------------------------------------------------------------------ }
{ SPEX_matrix macros }
{------------------------------------------------------------------------------ }
{ These macros simplify the access to entries in a SPEX_matrix. }
{ The type parameter is one of: mpq, mpz, mpfr, int64, or fp64. }
{ To access the kth entry in a SPEX_matrix using 1D linear addressing, }
{ in any matrix kind (CSC, triplet, or dense), in any type: }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SPEX_1D(A,k,_type : longint) : longint;

{ To access the (i,j)th entry in a 2D SPEX_matrix, in any type: }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SPEX_2D(A,i,j,_type : longint) : longint;

{------------------------------------------------------------------------------ }
{ SPEX_LU_analysis: symbolic pre-analysis }
{------------------------------------------------------------------------------ }
{ This struct stores the column permutation for LU and the estimate of the }
{ number of nonzeros in L and U. }
{ Column permutation for LU factorization, representing }
{ the permutation matrix Q.   The matrix A*Q is factorized. }
{ If the kth column of L, U, and A*Q is column j of the }
{ unpermuted matrix A, then j = S->q [k]. }
{ Approximate number of nonzeros in L. }
{ Approximate number of nonzeros in U. }
{ lnz and unz are used to allocate the initial space for }
{ L and U; the space is reallocated as needed. }
type
  PSPEX_LU_analysis = ^TSPEX_LU_analysis;
  TSPEX_LU_analysis = record
      q : Pint64_t;
      lnz : Tint64_t;
      unz : Tint64_t;
    end;
{ The symbolic analysis object is created by SPEX_LU_analyze. }
{ SPEX_LU_analysis_free frees the SPEX_LU_analysis object. }
{ Structure to be deleted }
(* Const before type ignored *)

function SPEX_LU_analysis_free(S:PPSPEX_LU_analysis; option:PSPEX_options):TSPEX_info;cdecl;external;
{ SPEX_LU_analyze performs the symbolic ordering and analysis for LU factorization. }
{ Currently, there are three options: no ordering, COLAMD, and AMD. }
{ symbolic analysis (column permutation and nnz L,U) }
(* Const before type ignored *)
{ Input matrix }
(* Const before type ignored *)
{ Control parameters }
function SPEX_LU_analyze(S:PPSPEX_LU_analysis; A:PSPEX_matrix; option:PSPEX_options):TSPEX_info;cdecl;external;
{------------------------------------------------------------------------------ }
{ Memory management }
{------------------------------------------------------------------------------ }
{ SPEX relies on the SuiteSparse memory management functions, }
{ SuiteSparse_malloc, SuiteSparse_calloc, SuiteSparse_realloc, and }
{ SuiteSparse_free. }
{ Allocate and initialize memory space for SPEX }
{ number of items to allocate }
{ size of each item }
function SPEX_calloc(nitems:Tsize_t; size:Tsize_t):pointer;cdecl;external;
{ Allocate memory space for SPEX }
{ size of memory space to allocate }
function SPEX_malloc(size:Tsize_t):pointer;cdecl;external;
{ Free the memory allocated by SPEX_calloc, SPEX_malloc, or SPEX_realloc. }
{ pointer to memory space to free }
procedure SPEX_free(p:pointer);cdecl;external;
{ Free a pointer and set it to NULL. }
{ SPEX_realloc is a wrapper for realloc.  If p is non-NULL on input, it points }
{ to a previously allocated object of size old_size * size_of_item.  The }
{ object is reallocated to be of size new_size * size_of_item.  If p is NULL }
{ on input, then a new object of that size is allocated.  On success, a }
{ pointer to the new object is returned.  If the reallocation fails, p is not }
{ modified, and a flag is returned to indicate that the reallocation failed. }
{ If the size decreases or remains the same, then the method always succeeds }
{ (ok is returned as true). }
{ Typical usage:  the following code fragment allocates an array of 10 int's, }
{ and then increases the size of the array to 20 int's.  If the SPEX_malloc }
{ succeeds but the SPEX_realloc fails, then the array remains unmodified, }
{ of size 10. }
{ }
{      int *p ; }
{      p = SPEX_malloc (10 * sizeof (int)) ; }
{      if (p == NULL)  error here ...  }
{      printf ("p points to an array of size 10 * sizeof (int)\n") ; }
{      bool ok ; }
{      p = SPEX_realloc (20, 10, sizeof (int), p, &ok) ; }
{      if (ok) printf ("p has size 20 * sizeof (int)\n") ; }
{      else printf ("realloc failed; p still has size 10 * sizeof (int)\n") ; }
{      SPEX_free (p) ; }
{ pointer to reallocated block, or original block }
{ if the realloc failed }
{ new number of items in the object }
{ old number of items in the object }
{ sizeof each item }
{ old object to reallocate }
{ true if success, false on failure }
function SPEX_realloc(nitems_new:Tint64_t; nitems_old:Tint64_t; size_of_item:Tsize_t; p:pointer; ok:Pbool):pointer;cdecl;external;
{------------------------------------------------------------------------------ }
{ SPEX memory environment routines }
{------------------------------------------------------------------------------ }
{ SPEX_initialize: initializes the working evironment for SPEX library. }
{ It must be called prior to calling any other SPEX_* function. }
function SPEX_initialize:TSPEX_info;cdecl;external;
{ SPEX_initialize_expert is the same as SPEX_initialize, except that it allows }
{ for a redefinition of custom memory functions that are used for SPEX and }
{ GMP.  The four inputs to this function are pointers to four functions with }
{ the same signatures as the ANSI C malloc, calloc, realloc, and free. }
{ user-defined malloc }
{ user-defined calloc }
{ user-defined realloc }
{ user-defined free }
function SPEX_initialize_expert(MyMalloc:function (para1:Tsize_t):pointer; MyCalloc:function (para1:Tsize_t; para2:Tsize_t):pointer; MyRealloc:function (para1:pointer; para2:Tsize_t):pointer; MyFree:procedure (para1:pointer)):TSPEX_info;cdecl;external;
{ SPEX_finalize: This function finalizes the working evironment for SPEX }
{ library, and frees any internal workspace created by SPEX.  It must be }
{ called as the last SPEX_* function called. }
function SPEX_finalize:TSPEX_info;cdecl;external;
{ SPEX_matrix_check: check and print a SPEX_sparse matrix }
{ returns a SPEX status code }
(* Const before type ignored *)
{ matrix to check }
(* Const before type ignored *)
{ defines the print level }
function SPEX_matrix_check(A:PSPEX_matrix; option:PSPEX_options):TSPEX_info;cdecl;external;
{ Purpose: This function takes as input a mpz_t SPEX_matrix and divides
 * it by an mpz_t constant storing the solution in a mpq_t dense SPEX_matrix
 * array. 
  }
{ divides the x matrix by a scalar }
{ x2 = x/scalar }
{ input vector x }
(* Const before type ignored *)
{ the scalar }
(* Const before type ignored *)
function SPEX_matrix_div(x2_handle:PPSPEX_matrix; x:PSPEX_matrix; scalar:Tmpz_t; option:PSPEX_options):TSPEX_info;cdecl;external;
{ Purpose: This function multiplies matrix x a scalar
  }
{ multiplies x by a scalar }
{ matrix to be multiplied }
(* Const before type ignored *)
{ scalar to multiply by }
function SPEX_matrix_mul(x:PSPEX_matrix; scalar:Tmpz_t):TSPEX_info;cdecl;external;
{ SPEX_check_solution: checks the solution of the linear system.  Performs a
 * quick rational arithmetic check of A*x=b.
  }
(* Const before type ignored *)
{ input matrix }
(* Const before type ignored *)
{ solution vector }
(* Const before type ignored *)
{ right hand side }
(* Const before type ignored *)
{ Command options }
function SPEX_check_solution(A:PSPEX_matrix; x:PSPEX_matrix; b:PSPEX_matrix; option:PSPEX_options):TSPEX_info;cdecl;external;
{ Purpose: p [0..n] = cumulative sum of c [0..n-1], and then copy p [0..n-1]
 * into c.  This function is lightly modified from CSparse.
  }
{ vector to store the sum of c }
{ vector which is summed }
{ size of c }
function SPEX_cumsum(p:Pint64_t; c:Pint64_t; n:Tint64_t):TSPEX_info;cdecl;external;
{------------------------------------------------------------------------------ }
{---------------------------SPEX GMP/MPFR Functions---------------------------- }
{------------------------------------------------------------------------------ }
{ The following functions are the SPEX interface to the GMP/MPFR libary. }
{ Each corresponding GMP/MPFR function is given a wrapper to ensure that no }
{ memory leaks or crashes occur. All covered GMP functions can be found in }
{ SPEX_gmp.c }
{ The GMP library does not handle out-of-memory failures.  However, it does }
{ provide a mechanism for passing function pointers that replace GMP's use of }
{ malloc, realloc, and free.  This mechanism is used to provide a try/catch }
{ mechanism for memory allocation errors, using setjmp and longjmp. }
{ When a GMP function is called, this wrapper keeps track of a list of objects }
{ allocated by that function.  The list is started fresh each time a GMP }
{ function is called.  If any allocation fails, the NULL pointer is not }
{ returned to GMP.  Instead, all allocated blocks in the list are freed, }
{ and spex_gmp_allocate returns directly to wrapper. }
(* Const before type ignored *)
function SPEX_mpfr_asprintf(str:PPchar; format:Pchar; args:array of const):TSPEX_info;cdecl;external;
function SPEX_mpfr_asprintf(str:PPchar; format:Pchar):TSPEX_info;cdecl;external;
(* Const before type ignored *)
function SPEX_gmp_fscanf(fp:PFILE; format:Pchar; args:array of const):TSPEX_info;cdecl;external;
function SPEX_gmp_fscanf(fp:PFILE; format:Pchar):TSPEX_info;cdecl;external;
function SPEX_mpz_init(x:Tmpz_t):TSPEX_info;cdecl;external;
(* Const before type ignored *)
function SPEX_mpz_init2(x:Tmpz_t; size:Tsize_t):TSPEX_info;cdecl;external;
(* Const before type ignored *)
function SPEX_mpz_set(x:Tmpz_t; y:Tmpz_t):TSPEX_info;cdecl;external;
(* Const before type ignored *)
function SPEX_mpz_set_ui(x:Tmpz_t; y:Tuint64_t):TSPEX_info;cdecl;external;
(* Const before type ignored *)
function SPEX_mpz_set_si(x:Tmpz_t; y:Tint64_t):TSPEX_info;cdecl;external;
(* Const before type ignored *)
function SPEX_mpz_get_d(x:Pdouble; y:Tmpz_t):TSPEX_info;cdecl;external;
(* Const before type ignored *)
function SPEX_mpz_get_si(x:Pint64_t; y:Tmpz_t):TSPEX_info;cdecl;external;
(* Const before type ignored *)
function SPEX_mpz_set_q(x:Tmpz_t; y:Tmpq_t):TSPEX_info;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function SPEX_mpz_mul(a:Tmpz_t; b:Tmpz_t; c:Tmpz_t):TSPEX_info;cdecl;external;
{$if 0}
(* Const before type ignored *)
(* Const before type ignored *)

function SPEX_mpz_add(a:Tmpz_t; b:Tmpz_t; c:Tmpz_t):TSPEX_info;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function SPEX_mpz_addmul(x:Tmpz_t; y:Tmpz_t; z:Tmpz_t):TSPEX_info;cdecl;external;
{$endif}
(* Const before type ignored *)
(* Const before type ignored *)

function SPEX_mpz_submul(x:Tmpz_t; y:Tmpz_t; z:Tmpz_t):TSPEX_info;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function SPEX_mpz_divexact(x:Tmpz_t; y:Tmpz_t; z:Tmpz_t):TSPEX_info;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function SPEX_mpz_gcd(x:Tmpz_t; y:Tmpz_t; z:Tmpz_t):TSPEX_info;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function SPEX_mpz_lcm(lcm:Tmpz_t; x:Tmpz_t; y:Tmpz_t):TSPEX_info;cdecl;external;
(* Const before type ignored *)
function SPEX_mpz_abs(x:Tmpz_t; y:Tmpz_t):TSPEX_info;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function SPEX_mpz_cmp(r:Plongint; x:Tmpz_t; y:Tmpz_t):TSPEX_info;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function SPEX_mpz_cmpabs(r:Plongint; x:Tmpz_t; y:Tmpz_t):TSPEX_info;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function SPEX_mpz_cmp_ui(r:Plongint; x:Tmpz_t; y:Tuint64_t):TSPEX_info;cdecl;external;
(* Const before type ignored *)
function SPEX_mpz_sgn(sgn:Plongint; x:Tmpz_t):TSPEX_info;cdecl;external;
(* Const before type ignored *)
function SPEX_mpz_sizeinbase(size:Psize_t; x:Tmpz_t; base:Tint64_t):TSPEX_info;cdecl;external;
function SPEX_mpq_init(x:Tmpq_t):TSPEX_info;cdecl;external;
(* Const before type ignored *)
function SPEX_mpq_set(x:Tmpq_t; y:Tmpq_t):TSPEX_info;cdecl;external;
(* Const before type ignored *)
function SPEX_mpq_set_z(x:Tmpq_t; y:Tmpz_t):TSPEX_info;cdecl;external;
(* Const before type ignored *)
function SPEX_mpq_set_d(x:Tmpq_t; y:Tdouble):TSPEX_info;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function SPEX_mpq_set_ui(x:Tmpq_t; y:Tuint64_t; z:Tuint64_t):TSPEX_info;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function SPEX_mpq_set_si(x:Tmpq_t; y:Tint64_t; z:Tuint64_t):TSPEX_info;cdecl;external;
(* Const before type ignored *)
function SPEX_mpq_set_num(x:Tmpq_t; y:Tmpz_t):TSPEX_info;cdecl;external;
(* Const before type ignored *)
function SPEX_mpq_set_den(x:Tmpq_t; y:Tmpz_t):TSPEX_info;cdecl;external;
(* Const before type ignored *)
function SPEX_mpq_get_den(x:Tmpz_t; y:Tmpq_t):TSPEX_info;cdecl;external;
(* Const before type ignored *)
function SPEX_mpq_get_d(x:Pdouble; y:Tmpq_t):TSPEX_info;cdecl;external;
(* Const before type ignored *)
function SPEX_mpq_abs(x:Tmpq_t; y:Tmpq_t):TSPEX_info;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function SPEX_mpq_add(x:Tmpq_t; y:Tmpq_t; z:Tmpq_t):TSPEX_info;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function SPEX_mpq_mul(x:Tmpq_t; y:Tmpq_t; z:Tmpq_t):TSPEX_info;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function SPEX_mpq_div(x:Tmpq_t; y:Tmpq_t; z:Tmpq_t):TSPEX_info;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function SPEX_mpq_cmp(r:Plongint; x:Tmpq_t; y:Tmpq_t):TSPEX_info;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function SPEX_mpq_cmp_ui(r:Plongint; x:Tmpq_t; num:Tuint64_t; den:Tuint64_t):TSPEX_info;cdecl;external;
(* Const before type ignored *)
function SPEX_mpq_sgn(sgn:Plongint; x:Tmpq_t):TSPEX_info;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function SPEX_mpq_equal(r:Plongint; x:Tmpq_t; y:Tmpq_t):TSPEX_info;cdecl;external;
(* Const before type ignored *)
function SPEX_mpfr_init2(x:Tmpfr_t; size:Tuint64_t):TSPEX_info;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function SPEX_mpfr_set(x:Tmpfr_t; y:Tmpfr_t; rnd:Tmpfr_rnd_t):TSPEX_info;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function SPEX_mpfr_set_d(x:Tmpfr_t; y:Tdouble; rnd:Tmpfr_rnd_t):TSPEX_info;cdecl;external;
(* Const before type ignored *)
function SPEX_mpfr_set_si(x:Tmpfr_t; y:Tint64_t; rnd:Tmpfr_rnd_t):TSPEX_info;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function SPEX_mpfr_set_q(x:Tmpfr_t; y:Tmpq_t; rnd:Tmpfr_rnd_t):TSPEX_info;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function SPEX_mpfr_set_z(x:Tmpfr_t; y:Tmpz_t; rnd:Tmpfr_rnd_t):TSPEX_info;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function SPEX_mpfr_get_z(x:Tmpz_t; y:Tmpfr_t; rnd:Tmpfr_rnd_t):TSPEX_info;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function SPEX_mpfr_get_q(x:Tmpq_t; y:Tmpfr_t; rnd:Tmpfr_rnd_t):TSPEX_info;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function SPEX_mpfr_get_d(x:Pdouble; y:Tmpfr_t; rnd:Tmpfr_rnd_t):TSPEX_info;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function SPEX_mpfr_get_si(x:Pint64_t; y:Tmpfr_t; rnd:Tmpfr_rnd_t):TSPEX_info;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function SPEX_mpfr_mul(x:Tmpfr_t; y:Tmpfr_t; z:Tmpfr_t; rnd:Tmpfr_rnd_t):TSPEX_info;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function SPEX_mpfr_mul_d(x:Tmpfr_t; y:Tmpfr_t; z:Tdouble; rnd:Tmpfr_rnd_t):TSPEX_info;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function SPEX_mpfr_div_d(x:Tmpfr_t; y:Tmpfr_t; z:Tdouble; rnd:Tmpfr_rnd_t):TSPEX_info;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function SPEX_mpfr_ui_pow_ui(x:Tmpfr_t; y:Tuint64_t; z:Tuint64_t; rnd:Tmpfr_rnd_t):TSPEX_info;cdecl;external;
(* Const before type ignored *)
function SPEX_mpfr_sgn(sgn:Plongint; x:Tmpfr_t):TSPEX_info;cdecl;external;
function SPEX_mpfr_free_cache:TSPEX_info;cdecl;external;
function SPEX_mpfr_free_str(str:Pchar):TSPEX_info;cdecl;external;
{$if 0}
{ These functions are currently unused, but kept here for future reference. }
(* Const before type ignored *)

function SPEX_gmp_asprintf(str:PPchar; format:Pchar; args:array of const):TSPEX_info;cdecl;external;
function SPEX_gmp_asprintf(str:PPchar; format:Pchar):TSPEX_info;cdecl;external;
(* Const before type ignored *)
function SPEX_gmp_printf(format:Pchar; args:array of const):TSPEX_info;cdecl;external;
function SPEX_gmp_printf(format:Pchar):TSPEX_info;cdecl;external;
(* Const before type ignored *)
function SPEX_mpfr_printf(format:Pchar; args:array of const):TSPEX_info;cdecl;external;
function SPEX_mpfr_printf(format:Pchar):TSPEX_info;cdecl;external;
(* Const before type ignored *)
function SPEX_gmp_fprintf(fp:PFILE; format:Pchar; args:array of const):TSPEX_info;cdecl;external;
function SPEX_gmp_fprintf(fp:PFILE; format:Pchar):TSPEX_info;cdecl;external;
(* Const before type ignored *)
function SPEX_mpfr_fprintf(fp:PFILE; format:Pchar; args:array of const):TSPEX_info;cdecl;external;
function SPEX_mpfr_fprintf(fp:PFILE; format:Pchar):TSPEX_info;cdecl;external;
(* Const before type ignored *)
function SPEX_mpz_set_d(x:Tmpz_t; y:Tdouble):TSPEX_info;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function SPEX_mpfr_log2(x:Tmpfr_t; y:Tmpfr_t; rnd:Tmpfr_rnd_t):TSPEX_info;cdecl;external;
{$endif}
{$endif}
{------------------------------------------------------------------------------ }
{ Primary factorization & solve routines }
{------------------------------------------------------------------------------ }
{ SPEX_backslash solves the linear system Ax = b. This is the simplest way to }
{ use the SPEX Left LU package. This function encompasses both factorization and }
{ solve and returns the solution vector in the user desired type.  It can be }
{ thought of as an exact version of MATLAB sparse backslash. }
{ Output }
{ Final solution vector }
{ Input }
{ Type of output desired: }
{ Must be SPEX_MPQ, SPEX_MPFR, }
{ or SPEX_FP64 }
(* Const before type ignored *)
{ Input matrix }
(* Const before type ignored *)
{ Right hand side vector(s) }
(* Const before type ignored *)

function SPEX_Left_LU_backslash(X_handle:PPSPEX_matrix; _type:TSPEX_type; A:PSPEX_matrix; b:PSPEX_matrix; option:PSPEX_options):TSPEX_info;cdecl;external;
{ SPEX_Left_LU_factorize performs the SPEX Left LU factorization.  }
{ This factorization is done via n iterations of the sparse REF  }
{ triangular solve function. The overall factorization is  }
{ PAQ = LDU.  The determinant can be obtained as rhos->x.mpz[n-1]. }
{  }
{  L: undefined on input, created on output }
{  U: undefined on input, created on output }
{  rhos: undefined on input, created on output }
{  pinv: undefined on input, created on output }
{  }
{  A: input only, not modified }
{  S: input only, not modified }
{  option: input only, not modified }
{ output: }
{ lower triangular matrix }
{ upper triangular matrix }
{ sequence of pivots }
{ inverse row permutation }
{ input: }
(* Const before type ignored *)
{ matrix to be factored }
(* Const before type ignored *)
{ column permutation and estimates }
{ of nnz in L and U  }
(* Const before type ignored *)
function SPEX_Left_LU_factorize(L_handle:PPSPEX_matrix; U_handle:PPSPEX_matrix; rhos_handle:PPSPEX_matrix; pinv_handle:PPint64_t; A:PSPEX_matrix; 
           S:PSPEX_LU_analysis; option:PSPEX_options):TSPEX_info;cdecl;external;
{ SPEX_Left_LU_solve solves the linear system LD^(-1)U x = b. }
{ solves the linear system LD^(-1)U x = b }
{ Output }
{ rational solution to the system }
{ input: }
(* Const before type ignored *)
{ right hand side vector }
(* Const before type ignored *)
{ Input matrix }
(* Const before type ignored *)
{ lower triangular matrix }
(* Const before type ignored *)
{ upper triangular matrix }
(* Const before type ignored *)
{ sequence of pivots }
(* Const before type ignored *)
{ symbolic analysis struct }
(* Const before type ignored *)
{ inverse row permutation }
(* Const before type ignored *)
function SPEX_Left_LU_solve(X_handle:PPSPEX_matrix; b:PSPEX_matrix; A:PSPEX_matrix; L:PSPEX_matrix; U:PSPEX_matrix; 
           rhos:PSPEX_matrix; S:PSPEX_LU_analysis; pinv:Pint64_t; option:PSPEX_options):TSPEX_info;cdecl;external;

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SPEX_1D(A,k,_type : longint) : longint;
begin
  SPEX_1D:=A^.(x.(_type[k]));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SPEX_2D(A,i,j,_type : longint) : longint;
begin
  SPEX_2D:=SPEX_1D(A,(Ti(+(j)))*(A^.m),_type);
end;


end.
