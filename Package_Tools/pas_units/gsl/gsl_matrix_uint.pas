unit gsl_matrix_uint;

interface

uses
  fp_gsl, gsl_blas_types, gsl_block_uint, gsl_vector_uint;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tgsl_matrix_uint = record
    size1: Tsize_t;
    size2: Tsize_t;
    tda: Tsize_t;
    data: Pdword;
    block: Pgsl_block_uint;
    owner: longint;
  end;
  Pgsl_matrix_uint = ^Tgsl_matrix_uint;

  Tgsl_matrix_uint_view = record
    matrix: Tgsl_matrix_uint;
  end;
  Pgsl_matrix_uint_view = ^Tgsl_matrix_uint_view;

  Tgsl_matrix_uint_const_view = record
    matrix: Tgsl_matrix_uint;
  end;
  Pgsl_matrix_uint_const_view = ^Tgsl_matrix_uint_const_view;


function gsl_matrix_uint_alloc(n1: Tsize_t; n2: Tsize_t): Pgsl_matrix_uint; cdecl; external libgsl;
function gsl_matrix_uint_calloc(n1: Tsize_t; n2: Tsize_t): Pgsl_matrix_uint; cdecl; external libgsl;
function gsl_matrix_uint_alloc_from_block(b: Pgsl_block_uint; offset: Tsize_t; n1: Tsize_t; n2: Tsize_t; d2: Tsize_t): Pgsl_matrix_uint; cdecl; external libgsl;
function gsl_matrix_uint_alloc_from_matrix(m: Pgsl_matrix_uint; k1: Tsize_t; k2: Tsize_t; n1: Tsize_t; n2: Tsize_t): Pgsl_matrix_uint; cdecl; external libgsl;
function gsl_vector_uint_alloc_row_from_matrix(m: Pgsl_matrix_uint; i: Tsize_t): Pgsl_vector_uint; cdecl; external libgsl;
function gsl_vector_uint_alloc_col_from_matrix(m: Pgsl_matrix_uint; j: Tsize_t): Pgsl_vector_uint; cdecl; external libgsl;
procedure gsl_matrix_uint_free(m: Pgsl_matrix_uint); cdecl; external libgsl;

