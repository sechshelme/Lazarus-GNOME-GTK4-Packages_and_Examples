{$IFDEF read_interface}


function gsl_blas_sdsdot(alpha: single; X: Pgsl_vector_float; Y: Pgsl_vector_float; result: Psingle): longint; cdecl; external libgslcblas;
function gsl_blas_dsdot(X: Pgsl_vector_float; Y: Pgsl_vector_float; result: Pdouble): longint; cdecl; external libgslcblas;
function gsl_blas_sdot(X: Pgsl_vector_float; Y: Pgsl_vector_float; result: Psingle): longint; cdecl; external libgslcblas;
function gsl_blas_ddot(X: Pgsl_vector; Y: Pgsl_vector; result: Pdouble): longint; cdecl; external libgslcblas;
function gsl_blas_cdotu(X: Pgsl_vector_complex_float; Y: Pgsl_vector_complex_float; dotu: Pgsl_complex_float): longint; cdecl; external libgslcblas;
function gsl_blas_cdotc(X: Pgsl_vector_complex_float; Y: Pgsl_vector_complex_float; dotc: Pgsl_complex_float): longint; cdecl; external libgslcblas;
function gsl_blas_zdotu(X: Pgsl_vector_complex; Y: Pgsl_vector_complex; dotu: Pgsl_complex): longint; cdecl; external libgslcblas;
function gsl_blas_zdotc(X: Pgsl_vector_complex; Y: Pgsl_vector_complex; dotc: Pgsl_complex): longint; cdecl; external libgslcblas;
function gsl_blas_snrm2(X: Pgsl_vector_float): single; cdecl; external libgslcblas;
function gsl_blas_sasum(X: Pgsl_vector_float): single; cdecl; external libgslcblas;
function gsl_blas_dnrm2(X: Pgsl_vector): double; cdecl; external libgslcblas;
function gsl_blas_dasum(X: Pgsl_vector): double; cdecl; external libgslcblas;
function gsl_blas_scnrm2(X: Pgsl_vector_complex_float): single; cdecl; external libgslcblas;
function gsl_blas_scasum(X: Pgsl_vector_complex_float): single; cdecl; external libgslcblas;
function gsl_blas_dznrm2(X: Pgsl_vector_complex): double; cdecl; external libgslcblas;
function gsl_blas_dzasum(X: Pgsl_vector_complex): double; cdecl; external libgslcblas;
function gsl_blas_isamax(X: Pgsl_vector_float): TCBLAS_INDEX_t; cdecl; external libgslcblas;
function gsl_blas_idamax(X: Pgsl_vector): TCBLAS_INDEX_t; cdecl; external libgslcblas;
function gsl_blas_icamax(X: Pgsl_vector_complex_float): TCBLAS_INDEX_t; cdecl; external libgslcblas;
function gsl_blas_izamax(X: Pgsl_vector_complex): TCBLAS_INDEX_t; cdecl; external libgslcblas;
function gsl_blas_sswap(X: Pgsl_vector_float; Y: Pgsl_vector_float): longint; cdecl; external libgslcblas;
function gsl_blas_scopy(X: Pgsl_vector_float; Y: Pgsl_vector_float): longint; cdecl; external libgslcblas;
function gsl_blas_saxpy(alpha: single; X: Pgsl_vector_float; Y: Pgsl_vector_float): longint; cdecl; external libgslcblas;
function gsl_blas_dswap(X: Pgsl_vector; Y: Pgsl_vector): longint; cdecl; external libgslcblas;
function gsl_blas_dcopy(X: Pgsl_vector; Y: Pgsl_vector): longint; cdecl; external libgslcblas;
function gsl_blas_daxpy(alpha: double; X: Pgsl_vector; Y: Pgsl_vector): longint; cdecl; external libgslcblas;
function gsl_blas_cswap(X: Pgsl_vector_complex_float; Y: Pgsl_vector_complex_float): longint; cdecl; external libgslcblas;
function gsl_blas_ccopy(X: Pgsl_vector_complex_float; Y: Pgsl_vector_complex_float): longint; cdecl; external libgslcblas;
function gsl_blas_caxpy(alpha: Tgsl_complex_float; X: Pgsl_vector_complex_float; Y: Pgsl_vector_complex_float): longint; cdecl; external libgslcblas;
function gsl_blas_zswap(X: Pgsl_vector_complex; Y: Pgsl_vector_complex): longint; cdecl; external libgslcblas;
function gsl_blas_zcopy(X: Pgsl_vector_complex; Y: Pgsl_vector_complex): longint; cdecl; external libgslcblas;
function gsl_blas_zaxpy(alpha: Tgsl_complex; X: Pgsl_vector_complex; Y: Pgsl_vector_complex): longint; cdecl; external libgslcblas;
function gsl_blas_srotg(a: Psingle; b: Psingle; c: Psingle; s: Psingle): longint; cdecl; external libgslcblas;
function gsl_blas_srotmg(d1: Psingle; d2: Psingle; b1: Psingle; b2: single; P: Psingle): longint; cdecl; external libgslcblas;
function gsl_blas_srot(X: Pgsl_vector_float; Y: Pgsl_vector_float; c: single; s: single): longint; cdecl; external libgslcblas;
function gsl_blas_srotm(X: Pgsl_vector_float; Y: Pgsl_vector_float; P: Psingle): longint; cdecl; external libgslcblas;
function gsl_blas_drotg(a: Pdouble; b: Pdouble; c: Pdouble; s: Pdouble): longint; cdecl; external libgslcblas;
function gsl_blas_drotmg(d1: Pdouble; d2: Pdouble; b1: Pdouble; b2: double; P: Pdouble): longint; cdecl; external libgslcblas;
function gsl_blas_drot(X: Pgsl_vector; Y: Pgsl_vector; c: double; s: double): longint; cdecl; external libgslcblas;
function gsl_blas_drotm(X: Pgsl_vector; Y: Pgsl_vector; P: Pdouble): longint; cdecl; external libgslcblas;
procedure gsl_blas_sscal(alpha: single; X: Pgsl_vector_float); cdecl; external libgslcblas;
procedure gsl_blas_dscal(alpha: double; X: Pgsl_vector); cdecl; external libgslcblas;
procedure gsl_blas_cscal(alpha: Tgsl_complex_float; X: Pgsl_vector_complex_float); cdecl; external libgslcblas;
procedure gsl_blas_zscal(alpha: Tgsl_complex; X: Pgsl_vector_complex); cdecl; external libgslcblas;
procedure gsl_blas_csscal(alpha: single; X: Pgsl_vector_complex_float); cdecl; external libgslcblas;
procedure gsl_blas_zdscal(alpha: double; X: Pgsl_vector_complex); cdecl; external libgslcblas;

