{$IFDEF read_interface}


const
  SUITESPARSE_OPENMP_MAX_THREADS = 1;
  SUITESPARSE_OPENMP_GET_NUM_THREADS = 1;
  SUITESPARSE_OPENMP_GET_WTIME = 0;
  SUITESPARSE_OPENMP_GET_THREAD_ID = 0;

const
  SUITESPARSE_COMPILER_NVCC = 0;
  SUITESPARSE_COMPILER_ICX = 0;
  SUITESPARSE_COMPILER_ICC = 0;
  SUITESPARSE_COMPILER_CLANG = 0;
  SUITESPARSE_COMPILER_GCC = 0;
  SUITESPARSE_COMPILER_MSC = 0;
  SUITESPARSE_COMPILER_XLC = 0;

const
  SUITESPARSE_STDC_VERSION = 199001;

type
  TMalloc_func = function(para1: Tsize_t): pointer;
  TCalloc_func = function(para1: Tsize_t; para2: Tsize_t): pointer;
  TRealloc_func = function(para1: Pointer; para2: Tsize_t): pointer;
  TFree_func = procedure(para1: pointer);
  TPrintf_func = function(para1: pchar): longint;
  THypot_func = function(para1: double; para2: double): double;
  TDivcomplex_func = function(para1: double; para2: double; para3: double; para4: double; para5: Pdouble; para6: Pdouble): longint;
  TReasCalloc_func = function(para1: Tsize_t; para2: Tsize_t): pointer;

function SuiteSparse_config_malloc_func_get: TMalloc_func; cdecl; external libsuitesparseconfig;
function SuiteSparse_config_calloc_func_get: TCalloc_func; cdecl; external libsuitesparseconfig;
function SuiteSparse_config_realloc_func_get: TRealloc_func; cdecl; external libsuitesparseconfig;
function SuiteSparse_config_free_func_get: TFree_func; cdecl; external libsuitesparseconfig;
function SuiteSparse_config_printf_func_get: TPrintf_func; cdecl; varargs; external libsuitesparseconfig;
function SuiteSparse_config_hypot_func_get: THypot_func; cdecl; external libsuitesparseconfig;
function SuiteSparse_config_divcomplex_func_get: TDivcomplex_func; cdecl; external libsuitesparseconfig;

procedure SuiteSparse_config_malloc_func_set(malloc_func: TMalloc_func); cdecl; external libsuitesparseconfig;
procedure SuiteSparse_config_calloc_func_set(calloc_func: TCalloc_func); cdecl; external libsuitesparseconfig;
procedure SuiteSparse_config_realloc_func_set(realloc_func: TRealloc_func); cdecl; external libsuitesparseconfig;
procedure SuiteSparse_config_free_func_set(free_func: TFree_func); cdecl; external libsuitesparseconfig;
procedure SuiteSparse_config_printf_func_set(printf_func: TPrintf_func); cdecl; varargs; external libsuitesparseconfig;
procedure SuiteSparse_config_hypot_func_set(hypot_func: THypot_func); cdecl; external libsuitesparseconfig;
procedure SuiteSparse_config_divcomplex_func_set(divcomplex_func: TDivcomplex_func); cdecl; external libsuitesparseconfig;

