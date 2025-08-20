unit gsl_matrix_char;

interface

uses
  fp_gsl, gsl_blas_types, gsl_block_char, gsl_vector_char;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tgsl_matrix_char = record
    size1: Tsize_t;
    size2: Tsize_t;
    tda: Tsize_t;
    data: pchar;
    block: Pgsl_block_char;
    owner: longint;
  end;
  Pgsl_matrix_char = ^Tgsl_matrix_char;

  Tgsl_matrix_char_view = record
    matrix: Tgsl_matrix_char;
  end;
  Pgsl_matrix_char_view = ^Tgsl_matrix_char_view;

  Tgsl_matrix_char_const_view = record
    matrix: Tgsl_matrix_char;
  end;
  Pgsl_matrix_char_const_view = ^Tgsl_matrix_char_const_view;


function gsl_matrix_char_alloc(n1: Tsize_t; n2: Tsize_t): Pgsl_matrix_char; cdecl; external libgsl;
function gsl_matrix_char_calloc(n1: Tsize_t; n2: Tsize_t): Pgsl_matrix_char; cdecl; external libgsl;
function gsl_matrix_char_alloc_from_block(b: Pgsl_block_char; offset: Tsize_t; n1: Tsize_t; n2: Tsize_t; d2: Tsize_t): Pgsl_matrix_char; cdecl; external libgsl;
function gsl_matrix_char_alloc_from_matrix(m: Pgsl_matrix_char; k1: Tsize_t; k2: Tsize_t; n1: Tsize_t; n2: Tsize_t): Pgsl_matrix_char; cdecl; external libgsl;
function gsl_vector_char_alloc_row_from_matrix(m: Pgsl_matrix_char; i: Tsize_t): Pgsl_vector_char; cdecl; external libgsl;
function gsl_vector_char_alloc_col_from_matrix(m: Pgsl_matrix_char; j: Tsize_t): Pgsl_vector_char; cdecl; external libgsl;
procedure gsl_matrix_char_free(m: Pgsl_matrix_char); cdecl; external libgsl;