function gsl_blas_sgemv(TransA: TCBLAS_TRANSPOSE_t; alpha: single; A: Pgsl_matrix_float; X: Pgsl_vector_float; beta: single;
  Y: Pgsl_vector_float): longint; cdecl; external libgslcblas;
function gsl_blas_strmv(Uplo: TCBLAS_UPLO_t; TransA: TCBLAS_TRANSPOSE_t; Diag: TCBLAS_DIAG_t; A: Pgsl_matrix_float; X: Pgsl_vector_float): longint; cdecl; external libgslcblas;
function gsl_blas_strsv(Uplo: TCBLAS_UPLO_t; TransA: TCBLAS_TRANSPOSE_t; Diag: TCBLAS_DIAG_t; A: Pgsl_matrix_float; X: Pgsl_vector_float): longint; cdecl; external libgslcblas;
function gsl_blas_dgemv(TransA: TCBLAS_TRANSPOSE_t; alpha: double; A: Pgsl_matrix; X: Pgsl_vector; beta: double;
  Y: Pgsl_vector): longint; cdecl; external libgslcblas;
function gsl_blas_dtrmv(Uplo: TCBLAS_UPLO_t; TransA: TCBLAS_TRANSPOSE_t; Diag: TCBLAS_DIAG_t; A: Pgsl_matrix; X: Pgsl_vector): longint; cdecl; external libgslcblas;
function gsl_blas_dtrsv(Uplo: TCBLAS_UPLO_t; TransA: TCBLAS_TRANSPOSE_t; Diag: TCBLAS_DIAG_t; A: Pgsl_matrix; X: Pgsl_vector): longint; cdecl; external libgslcblas;
function gsl_blas_cgemv(TransA: TCBLAS_TRANSPOSE_t; alpha: Tgsl_complex_float; A: Pgsl_matrix_complex_float; X: Pgsl_vector_complex_float; beta: Tgsl_complex_float;
  Y: Pgsl_vector_complex_float): longint; cdecl; external libgslcblas;
