unit gsl_matrix_uchar;

interface

uses
  fp_gsl, gsl_blas_types, gsl_block_uchar, gsl_vector_uchar;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tgsl_matrix_uchar = record
    size1: Tsize_t;
    size2: Tsize_t;
    tda: Tsize_t;
    data: pbyte;
    block: Pgsl_block_uchar;
    owner: longint;
  end;
  Pgsl_matrix_uchar = ^Tgsl_matrix_uchar;

  Tgsl_matrix_uchar_view = record
    matrix: Tgsl_matrix_uchar;
  end;
  Pgsl_matrix_uchar_view = ^Tgsl_matrix_uchar_view;

  Tgsl_matrix_uchar_const_view = record
    matrix: Tgsl_matrix_uchar;
  end;
  Pgsl_matrix_uchar_const_view = ^Tgsl_matrix_uchar_const_view;


function gsl_matrix_uchar_alloc(n1: Tsize_t; n2: Tsize_t): Pgsl_matrix_uchar; cdecl; external libgsl;
function gsl_matrix_uchar_calloc(n1: Tsize_t; n2: Tsize_t): Pgsl_matrix_uchar; cdecl; external libgsl;
function gsl_matrix_uchar_alloc_from_block(b: Pgsl_block_uchar; offset: Tsize_t; n1: Tsize_t; n2: Tsize_t; d2: Tsize_t): Pgsl_matrix_uchar; cdecl; external libgsl;
function gsl_matrix_uchar_alloc_from_matrix(m: Pgsl_matrix_uchar; k1: Tsize_t; k2: Tsize_t; n1: Tsize_t; n2: Tsize_t): Pgsl_matrix_uchar; cdecl; external libgsl;
function gsl_vector_uchar_alloc_row_from_matrix(m: Pgsl_matrix_uchar; i: Tsize_t): Pgsl_vector_uchar; cdecl; external libgsl;
function gsl_vector_uchar_alloc_col_from_matrix(m: Pgsl_matrix_uchar; j: Tsize_t): Pgsl_vector_uchar; cdecl; external libgsl;
procedure gsl_matrix_uchar_free(m: Pgsl_matrix_uchar); cdecl; external libgsl;