function gsl_matrix_char_submatrix(m: Pgsl_matrix_char; i: Tsize_t; j: Tsize_t; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_char_view; cdecl; external libgsl;
function gsl_matrix_char_row(m: Pgsl_matrix_char; i: Tsize_t): Tgsl_vector_char_view; cdecl; external libgsl;
function gsl_matrix_char_column(m: Pgsl_matrix_char; j: Tsize_t): Tgsl_vector_char_view; cdecl; external libgsl;
function gsl_matrix_char_diagonal(m: Pgsl_matrix_char): Tgsl_vector_char_view; cdecl; external libgsl;
function gsl_matrix_char_subdiagonal(m: Pgsl_matrix_char; k: Tsize_t): Tgsl_vector_char_view; cdecl; external libgsl;
function gsl_matrix_char_superdiagonal(m: Pgsl_matrix_char; k: Tsize_t): Tgsl_vector_char_view; cdecl; external libgsl;
function gsl_matrix_char_subrow(m: Pgsl_matrix_char; i: Tsize_t; offset: Tsize_t; n: Tsize_t): Tgsl_vector_char_view; cdecl; external libgsl;
function gsl_matrix_char_subcolumn(m: Pgsl_matrix_char; j: Tsize_t; offset: Tsize_t; n: Tsize_t): Tgsl_vector_char_view; cdecl; external libgsl;
function gsl_matrix_char_view_array(base: pchar; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_char_view; cdecl; external libgsl;
function gsl_matrix_char_view_array_with_tda(base: pchar; n1: Tsize_t; n2: Tsize_t; tda: Tsize_t): Tgsl_matrix_char_view; cdecl; external libgsl;
function gsl_matrix_char_view_vector(v: Pgsl_vector_char; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_char_view; cdecl; external libgsl;
function gsl_matrix_char_view_vector_with_tda(v: Pgsl_vector_char; n1: Tsize_t; n2: Tsize_t; tda: Tsize_t): Tgsl_matrix_char_view; cdecl; external libgsl;
function gsl_matrix_char_const_submatrix(m: Pgsl_matrix_char; i: Tsize_t; j: Tsize_t; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_char_const_view; cdecl; external libgsl;
function gsl_matrix_char_const_row(m: Pgsl_matrix_char; i: Tsize_t): Tgsl_vector_char_const_view; cdecl; external libgsl;
function gsl_matrix_char_const_column(m: Pgsl_matrix_char; j: Tsize_t): Tgsl_vector_char_const_view; cdecl; external libgsl;
function gsl_matrix_char_const_diagonal(m: Pgsl_matrix_char): Tgsl_vector_char_const_view; cdecl; external libgsl;
function gsl_matrix_char_const_subdiagonal(m: Pgsl_matrix_char; k: Tsize_t): Tgsl_vector_char_const_view; cdecl; external libgsl;
function gsl_matrix_char_const_superdiagonal(m: Pgsl_matrix_char; k: Tsize_t): Tgsl_vector_char_const_view; cdecl; external libgsl;
function gsl_matrix_char_const_subrow(m: Pgsl_matrix_char; i: Tsize_t; offset: Tsize_t; n: Tsize_t): Tgsl_vector_char_const_view; cdecl; external libgsl;
function gsl_matrix_char_const_subcolumn(m: Pgsl_matrix_char; j: Tsize_t; offset: Tsize_t; n: Tsize_t): Tgsl_vector_char_const_view; cdecl; external libgsl;
function gsl_matrix_char_const_view_array(base: pchar; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_char_const_view; cdecl; external libgsl;
function gsl_matrix_char_const_view_array_with_tda(base: pchar; n1: Tsize_t; n2: Tsize_t; tda: Tsize_t): Tgsl_matrix_char_const_view; cdecl; external libgsl;
function gsl_matrix_char_const_view_vector(v: Pgsl_vector_char; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_char_const_view; cdecl; external libgsl;
function gsl_matrix_char_const_view_vector_with_tda(v: Pgsl_vector_char; n1: Tsize_t; n2: Tsize_t; tda: Tsize_t): Tgsl_matrix_char_const_view; cdecl; external libgsl;

procedure gsl_matrix_char_set_zero(m: Pgsl_matrix_char); cdecl; external libgsl;
procedure gsl_matrix_char_set_identity(m: Pgsl_matrix_char); cdecl; external libgsl;
procedure gsl_matrix_char_set_all(m: Pgsl_matrix_char; x: char); cdecl; external libgsl;
function gsl_matrix_char_fread(stream: PFILE; m: Pgsl_matrix_char): longint; cdecl; external libgsl;
function gsl_matrix_char_fwrite(stream: PFILE; m: Pgsl_matrix_char): longint; cdecl; external libgsl;
function gsl_matrix_char_fscanf(stream: PFILE; m: Pgsl_matrix_char): longint; cdecl; external libgsl;
function gsl_matrix_char_fprintf(stream: PFILE; m: Pgsl_matrix_char; format: pchar): longint; cdecl; external libgsl;
function gsl_matrix_char_memcpy(dest: Pgsl_matrix_char; src: Pgsl_matrix_char): longint; cdecl; external libgsl;
function gsl_matrix_char_swap(m1: Pgsl_matrix_char; m2: Pgsl_matrix_char): longint; cdecl; external libgsl;
function gsl_matrix_char_tricpy(Uplo: TCBLAS_UPLO_t; Diag: TCBLAS_DIAG_t; dest: Pgsl_matrix_char; src: Pgsl_matrix_char): longint; cdecl; external libgsl;
function gsl_matrix_char_swap_rows(m: Pgsl_matrix_char; i: Tsize_t; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_matrix_char_swap_columns(m: Pgsl_matrix_char; i: Tsize_t; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_matrix_char_swap_rowcol(m: Pgsl_matrix_char; i: Tsize_t; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_matrix_char_transpose(m: Pgsl_matrix_char): longint; cdecl; external libgsl;
function gsl_matrix_char_transpose_memcpy(dest: Pgsl_matrix_char; src: Pgsl_matrix_char): longint; cdecl; external libgsl;
function gsl_matrix_char_transpose_tricpy(Uplo_src: TCBLAS_UPLO_t; Diag: TCBLAS_DIAG_t; dest: Pgsl_matrix_char; src: Pgsl_matrix_char): longint; cdecl; external libgsl;
function gsl_matrix_char_max(m: Pgsl_matrix_char): char; cdecl; external libgsl;
function gsl_matrix_char_min(m: Pgsl_matrix_char): char; cdecl; external libgsl;
procedure gsl_matrix_char_minmax(m: Pgsl_matrix_char; min_out: pchar; max_out: pchar); cdecl; external libgsl;
procedure gsl_matrix_char_max_index(m: Pgsl_matrix_char; imax: Psize_t; jmax: Psize_t); cdecl; external libgsl;
procedure gsl_matrix_char_min_index(m: Pgsl_matrix_char; imin: Psize_t; jmin: Psize_t); cdecl; external libgsl;
procedure gsl_matrix_char_minmax_index(m: Pgsl_matrix_char; imin: Psize_t; jmin: Psize_t; imax: Psize_t; jmax: Psize_t); cdecl; external libgsl;
function gsl_matrix_char_equal(a: Pgsl_matrix_char; b: Pgsl_matrix_char): longint; cdecl; external libgsl;
function gsl_matrix_char_isnull(m: Pgsl_matrix_char): longint; cdecl; external libgsl;
function gsl_matrix_char_ispos(m: Pgsl_matrix_char): longint; cdecl; external libgsl;
function gsl_matrix_char_isneg(m: Pgsl_matrix_char): longint; cdecl; external libgsl;
function gsl_matrix_char_isnonneg(m: Pgsl_matrix_char): longint; cdecl; external libgsl;
function gsl_matrix_char_norm1(m: Pgsl_matrix_char): char; cdecl; external libgsl;
function gsl_matrix_char_add(a: Pgsl_matrix_char; b: Pgsl_matrix_char): longint; cdecl; external libgsl;
function gsl_matrix_char_sub(a: Pgsl_matrix_char; b: Pgsl_matrix_char): longint; cdecl; external libgsl;
function gsl_matrix_char_mul_elements(a: Pgsl_matrix_char; b: Pgsl_matrix_char): longint; cdecl; external libgsl;
function gsl_matrix_char_div_elements(a: Pgsl_matrix_char; b: Pgsl_matrix_char): longint; cdecl; external libgsl;
function gsl_matrix_char_scale(a: Pgsl_matrix_char; x: char): longint; cdecl; external libgsl;
function gsl_matrix_char_scale_rows(a: Pgsl_matrix_char; x: Pgsl_vector_char): longint; cdecl; external libgsl;
function gsl_matrix_char_scale_columns(a: Pgsl_matrix_char; x: Pgsl_vector_char): longint; cdecl; external libgsl;
function gsl_matrix_char_add_constant(a: Pgsl_matrix_char; x: char): longint; cdecl; external libgsl;
function gsl_matrix_char_add_diagonal(a: Pgsl_matrix_char; x: char): longint; cdecl; external libgsl;

function gsl_matrix_char_get_row(v: Pgsl_vector_char; m: Pgsl_matrix_char; i: Tsize_t): longint; cdecl; external libgsl;
function gsl_matrix_char_get_col(v: Pgsl_vector_char; m: Pgsl_matrix_char; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_matrix_char_set_row(m: Pgsl_matrix_char; i: Tsize_t; v: Pgsl_vector_char): longint; cdecl; external libgsl;
function gsl_matrix_char_set_col(m: Pgsl_matrix_char; j: Tsize_t; v: Pgsl_vector_char): longint; cdecl; external libgsl;

function gsl_matrix_char_get(m: Pgsl_matrix_char; i: Tsize_t; j: Tsize_t): char; cdecl; external libgsl;
procedure gsl_matrix_char_set(m: Pgsl_matrix_char; i: Tsize_t; j: Tsize_t; x: char); cdecl; external libgsl;
function gsl_matrix_char_ptr(m: Pgsl_matrix_char; i: Tsize_t; j: Tsize_t): pchar; cdecl; external libgsl;
function gsl_matrix_char_const_ptr(m: Pgsl_matrix_char; i: Tsize_t; j: Tsize_t): pchar; cdecl; external libgsl;

// === Konventiert am: 20-8-25 17:01:49 ===


implementation



end.
