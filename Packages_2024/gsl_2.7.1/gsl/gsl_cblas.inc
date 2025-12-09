{$IFDEF read_interface}


type
  TCBLAS_INDEX = tsize_t;

type
  TCBLAS_ORDER = longint;

const
  CblasRowMajor = 101;
  CblasColMajor = 102;

type
  TCBLAS_TRANSPOSE = longint;

const
  CblasNoTrans = 111;
  CblasTrans = 112;
  CblasConjTrans = 113;

type
  TCBLAS_UPLO = longint;

const
  CblasUpper = 121;
  CblasLower = 122;

type
  TCBLAS_DIAG = longint;

const
  CblasNonUnit = 131;
  CblasUnit = 132;

type
  TCBLAS_SIDE = longint;

const
  CblasLeft = 141;
  CblasRight = 142;

function cblas_sdsdot(N: longint; alpha: single; X: Psingle; incX: longint; Y: Psingle; incY: longint): single; cdecl; external libgsl;
function cblas_dsdot(N: longint; X: Psingle; incX: longint; Y: Psingle; incY: longint): double; cdecl; external libgslcblas;
function cblas_sdot(N: longint; X: Psingle; incX: longint; Y: Psingle; incY: longint): single; cdecl; external libgslcblas;
function cblas_ddot(N: longint; X: Pdouble; incX: longint; Y: Pdouble; incY: longint): double; cdecl; external libgslcblas;

procedure cblas_cdotu_sub(N: longint; X: pointer; incX: longint; Y: pointer; incY: longint; dotu: pointer); cdecl; external libgslcblas;
procedure cblas_cdotc_sub(N: longint; X: pointer; incX: longint; Y: pointer; incY: longint; dotc: pointer); cdecl; external libgslcblas;
procedure cblas_zdotu_sub(N: longint; X: pointer; incX: longint; Y: pointer; incY: longint; dotu: pointer); cdecl; external libgslcblas;
procedure cblas_zdotc_sub(N: longint; X: pointer; incX: longint; Y: pointer; incY: longint; dotc: pointer); cdecl; external libgslcblas;

function cblas_snrm2(N: longint; X: Psingle; incX: longint): single; cdecl; external libgslcblas;
function cblas_sasum(N: longint; X: Psingle; incX: longint): single; cdecl; external libgslcblas;
function cblas_dnrm2(N: longint; X: Pdouble; incX: longint): double; cdecl; external libgslcblas;
function cblas_dasum(N: longint; X: Pdouble; incX: longint): double; cdecl; external libgslcblas;
function cblas_scnrm2(N: longint; X: pointer; incX: longint): single; cdecl; external libgslcblas;
function cblas_scasum(N: longint; X: pointer; incX: longint): single; cdecl; external libgslcblas;
function cblas_dznrm2(N: longint; X: pointer; incX: longint): double; cdecl; external libgslcblas;
function cblas_dzasum(N: longint; X: pointer; incX: longint): double; cdecl; external libgslcblas;

function cblas_isamax(N: longint; X: Psingle; incX: longint): TCBLAS_INDEX; cdecl; external libgslcblas;
function cblas_idamax(N: longint; X: Pdouble; incX: longint): TCBLAS_INDEX; cdecl; external libgslcblas;
function cblas_icamax(N: longint; X: pointer; incX: longint): TCBLAS_INDEX; cdecl; external libgslcblas;
function cblas_izamax(N: longint; X: pointer; incX: longint): TCBLAS_INDEX; cdecl; external libgslcblas;

