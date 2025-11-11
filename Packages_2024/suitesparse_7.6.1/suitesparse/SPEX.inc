{$IFDEF read_interface}


const
  SPEX_DATE = 'Jan 20, 2024';
  SPEX_VERSION_ = '2.3.2';
  SPEX_VERSION_MAJOR = 2;
  SPEX_VERSION_MINOR = 3;
  SPEX_VERSION_SUB = 2;

procedure SPEX_version(version: Plongint); cdecl; external libspex;

type
  PSPEX_info = ^TSPEX_info;
  TSPEX_info = longint;

const
  SPEX_OK = 0;
  SPEX_OUT_OF_MEMORY = -(1);
  SPEX_SINGULAR = -(2);
  SPEX_INCORRECT_INPUT = -(3);
  SPEX_INCORRECT = -(4);
  SPEX_UNSYMMETRIC = -(5);
  SPEX_PANIC = -(6);

type
  PSPEX_pivot = ^TSPEX_pivot;
  TSPEX_pivot = longint;

const
  SPEX_SMALLEST = 0;
  SPEX_DIAGONAL = 1;
  SPEX_FIRST_NONZERO = 2;
  SPEX_TOL_SMALLEST = 3;
  SPEX_TOL_LARGEST = 4;
  SPEX_LARGEST = 5;

type
  PSPEX_col_order = ^TSPEX_col_order;
  TSPEX_col_order = longint;

const
  SPEX_NO_ORDERING = 0;
  SPEX_COLAMD = 1;
  SPEX_AMD = 2;

type
  TSPEX_options = record
    pivot: TSPEX_pivot;
    order: TSPEX_col_order;
    tol: double;
    print_level: longint;
    prec: Tint32_t;
    round: Tmpfr_rnd_t;
    check: boolean;
  end;
  PSPEX_options = ^TSPEX_options;
  PPSPEX_options = ^PSPEX_options;

function SPEX_create_default_options(option: PPSPEX_options): TSPEX_info; cdecl; external libspex;

type
  PSPEX_kind = ^TSPEX_kind;
  TSPEX_kind = longint;

const
  SPEX_CSC = 0;
  SPEX_TRIPLET = 1;
  SPEX_DENSE = 2;

type
  PSPEX_type = ^TSPEX_type;
  TSPEX_type = longint;

const
  SPEX_MPZ = 0;
  SPEX_MPQ = 1;
  SPEX_MPFR = 2;
  SPEX_INT64 = 3;
  SPEX_FP64 = 4;

type
  TSPEX_matrix = record
    m: Tint64_t;
    n: Tint64_t;
    nzmax: Tint64_t;
    nz: Tint64_t;
    kind: TSPEX_kind;
    _type: TSPEX_type;
    p: Pint64_t;
    p_shallow: boolean;
    i: Pint64_t;
    i_shallow: boolean;
    j: Pint64_t;
    j_shallow: boolean;
    x: record
      case longint of
        0: (mpz: Pmpz_t);
        1: (mpq: Pmpq_t);
        2: (mpfr: Pmpfr_t);
        3: (in64: Pint64_t);
        4: (fp64: Pdouble);
      end;
    x_shallow: boolean;
    scale: Tmpq_t;
  end;
  PSPEX_matrix = ^TSPEX_matrix;
  PPSPEX_matrix = ^PSPEX_matrix;

function SPEX_matrix_allocate(A_handle: PPSPEX_matrix; kind: TSPEX_kind; _type: TSPEX_type; m: Tint64_t; n: Tint64_t;
  nzmax: Tint64_t; shallow: boolean; init: boolean; option: PSPEX_options): TSPEX_info; cdecl; external libspex;
function SPEX_matrix_free(A_handle: PPSPEX_matrix; option: PSPEX_options): TSPEX_info; cdecl; external libspex;
function SPEX_matrix_nnz(nnz: Pint64_t; A: PSPEX_matrix; option: PSPEX_options): TSPEX_info; cdecl; external libspex;
function SPEX_matrix_copy(C_handle: PPSPEX_matrix; C_kind: TSPEX_kind; C_type: TSPEX_type; A: PSPEX_matrix; option: PSPEX_options): TSPEX_info; cdecl; external libspex;