function gsl_matrix_uchar_submatrix(m: Pgsl_matrix_uchar; i: Tsize_t; j: Tsize_t; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_uchar_view; cdecl; external libgsl;
function gsl_matrix_uchar_row(m: Pgsl_matrix_uchar; i: Tsize_t): Tgsl_vector_uchar_view; cdecl; external libgsl;
function gsl_matrix_uchar_column(m: Pgsl_matrix_uchar; j: Tsize_t): Tgsl_vector_uchar_view; cdecl; external libgsl;
function gsl_matrix_uchar_diagonal(m: Pgsl_matrix_uchar): Tgsl_vector_uchar_view; cdecl; external libgsl;
function gsl_matrix_uchar_subdiagonal(m: Pgsl_matrix_uchar; k: Tsize_t): Tgsl_vector_uchar_view; cdecl; external libgsl;
function gsl_matrix_uchar_superdiagonal(m: Pgsl_matrix_uchar; k: Tsize_t): Tgsl_vector_uchar_view; cdecl; external libgsl;
function gsl_matrix_uchar_subrow(m: Pgsl_matrix_uchar; i: Tsize_t; offset: Tsize_t; n: Tsize_t): Tgsl_vector_uchar_view; cdecl; external libgsl;
function gsl_matrix_uchar_subcolumn(m: Pgsl_matrix_uchar; j: Tsize_t; offset: Tsize_t; n: Tsize_t): Tgsl_vector_uchar_view; cdecl; external libgsl;
function gsl_matrix_uchar_view_array(base: pbyte; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_uchar_view; cdecl; external libgsl;
function gsl_matrix_uchar_view_array_with_tda(base: pbyte; n1: Tsize_t; n2: Tsize_t; tda: Tsize_t): Tgsl_matrix_uchar_view; cdecl; external libgsl;
function gsl_matrix_uchar_view_vector(v: Pgsl_vector_uchar; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_uchar_view; cdecl; external libgsl;
function gsl_matrix_uchar_view_vector_with_tda(v: Pgsl_vector_uchar; n1: Tsize_t; n2: Tsize_t; tda: Tsize_t): Tgsl_matrix_uchar_view; cdecl; external libgsl;
function gsl_matrix_uchar_const_submatrix(m: Pgsl_matrix_uchar; i: Tsize_t; j: Tsize_t; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_uchar_const_view; cdecl; external libgsl;
function gsl_matrix_uchar_const_row(m: Pgsl_matrix_uchar; i: Tsize_t): Tgsl_vector_uchar_const_view; cdecl; external libgsl;
function gsl_matrix_uchar_const_column(m: Pgsl_matrix_uchar; j: Tsize_t): Tgsl_vector_uchar_const_view; cdecl; external libgsl;
function gsl_matrix_uchar_const_diagonal(m: Pgsl_matrix_uchar): Tgsl_vector_uchar_const_view; cdecl; external libgsl;
function gsl_matrix_uchar_const_subdiagonal(m: Pgsl_matrix_uchar; k: Tsize_t): Tgsl_vector_uchar_const_view; cdecl; external libgsl;
function gsl_matrix_uchar_const_superdiagonal(m: Pgsl_matrix_uchar; k: Tsize_t): Tgsl_vector_uchar_const_view; cdecl; external libgsl;
function gsl_matrix_uchar_const_subrow(m: Pgsl_matrix_uchar; i: Tsize_t; offset: Tsize_t; n: Tsize_t): Tgsl_vector_uchar_const_view; cdecl; external libgsl;
function gsl_matrix_uchar_const_subcolumn(m: Pgsl_matrix_uchar; j: Tsize_t; offset: Tsize_t; n: Tsize_t): Tgsl_vector_uchar_const_view; cdecl; external libgsl;
function gsl_matrix_uchar_const_view_array(base: pbyte; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_uchar_const_view; cdecl; external libgsl;
function gsl_matrix_uchar_const_view_array_with_tda(base: pbyte; n1: Tsize_t; n2: Tsize_t; tda: Tsize_t): Tgsl_matrix_uchar_const_view; cdecl; external libgsl;
function gsl_matrix_uchar_const_view_vector(v: Pgsl_vector_uchar; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_uchar_const_view; cdecl; external libgsl;
function gsl_matrix_uchar_const_view_vector_with_tda(v: Pgsl_vector_uchar; n1: Tsize_t; n2: Tsize_t; tda: Tsize_t): Tgsl_matrix_uchar_const_view; cdecl; external libgsl;

procedure gsl_matrix_uchar_set_zero(m: Pgsl_matrix_uchar); cdecl; external libgsl;
procedure gsl_matrix_uchar_set_identity(m: Pgsl_matrix_uchar); cdecl; external libgsl;
procedure gsl_matrix_uchar_set_all(m: Pgsl_matrix_uchar; x: byte); cdecl; external libgsl;
function gsl_matrix_uchar_fread(stream: PFILE; m: Pgsl_matrix_uchar): longint; cdecl; external libgsl;
function gsl_matrix_uchar_fwrite(stream: PFILE; m: Pgsl_matrix_uchar): longint; cdecl; external libgsl;
function gsl_matrix_uchar_fscanf(stream: PFILE; m: Pgsl_matrix_uchar): longint; cdecl; external libgsl;
function gsl_matrix_uchar_fprintf(stream: PFILE; m: Pgsl_matrix_uchar; format: pchar): longint; cdecl; external libgsl;
function gsl_matrix_uchar_memcpy(dest: Pgsl_matrix_uchar; src: Pgsl_matrix_uchar): longint; cdecl; external libgsl;
function gsl_matrix_uchar_swap(m1: Pgsl_matrix_uchar; m2: Pgsl_matrix_uchar): longint; cdecl; external libgsl;
function gsl_matrix_uchar_tricpy(Uplo: TCBLAS_UPLO_t; Diag: TCBLAS_DIAG_t; dest: Pgsl_matrix_uchar; src: Pgsl_matrix_uchar): longint; cdecl; external libgsl;
function gsl_matrix_uchar_swap_rows(m: Pgsl_matrix_uchar; i: Tsize_t; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_matrix_uchar_swap_columns(m: Pgsl_matrix_uchar; i: Tsize_t; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_matrix_uchar_swap_rowcol(m: Pgsl_matrix_uchar; i: Tsize_t; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_matrix_uchar_transpose(m: Pgsl_matrix_uchar): longint; cdecl; external libgsl;
function gsl_matrix_uchar_transpose_memcpy(dest: Pgsl_matrix_uchar; src: Pgsl_matrix_uchar): longint; cdecl; external libgsl;
function gsl_matrix_uchar_transpose_tricpy(Uplo_src: TCBLAS_UPLO_t; Diag: TCBLAS_DIAG_t; dest: Pgsl_matrix_uchar; src: Pgsl_matrix_uchar): longint; cdecl; external libgsl;
function gsl_matrix_uchar_max(m: Pgsl_matrix_uchar): byte; cdecl; external libgsl;
function gsl_matrix_uchar_min(m: Pgsl_matrix_uchar): byte; cdecl; external libgsl;
procedure gsl_matrix_uchar_minmax(m: Pgsl_matrix_uchar; min_out: pbyte; max_out: pbyte); cdecl; external libgsl;
procedure gsl_matrix_uchar_max_index(m: Pgsl_matrix_uchar; imax: Psize_t; jmax: Psize_t); cdecl; external libgsl;
procedure gsl_matrix_uchar_min_index(m: Pgsl_matrix_uchar; imin: Psize_t; jmin: Psize_t); cdecl; external libgsl;
procedure gsl_matrix_uchar_minmax_index(m: Pgsl_matrix_uchar; imin: Psize_t; jmin: Psize_t; imax: Psize_t; jmax: Psize_t); cdecl; external libgsl;
function gsl_matrix_uchar_equal(a: Pgsl_matrix_uchar; b: Pgsl_matrix_uchar): longint; cdecl; external libgsl;
function gsl_matrix_uchar_isnull(m: Pgsl_matrix_uchar): longint; cdecl; external libgsl;
function gsl_matrix_uchar_ispos(m: Pgsl_matrix_uchar): longint; cdecl; external libgsl;
function gsl_matrix_uchar_isneg(m: Pgsl_matrix_uchar): longint; cdecl; external libgsl;
function gsl_matrix_uchar_isnonneg(m: Pgsl_matrix_uchar): longint; cdecl; external libgsl;
function gsl_matrix_uchar_norm1(m: Pgsl_matrix_uchar): byte; cdecl; external libgsl;
function gsl_matrix_uchar_add(a: Pgsl_matrix_uchar; b: Pgsl_matrix_uchar): longint; cdecl; external libgsl;
function gsl_matrix_uchar_sub(a: Pgsl_matrix_uchar; b: Pgsl_matrix_uchar): longint; cdecl; external libgsl;
function gsl_matrix_uchar_mul_elements(a: Pgsl_matrix_uchar; b: Pgsl_matrix_uchar): longint; cdecl; external libgsl;
function gsl_matrix_uchar_div_elements(a: Pgsl_matrix_uchar; b: Pgsl_matrix_uchar): longint; cdecl; external libgsl;
function gsl_matrix_uchar_scale(a: Pgsl_matrix_uchar; x: byte): longint; cdecl; external libgsl;
function gsl_matrix_uchar_scale_rows(a: Pgsl_matrix_uchar; x: Pgsl_vector_uchar): longint; cdecl; external libgsl;
function gsl_matrix_uchar_scale_columns(a: Pgsl_matrix_uchar; x: Pgsl_vector_uchar): longint; cdecl; external libgsl;
function gsl_matrix_uchar_add_constant(a: Pgsl_matrix_uchar; x: byte): longint; cdecl; external libgsl;
function gsl_matrix_uchar_add_diagonal(a: Pgsl_matrix_uchar; x: byte): longint; cdecl; external libgsl;

function gsl_matrix_uchar_get_row(v: Pgsl_vector_uchar; m: Pgsl_matrix_uchar; i: Tsize_t): longint; cdecl; external libgsl;
function gsl_matrix_uchar_get_col(v: Pgsl_vector_uchar; m: Pgsl_matrix_uchar; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_matrix_uchar_set_row(m: Pgsl_matrix_uchar; i: Tsize_t; v: Pgsl_vector_uchar): longint; cdecl; external libgsl;
function gsl_matrix_uchar_set_col(m: Pgsl_matrix_uchar; j: Tsize_t; v: Pgsl_vector_uchar): longint; cdecl; external libgsl;

function gsl_matrix_uchar_get(m: Pgsl_matrix_uchar; i: Tsize_t; j: Tsize_t): byte; cdecl; external libgsl;
procedure gsl_matrix_uchar_set(m: Pgsl_matrix_uchar; i: Tsize_t; j: Tsize_t; x: byte); cdecl; external libgsl;
function gsl_matrix_uchar_ptr(m: Pgsl_matrix_uchar; i: Tsize_t; j: Tsize_t): pbyte; cdecl; external libgsl;
function gsl_matrix_uchar_const_ptr(m: Pgsl_matrix_uchar; i: Tsize_t; j: Tsize_t): pbyte; cdecl; external libgsl;

// === Konventiert am: 20-8-25 17:01:59 ===


implementation



end.