procedure cblas_sswap(N: longint; X: Psingle; incX: longint; Y: Psingle; incY: longint); cdecl; external libgslcblas;
procedure cblas_scopy(N: longint; X: Psingle; incX: longint; Y: Psingle; incY: longint); cdecl; external libgslcblas;
procedure cblas_saxpy(N: longint; alpha: single; X: Psingle; incX: longint; Y: Psingle; incY: longint); cdecl; external libgslcblas;
procedure cblas_dswap(N: longint; X: Pdouble; incX: longint; Y: Pdouble; incY: longint); cdecl; external libgslcblas;
procedure cblas_dcopy(N: longint; X: Pdouble; incX: longint; Y: Pdouble; incY: longint); cdecl; external libgslcblas;
procedure cblas_daxpy(N: longint; alpha: double; X: Pdouble; incX: longint; Y: Pdouble; incY: longint); cdecl; external libgslcblas;
procedure cblas_cswap(N: longint; X: pointer; incX: longint; Y: pointer; incY: longint); cdecl; external libgslcblas;
procedure cblas_ccopy(N: longint; X: pointer; incX: longint; Y: pointer; incY: longint); cdecl; external libgslcblas;
procedure cblas_caxpy(N: longint; alpha: pointer; X: pointer; incX: longint; Y: pointer; incY: longint); cdecl; external libgslcblas;
procedure cblas_zswap(N: longint; X: pointer; incX: longint; Y: pointer; incY: longint); cdecl; external libgslcblas;
procedure cblas_zcopy(N: longint; X: pointer; incX: longint; Y: pointer; incY: longint); cdecl; external libgslcblas;
procedure cblas_zaxpy(N: longint; alpha: pointer; X: pointer; incX: longint; Y: pointer; incY: longint); cdecl; external libgslcblas;

procedure cblas_srotg(a: Psingle; b: Psingle; c: Psingle; s: Psingle); cdecl; external libgslcblas;
procedure cblas_srotmg(d1: Psingle; d2: Psingle; b1: Psingle; b2: single; P: Psingle); cdecl; external libgslcblas;
procedure cblas_srot(N: longint; X: Psingle; incX: longint; Y: Psingle; incY: longint; c: single; s: single); cdecl; external libgslcblas;
procedure cblas_srotm(N: longint; X: Psingle; incX: longint; Y: Psingle; incY: longint; P: Psingle); cdecl; external libgslcblas;
procedure cblas_drotg(a: Pdouble; b: Pdouble; c: Pdouble; s: Pdouble); cdecl; external libgslcblas;
procedure cblas_drotmg(d1: Pdouble; d2: Pdouble; b1: Pdouble; b2: double; P: Pdouble); cdecl; external libgslcblas;
procedure cblas_drot(N: longint; X: Pdouble; incX: longint; Y: Pdouble; incY: longint; c: double; s: double); cdecl; external libgslcblas;
procedure cblas_drotm(N: longint; X: Pdouble; incX: longint; Y: Pdouble; incY: longint; P: Pdouble); cdecl; external libgslcblas;

procedure cblas_sscal(N: longint; alpha: single; X: Psingle; incX: longint); cdecl; external libgslcblas;
procedure cblas_dscal(N: longint; alpha: double; X: Pdouble; incX: longint); cdecl; external libgslcblas;
procedure cblas_cscal(N: longint; alpha: pointer; X: pointer; incX: longint); cdecl; external libgslcblas;
procedure cblas_zscal(N: longint; alpha: pointer; X: pointer; incX: longint); cdecl; external libgslcblas;
procedure cblas_csscal(N: longint; alpha: single; X: pointer; incX: longint); cdecl; external libgslcblas;
procedure cblas_zdscal(N: longint; alpha: double; X: pointer; incX: longint); cdecl; external libgslcblas;

procedure cblas_sgemv(order: TCBLAS_ORDER; TransA: TCBLAS_TRANSPOSE; M: longint; N: longint; alpha: single;
  A: Psingle; lda: longint; X: Psingle; incX: longint; beta: single;
  Y: Psingle; incY: longint); cdecl; external libgslcblas;
procedure cblas_sgbmv(order: TCBLAS_ORDER; TransA: TCBLAS_TRANSPOSE; M: longint; N: longint; KL: longint;
  KU: longint; alpha: single; A: Psingle; lda: longint; X: Psingle;
  incX: longint; beta: single; Y: Psingle; incY: longint); cdecl; external libgslcblas;
procedure cblas_strmv(order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; TransA: TCBLAS_TRANSPOSE; Diag: TCBLAS_DIAG; N: longint;
  A: Psingle; lda: longint; X: Psingle; incX: longint); cdecl; external libgslcblas;
procedure cblas_stbmv(order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; TransA: TCBLAS_TRANSPOSE; Diag: TCBLAS_DIAG; N: longint;
  K: longint; A: Psingle; lda: longint; X: Psingle; incX: longint); cdecl; external libgslcblas;