function gsl_matrix_uint_submatrix(m: Pgsl_matrix_uint; i: Tsize_t; j: Tsize_t; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_uint_view; cdecl; external libgsl;
function gsl_matrix_uint_row(m: Pgsl_matrix_uint; i: Tsize_t): Tgsl_vector_uint_view; cdecl; external libgsl;
function gsl_matrix_uint_column(m: Pgsl_matrix_uint; j: Tsize_t): Tgsl_vector_uint_view; cdecl; external libgsl;
function gsl_matrix_uint_diagonal(m: Pgsl_matrix_uint): Tgsl_vector_uint_view; cdecl; external libgsl;
function gsl_matrix_uint_subdiagonal(m: Pgsl_matrix_uint; k: Tsize_t): Tgsl_vector_uint_view; cdecl; external libgsl;
function gsl_matrix_uint_superdiagonal(m: Pgsl_matrix_uint; k: Tsize_t): Tgsl_vector_uint_view; cdecl; external libgsl;
function gsl_matrix_uint_subrow(m: Pgsl_matrix_uint; i: Tsize_t; offset: Tsize_t; n: Tsize_t): Tgsl_vector_uint_view; cdecl; external libgsl;
function gsl_matrix_uint_subcolumn(m: Pgsl_matrix_uint; j: Tsize_t; offset: Tsize_t; n: Tsize_t): Tgsl_vector_uint_view; cdecl; external libgsl;
function gsl_matrix_uint_view_array(base: Pdword; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_uint_view; cdecl; external libgsl;
function gsl_matrix_uint_view_array_with_tda(base: Pdword; n1: Tsize_t; n2: Tsize_t; tda: Tsize_t): Tgsl_matrix_uint_view; cdecl; external libgsl;
function gsl_matrix_uint_view_vector(v: Pgsl_vector_uint; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_uint_view; cdecl; external libgsl;
function gsl_matrix_uint_view_vector_with_tda(v: Pgsl_vector_uint; n1: Tsize_t; n2: Tsize_t; tda: Tsize_t): Tgsl_matrix_uint_view; cdecl; external libgsl;
function gsl_matrix_uint_const_submatrix(m: Pgsl_matrix_uint; i: Tsize_t; j: Tsize_t; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_uint_const_view; cdecl; external libgsl;
function gsl_matrix_uint_const_row(m: Pgsl_matrix_uint; i: Tsize_t): Tgsl_vector_uint_const_view; cdecl; external libgsl;
function gsl_matrix_uint_const_column(m: Pgsl_matrix_uint; j: Tsize_t): Tgsl_vector_uint_const_view; cdecl; external libgsl;
function gsl_matrix_uint_const_diagonal(m: Pgsl_matrix_uint): Tgsl_vector_uint_const_view; cdecl; external libgsl;
function gsl_matrix_uint_const_subdiagonal(m: Pgsl_matrix_uint; k: Tsize_t): Tgsl_vector_uint_const_view; cdecl; external libgsl;
function gsl_matrix_uint_const_superdiagonal(m: Pgsl_matrix_uint; k: Tsize_t): Tgsl_vector_uint_const_view; cdecl; external libgsl;
function gsl_matrix_uint_const_subrow(m: Pgsl_matrix_uint; i: Tsize_t; offset: Tsize_t; n: Tsize_t): Tgsl_vector_uint_const_view; cdecl; external libgsl;
function gsl_matrix_uint_const_subcolumn(m: Pgsl_matrix_uint; j: Tsize_t; offset: Tsize_t; n: Tsize_t): Tgsl_vector_uint_const_view; cdecl; external libgsl;
function gsl_matrix_uint_const_view_array(base: Pdword; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_uint_const_view; cdecl; external libgsl;
function gsl_matrix_uint_const_view_array_with_tda(base: Pdword; n1: Tsize_t; n2: Tsize_t; tda: Tsize_t): Tgsl_matrix_uint_const_view; cdecl; external libgsl;
function gsl_matrix_uint_const_view_vector(v: Pgsl_vector_uint; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_uint_const_view; cdecl; external libgsl;
function gsl_matrix_uint_const_view_vector_with_tda(v: Pgsl_vector_uint; n1: Tsize_t; n2: Tsize_t; tda: Tsize_t): Tgsl_matrix_uint_const_view; cdecl; external libgsl;

procedure gsl_matrix_uint_set_zero(m: Pgsl_matrix_uint); cdecl; external libgsl;
procedure gsl_matrix_uint_set_identity(m: Pgsl_matrix_uint); cdecl; external libgsl;
procedure gsl_matrix_uint_set_all(m: Pgsl_matrix_uint; x: dword); cdecl; external libgsl;
function gsl_matrix_uint_fread(stream: PFILE; m: Pgsl_matrix_uint): longint; cdecl; external libgsl;
function gsl_matrix_uint_fwrite(stream: PFILE; m: Pgsl_matrix_uint): longint; cdecl; external libgsl;
function gsl_matrix_uint_fscanf(stream: PFILE; m: Pgsl_matrix_uint): longint; cdecl; external libgsl;
function gsl_matrix_uint_fprintf(stream: PFILE; m: Pgsl_matrix_uint; format: pchar): longint; cdecl; external libgsl;
function gsl_matrix_uint_memcpy(dest: Pgsl_matrix_uint; src: Pgsl_matrix_uint): longint; cdecl; external libgsl;
function gsl_matrix_uint_swap(m1: Pgsl_matrix_uint; m2: Pgsl_matrix_uint): longint; cdecl; external libgsl;
function gsl_matrix_uint_tricpy(Uplo: TCBLAS_UPLO_t; Diag: TCBLAS_DIAG_t; dest: Pgsl_matrix_uint; src: Pgsl_matrix_uint): longint; cdecl; external libgsl;
function gsl_matrix_uint_swap_rows(m: Pgsl_matrix_uint; i: Tsize_t; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_matrix_uint_swap_columns(m: Pgsl_matrix_uint; i: Tsize_t; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_matrix_uint_swap_rowcol(m: Pgsl_matrix_uint; i: Tsize_t; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_matrix_uint_transpose(m: Pgsl_matrix_uint): longint; cdecl; external libgsl;
function gsl_matrix_uint_transpose_memcpy(dest: Pgsl_matrix_uint; src: Pgsl_matrix_uint): longint; cdecl; external libgsl;
function gsl_matrix_uint_transpose_tricpy(Uplo_src: TCBLAS_UPLO_t; Diag: TCBLAS_DIAG_t; dest: Pgsl_matrix_uint; src: Pgsl_matrix_uint): longint; cdecl; external libgsl;
function gsl_matrix_uint_max(m: Pgsl_matrix_uint): dword; cdecl; external libgsl;
function gsl_matrix_uint_min(m: Pgsl_matrix_uint): dword; cdecl; external libgsl;
procedure gsl_matrix_uint_minmax(m: Pgsl_matrix_uint; min_out: Pdword; max_out: Pdword); cdecl; external libgsl;
procedure gsl_matrix_uint_max_index(m: Pgsl_matrix_uint; imax: Psize_t; jmax: Psize_t); cdecl; external libgsl;
procedure gsl_matrix_uint_min_index(m: Pgsl_matrix_uint; imin: Psize_t; jmin: Psize_t); cdecl; external libgsl;
procedure gsl_matrix_uint_minmax_index(m: Pgsl_matrix_uint; imin: Psize_t; jmin: Psize_t; imax: Psize_t; jmax: Psize_t); cdecl; external libgsl;
function gsl_matrix_uint_equal(a: Pgsl_matrix_uint; b: Pgsl_matrix_uint): longint; cdecl; external libgsl;
function gsl_matrix_uint_isnull(m: Pgsl_matrix_uint): longint; cdecl; external libgsl;
function gsl_matrix_uint_ispos(m: Pgsl_matrix_uint): longint; cdecl; external libgsl;
function gsl_matrix_uint_isneg(m: Pgsl_matrix_uint): longint; cdecl; external libgsl;
function gsl_matrix_uint_isnonneg(m: Pgsl_matrix_uint): longint; cdecl; external libgsl;
function gsl_matrix_uint_norm1(m: Pgsl_matrix_uint): dword; cdecl; external libgsl;
function gsl_matrix_uint_add(a: Pgsl_matrix_uint; b: Pgsl_matrix_uint): longint; cdecl; external libgsl;
function gsl_matrix_uint_sub(a: Pgsl_matrix_uint; b: Pgsl_matrix_uint): longint; cdecl; external libgsl;
function gsl_matrix_uint_mul_elements(a: Pgsl_matrix_uint; b: Pgsl_matrix_uint): longint; cdecl; external libgsl;
function gsl_matrix_uint_div_elements(a: Pgsl_matrix_uint; b: Pgsl_matrix_uint): longint; cdecl; external libgsl;
function gsl_matrix_uint_scale(a: Pgsl_matrix_uint; x: dword): longint; cdecl; external libgsl;
function gsl_matrix_uint_scale_rows(a: Pgsl_matrix_uint; x: Pgsl_vector_uint): longint; cdecl; external libgsl;
function gsl_matrix_uint_scale_columns(a: Pgsl_matrix_uint; x: Pgsl_vector_uint): longint; cdecl; external libgsl;
function gsl_matrix_uint_add_constant(a: Pgsl_matrix_uint; x: dword): longint; cdecl; external libgsl;
function gsl_matrix_uint_add_diagonal(a: Pgsl_matrix_uint; x: dword): longint; cdecl; external libgsl;

function gsl_matrix_uint_get_row(v: Pgsl_vector_uint; m: Pgsl_matrix_uint; i: Tsize_t): longint; cdecl; external libgsl;
function gsl_matrix_uint_get_col(v: Pgsl_vector_uint; m: Pgsl_matrix_uint; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_matrix_uint_set_row(m: Pgsl_matrix_uint; i: Tsize_t; v: Pgsl_vector_uint): longint; cdecl; external libgsl;
function gsl_matrix_uint_set_col(m: Pgsl_matrix_uint; j: Tsize_t; v: Pgsl_vector_uint): longint; cdecl; external libgsl;

function gsl_matrix_uint_get(m: Pgsl_matrix_uint; i: Tsize_t; j: Tsize_t): dword; cdecl; external libgsl;
procedure gsl_matrix_uint_set(m: Pgsl_matrix_uint; i: Tsize_t; j: Tsize_t; x: dword); cdecl; external libgsl;
function gsl_matrix_uint_ptr(m: Pgsl_matrix_uint; i: Tsize_t; j: Tsize_t): Pdword; cdecl; external libgsl;
function gsl_matrix_uint_const_ptr(m: Pgsl_matrix_uint; i: Tsize_t; j: Tsize_t): Pdword; cdecl; external libgsl;

// === Konventiert am: 20-8-25 17:02:02 ===


implementation



end.
