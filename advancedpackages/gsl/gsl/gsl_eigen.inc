{$IFDEF read_interface}


type
  Tgsl_eigen_symm_workspace = record
    size: Tsize_t;
    d: Pdouble;
    sd: Pdouble;
  end;
  Pgsl_eigen_symm_workspace = ^Tgsl_eigen_symm_workspace;

function gsl_eigen_symm_alloc(n: Tsize_t): Pgsl_eigen_symm_workspace; cdecl; external libgsl;
procedure gsl_eigen_symm_free(w: Pgsl_eigen_symm_workspace); cdecl; external libgsl;
function gsl_eigen_symm(A: Pgsl_matrix; eval: Pgsl_vector; w: Pgsl_eigen_symm_workspace): longint; cdecl; external libgsl;

type
  Tgsl_eigen_symmv_workspace = record
    size: Tsize_t;
    d: Pdouble;
    sd: Pdouble;
    gc: Pdouble;
    gs: Pdouble;
  end;
  Pgsl_eigen_symmv_workspace = ^Tgsl_eigen_symmv_workspace;

function gsl_eigen_symmv_alloc(n: Tsize_t): Pgsl_eigen_symmv_workspace; cdecl; external libgsl;
procedure gsl_eigen_symmv_free(w: Pgsl_eigen_symmv_workspace); cdecl; external libgsl;
function gsl_eigen_symmv(A: Pgsl_matrix; eval: Pgsl_vector; evec: Pgsl_matrix; w: Pgsl_eigen_symmv_workspace): longint; cdecl; external libgsl;

type
  Tgsl_eigen_herm_workspace = record
    size: Tsize_t;
    d: Pdouble;
    sd: Pdouble;
    tau: Pdouble;
  end;
  Pgsl_eigen_herm_workspace = ^Tgsl_eigen_herm_workspace;

function gsl_eigen_herm_alloc(n: Tsize_t): Pgsl_eigen_herm_workspace; cdecl; external libgsl;
procedure gsl_eigen_herm_free(w: Pgsl_eigen_herm_workspace); cdecl; external libgsl;
function gsl_eigen_herm(A: Pgsl_matrix_complex; eval: Pgsl_vector; w: Pgsl_eigen_herm_workspace): longint; cdecl; external libgsl;

type
  Tgsl_eigen_hermv_workspace = record
    size: Tsize_t;
    d: Pdouble;
    sd: Pdouble;
    tau: Pdouble;
    gc: Pdouble;
    gs: Pdouble;
  end;
  Pgsl_eigen_hermv_workspace = ^Tgsl_eigen_hermv_workspace;

function gsl_eigen_hermv_alloc(n: Tsize_t): Pgsl_eigen_hermv_workspace; cdecl; external libgsl;
procedure gsl_eigen_hermv_free(w: Pgsl_eigen_hermv_workspace); cdecl; external libgsl;
function gsl_eigen_hermv(A: Pgsl_matrix_complex; eval: Pgsl_vector; evec: Pgsl_matrix_complex; w: Pgsl_eigen_hermv_workspace): longint; cdecl; external libgsl;

type
  Tgsl_eigen_francis_workspace = record
    size: Tsize_t;
    max_iterations: Tsize_t;
    n_iter: Tsize_t;
    n_evals: Tsize_t;
    compute_t: longint;
    H: Pgsl_matrix;
    Z: Pgsl_matrix;
  end;
  Pgsl_eigen_francis_workspace = ^Tgsl_eigen_francis_workspace;

function gsl_eigen_francis_alloc: Pgsl_eigen_francis_workspace; cdecl; external libgsl;
procedure gsl_eigen_francis_free(w: Pgsl_eigen_francis_workspace); cdecl; external libgsl;
procedure gsl_eigen_francis_T(compute_t: longint; w: Pgsl_eigen_francis_workspace); cdecl; external libgsl;
function gsl_eigen_francis(H: Pgsl_matrix; eval: Pgsl_vector_complex; w: Pgsl_eigen_francis_workspace): longint; cdecl; external libgsl;
function gsl_eigen_francis_Z(H: Pgsl_matrix; eval: Pgsl_vector_complex; Z: Pgsl_matrix; w: Pgsl_eigen_francis_workspace): longint; cdecl; external libgsl;