procedure cblas_stpmv(order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; TransA: TCBLAS_TRANSPOSE; Diag: TCBLAS_DIAG; N: longint;
  Ap: Psingle; X: Psingle; incX: longint); cdecl; external libgslcblas;
procedure cblas_strsv(order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; TransA: TCBLAS_TRANSPOSE; Diag: TCBLAS_DIAG; N: longint;
  A: Psingle; lda: longint; X: Psingle; incX: longint); cdecl; external libgslcblas;
procedure cblas_stbsv(order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; TransA: TCBLAS_TRANSPOSE; Diag: TCBLAS_DIAG; N: longint;
  K: longint; A: Psingle; lda: longint; X: Psingle; incX: longint); cdecl; external libgslcblas;
procedure cblas_stpsv(order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; TransA: TCBLAS_TRANSPOSE; Diag: TCBLAS_DIAG; N: longint;
  Ap: Psingle; X: Psingle; incX: longint); cdecl; external libgslcblas;
procedure cblas_dgemv(order: TCBLAS_ORDER; TransA: TCBLAS_TRANSPOSE; M: longint; N: longint; alpha: double;
  A: Pdouble; lda: longint; X: Pdouble; incX: longint; beta: double;
  Y: Pdouble; incY: longint); cdecl; external libgslcblas;
procedure cblas_dgbmv(order: TCBLAS_ORDER; TransA: TCBLAS_TRANSPOSE; M: longint; N: longint; KL: longint;
  KU: longint; alpha: double; A: Pdouble; lda: longint; X: Pdouble;
  incX: longint; beta: double; Y: Pdouble; incY: longint); cdecl; external libgslcblas;
procedure cblas_dtrmv(order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; TransA: TCBLAS_TRANSPOSE; Diag: TCBLAS_DIAG; N: longint;
  A: Pdouble; lda: longint; X: Pdouble; incX: longint); cdecl; external libgslcblas;
procedure cblas_dtbmv(order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; TransA: TCBLAS_TRANSPOSE; Diag: TCBLAS_DIAG; N: longint;
  K: longint; A: Pdouble; lda: longint; X: Pdouble; incX: longint); cdecl; external libgslcblas;
procedure cblas_dtpmv(order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; TransA: TCBLAS_TRANSPOSE; Diag: TCBLAS_DIAG; N: longint;
  Ap: Pdouble; X: Pdouble; incX: longint); cdecl; external libgslcblas;
procedure cblas_dtrsv(order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; TransA: TCBLAS_TRANSPOSE; Diag: TCBLAS_DIAG; N: longint;
  A: Pdouble; lda: longint; X: Pdouble; incX: longint); cdecl; external libgslcblas;
procedure cblas_dtbsv(order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; TransA: TCBLAS_TRANSPOSE; Diag: TCBLAS_DIAG; N: longint;
  K: longint; A: Pdouble; lda: longint; X: Pdouble; incX: longint); cdecl; external libgslcblas;
procedure cblas_dtpsv(order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; TransA: TCBLAS_TRANSPOSE; Diag: TCBLAS_DIAG; N: longint;
  Ap: Pdouble; X: Pdouble; incX: longint); cdecl; external libgslcblas;
procedure cblas_cgemv(order: TCBLAS_ORDER; TransA: TCBLAS_TRANSPOSE; M: longint; N: longint; alpha: pointer;
  A: pointer; lda: longint; X: pointer; incX: longint; beta: pointer;
  Y: pointer; incY: longint); cdecl; external libgslcblas;
procedure cblas_cgbmv(order: TCBLAS_ORDER; TransA: TCBLAS_TRANSPOSE; M: longint; N: longint; KL: longint;
  KU: longint; alpha: pointer; A: pointer; lda: longint; X: pointer;
  incX: longint; beta: pointer; Y: pointer; incY: longint); cdecl; external libgslcblas;
procedure cblas_ctrmv(order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; TransA: TCBLAS_TRANSPOSE; Diag: TCBLAS_DIAG; N: longint;
  A: pointer; lda: longint; X: pointer; incX: longint); cdecl; external libgslcblas;
