{$IFDEF read_interface}


type
  Tgsl_matrix_long = record
    size1: Tsize_t;
    size2: Tsize_t;
    tda: Tsize_t;
    data: Plongint;
    block: Pgsl_block_long;
    owner: longint;
  end;
  Pgsl_matrix_long = ^Tgsl_matrix_long;

  Tgsl_matrix_long_view = record
    matrix: Tgsl_matrix_long;
  end;
  Pgsl_matrix_long_view = ^Tgsl_matrix_long_view;

  Tgsl_matrix_long_const_view = record
    matrix: Tgsl_matrix_long;
  end;
  Pgsl_matrix_long_const_view = ^Tgsl_matrix_long_const_view;


function gsl_matrix_long_alloc(n1: Tsize_t; n2: Tsize_t): Pgsl_matrix_long; cdecl; external libgsl;
function gsl_matrix_long_calloc(n1: Tsize_t; n2: Tsize_t): Pgsl_matrix_long; cdecl; external libgsl;
function gsl_matrix_long_alloc_from_block(b: Pgsl_block_long; offset: Tsize_t; n1: Tsize_t; n2: Tsize_t; d2: Tsize_t): Pgsl_matrix_long; cdecl; external libgsl;
function gsl_matrix_long_alloc_from_matrix(m: Pgsl_matrix_long; k1: Tsize_t; k2: Tsize_t; n1: Tsize_t; n2: Tsize_t): Pgsl_matrix_long; cdecl; external libgsl;
function gsl_vector_long_alloc_row_from_matrix(m: Pgsl_matrix_long; i: Tsize_t): Pgsl_vector_long; cdecl; external libgsl;
function gsl_vector_long_alloc_col_from_matrix(m: Pgsl_matrix_long; j: Tsize_t): Pgsl_vector_long; cdecl; external libgsl;
procedure gsl_matrix_long_free(m: Pgsl_matrix_long); cdecl; external libgsl;

