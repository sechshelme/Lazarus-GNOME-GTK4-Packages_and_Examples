unit gsl_matrix_ushort;

interface

uses
  fp_gsl, gsl_blas_types, gsl_block_ushort, gsl_vector_ushort;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tgsl_matrix_ushort = record
    size1: Tsize_t;
    size2: Tsize_t;
    tda: Tsize_t;
    data: Pword;
    block: Pgsl_block_ushort;
    owner: longint;
  end;
  Pgsl_matrix_ushort = ^Tgsl_matrix_ushort;

  Tgsl_matrix_ushort_view = record
    matrix: Tgsl_matrix_ushort;
  end;
  Pgsl_matrix_ushort_view = ^Tgsl_matrix_ushort_view;

  Tgsl_matrix_ushort_const_view = record
    matrix: Tgsl_matrix_ushort;
  end;
  Pgsl_matrix_ushort_const_view = ^Tgsl_matrix_ushort_const_view;


function gsl_matrix_ushort_alloc(n1: Tsize_t; n2: Tsize_t): Pgsl_matrix_ushort; cdecl; external libgsl;
function gsl_matrix_ushort_calloc(n1: Tsize_t; n2: Tsize_t): Pgsl_matrix_ushort; cdecl; external libgsl;
function gsl_matrix_ushort_alloc_from_block(b: Pgsl_block_ushort; offset: Tsize_t; n1: Tsize_t; n2: Tsize_t; d2: Tsize_t): Pgsl_matrix_ushort; cdecl; external libgsl;
function gsl_matrix_ushort_alloc_from_matrix(m: Pgsl_matrix_ushort; k1: Tsize_t; k2: Tsize_t; n1: Tsize_t; n2: Tsize_t): Pgsl_matrix_ushort; cdecl; external libgsl;
function gsl_vector_ushort_alloc_row_from_matrix(m: Pgsl_matrix_ushort; i: Tsize_t): Pgsl_vector_ushort; cdecl; external libgsl;
function gsl_vector_ushort_alloc_col_from_matrix(m: Pgsl_matrix_ushort; j: Tsize_t): Pgsl_vector_ushort; cdecl; external libgsl;
procedure gsl_matrix_ushort_free(m: Pgsl_matrix_ushort); cdecl; external libgsl;

