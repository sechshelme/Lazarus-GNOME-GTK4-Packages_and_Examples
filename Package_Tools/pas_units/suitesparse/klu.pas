unit klu;

interface

uses
  fp_suitesparse;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{------------------------------------------------------------------------------ }
{ KLU/Source/klu.h: include file for KLU }
{------------------------------------------------------------------------------ }
{ KLU, Copyright (c) 2004-2024, University of Florida.  All Rights Reserved. }
{ Authors: Timothy A. Davis and Ekanathan Palamadai. }
{ SPDX-License-Identifier: LGPL-2.1+ }
{------------------------------------------------------------------------------ }
{ Include file for user programs that call klu_* routines  }
{$ifndef _KLU_H}
{$define _KLU_H}
{$include "amd.h"}
{$include "colamd.h"}
{$include "btf.h"}
{ make it easy for C++ programs to include KLU  }
{ C++ extern C conditionnal removed }
{ --------------------------------------------------------------------------  }
{ Symbolic object - contains the pre-ordering computed by klu_analyze  }
{ --------------------------------------------------------------------------  }
{ A (P,Q) is in upper block triangular form.  The kth block goes from
     * row/col index R [k] to R [k+1]-1.  The estimated number of nonzeros
     * in the L factor of the kth block is Lnz [k]. 
      }
{ only computed if the AMD ordering is chosen:  }
{ symmetry of largest block  }
{ est. factorization flop count  }
{ estimated nz in L and U, including diagonals  }
{ size n, but only Lnz [0..nblocks-1] is used  }
{ computed for all orderings:  }
{ input matrix A is n-by-n  }
{ # entries in input matrix  }
{ size n  }
{ size n  }
{ size n+1, but only R [0..nblocks] is used  }
{ nz in off-diagonal blocks  }
{ number of blocks  }
{ size of largest block  }
{ ordering used (0:AMD, 1:COLAMD, 2:given, ...  }
{ whether or not BTF preordering was requested  }
{ only computed if BTF preordering requested  }
{ 0 to n-1 if the matrix is structurally rank
                        * deficient.  -1 if not computed.  n if the matrix has
                        * full structural rank  }
type
  Pklu_symbolic = ^Tklu_symbolic;
  Tklu_symbolic = record
      symmetry : Tdouble;
      est_flops : Tdouble;
      lnz : Tdouble;
      unz : Tdouble;
      Lnz : Pdouble;
      n : Tint32_t;
      nz : Tint32_t;
      P : Pint32_t;
      Q : Pint32_t;
      R : Pint32_t;
      nzoff : Tint32_t;
      nblocks : Tint32_t;
      maxblock : Tint32_t;
      ordering : Tint32_t;
      do_btf : Tint32_t;
      structural_rank : Tint32_t;
    end;
{ 64-bit version (otherwise same as above)  }

  Pklu_l_symbolic = ^Tklu_l_symbolic;
  Tklu_l_symbolic = record
      symmetry : Tdouble;
      est_flops : Tdouble;
      lnz : Tdouble;
      unz : Tdouble;
      Lnz : Pdouble;
      n : Tint64_t;
      nz : Tint64_t;
      P : Pint64_t;
      Q : Pint64_t;
      R : Pint64_t;
      nzoff : Tint64_t;
      nblocks : Tint64_t;
      maxblock : Tint64_t;
      ordering : Tint64_t;
      do_btf : Tint64_t;
      structural_rank : Tint64_t;
    end;
{ --------------------------------------------------------------------------  }
{ Numeric object - contains the factors computed by klu_factor  }
{ --------------------------------------------------------------------------  }
{ LU factors of each block, the pivot row permutation, and the
     * entries in the off-diagonal blocks  }
{ A is n-by-n  }
{ number of diagonal blocks  }
{ actual nz in L, including diagonal  }
{ actual nz in U, including diagonal  }
{ max actual nz in L in any one block, incl. diag  }
{ max actual nz in U in any one block, incl. diag  }
{ size n. final pivot permutation  }
{ size n. inverse of final pivot permutation  }
{ LU factors of each block  }
{ size n. pointers into LUbx[block] for L  }
{ size n. pointers into LUbx[block] for U  }
{ size n. Llen [k] = # of entries in kth column of L  }
{ size n. Ulen [k] = # of entries in kth column of U  }
{ L and U indices and entries (excl. diagonal of U)  }
{ size of each LUbx [block], in sizeof (Unit)  }
{ diagonal of U  }
{ scale factors; can be NULL if no scaling  }
{ size n. Rs [i] is scale factor for row i  }
{ permanent workspace for factorization and solve  }
{ size (in bytes) of Work  }
{ workspace  }
{ alias into Numeric->Work  }
{ alias into Numeric->Work  }
{ off-diagonal entries in a conventional compressed-column sparse matrix  }
{ size n+1, column pointers  }
{ size nzoff, row indices  }
{ size nzoff, numerical values  }

  Pklu_numeric = ^Tklu_numeric;
  Tklu_numeric = record
      n : Tint32_t;
      nblocks : Tint32_t;
      lnz : Tint32_t;
      unz : Tint32_t;
      max_lnz_block : Tint32_t;
      max_unz_block : Tint32_t;
      Pnum : Pint32_t;
      Pinv : Pint32_t;
      Lip : Pint32_t;
      Uip : Pint32_t;
      Llen : Pint32_t;
      Ulen : Pint32_t;
      LUbx : ^pointer;
      LUsize : Psize_t;
      Udiag : pointer;
      Rs : Pdouble;
      worksize : Tsize_t;
      Work : pointer;
      Xwork : pointer;
      Iwork : Pint32_t;
      Offp : Pint32_t;
      Offi : Pint32_t;
      Offx : pointer;
      nzoff : Tint32_t;
    end;
{ 64-bit version (otherwise same as above)  }

  Pklu_l_numeric = ^Tklu_l_numeric;
  Tklu_l_numeric = record
      n : Tint64_t;
      nblocks : Tint64_t;
      lnz : Tint64_t;
      unz : Tint64_t;
      max_lnz_block : Tint64_t;
      max_unz_block : Tint64_t;
      Pnum : Pint64_t;
      Pinv : Pint64_t;
      Lip : Pint64_t;
      Uip : Pint64_t;
      Llen : Pint64_t;
      Ulen : Pint64_t;
      LUbx : ^pointer;
      LUsize : Psize_t;
      Udiag : pointer;
      Rs : Pdouble;
      worksize : Tsize_t;
      Work : pointer;
      Xwork : pointer;
      Iwork : Pint64_t;
      Offp : Pint64_t;
      Offi : Pint64_t;
      Offx : pointer;
      nzoff : Tint64_t;
    end;
{ --------------------------------------------------------------------------  }
{ KLU control parameters and statistics  }
{ --------------------------------------------------------------------------  }
{ Common->status values  }

const
  KLU_OK = 0;  
{ status > 0 is a warning, not an error  }
  KLU_SINGULAR = 1;  
  KLU_OUT_OF_MEMORY = -(2);  
  KLU_INVALID = -(3);  
{ integer overflow has occured  }
  KLU_TOO_LARGE = -(4);  
{ ----------------------------------------------------------------------  }
{ parameters  }
{ ----------------------------------------------------------------------  }
{ pivot tolerance for diagonal preference  }
{ realloc memory growth size for LU factors  }
{ init. memory size with AMD: c*nnz(L) + n  }
{ init. memory size: c*nnz(A) + n  }
{ maxwork for BTF, <= 0 if no limit  }
{ use BTF pre-ordering, or not  }
{ 0: AMD, 1: COLAMD, 2: user P and Q,
                             * 3: user function  }
{ row scaling: -1: none (and no error check),
                             * 0: none, 1: sum, 2: max  }
{ pointer to user ordering function  }
{ pointer to user data, passed unchanged as the last parameter to the
     * user ordering function (optional, the user function need not use this
     * information).  }
{ how to handle a singular matrix:
        * FALSE: keep going.  Return a Numeric object with a zero U(k,k).  A
        *   divide-by-zero may occur when computing L(:,k).  The Numeric object
        *   can be passed to klu_solve (a divide-by-zero will occur).  It can
        *   also be safely passed to klu_refactor.
        * TRUE: stop quickly.  klu_factor will free the partially-constructed
        *   Numeric object.  klu_refactor will not free it, but will leave the
        *   numerical values only partially defined.  This is the default.  }
{ ----------------------------------------------------------------------  }
{ statistics  }
{ ----------------------------------------------------------------------  }
{ KLU_OK if OK, < 0 if error  }
{ # of reallocations of L and U  }
{ 0 to n-1 if the matrix is structurally rank
        * deficient (as determined by maxtrans).  -1 if not computed.  n if the
        * matrix has full structural rank.  This is computed by klu_analyze
        * if a BTF preordering is requested.  }
{ First k for which a zero U(k,k) was found,
        * if the matrix was singular (in the range 0 to n-1).  n if the matrix
        * has full rank. This is not a true rank-estimation.  It just reports
        * where the first zero pivot was found.  -1 if not computed.
        * Computed by klu_factor and klu_refactor.  }
{ n if the matrix is not singular.  If in the
        * range 0 to n-1, this is the column index of the original matrix A that
        * corresponds to the column of U that contains a zero diagonal entry.
        * -1 if not computed.  Computed by klu_factor and klu_refactor.  }
{ # of off-diagonal pivots, -1 if not computed  }
{ actual factorization flop count, from klu_flops  }
{ crude reciprocal condition est., from klu_rcond  }
{ accurate condition est., from klu_condest  }
{ reciprocal pivot rgrowth, from klu_rgrowth  }
{ actual work done in BTF, in klu_analyze  }
{ current memory usage, in bytes  }
{ peak memory usage, in bytes  }
type
  Pklu_common_struct = ^Tklu_common_struct;
  Tklu_common_struct = record
      tol : Tdouble;
      memgrow : Tdouble;
      initmem_amd : Tdouble;
      initmem : Tdouble;
      maxwork : Tdouble;
      btf : longint;
      ordering : longint;
      scale : longint;
      user_order : function (para1:Tint32_t; para2:Pint32_t; para3:Pint32_t; para4:Pint32_t; para5:Pklu_common_struct):Tint32_t;cdecl;
      user_data : pointer;
      halt_if_singular : longint;
      status : longint;
      nrealloc : longint;
      structural_rank : Tint32_t;
      numerical_rank : Tint32_t;
      singular_col : Tint32_t;
      noffdiag : Tint32_t;
      flops : Tdouble;
      rcond : Tdouble;
      condest : Tdouble;
      rgrowth : Tdouble;
      work : Tdouble;
      memusage : Tsize_t;
      mempeak : Tsize_t;
    end;
  Tklu_common = Tklu_common_struct;
  Pklu_common = ^Tklu_common;
{ 64-bit version (otherwise same as above) }

  Pklu_l_common_struct = ^Tklu_l_common_struct;
  Tklu_l_common_struct = record
      tol : Tdouble;
      memgrow : Tdouble;
      initmem_amd : Tdouble;
      initmem : Tdouble;
      maxwork : Tdouble;
      btf : longint;
      ordering : longint;
      scale : longint;
      user_order : function (para1:Tint64_t; para2:Pint64_t; para3:Pint64_t; para4:Pint64_t; para5:Pklu_l_common_struct):Tint64_t;cdecl;
      user_data : pointer;
      halt_if_singular : longint;
      status : longint;
      nrealloc : longint;
      structural_rank : Tint64_t;
      numerical_rank : Tint64_t;
      singular_col : Tint64_t;
      noffdiag : Tint64_t;
      flops : Tdouble;
      rcond : Tdouble;
      condest : Tdouble;
      rgrowth : Tdouble;
      work : Tdouble;
      memusage : Tsize_t;
      mempeak : Tsize_t;
    end;
  Tklu_l_common = Tklu_l_common_struct;
  Pklu_l_common = ^Tklu_l_common;
{ --------------------------------------------------------------------------  }
{ klu_defaults: sets default control parameters  }
{ --------------------------------------------------------------------------  }

function klu_defaults(Common:Pklu_common):longint;cdecl;external libklu;
function klu_l_defaults(Common:Pklu_l_common):longint;cdecl;external libklu;
{ --------------------------------------------------------------------------  }
{ klu_analyze:  orders and analyzes a matrix  }
{ --------------------------------------------------------------------------  }
{ Order the matrix with BTF (or not), then order each block with AMD, COLAMD,
 * a natural ordering, or with a user-provided ordering function  }
{ inputs, not modified  }
{ A is n-by-n  }
{ size n+1, column pointers  }
{ size nz, row indices  }
function klu_analyze(n:Tint32_t; Ap:Pint32_t; Ai:Pint32_t; Common:Pklu_common):Pklu_symbolic;cdecl;external libklu;
function klu_l_analyze(para1:Tint64_t; para2:Pint64_t; para3:Pint64_t; Common:Pklu_l_common):Pklu_l_symbolic;cdecl;external libklu;
{ --------------------------------------------------------------------------  }
{ klu_analyze_given: analyzes a matrix using given P and Q  }
{ --------------------------------------------------------------------------  }
{ Order the matrix with BTF (or not), then use natural or given ordering
 * P and Q on the blocks.  P and Q are interpretted as identity
 * if NULL.  }
{ inputs, not modified  }
{ A is n-by-n  }
{ size n+1, column pointers  }
{ size nz, row indices  }
{ size n, user's row permutation (may be NULL)  }
{ size n, user's column permutation (may be NULL)  }
function klu_analyze_given(n:Tint32_t; Ap:Pint32_t; Ai:Pint32_t; P:Pint32_t; Q:Pint32_t; 
           Common:Pklu_common):Pklu_symbolic;cdecl;external libklu;
function klu_l_analyze_given(para1:Tint64_t; para2:Pint64_t; para3:Pint64_t; para4:Pint64_t; para5:Pint64_t; 
           para6:Pklu_l_common):Pklu_l_symbolic;cdecl;external libklu;
{ --------------------------------------------------------------------------  }
{ klu_factor:  factors a matrix using the klu_analyze results  }
{ --------------------------------------------------------------------------  }
{ returns KLU_OK if OK, < 0 if error  }
{ inputs, not modified  }
{ size n+1, column pointers  }
{ size nz, row indices  }
{ size nz, numerical values  }
function klu_factor(Ap:Pint32_t; Ai:Pint32_t; Ax:Pdouble; Symbolic:Pklu_symbolic; Common:Pklu_common):Pklu_numeric;cdecl;external libklu;
{ returns KLU_OK if OK, < 0 if error  }
{ inputs, not modified  }
{ size n+1, column pointers  }
{ size nz, row indices  }
{ size 2*nz, numerical values (real,imag pairs)  }
function klu_z_factor(Ap:Pint32_t; Ai:Pint32_t; Ax:Pdouble; Symbolic:Pklu_symbolic; Common:Pklu_common):Pklu_numeric;cdecl;external libklu;
{ int64_t / real version  }
function klu_l_factor(para1:Pint64_t; para2:Pint64_t; para3:Pdouble; para4:Pklu_l_symbolic; para5:Pklu_l_common):Pklu_l_numeric;cdecl;external libklu;
{ int64_t / complex version  }
function klu_zl_factor(para1:Pint64_t; para2:Pint64_t; para3:Pdouble; para4:Pklu_l_symbolic; para5:Pklu_l_common):Pklu_l_numeric;cdecl;external libklu;
{ --------------------------------------------------------------------------  }
{ klu_solve: solves Ax=b using the Symbolic and Numeric objects  }
{ --------------------------------------------------------------------------  }
{ inputs, not modified  }
{ leading dimension of B  }
{ number of right-hand-sides  }
{ right-hand-side on input, overwritten with solution to Ax=b on output  }
{ size ldim*nrhs  }
function klu_solve(Symbolic:Pklu_symbolic; Numeric:Pklu_numeric; ldim:Tint32_t; nrhs:Tint32_t; B:Pdouble; 
           Common:Pklu_common):longint;cdecl;external libklu;
{ inputs, not modified  }
{ leading dimension of B  }
{ number of right-hand-sides  }
{ right-hand-side on input, overwritten with solution to Ax=b on output  }
{ size 2*ldim*nrhs  }
function klu_z_solve(Symbolic:Pklu_symbolic; Numeric:Pklu_numeric; ldim:Tint32_t; nrhs:Tint32_t; B:Pdouble; 
           Common:Pklu_common):longint;cdecl;external libklu;
function klu_l_solve(para1:Pklu_l_symbolic; para2:Pklu_l_numeric; para3:Tint64_t; para4:Tint64_t; para5:Pdouble; 
           para6:Pklu_l_common):longint;cdecl;external libklu;
function klu_zl_solve(para1:Pklu_l_symbolic; para2:Pklu_l_numeric; para3:Tint64_t; para4:Tint64_t; para5:Pdouble; 
           para6:Pklu_l_common):longint;cdecl;external libklu;
{ --------------------------------------------------------------------------  }
{ klu_tsolve: solves A'x=b using the Symbolic and Numeric objects  }
{ --------------------------------------------------------------------------  }
{ inputs, not modified  }
{ leading dimension of B  }
{ number of right-hand-sides  }
{ right-hand-side on input, overwritten with solution to Ax=b on output  }
{ size ldim*nrhs  }
function klu_tsolve(Symbolic:Pklu_symbolic; Numeric:Pklu_numeric; ldim:Tint32_t; nrhs:Tint32_t; B:Pdouble; 
           Common:Pklu_common):longint;cdecl;external libklu;
{ inputs, not modified  }
{ leading dimension of B  }
{ number of right-hand-sides  }
{ right-hand-side on input, overwritten with solution to Ax=b on output  }
{ size 2*ldim*nrhs  }
{ TRUE: conjugate solve, FALSE: solve A.'x=b  }
function klu_z_tsolve(Symbolic:Pklu_symbolic; Numeric:Pklu_numeric; ldim:Tint32_t; nrhs:Tint32_t; B:Pdouble; 
           conj_solve:longint; Common:Pklu_common):longint;cdecl;external libklu;
function klu_l_tsolve(para1:Pklu_l_symbolic; para2:Pklu_l_numeric; para3:Tint64_t; para4:Tint64_t; para5:Pdouble; 
           para6:Pklu_l_common):longint;cdecl;external libklu;
function klu_zl_tsolve(para1:Pklu_l_symbolic; para2:Pklu_l_numeric; para3:Tint64_t; para4:Tint64_t; para5:Pdouble; 
           para6:longint; para7:Pklu_l_common):longint;cdecl;external libklu;
{ --------------------------------------------------------------------------  }
{ klu_refactor: refactorizes matrix with same ordering as klu_factor  }
{ --------------------------------------------------------------------------  }
{ return TRUE if successful, FALSE otherwise  }
{ inputs, not modified  }
{ size n+1, column pointers  }
{ size nz, row indices  }
{ size nz, numerical values  }
{ input, and numerical values modified on output  }
function klu_refactor(Ap:Pint32_t; Ai:Pint32_t; Ax:Pdouble; Symbolic:Pklu_symbolic; Numeric:Pklu_numeric; 
           Common:Pklu_common):longint;cdecl;external libklu;
{ return TRUE if successful, FALSE otherwise  }
{ inputs, not modified  }
{ size n+1, column pointers  }
{ size nz, row indices  }
{ size 2*nz, numerical values  }
{ input, and numerical values modified on output  }
function klu_z_refactor(Ap:Pint32_t; Ai:Pint32_t; Ax:Pdouble; Symbolic:Pklu_symbolic; Numeric:Pklu_numeric; 
           Common:Pklu_common):longint;cdecl;external libklu;
function klu_l_refactor(para1:Pint64_t; para2:Pint64_t; para3:Pdouble; para4:Pklu_l_symbolic; para5:Pklu_l_numeric; 
           para6:Pklu_l_common):longint;cdecl;external libklu;
function klu_zl_refactor(para1:Pint64_t; para2:Pint64_t; para3:Pdouble; para4:Pklu_l_symbolic; para5:Pklu_l_numeric; 
           para6:Pklu_l_common):longint;cdecl;external libklu;
{ --------------------------------------------------------------------------  }
{ klu_free_symbolic: destroys the Symbolic object  }
{ --------------------------------------------------------------------------  }
function klu_free_symbolic(Symbolic:PPklu_symbolic; Common:Pklu_common):longint;cdecl;external libklu;
function klu_l_free_symbolic(para1:PPklu_l_symbolic; para2:Pklu_l_common):longint;cdecl;external libklu;
{ --------------------------------------------------------------------------  }
{ klu_free_numeric: destroys the Numeric object  }
{ --------------------------------------------------------------------------  }
{ Note that klu_free_numeric and klu_z_free_numeric are identical; each can
 * free both kinds of Numeric objects (real and complex)  }
function klu_free_numeric(Numeric:PPklu_numeric; Common:Pklu_common):longint;cdecl;external libklu;
function klu_z_free_numeric(Numeric:PPklu_numeric; Common:Pklu_common):longint;cdecl;external libklu;
function klu_l_free_numeric(para1:PPklu_l_numeric; para2:Pklu_l_common):longint;cdecl;external libklu;
function klu_zl_free_numeric(para1:PPklu_l_numeric; para2:Pklu_l_common):longint;cdecl;external libklu;
{ --------------------------------------------------------------------------  }
{ klu_sort: sorts the columns of the LU factorization  }
{ --------------------------------------------------------------------------  }
{ this is not needed except for the MATLAB interface  }
{ inputs, not modified  }
{ input/output  }
function klu_sort(Symbolic:Pklu_symbolic; Numeric:Pklu_numeric; Common:Pklu_common):longint;cdecl;external libklu;
{ inputs, not modified  }
{ input/output  }
function klu_z_sort(Symbolic:Pklu_symbolic; Numeric:Pklu_numeric; Common:Pklu_common):longint;cdecl;external libklu;
function klu_l_sort(para1:Pklu_l_symbolic; para2:Pklu_l_numeric; para3:Pklu_l_common):longint;cdecl;external libklu;
function klu_zl_sort(para1:Pklu_l_symbolic; para2:Pklu_l_numeric; para3:Pklu_l_common):longint;cdecl;external libklu;
{ --------------------------------------------------------------------------  }
{ klu_flops: determines # of flops performed in numeric factorzation  }
{ --------------------------------------------------------------------------  }
{ inputs, not modified  }
{ input/output  }
function klu_flops(Symbolic:Pklu_symbolic; Numeric:Pklu_numeric; Common:Pklu_common):longint;cdecl;external libklu;
{ inputs, not modified  }
{ input/output  }
function klu_z_flops(Symbolic:Pklu_symbolic; Numeric:Pklu_numeric; Common:Pklu_common):longint;cdecl;external libklu;
function klu_l_flops(para1:Pklu_l_symbolic; para2:Pklu_l_numeric; para3:Pklu_l_common):longint;cdecl;external libklu;
function klu_zl_flops(para1:Pklu_l_symbolic; para2:Pklu_l_numeric; para3:Pklu_l_common):longint;cdecl;external libklu;
{ --------------------------------------------------------------------------  }
{ klu_rgrowth : compute the reciprocal pivot growth  }
{ --------------------------------------------------------------------------  }
{ Pivot growth is computed after the input matrix is permuted, scaled, and
 * off-diagonal entries pruned.  This is because the LU factorization of each
 * block takes as input the scaled diagonal blocks of the BTF form.  The
 * reciprocal pivot growth in column j of an LU factorization of a matrix C
 * is the largest entry in C divided by the largest entry in U; then the overall
 * reciprocal pivot growth is the smallest such value for all columns j.  Note
 * that the off-diagonal entries are not scaled, since they do not take part in
 * the LU factorization of the diagonal blocks.
 *
 * In MATLAB notation:
 *
 * rgrowth = min (max (abs ((R \ A(p,q)) - F)) ./ max (abs (U)))  }
{ Common->rgrowth = reciprocal pivot growth  }
function klu_rgrowth(Ap:Pint32_t; Ai:Pint32_t; Ax:Pdouble; Symbolic:Pklu_symbolic; Numeric:Pklu_numeric; 
           Common:Pklu_common):longint;cdecl;external libklu;
{ Common->rgrowth = reciprocal pivot growth  }
function klu_z_rgrowth(Ap:Pint32_t; Ai:Pint32_t; Ax:Pdouble; Symbolic:Pklu_symbolic; Numeric:Pklu_numeric; 
           Common:Pklu_common):longint;cdecl;external libklu;
function klu_l_rgrowth(para1:Pint64_t; para2:Pint64_t; para3:Pdouble; para4:Pklu_l_symbolic; para5:Pklu_l_numeric; 
           para6:Pklu_l_common):longint;cdecl;external libklu;
function klu_zl_rgrowth(para1:Pint64_t; para2:Pint64_t; para3:Pdouble; para4:Pklu_l_symbolic; para5:Pklu_l_numeric; 
           para6:Pklu_l_common):longint;cdecl;external libklu;
{ --------------------------------------------------------------------------  }
{ klu_condest  }
{ --------------------------------------------------------------------------  }
{ Computes a reasonably accurate estimate of the 1-norm condition number, using
 * Hager's method, as modified by Higham and Tisseur (same method as used in
 * MATLAB's condest  }
{ size n+1, column pointers, not modified  }
{ size nz = Ap[n], numerical values, not modified }
{ symbolic analysis, not modified  }
{ numeric factorization, not modified  }
{ result returned in Common->condest  }
function klu_condest(Ap:Pint32_t; Ax:Pdouble; Symbolic:Pklu_symbolic; Numeric:Pklu_numeric; Common:Pklu_common):longint;cdecl;external libklu;
{ size 2*nz  }
{ result returned in Common->condest  }
function klu_z_condest(Ap:Pint32_t; Ax:Pdouble; Symbolic:Pklu_symbolic; Numeric:Pklu_numeric; Common:Pklu_common):longint;cdecl;external libklu;
function klu_l_condest(para1:Pint64_t; para2:Pdouble; para3:Pklu_l_symbolic; para4:Pklu_l_numeric; para5:Pklu_l_common):longint;cdecl;external libklu;
function klu_zl_condest(para1:Pint64_t; para2:Pdouble; para3:Pklu_l_symbolic; para4:Pklu_l_numeric; para5:Pklu_l_common):longint;cdecl;external libklu;
{ --------------------------------------------------------------------------  }
{ klu_rcond: compute min(abs(diag(U))) / max(abs(diag(U)))  }
{ --------------------------------------------------------------------------  }
{ input, not modified  }
{ input, not modified  }
{ result in Common->rcond  }
function klu_rcond(Symbolic:Pklu_symbolic; Numeric:Pklu_numeric; Common:Pklu_common):longint;cdecl;external libklu;
{ input, not modified  }
{ input, not modified  }
{ result in Common->rcond  }
function klu_z_rcond(Symbolic:Pklu_symbolic; Numeric:Pklu_numeric; Common:Pklu_common):longint;cdecl;external libklu;
function klu_l_rcond(para1:Pklu_l_symbolic; para2:Pklu_l_numeric; para3:Pklu_l_common):longint;cdecl;external libklu;
function klu_zl_rcond(para1:Pklu_l_symbolic; para2:Pklu_l_numeric; para3:Pklu_l_common):longint;cdecl;external libklu;
{ --------------------------------------------------------------------------  }
{ klu_scale  }
{ --------------------------------------------------------------------------  }
{ return TRUE if successful, FALSE otherwise  }
{ inputs, not modified  }
{ <0: none, no error check; 0: none, 1: sum, 2: max  }
{ size n+1, column pointers  }
{ size nz, row indices  }
{ outputs, not defined on input  }
{ workspace, not defined on input or output  }
{ size n, can be NULL  }
function klu_scale(scale:longint; n:Tint32_t; Ap:Pint32_t; Ai:Pint32_t; Ax:Pdouble; 
           Rs:Pdouble; W:Pint32_t; Common:Pklu_common):longint;cdecl;external libklu;
{ return TRUE if successful, FALSE otherwise  }
{ inputs, not modified  }
{ <0: none, no error check; 0: none, 1: sum, 2: max  }
{ size n+1, column pointers  }
{ size nz, row indices  }
{ outputs, not defined on input  }
{ workspace, not defined on input or output  }
{ size n, can be NULL  }
function klu_z_scale(scale:longint; n:Tint32_t; Ap:Pint32_t; Ai:Pint32_t; Ax:Pdouble; 
           Rs:Pdouble; W:Pint32_t; Common:Pklu_common):longint;cdecl;external libklu;
function klu_l_scale(para1:longint; para2:Tint64_t; para3:Pint64_t; para4:Pint64_t; para5:Pdouble; 
           para6:Pdouble; para7:Pint64_t; para8:Pklu_l_common):longint;cdecl;external libklu;
function klu_zl_scale(para1:longint; para2:Tint64_t; para3:Pint64_t; para4:Pint64_t; para5:Pdouble; 
           para6:Pdouble; para7:Pint64_t; para8:Pklu_l_common):longint;cdecl;external libklu;
{ --------------------------------------------------------------------------  }
{ klu_extract   }
{ --------------------------------------------------------------------------  }
{ returns TRUE if successful, FALSE otherwise  }
{ inputs:  }
{ outputs, either allocated on input, or ignored otherwise  }
{ L  }
{ size n+1  }
{ size Numeric->lnz  }
{ size Numeric->lnz  }
{ U  }
{ size n+1  }
{ size Numeric->unz  }
{ size Numeric->unz  }
{ F  }
{ size n+1  }
{ size Numeric->nzoff  }
{ size Numeric->nzoff  }
{ P, row permutation  }
{ size n  }
{ Q, column permutation  }
{ size n  }
{ Rs, scale factors  }
{ size n  }
{ R, block boundaries  }
{ size Symbolic->nblocks+1 (nblocks is at most n)  }
function klu_extract(Numeric:Pklu_numeric; Symbolic:Pklu_symbolic; Lp:Pint32_t; Li:Pint32_t; Lx:Pdouble; 
           Up:Pint32_t; Ui:Pint32_t; Ux:Pdouble; Fp:Pint32_t; Fi:Pint32_t; 
           Fx:Pdouble; P:Pint32_t; Q:Pint32_t; Rs:Pdouble; R:Pint32_t; 
           Common:Pklu_common):longint;cdecl;external libklu;
{ returns TRUE if successful, FALSE otherwise  }
{ inputs:  }
{ outputs, all of which must be allocated on input  }
{ L  }
{ size n+1  }
{ size nnz(L)  }
{ size nnz(L)  }
{ size nnz(L) for the complex case, ignored if real  }
{ U  }
{ size n+1  }
{ size nnz(U)  }
{ size nnz(U)  }
{ size nnz(U) for the complex case, ignored if real  }
{ F  }
{ size n+1  }
{ size nnz(F)  }
{ size nnz(F)  }
{ size nnz(F) for the complex case, ignored if real  }
{ P, row permutation  }
{ size n  }
{ Q, column permutation  }
{ size n  }
{ Rs, scale factors  }
{ size n  }
{ R, block boundaries  }
{ size Symbolic->nblocks+1 (nblocks is at most n)  }
function klu_z_extract(Numeric:Pklu_numeric; Symbolic:Pklu_symbolic; Lp:Pint32_t; Li:Pint32_t; Lx:Pdouble; 
           Lz:Pdouble; Up:Pint32_t; Ui:Pint32_t; Ux:Pdouble; Uz:Pdouble; 
           Fp:Pint32_t; Fi:Pint32_t; Fx:Pdouble; Fz:Pdouble; P:Pint32_t; 
           Q:Pint32_t; Rs:Pdouble; R:Pint32_t; Common:Pklu_common):longint;cdecl;external libklu;
function klu_l_extract(para1:Pklu_l_numeric; para2:Pklu_l_symbolic; para3:Pint64_t; para4:Pint64_t; para5:Pdouble; 
           para6:Pint64_t; para7:Pint64_t; para8:Pdouble; para9:Pint64_t; para10:Pint64_t; 
           para11:Pdouble; para12:Pint64_t; para13:Pint64_t; para14:Pdouble; para15:Pint64_t; 
           para16:Pklu_l_common):longint;cdecl;external libklu;
function klu_zl_extract(para1:Pklu_l_numeric; para2:Pklu_l_symbolic; para3:Pint64_t; para4:Pint64_t; para5:Pdouble; 
           para6:Pdouble; para7:Pint64_t; para8:Pint64_t; para9:Pdouble; para10:Pdouble; 
           para11:Pint64_t; para12:Pint64_t; para13:Pdouble; para14:Pdouble; para15:Pint64_t; 
           para16:Pint64_t; para17:Pdouble; para18:Pint64_t; para19:Pklu_l_common):longint;cdecl;external libklu;
{ --------------------------------------------------------------------------  }
{ KLU memory management routines  }
{ --------------------------------------------------------------------------  }
{ returns pointer to the newly malloc'd block  }
{ ---- input ----  }
{ number of items  }
{ size of each item  }
{ ---------------  }
function klu_malloc(n:Tsize_t; size:Tsize_t; Common:Pklu_common):pointer;cdecl;external libklu;
{ always returns NULL  }
{ ---- in/out ---  }
{ block of memory to free  }
{ number of items  }
{ size of each item  }
{ ---------------  }
function klu_free(p:pointer; n:Tsize_t; size:Tsize_t; Common:Pklu_common):pointer;cdecl;external libklu;
{ returns pointer to reallocated block  }
{ ---- input ----  }
{ requested # of items in reallocated block  }
{ current size of block, in # of items  }
{ size of each item  }
{ ---- in/out ---  }
{ block of memory to realloc  }
{ ---------------  }
function klu_realloc(nnew:Tsize_t; nold:Tsize_t; size:Tsize_t; p:pointer; Common:Pklu_common):pointer;cdecl;external libklu;
function klu_l_malloc(para1:Tsize_t; para2:Tsize_t; para3:Pklu_l_common):pointer;cdecl;external libklu;
function klu_l_free(para1:pointer; para2:Tsize_t; para3:Tsize_t; para4:Pklu_l_common):pointer;cdecl;external libklu;
function klu_l_realloc(para1:Tsize_t; para2:Tsize_t; para3:Tsize_t; para4:pointer; para5:Pklu_l_common):pointer;cdecl;external libklu;
{------------------------------------------------------------------------------ }
{ klu_version: return KLU version }
{------------------------------------------------------------------------------ }
procedure klu_version(version:array[0..2] of longint);cdecl;external libklu;
{ C++ end of extern C conditionnal removed }
{ ==========================================================================  }
{ === KLU version ==========================================================  }
{ ==========================================================================  }
{ All versions of KLU include these definitions.
 * As an example, to test if the version you are using is 1.2 or later:
 *
 *      if (KLU_VERSION >= KLU_VERSION_CODE (1,2)) ...
 *
 * This also works during compile-time:
 *
 *      #if (KLU >= KLU_VERSION_CODE (1,2))
 *          printf ("This is version 1.2 or later\n") ;
 *      #else
 *          printf ("This is an early version\n") ;
 *      #endif
  }
const
  KLU_DATE = 'Jan 20, 2024';  
  KLU_MAIN_VERSION = 2;  
  KLU_SUB_VERSION = 3;  
  KLU_SUBSUB_VERSION = 2;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function KLU_VERSION_CODE(main,sub : longint) : longint;

{ was #define dname def_expr }
function KLU_VERSION : longint; { return type might be wrong }

{$endif}

// === Konventiert am: 4-11-25 19:28:56 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function KLU_VERSION_CODE(main,sub : longint) : longint;
begin
  KLU_VERSION_CODE:=SUITESPARSE_VER_CODE(main,sub);
end;

{ was #define dname def_expr }
function KLU_VERSION : longint; { return type might be wrong }
  begin
    KLU_VERSION:=KLU_VERSION_CODE(2,3);
  end;


end.