type
  TSPEX_LU_analysis = record
    q: Pint64_t;
    lnz: Tint64_t;
    unz: Tint64_t;
  end;
  PSPEX_LU_analysis = ^TSPEX_LU_analysis;
  PPSPEX_LU_analysis = ^PSPEX_LU_analysis;

function SPEX_LU_analysis_free(S: PPSPEX_LU_analysis; option: PSPEX_options): TSPEX_info; cdecl; external libspex;
function SPEX_LU_analyze(S: PPSPEX_LU_analysis; A: PSPEX_matrix; option: PSPEX_options): TSPEX_info; cdecl; external libspex;
function SPEX_calloc(nitems: Tsize_t; size: Tsize_t): pointer; cdecl; external libspex;
function SPEX_malloc(size: Tsize_t): pointer; cdecl; external libspex;
procedure SPEX_free(p: pointer); cdecl; external libspex;
function SPEX_realloc(nitems_new: Tint64_t; nitems_old: Tint64_t; size_of_item: Tsize_t; p: pointer; ok: PBoolean): pointer; cdecl; external libspex;

function SPEX_initialize: TSPEX_info; cdecl; external libspex;

type
  TSPEX_initialize_func1 = function(para1: Tsize_t): pointer;
  TSPEX_initialize_func2 = function(para1: Tsize_t; para2: Tsize_t): pointer;
  TSPEX_initialize_func3 = procedure(para1: pointer);

function SPEX_initialize_expert(MyMalloc: TSPEX_initialize_func1; MyCalloc: TSPEX_initialize_func2; MyRealloc: TSPEX_initialize_func2; MyFree: TSPEX_initialize_func3): TSPEX_info; cdecl; external libspex;
function SPEX_finalize: TSPEX_info; cdecl; external libspex;
function SPEX_matrix_check(A: PSPEX_matrix; option: PSPEX_options): TSPEX_info; cdecl; external libspex;
function SPEX_matrix_div(x2_handle: PPSPEX_matrix; x: PSPEX_matrix; scalar: Tmpz_t; option: PSPEX_options): TSPEX_info; cdecl; external libspex;
function SPEX_matrix_mul(x: PSPEX_matrix; scalar: Tmpz_t): TSPEX_info; cdecl; external libspex;
function SPEX_check_solution(A: PSPEX_matrix; x: PSPEX_matrix; b: PSPEX_matrix; option: PSPEX_options): TSPEX_info; cdecl; external libspex;
function SPEX_cumsum(p: Pint64_t; c: Pint64_t; n: Tint64_t): TSPEX_info; cdecl; external libspex;

function SPEX_mpfr_asprintf(str: PPchar; format: pchar; args: array of const): TSPEX_info; cdecl; external libspex;
function SPEX_mpfr_asprintf(str: PPchar; format: pchar): TSPEX_info; cdecl; external libspex;
function SPEX_gmp_fscanf(fp: PFILE; format: pchar; args: array of const): TSPEX_info; cdecl; external libspex;
function SPEX_gmp_fscanf(fp: PFILE; format: pchar): TSPEX_info; cdecl; external libspex;
function SPEX_mpz_init(x: Tmpz_t): TSPEX_info; cdecl; external libspex;
function SPEX_mpz_init2(x: Tmpz_t; size: Tsize_t): TSPEX_info; cdecl; external libspex;
function SPEX_mpz_set(x: Tmpz_t; y: Tmpz_t): TSPEX_info; cdecl; external libspex;
function SPEX_mpz_set_ui(x: Tmpz_t; y: Tuint64_t): TSPEX_info; cdecl; external libspex;
function SPEX_mpz_set_si(x: Tmpz_t; y: Tint64_t): TSPEX_info; cdecl; external libspex;
function SPEX_mpz_get_d(x: Pdouble; y: Tmpz_t): TSPEX_info; cdecl; external libspex;
function SPEX_mpz_get_si(x: Pint64_t; y: Tmpz_t): TSPEX_info; cdecl; external libspex;
function SPEX_mpz_set_q(x: Tmpz_t; y: Tmpq_t): TSPEX_info; cdecl; external libspex;
function SPEX_mpz_mul(a: Tmpz_t; b: Tmpz_t; c: Tmpz_t): TSPEX_info; cdecl; external libspex;