function gsl_matrix_ushort_submatrix(m: Pgsl_matrix_ushort; i: Tsize_t; j: Tsize_t; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_ushort_view; cdecl; external libgsl;
function gsl_matrix_ushort_row(m: Pgsl_matrix_ushort; i: Tsize_t): Tgsl_vector_ushort_view; cdecl; external libgsl;
function gsl_matrix_ushort_column(m: Pgsl_matrix_ushort; j: Tsize_t): Tgsl_vector_ushort_view; cdecl; external libgsl;
function gsl_matrix_ushort_diagonal(m: Pgsl_matrix_ushort): Tgsl_vector_ushort_view; cdecl; external libgsl;
function gsl_matrix_ushort_subdiagonal(m: Pgsl_matrix_ushort; k: Tsize_t): Tgsl_vector_ushort_view; cdecl; external libgsl;
function gsl_matrix_ushort_superdiagonal(m: Pgsl_matrix_ushort; k: Tsize_t): Tgsl_vector_ushort_view; cdecl; external libgsl;
function gsl_matrix_ushort_subrow(m: Pgsl_matrix_ushort; i: Tsize_t; offset: Tsize_t; n: Tsize_t): Tgsl_vector_ushort_view; cdecl; external libgsl;
function gsl_matrix_ushort_subcolumn(m: Pgsl_matrix_ushort; j: Tsize_t; offset: Tsize_t; n: Tsize_t): Tgsl_vector_ushort_view; cdecl; external libgsl;
function gsl_matrix_ushort_view_array(base: Pword; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_ushort_view; cdecl; external libgsl;
function gsl_matrix_ushort_view_array_with_tda(base: Pword; n1: Tsize_t; n2: Tsize_t; tda: Tsize_t): Tgsl_matrix_ushort_view; cdecl; external libgsl;
function gsl_matrix_ushort_view_vector(v: Pgsl_vector_ushort; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_ushort_view; cdecl; external libgsl;
function gsl_matrix_ushort_view_vector_with_tda(v: Pgsl_vector_ushort; n1: Tsize_t; n2: Tsize_t; tda: Tsize_t): Tgsl_matrix_ushort_view; cdecl; external libgsl;
function gsl_matrix_ushort_const_submatrix(m: Pgsl_matrix_ushort; i: Tsize_t; j: Tsize_t; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_ushort_const_view; cdecl; external libgsl;
function gsl_matrix_ushort_const_row(m: Pgsl_matrix_ushort; i: Tsize_t): Tgsl_vector_ushort_const_view; cdecl; external libgsl;
function gsl_matrix_ushort_const_column(m: Pgsl_matrix_ushort; j: Tsize_t): Tgsl_vector_ushort_const_view; cdecl; external libgsl;
function gsl_matrix_ushort_const_diagonal(m: Pgsl_matrix_ushort): Tgsl_vector_ushort_const_view; cdecl; external libgsl;
function gsl_matrix_ushort_const_subdiagonal(m: Pgsl_matrix_ushort; k: Tsize_t): Tgsl_vector_ushort_const_view; cdecl; external libgsl;
function gsl_matrix_ushort_const_superdiagonal(m: Pgsl_matrix_ushort; k: Tsize_t): Tgsl_vector_ushort_const_view; cdecl; external libgsl;
function gsl_matrix_ushort_const_subrow(m: Pgsl_matrix_ushort; i: Tsize_t; offset: Tsize_t; n: Tsize_t): Tgsl_vector_ushort_const_view; cdecl; external libgsl;
function gsl_matrix_ushort_const_subcolumn(m: Pgsl_matrix_ushort; j: Tsize_t; offset: Tsize_t; n: Tsize_t): Tgsl_vector_ushort_const_view; cdecl; external libgsl;
function gsl_matrix_ushort_const_view_array(base: Pword; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_ushort_const_view; cdecl; external libgsl;
function gsl_matrix_ushort_const_view_array_with_tda(base: Pword; n1: Tsize_t; n2: Tsize_t; tda: Tsize_t): Tgsl_matrix_ushort_const_view; cdecl; external libgsl;
function gsl_matrix_ushort_const_view_vector(v: Pgsl_vector_ushort; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_ushort_const_view; cdecl; external libgsl;
function gsl_matrix_ushort_const_view_vector_with_tda(v: Pgsl_vector_ushort; n1: Tsize_t; n2: Tsize_t; tda: Tsize_t): Tgsl_matrix_ushort_const_view; cdecl; external libgsl;

procedure gsl_matrix_ushort_set_zero(m: Pgsl_matrix_ushort); cdecl; external libgsl;
procedure gsl_matrix_ushort_set_identity(m: Pgsl_matrix_ushort); cdecl; external libgsl;
procedure gsl_matrix_ushort_set_all(m: Pgsl_matrix_ushort; x: word); cdecl; external libgsl;
function gsl_matrix_ushort_fread(stream: PFILE; m: Pgsl_matrix_ushort): longint; cdecl; external libgsl;
function gsl_matrix_ushort_fwrite(stream: PFILE; m: Pgsl_matrix_ushort): longint; cdecl; external libgsl;
function gsl_matrix_ushort_fscanf(stream: PFILE; m: Pgsl_matrix_ushort): longint; cdecl; external libgsl;
function gsl_matrix_ushort_fprintf(stream: PFILE; m: Pgsl_matrix_ushort; format: pchar): longint; cdecl; external libgsl;
function gsl_matrix_ushort_memcpy(dest: Pgsl_matrix_ushort; src: Pgsl_matrix_ushort): longint; cdecl; external libgsl;
function gsl_matrix_ushort_swap(m1: Pgsl_matrix_ushort; m2: Pgsl_matrix_ushort): longint; cdecl; external libgsl;
function gsl_matrix_ushort_tricpy(Uplo: TCBLAS_UPLO_t; Diag: TCBLAS_DIAG_t; dest: Pgsl_matrix_ushort; src: Pgsl_matrix_ushort): longint; cdecl; external libgsl;
function gsl_matrix_ushort_swap_rows(m: Pgsl_matrix_ushort; i: Tsize_t; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_matrix_ushort_swap_columns(m: Pgsl_matrix_ushort; i: Tsize_t; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_matrix_ushort_swap_rowcol(m: Pgsl_matrix_ushort; i: Tsize_t; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_matrix_ushort_transpose(m: Pgsl_matrix_ushort): longint; cdecl; external libgsl;
function gsl_matrix_ushort_transpose_memcpy(dest: Pgsl_matrix_ushort; src: Pgsl_matrix_ushort): longint; cdecl; external libgsl;
function gsl_matrix_ushort_transpose_tricpy(Uplo_src: TCBLAS_UPLO_t; Diag: TCBLAS_DIAG_t; dest: Pgsl_matrix_ushort; src: Pgsl_matrix_ushort): longint; cdecl; external libgsl;
function gsl_matrix_ushort_max(m: Pgsl_matrix_ushort): word; cdecl; external libgsl;
function gsl_matrix_ushort_min(m: Pgsl_matrix_ushort): word; cdecl; external libgsl;
procedure gsl_matrix_ushort_minmax(m: Pgsl_matrix_ushort; min_out: Pword; max_out: Pword); cdecl; external libgsl;
procedure gsl_matrix_ushort_max_index(m: Pgsl_matrix_ushort; imax: Psize_t; jmax: Psize_t); cdecl; external libgsl;
procedure gsl_matrix_ushort_min_index(m: Pgsl_matrix_ushort; imin: Psize_t; jmin: Psize_t); cdecl; external libgsl;
procedure gsl_matrix_ushort_minmax_index(m: Pgsl_matrix_ushort; imin: Psize_t; jmin: Psize_t; imax: Psize_t; jmax: Psize_t); cdecl; external libgsl;
function gsl_matrix_ushort_equal(a: Pgsl_matrix_ushort; b: Pgsl_matrix_ushort): longint; cdecl; external libgsl;
function gsl_matrix_ushort_isnull(m: Pgsl_matrix_ushort): longint; cdecl; external libgsl;
function gsl_matrix_ushort_ispos(m: Pgsl_matrix_ushort): longint; cdecl; external libgsl;
function gsl_matrix_ushort_isneg(m: Pgsl_matrix_ushort): longint; cdecl; external libgsl;
function gsl_matrix_ushort_isnonneg(m: Pgsl_matrix_ushort): longint; cdecl; external libgsl;
function gsl_matrix_ushort_norm1(m: Pgsl_matrix_ushort): word; cdecl; external libgsl;
function gsl_matrix_ushort_add(a: Pgsl_matrix_ushort; b: Pgsl_matrix_ushort): longint; cdecl; external libgsl;
function gsl_matrix_ushort_sub(a: Pgsl_matrix_ushort; b: Pgsl_matrix_ushort): longint; cdecl; external libgsl;
function gsl_matrix_ushort_mul_elements(a: Pgsl_matrix_ushort; b: Pgsl_matrix_ushort): longint; cdecl; external libgsl;
function gsl_matrix_ushort_div_elements(a: Pgsl_matrix_ushort; b: Pgsl_matrix_ushort): longint; cdecl; external libgsl;
function gsl_matrix_ushort_scale(a: Pgsl_matrix_ushort; x: word): longint; cdecl; external libgsl;
function gsl_matrix_ushort_scale_rows(a: Pgsl_matrix_ushort; x: Pgsl_vector_ushort): longint; cdecl; external libgsl;
function gsl_matrix_ushort_scale_columns(a: Pgsl_matrix_ushort; x: Pgsl_vector_ushort): longint; cdecl; external libgsl;
function gsl_matrix_ushort_add_constant(a: Pgsl_matrix_ushort; x: word): longint; cdecl; external libgsl;
function gsl_matrix_ushort_add_diagonal(a: Pgsl_matrix_ushort; x: word): longint; cdecl; external libgsl;

function gsl_matrix_ushort_get_row(v: Pgsl_vector_ushort; m: Pgsl_matrix_ushort; i: Tsize_t): longint; cdecl; external libgsl;
function gsl_matrix_ushort_get_col(v: Pgsl_vector_ushort; m: Pgsl_matrix_ushort; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_matrix_ushort_set_row(m: Pgsl_matrix_ushort; i: Tsize_t; v: Pgsl_vector_ushort): longint; cdecl; external libgsl;
function gsl_matrix_ushort_set_col(m: Pgsl_matrix_ushort; j: Tsize_t; v: Pgsl_vector_ushort): longint; cdecl; external libgsl;

function gsl_matrix_ushort_get(m: Pgsl_matrix_ushort; i: Tsize_t; j: Tsize_t): word; cdecl; external libgsl;
procedure gsl_matrix_ushort_set(m: Pgsl_matrix_ushort; i: Tsize_t; j: Tsize_t; x: word); cdecl; external libgsl;
function gsl_matrix_ushort_ptr(m: Pgsl_matrix_ushort; i: Tsize_t; j: Tsize_t): Pword; cdecl; external libgsl;
function gsl_matrix_ushort_const_ptr(m: Pgsl_matrix_ushort; i: Tsize_t; j: Tsize_t): Pword; cdecl; external libgsl;

// === Konventiert am: 20-8-25 17:02:07 ===


implementation



end.
