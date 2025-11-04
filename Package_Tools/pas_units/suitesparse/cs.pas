unit cs;

interface

uses
  fp_suitesparse;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{------------------------------------------------------------------------------ }
{ CXSparse/Include/cs.h: include file for CXSparse }
{------------------------------------------------------------------------------ }
{ CXSparse, Copyright (c) 2006-2024, Timothy A. Davis, All Rights Reserved }
{ SPDX-License-Identifier: LGPL-2.1+ }
{------------------------------------------------------------------------------ }
{ This is the CXSparse/Include/cs.h file.  It has the same name (cs.h) as
   the CSparse/Include/cs.h file.  The 'make install' for SuiteSparse installs
   CXSparse, and this file, instead of CSparse.  The two packages have the same
   cs.h include filename, because CXSparse is a superset of CSparse.  Any user
   program that uses CSparse can rely on CXSparse instead, with no change to the
   user code.  The #include "cs.h" line will work for both versions, in user
   code, and the function names and user-visible typedefs from CSparse all
   appear in CXSparse.  For experimenting and changing the package itself, I
   recommend using CSparse since it's simpler and easier to modify.  For
   using the package in production codes, I recommend CXSparse since it has
   more features (support for complex matrices, and both int32_t and int64_t
   versions).
  }
{------------------------------------------------------------------------------ }
{$ifndef _CXS_H}
{$define _CXS_H}

const
  cs_complex_t = double_Complex;  
{ CXSparse Version  }
  CS_VER = 4;  
  CS_SUBVER = 3;  
  CS_SUBSUB = 1;  
{ CXSparse release date  }
  CS_DATE = 'Jan 10, 2024';  
  CS_COPYRIGHT = 'Copyright (c) Timothy A. Davis, 2006-2024';  
{$define CXSPARSE}
{$include "SuiteSparse_config.h"}

const
  cs_long_t = int64_t;  
  cs_long_t_max = INT64_MAX;  
{ C++ extern C conditionnal removed }