function SPEX_mpz_submul(x: Tmpz_t; y: Tmpz_t; z: Tmpz_t): TSPEX_info; cdecl; external libspex;
function SPEX_mpz_divexact(x: Tmpz_t; y: Tmpz_t; z: Tmpz_t): TSPEX_info; cdecl; external libspex;
function SPEX_mpz_gcd(x: Tmpz_t; y: Tmpz_t; z: Tmpz_t): TSPEX_info; cdecl; external libspex;
function SPEX_mpz_lcm(lcm: Tmpz_t; x: Tmpz_t; y: Tmpz_t): TSPEX_info; cdecl; external libspex;
function SPEX_mpz_abs(x: Tmpz_t; y: Tmpz_t): TSPEX_info; cdecl; external libspex;
function SPEX_mpz_cmp(r: Plongint; x: Tmpz_t; y: Tmpz_t): TSPEX_info; cdecl; external libspex;
function SPEX_mpz_cmpabs(r: Plongint; x: Tmpz_t; y: Tmpz_t): TSPEX_info; cdecl; external libspex;
function SPEX_mpz_cmp_ui(r: Plongint; x: Tmpz_t; y: Tuint64_t): TSPEX_info; cdecl; external libspex;
function SPEX_mpz_sgn(sgn: Plongint; x: Tmpz_t): TSPEX_info; cdecl; external libspex;
function SPEX_mpz_sizeinbase(size: Psize_t; x: Tmpz_t; base: Tint64_t): TSPEX_info; cdecl; external libspex;
function SPEX_mpq_init(x: Tmpq_t): TSPEX_info; cdecl; external libspex;
function SPEX_mpq_set(x: Tmpq_t; y: Tmpq_t): TSPEX_info; cdecl; external libspex;
function SPEX_mpq_set_z(x: Tmpq_t; y: Tmpz_t): TSPEX_info; cdecl; external libspex;
function SPEX_mpq_set_d(x: Tmpq_t; y: double): TSPEX_info; cdecl; external libspex;
function SPEX_mpq_set_ui(x: Tmpq_t; y: Tuint64_t; z: Tuint64_t): TSPEX_info; cdecl; external libspex;
function SPEX_mpq_set_si(x: Tmpq_t; y: Tint64_t; z: Tuint64_t): TSPEX_info; cdecl; external libspex;
function SPEX_mpq_set_num(x: Tmpq_t; y: Tmpz_t): TSPEX_info; cdecl; external libspex;
function SPEX_mpq_set_den(x: Tmpq_t; y: Tmpz_t): TSPEX_info; cdecl; external libspex;
function SPEX_mpq_get_den(x: Tmpz_t; y: Tmpq_t): TSPEX_info; cdecl; external libspex;
function SPEX_mpq_get_d(x: Pdouble; y: Tmpq_t): TSPEX_info; cdecl; external libspex;
function SPEX_mpq_abs(x: Tmpq_t; y: Tmpq_t): TSPEX_info; cdecl; external libspex;
function SPEX_mpq_add(x: Tmpq_t; y: Tmpq_t; z: Tmpq_t): TSPEX_info; cdecl; external libspex;
function SPEX_mpq_mul(x: Tmpq_t; y: Tmpq_t; z: Tmpq_t): TSPEX_info; cdecl; external libspex;
function SPEX_mpq_div(x: Tmpq_t; y: Tmpq_t; z: Tmpq_t): TSPEX_info; cdecl; external libspex;
function SPEX_mpq_cmp(r: Plongint; x: Tmpq_t; y: Tmpq_t): TSPEX_info; cdecl; external libspex;
function SPEX_mpq_cmp_ui(r: Plongint; x: Tmpq_t; num: Tuint64_t; den: Tuint64_t): TSPEX_info; cdecl; external libspex;
function SPEX_mpq_sgn(sgn: Plongint; x: Tmpq_t): TSPEX_info; cdecl; external libspex;
function SPEX_mpq_equal(r: Plongint; x: Tmpq_t; y: Tmpq_t): TSPEX_info; cdecl; external libspex;
function SPEX_mpfr_init2(x: Tmpfr_t; size: Tuint64_t): TSPEX_info; cdecl; external libspex;
function SPEX_mpfr_set(x: Tmpfr_t; y: Tmpfr_t; rnd: Tmpfr_rnd_t): TSPEX_info; cdecl; external libspex;
function SPEX_mpfr_set_d(x: Tmpfr_t; y: double; rnd: Tmpfr_rnd_t): TSPEX_info; cdecl; external libspex;
function SPEX_mpfr_set_si(x: Tmpfr_t; y: Tint64_t; rnd: Tmpfr_rnd_t): TSPEX_info; cdecl; external libspex;
function SPEX_mpfr_set_q(x: Tmpfr_t; y: Tmpq_t; rnd: Tmpfr_rnd_t): TSPEX_info; cdecl; external libspex;
function SPEX_mpfr_set_z(x: Tmpfr_t; y: Tmpz_t; rnd: Tmpfr_rnd_t): TSPEX_info; cdecl; external libspex;
function SPEX_mpfr_get_z(x: Tmpz_t; y: Tmpfr_t; rnd: Tmpfr_rnd_t): TSPEX_info; cdecl; external libspex;
function SPEX_mpfr_get_q(x: Tmpq_t; y: Tmpfr_t; rnd: Tmpfr_rnd_t): TSPEX_info; cdecl; external libspex;
function SPEX_mpfr_get_d(x: Pdouble; y: Tmpfr_t; rnd: Tmpfr_rnd_t): TSPEX_info; cdecl; external libspex;
function SPEX_mpfr_get_si(x: Pint64_t; y: Tmpfr_t; rnd: Tmpfr_rnd_t): TSPEX_info; cdecl; external libspex;
function SPEX_mpfr_mul(x: Tmpfr_t; y: Tmpfr_t; z: Tmpfr_t; rnd: Tmpfr_rnd_t): TSPEX_info; cdecl; external libspex;
function SPEX_mpfr_mul_d(x: Tmpfr_t; y: Tmpfr_t; z: double; rnd: Tmpfr_rnd_t): TSPEX_info; cdecl; external libspex;
function SPEX_mpfr_div_d(x: Tmpfr_t; y: Tmpfr_t; z: double; rnd: Tmpfr_rnd_t): TSPEX_info; cdecl; external libspex;
function SPEX_mpfr_ui_pow_ui(x: Tmpfr_t; y: Tuint64_t; z: Tuint64_t; rnd: Tmpfr_rnd_t): TSPEX_info; cdecl; external libspex;
function SPEX_mpfr_sgn(sgn: Plongint; x: Tmpfr_t): TSPEX_info; cdecl; external libspex;
function SPEX_mpfr_free_cache: TSPEX_info; cdecl; external libspex;
function SPEX_mpfr_free_str(str: pchar): TSPEX_info; cdecl; external libspex;

function SPEX_Left_LU_backslash(X_handle: PPSPEX_matrix; _type: TSPEX_type; A: PSPEX_matrix; b: PSPEX_matrix; option: PSPEX_options): TSPEX_info; cdecl; external libspex;
function SPEX_Left_LU_factorize(L_handle: PPSPEX_matrix; U_handle: PPSPEX_matrix; rhos_handle: PPSPEX_matrix; pinv_handle: PPint64_t; A: PSPEX_matrix;
  S: PSPEX_LU_analysis; option: PSPEX_options): TSPEX_info; cdecl; external libspex;
function SPEX_Left_LU_solve(X_handle: PPSPEX_matrix; b: PSPEX_matrix; A: PSPEX_matrix; L: PSPEX_matrix; U: PSPEX_matrix;
  rhos: PSPEX_matrix; S: PSPEX_LU_analysis; pinv: Pint64_t; option: PSPEX_options): TSPEX_info; cdecl; external libspex;

// === Konventiert am: 4-11-25 19:29:25 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