type
  Tgsl_eigen_nonsymm_workspace = record
    size: Tsize_t;
    diag: Pgsl_vector;
    tau: Pgsl_vector;
    Z: Pgsl_matrix;
    do_balance: longint;
    n_evals: Tsize_t;
    francis_workspace_p: Pgsl_eigen_francis_workspace;
  end;
  Pgsl_eigen_nonsymm_workspace = ^Tgsl_eigen_nonsymm_workspace;

function gsl_eigen_nonsymm_alloc(n: Tsize_t): Pgsl_eigen_nonsymm_workspace; cdecl; external libgsl;
procedure gsl_eigen_nonsymm_free(w: Pgsl_eigen_nonsymm_workspace); cdecl; external libgsl;
procedure gsl_eigen_nonsymm_params(compute_t: longint; balance: longint; w: Pgsl_eigen_nonsymm_workspace); cdecl; external libgsl;
function gsl_eigen_nonsymm(A: Pgsl_matrix; eval: Pgsl_vector_complex; w: Pgsl_eigen_nonsymm_workspace): longint; cdecl; external libgsl;
function gsl_eigen_nonsymm_Z(A: Pgsl_matrix; eval: Pgsl_vector_complex; Z: Pgsl_matrix; w: Pgsl_eigen_nonsymm_workspace): longint; cdecl; external libgsl;

type
  Tgsl_eigen_nonsymmv_workspace = record
    size: Tsize_t;
    work: Pgsl_vector;
    work2: Pgsl_vector;
    work3: Pgsl_vector;
    Z: Pgsl_matrix;
    nonsymm_workspace_p: Pgsl_eigen_nonsymm_workspace;
  end;
  Pgsl_eigen_nonsymmv_workspace = ^Tgsl_eigen_nonsymmv_workspace;

function gsl_eigen_nonsymmv_alloc(n: Tsize_t): Pgsl_eigen_nonsymmv_workspace; cdecl; external libgsl;
procedure gsl_eigen_nonsymmv_free(w: Pgsl_eigen_nonsymmv_workspace); cdecl; external libgsl;
procedure gsl_eigen_nonsymmv_params(balance: longint; w: Pgsl_eigen_nonsymmv_workspace); cdecl; external libgsl;
function gsl_eigen_nonsymmv(A: Pgsl_matrix; eval: Pgsl_vector_complex; evec: Pgsl_matrix_complex; w: Pgsl_eigen_nonsymmv_workspace): longint; cdecl; external libgsl;
function gsl_eigen_nonsymmv_Z(A: Pgsl_matrix; eval: Pgsl_vector_complex; evec: Pgsl_matrix_complex; Z: Pgsl_matrix; w: Pgsl_eigen_nonsymmv_workspace): longint; cdecl; external libgsl;

type
  Tgsl_eigen_gensymm_workspace = record
    size: Tsize_t;
    symm_workspace_p: Pgsl_eigen_symm_workspace;
  end;
  Pgsl_eigen_gensymm_workspace = ^Tgsl_eigen_gensymm_workspace;

function gsl_eigen_gensymm_alloc(n: Tsize_t): Pgsl_eigen_gensymm_workspace; cdecl; external libgsl;
procedure gsl_eigen_gensymm_free(w: Pgsl_eigen_gensymm_workspace); cdecl; external libgsl;
function gsl_eigen_gensymm(A: Pgsl_matrix; B: Pgsl_matrix; eval: Pgsl_vector; w: Pgsl_eigen_gensymm_workspace): longint; cdecl; external libgsl;
function gsl_eigen_gensymm_standardize(A: Pgsl_matrix; B: Pgsl_matrix): longint; cdecl; external libgsl;

type
  Tgsl_eigen_gensymmv_workspace = record
    size: Tsize_t;
    symmv_workspace_p: Pgsl_eigen_symmv_workspace;
  end;
  Pgsl_eigen_gensymmv_workspace = ^Tgsl_eigen_gensymmv_workspace;