procedure cxsparse_version(version:array[0..2] of longint);cdecl;external libcs;
{ return version }
{ --------------------------------------------------------------------------  }
{ double/int32_t version of CXSparse  }
{ --------------------------------------------------------------------------  }
{ --- primary CSparse routines and data structures -------------------------  }
{ matrix in compressed-column or triplet form  }
{ maximum number of entries  }
{ number of rows  }
{ number of columns  }
{ column pointers (size n+1) or col indices (size nzmax)  }
{ row indices, size nzmax  }
{ numerical values, size nzmax  }
{ # of entries in triplet matrix, -1 for compressed-col  }
type
  Pcs_di_sparse = ^Tcs_di_sparse;
  Tcs_di_sparse = record
      nzmax : Tint32_t;
      m : Tint32_t;
      n : Tint32_t;
      p : Pint32_t;
      i : Pint32_t;
      x : Pdouble;
      nz : Tint32_t;
    end;
  Tcs_di = Tcs_di_sparse;
  Pcs_di = ^Tcs_di;

function cs_di_add(A:Pcs_di; B:Pcs_di; alpha:Tdouble; beta:Tdouble):Pcs_di;cdecl;external libcs;
function cs_di_cholsol(order:Tint32_t; A:Pcs_di; b:Pdouble):Tint32_t;cdecl;external libcs;
function cs_di_dupl(A:Pcs_di):Tint32_t;cdecl;external libcs;
function cs_di_entry(T:Pcs_di; i:Tint32_t; j:Tint32_t; x:Tdouble):Tint32_t;cdecl;external libcs;
function cs_di_lusol(order:Tint32_t; A:Pcs_di; b:Pdouble; tol:Tdouble):Tint32_t;cdecl;external libcs;
function cs_di_gaxpy(A:Pcs_di; x:Pdouble; y:Pdouble):Tint32_t;cdecl;external libcs;
function cs_di_multiply(A:Pcs_di; B:Pcs_di):Pcs_di;cdecl;external libcs;
function cs_di_qrsol(order:Tint32_t; A:Pcs_di; b:Pdouble):Tint32_t;cdecl;external libcs;
function cs_di_transpose(A:Pcs_di; values:Tint32_t):Pcs_di;cdecl;external libcs;
function cs_di_compress(T:Pcs_di):Pcs_di;cdecl;external libcs;
function cs_di_norm(A:Pcs_di):Tdouble;cdecl;external libcs;
function cs_di_print(A:Pcs_di; brief:Tint32_t):Tint32_t;cdecl;external libcs;
function cs_di_load(f:PFILE):Pcs_di;cdecl;external libcs;
{ utilities  }
function cs_di_calloc(n:Tint32_t; size:Tsize_t):pointer;cdecl;external libcs;
function cs_di_free(p:pointer):pointer;cdecl;external libcs;
function cs_di_realloc(p:pointer; n:Tint32_t; size:Tsize_t; ok:Pint32_t):pointer;cdecl;external libcs;
function cs_di_spalloc(m:Tint32_t; n:Tint32_t; nzmax:Tint32_t; values:Tint32_t; t:Tint32_t):Pcs_di;cdecl;external libcs;
function cs_di_spfree(A:Pcs_di):Pcs_di;cdecl;external libcs;
function cs_di_sprealloc(A:Pcs_di; nzmax:Tint32_t):Tint32_t;cdecl;external libcs;
function cs_di_malloc(n:Tint32_t; size:Tsize_t):pointer;cdecl;external libcs;
{ --- secondary CSparse routines and data structures -----------------------  }
{ symbolic Cholesky, LU, or QR analysis  }
{ inverse row perm. for QR, fill red. perm for Chol  }
{ fill-reducing column permutation for LU and QR  }
{ elimination tree for Cholesky and QR  }
{ column pointers for Cholesky, row counts for QR  }
{ leftmost[i] = min(find(A(i,:))), for QR  }
{ # of rows for QR, after adding fictitious rows  }
{ # entries in L for LU or Cholesky; in V for QR  }
{ # entries in U for LU; in R for QR  }
type
  Pcs_di_symbolic = ^Tcs_di_symbolic;
  Tcs_di_symbolic = record
      pinv : Pint32_t;
      q : Pint32_t;
      parent : Pint32_t;
      cp : Pint32_t;
      leftmost : Pint32_t;
      m2 : Tint32_t;
      lnz : Tdouble;
      unz : Tdouble;
    end;
  Tcs_dis = Tcs_di_symbolic;
  Pcs_dis = ^Tcs_dis;
{ numeric Cholesky, LU, or QR factorization  }
{ L for LU and Cholesky, V for QR  }
{ U for LU, r for QR, not used for Cholesky  }
{ partial pivoting for LU  }
{ beta [0..n-1] for QR  }

  Pcs_di_numeric = ^Tcs_di_numeric;
  Tcs_di_numeric = record
      L : Pcs_di;
      U : Pcs_di;
      pinv : Pint32_t;
      B : Pdouble;
    end;
  Tcs_din = Tcs_di_numeric;
  Pcs_din = ^Tcs_din;
{ cs_di_dmperm or cs_di_scc output  }
{ size m, row permutation  }
{ size n, column permutation  }
{ size nb+1, block k is rows r[k] to r[k+1]-1 in A(p,q)  }
{ size nb+1, block k is cols s[k] to s[k+1]-1 in A(p,q)  }
{ # of blocks in fine dmperm decomposition  }
{ coarse row decomposition  }
{ coarse column decomposition  }

  Pcs_di_dmperm_results = ^Tcs_di_dmperm_results;
  Tcs_di_dmperm_results = record
      p : Pint32_t;
      q : Pint32_t;
      r : Pint32_t;
      s : Pint32_t;
      nb : Tint32_t;
      rr : array[0..4] of Tint32_t;
      cc : array[0..4] of Tint32_t;
    end;
  Tcs_did = Tcs_di_dmperm_results;
  Pcs_did = ^Tcs_did;

function cs_di_amd(order:Tint32_t; A:Pcs_di):Pint32_t;cdecl;external libcs;
function cs_di_chol(A:Pcs_di; S:Pcs_dis):Pcs_din;cdecl;external libcs;
function cs_di_dmperm(A:Pcs_di; seed:Tint32_t):Pcs_did;cdecl;external libcs;
function cs_di_droptol(A:Pcs_di; tol:Tdouble):Tint32_t;cdecl;external libcs;
function cs_di_dropzeros(A:Pcs_di):Tint32_t;cdecl;external libcs;
function cs_di_happly(V:Pcs_di; i:Tint32_t; beta:Tdouble; x:Pdouble):Tint32_t;cdecl;external libcs;
function cs_di_ipvec(p:Pint32_t; b:Pdouble; x:Pdouble; n:Tint32_t):Tint32_t;cdecl;external libcs;
function cs_di_lsolve(L:Pcs_di; x:Pdouble):Tint32_t;cdecl;external libcs;
function cs_di_ltsolve(L:Pcs_di; x:Pdouble):Tint32_t;cdecl;external libcs;
function cs_di_lu(A:Pcs_di; S:Pcs_dis; tol:Tdouble):Pcs_din;cdecl;external libcs;
function cs_di_permute(A:Pcs_di; pinv:Pint32_t; q:Pint32_t; values:Tint32_t):Pcs_di;cdecl;external libcs;
function cs_di_pinv(p:Pint32_t; n:Tint32_t):Pint32_t;cdecl;external libcs;
function cs_di_pvec(p:Pint32_t; b:Pdouble; x:Pdouble; n:Tint32_t):Tint32_t;cdecl;external libcs;
function cs_di_qr(A:Pcs_di; S:Pcs_dis):Pcs_din;cdecl;external libcs;
function cs_di_schol(order:Tint32_t; A:Pcs_di):Pcs_dis;cdecl;external libcs;
function cs_di_sqr(order:Tint32_t; A:Pcs_di; qr:Tint32_t):Pcs_dis;cdecl;external libcs;
function cs_di_symperm(A:Pcs_di; pinv:Pint32_t; values:Tint32_t):Pcs_di;cdecl;external libcs;
function cs_di_usolve(U:Pcs_di; x:Pdouble):Tint32_t;cdecl;external libcs;
function cs_di_utsolve(U:Pcs_di; x:Pdouble):Tint32_t;cdecl;external libcs;
function cs_di_updown(L:Pcs_di; sigma:Tint32_t; C:Pcs_di; parent:Pint32_t):Tint32_t;cdecl;external libcs;
{ utilities  }
function cs_di_sfree(S:Pcs_dis):Pcs_dis;cdecl;external libcs;
function cs_di_nfree(N:Pcs_din):Pcs_din;cdecl;external libcs;
function cs_di_dfree(D:Pcs_did):Pcs_did;cdecl;external libcs;
{ --- tertiary CSparse routines --------------------------------------------  }
function cs_di_counts(A:Pcs_di; parent:Pint32_t; post:Pint32_t; ata:Tint32_t):Pint32_t;cdecl;external libcs;
function cs_di_cumsum(p:Pint32_t; c:Pint32_t; n:Tint32_t):Tdouble;cdecl;external libcs;
function cs_di_dfs(j:Tint32_t; G:Pcs_di; top:Tint32_t; xi:Pint32_t; pstack:Pint32_t; 
           pinv:Pint32_t):Tint32_t;cdecl;external libcs;
function cs_di_etree(A:Pcs_di; ata:Tint32_t):Pint32_t;cdecl;external libcs;
function cs_di_fkeep(A:Pcs_di; fkeep:function (para1:Tint32_t; para2:Tint32_t; para3:Tdouble; para4:pointer):Tint32_t; other:pointer):Tint32_t;cdecl;external libcs;
function cs_di_house(x:Pdouble; beta:Pdouble; n:Tint32_t):Tdouble;cdecl;external libcs;
function cs_di_maxtrans(A:Pcs_di; seed:Tint32_t):Pint32_t;cdecl;external libcs;
function cs_di_post(parent:Pint32_t; n:Tint32_t):Pint32_t;cdecl;external libcs;
function cs_di_scc(A:Pcs_di):Pcs_did;cdecl;external libcs;
function cs_di_scatter(A:Pcs_di; j:Tint32_t; beta:Tdouble; w:Pint32_t; x:Pdouble; 
           mark:Tint32_t; C:Pcs_di; nz:Tint32_t):Tint32_t;cdecl;external libcs;
function cs_di_tdfs(j:Tint32_t; k:Tint32_t; head:Pint32_t; next:Pint32_t; post:Pint32_t; 
           stack:Pint32_t):Tint32_t;cdecl;external libcs;
function cs_di_leaf(i:Tint32_t; j:Tint32_t; first:Pint32_t; maxfirst:Pint32_t; prevleaf:Pint32_t; 
           ancestor:Pint32_t; jleaf:Pint32_t):Tint32_t;cdecl;external libcs;
function cs_di_reach(G:Pcs_di; B:Pcs_di; k:Tint32_t; xi:Pint32_t; pinv:Pint32_t):Tint32_t;cdecl;external libcs;
function cs_di_spsolve(L:Pcs_di; B:Pcs_di; k:Tint32_t; xi:Pint32_t; x:Pdouble; 
           pinv:Pint32_t; lo:Tint32_t):Tint32_t;cdecl;external libcs;
function cs_di_ereach(A:Pcs_di; k:Tint32_t; parent:Pint32_t; s:Pint32_t; w:Pint32_t):Tint32_t;cdecl;external libcs;
function cs_di_randperm(n:Tint32_t; seed:Tint32_t):Pint32_t;cdecl;external libcs;
{ utilities  }
function cs_di_dalloc(m:Tint32_t; n:Tint32_t):Pcs_did;cdecl;external libcs;
function cs_di_done(C:Pcs_di; w:pointer; x:pointer; ok:Tint32_t):Pcs_di;cdecl;external libcs;
function cs_di_idone(p:Pint32_t; C:Pcs_di; w:pointer; ok:Tint32_t):Pint32_t;cdecl;external libcs;
function cs_di_ndone(N:Pcs_din; C:Pcs_di; w:pointer; x:pointer; ok:Tint32_t):Pcs_din;cdecl;external libcs;
function cs_di_ddone(D:Pcs_did; C:Pcs_di; w:pointer; ok:Tint32_t):Pcs_did;cdecl;external libcs;
{ --------------------------------------------------------------------------  }
{ double/int64_t version of CXSparse  }
{ --------------------------------------------------------------------------  }
{ --- primary CSparse routines and data structures -------------------------  }
{ matrix in compressed-column or triplet form  }
{ maximum number of entries  }
{ number of rows  }
{ number of columns  }
{ column pointers (size n+1) or col indlces (size nzmax)  }
{ row indices, size nzmax  }
{ numerical values, size nzmax  }
{ # of entries in triplet matrix, -1 for compressed-col  }
type
  Pcs_dl_sparse = ^Tcs_dl_sparse;
  Tcs_dl_sparse = record
      nzmax : Tint64_t;
      m : Tint64_t;
      n : Tint64_t;
      p : Pint64_t;
      i : Pint64_t;
      x : Pdouble;
      nz : Tint64_t;
    end;
  Tcs_dl = Tcs_dl_sparse;
  Pcs_dl = ^Tcs_dl;

function cs_dl_add(A:Pcs_dl; B:Pcs_dl; alpha:Tdouble; beta:Tdouble):Pcs_dl;cdecl;external libcs;
function cs_dl_cholsol(order:Tint64_t; A:Pcs_dl; b:Pdouble):Tint64_t;cdecl;external libcs;
function cs_dl_dupl(A:Pcs_dl):Tint64_t;cdecl;external libcs;
function cs_dl_entry(T:Pcs_dl; i:Tint64_t; j:Tint64_t; x:Tdouble):Tint64_t;cdecl;external libcs;
function cs_dl_lusol(order:Tint64_t; A:Pcs_dl; b:Pdouble; tol:Tdouble):Tint64_t;cdecl;external libcs;
function cs_dl_gaxpy(A:Pcs_dl; x:Pdouble; y:Pdouble):Tint64_t;cdecl;external libcs;
function cs_dl_multiply(A:Pcs_dl; B:Pcs_dl):Pcs_dl;cdecl;external libcs;
function cs_dl_qrsol(order:Tint64_t; A:Pcs_dl; b:Pdouble):Tint64_t;cdecl;external libcs;
function cs_dl_transpose(A:Pcs_dl; values:Tint64_t):Pcs_dl;cdecl;external libcs;
function cs_dl_compress(T:Pcs_dl):Pcs_dl;cdecl;external libcs;
function cs_dl_norm(A:Pcs_dl):Tdouble;cdecl;external libcs;
function cs_dl_print(A:Pcs_dl; brief:Tint64_t):Tint64_t;cdecl;external libcs;
function cs_dl_load(f:PFILE):Pcs_dl;cdecl;external libcs;
{ utilities  }
function cs_dl_calloc(n:Tint64_t; size:Tsize_t):pointer;cdecl;external libcs;
function cs_dl_free(p:pointer):pointer;cdecl;external libcs;
function cs_dl_realloc(p:pointer; n:Tint64_t; size:Tsize_t; ok:Pint64_t):pointer;cdecl;external libcs;
function cs_dl_spalloc(m:Tint64_t; n:Tint64_t; nzmax:Tint64_t; values:Tint64_t; t:Tint64_t):Pcs_dl;cdecl;external libcs;
function cs_dl_spfree(A:Pcs_dl):Pcs_dl;cdecl;external libcs;
function cs_dl_sprealloc(A:Pcs_dl; nzmax:Tint64_t):Tint64_t;cdecl;external libcs;
function cs_dl_malloc(n:Tint64_t; size:Tsize_t):pointer;cdecl;external libcs;
{ --- secondary CSparse routines and data structures -----------------------  }
{ symbolic Cholesky, LU, or QR analysis  }
{ inverse row perm. for QR, fill red. perm for Chol  }
{ fill-reducing column permutation for LU and QR  }
{ elimination tree for Cholesky and QR  }
{ column pointers for Cholesky, row counts for QR  }
{ leftmost[i] = min(find(A(i,:))), for QR  }
{ # of rows for QR, after adding fictitious rows  }
{ # entries in L for LU or Cholesky; in V for QR  }
{ # entries in U for LU; in R for QR  }
type
  Pcs_dl_symbolic = ^Tcs_dl_symbolic;
  Tcs_dl_symbolic = record
      pinv : Pint64_t;
      q : Pint64_t;
      parent : Pint64_t;
      cp : Pint64_t;
      leftmost : Pint64_t;
      m2 : Tint64_t;
      lnz : Tdouble;
      unz : Tdouble;
    end;
  Tcs_dls = Tcs_dl_symbolic;
  Pcs_dls = ^Tcs_dls;
{ numeric Cholesky, LU, or QR factorization  }
{ L for LU and Cholesky, V for QR  }
{ U for LU, r for QR, not used for Cholesky  }
{ partial pivoting for LU  }
{ beta [0..n-1] for QR  }

  Pcs_dl_numeric = ^Tcs_dl_numeric;
  Tcs_dl_numeric = record
      L : Pcs_dl;
      U : Pcs_dl;
      pinv : Pint64_t;
      B : Pdouble;
    end;
  Tcs_dln = Tcs_dl_numeric;
  Pcs_dln = ^Tcs_dln;
{ cs_dl_dmperm or cs_dl_scc output  }
{ size m, row permutation  }
{ size n, column permutation  }
{ size nb+1, block k is rows r[k] to r[k+1]-1 in A(p,q)  }
{ size nb+1, block k is cols s[k] to s[k+1]-1 in A(p,q)  }
{ # of blocks in fine dmperm decomposition  }
{ coarse row decomposition  }
{ coarse column decomposition  }

  Pcs_dl_dmperm_results = ^Tcs_dl_dmperm_results;
  Tcs_dl_dmperm_results = record
      p : Pint64_t;
      q : Pint64_t;
      r : Pint64_t;
      s : Pint64_t;
      nb : Tint64_t;
      rr : array[0..4] of Tint64_t;
      cc : array[0..4] of Tint64_t;
    end;
  Tcs_dld = Tcs_dl_dmperm_results;
  Pcs_dld = ^Tcs_dld;

function cs_dl_amd(order:Tint64_t; A:Pcs_dl):Pint64_t;cdecl;external libcs;
function cs_dl_chol(A:Pcs_dl; S:Pcs_dls):Pcs_dln;cdecl;external libcs;
function cs_dl_dmperm(A:Pcs_dl; seed:Tint64_t):Pcs_dld;cdecl;external libcs;
function cs_dl_droptol(A:Pcs_dl; tol:Tdouble):Tint64_t;cdecl;external libcs;
function cs_dl_dropzeros(A:Pcs_dl):Tint64_t;cdecl;external libcs;
function cs_dl_happly(V:Pcs_dl; i:Tint64_t; beta:Tdouble; x:Pdouble):Tint64_t;cdecl;external libcs;
function cs_dl_ipvec(p:Pint64_t; b:Pdouble; x:Pdouble; n:Tint64_t):Tint64_t;cdecl;external libcs;
function cs_dl_lsolve(L:Pcs_dl; x:Pdouble):Tint64_t;cdecl;external libcs;
function cs_dl_ltsolve(L:Pcs_dl; x:Pdouble):Tint64_t;cdecl;external libcs;
function cs_dl_lu(A:Pcs_dl; S:Pcs_dls; tol:Tdouble):Pcs_dln;cdecl;external libcs;
function cs_dl_permute(A:Pcs_dl; pinv:Pint64_t; q:Pint64_t; values:Tint64_t):Pcs_dl;cdecl;external libcs;
function cs_dl_pinv(p:Pint64_t; n:Tint64_t):Pint64_t;cdecl;external libcs;
function cs_dl_pvec(p:Pint64_t; b:Pdouble; x:Pdouble; n:Tint64_t):Tint64_t;cdecl;external libcs;
function cs_dl_qr(A:Pcs_dl; S:Pcs_dls):Pcs_dln;cdecl;external libcs;
function cs_dl_schol(order:Tint64_t; A:Pcs_dl):Pcs_dls;cdecl;external libcs;
function cs_dl_sqr(order:Tint64_t; A:Pcs_dl; qr:Tint64_t):Pcs_dls;cdecl;external libcs;
function cs_dl_symperm(A:Pcs_dl; pinv:Pint64_t; values:Tint64_t):Pcs_dl;cdecl;external libcs;
function cs_dl_usolve(U:Pcs_dl; x:Pdouble):Tint64_t;cdecl;external libcs;
function cs_dl_utsolve(U:Pcs_dl; x:Pdouble):Tint64_t;cdecl;external libcs;
function cs_dl_updown(L:Pcs_dl; sigma:Tint64_t; C:Pcs_dl; parent:Pint64_t):Tint64_t;cdecl;external libcs;
{ utilities  }
function cs_dl_sfree(S:Pcs_dls):Pcs_dls;cdecl;external libcs;
function cs_dl_nfree(N:Pcs_dln):Pcs_dln;cdecl;external libcs;
function cs_dl_dfree(D:Pcs_dld):Pcs_dld;cdecl;external libcs;
{ --- tertiary CSparse routines --------------------------------------------  }
function cs_dl_counts(A:Pcs_dl; parent:Pint64_t; post:Pint64_t; ata:Tint64_t):Pint64_t;cdecl;external libcs;
function cs_dl_cumsum(p:Pint64_t; c:Pint64_t; n:Tint64_t):Tdouble;cdecl;external libcs;
function cs_dl_dfs(j:Tint64_t; G:Pcs_dl; top:Tint64_t; xi:Pint64_t; pstack:Pint64_t; 
           pinv:Pint64_t):Tint64_t;cdecl;external libcs;
function cs_dl_etree(A:Pcs_dl; ata:Tint64_t):Pint64_t;cdecl;external libcs;
function cs_dl_fkeep(A:Pcs_dl; fkeep:function (para1:Tint64_t; para2:Tint64_t; para3:Tdouble; para4:pointer):Tint64_t; other:pointer):Tint64_t;cdecl;external libcs;
function cs_dl_house(x:Pdouble; beta:Pdouble; n:Tint64_t):Tdouble;cdecl;external libcs;
function cs_dl_maxtrans(A:Pcs_dl; seed:Tint64_t):Pint64_t;cdecl;external libcs;
function cs_dl_post(parent:Pint64_t; n:Tint64_t):Pint64_t;cdecl;external libcs;
function cs_dl_scc(A:Pcs_dl):Pcs_dld;cdecl;external libcs;
function cs_dl_scatter(A:Pcs_dl; j:Tint64_t; beta:Tdouble; w:Pint64_t; x:Pdouble; 
           mark:Tint64_t; C:Pcs_dl; nz:Tint64_t):Tint64_t;cdecl;external libcs;
function cs_dl_tdfs(j:Tint64_t; k:Tint64_t; head:Pint64_t; next:Pint64_t; post:Pint64_t; 
           stack:Pint64_t):Tint64_t;cdecl;external libcs;
function cs_dl_leaf(i:Tint64_t; j:Tint64_t; first:Pint64_t; maxfirst:Pint64_t; prevleaf:Pint64_t; 
           ancestor:Pint64_t; jleaf:Pint64_t):Tint64_t;cdecl;external libcs;
function cs_dl_reach(G:Pcs_dl; B:Pcs_dl; k:Tint64_t; xi:Pint64_t; pinv:Pint64_t):Tint64_t;cdecl;external libcs;
function cs_dl_spsolve(L:Pcs_dl; B:Pcs_dl; k:Tint64_t; xi:Pint64_t; x:Pdouble; 
           pinv:Pint64_t; lo:Tint64_t):Tint64_t;cdecl;external libcs;
function cs_dl_ereach(A:Pcs_dl; k:Tint64_t; parent:Pint64_t; s:Pint64_t; w:Pint64_t):Tint64_t;cdecl;external libcs;
function cs_dl_randperm(n:Tint64_t; seed:Tint64_t):Pint64_t;cdecl;external libcs;
{ utilities  }
function cs_dl_dalloc(m:Tint64_t; n:Tint64_t):Pcs_dld;cdecl;external libcs;
function cs_dl_done(C:Pcs_dl; w:pointer; x:pointer; ok:Tint64_t):Pcs_dl;cdecl;external libcs;
function cs_dl_idone(p:Pint64_t; C:Pcs_dl; w:pointer; ok:Tint64_t):Pint64_t;cdecl;external libcs;
function cs_dl_ndone(N:Pcs_dln; C:Pcs_dl; w:pointer; x:pointer; ok:Tint64_t):Pcs_dln;cdecl;external libcs;
function cs_dl_ddone(D:Pcs_dld; C:Pcs_dl; w:pointer; ok:Tint64_t):Pcs_dld;cdecl;external libcs;
{ --------------------------------------------------------------------------  }
{ complex/int32_t version of CXSparse  }
{ --------------------------------------------------------------------------  }
{$if 1}
{ --- primary CSparse routines and data structures -------------------------  }
{ matrix in compressed-column or triplet form  }
{ maximum number of entries  }
{ number of rows  }
{ number of columns  }
{ column pointers (size n+1) or col indices (size nzmax)  }
{ row indices, size nzmax  }
{ numerical values, size nzmax  }
{ # of entries in triplet matrix, -1 for compressed-col  }
type
  Pcs_ci_sparse = ^Tcs_ci_sparse;
  Tcs_ci_sparse = record
      nzmax : Tint32_t;
      m : Tint32_t;
      n : Tint32_t;
      p : Pint32_t;
      i : Pint32_t;
      x : Pcs_complex_t;
      nz : Tint32_t;
    end;
  Tcs_ci = Tcs_ci_sparse;
  Pcs_ci = ^Tcs_ci;

function cs_ci_add(A:Pcs_ci; B:Pcs_ci; alpha:Tcs_complex_t; beta:Tcs_complex_t):Pcs_ci;cdecl;external libcs;
function cs_ci_cholsol(order:Tint32_t; A:Pcs_ci; b:Pcs_complex_t):Tint32_t;cdecl;external libcs;
function cs_ci_dupl(A:Pcs_ci):Tint32_t;cdecl;external libcs;
function cs_ci_entry(T:Pcs_ci; i:Tint32_t; j:Tint32_t; x:Tcs_complex_t):Tint32_t;cdecl;external libcs;
function cs_ci_lusol(order:Tint32_t; A:Pcs_ci; b:Pcs_complex_t; tol:Tdouble):Tint32_t;cdecl;external libcs;
function cs_ci_gaxpy(A:Pcs_ci; x:Pcs_complex_t; y:Pcs_complex_t):Tint32_t;cdecl;external libcs;
function cs_ci_multiply(A:Pcs_ci; B:Pcs_ci):Pcs_ci;cdecl;external libcs;
function cs_ci_qrsol(order:Tint32_t; A:Pcs_ci; b:Pcs_complex_t):Tint32_t;cdecl;external libcs;
function cs_ci_transpose(A:Pcs_ci; values:Tint32_t):Pcs_ci;cdecl;external libcs;
function cs_ci_compress(T:Pcs_ci):Pcs_ci;cdecl;external libcs;
function cs_ci_norm(A:Pcs_ci):Tdouble;cdecl;external libcs;
function cs_ci_print(A:Pcs_ci; brief:Tint32_t):Tint32_t;cdecl;external libcs;
function cs_ci_load(f:PFILE):Pcs_ci;cdecl;external libcs;
{ utilities  }
function cs_ci_calloc(n:Tint32_t; size:Tsize_t):pointer;cdecl;external libcs;
function cs_ci_free(p:pointer):pointer;cdecl;external libcs;
function cs_ci_realloc(p:pointer; n:Tint32_t; size:Tsize_t; ok:Pint32_t):pointer;cdecl;external libcs;
function cs_ci_spalloc(m:Tint32_t; n:Tint32_t; nzmax:Tint32_t; values:Tint32_t; t:Tint32_t):Pcs_ci;cdecl;external libcs;
function cs_ci_spfree(A:Pcs_ci):Pcs_ci;cdecl;external libcs;
function cs_ci_sprealloc(A:Pcs_ci; nzmax:Tint32_t):Tint32_t;cdecl;external libcs;
function cs_ci_malloc(n:Tint32_t; size:Tsize_t):pointer;cdecl;external libcs;
{ --- secondary CSparse routines and data structures -----------------------  }
{ symbolic Cholesky, LU, or QR analysis  }
{ inverse row perm. for QR, fill red. perm for Chol  }
{ fill-reducing column permutation for LU and QR  }
{ elimination tree for Cholesky and QR  }
{ column pointers for Cholesky, row counts for QR  }
{ leftmost[i] = min(find(A(i,:))), for QR  }
{ # of rows for QR, after adding fictitious rows  }
{ # entries in L for LU or Cholesky; in V for QR  }
{ # entries in U for LU; in R for QR  }
type
  Pcs_ci_symbolic = ^Tcs_ci_symbolic;
  Tcs_ci_symbolic = record
      pinv : Pint32_t;
      q : Pint32_t;
      parent : Pint32_t;
      cp : Pint32_t;
      leftmost : Pint32_t;
      m2 : Tint32_t;
      lnz : Tdouble;
      unz : Tdouble;
    end;
  Tcs_cis = Tcs_ci_symbolic;
  Pcs_cis = ^Tcs_cis;
{ numeric Cholesky, LU, or QR factorization  }
{ L for LU and Cholesky, V for QR  }
{ U for LU, r for QR, not used for Cholesky  }
{ partial pivoting for LU  }
{ beta [0..n-1] for QR  }

  Pcs_ci_numeric = ^Tcs_ci_numeric;
  Tcs_ci_numeric = record
      L : Pcs_ci;
      U : Pcs_ci;
      pinv : Pint32_t;
      B : Pdouble;
    end;
  Tcs_cin = Tcs_ci_numeric;
  Pcs_cin = ^Tcs_cin;
{ cs_ci_dmperm or cs_ci_scc output  }
{ size m, row permutation  }
{ size n, column permutation  }
{ size nb+1, block k is rows r[k] to r[k+1]-1 in A(p,q)  }
{ size nb+1, block k is cols s[k] to s[k+1]-1 in A(p,q)  }
{ # of blocks in fine dmperm decomposition  }
{ coarse row decomposition  }
{ coarse column decomposition  }

  Pcs_ci_dmperm_results = ^Tcs_ci_dmperm_results;
  Tcs_ci_dmperm_results = record
      p : Pint32_t;
      q : Pint32_t;
      r : Pint32_t;
      s : Pint32_t;
      nb : Tint32_t;
      rr : array[0..4] of Tint32_t;
      cc : array[0..4] of Tint32_t;
    end;
  Tcs_cid = Tcs_ci_dmperm_results;
  Pcs_cid = ^Tcs_cid;

function cs_ci_amd(order:Tint32_t; A:Pcs_ci):Pint32_t;cdecl;external libcs;
function cs_ci_chol(A:Pcs_ci; S:Pcs_cis):Pcs_cin;cdecl;external libcs;
function cs_ci_dmperm(A:Pcs_ci; seed:Tint32_t):Pcs_cid;cdecl;external libcs;
function cs_ci_droptol(A:Pcs_ci; tol:Tdouble):Tint32_t;cdecl;external libcs;
function cs_ci_dropzeros(A:Pcs_ci):Tint32_t;cdecl;external libcs;
function cs_ci_happly(V:Pcs_ci; i:Tint32_t; beta:Tdouble; x:Pcs_complex_t):Tint32_t;cdecl;external libcs;
function cs_ci_ipvec(p:Pint32_t; b:Pcs_complex_t; x:Pcs_complex_t; n:Tint32_t):Tint32_t;cdecl;external libcs;
function cs_ci_lsolve(L:Pcs_ci; x:Pcs_complex_t):Tint32_t;cdecl;external libcs;
function cs_ci_ltsolve(L:Pcs_ci; x:Pcs_complex_t):Tint32_t;cdecl;external libcs;
function cs_ci_lu(A:Pcs_ci; S:Pcs_cis; tol:Tdouble):Pcs_cin;cdecl;external libcs;
function cs_ci_permute(A:Pcs_ci; pinv:Pint32_t; q:Pint32_t; values:Tint32_t):Pcs_ci;cdecl;external libcs;
function cs_ci_pinv(p:Pint32_t; n:Tint32_t):Pint32_t;cdecl;external libcs;
function cs_ci_pvec(p:Pint32_t; b:Pcs_complex_t; x:Pcs_complex_t; n:Tint32_t):Tint32_t;cdecl;external libcs;
function cs_ci_qr(A:Pcs_ci; S:Pcs_cis):Pcs_cin;cdecl;external libcs;
function cs_ci_schol(order:Tint32_t; A:Pcs_ci):Pcs_cis;cdecl;external libcs;
function cs_ci_sqr(order:Tint32_t; A:Pcs_ci; qr:Tint32_t):Pcs_cis;cdecl;external libcs;
function cs_ci_symperm(A:Pcs_ci; pinv:Pint32_t; values:Tint32_t):Pcs_ci;cdecl;external libcs;
function cs_ci_usolve(U:Pcs_ci; x:Pcs_complex_t):Tint32_t;cdecl;external libcs;
function cs_ci_utsolve(U:Pcs_ci; x:Pcs_complex_t):Tint32_t;cdecl;external libcs;
function cs_ci_updown(L:Pcs_ci; sigma:Tint32_t; C:Pcs_ci; parent:Pint32_t):Tint32_t;cdecl;external libcs;
{ utilities  }
function cs_ci_sfree(S:Pcs_cis):Pcs_cis;cdecl;external libcs;
function cs_ci_nfree(N:Pcs_cin):Pcs_cin;cdecl;external libcs;
function cs_ci_dfree(D:Pcs_cid):Pcs_cid;cdecl;external libcs;
{ --- tertiary CSparse routines --------------------------------------------  }
function cs_ci_counts(A:Pcs_ci; parent:Pint32_t; post:Pint32_t; ata:Tint32_t):Pint32_t;cdecl;external libcs;
function cs_ci_cumsum(p:Pint32_t; c:Pint32_t; n:Tint32_t):Tdouble;cdecl;external libcs;
function cs_ci_dfs(j:Tint32_t; G:Pcs_ci; top:Tint32_t; xi:Pint32_t; pstack:Pint32_t; 
           pinv:Pint32_t):Tint32_t;cdecl;external libcs;
function cs_ci_etree(A:Pcs_ci; ata:Tint32_t):Pint32_t;cdecl;external libcs;
function cs_ci_fkeep(A:Pcs_ci; fkeep:function (para1:Tint32_t; para2:Tint32_t; para3:Tcs_complex_t; para4:pointer):Tint32_t; other:pointer):Tint32_t;cdecl;external libcs;
function cs_ci_house(x:Pcs_complex_t; beta:Pdouble; n:Tint32_t):Tcs_complex_t;cdecl;external libcs;
function cs_ci_maxtrans(A:Pcs_ci; seed:Tint32_t):Pint32_t;cdecl;external libcs;
function cs_ci_post(parent:Pint32_t; n:Tint32_t):Pint32_t;cdecl;external libcs;
function cs_ci_scc(A:Pcs_ci):Pcs_cid;cdecl;external libcs;
function cs_ci_scatter(A:Pcs_ci; j:Tint32_t; beta:Tcs_complex_t; w:Pint32_t; x:Pcs_complex_t; 
           mark:Tint32_t; C:Pcs_ci; nz:Tint32_t):Tint32_t;cdecl;external libcs;
function cs_ci_tdfs(j:Tint32_t; k:Tint32_t; head:Pint32_t; next:Pint32_t; post:Pint32_t; 
           stack:Pint32_t):Tint32_t;cdecl;external libcs;
function cs_ci_leaf(i:Tint32_t; j:Tint32_t; first:Pint32_t; maxfirst:Pint32_t; prevleaf:Pint32_t; 
           ancestor:Pint32_t; jleaf:Pint32_t):Tint32_t;cdecl;external libcs;
function cs_ci_reach(G:Pcs_ci; B:Pcs_ci; k:Tint32_t; xi:Pint32_t; pinv:Pint32_t):Tint32_t;cdecl;external libcs;
function cs_ci_spsolve(L:Pcs_ci; B:Pcs_ci; k:Tint32_t; xi:Pint32_t; x:Pcs_complex_t; 
           pinv:Pint32_t; lo:Tint32_t):Tint32_t;cdecl;external libcs;
function cs_ci_ereach(A:Pcs_ci; k:Tint32_t; parent:Pint32_t; s:Pint32_t; w:Pint32_t):Tint32_t;cdecl;external libcs;
function cs_ci_randperm(n:Tint32_t; seed:Tint32_t):Pint32_t;cdecl;external libcs;
{ utilities  }
function cs_ci_dalloc(m:Tint32_t; n:Tint32_t):Pcs_cid;cdecl;external libcs;
function cs_ci_done(C:Pcs_ci; w:pointer; x:pointer; ok:Tint32_t):Pcs_ci;cdecl;external libcs;
function cs_ci_idone(p:Pint32_t; C:Pcs_ci; w:pointer; ok:Tint32_t):Pint32_t;cdecl;external libcs;
function cs_ci_ndone(N:Pcs_cin; C:Pcs_ci; w:pointer; x:pointer; ok:Tint32_t):Pcs_cin;cdecl;external libcs;
function cs_ci_ddone(D:Pcs_cid; C:Pcs_ci; w:pointer; ok:Tint32_t):Pcs_cid;cdecl;external libcs;
{ --------------------------------------------------------------------------  }
{ complex/int64_t version of CXSparse  }
{ --------------------------------------------------------------------------  }
{ --- primary CSparse routines and data structures -------------------------  }
{ matrix in compressed-column or triplet form  }
{ maximum number of entries  }
{ number of rows  }
{ number of columns  }
{ column pointers (size n+1) or col indlces (size nzmax)  }
{ row indices, size nzmax  }
{ numerical values, size nzmax  }
{ # of entries in triplet matrix, -1 for compressed-col  }
type
  Pcs_cl_sparse = ^Tcs_cl_sparse;
  Tcs_cl_sparse = record
      nzmax : Tint64_t;
      m : Tint64_t;
      n : Tint64_t;
      p : Pint64_t;
      i : Pint64_t;
      x : Pcs_complex_t;
      nz : Tint64_t;
    end;
  Tcs_cl = Tcs_cl_sparse;
  Pcs_cl = ^Tcs_cl;

function cs_cl_add(A:Pcs_cl; B:Pcs_cl; alpha:Tcs_complex_t; beta:Tcs_complex_t):Pcs_cl;cdecl;external libcs;
function cs_cl_cholsol(order:Tint64_t; A:Pcs_cl; b:Pcs_complex_t):Tint64_t;cdecl;external libcs;
function cs_cl_dupl(A:Pcs_cl):Tint64_t;cdecl;external libcs;
function cs_cl_entry(T:Pcs_cl; i:Tint64_t; j:Tint64_t; x:Tcs_complex_t):Tint64_t;cdecl;external libcs;
function cs_cl_lusol(order:Tint64_t; A:Pcs_cl; b:Pcs_complex_t; tol:Tdouble):Tint64_t;cdecl;external libcs;
function cs_cl_gaxpy(A:Pcs_cl; x:Pcs_complex_t; y:Pcs_complex_t):Tint64_t;cdecl;external libcs;
function cs_cl_multiply(A:Pcs_cl; B:Pcs_cl):Pcs_cl;cdecl;external libcs;
function cs_cl_qrsol(order:Tint64_t; A:Pcs_cl; b:Pcs_complex_t):Tint64_t;cdecl;external libcs;
function cs_cl_transpose(A:Pcs_cl; values:Tint64_t):Pcs_cl;cdecl;external libcs;
function cs_cl_compress(T:Pcs_cl):Pcs_cl;cdecl;external libcs;
function cs_cl_norm(A:Pcs_cl):Tdouble;cdecl;external libcs;
function cs_cl_print(A:Pcs_cl; brief:Tint64_t):Tint64_t;cdecl;external libcs;
function cs_cl_load(f:PFILE):Pcs_cl;cdecl;external libcs;
{ utilities  }
function cs_cl_calloc(n:Tint64_t; size:Tsize_t):pointer;cdecl;external libcs;
function cs_cl_free(p:pointer):pointer;cdecl;external libcs;
function cs_cl_realloc(p:pointer; n:Tint64_t; size:Tsize_t; ok:Pint64_t):pointer;cdecl;external libcs;
function cs_cl_spalloc(m:Tint64_t; n:Tint64_t; nzmax:Tint64_t; values:Tint64_t; t:Tint64_t):Pcs_cl;cdecl;external libcs;
function cs_cl_spfree(A:Pcs_cl):Pcs_cl;cdecl;external libcs;
function cs_cl_sprealloc(A:Pcs_cl; nzmax:Tint64_t):Tint64_t;cdecl;external libcs;
function cs_cl_malloc(n:Tint64_t; size:Tsize_t):pointer;cdecl;external libcs;
{ --- secondary CSparse routines and data structures -----------------------  }
{ symbolic Cholesky, LU, or QR analysis  }
{ inverse row perm. for QR, fill red. perm for Chol  }
{ fill-reducing column permutation for LU and QR  }
{ elimination tree for Cholesky and QR  }
{ column pointers for Cholesky, row counts for QR  }
{ leftmost[i] = min(find(A(i,:))), for QR  }
{ # of rows for QR, after adding fictitious rows  }
{ # entries in L for LU or Cholesky; in V for QR  }
{ # entries in U for LU; in R for QR  }
type
  Pcs_cl_symbolic = ^Tcs_cl_symbolic;
  Tcs_cl_symbolic = record
      pinv : Pint64_t;
      q : Pint64_t;
      parent : Pint64_t;
      cp : Pint64_t;
      leftmost : Pint64_t;
      m2 : Tint64_t;
      lnz : Tdouble;
      unz : Tdouble;
    end;
  Tcs_cls = Tcs_cl_symbolic;
  Pcs_cls = ^Tcs_cls;
{ numeric Cholesky, LU, or QR factorization  }
{ L for LU and Cholesky, V for QR  }
{ U for LU, r for QR, not used for Cholesky  }
{ partial pivoting for LU  }
{ beta [0..n-1] for QR  }

  Pcs_cl_numeric = ^Tcs_cl_numeric;
  Tcs_cl_numeric = record
      L : Pcs_cl;
      U : Pcs_cl;
      pinv : Pint64_t;
      B : Pdouble;
    end;
  Tcs_cln = Tcs_cl_numeric;
  Pcs_cln = ^Tcs_cln;
{ cs_cl_dmperm or cs_cl_scc output  }
{ size m, row permutation  }
{ size n, column permutation  }
{ size nb+1, block k is rows r[k] to r[k+1]-1 in A(p,q)  }
{ size nb+1, block k is cols s[k] to s[k+1]-1 in A(p,q)  }
{ # of blocks in fine dmperm decomposition  }
{ coarse row decomposition  }
{ coarse column decomposition  }

  Pcs_cl_dmperm_results = ^Tcs_cl_dmperm_results;
  Tcs_cl_dmperm_results = record
      p : Pint64_t;
      q : Pint64_t;
      r : Pint64_t;
      s : Pint64_t;
      nb : Tint64_t;
      rr : array[0..4] of Tint64_t;
      cc : array[0..4] of Tint64_t;
    end;
  Tcs_cld = Tcs_cl_dmperm_results;
  Pcs_cld = ^Tcs_cld;

function cs_cl_amd(order:Tint64_t; A:Pcs_cl):Pint64_t;cdecl;external libcs;
function cs_cl_chol(A:Pcs_cl; S:Pcs_cls):Pcs_cln;cdecl;external libcs;
function cs_cl_dmperm(A:Pcs_cl; seed:Tint64_t):Pcs_cld;cdecl;external libcs;
function cs_cl_droptol(A:Pcs_cl; tol:Tdouble):Tint64_t;cdecl;external libcs;
function cs_cl_dropzeros(A:Pcs_cl):Tint64_t;cdecl;external libcs;
function cs_cl_happly(V:Pcs_cl; i:Tint64_t; beta:Tdouble; x:Pcs_complex_t):Tint64_t;cdecl;external libcs;
function cs_cl_ipvec(p:Pint64_t; b:Pcs_complex_t; x:Pcs_complex_t; n:Tint64_t):Tint64_t;cdecl;external libcs;
function cs_cl_lsolve(L:Pcs_cl; x:Pcs_complex_t):Tint64_t;cdecl;external libcs;
function cs_cl_ltsolve(L:Pcs_cl; x:Pcs_complex_t):Tint64_t;cdecl;external libcs;
function cs_cl_lu(A:Pcs_cl; S:Pcs_cls; tol:Tdouble):Pcs_cln;cdecl;external libcs;
function cs_cl_permute(A:Pcs_cl; pinv:Pint64_t; q:Pint64_t; values:Tint64_t):Pcs_cl;cdecl;external libcs;
function cs_cl_pinv(p:Pint64_t; n:Tint64_t):Pint64_t;cdecl;external libcs;
function cs_cl_pvec(p:Pint64_t; b:Pcs_complex_t; x:Pcs_complex_t; n:Tint64_t):Tint64_t;cdecl;external libcs;
function cs_cl_qr(A:Pcs_cl; S:Pcs_cls):Pcs_cln;cdecl;external libcs;
function cs_cl_schol(order:Tint64_t; A:Pcs_cl):Pcs_cls;cdecl;external libcs;
function cs_cl_sqr(order:Tint64_t; A:Pcs_cl; qr:Tint64_t):Pcs_cls;cdecl;external libcs;
function cs_cl_symperm(A:Pcs_cl; pinv:Pint64_t; values:Tint64_t):Pcs_cl;cdecl;external libcs;
function cs_cl_usolve(U:Pcs_cl; x:Pcs_complex_t):Tint64_t;cdecl;external libcs;
function cs_cl_utsolve(U:Pcs_cl; x:Pcs_complex_t):Tint64_t;cdecl;external libcs;
function cs_cl_updown(L:Pcs_cl; sigma:Tint64_t; C:Pcs_cl; parent:Pint64_t):Tint64_t;cdecl;external libcs;
{ utilities  }
function cs_cl_sfree(S:Pcs_cls):Pcs_cls;cdecl;external libcs;
function cs_cl_nfree(N:Pcs_cln):Pcs_cln;cdecl;external libcs;
function cs_cl_dfree(D:Pcs_cld):Pcs_cld;cdecl;external libcs;
{ --- tertiary CSparse routines --------------------------------------------  }
function cs_cl_counts(A:Pcs_cl; parent:Pint64_t; post:Pint64_t; ata:Tint64_t):Pint64_t;cdecl;external libcs;
function cs_cl_cumsum(p:Pint64_t; c:Pint64_t; n:Tint64_t):Tdouble;cdecl;external libcs;
function cs_cl_dfs(j:Tint64_t; G:Pcs_cl; top:Tint64_t; xi:Pint64_t; pstack:Pint64_t; 
           pinv:Pint64_t):Tint64_t;cdecl;external libcs;
function cs_cl_etree(A:Pcs_cl; ata:Tint64_t):Pint64_t;cdecl;external libcs;
function cs_cl_fkeep(A:Pcs_cl; fkeep:function (para1:Tint64_t; para2:Tint64_t; para3:Tcs_complex_t; para4:pointer):Tint64_t; other:pointer):Tint64_t;cdecl;external libcs;
function cs_cl_house(x:Pcs_complex_t; beta:Pdouble; n:Tint64_t):Tcs_complex_t;cdecl;external libcs;
function cs_cl_maxtrans(A:Pcs_cl; seed:Tint64_t):Pint64_t;cdecl;external libcs;
function cs_cl_post(parent:Pint64_t; n:Tint64_t):Pint64_t;cdecl;external libcs;
function cs_cl_scc(A:Pcs_cl):Pcs_cld;cdecl;external libcs;
function cs_cl_scatter(A:Pcs_cl; j:Tint64_t; beta:Tcs_complex_t; w:Pint64_t; x:Pcs_complex_t; 
           mark:Tint64_t; C:Pcs_cl; nz:Tint64_t):Tint64_t;cdecl;external libcs;
function cs_cl_tdfs(j:Tint64_t; k:Tint64_t; head:Pint64_t; next:Pint64_t; post:Pint64_t; 
           stack:Pint64_t):Tint64_t;cdecl;external libcs;
function cs_cl_leaf(i:Tint64_t; j:Tint64_t; first:Pint64_t; maxfirst:Pint64_t; prevleaf:Pint64_t; 
           ancestor:Pint64_t; jleaf:Pint64_t):Tint64_t;cdecl;external libcs;
function cs_cl_reach(G:Pcs_cl; B:Pcs_cl; k:Tint64_t; xi:Pint64_t; pinv:Pint64_t):Tint64_t;cdecl;external libcs;
function cs_cl_spsolve(L:Pcs_cl; B:Pcs_cl; k:Tint64_t; xi:Pint64_t; x:Pcs_complex_t; 
           pinv:Pint64_t; lo:Tint64_t):Tint64_t;cdecl;external libcs;
function cs_cl_ereach(A:Pcs_cl; k:Tint64_t; parent:Pint64_t; s:Pint64_t; w:Pint64_t):Tint64_t;cdecl;external libcs;
function cs_cl_randperm(n:Tint64_t; seed:Tint64_t):Pint64_t;cdecl;external libcs;
{ utilities  }
function cs_cl_dalloc(m:Tint64_t; n:Tint64_t):Pcs_cld;cdecl;external libcs;
function cs_cl_done(C:Pcs_cl; w:pointer; x:pointer; ok:Tint64_t):Pcs_cl;cdecl;external libcs;
function cs_cl_idone(p:Pint64_t; C:Pcs_cl; w:pointer; ok:Tint64_t):Pint64_t;cdecl;external libcs;
function cs_cl_ndone(N:Pcs_cln; C:Pcs_cl; w:pointer; x:pointer; ok:Tint64_t):Pcs_cln;cdecl;external libcs;
function cs_cl_ddone(D:Pcs_cld; C:Pcs_cl; w:pointer; ok:Tint64_t):Pcs_cld;cdecl;external libcs;
{$endif}
{ --------------------------------------------------------------------------  }
{ Macros for constructing each version of CSparse  }
{ --------------------------------------------------------------------------  }
{$ifdef CS_LONG}

const
  CS_INT = int64_t;  
  CS_INT_MAX = cs_long_t_max;  
  CS_ID = cs_long_t_id;  
{$ifdef CS_COMPLEX}
  CS_ENTRY = cs_complex_t;  
  cs = cs_cl;  
{$else}

const
  CS_ENTRY = double;  
  cs = cs_dl;  
{$endif}
{$else}

const
  CS_INT = int32_t;  
  CS_INT_MAX = INT_MAX;  
  CS_ID = '%d';  
{$ifdef CS_COMPLEX}
  CS_ENTRY = cs_complex_t;  
  cs = cs_ci;  
{$else}

const
  CS_ENTRY = double;  
  cs = cs_di;  
{$endif}
{$endif}
{$ifdef CS_COMPLEX}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function CS_REAL(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function CS_IMAG(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function CS_CONJ(x : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function CS_ABS(x : longint) : longint;

{ --- primary CSparse routines and data structures -------------------------  }
{ was #define dname def_expr }
function cs_add : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_cholsol : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_dupl : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_entry : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_lusol : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_gaxpy : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_multiply : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_qrsol : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_transpose : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_compress : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_norm : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_print : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_load : longint; { return type might be wrong }

{ utilities  }
{ was #define dname def_expr }
function cs_calloc : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_free : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_realloc : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_spalloc : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_spfree : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_sprealloc : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_malloc : longint; { return type might be wrong }

{ --- secondary CSparse routines and data structures -----------------------  }
{ was #define dname def_expr }
function css : longint; { return type might be wrong }

{ was #define dname def_expr }
function csn : longint; { return type might be wrong }

{ was #define dname def_expr }
function csd : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_amd : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_chol : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_dmperm : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_droptol : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_dropzeros : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_happly : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_ipvec : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_lsolve : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_ltsolve : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_lu : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_permute : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_pinv : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_pvec : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_qr : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_schol : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_sqr : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_symperm : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_usolve : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_utsolve : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_updown : longint; { return type might be wrong }

{ utilities  }
{ was #define dname def_expr }
function cs_sfree : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_nfree : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_dfree : longint; { return type might be wrong }

{ --- tertiary CSparse routines --------------------------------------------  }
{ was #define dname def_expr }
function cs_counts : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_cumsum : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_dfs : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_etree : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_fkeep : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_house : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_invmatch : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_maxtrans : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_post : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_scc : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_scatter : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_tdfs : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_reach : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_spsolve : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_ereach : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_randperm : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_leaf : longint; { return type might be wrong }

{ utilities  }
{ was #define dname def_expr }
function cs_dalloc : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_done : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_idone : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_ndone : longint; { return type might be wrong }

{ was #define dname def_expr }
function cs_ddone : longint; { return type might be wrong }

{ --------------------------------------------------------------------------  }
{ Conversion routines  }
{ --------------------------------------------------------------------------  }
{$if 1}

function cs_i_real(A:Pcs_ci; real:Tint32_t):Pcs_di;cdecl;external libcs;
function cs_i_complex(A:Pcs_di; real:Tint32_t):Pcs_ci;cdecl;external libcs;
function cs_l_real(A:Pcs_cl; real:Tint64_t):Pcs_dl;cdecl;external libcs;
function cs_l_complex(A:Pcs_dl; real:Tint64_t):Pcs_cl;cdecl;external libcs;
{$endif}
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 4-11-25 19:28:47 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function CS_REAL(x : longint) : longint;
begin
  CS_REAL:=creal(x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function CS_IMAG(x : longint) : longint;
begin
  CS_IMAG:=cimag(x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function CS_CONJ(x : longint) : longint;
begin
  CS_CONJ:=conj(x);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function CS_ABS(x : longint) : longint;
begin
  CS_ABS:=cabs(x);
end;

{ was #define dname def_expr }
function cs_add : longint; { return type might be wrong }
  begin
    cs_add:=CS_NAME(_add);
  end;

{ was #define dname def_expr }
function cs_cholsol : longint; { return type might be wrong }
  begin
    cs_cholsol:=CS_NAME(_cholsol);
  end;

{ was #define dname def_expr }
function cs_dupl : longint; { return type might be wrong }
  begin
    cs_dupl:=CS_NAME(_dupl);
  end;

{ was #define dname def_expr }
function cs_entry : longint; { return type might be wrong }
  begin
    cs_entry:=CS_NAME(_entry);
  end;

{ was #define dname def_expr }
function cs_lusol : longint; { return type might be wrong }
  begin
    cs_lusol:=CS_NAME(_lusol);
  end;

{ was #define dname def_expr }
function cs_gaxpy : longint; { return type might be wrong }
  begin
    cs_gaxpy:=CS_NAME(_gaxpy);
  end;

{ was #define dname def_expr }
function cs_multiply : longint; { return type might be wrong }
  begin
    cs_multiply:=CS_NAME(_multiply);
  end;

{ was #define dname def_expr }
function cs_qrsol : longint; { return type might be wrong }
  begin
    cs_qrsol:=CS_NAME(_qrsol);
  end;

{ was #define dname def_expr }
function cs_transpose : longint; { return type might be wrong }
  begin
    cs_transpose:=CS_NAME(_transpose);
  end;

{ was #define dname def_expr }
function cs_compress : longint; { return type might be wrong }
  begin
    cs_compress:=CS_NAME(_compress);
  end;

{ was #define dname def_expr }
function cs_norm : longint; { return type might be wrong }
  begin
    cs_norm:=CS_NAME(_norm);
  end;

{ was #define dname def_expr }
function cs_print : longint; { return type might be wrong }
  begin
    cs_print:=CS_NAME(_print);
  end;

{ was #define dname def_expr }
function cs_load : longint; { return type might be wrong }
  begin
    cs_load:=CS_NAME(_load);
  end;

{ was #define dname def_expr }
function cs_calloc : longint; { return type might be wrong }
  begin
    cs_calloc:=CS_NAME(_calloc);
  end;

{ was #define dname def_expr }
function cs_free : longint; { return type might be wrong }
  begin
    cs_free:=CS_NAME(_free);
  end;

{ was #define dname def_expr }
function cs_realloc : longint; { return type might be wrong }
  begin
    cs_realloc:=CS_NAME(_realloc);
  end;

{ was #define dname def_expr }
function cs_spalloc : longint; { return type might be wrong }
  begin
    cs_spalloc:=CS_NAME(_spalloc);
  end;

{ was #define dname def_expr }
function cs_spfree : longint; { return type might be wrong }
  begin
    cs_spfree:=CS_NAME(_spfree);
  end;

{ was #define dname def_expr }
function cs_sprealloc : longint; { return type might be wrong }
  begin
    cs_sprealloc:=CS_NAME(_sprealloc);
  end;

{ was #define dname def_expr }
function cs_malloc : longint; { return type might be wrong }
  begin
    cs_malloc:=CS_NAME(_malloc);
  end;

{ was #define dname def_expr }
function css : longint; { return type might be wrong }
  begin
    css:=CS_NAME(s);
  end;

{ was #define dname def_expr }
function csn : longint; { return type might be wrong }
  begin
    csn:=CS_NAME(n);
  end;

{ was #define dname def_expr }
function csd : longint; { return type might be wrong }
  begin
    csd:=CS_NAME(d);
  end;

{ was #define dname def_expr }
function cs_amd : longint; { return type might be wrong }
  begin
    cs_amd:=CS_NAME(_amd);
  end;

{ was #define dname def_expr }
function cs_chol : longint; { return type might be wrong }
  begin
    cs_chol:=CS_NAME(_chol);
  end;

{ was #define dname def_expr }
function cs_dmperm : longint; { return type might be wrong }
  begin
    cs_dmperm:=CS_NAME(_dmperm);
  end;

{ was #define dname def_expr }
function cs_droptol : longint; { return type might be wrong }
  begin
    cs_droptol:=CS_NAME(_droptol);
  end;

{ was #define dname def_expr }
function cs_dropzeros : longint; { return type might be wrong }
  begin
    cs_dropzeros:=CS_NAME(_dropzeros);
  end;

{ was #define dname def_expr }
function cs_happly : longint; { return type might be wrong }
  begin
    cs_happly:=CS_NAME(_happly);
  end;

{ was #define dname def_expr }
function cs_ipvec : longint; { return type might be wrong }
  begin
    cs_ipvec:=CS_NAME(_ipvec);
  end;

{ was #define dname def_expr }
function cs_lsolve : longint; { return type might be wrong }
  begin
    cs_lsolve:=CS_NAME(_lsolve);
  end;

{ was #define dname def_expr }
function cs_ltsolve : longint; { return type might be wrong }
  begin
    cs_ltsolve:=CS_NAME(_ltsolve);
  end;

{ was #define dname def_expr }
function cs_lu : longint; { return type might be wrong }
  begin
    cs_lu:=CS_NAME(_lu);
  end;

{ was #define dname def_expr }
function cs_permute : longint; { return type might be wrong }
  begin
    cs_permute:=CS_NAME(_permute);
  end;

{ was #define dname def_expr }
function cs_pinv : longint; { return type might be wrong }
  begin
    cs_pinv:=CS_NAME(_pinv);
  end;

{ was #define dname def_expr }
function cs_pvec : longint; { return type might be wrong }
  begin
    cs_pvec:=CS_NAME(_pvec);
  end;

{ was #define dname def_expr }
function cs_qr : longint; { return type might be wrong }
  begin
    cs_qr:=CS_NAME(_qr);
  end;

{ was #define dname def_expr }
function cs_schol : longint; { return type might be wrong }
  begin
    cs_schol:=CS_NAME(_schol);
  end;

{ was #define dname def_expr }
function cs_sqr : longint; { return type might be wrong }
  begin
    cs_sqr:=CS_NAME(_sqr);
  end;

{ was #define dname def_expr }
function cs_symperm : longint; { return type might be wrong }
  begin
    cs_symperm:=CS_NAME(_symperm);
  end;

{ was #define dname def_expr }
function cs_usolve : longint; { return type might be wrong }
  begin
    cs_usolve:=CS_NAME(_usolve);
  end;

{ was #define dname def_expr }
function cs_utsolve : longint; { return type might be wrong }
  begin
    cs_utsolve:=CS_NAME(_utsolve);
  end;

{ was #define dname def_expr }
function cs_updown : longint; { return type might be wrong }
  begin
    cs_updown:=CS_NAME(_updown);
  end;

{ was #define dname def_expr }
function cs_sfree : longint; { return type might be wrong }
  begin
    cs_sfree:=CS_NAME(_sfree);
  end;

{ was #define dname def_expr }
function cs_nfree : longint; { return type might be wrong }
  begin
    cs_nfree:=CS_NAME(_nfree);
  end;

{ was #define dname def_expr }
function cs_dfree : longint; { return type might be wrong }
  begin
    cs_dfree:=CS_NAME(_dfree);
  end;

{ was #define dname def_expr }
function cs_counts : longint; { return type might be wrong }
  begin
    cs_counts:=CS_NAME(_counts);
  end;

{ was #define dname def_expr }
function cs_cumsum : longint; { return type might be wrong }
  begin
    cs_cumsum:=CS_NAME(_cumsum);
  end;

{ was #define dname def_expr }
function cs_dfs : longint; { return type might be wrong }
  begin
    cs_dfs:=CS_NAME(_dfs);
  end;

{ was #define dname def_expr }
function cs_etree : longint; { return type might be wrong }
  begin
    cs_etree:=CS_NAME(_etree);
  end;

{ was #define dname def_expr }
function cs_fkeep : longint; { return type might be wrong }
  begin
    cs_fkeep:=CS_NAME(_fkeep);
  end;

{ was #define dname def_expr }
function cs_house : longint; { return type might be wrong }
  begin
    cs_house:=CS_NAME(_house);
  end;

{ was #define dname def_expr }
function cs_invmatch : longint; { return type might be wrong }
  begin
    cs_invmatch:=CS_NAME(_invmatch);
  end;

{ was #define dname def_expr }
function cs_maxtrans : longint; { return type might be wrong }
  begin
    cs_maxtrans:=CS_NAME(_maxtrans);
  end;

{ was #define dname def_expr }
function cs_post : longint; { return type might be wrong }
  begin
    cs_post:=CS_NAME(_post);
  end;

{ was #define dname def_expr }
function cs_scc : longint; { return type might be wrong }
  begin
    cs_scc:=CS_NAME(_scc);
  end;

{ was #define dname def_expr }
function cs_scatter : longint; { return type might be wrong }
  begin
    cs_scatter:=CS_NAME(_scatter);
  end;

{ was #define dname def_expr }
function cs_tdfs : longint; { return type might be wrong }
  begin
    cs_tdfs:=CS_NAME(_tdfs);
  end;

{ was #define dname def_expr }
function cs_reach : longint; { return type might be wrong }
  begin
    cs_reach:=CS_NAME(_reach);
  end;

{ was #define dname def_expr }
function cs_spsolve : longint; { return type might be wrong }
  begin
    cs_spsolve:=CS_NAME(_spsolve);
  end;

{ was #define dname def_expr }
function cs_ereach : longint; { return type might be wrong }
  begin
    cs_ereach:=CS_NAME(_ereach);
  end;

{ was #define dname def_expr }
function cs_randperm : longint; { return type might be wrong }
  begin
    cs_randperm:=CS_NAME(_randperm);
  end;

{ was #define dname def_expr }
function cs_leaf : longint; { return type might be wrong }
  begin
    cs_leaf:=CS_NAME(_leaf);
  end;

{ was #define dname def_expr }
function cs_dalloc : longint; { return type might be wrong }
  begin
    cs_dalloc:=CS_NAME(_dalloc);
  end;

{ was #define dname def_expr }
function cs_done : longint; { return type might be wrong }
  begin
    cs_done:=CS_NAME(_done);
  end;

{ was #define dname def_expr }
function cs_idone : longint; { return type might be wrong }
  begin
    cs_idone:=CS_NAME(_idone);
  end;

{ was #define dname def_expr }
function cs_ndone : longint; { return type might be wrong }
  begin
    cs_ndone:=CS_NAME(_ndone);
  end;

{ was #define dname def_expr }
function cs_ddone : longint; { return type might be wrong }
  begin
    cs_ddone:=CS_NAME(_ddone);
  end;


end.