function SuiteSparse_config_malloc(s: Tsize_t): pointer; cdecl; external libsuitesparseconfig;
function SuiteSparse_config_calloc(n: Tsize_t; s: Tsize_t): pointer; cdecl; external libsuitesparseconfig;
function SuiteSparse_config_realloc(para1: pointer; s: Tsize_t): pointer; cdecl; external libsuitesparseconfig;
procedure SuiteSparse_config_free(para1: pointer); cdecl; external libsuitesparseconfig;
function SuiteSparse_config_hypot(x: double; y: double): double; cdecl; external libsuitesparseconfig;
function SuiteSparse_config_divcomplex(xr: double; xi: double; yr: double; yi: double; zr: Pdouble; zi: Pdouble): longint; cdecl; external libsuitesparseconfig;
procedure SuiteSparse_start; cdecl; external libsuitesparseconfig;
procedure SuiteSparse_finish; cdecl; external libsuitesparseconfig;
function SuiteSparse_malloc(nitems: Tsize_t; size_of_item: Tsize_t): pointer; cdecl; external libsuitesparseconfig;
function SuiteSparse_calloc(nitems: Tsize_t; size_of_item: Tsize_t): pointer; cdecl; external libsuitesparseconfig;
function SuiteSparse_realloc(nitems_new: Tsize_t; nitems_old: Tsize_t; size_of_item: Tsize_t; p: pointer; ok: Plongint): pointer; cdecl; external libsuitesparseconfig;
function SuiteSparse_free(p: pointer): pointer; cdecl; external libsuitesparseconfig;
procedure SuiteSparse_tic(tic: Pdouble); cdecl; external libsuitesparseconfig;
function SuiteSparse_toc(tic: Pdouble): double; cdecl; external libsuitesparseconfig;
function SuiteSparse_time: double; cdecl; external libsuitesparseconfig;
function SuiteSparse_hypot(x: double; y: double): double; cdecl; external libsuitesparseconfig;
function SuiteSparse_divcomplex(ar: double; ai: double; br: double; bi: double; cr: Pdouble; ci: Pdouble): longint; cdecl; external libsuitesparseconfig;
function SuiteSparse_version(version: Plongint): longint; cdecl; external libsuitesparseconfig;

const
  SUITESPARSE_DATE = 'Mar 2, 2024';
  SUITESPARSE_MAIN_VERSION = 7;
  SUITESPARSE_SUB_VERSION = 6;
  SUITESPARSE_SUBSUB_VERSION = 1;

type
  TSUITESPARSE_BLAS_INT = Tint32_t;
  PSUITESPARSE_BLAS_INT = ^TSUITESPARSE_BLAS_INT;

function SUITESPARSE_VER_CODE(main, sub: longint): longint;
function SUITESPARSE_VERSION: longint;
function SUITESPARSE__VERCODE(main, sub, patch: longint): longint;
function SUITESPARSE__VERSION: longint;

procedure SUITESPARSE_BLAS_DGEMV(trans: pchar; m: PSUITESPARSE_BLAS_INT; n: PSUITESPARSE_BLAS_INT; alpha: Pdouble; A: Pdouble;
  lda: PSUITESPARSE_BLAS_INT; X: Pdouble; incx: PSUITESPARSE_BLAS_INT; beta: Pdouble; Y: Pdouble;
  incy: PSUITESPARSE_BLAS_INT); cdecl; external libsuitesparseconfig;
procedure SUITESPARSE_BLAS_SGEMV(trans: pchar; m: PSUITESPARSE_BLAS_INT; n: PSUITESPARSE_BLAS_INT; alpha: Psingle; A: Psingle;
  lda: PSUITESPARSE_BLAS_INT; X: Psingle; incx: PSUITESPARSE_BLAS_INT; beta: Psingle; Y: Psingle;
  incy: PSUITESPARSE_BLAS_INT); cdecl; external libsuitesparseconfig;
procedure SUITESPARSE_BLAS_ZGEMV(trans: pchar; m: PSUITESPARSE_BLAS_INT; n: PSUITESPARSE_BLAS_INT; alpha: pointer; A: pointer;
  lda: PSUITESPARSE_BLAS_INT; X: pointer; incx: PSUITESPARSE_BLAS_INT; beta: pointer; Y: pointer;
  incy: PSUITESPARSE_BLAS_INT); cdecl; external libsuitesparseconfig;
procedure SUITESPARSE_BLAS_CGEMV(trans: pchar; m: PSUITESPARSE_BLAS_INT; n: PSUITESPARSE_BLAS_INT; alpha: pointer; A: pointer;
  lda: PSUITESPARSE_BLAS_INT; X: pointer; incx: PSUITESPARSE_BLAS_INT; beta: pointer; Y: pointer;
  incy: PSUITESPARSE_BLAS_INT); cdecl; external libsuitesparseconfig;