function gsl_blas_ctrmv(Uplo: TCBLAS_UPLO_t; TransA: TCBLAS_TRANSPOSE_t; Diag: TCBLAS_DIAG_t; A: Pgsl_matrix_complex_float; X: Pgsl_vector_complex_float): longint; cdecl; external libgslcblas;
function gsl_blas_ctrsv(Uplo: TCBLAS_UPLO_t; TransA: TCBLAS_TRANSPOSE_t; Diag: TCBLAS_DIAG_t; A: Pgsl_matrix_complex_float; X: Pgsl_vector_complex_float): longint; cdecl; external libgslcblas;
function gsl_blas_zgemv(TransA: TCBLAS_TRANSPOSE_t; alpha: Tgsl_complex; A: Pgsl_matrix_complex; X: Pgsl_vector_complex; beta: Tgsl_complex;
  Y: Pgsl_vector_complex): longint; cdecl; external libgslcblas;
function gsl_blas_ztrmv(Uplo: TCBLAS_UPLO_t; TransA: TCBLAS_TRANSPOSE_t; Diag: TCBLAS_DIAG_t; A: Pgsl_matrix_complex; X: Pgsl_vector_complex): longint; cdecl; external libgslcblas;
function gsl_blas_ztrsv(Uplo: TCBLAS_UPLO_t; TransA: TCBLAS_TRANSPOSE_t; Diag: TCBLAS_DIAG_t; A: Pgsl_matrix_complex; X: Pgsl_vector_complex): longint; cdecl; external libgslcblas;

function gsl_blas_ssymv(Uplo: TCBLAS_UPLO_t; alpha: single; A: Pgsl_matrix_float; X: Pgsl_vector_float; beta: single;
  Y: Pgsl_vector_float): longint; cdecl; external libgslcblas;
function gsl_blas_sger(alpha: single; X: Pgsl_vector_float; Y: Pgsl_vector_float; A: Pgsl_matrix_float): longint; cdecl; external libgslcblas;
function gsl_blas_ssyr(Uplo: TCBLAS_UPLO_t; alpha: single; X: Pgsl_vector_float; A: Pgsl_matrix_float): longint; cdecl; external libgslcblas;
function gsl_blas_ssyr2(Uplo: TCBLAS_UPLO_t; alpha: single; X: Pgsl_vector_float; Y: Pgsl_vector_float; A: Pgsl_matrix_float): longint; cdecl; external libgslcblas;
function gsl_blas_dsymv(Uplo: TCBLAS_UPLO_t; alpha: double; A: Pgsl_matrix; X: Pgsl_vector; beta: double;
  Y: Pgsl_vector): longint; cdecl; external libgslcblas;
function gsl_blas_dger(alpha: double; X: Pgsl_vector; Y: Pgsl_vector; A: Pgsl_matrix): longint; cdecl; external libgslcblas;
function gsl_blas_dsyr(Uplo: TCBLAS_UPLO_t; alpha: double; X: Pgsl_vector; A: Pgsl_matrix): longint; cdecl; external libgslcblas;
function gsl_blas_dsyr2(Uplo: TCBLAS_UPLO_t; alpha: double; X: Pgsl_vector; Y: Pgsl_vector; A: Pgsl_matrix): longint; cdecl; external libgslcblas;

function gsl_blas_chemv(Uplo: TCBLAS_UPLO_t; alpha: Tgsl_complex_float; A: Pgsl_matrix_complex_float; X: Pgsl_vector_complex_float; beta: Tgsl_complex_float;
  Y: Pgsl_vector_complex_float): longint; cdecl; external libgslcblas;
