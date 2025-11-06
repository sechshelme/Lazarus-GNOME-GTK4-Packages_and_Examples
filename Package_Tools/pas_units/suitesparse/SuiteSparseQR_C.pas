unit SuiteSparseQR_C;

interface

uses
  fp_suitesparse, cholmod;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function SuiteSparseQR_C(ordering: longint; tol: double; econ: Tint64_t; getCTX: longint; A: Pcholmod_sparse;
  Bsparse: Pcholmod_sparse; Bdense: Pcholmod_dense; Zsparse: PPcholmod_sparse; Zdense: PPcholmod_dense; R: PPcholmod_sparse;
  E: PPint64_t; H: PPcholmod_sparse; HPinv: PPint64_t; HTau: PPcholmod_dense; cc: Pcholmod_common): Tint64_t; cdecl; external libsuitesparse;
function SuiteSparseQR_i_C(ordering: longint; tol: double; econ: Tint32_t; getCTX: longint; A: Pcholmod_sparse;
  Bsparse: Pcholmod_sparse; Bdense: Pcholmod_dense; Zsparse: PPcholmod_sparse; Zdense: PPcholmod_dense; R: PPcholmod_sparse;
  E: PPint32_t; H: PPcholmod_sparse; HPinv: PPint32_t; HTau: PPcholmod_dense; cc: Pcholmod_common): Tint32_t; cdecl; external libsuitesparse;

function SuiteSparseQR_C_QR(ordering: longint; tol: double; econ: Tint64_t; A: Pcholmod_sparse; Q: PPcholmod_sparse;
  R: PPcholmod_sparse; E: PPint64_t; cc: Pcholmod_common): Tint64_t; cdecl; external libsuitesparse;
function SuiteSparseQR_i_C_QR(ordering: longint; tol: double; econ: Tint32_t; A: Pcholmod_sparse; Q: PPcholmod_sparse;
  R: PPcholmod_sparse; E: PPint32_t; cc: Pcholmod_common): Tint32_t; cdecl; external libsuitesparse;

function SuiteSparseQR_C_backslash(ordering: longint; tol: double; A: Pcholmod_sparse; B: Pcholmod_dense; cc: Pcholmod_common): Pcholmod_dense; cdecl; external libsuitesparse;
function SuiteSparseQR_C_backslash_default(A: Pcholmod_sparse; B: Pcholmod_dense; cc: Pcholmod_common): Pcholmod_dense; cdecl; external libsuitesparse;
function SuiteSparseQR_C_backslash_sparse(ordering: longint; tol: double; A: Pcholmod_sparse; B: Pcholmod_sparse; cc: Pcholmod_common): Pcholmod_sparse; cdecl; external libsuitesparse;

type
  TSuiteSparseQR_C_factorization = record
    xtype: longint;
    itype: longint;
    factors: pointer;
  end;
  PSuiteSparseQR_C_factorization = ^TSuiteSparseQR_C_factorization;
  PPSuiteSparseQR_C_factorization = ^PSuiteSparseQR_C_factorization;

function SuiteSparseQR_C_factorize(ordering: longint; tol: double; A: Pcholmod_sparse; cc: Pcholmod_common): PSuiteSparseQR_C_factorization; cdecl; external libsuitesparse;
function SuiteSparseQR_C_symbolic(ordering: longint; allow_tol: longint; A: Pcholmod_sparse; cc: Pcholmod_common): PSuiteSparseQR_C_factorization; cdecl; external libsuitesparse;
function SuiteSparseQR_C_numeric(tol: double; A: Pcholmod_sparse; QR: PSuiteSparseQR_C_factorization; cc: Pcholmod_common): longint; cdecl; external libsuitesparse;
function SuiteSparseQR_C_free(QR: PPSuiteSparseQR_C_factorization; cc: Pcholmod_common): longint; cdecl; external libsuitesparse;
function SuiteSparseQR_C_solve(system: longint; QR: PSuiteSparseQR_C_factorization; B: Pcholmod_dense; cc: Pcholmod_common): Pcholmod_dense; cdecl; external libsuitesparse;
function SuiteSparseQR_C_qmult(method: longint; QR: PSuiteSparseQR_C_factorization; X: Pcholmod_dense; cc: Pcholmod_common): Pcholmod_dense; cdecl; external libsuitesparse;

procedure SuiteSparseQR_C_version(version: Plongint); cdecl; external libsuitesparse;

// === Konventiert am: 4-11-25 19:29:32 ===


implementation



end.