function gsl_eigen_gensymmv_alloc(n: Tsize_t): Pgsl_eigen_gensymmv_workspace; cdecl; external libgsl;
procedure gsl_eigen_gensymmv_free(w: Pgsl_eigen_gensymmv_workspace); cdecl; external libgsl;
function gsl_eigen_gensymmv(A: Pgsl_matrix; B: Pgsl_matrix; eval: Pgsl_vector; evec: Pgsl_matrix; w: Pgsl_eigen_gensymmv_workspace): longint; cdecl; external libgsl;

type
  Tgsl_eigen_genherm_workspace = record
    size: Tsize_t;
    herm_workspace_p: Pgsl_eigen_herm_workspace;
  end;
  Pgsl_eigen_genherm_workspace = ^Tgsl_eigen_genherm_workspace;

function gsl_eigen_genherm_alloc(n: Tsize_t): Pgsl_eigen_genherm_workspace; cdecl; external libgsl;
procedure gsl_eigen_genherm_free(w: Pgsl_eigen_genherm_workspace); cdecl; external libgsl;
function gsl_eigen_genherm(A: Pgsl_matrix_complex; B: Pgsl_matrix_complex; eval: Pgsl_vector; w: Pgsl_eigen_genherm_workspace): longint; cdecl; external libgsl;
function gsl_eigen_genherm_standardize(A: Pgsl_matrix_complex; B: Pgsl_matrix_complex): longint; cdecl; external libgsl;

type
  Tgsl_eigen_genhermv_workspace = record
    size: Tsize_t;
    hermv_workspace_p: Pgsl_eigen_hermv_workspace;
  end;
  Pgsl_eigen_genhermv_workspace = ^Tgsl_eigen_genhermv_workspace;

function gsl_eigen_genhermv_alloc(n: Tsize_t): Pgsl_eigen_genhermv_workspace; cdecl; external libgsl;
procedure gsl_eigen_genhermv_free(w: Pgsl_eigen_genhermv_workspace); cdecl; external libgsl;
function gsl_eigen_genhermv(A: Pgsl_matrix_complex; B: Pgsl_matrix_complex; eval: Pgsl_vector; evec: Pgsl_matrix_complex; w: Pgsl_eigen_genhermv_workspace): longint; cdecl; external libgsl;

type
  Tgsl_eigen_gen_workspace = record
    size: Tsize_t;
    work: Pgsl_vector;
    n_evals: Tsize_t;
    max_iterations: Tsize_t;
    n_iter: Tsize_t;
    eshift: Tdouble;
    needtop: longint;
    atol: Tdouble;
    btol: Tdouble;
    ascale: Tdouble;
    bscale: Tdouble;
    H: Pgsl_matrix;
    R: Pgsl_matrix;
    compute_s: longint;
    compute_t: longint;
    Q: Pgsl_matrix;
    Z: Pgsl_matrix;
  end;
  Pgsl_eigen_gen_workspace = ^Tgsl_eigen_gen_workspace;

function gsl_eigen_gen_alloc(n: Tsize_t): Pgsl_eigen_gen_workspace; cdecl; external libgsl;
procedure gsl_eigen_gen_free(w: Pgsl_eigen_gen_workspace); cdecl; external libgsl;
procedure gsl_eigen_gen_params(compute_s: longint; compute_t: longint; balance: longint; w: Pgsl_eigen_gen_workspace); cdecl; external libgsl;
function gsl_eigen_gen(A: Pgsl_matrix; B: Pgsl_matrix; alpha: Pgsl_vector_complex; beta: Pgsl_vector; w: Pgsl_eigen_gen_workspace): longint; cdecl; external libgsl;
function gsl_eigen_gen_QZ(A: Pgsl_matrix; B: Pgsl_matrix; alpha: Pgsl_vector_complex; beta: Pgsl_vector; Q: Pgsl_matrix;
  Z: Pgsl_matrix; w: Pgsl_eigen_gen_workspace): longint; cdecl; external libgsl;