function gsl_blas_cgeru(alpha: Tgsl_complex_float; X: Pgsl_vector_complex_float; Y: Pgsl_vector_complex_float; A: Pgsl_matrix_complex_float): longint; cdecl; external libgslcblas;
function gsl_blas_cgerc(alpha: Tgsl_complex_float; X: Pgsl_vector_complex_float; Y: Pgsl_vector_complex_float; A: Pgsl_matrix_complex_float): longint; cdecl; external libgslcblas;
function gsl_blas_cher(Uplo: TCBLAS_UPLO_t; alpha: single; X: Pgsl_vector_complex_float; A: Pgsl_matrix_complex_float): longint; cdecl; external libgslcblas;
function gsl_blas_cher2(Uplo: TCBLAS_UPLO_t; alpha: Tgsl_complex_float; X: Pgsl_vector_complex_float; Y: Pgsl_vector_complex_float; A: Pgsl_matrix_complex_float): longint; cdecl; external libgslcblas;
function gsl_blas_zhemv(Uplo: TCBLAS_UPLO_t; alpha: Tgsl_complex; A: Pgsl_matrix_complex; X: Pgsl_vector_complex; beta: Tgsl_complex;
  Y: Pgsl_vector_complex): longint; cdecl; external libgslcblas;
function gsl_blas_zgeru(alpha: Tgsl_complex; X: Pgsl_vector_complex; Y: Pgsl_vector_complex; A: Pgsl_matrix_complex): longint; cdecl; external libgslcblas;
function gsl_blas_zgerc(alpha: Tgsl_complex; X: Pgsl_vector_complex; Y: Pgsl_vector_complex; A: Pgsl_matrix_complex): longint; cdecl; external libgslcblas;
function gsl_blas_zher(Uplo: TCBLAS_UPLO_t; alpha: double; X: Pgsl_vector_complex; A: Pgsl_matrix_complex): longint; cdecl; external libgslcblas;
function gsl_blas_zher2(Uplo: TCBLAS_UPLO_t; alpha: Tgsl_complex; X: Pgsl_vector_complex; Y: Pgsl_vector_complex; A: Pgsl_matrix_complex): longint; cdecl; external libgslcblas;

function gsl_blas_sgemm(TransA: TCBLAS_TRANSPOSE_t; TransB: TCBLAS_TRANSPOSE_t; alpha: single; A: Pgsl_matrix_float; B: Pgsl_matrix_float;
  beta: single; C: Pgsl_matrix_float): longint; cdecl; external libgslcblas;
function gsl_blas_ssymm(Side: TCBLAS_SIDE_t; Uplo: TCBLAS_UPLO_t; alpha: single; A: Pgsl_matrix_float; B: Pgsl_matrix_float;
  beta: single; C: Pgsl_matrix_float): longint; cdecl; external libgslcblas;
function gsl_blas_ssyrk(Uplo: TCBLAS_UPLO_t; Trans: TCBLAS_TRANSPOSE_t; alpha: single; A: Pgsl_matrix_float; beta: single;
  C: Pgsl_matrix_float): longint; cdecl; external libgslcblas;
function gsl_blas_ssyr2k(Uplo: TCBLAS_UPLO_t; Trans: TCBLAS_TRANSPOSE_t; alpha: single; A: Pgsl_matrix_float; B: Pgsl_matrix_float;
  beta: single; C: Pgsl_matrix_float): longint; cdecl; external libgslcblas;
function gsl_blas_strmm(Side: TCBLAS_SIDE_t; Uplo: TCBLAS_UPLO_t; TransA: TCBLAS_TRANSPOSE_t; Diag: TCBLAS_DIAG_t; alpha: single;
  A: Pgsl_matrix_float; B: Pgsl_matrix_float): longint; cdecl; external libgslcblas;
function gsl_blas_strsm(Side: TCBLAS_SIDE_t; Uplo: TCBLAS_UPLO_t; TransA: TCBLAS_TRANSPOSE_t; Diag: TCBLAS_DIAG_t; alpha: single;
  A: Pgsl_matrix_float; B: Pgsl_matrix_float): longint; cdecl; external libgslcblas;