procedure cblas_ctbmv(order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; TransA: TCBLAS_TRANSPOSE; Diag: TCBLAS_DIAG; N: longint;
  K: longint; A: pointer; lda: longint; X: pointer; incX: longint); cdecl; external libgslcblas;
procedure cblas_ctpmv(order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; TransA: TCBLAS_TRANSPOSE; Diag: TCBLAS_DIAG; N: longint;
  Ap: pointer; X: pointer; incX: longint); cdecl; external libgslcblas;
procedure cblas_ctrsv(order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; TransA: TCBLAS_TRANSPOSE; Diag: TCBLAS_DIAG; N: longint;
  A: pointer; lda: longint; X: pointer; incX: longint); cdecl; external libgslcblas;
procedure cblas_ctbsv(order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; TransA: TCBLAS_TRANSPOSE; Diag: TCBLAS_DIAG; N: longint;
  K: longint; A: pointer; lda: longint; X: pointer; incX: longint); cdecl; external libgslcblas;
procedure cblas_ctpsv(order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; TransA: TCBLAS_TRANSPOSE; Diag: TCBLAS_DIAG; N: longint;
  Ap: pointer; X: pointer; incX: longint); cdecl; external libgslcblas;
procedure cblas_zgemv(order: TCBLAS_ORDER; TransA: TCBLAS_TRANSPOSE; M: longint; N: longint; alpha: pointer;
  A: pointer; lda: longint; X: pointer; incX: longint; beta: pointer;
  Y: pointer; incY: longint); cdecl; external libgslcblas;
procedure cblas_zgbmv(order: TCBLAS_ORDER; TransA: TCBLAS_TRANSPOSE; M: longint; N: longint; KL: longint;
  KU: longint; alpha: pointer; A: pointer; lda: longint; X: pointer;
  incX: longint; beta: pointer; Y: pointer; incY: longint); cdecl; external libgslcblas;
procedure cblas_ztrmv(order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; TransA: TCBLAS_TRANSPOSE; Diag: TCBLAS_DIAG; N: longint;
  A: pointer; lda: longint; X: pointer; incX: longint); cdecl; external libgslcblas;
procedure cblas_ztbmv(order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; TransA: TCBLAS_TRANSPOSE; Diag: TCBLAS_DIAG; N: longint;
  K: longint; A: pointer; lda: longint; X: pointer; incX: longint); cdecl; external libgslcblas;
procedure cblas_ztpmv(order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; TransA: TCBLAS_TRANSPOSE; Diag: TCBLAS_DIAG; N: longint;
  Ap: pointer; X: pointer; incX: longint); cdecl; external libgslcblas;
procedure cblas_ztrsv(order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; TransA: TCBLAS_TRANSPOSE; Diag: TCBLAS_DIAG; N: longint;
  A: pointer; lda: longint; X: pointer; incX: longint); cdecl; external libgslcblas;
procedure cblas_ztbsv(order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; TransA: TCBLAS_TRANSPOSE; Diag: TCBLAS_DIAG; N: longint;
  K: longint; A: pointer; lda: longint; X: pointer; incX: longint); cdecl; external libgslcblas;
procedure cblas_ztpsv(order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; TransA: TCBLAS_TRANSPOSE; Diag: TCBLAS_DIAG; N: longint;
  Ap: pointer; X: pointer; incX: longint); cdecl; external libgslcblas;

procedure cblas_ssymv(order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; N: longint; alpha: single; A: Psingle;
  lda: longint; X: Psingle; incX: longint; beta: single; Y: Psingle;
  incY: longint); cdecl; external libgslcblas;
procedure cblas_ssbmv(order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; N: longint; K: longint; alpha: single;
  A: Psingle; lda: longint; X: Psingle; incX: longint; beta: single;
  Y: Psingle; incY: longint); cdecl; external libgslcblas;
procedure cblas_sspmv(order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; N: longint; alpha: single; Ap: Psingle;
  X: Psingle; incX: longint; beta: single; Y: Psingle; incY: longint); cdecl; external libgslcblas;
procedure cblas_sger(order: TCBLAS_ORDER; M: longint; N: longint; alpha: single; X: Psingle;
  incX: longint; Y: Psingle; incY: longint; A: Psingle; lda: longint); cdecl; external libgslcblas;
