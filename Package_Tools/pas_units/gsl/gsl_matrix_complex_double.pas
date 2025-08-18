unit gsl_matrix_complex_double;

interface

uses
  fp_gsl, gsl_blas_types, gsl_block_complex_double, gsl_vector_complex_double, gsl_complex;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tgsl_matrix_complex = record
    size1: Tsize_t;
    size2: Tsize_t;
    tda: Tsize_t;
    data: Pdouble;
    block: Pgsl_block_complex;
    owner: longint;
  end;
  Pgsl_matrix_complex = ^Tgsl_matrix_complex;

  Tgsl_matrix_complex_view = record
    matrix: Tgsl_matrix_complex;
  end;
  Pgsl_matrix_complex_view = ^Tgsl_matrix_complex_view;

  Tgsl_matrix_complex_const_view = record
    matrix: Tgsl_matrix_complex;
  end;
  Pgsl_matrix_complex_const_view = ^Tgsl_matrix_complex_const_view;

function gsl_matrix_complex_alloc(n1: Tsize_t; n2: Tsize_t): Pgsl_matrix_complex; cdecl; external libgsl;
function gsl_matrix_complex_calloc(n1: Tsize_t; n2: Tsize_t): Pgsl_matrix_complex; cdecl; external libgsl;
function gsl_matrix_complex_alloc_from_block(b: Pgsl_block_complex; offset: Tsize_t; n1: Tsize_t; n2: Tsize_t; d2: Tsize_t): Pgsl_matrix_complex; cdecl; external libgsl;
function gsl_matrix_complex_alloc_from_matrix(b: Pgsl_matrix_complex; k1: Tsize_t; k2: Tsize_t; n1: Tsize_t; n2: Tsize_t): Pgsl_matrix_complex; cdecl; external libgsl;
function gsl_vector_complex_alloc_row_from_matrix(m: Pgsl_matrix_complex; i: Tsize_t): Pgsl_vector_complex; cdecl; external libgsl;
function gsl_vector_complex_alloc_col_from_matrix(m: Pgsl_matrix_complex; j: Tsize_t): Pgsl_vector_complex; cdecl; external libgsl;
procedure gsl_matrix_complex_free(m: Pgsl_matrix_complex); cdecl; external libgsl;

