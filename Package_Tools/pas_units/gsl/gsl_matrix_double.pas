unit gsl_matrix_double;

interface

uses
  fp_gsl, gsl_blas_types, gsl_block_double, gsl_vector_double;

type
  Tgsl_matrix = record
    size1: Tsize_t;
    size2: Tsize_t;
    tda: Tsize_t;
    data: Pdouble;
    block: Pgsl_block;
    owner: longint;
  end;
  Pgsl_matrix = ^Tgsl_matrix;

  Tgsl_matrix_view = record
    matrix: Tgsl_matrix;
  end;
  Pgsl_matrix_view = ^Tgsl_matrix_view;

  Tgsl_matrix_const_view = record
    matrix: Tgsl_matrix;
  end;
  Pgsl_matrix_const_view = ^Tgsl_matrix_const_view;

function gsl_matrix_alloc(n1: Tsize_t; n2: Tsize_t): Pgsl_matrix; cdecl; external libgsl;
function gsl_matrix_calloc(n1: Tsize_t; n2: Tsize_t): Pgsl_matrix; cdecl; external libgsl;
function gsl_matrix_alloc_from_block(b: Pgsl_block; offset: Tsize_t; n1: Tsize_t; n2: Tsize_t; d2: Tsize_t): Pgsl_matrix; cdecl; external libgsl;
function gsl_matrix_alloc_from_matrix(m: Pgsl_matrix; k1: Tsize_t; k2: Tsize_t; n1: Tsize_t; n2: Tsize_t): Pgsl_matrix; cdecl; external libgsl;
function gsl_vector_alloc_row_from_matrix(m: Pgsl_matrix; i: Tsize_t): Pgsl_vector; cdecl; external libgsl;
function gsl_vector_alloc_col_from_matrix(m: Pgsl_matrix; j: Tsize_t): Pgsl_vector; cdecl; external libgsl;
procedure gsl_matrix_free(m: Pgsl_matrix); cdecl; external libgsl;