procedure cblas_ssyr(order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; N: longint; alpha: single; X: Psingle;
  incX: longint; A: Psingle; lda: longint); cdecl; external libgslcblas;
procedure cblas_sspr(order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; N: longint; alpha: single; X: Psingle;
  incX: longint; Ap: Psingle); cdecl; external libgslcblas;
procedure cblas_ssyr2(order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; N: longint; alpha: single; X: Psingle;
  incX: longint; Y: Psingle; incY: longint; A: Psingle; lda: longint); cdecl; external libgslcblas;
procedure cblas_sspr2(order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; N: longint; alpha: single; X: Psingle;
  incX: longint; Y: Psingle; incY: longint; A: Psingle); cdecl; external libgslcblas;
procedure cblas_dsymv(order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; N: longint; alpha: double; A: Pdouble;
  lda: longint; X: Pdouble; incX: longint; beta: double; Y: Pdouble;
  incY: longint); cdecl; external libgslcblas;
procedure cblas_dsbmv(order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; N: longint; K: longint; alpha: double;
  A: Pdouble; lda: longint; X: Pdouble; incX: longint; beta: double;
  Y: Pdouble; incY: longint); cdecl; external libgslcblas;
procedure cblas_dspmv(order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; N: longint; alpha: double; Ap: Pdouble;
  X: Pdouble; incX: longint; beta: double; Y: Pdouble; incY: longint); cdecl; external libgslcblas;
procedure cblas_dger(order: TCBLAS_ORDER; M: longint; N: longint; alpha: double; X: Pdouble;
  incX: longint; Y: Pdouble; incY: longint; A: Pdouble; lda: longint); cdecl; external libgslcblas;
procedure cblas_dsyr(order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; N: longint; alpha: double; X: Pdouble;
  incX: longint; A: Pdouble; lda: longint); cdecl; external libgslcblas;
procedure cblas_dspr(order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; N: longint; alpha: double; X: Pdouble;
  incX: longint; Ap: Pdouble); cdecl; external libgslcblas;
procedure cblas_dsyr2(order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; N: longint; alpha: double; X: Pdouble;
  incX: longint; Y: Pdouble; incY: longint; A: Pdouble; lda: longint); cdecl; external libgslcblas;
procedure cblas_dspr2(order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; N: longint; alpha: double; X: Pdouble;
  incX: longint; Y: Pdouble; incY: longint; A: Pdouble); cdecl; external libgslcblas;

procedure cblas_chemv(order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; N: longint; alpha: pointer; A: pointer;
  lda: longint; X: pointer; incX: longint; beta: pointer; Y: pointer;
  incY: longint); cdecl; external libgslcblas;
procedure cblas_chbmv(order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; N: longint; K: longint; alpha: pointer;
  A: pointer; lda: longint; X: pointer; incX: longint; beta: pointer;
  Y: pointer; incY: longint); cdecl; external libgslcblas;
procedure cblas_chpmv(order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; N: longint; alpha: pointer; Ap: pointer;
  X: pointer; incX: longint; beta: pointer; Y: pointer; incY: longint); cdecl; external libgslcblas;
procedure cblas_cgeru(order: TCBLAS_ORDER; M: longint; N: longint; alpha: pointer; X: pointer;
  incX: longint; Y: pointer; incY: longint; A: pointer; lda: longint); cdecl; external libgslcblas;
procedure cblas_cgerc(order: TCBLAS_ORDER; M: longint; N: longint; alpha: pointer; X: pointer;
  incX: longint; Y: pointer; incY: longint; A: pointer; lda: longint); cdecl; external libgslcblas;
procedure cblas_cher(order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; N: longint; alpha: single; X: pointer;
  incX: longint; A: pointer; lda: longint); cdecl; external libgslcblas;
procedure cblas_chpr(order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; N: longint; alpha: single; X: pointer;
  incX: longint; A: pointer); cdecl; external libgslcblas;
procedure cblas_cher2(order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; N: longint; alpha: pointer; X: pointer;
  incX: longint; Y: pointer; incY: longint; A: pointer; lda: longint); cdecl; external libgslcblas;
