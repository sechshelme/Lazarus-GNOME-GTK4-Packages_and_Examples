unit SuiteSparseQR_C;

interface

uses
  fp_suitesparse;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ ==========================================================================  }
{ === SuiteSparseQR_C.h ====================================================  }
{ ==========================================================================  }
{ SPQR, Copyright (c) 2008-2023, Timothy A Davis. All Rights Reserved. }
{ SPDX-License-Identifier: GPL-2.0+ }
{ For inclusion in a C or C++ program.  }
{$ifndef SUITESPARSEQR_C_H}
{$define SUITESPARSEQR_C_H}
{$include "SuiteSparse_config.h"}
{$include "cholmod.h"}
{$include "SuiteSparseQR_definitions.h"}
{ C++ extern C conditionnal removed }
{ ==========================================================================  }
{ === SuiteSparseQR_C ======================================================  }
{ ==========================================================================  }
{ returns rank(A) estimate, (-1) if failure  }
{ inputs:  }
{ all, except 3:given treated as 0:fixed  }
{ columns with 2-norm <= tol treated as 0  }
{ e = max(min(m,econ),rank(A))  }
{ 0: Z=C (e-by-k), 1: Z=C', 2: Z=X (e-by-k)  }
{ m-by-n sparse matrix to factorize  }
{ sparse m-by-k B  }
{ dense  m-by-k B  }
{ outputs:  }
{ sparse Z  }
{ dense Z  }
{ e-by-n sparse matrix  }
{ size n column perm, NULL if identity  }
{ m-by-nh Householder vectors  }
{ size m row permutation  }
{ 1-by-nh Householder coefficients  }
{ workspace and parameters  }

function SuiteSparseQR_C(ordering:longint; tol:Tdouble; econ:Tint64_t; getCTX:longint; A:Pcholmod_sparse; 
           Bsparse:Pcholmod_sparse; Bdense:Pcholmod_dense; Zsparse:PPcholmod_sparse; Zdense:PPcholmod_dense; R:PPcholmod_sparse; 
           E:PPint64_t; H:PPcholmod_sparse; HPinv:PPint64_t; HTau:PPcholmod_dense; cc:Pcholmod_common):Tint64_t;cdecl;external libxxxxx;
{ returns rank(A) estimate, (-1) if failure  }
{ inputs:  }
{ all, except 3:given treated as 0:fixed  }
{ columns with 2-norm <= tol treated as 0  }
{ e = max(min(m,econ),rank(A))  }
{ 0: Z=C (e-by-k), 1: Z=C', 2: Z=X (e-by-k)  }
{ m-by-n sparse matrix to factorize  }
{ sparse m-by-k B  }
{ dense  m-by-k B  }
{ outputs:  }
{ sparse Z  }
{ dense Z  }
{ e-by-n sparse matrix  }
{ size n column perm, NULL if identity  }
{ m-by-nh Householder vectors  }
{ size m row permutation  }
{ 1-by-nh Householder coefficients  }
{ workspace and parameters  }
function SuiteSparseQR_i_C(ordering:longint; tol:Tdouble; econ:Tint32_t; getCTX:longint; A:Pcholmod_sparse; 
           Bsparse:Pcholmod_sparse; Bdense:Pcholmod_dense; Zsparse:PPcholmod_sparse; Zdense:PPcholmod_dense; R:PPcholmod_sparse; 
           E:PPint32_t; H:PPcholmod_sparse; HPinv:PPint32_t; HTau:PPcholmod_dense; cc:Pcholmod_common):Tint32_t;cdecl;external libxxxxx;
{ ==========================================================================  }
{ === SuiteSparseQR_C_QR ===================================================  }
{ ==========================================================================  }
{ [Q,R,E] = qr(A), returning Q as a sparse matrix  }
{ returns rank(A) est., (-1) if failure  }
{ inputs:  }
{ all, except 3:given treated as 0:fixed  }
{ columns with 2-norm <= tol treated as 0  }
{ e = max(min(m,econ),rank(A))  }
{ m-by-n sparse matrix to factorize  }
{ outputs:  }
{ m-by-e sparse matrix  }
{ e-by-n sparse matrix  }
{ size n column perm, NULL if identity  }
{ workspace and parameters  }
function SuiteSparseQR_C_QR(ordering:longint; tol:Tdouble; econ:Tint64_t; A:Pcholmod_sparse; Q:PPcholmod_sparse; 
           R:PPcholmod_sparse; E:PPint64_t; cc:Pcholmod_common):Tint64_t;cdecl;external libxxxxx;
{ returns rank(A) estimate, (-1) if failure }
{ inputs: }
{ all, except 3:given treated as 0:fixed }
{ columns with 2-norm <= tol are treated as 0 }
{ e = max(min(m,econ),rank(A)) }
{ m-by-n sparse matrix to factorize }
{ outputs: }
{ m-by-e sparse matrix }
{ e-by-n sparse matrix }
{ size n column permutation, NULL if identity }
{ workspace and parameters }
function SuiteSparseQR_i_C_QR(ordering:longint; tol:Tdouble; econ:Tint32_t; A:Pcholmod_sparse; Q:PPcholmod_sparse; 
           R:PPcholmod_sparse; E:PPint32_t; cc:Pcholmod_common):Tint32_t;cdecl;external libxxxxx;
{ ==========================================================================  }
{ === SuiteSparseQR_C_backslash ============================================  }
{ ==========================================================================  }
{ X = A\B where B is dense  }
{ returns X, NULL if failure  }
{ all, except 3:given treated as 0:fixed  }
{ columns with 2-norm <= tol treated as 0  }
{ m-by-n sparse matrix  }
{ m-by-k  }
{ workspace and parameters  }
function SuiteSparseQR_C_backslash(ordering:longint; tol:Tdouble; A:Pcholmod_sparse; B:Pcholmod_dense; cc:Pcholmod_common):Pcholmod_dense;cdecl;external libxxxxx;
{ ==========================================================================  }
{ === SuiteSparseQR_C_backslash_default ====================================  }
{ ==========================================================================  }
{ X = A\B where B is dense, using default ordering and tol  }
{ returns X, NULL if failure }
{ m-by-n sparse matrix  }
{ m-by-k  }
{ workspace and parameters  }
function SuiteSparseQR_C_backslash_default(A:Pcholmod_sparse; B:Pcholmod_dense; cc:Pcholmod_common):Pcholmod_dense;cdecl;external libxxxxx;
{ ==========================================================================  }
{ === SuiteSparseQR_C_backslash_sparse =====================================  }
{ ==========================================================================  }
{ X = A\B where B is sparse  }
{ returns X, or NULL  }
{ inputs:  }
{ all, except 3:given treated as 0:fixed  }
{ columns with 2-norm <= tol treated as 0  }
{ m-by-n sparse matrix  }
{ m-by-k  }
{ workspace and parameters  }
function SuiteSparseQR_C_backslash_sparse(ordering:longint; tol:Tdouble; A:Pcholmod_sparse; B:Pcholmod_sparse; cc:Pcholmod_common):Pcholmod_sparse;cdecl;external libxxxxx;
{$ifndef NEXPERT}
{ ==========================================================================  }
{ === SuiteSparseQR_C_factorization ========================================  }
{ ==========================================================================  }
{ A real or complex QR factorization, computed by SuiteSparseQR_C_factorize  }
{ CHOLMOD_REAL or CHOLMOD_COMPLEX  }
{ from SuiteSparseQR_factorize <double> or
                                        SuiteSparseQR_factorize <Complex>  }
type
  PSuiteSparseQR_C_factorization_struct = ^TSuiteSparseQR_C_factorization_struct;
  TSuiteSparseQR_C_factorization_struct = record
      xtype : longint;
      itype : longint;
      factors : pointer;
    end;
  TSuiteSparseQR_C_factorization = TSuiteSparseQR_C_factorization_struct;
  PSuiteSparseQR_C_factorization = ^TSuiteSparseQR_C_factorization;
{ ==========================================================================  }
{ === SuiteSparseQR_C_factorize ============================================  }
{ ==========================================================================  }
{ inputs:  }
{ all, except 3:given treated as 0:fixed  }
{ columns with 2-norm <= tol treated as 0  }
{ m-by-n sparse matrix  }
{ workspace and parameters  }

function SuiteSparseQR_C_factorize(ordering:longint; tol:Tdouble; A:Pcholmod_sparse; cc:Pcholmod_common):PSuiteSparseQR_C_factorization;cdecl;external libxxxxx;
{ ==========================================================================  }
{ === SuiteSparseQR_C_symbolic =============================================  }
{ ==========================================================================  }
{ inputs:  }
{ all, except 3:given treated as 0:fixed  }
{ if TRUE allow tol for rank detection  }
{ m-by-n sparse matrix, A->x ignored  }
{ workspace and parameters  }
function SuiteSparseQR_C_symbolic(ordering:longint; allow_tol:longint; A:Pcholmod_sparse; cc:Pcholmod_common):PSuiteSparseQR_C_factorization;cdecl;external libxxxxx;
{ ==========================================================================  }
{ === SuiteSparseQR_C_numeric ==============================================  }
{ ==========================================================================  }
{ inputs:  }
{ treat columns with 2-norm <= tol as zero  }
{ sparse matrix to factorize  }
{ input/output:  }
{ workspace and parameters  }
function SuiteSparseQR_C_numeric(tol:Tdouble; A:Pcholmod_sparse; QR:PSuiteSparseQR_C_factorization; cc:Pcholmod_common):longint;cdecl;external libxxxxx;
{ ==========================================================================  }
{ === SuiteSparseQR_C_free =================================================  }
{ ==========================================================================  }
{ Free the QR factors computed by SuiteSparseQR_C_factorize  }
{ returns TRUE (1) if OK, FALSE (0) otherwise }
{ workspace and parameters  }
function SuiteSparseQR_C_free(QR:PPSuiteSparseQR_C_factorization; cc:Pcholmod_common):longint;cdecl;external libxxxxx;
{ ==========================================================================  }
{ === SuiteSparseQR_C_solve ================================================  }
{ ==========================================================================  }
{ returnx X, or NULL if failure  }
{ which system to solve  }
{ of an m-by-n sparse matrix A  }
{ right-hand-side, m-by-k or n-by-k  }
{ workspace and parameters  }
function SuiteSparseQR_C_solve(system:longint; QR:PSuiteSparseQR_C_factorization; B:Pcholmod_dense; cc:Pcholmod_common):Pcholmod_dense;cdecl;external libxxxxx;
{ ==========================================================================  }
{ === SuiteSparseQR_C_qmult ================================================  }
{ ==========================================================================  }
{
    Applies Q in Householder form (as stored in the QR factorization object
    returned by SuiteSparseQR_C_factorize) to a dense matrix X.

    method SPQR_QTX (0): Y = Q'*X
    method SPQR_QX  (1): Y = Q*X
    method SPQR_XQT (2): Y = X*Q'
    method SPQR_XQ  (3): Y = X*Q
 }
{ returns Y, or NULL on failure  }
{ inputs:  }
{ 0,1,2,3  }
{ of an m-by-n sparse matrix A  }
{ size m-by-n with leading dimension ldx  }
{ workspace and parameters  }
function SuiteSparseQR_C_qmult(method:longint; QR:PSuiteSparseQR_C_factorization; X:Pcholmod_dense; cc:Pcholmod_common):Pcholmod_dense;cdecl;external libxxxxx;
{$endif}

procedure SuiteSparseQR_C_version(version:array[0..2] of longint);cdecl;external libxxxxx;
{ ==========================================================================  }
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 4-11-25 19:29:32 ===


implementation



end.