procedure SUITESPARSE_BLAS_DTRSV(uplo: pchar; trans: pchar; diag: pchar; n: PSUITESPARSE_BLAS_INT; A: Pdouble;
  lda: PSUITESPARSE_BLAS_INT; X: Pdouble; incx: PSUITESPARSE_BLAS_INT); cdecl; external libsuitesparseconfig;
procedure SUITESPARSE_BLAS_STRSV(uplo: pchar; trans: pchar; diag: pchar; n: PSUITESPARSE_BLAS_INT; A: Psingle;
  lda: PSUITESPARSE_BLAS_INT; X: Psingle; incx: PSUITESPARSE_BLAS_INT); cdecl; external libsuitesparseconfig;
procedure SUITESPARSE_BLAS_ZTRSV(uplo: pchar; trans: pchar; diag: pchar; n: PSUITESPARSE_BLAS_INT; A: pointer;
  lda: PSUITESPARSE_BLAS_INT; X: pointer; incx: PSUITESPARSE_BLAS_INT); cdecl; external libsuitesparseconfig;
procedure SUITESPARSE_BLAS_CTRSV(uplo: pchar; trans: pchar; diag: pchar; n: PSUITESPARSE_BLAS_INT; A: pointer;
  lda: PSUITESPARSE_BLAS_INT; X: pointer; incx: PSUITESPARSE_BLAS_INT); cdecl; external libsuitesparseconfig;

procedure SUITESPARSE_BLAS_DTRSM(side: pchar; uplo: pchar; transa: pchar; diag: pchar; m: PSUITESPARSE_BLAS_INT;
  n: PSUITESPARSE_BLAS_INT; alpha: Pdouble; A: Pdouble; lda: PSUITESPARSE_BLAS_INT; B: Pdouble;
  ldb: PSUITESPARSE_BLAS_INT); cdecl; external libsuitesparseconfig;
procedure SUITESPARSE_BLAS_STRSM(side: pchar; uplo: pchar; transa: pchar; diag: pchar; m: PSUITESPARSE_BLAS_INT;
  n: PSUITESPARSE_BLAS_INT; alpha: Psingle; A: Psingle; lda: PSUITESPARSE_BLAS_INT; B: Psingle;
  ldb: PSUITESPARSE_BLAS_INT); cdecl; external libsuitesparseconfig;
procedure SUITESPARSE_BLAS_ZTRSM(side: pchar; uplo: pchar; transa: pchar; diag: pchar; m: PSUITESPARSE_BLAS_INT;
  n: PSUITESPARSE_BLAS_INT; alpha: pointer; A: pointer; lda: PSUITESPARSE_BLAS_INT; B: pointer;
  ldb: PSUITESPARSE_BLAS_INT); cdecl; external libsuitesparseconfig;
procedure SUITESPARSE_BLAS_CTRSM(side: pchar; uplo: pchar; transa: pchar; diag: pchar; m: PSUITESPARSE_BLAS_INT;
  n: PSUITESPARSE_BLAS_INT; alpha: pointer; A: pointer; lda: PSUITESPARSE_BLAS_INT; B: pointer;
  ldb: PSUITESPARSE_BLAS_INT); cdecl; external libsuitesparseconfig;

procedure SUITESPARSE_BLAS_DGEMM(transa: pchar; transb: pchar; m: PSUITESPARSE_BLAS_INT; n: PSUITESPARSE_BLAS_INT; k: PSUITESPARSE_BLAS_INT;
  alpha: Pdouble; A: Pdouble; lda: PSUITESPARSE_BLAS_INT; B: Pdouble; ldb: PSUITESPARSE_BLAS_INT;
  beta: Pdouble; C: Pdouble; ldc: PSUITESPARSE_BLAS_INT); cdecl; external libsuitesparseconfig;