procedure cblas_chpr2(order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; N: longint; alpha: pointer; X: pointer;
  incX: longint; Y: pointer; incY: longint; Ap: pointer); cdecl; external libgslcblas;
procedure cblas_zhemv(order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; N: longint; alpha: pointer; A: pointer;
  lda: longint; X: pointer; incX: longint; beta: pointer; Y: pointer;
  incY: longint); cdecl; external libgslcblas;
procedure cblas_zhbmv(order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; N: longint; K: longint; alpha: pointer;
  A: pointer; lda: longint; X: pointer; incX: longint; beta: pointer;
  Y: pointer; incY: longint); cdecl; external libgslcblas;
procedure cblas_zhpmv(order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; N: longint; alpha: pointer; Ap: pointer;
  X: pointer; incX: longint; beta: pointer; Y: pointer; incY: longint); cdecl; external libgslcblas;
procedure cblas_zgeru(order: TCBLAS_ORDER; M: longint; N: longint; alpha: pointer; X: pointer;
  incX: longint; Y: pointer; incY: longint; A: pointer; lda: longint); cdecl; external libgslcblas;
procedure cblas_zgerc(order: TCBLAS_ORDER; M: longint; N: longint; alpha: pointer; X: pointer;
  incX: longint; Y: pointer; incY: longint; A: pointer; lda: longint); cdecl; external libgslcblas;
procedure cblas_zher(order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; N: longint; alpha: double; X: pointer;
  incX: longint; A: pointer; lda: longint); cdecl; external libgslcblas;
procedure cblas_zhpr(order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; N: longint; alpha: double; X: pointer;
  incX: longint; A: pointer); cdecl; external libgslcblas;
procedure cblas_zher2(order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; N: longint; alpha: pointer; X: pointer;
  incX: longint; Y: pointer; incY: longint; A: pointer; lda: longint); cdecl; external libgslcblas;
procedure cblas_zhpr2(order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; N: longint; alpha: pointer; X: pointer;
  incX: longint; Y: pointer; incY: longint; Ap: pointer); cdecl; external libgslcblas;

procedure cblas_sgemm(Order: TCBLAS_ORDER; TransA: TCBLAS_TRANSPOSE; TransB: TCBLAS_TRANSPOSE; M: longint; N: longint;
  K: longint; alpha: single; A: Psingle; lda: longint; B: Psingle;
  ldb: longint; beta: single; C: Psingle; ldc: longint); cdecl; external libgslcblas;
procedure cblas_ssymm(Order: TCBLAS_ORDER; Side: TCBLAS_SIDE; Uplo: TCBLAS_UPLO; M: longint; N: longint;
  alpha: single; A: Psingle; lda: longint; B: Psingle; ldb: longint;
  beta: single; C: Psingle; ldc: longint); cdecl; external libgslcblas;
procedure cblas_ssyrk(Order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; Trans: TCBLAS_TRANSPOSE; N: longint; K: longint;
  alpha: single; A: Psingle; lda: longint; beta: single; C: Psingle;
  ldc: longint); cdecl; external libgslcblas;
procedure cblas_ssyr2k(Order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; Trans: TCBLAS_TRANSPOSE; N: longint; K: longint;
  alpha: single; A: Psingle; lda: longint; B: Psingle; ldb: longint;
  beta: single; C: Psingle; ldc: longint); cdecl; external libgslcblas;
procedure cblas_strmm(Order: TCBLAS_ORDER; Side: TCBLAS_SIDE; Uplo: TCBLAS_UPLO; TransA: TCBLAS_TRANSPOSE; Diag: TCBLAS_DIAG;
  M: longint; N: longint; alpha: single; A: Psingle; lda: longint;
  B: Psingle; ldb: longint); cdecl; external libgslcblas;
procedure cblas_strsm(Order: TCBLAS_ORDER; Side: TCBLAS_SIDE; Uplo: TCBLAS_UPLO; TransA: TCBLAS_TRANSPOSE; Diag: TCBLAS_DIAG;
  M: longint; N: longint; alpha: single; A: Psingle; lda: longint;
  B: Psingle; ldb: longint); cdecl; external libgslcblas;