function gsl_blas_dgemm(TransA: TCBLAS_TRANSPOSE_t; TransB: TCBLAS_TRANSPOSE_t; alpha: double; A: Pgsl_matrix; B: Pgsl_matrix;
  beta: double; C: Pgsl_matrix): longint; cdecl; external libgslcblas;
function gsl_blas_dsymm(Side: TCBLAS_SIDE_t; Uplo: TCBLAS_UPLO_t; alpha: double; A: Pgsl_matrix; B: Pgsl_matrix;
  beta: double; C: Pgsl_matrix): longint; cdecl; external libgslcblas;
function gsl_blas_dsyrk(Uplo: TCBLAS_UPLO_t; Trans: TCBLAS_TRANSPOSE_t; alpha: double; A: Pgsl_matrix; beta: double;
  C: Pgsl_matrix): longint; cdecl; external libgslcblas;
function gsl_blas_dsyr2k(Uplo: TCBLAS_UPLO_t; Trans: TCBLAS_TRANSPOSE_t; alpha: double; A: Pgsl_matrix; B: Pgsl_matrix;
  beta: double; C: Pgsl_matrix): longint; cdecl; external libgslcblas;
function gsl_blas_dtrmm(Side: TCBLAS_SIDE_t; Uplo: TCBLAS_UPLO_t; TransA: TCBLAS_TRANSPOSE_t; Diag: TCBLAS_DIAG_t; alpha: double;
  A: Pgsl_matrix; B: Pgsl_matrix): longint; cdecl; external libgslcblas;
function gsl_blas_dtrsm(Side: TCBLAS_SIDE_t; Uplo: TCBLAS_UPLO_t; TransA: TCBLAS_TRANSPOSE_t; Diag: TCBLAS_DIAG_t; alpha: double;
  A: Pgsl_matrix; B: Pgsl_matrix): longint; cdecl; external libgslcblas;
function gsl_blas_cgemm(TransA: TCBLAS_TRANSPOSE_t; TransB: TCBLAS_TRANSPOSE_t; alpha: Tgsl_complex_float; A: Pgsl_matrix_complex_float; B: Pgsl_matrix_complex_float;
  beta: Tgsl_complex_float; C: Pgsl_matrix_complex_float): longint; cdecl; external libgslcblas;
function gsl_blas_csymm(Side: TCBLAS_SIDE_t; Uplo: TCBLAS_UPLO_t; alpha: Tgsl_complex_float; A: Pgsl_matrix_complex_float; B: Pgsl_matrix_complex_float;
  beta: Tgsl_complex_float; C: Pgsl_matrix_complex_float): longint; cdecl; external libgslcblas;
function gsl_blas_csyrk(Uplo: TCBLAS_UPLO_t; Trans: TCBLAS_TRANSPOSE_t; alpha: Tgsl_complex_float; A: Pgsl_matrix_complex_float; beta: Tgsl_complex_float;
  C: Pgsl_matrix_complex_float): longint; cdecl; external libgslcblas;
function gsl_blas_csyr2k(Uplo: TCBLAS_UPLO_t; Trans: TCBLAS_TRANSPOSE_t; alpha: Tgsl_complex_float; A: Pgsl_matrix_complex_float; B: Pgsl_matrix_complex_float;
  beta: Tgsl_complex_float; C: Pgsl_matrix_complex_float): longint; cdecl; external libgslcblas;
function gsl_blas_ctrmm(Side: TCBLAS_SIDE_t; Uplo: TCBLAS_UPLO_t; TransA: TCBLAS_TRANSPOSE_t; Diag: TCBLAS_DIAG_t; alpha: Tgsl_complex_float;
  A: Pgsl_matrix_complex_float; B: Pgsl_matrix_complex_float): longint; cdecl; external libgslcblas;
function gsl_blas_ctrsm(Side: TCBLAS_SIDE_t; Uplo: TCBLAS_UPLO_t; TransA: TCBLAS_TRANSPOSE_t; Diag: TCBLAS_DIAG_t; alpha: Tgsl_complex_float;
  A: Pgsl_matrix_complex_float; B: Pgsl_matrix_complex_float): longint; cdecl; external libgslcblas;