procedure SUITESPARSE_BLAS_SGEMM(transa: pchar; transb: pchar; m: PSUITESPARSE_BLAS_INT; n: PSUITESPARSE_BLAS_INT; k: PSUITESPARSE_BLAS_INT;
  alpha: Psingle; A: Psingle; lda: PSUITESPARSE_BLAS_INT; B: Psingle; ldb: PSUITESPARSE_BLAS_INT;
  beta: Psingle; C: Psingle; ldc: PSUITESPARSE_BLAS_INT); cdecl; external libsuitesparseconfig;
procedure SUITESPARSE_BLAS_ZGEMM(transa: pchar; transb: pchar; m: PSUITESPARSE_BLAS_INT; n: PSUITESPARSE_BLAS_INT; k: PSUITESPARSE_BLAS_INT;
  alpha: pointer; A: pointer; lda: PSUITESPARSE_BLAS_INT; B: pointer; ldb: PSUITESPARSE_BLAS_INT;
  beta: pointer; C: pointer; ldc: PSUITESPARSE_BLAS_INT); cdecl; external libsuitesparseconfig;
procedure SUITESPARSE_BLAS_CGEMM(transa: pchar; transb: pchar; m: PSUITESPARSE_BLAS_INT; n: PSUITESPARSE_BLAS_INT; k: PSUITESPARSE_BLAS_INT;
  alpha: pointer; A: pointer; lda: PSUITESPARSE_BLAS_INT; B: pointer; ldb: PSUITESPARSE_BLAS_INT;
  beta: pointer; C: pointer; ldc: PSUITESPARSE_BLAS_INT); cdecl; external libsuitesparseconfig;

procedure SUITESPARSE_BLAS_DSYRK(uplo: pchar; trans: pchar; n: PSUITESPARSE_BLAS_INT; k: PSUITESPARSE_BLAS_INT; alpha: Pdouble;
  A: Pdouble; lda: PSUITESPARSE_BLAS_INT; beta: Pdouble; C: Pdouble; ldc: PSUITESPARSE_BLAS_INT); cdecl; external libsuitesparseconfig;
procedure SUITESPARSE_BLAS_SSYRK(uplo: pchar; trans: pchar; n: PSUITESPARSE_BLAS_INT; k: PSUITESPARSE_BLAS_INT; alpha: Psingle;
  A: Psingle; lda: PSUITESPARSE_BLAS_INT; beta: Psingle; C: Psingle; ldc: PSUITESPARSE_BLAS_INT); cdecl; external libsuitesparseconfig;
procedure SUITESPARSE_BLAS_ZHERK(uplo: pchar; trans: pchar; n: PSUITESPARSE_BLAS_INT; k: PSUITESPARSE_BLAS_INT; alpha: pointer;
  A: pointer; lda: PSUITESPARSE_BLAS_INT; beta: pointer; C: pointer; ldc: PSUITESPARSE_BLAS_INT); cdecl; external libsuitesparseconfig;
procedure SUITESPARSE_BLAS_CHERK(uplo: pchar; trans: pchar; n: PSUITESPARSE_BLAS_INT; k: PSUITESPARSE_BLAS_INT; alpha: pointer;
  A: pointer; lda: PSUITESPARSE_BLAS_INT; beta: pointer; C: pointer; ldc: PSUITESPARSE_BLAS_INT); cdecl; external libsuitesparseconfig;

procedure SUITESPARSE_LAPACK_DPOTRF(uplo: pchar; n: PSUITESPARSE_BLAS_INT; A: Pdouble; lda: PSUITESPARSE_BLAS_INT; info: PSUITESPARSE_BLAS_INT); cdecl; external libsuitesparseconfig;
procedure SUITESPARSE_LAPACK_SPOTRF(uplo: pchar; n: PSUITESPARSE_BLAS_INT; A: Psingle; lda: PSUITESPARSE_BLAS_INT; info: PSUITESPARSE_BLAS_INT); cdecl; external libsuitesparseconfig;
procedure SUITESPARSE_LAPACK_ZPOTRF(uplo: pchar; n: PSUITESPARSE_BLAS_INT; A: pointer; lda: PSUITESPARSE_BLAS_INT; info: PSUITESPARSE_BLAS_INT); cdecl; external libsuitesparseconfig;
procedure SUITESPARSE_LAPACK_CPOTRF(uplo: pchar; n: PSUITESPARSE_BLAS_INT; A: pointer; lda: PSUITESPARSE_BLAS_INT; info: PSUITESPARSE_BLAS_INT); cdecl; external libsuitesparseconfig;