function gsl_matrix_complex_submatrix(m: Pgsl_matrix_complex; i: Tsize_t; j: Tsize_t; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_complex_view; cdecl; external libgsl;
function gsl_matrix_complex_row(m: Pgsl_matrix_complex; i: Tsize_t): Tgsl_vector_complex_view; cdecl; external libgsl;
function gsl_matrix_complex_column(m: Pgsl_matrix_complex; j: Tsize_t): Tgsl_vector_complex_view; cdecl; external libgsl;
function gsl_matrix_complex_diagonal(m: Pgsl_matrix_complex): Tgsl_vector_complex_view; cdecl; external libgsl;
function gsl_matrix_complex_subdiagonal(m: Pgsl_matrix_complex; k: Tsize_t): Tgsl_vector_complex_view; cdecl; external libgsl;
function gsl_matrix_complex_superdiagonal(m: Pgsl_matrix_complex; k: Tsize_t): Tgsl_vector_complex_view; cdecl; external libgsl;
function gsl_matrix_complex_subrow(m: Pgsl_matrix_complex; i: Tsize_t; offset: Tsize_t; n: Tsize_t): Tgsl_vector_complex_view; cdecl; external libgsl;
function gsl_matrix_complex_subcolumn(m: Pgsl_matrix_complex; j: Tsize_t; offset: Tsize_t; n: Tsize_t): Tgsl_vector_complex_view; cdecl; external libgsl;
function gsl_matrix_complex_view_array(base: Pdouble; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_complex_view; cdecl; external libgsl;
function gsl_matrix_complex_view_array_with_tda(base: Pdouble; n1: Tsize_t; n2: Tsize_t; tda: Tsize_t): Tgsl_matrix_complex_view; cdecl; external libgsl;
function gsl_matrix_complex_view_vector(v: Pgsl_vector_complex; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_complex_view; cdecl; external libgsl;
function gsl_matrix_complex_view_vector_with_tda(v: Pgsl_vector_complex; n1: Tsize_t; n2: Tsize_t; tda: Tsize_t): Tgsl_matrix_complex_view; cdecl; external libgsl;
function gsl_matrix_complex_const_submatrix(m: Pgsl_matrix_complex; i: Tsize_t; j: Tsize_t; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_complex_const_view; cdecl; external libgsl;
function gsl_matrix_complex_const_row(m: Pgsl_matrix_complex; i: Tsize_t): Tgsl_vector_complex_const_view; cdecl; external libgsl;
function gsl_matrix_complex_const_column(m: Pgsl_matrix_complex; j: Tsize_t): Tgsl_vector_complex_const_view; cdecl; external libgsl;
function gsl_matrix_complex_const_diagonal(m: Pgsl_matrix_complex): Tgsl_vector_complex_const_view; cdecl; external libgsl;
function gsl_matrix_complex_const_subdiagonal(m: Pgsl_matrix_complex; k: Tsize_t): Tgsl_vector_complex_const_view; cdecl; external libgsl;
function gsl_matrix_complex_const_superdiagonal(m: Pgsl_matrix_complex; k: Tsize_t): Tgsl_vector_complex_const_view; cdecl; external libgsl;
function gsl_matrix_complex_const_subrow(m: Pgsl_matrix_complex; i: Tsize_t; offset: Tsize_t; n: Tsize_t): Tgsl_vector_complex_const_view; cdecl; external libgsl;
function gsl_matrix_complex_const_subcolumn(m: Pgsl_matrix_complex; j: Tsize_t; offset: Tsize_t; n: Tsize_t): Tgsl_vector_complex_const_view; cdecl; external libgsl;
function gsl_matrix_complex_const_view_array(base: Pdouble; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_complex_const_view; cdecl; external libgsl;
function gsl_matrix_complex_const_view_array_with_tda(base: Pdouble; n1: Tsize_t; n2: Tsize_t; tda: Tsize_t): Tgsl_matrix_complex_const_view; cdecl; external libgsl;
function gsl_matrix_complex_const_view_vector(v: Pgsl_vector_complex; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_complex_const_view; cdecl; external libgsl;
function gsl_matrix_complex_const_view_vector_with_tda(v: Pgsl_vector_complex; n1: Tsize_t; n2: Tsize_t; tda: Tsize_t): Tgsl_matrix_complex_const_view; cdecl; external libgsl;

procedure gsl_matrix_complex_set_zero(m: Pgsl_matrix_complex); cdecl; external libgsl;
procedure gsl_matrix_complex_set_identity(m: Pgsl_matrix_complex); cdecl; external libgsl;
procedure gsl_matrix_complex_set_all(m: Pgsl_matrix_complex; x: Tgsl_complex); cdecl; external libgsl;
function gsl_matrix_complex_fread(stream: PFILE; m: Pgsl_matrix_complex): longint; cdecl; external libgsl;
function gsl_matrix_complex_fwrite(stream: PFILE; m: Pgsl_matrix_complex): longint; cdecl; external libgsl;
function gsl_matrix_complex_fscanf(stream: PFILE; m: Pgsl_matrix_complex): longint; cdecl; external libgsl;
function gsl_matrix_complex_fprintf(stream: PFILE; m: Pgsl_matrix_complex; format: pchar): longint; cdecl; external libgsl;
function gsl_matrix_complex_memcpy(dest: Pgsl_matrix_complex; src: Pgsl_matrix_complex): longint; cdecl; external libgsl;
function gsl_matrix_complex_swap(m1: Pgsl_matrix_complex; m2: Pgsl_matrix_complex): longint; cdecl; external libgsl;
function gsl_matrix_complex_tricpy(Uplo: TCBLAS_UPLO_t; Diag: TCBLAS_DIAG_t; dest: Pgsl_matrix_complex; src: Pgsl_matrix_complex): longint; cdecl; external libgsl;
function gsl_matrix_complex_swap_rows(m: Pgsl_matrix_complex; i: Tsize_t; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_matrix_complex_swap_columns(m: Pgsl_matrix_complex; i: Tsize_t; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_matrix_complex_swap_rowcol(m: Pgsl_matrix_complex; i: Tsize_t; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_matrix_complex_transpose(m: Pgsl_matrix_complex): longint; cdecl; external libgsl;
function gsl_matrix_complex_transpose_memcpy(dest: Pgsl_matrix_complex; src: Pgsl_matrix_complex): longint; cdecl; external libgsl;
function gsl_matrix_complex_transpose_tricpy(Uplo_src: TCBLAS_UPLO_t; Diag: TCBLAS_DIAG_t; dest: Pgsl_matrix_complex; src: Pgsl_matrix_complex): longint; cdecl; external libgsl;
function gsl_matrix_complex_conjtrans_memcpy(dest: Pgsl_matrix_complex; src: Pgsl_matrix_complex): longint; cdecl; external libgsl;
function gsl_matrix_complex_equal(a: Pgsl_matrix_complex; b: Pgsl_matrix_complex): longint; cdecl; external libgsl;
function gsl_matrix_complex_isnull(m: Pgsl_matrix_complex): longint; cdecl; external libgsl;
function gsl_matrix_complex_ispos(m: Pgsl_matrix_complex): longint; cdecl; external libgsl;
function gsl_matrix_complex_isneg(m: Pgsl_matrix_complex): longint; cdecl; external libgsl;
function gsl_matrix_complex_isnonneg(m: Pgsl_matrix_complex): longint; cdecl; external libgsl;
function gsl_matrix_complex_add(a: Pgsl_matrix_complex; b: Pgsl_matrix_complex): longint; cdecl; external libgsl;
function gsl_matrix_complex_sub(a: Pgsl_matrix_complex; b: Pgsl_matrix_complex): longint; cdecl; external libgsl;
function gsl_matrix_complex_mul_elements(a: Pgsl_matrix_complex; b: Pgsl_matrix_complex): longint; cdecl; external libgsl;
function gsl_matrix_complex_div_elements(a: Pgsl_matrix_complex; b: Pgsl_matrix_complex): longint; cdecl; external libgsl;
function gsl_matrix_complex_scale(a: Pgsl_matrix_complex; x: Tgsl_complex): longint; cdecl; external libgsl;
function gsl_matrix_complex_scale_rows(a: Pgsl_matrix_complex; x: Pgsl_vector_complex): longint; cdecl; external libgsl;
function gsl_matrix_complex_scale_columns(a: Pgsl_matrix_complex; x: Pgsl_vector_complex): longint; cdecl; external libgsl;
function gsl_matrix_complex_add_constant(a: Pgsl_matrix_complex; x: Tgsl_complex): longint; cdecl; external libgsl;
function gsl_matrix_complex_add_diagonal(a: Pgsl_matrix_complex; x: Tgsl_complex): longint; cdecl; external libgsl;

function gsl_matrix_complex_get_row(v: Pgsl_vector_complex; m: Pgsl_matrix_complex; i: Tsize_t): longint; cdecl; external libgsl;
function gsl_matrix_complex_get_col(v: Pgsl_vector_complex; m: Pgsl_matrix_complex; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_matrix_complex_set_row(m: Pgsl_matrix_complex; i: Tsize_t; v: Pgsl_vector_complex): longint; cdecl; external libgsl;
function gsl_matrix_complex_set_col(m: Pgsl_matrix_complex; j: Tsize_t; v: Pgsl_vector_complex): longint; cdecl; external libgsl;

function gsl_matrix_complex_get(m: Pgsl_matrix_complex; i: Tsize_t; j: Tsize_t): Tgsl_complex; cdecl; external libgsl;
procedure gsl_matrix_complex_set(m: Pgsl_matrix_complex; i: Tsize_t; j: Tsize_t; x: Tgsl_complex); cdecl; external libgsl;
function gsl_matrix_complex_ptr(m: Pgsl_matrix_complex; i: Tsize_t; j: Tsize_t): Pgsl_complex; cdecl; external libgsl;
function gsl_matrix_complex_const_ptr(m: Pgsl_matrix_complex; i: Tsize_t; j: Tsize_t): Pgsl_complex; cdecl; external libgsl;

// === Konventiert am: 18-8-25 17:18:55 ===


implementation



end.