procedure cblas_dgemm(Order: TCBLAS_ORDER; TransA: TCBLAS_TRANSPOSE; TransB: TCBLAS_TRANSPOSE; M: longint; N: longint;
  K: longint; alpha: double; A: Pdouble; lda: longint; B: Pdouble;
  ldb: longint; beta: double; C: Pdouble; ldc: longint); cdecl; external libgslcblas;
procedure cblas_dsymm(Order: TCBLAS_ORDER; Side: TCBLAS_SIDE; Uplo: TCBLAS_UPLO; M: longint; N: longint;
  alpha: double; A: Pdouble; lda: longint; B: Pdouble; ldb: longint;
  beta: double; C: Pdouble; ldc: longint); cdecl; external libgslcblas;
procedure cblas_dsyrk(Order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; Trans: TCBLAS_TRANSPOSE; N: longint; K: longint;
  alpha: double; A: Pdouble; lda: longint; beta: double; C: Pdouble;
  ldc: longint); cdecl; external libgslcblas;
procedure cblas_dsyr2k(Order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; Trans: TCBLAS_TRANSPOSE; N: longint; K: longint;
  alpha: double; A: Pdouble; lda: longint; B: Pdouble; ldb: longint;
  beta: double; C: Pdouble; ldc: longint); cdecl; external libgslcblas;
procedure cblas_dtrmm(Order: TCBLAS_ORDER; Side: TCBLAS_SIDE; Uplo: TCBLAS_UPLO; TransA: TCBLAS_TRANSPOSE; Diag: TCBLAS_DIAG;
  M: longint; N: longint; alpha: double; A: Pdouble; lda: longint;
  B: Pdouble; ldb: longint); cdecl; external libgslcblas;
procedure cblas_dtrsm(Order: TCBLAS_ORDER; Side: TCBLAS_SIDE; Uplo: TCBLAS_UPLO; TransA: TCBLAS_TRANSPOSE; Diag: TCBLAS_DIAG;
  M: longint; N: longint; alpha: double; A: Pdouble; lda: longint;
  B: Pdouble; ldb: longint); cdecl; external libgslcblas;
procedure cblas_cgemm(Order: TCBLAS_ORDER; TransA: TCBLAS_TRANSPOSE; TransB: TCBLAS_TRANSPOSE; M: longint; N: longint;
  K: longint; alpha: pointer; A: pointer; lda: longint; B: pointer;
  ldb: longint; beta: pointer; C: pointer; ldc: longint); cdecl; external libgslcblas;
procedure cblas_csymm(Order: TCBLAS_ORDER; Side: TCBLAS_SIDE; Uplo: TCBLAS_UPLO; M: longint; N: longint;
  alpha: pointer; A: pointer; lda: longint; B: pointer; ldb: longint;
  beta: pointer; C: pointer; ldc: longint); cdecl; external libgslcblas;
procedure cblas_csyrk(Order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; Trans: TCBLAS_TRANSPOSE; N: longint; K: longint;
  alpha: pointer; A: pointer; lda: longint; beta: pointer; C: pointer;
  ldc: longint); cdecl; external libgslcblas;
procedure cblas_csyr2k(Order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; Trans: TCBLAS_TRANSPOSE; N: longint; K: longint;
  alpha: pointer; A: pointer; lda: longint; B: pointer; ldb: longint;
  beta: pointer; C: pointer; ldc: longint); cdecl; external libgslcblas;
procedure cblas_ctrmm(Order: TCBLAS_ORDER; Side: TCBLAS_SIDE; Uplo: TCBLAS_UPLO; TransA: TCBLAS_TRANSPOSE; Diag: TCBLAS_DIAG;
  M: longint; N: longint; alpha: pointer; A: pointer; lda: longint;
  B: pointer; ldb: longint); cdecl; external libgslcblas;
procedure cblas_ctrsm(Order: TCBLAS_ORDER; Side: TCBLAS_SIDE; Uplo: TCBLAS_UPLO; TransA: TCBLAS_TRANSPOSE; Diag: TCBLAS_DIAG;
  M: longint; N: longint; alpha: pointer; A: pointer; lda: longint;
  B: pointer; ldb: longint); cdecl; external libgslcblas;