function gsl_blas_zgemm(TransA: TCBLAS_TRANSPOSE_t; TransB: TCBLAS_TRANSPOSE_t; alpha: Tgsl_complex; A: Pgsl_matrix_complex; B: Pgsl_matrix_complex;
  beta: Tgsl_complex; C: Pgsl_matrix_complex): longint; cdecl; external libgslcblas;
function gsl_blas_zsymm(Side: TCBLAS_SIDE_t; Uplo: TCBLAS_UPLO_t; alpha: Tgsl_complex; A: Pgsl_matrix_complex; B: Pgsl_matrix_complex;
  beta: Tgsl_complex; C: Pgsl_matrix_complex): longint; cdecl; external libgslcblas;
function gsl_blas_zsyrk(Uplo: TCBLAS_UPLO_t; Trans: TCBLAS_TRANSPOSE_t; alpha: Tgsl_complex; A: Pgsl_matrix_complex; beta: Tgsl_complex;
  C: Pgsl_matrix_complex): longint; cdecl; external libgslcblas;
function gsl_blas_zsyr2k(Uplo: TCBLAS_UPLO_t; Trans: TCBLAS_TRANSPOSE_t; alpha: Tgsl_complex; A: Pgsl_matrix_complex; B: Pgsl_matrix_complex;
  beta: Tgsl_complex; C: Pgsl_matrix_complex): longint; cdecl; external libgslcblas;
function gsl_blas_ztrmm(Side: TCBLAS_SIDE_t; Uplo: TCBLAS_UPLO_t; TransA: TCBLAS_TRANSPOSE_t; Diag: TCBLAS_DIAG_t; alpha: Tgsl_complex;
  A: Pgsl_matrix_complex; B: Pgsl_matrix_complex): longint; cdecl; external libgslcblas;
function gsl_blas_ztrsm(Side: TCBLAS_SIDE_t; Uplo: TCBLAS_UPLO_t; TransA: TCBLAS_TRANSPOSE_t; Diag: TCBLAS_DIAG_t; alpha: Tgsl_complex;
  A: Pgsl_matrix_complex; B: Pgsl_matrix_complex): longint; cdecl; external libgslcblas;

function gsl_blas_chemm(Side: TCBLAS_SIDE_t; Uplo: TCBLAS_UPLO_t; alpha: Tgsl_complex_float; A: Pgsl_matrix_complex_float; B: Pgsl_matrix_complex_float;
  beta: Tgsl_complex_float; C: Pgsl_matrix_complex_float): longint; cdecl; external libgslcblas;
function gsl_blas_cherk(Uplo: TCBLAS_UPLO_t; Trans: TCBLAS_TRANSPOSE_t; alpha: single; A: Pgsl_matrix_complex_float; beta: single;
  C: Pgsl_matrix_complex_float): longint; cdecl; external libgslcblas;
function gsl_blas_cher2k(Uplo: TCBLAS_UPLO_t; Trans: TCBLAS_TRANSPOSE_t; alpha: Tgsl_complex_float; A: Pgsl_matrix_complex_float; B: Pgsl_matrix_complex_float;
  beta: single; C: Pgsl_matrix_complex_float): longint; cdecl; external libgslcblas;
function gsl_blas_zhemm(Side: TCBLAS_SIDE_t; Uplo: TCBLAS_UPLO_t; alpha: Tgsl_complex; A: Pgsl_matrix_complex; B: Pgsl_matrix_complex;
  beta: Tgsl_complex; C: Pgsl_matrix_complex): longint; cdecl; external libgslcblas;
function gsl_blas_zherk(Uplo: TCBLAS_UPLO_t; Trans: TCBLAS_TRANSPOSE_t; alpha: double; A: Pgsl_matrix_complex; beta: double;
  C: Pgsl_matrix_complex): longint; cdecl; external libgslcblas;
function gsl_blas_zher2k(Uplo: TCBLAS_UPLO_t; Trans: TCBLAS_TRANSPOSE_t; alpha: Tgsl_complex; A: Pgsl_matrix_complex; B: Pgsl_matrix_complex;
  beta: double; C: Pgsl_matrix_complex): longint; cdecl; external libgslcblas;

// === Konventiert am: 18-8-25 16:28:02 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