function gsl_matrix_submatrix(m: Pgsl_matrix; i: Tsize_t; j: Tsize_t; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_view; cdecl; external libgsl;
function gsl_matrix_row(m: Pgsl_matrix; i: Tsize_t): Tgsl_vector_view; cdecl; external libgsl;
function gsl_matrix_column(m: Pgsl_matrix; j: Tsize_t): Tgsl_vector_view; cdecl; external libgsl;
function gsl_matrix_diagonal(m: Pgsl_matrix): Tgsl_vector_view; cdecl; external libgsl;
function gsl_matrix_subdiagonal(m: Pgsl_matrix; k: Tsize_t): Tgsl_vector_view; cdecl; external libgsl;
function gsl_matrix_superdiagonal(m: Pgsl_matrix; k: Tsize_t): Tgsl_vector_view; cdecl; external libgsl;
function gsl_matrix_subrow(m: Pgsl_matrix; i: Tsize_t; offset: Tsize_t; n: Tsize_t): Tgsl_vector_view; cdecl; external libgsl;
function gsl_matrix_subcolumn(m: Pgsl_matrix; j: Tsize_t; offset: Tsize_t; n: Tsize_t): Tgsl_vector_view; cdecl; external libgsl;
function gsl_matrix_view_array(base: Pdouble; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_view; cdecl; external libgsl;
function gsl_matrix_view_array_with_tda(base: Pdouble; n1: Tsize_t; n2: Tsize_t; tda: Tsize_t): Tgsl_matrix_view; cdecl; external libgsl;
function gsl_matrix_view_vector(v: Pgsl_vector; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_view; cdecl; external libgsl;
function gsl_matrix_view_vector_with_tda(v: Pgsl_vector; n1: Tsize_t; n2: Tsize_t; tda: Tsize_t): Tgsl_matrix_view; cdecl; external libgsl;
function gsl_matrix_const_submatrix(m: Pgsl_matrix; i: Tsize_t; j: Tsize_t; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_const_view; cdecl; external libgsl;
function gsl_matrix_const_row(m: Pgsl_matrix; i: Tsize_t): Tgsl_vector_const_view; cdecl; external libgsl;
function gsl_matrix_const_column(m: Pgsl_matrix; j: Tsize_t): Tgsl_vector_const_view; cdecl; external libgsl;
function gsl_matrix_const_diagonal(m: Pgsl_matrix): Tgsl_vector_const_view; cdecl; external libgsl;
function gsl_matrix_const_subdiagonal(m: Pgsl_matrix; k: Tsize_t): Tgsl_vector_const_view; cdecl; external libgsl;
function gsl_matrix_const_superdiagonal(m: Pgsl_matrix; k: Tsize_t): Tgsl_vector_const_view; cdecl; external libgsl;
function gsl_matrix_const_subrow(m: Pgsl_matrix; i: Tsize_t; offset: Tsize_t; n: Tsize_t): Tgsl_vector_const_view; cdecl; external libgsl;
function gsl_matrix_const_subcolumn(m: Pgsl_matrix; j: Tsize_t; offset: Tsize_t; n: Tsize_t): Tgsl_vector_const_view; cdecl; external libgsl;
function gsl_matrix_const_view_array(base: Pdouble; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_const_view; cdecl; external libgsl;
function gsl_matrix_const_view_array_with_tda(base: Pdouble; n1: Tsize_t; n2: Tsize_t; tda: Tsize_t): Tgsl_matrix_const_view; cdecl; external libgsl;
function gsl_matrix_const_view_vector(v: Pgsl_vector; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_const_view; cdecl; external libgsl;
function gsl_matrix_const_view_vector_with_tda(v: Pgsl_vector; n1: Tsize_t; n2: Tsize_t; tda: Tsize_t): Tgsl_matrix_const_view; cdecl; external libgsl;

procedure gsl_matrix_set_zero(m: Pgsl_matrix); cdecl; external libgsl;
procedure gsl_matrix_set_identity(m: Pgsl_matrix); cdecl; external libgsl;
procedure gsl_matrix_set_all(m: Pgsl_matrix; x: Tdouble); cdecl; external libgsl;
function gsl_matrix_fread(stream: PFILE; m: Pgsl_matrix): longint; cdecl; external libgsl;
function gsl_matrix_fwrite(stream: PFILE; m: Pgsl_matrix): longint; cdecl; external libgsl;
function gsl_matrix_fscanf(stream: PFILE; m: Pgsl_matrix): longint; cdecl; external libgsl;
function gsl_matrix_fprintf(stream: PFILE; m: Pgsl_matrix; format: pchar): longint; cdecl; external libgsl;
function gsl_matrix_memcpy(dest: Pgsl_matrix; src: Pgsl_matrix): longint; cdecl; external libgsl;
function gsl_matrix_swap(m1: Pgsl_matrix; m2: Pgsl_matrix): longint; cdecl; external libgsl;
function gsl_matrix_tricpy(Uplo: TCBLAS_UPLO_t; Diag: TCBLAS_DIAG_t; dest: Pgsl_matrix; src: Pgsl_matrix): longint; cdecl; external libgsl;
function gsl_matrix_swap_rows(m: Pgsl_matrix; i: Tsize_t; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_matrix_swap_columns(m: Pgsl_matrix; i: Tsize_t; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_matrix_swap_rowcol(m: Pgsl_matrix; i: Tsize_t; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_matrix_transpose(m: Pgsl_matrix): longint; cdecl; external libgsl;
function gsl_matrix_transpose_memcpy(dest: Pgsl_matrix; src: Pgsl_matrix): longint; cdecl; external libgsl;
function gsl_matrix_transpose_tricpy(Uplo_src: TCBLAS_UPLO_t; Diag: TCBLAS_DIAG_t; dest: Pgsl_matrix; src: Pgsl_matrix): longint; cdecl; external libgsl;
function gsl_matrix_max(m: Pgsl_matrix): Tdouble; cdecl; external libgsl;
function gsl_matrix_min(m: Pgsl_matrix): Tdouble; cdecl; external libgsl;
procedure gsl_matrix_minmax(m: Pgsl_matrix; min_out: Pdouble; max_out: Pdouble); cdecl; external libgsl;
procedure gsl_matrix_max_index(m: Pgsl_matrix; imax: Psize_t; jmax: Psize_t); cdecl; external libgsl;
procedure gsl_matrix_min_index(m: Pgsl_matrix; imin: Psize_t; jmin: Psize_t); cdecl; external libgsl;
procedure gsl_matrix_minmax_index(m: Pgsl_matrix; imin: Psize_t; jmin: Psize_t; imax: Psize_t; jmax: Psize_t); cdecl; external libgsl;
function gsl_matrix_equal(a: Pgsl_matrix; b: Pgsl_matrix): longint; cdecl; external libgsl;
function gsl_matrix_isnull(m: Pgsl_matrix): longint; cdecl; external libgsl;
function gsl_matrix_ispos(m: Pgsl_matrix): longint; cdecl; external libgsl;
function gsl_matrix_isneg(m: Pgsl_matrix): longint; cdecl; external libgsl;
function gsl_matrix_isnonneg(m: Pgsl_matrix): longint; cdecl; external libgsl;
function gsl_matrix_norm1(m: Pgsl_matrix): Tdouble; cdecl; external libgsl;
function gsl_matrix_add(a: Pgsl_matrix; b: Pgsl_matrix): longint; cdecl; external libgsl;
function gsl_matrix_sub(a: Pgsl_matrix; b: Pgsl_matrix): longint; cdecl; external libgsl;
function gsl_matrix_mul_elements(a: Pgsl_matrix; b: Pgsl_matrix): longint; cdecl; external libgsl;
function gsl_matrix_div_elements(a: Pgsl_matrix; b: Pgsl_matrix): longint; cdecl; external libgsl;
function gsl_matrix_scale(a: Pgsl_matrix; x: Tdouble): longint; cdecl; external libgsl;
function gsl_matrix_scale_rows(a: Pgsl_matrix; x: Pgsl_vector): longint; cdecl; external libgsl;
function gsl_matrix_scale_columns(a: Pgsl_matrix; x: Pgsl_vector): longint; cdecl; external libgsl;
function gsl_matrix_add_constant(a: Pgsl_matrix; x: Tdouble): longint; cdecl; external libgsl;
function gsl_matrix_add_diagonal(a: Pgsl_matrix; x: Tdouble): longint; cdecl; external libgsl;

function gsl_matrix_get_row(v: Pgsl_vector; m: Pgsl_matrix; i: Tsize_t): longint; cdecl; external libgsl;
function gsl_matrix_get_col(v: Pgsl_vector; m: Pgsl_matrix; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_matrix_set_row(m: Pgsl_matrix; i: Tsize_t; v: Pgsl_vector): longint; cdecl; external libgsl;
function gsl_matrix_set_col(m: Pgsl_matrix; j: Tsize_t; v: Pgsl_vector): longint; cdecl; external libgsl;

function gsl_matrix_get(m: Pgsl_matrix; i: Tsize_t; j: Tsize_t): Tdouble; cdecl; external libgsl;
procedure gsl_matrix_set(m: Pgsl_matrix; i: Tsize_t; j: Tsize_t; x: Tdouble); cdecl; external libgsl;
function gsl_matrix_ptr(m: Pgsl_matrix; i: Tsize_t; j: Tsize_t): Pdouble; cdecl; external libgsl;
function gsl_matrix_const_ptr(m: Pgsl_matrix; i: Tsize_t; j: Tsize_t): Pdouble; cdecl; external libgsl;

// === Konventiert am: 18-8-25 15:50:05 ===


implementation



end.