procedure SUITESPARSE_BLAS_DSCAL(n: PSUITESPARSE_BLAS_INT; alpha: Pdouble; Y: Pdouble; incy: PSUITESPARSE_BLAS_INT); cdecl; external libsuitesparseconfig;
procedure SUITESPARSE_BLAS_SSCAL(n: PSUITESPARSE_BLAS_INT; alpha: Psingle; Y: Psingle; incy: PSUITESPARSE_BLAS_INT); cdecl; external libsuitesparseconfig;
procedure SUITESPARSE_BLAS_ZSCAL(n: PSUITESPARSE_BLAS_INT; alpha: pointer; Y: pointer; incy: PSUITESPARSE_BLAS_INT); cdecl; external libsuitesparseconfig;
procedure SUITESPARSE_BLAS_CSCAL(n: PSUITESPARSE_BLAS_INT; alpha: pointer; Y: pointer; incy: PSUITESPARSE_BLAS_INT); cdecl; external libsuitesparseconfig;

procedure SUITESPARSE_BLAS_DGER(m: PSUITESPARSE_BLAS_INT; n: PSUITESPARSE_BLAS_INT; alpha: Pdouble; X: Pdouble; incx: PSUITESPARSE_BLAS_INT;
  Y: Pdouble; incy: PSUITESPARSE_BLAS_INT; A: Pdouble; lda: PSUITESPARSE_BLAS_INT); cdecl; external libsuitesparseconfig;
procedure SUITESPARSE_BLAS_SGER(m: PSUITESPARSE_BLAS_INT; n: PSUITESPARSE_BLAS_INT; alpha: Psingle; X: Psingle; incx: PSUITESPARSE_BLAS_INT;
  Y: Psingle; incy: PSUITESPARSE_BLAS_INT; A: Psingle; lda: PSUITESPARSE_BLAS_INT); cdecl; external libsuitesparseconfig;
procedure SUITESPARSE_BLAS_ZGERU(m: PSUITESPARSE_BLAS_INT; n: PSUITESPARSE_BLAS_INT; alpha: pointer; X: pointer; incx: PSUITESPARSE_BLAS_INT;
  Y: pointer; incy: PSUITESPARSE_BLAS_INT; A: pointer; lda: PSUITESPARSE_BLAS_INT); cdecl; external libsuitesparseconfig;
procedure SUITESPARSE_BLAS_CGERU(m: PSUITESPARSE_BLAS_INT; n: PSUITESPARSE_BLAS_INT; alpha: pointer; X: pointer; incx: PSUITESPARSE_BLAS_INT;
  Y: pointer; incy: PSUITESPARSE_BLAS_INT; A: pointer; lda: PSUITESPARSE_BLAS_INT); cdecl; external libsuitesparseconfig;

procedure SUITESPARSE_LAPACK_DLARFT(direct: pchar; storev: pchar; n: PSUITESPARSE_BLAS_INT; k: PSUITESPARSE_BLAS_INT; V: Pdouble;
  ldv: PSUITESPARSE_BLAS_INT; Tau: Pdouble; T: Pdouble; ldt: PSUITESPARSE_BLAS_INT); cdecl; external libsuitesparseconfig;
procedure SUITESPARSE_LAPACK_SLARFT(direct: pchar; storev: pchar; n: PSUITESPARSE_BLAS_INT; k: PSUITESPARSE_BLAS_INT; V: Psingle;
  ldv: PSUITESPARSE_BLAS_INT; Tau: Psingle; T: Psingle; ldt: PSUITESPARSE_BLAS_INT); cdecl; external libsuitesparseconfig;