type
  Tgsl_eigen_genv_workspace = record
    size: Tsize_t;
    work1: Pgsl_vector;
    work2: Pgsl_vector;
    work3: Pgsl_vector;
    work4: Pgsl_vector;
    work5: Pgsl_vector;
    work6: Pgsl_vector;
    Q: Pgsl_matrix;
    Z: Pgsl_matrix;
    gen_workspace_p: Pgsl_eigen_gen_workspace;
  end;
  Pgsl_eigen_genv_workspace = ^Tgsl_eigen_genv_workspace;

function gsl_eigen_genv_alloc(n: Tsize_t): Pgsl_eigen_genv_workspace; cdecl; external libgsl;
procedure gsl_eigen_genv_free(w: Pgsl_eigen_genv_workspace); cdecl; external libgsl;
function gsl_eigen_genv(A: Pgsl_matrix; B: Pgsl_matrix; alpha: Pgsl_vector_complex; beta: Pgsl_vector; evec: Pgsl_matrix_complex;
  w: Pgsl_eigen_genv_workspace): longint; cdecl; external libgsl;
function gsl_eigen_genv_QZ(A: Pgsl_matrix; B: Pgsl_matrix; alpha: Pgsl_vector_complex; beta: Pgsl_vector; evec: Pgsl_matrix_complex;
  Q: Pgsl_matrix; Z: Pgsl_matrix; w: Pgsl_eigen_genv_workspace): longint; cdecl; external libgsl;

type
  Pgsl_eigen_sort_t = ^Tgsl_eigen_sort_t;
  Tgsl_eigen_sort_t = longint;

const
  GSL_EIGEN_SORT_VAL_ASC = 0;
  GSL_EIGEN_SORT_VAL_DESC = 1;
  GSL_EIGEN_SORT_ABS_ASC = 2;
  GSL_EIGEN_SORT_ABS_DESC = 3;

function gsl_eigen_symmv_sort(eval: Pgsl_vector; evec: Pgsl_matrix; sort_type: Tgsl_eigen_sort_t): longint; cdecl; external libgsl;
function gsl_eigen_hermv_sort(eval: Pgsl_vector; evec: Pgsl_matrix_complex; sort_type: Tgsl_eigen_sort_t): longint; cdecl; external libgsl;
function gsl_eigen_nonsymmv_sort(eval: Pgsl_vector_complex; evec: Pgsl_matrix_complex; sort_type: Tgsl_eigen_sort_t): longint; cdecl; external libgsl;
function gsl_eigen_gensymmv_sort(eval: Pgsl_vector; evec: Pgsl_matrix; sort_type: Tgsl_eigen_sort_t): longint; cdecl; external libgsl;
function gsl_eigen_genhermv_sort(eval: Pgsl_vector; evec: Pgsl_matrix_complex; sort_type: Tgsl_eigen_sort_t): longint; cdecl; external libgsl;
function gsl_eigen_genv_sort(alpha: Pgsl_vector_complex; beta: Pgsl_vector; evec: Pgsl_matrix_complex; sort_type: Tgsl_eigen_sort_t): longint; cdecl; external libgsl;
function gsl_schur_gen_eigvals(A: Pgsl_matrix; B: Pgsl_matrix; wr1: Pdouble; wr2: Pdouble; wi: Pdouble;
  scale1: Pdouble; scale2: Pdouble): longint; cdecl; external libgsl;
function gsl_schur_solve_equation(ca: Tdouble; A: Pgsl_matrix; z: Tdouble; d1: Tdouble; d2: Tdouble;
  b: Pgsl_vector; x: Pgsl_vector; s: Pdouble; xnorm: Pdouble; smin: Tdouble): longint; cdecl; external libgsl;
function gsl_schur_solve_equation_z(ca: Tdouble; A: Pgsl_matrix; z: Pgsl_complex; d1: Tdouble; d2: Tdouble;
  b: Pgsl_vector_complex; x: Pgsl_vector_complex; s: Pdouble; xnorm: Pdouble; smin: Tdouble): longint; cdecl; external libgsl;
function gsl_eigen_jacobi(matrix: Pgsl_matrix; eval: Pgsl_vector; evec: Pgsl_matrix; max_rot: dword; nrot: Pdword): longint; cdecl; external libgsl;
function gsl_eigen_invert_jacobi(matrix: Pgsl_matrix; ainv: Pgsl_matrix; max_rot: dword): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 16:52:14 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