procedure cblas_zgemm(Order: TCBLAS_ORDER; TransA: TCBLAS_TRANSPOSE; TransB: TCBLAS_TRANSPOSE; M: longint; N: longint;
  K: longint; alpha: pointer; A: pointer; lda: longint; B: pointer;
  ldb: longint; beta: pointer; C: pointer; ldc: longint); cdecl; external libgslcblas;
procedure cblas_zsymm(Order: TCBLAS_ORDER; Side: TCBLAS_SIDE; Uplo: TCBLAS_UPLO; M: longint; N: longint;
  alpha: pointer; A: pointer; lda: longint; B: pointer; ldb: longint;
  beta: pointer; C: pointer; ldc: longint); cdecl; external libgslcblas;
procedure cblas_zsyrk(Order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; Trans: TCBLAS_TRANSPOSE; N: longint; K: longint;
  alpha: pointer; A: pointer; lda: longint; beta: pointer; C: pointer;
  ldc: longint); cdecl; external libgslcblas;
procedure cblas_zsyr2k(Order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; Trans: TCBLAS_TRANSPOSE; N: longint; K: longint;
  alpha: pointer; A: pointer; lda: longint; B: pointer; ldb: longint;
  beta: pointer; C: pointer; ldc: longint); cdecl; external libgslcblas;
procedure cblas_ztrmm(Order: TCBLAS_ORDER; Side: TCBLAS_SIDE; Uplo: TCBLAS_UPLO; TransA: TCBLAS_TRANSPOSE; Diag: TCBLAS_DIAG;
  M: longint; N: longint; alpha: pointer; A: pointer; lda: longint;
  B: pointer; ldb: longint); cdecl; external libgslcblas;
procedure cblas_ztrsm(Order: TCBLAS_ORDER; Side: TCBLAS_SIDE; Uplo: TCBLAS_UPLO; TransA: TCBLAS_TRANSPOSE; Diag: TCBLAS_DIAG;
  M: longint; N: longint; alpha: pointer; A: pointer; lda: longint;
  B: pointer; ldb: longint); cdecl; external libgslcblas;

procedure cblas_chemm(Order: TCBLAS_ORDER; Side: TCBLAS_SIDE; Uplo: TCBLAS_UPLO; M: longint; N: longint;
  alpha: pointer; A: pointer; lda: longint; B: pointer; ldb: longint;
  beta: pointer; C: pointer; ldc: longint); cdecl; external libgslcblas;
procedure cblas_cherk(Order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; Trans: TCBLAS_TRANSPOSE; N: longint; K: longint;
  alpha: single; A: pointer; lda: longint; beta: single; C: pointer;
  ldc: longint); cdecl; external libgslcblas;
procedure cblas_cher2k(Order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; Trans: TCBLAS_TRANSPOSE; N: longint; K: longint;
  alpha: pointer; A: pointer; lda: longint; B: pointer; ldb: longint;
  beta: single; C: pointer; ldc: longint); cdecl; external libgslcblas;
procedure cblas_zhemm(Order: TCBLAS_ORDER; Side: TCBLAS_SIDE; Uplo: TCBLAS_UPLO; M: longint; N: longint;
  alpha: pointer; A: pointer; lda: longint; B: pointer; ldb: longint;
  beta: pointer; C: pointer; ldc: longint); cdecl; external libgslcblas;
procedure cblas_zherk(Order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; Trans: TCBLAS_TRANSPOSE; N: longint; K: longint;
  alpha: double; A: pointer; lda: longint; beta: double; C: pointer;
  ldc: longint); cdecl; external libgslcblas;
procedure cblas_zher2k(Order: TCBLAS_ORDER; Uplo: TCBLAS_UPLO; Trans: TCBLAS_TRANSPOSE; N: longint; K: longint;
  alpha: pointer; A: pointer; lda: longint; B: pointer; ldb: longint;
  beta: double; C: pointer; ldc: longint); cdecl; external libgslcblas;
procedure cblas_xerbla(p: longint; rout: pchar; form: pchar; args: array of const); cdecl; external libgslcblas;
procedure cblas_xerbla(p: longint; rout: pchar; form: pchar); cdecl; external libgslcblas
;

// === Konventiert am: 18-8-25 16:11:32 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