procedure SUITESPARSE_LAPACK_ZLARFT(direct: pchar; storev: pchar; n: PSUITESPARSE_BLAS_INT; k: PSUITESPARSE_BLAS_INT; V: pointer;
  ldv: PSUITESPARSE_BLAS_INT; Tau: pointer; T: pointer; ldt: PSUITESPARSE_BLAS_INT); cdecl; external libsuitesparseconfig;
procedure SUITESPARSE_LAPACK_CLARFT(direct: pchar; storev: pchar; n: PSUITESPARSE_BLAS_INT; k: PSUITESPARSE_BLAS_INT; V: pointer;
  ldv: PSUITESPARSE_BLAS_INT; Tau: pointer; T: pointer; ldt: PSUITESPARSE_BLAS_INT); cdecl; external libsuitesparseconfig;

procedure SUITESPARSE_LAPACK_DLARFB(side: pchar; trans: pchar; direct: pchar; storev: pchar; m: PSUITESPARSE_BLAS_INT;
  n: PSUITESPARSE_BLAS_INT; k: PSUITESPARSE_BLAS_INT; V: Pdouble; ldv: PSUITESPARSE_BLAS_INT; T: Pdouble;
  ldt: PSUITESPARSE_BLAS_INT; C: Pdouble; ldc: PSUITESPARSE_BLAS_INT; Work: Pdouble; ldwork: PSUITESPARSE_BLAS_INT); cdecl; external libsuitesparseconfig;
procedure SUITESPARSE_LAPACK_SLARFB(side: pchar; trans: pchar; direct: pchar; storev: pchar; m: PSUITESPARSE_BLAS_INT;
  n: PSUITESPARSE_BLAS_INT; k: PSUITESPARSE_BLAS_INT; V: Psingle; ldv: PSUITESPARSE_BLAS_INT; T: Psingle;
  ldt: PSUITESPARSE_BLAS_INT; C: Psingle; ldc: PSUITESPARSE_BLAS_INT; Work: Psingle; ldwork: PSUITESPARSE_BLAS_INT); cdecl; external libsuitesparseconfig;
procedure SUITESPARSE_LAPACK_ZLARFB(side: pchar; trans: pchar; direct: pchar; storev: pchar; m: PSUITESPARSE_BLAS_INT;
  n: PSUITESPARSE_BLAS_INT; k: PSUITESPARSE_BLAS_INT; V: pointer; ldv: PSUITESPARSE_BLAS_INT; T: pointer;
  ldt: PSUITESPARSE_BLAS_INT; C: pointer; ldc: PSUITESPARSE_BLAS_INT; Work: pointer; ldwork: PSUITESPARSE_BLAS_INT); cdecl; external libsuitesparseconfig;
procedure SUITESPARSE_LAPACK_CLARFB(side: pchar; trans: pchar; direct: pchar; storev: pchar; m: PSUITESPARSE_BLAS_INT;
  n: PSUITESPARSE_BLAS_INT; k: PSUITESPARSE_BLAS_INT; V: pointer; ldv: PSUITESPARSE_BLAS_INT; T: pointer;
  ldt: PSUITESPARSE_BLAS_INT; C: pointer; ldc: PSUITESPARSE_BLAS_INT; Work: pointer; ldwork: PSUITESPARSE_BLAS_INT); cdecl; external libsuitesparseconfig;

function SUITESPARSE_BLAS_DNRM2(n: PSUITESPARSE_BLAS_INT; X: Pdouble; incx: PSUITESPARSE_BLAS_INT): double; cdecl; external libsuitesparseconfig;
function SUITESPARSE_BLAS_SNRM2(n: PSUITESPARSE_BLAS_INT; X: Psingle; incx: PSUITESPARSE_BLAS_INT): single; cdecl; external libsuitesparseconfig;
function SUITESPARSE_BLAS_DZNRM2(n: PSUITESPARSE_BLAS_INT; X: pointer; incx: PSUITESPARSE_BLAS_INT): double; cdecl; external libsuitesparseconfig;
function SUITESPARSE_BLAS_SCNRM2(n: PSUITESPARSE_BLAS_INT; X: pointer; incx: PSUITESPARSE_BLAS_INT): single; cdecl; external libsuitesparseconfig;