function gsl_matrix_long_submatrix(m: Pgsl_matrix_long; i: Tsize_t; j: Tsize_t; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_long_view; cdecl; external libgsl;
function gsl_matrix_long_row(m: Pgsl_matrix_long; i: Tsize_t): Tgsl_vector_long_view; cdecl; external libgsl;
function gsl_matrix_long_column(m: Pgsl_matrix_long; j: Tsize_t): Tgsl_vector_long_view; cdecl; external libgsl;
function gsl_matrix_long_diagonal(m: Pgsl_matrix_long): Tgsl_vector_long_view; cdecl; external libgsl;
function gsl_matrix_long_subdiagonal(m: Pgsl_matrix_long; k: Tsize_t): Tgsl_vector_long_view; cdecl; external libgsl;
function gsl_matrix_long_superdiagonal(m: Pgsl_matrix_long; k: Tsize_t): Tgsl_vector_long_view; cdecl; external libgsl;
function gsl_matrix_long_subrow(m: Pgsl_matrix_long; i: Tsize_t; offset: Tsize_t; n: Tsize_t): Tgsl_vector_long_view; cdecl; external libgsl;
function gsl_matrix_long_subcolumn(m: Pgsl_matrix_long; j: Tsize_t; offset: Tsize_t; n: Tsize_t): Tgsl_vector_long_view; cdecl; external libgsl;
function gsl_matrix_long_view_array(base: Plongint; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_long_view; cdecl; external libgsl;
function gsl_matrix_long_view_array_with_tda(base: Plongint; n1: Tsize_t; n2: Tsize_t; tda: Tsize_t): Tgsl_matrix_long_view; cdecl; external libgsl;
function gsl_matrix_long_view_vector(v: Pgsl_vector_long; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_long_view; cdecl; external libgsl;
function gsl_matrix_long_view_vector_with_tda(v: Pgsl_vector_long; n1: Tsize_t; n2: Tsize_t; tda: Tsize_t): Tgsl_matrix_long_view; cdecl; external libgsl;
function gsl_matrix_long_const_submatrix(m: Pgsl_matrix_long; i: Tsize_t; j: Tsize_t; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_long_const_view; cdecl; external libgsl;
function gsl_matrix_long_const_row(m: Pgsl_matrix_long; i: Tsize_t): Tgsl_vector_long_const_view; cdecl; external libgsl;
function gsl_matrix_long_const_column(m: Pgsl_matrix_long; j: Tsize_t): Tgsl_vector_long_const_view; cdecl; external libgsl;
function gsl_matrix_long_const_diagonal(m: Pgsl_matrix_long): Tgsl_vector_long_const_view; cdecl; external libgsl;
function gsl_matrix_long_const_subdiagonal(m: Pgsl_matrix_long; k: Tsize_t): Tgsl_vector_long_const_view; cdecl; external libgsl;
function gsl_matrix_long_const_superdiagonal(m: Pgsl_matrix_long; k: Tsize_t): Tgsl_vector_long_const_view; cdecl; external libgsl;
function gsl_matrix_long_const_subrow(m: Pgsl_matrix_long; i: Tsize_t; offset: Tsize_t; n: Tsize_t): Tgsl_vector_long_const_view; cdecl; external libgsl;
function gsl_matrix_long_const_subcolumn(m: Pgsl_matrix_long; j: Tsize_t; offset: Tsize_t; n: Tsize_t): Tgsl_vector_long_const_view; cdecl; external libgsl;
function gsl_matrix_long_const_view_array(base: Plongint; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_long_const_view; cdecl; external libgsl;
function gsl_matrix_long_const_view_array_with_tda(base: Plongint; n1: Tsize_t; n2: Tsize_t; tda: Tsize_t): Tgsl_matrix_long_const_view; cdecl; external libgsl;
function gsl_matrix_long_const_view_vector(v: Pgsl_vector_long; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_long_const_view; cdecl; external libgsl;
function gsl_matrix_long_const_view_vector_with_tda(v: Pgsl_vector_long; n1: Tsize_t; n2: Tsize_t; tda: Tsize_t): Tgsl_matrix_long_const_view; cdecl; external libgsl;

procedure gsl_matrix_long_set_zero(m: Pgsl_matrix_long); cdecl; external libgsl;
procedure gsl_matrix_long_set_identity(m: Pgsl_matrix_long); cdecl; external libgsl;
procedure gsl_matrix_long_set_all(m: Pgsl_matrix_long; x: longint); cdecl; external libgsl;
function gsl_matrix_long_fread(stream: PFILE; m: Pgsl_matrix_long): longint; cdecl; external libgsl;
function gsl_matrix_long_fwrite(stream: PFILE; m: Pgsl_matrix_long): longint; cdecl; external libgsl;
function gsl_matrix_long_fscanf(stream: PFILE; m: Pgsl_matrix_long): longint; cdecl; external libgsl;
function gsl_matrix_long_fprintf(stream: PFILE; m: Pgsl_matrix_long; format: pchar): longint; cdecl; external libgsl;
function gsl_matrix_long_memcpy(dest: Pgsl_matrix_long; src: Pgsl_matrix_long): longint; cdecl; external libgsl;
function gsl_matrix_long_swap(m1: Pgsl_matrix_long; m2: Pgsl_matrix_long): longint; cdecl; external libgsl;
function gsl_matrix_long_tricpy(Uplo: TCBLAS_UPLO_t; Diag: TCBLAS_DIAG_t; dest: Pgsl_matrix_long; src: Pgsl_matrix_long): longint; cdecl; external libgsl;
function gsl_matrix_long_swap_rows(m: Pgsl_matrix_long; i: Tsize_t; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_matrix_long_swap_columns(m: Pgsl_matrix_long; i: Tsize_t; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_matrix_long_swap_rowcol(m: Pgsl_matrix_long; i: Tsize_t; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_matrix_long_transpose(m: Pgsl_matrix_long): longint; cdecl; external libgsl;
function gsl_matrix_long_transpose_memcpy(dest: Pgsl_matrix_long; src: Pgsl_matrix_long): longint; cdecl; external libgsl;
function gsl_matrix_long_transpose_tricpy(Uplo_src: TCBLAS_UPLO_t; Diag: TCBLAS_DIAG_t; dest: Pgsl_matrix_long; src: Pgsl_matrix_long): longint; cdecl; external libgsl;
function gsl_matrix_long_max(m: Pgsl_matrix_long): longint; cdecl; external libgsl;
function gsl_matrix_long_min(m: Pgsl_matrix_long): longint; cdecl; external libgsl;
procedure gsl_matrix_long_minmax(m: Pgsl_matrix_long; min_out: Plongint; max_out: Plongint); cdecl; external libgsl;
procedure gsl_matrix_long_max_index(m: Pgsl_matrix_long; imax: Psize_t; jmax: Psize_t); cdecl; external libgsl;
procedure gsl_matrix_long_min_index(m: Pgsl_matrix_long; imin: Psize_t; jmin: Psize_t); cdecl; external libgsl;
procedure gsl_matrix_long_minmax_index(m: Pgsl_matrix_long; imin: Psize_t; jmin: Psize_t; imax: Psize_t; jmax: Psize_t); cdecl; external libgsl;
function gsl_matrix_long_equal(a: Pgsl_matrix_long; b: Pgsl_matrix_long): longint; cdecl; external libgsl;
function gsl_matrix_long_isnull(m: Pgsl_matrix_long): longint; cdecl; external libgsl;
function gsl_matrix_long_ispos(m: Pgsl_matrix_long): longint; cdecl; external libgsl;
function gsl_matrix_long_isneg(m: Pgsl_matrix_long): longint; cdecl; external libgsl;
function gsl_matrix_long_isnonneg(m: Pgsl_matrix_long): longint; cdecl; external libgsl;
function gsl_matrix_long_norm1(m: Pgsl_matrix_long): longint; cdecl; external libgsl;
function gsl_matrix_long_add(a: Pgsl_matrix_long; b: Pgsl_matrix_long): longint; cdecl; external libgsl;
function gsl_matrix_long_sub(a: Pgsl_matrix_long; b: Pgsl_matrix_long): longint; cdecl; external libgsl;
function gsl_matrix_long_mul_elements(a: Pgsl_matrix_long; b: Pgsl_matrix_long): longint; cdecl; external libgsl;
function gsl_matrix_long_div_elements(a: Pgsl_matrix_long; b: Pgsl_matrix_long): longint; cdecl; external libgsl;
function gsl_matrix_long_scale(a: Pgsl_matrix_long; x: longint): longint; cdecl; external libgsl;
function gsl_matrix_long_scale_rows(a: Pgsl_matrix_long; x: Pgsl_vector_long): longint; cdecl; external libgsl;
function gsl_matrix_long_scale_columns(a: Pgsl_matrix_long; x: Pgsl_vector_long): longint; cdecl; external libgsl;
function gsl_matrix_long_add_constant(a: Pgsl_matrix_long; x: longint): longint; cdecl; external libgsl;
function gsl_matrix_long_add_diagonal(a: Pgsl_matrix_long; x: longint): longint; cdecl; external libgsl;

function gsl_matrix_long_get_row(v: Pgsl_vector_long; m: Pgsl_matrix_long; i: Tsize_t): longint; cdecl; external libgsl;
function gsl_matrix_long_get_col(v: Pgsl_vector_long; m: Pgsl_matrix_long; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_matrix_long_set_row(m: Pgsl_matrix_long; i: Tsize_t; v: Pgsl_vector_long): longint; cdecl; external libgsl;
function gsl_matrix_long_set_col(m: Pgsl_matrix_long; j: Tsize_t; v: Pgsl_vector_long): longint; cdecl; external libgsl;

function gsl_matrix_long_get(m: Pgsl_matrix_long; i: Tsize_t; j: Tsize_t): longint; cdecl; external libgsl;
procedure gsl_matrix_long_set(m: Pgsl_matrix_long; i: Tsize_t; j: Tsize_t; x: longint); cdecl; external libgsl;
function gsl_matrix_long_ptr(m: Pgsl_matrix_long; i: Tsize_t; j: Tsize_t): Plongint; cdecl; external libgsl;
function gsl_matrix_long_const_ptr(m: Pgsl_matrix_long; i: Tsize_t; j: Tsize_t): Plongint; cdecl; external libgsl;

// === Konventiert am: 20-8-25 17:01:54 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