procedure SUITESPARSE_LAPACK_DLARFG(n: PSUITESPARSE_BLAS_INT; alpha: Pdouble; X: Pdouble; incx: PSUITESPARSE_BLAS_INT; tau: Pdouble); cdecl; external libsuitesparseconfig;
procedure SUITESPARSE_LAPACK_SLARFG(n: PSUITESPARSE_BLAS_INT; alpha: Psingle; X: Psingle; incx: PSUITESPARSE_BLAS_INT; tau: Psingle); cdecl; external libsuitesparseconfig;
procedure SUITESPARSE_LAPACK_ZLARFG(n: PSUITESPARSE_BLAS_INT; alpha: pointer; X: pointer; incx: PSUITESPARSE_BLAS_INT; tau: pointer); cdecl; external libsuitesparseconfig;
procedure SUITESPARSE_LAPACK_CLARFG(n: PSUITESPARSE_BLAS_INT; alpha: pointer; X: pointer; incx: PSUITESPARSE_BLAS_INT; tau: pointer); cdecl; external libsuitesparseconfig;

procedure SUITESPARSE_LAPACK_DLARF(side: pchar; m: PSUITESPARSE_BLAS_INT; n: PSUITESPARSE_BLAS_INT; V: Pdouble; incv: PSUITESPARSE_BLAS_INT;
  tau: Pdouble; C: Pdouble; ldc: PSUITESPARSE_BLAS_INT; Work: Pdouble); cdecl; external libsuitesparseconfig;
procedure SUITESPARSE_LAPACK_SLARF(side: pchar; m: PSUITESPARSE_BLAS_INT; n: PSUITESPARSE_BLAS_INT; V: Psingle; incv: PSUITESPARSE_BLAS_INT;
  tau: Psingle; C: Psingle; ldc: PSUITESPARSE_BLAS_INT; Work: Psingle); cdecl; external libsuitesparseconfig;
procedure SUITESPARSE_LAPACK_ZLARF(side: pchar; m: PSUITESPARSE_BLAS_INT; n: PSUITESPARSE_BLAS_INT; V: pointer; incv: PSUITESPARSE_BLAS_INT;
  tau: pointer; C: pointer; ldc: PSUITESPARSE_BLAS_INT; Work: pointer); cdecl; external libsuitesparseconfig;
procedure SUITESPARSE_LAPACK_CLARF(side: pchar; m: PSUITESPARSE_BLAS_INT; n: PSUITESPARSE_BLAS_INT; V: pointer; incv: PSUITESPARSE_BLAS_INT;
  tau: pointer; C: pointer; ldc: PSUITESPARSE_BLAS_INT; Work: pointer); cdecl; external libsuitesparseconfig;

function SuiteSparse_BLAS_library: pchar; cdecl; external libsuitesparseconfig;
function SuiteSparse_BLAS_integer_size: Tsize_t; cdecl; external libsuitesparseconfig;

// === Konventiert am: 4-11-25 19:29:28 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function SUITESPARSE_VER_CODE(main, sub: longint): longint;
begin
  SUITESPARSE_VER_CODE := (main * 1000) + sub;
end;

function SUITESPARSE_VERSION: longint;
begin
  SUITESPARSE_VERSION := SUITESPARSE_VER_CODE(7, 6);
end;

function SUITESPARSE__VERCODE(main, sub, patch: longint): longint;
begin
  SUITESPARSE__VERCODE := (((main * 1000) + sub) * 1000) + patch;
end;

function SUITESPARSE__VERSION: longint;
begin
  SUITESPARSE__VERSION := SUITESPARSE__VERCODE(7, 6, 1);
end;

{$ENDIF read_implementation}
