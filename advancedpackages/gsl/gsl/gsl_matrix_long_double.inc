{$IFDEF read_interface}


type
  Tgsl_matrix_long_double = record
    size1: Tsize_t;
    size2: Tsize_t;
    tda: Tsize_t;
    data: Plong_double;
    block: Pgsl_block_long_double;
    owner: longint;
  end;
  Pgsl_matrix_long_double = ^Tgsl_matrix_long_double;

  Tgsl_matrix_long_double_view = record
    matrix: Tgsl_matrix_long_double;
  end;
  Pgsl_matrix_long_double_view = ^Tgsl_matrix_long_double_view;

  Tgsl_matrix_long_double_const_view = record
    matrix: Tgsl_matrix_long_double;
  end;
  Pgsl_matrix_long_double_const_view = ^Tgsl_matrix_long_double_const_view;


function gsl_matrix_long_double_alloc(n1: Tsize_t; n2: Tsize_t): Pgsl_matrix_long_double; cdecl; external libgsl;
function gsl_matrix_long_double_calloc(n1: Tsize_t; n2: Tsize_t): Pgsl_matrix_long_double; cdecl; external libgsl;
function gsl_matrix_long_double_alloc_from_block(b: Pgsl_block_long_double; offset: Tsize_t; n1: Tsize_t; n2: Tsize_t; d2: Tsize_t): Pgsl_matrix_long_double; cdecl; external libgsl;
function gsl_matrix_long_double_alloc_from_matrix(m: Pgsl_matrix_long_double; k1: Tsize_t; k2: Tsize_t; n1: Tsize_t; n2: Tsize_t): Pgsl_matrix_long_double; cdecl; external libgsl;
function gsl_vector_long_double_alloc_row_from_matrix(m: Pgsl_matrix_long_double; i: Tsize_t): Pgsl_vector_long_double; cdecl; external libgsl;
function gsl_vector_long_double_alloc_col_from_matrix(m: Pgsl_matrix_long_double; j: Tsize_t): Pgsl_vector_long_double; cdecl; external libgsl;
procedure gsl_matrix_long_double_free(m: Pgsl_matrix_long_double); cdecl; external libgsl;

function gsl_matrix_long_double_submatrix(m: Pgsl_matrix_long_double; i: Tsize_t; j: Tsize_t; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_long_double_view; cdecl; external libgsl;
function gsl_matrix_long_double_row(m: Pgsl_matrix_long_double; i: Tsize_t): Tgsl_vector_long_double_view; cdecl; external libgsl;
function gsl_matrix_long_double_column(m: Pgsl_matrix_long_double; j: Tsize_t): Tgsl_vector_long_double_view; cdecl; external libgsl;
function gsl_matrix_long_double_diagonal(m: Pgsl_matrix_long_double): Tgsl_vector_long_double_view; cdecl; external libgsl;
function gsl_matrix_long_double_subdiagonal(m: Pgsl_matrix_long_double; k: Tsize_t): Tgsl_vector_long_double_view; cdecl; external libgsl;
function gsl_matrix_long_double_superdiagonal(m: Pgsl_matrix_long_double; k: Tsize_t): Tgsl_vector_long_double_view; cdecl; external libgsl;
function gsl_matrix_long_double_subrow(m: Pgsl_matrix_long_double; i: Tsize_t; offset: Tsize_t; n: Tsize_t): Tgsl_vector_long_double_view; cdecl; external libgsl;
function gsl_matrix_long_double_subcolumn(m: Pgsl_matrix_long_double; j: Tsize_t; offset: Tsize_t; n: Tsize_t): Tgsl_vector_long_double_view; cdecl; external libgsl;
function gsl_matrix_long_double_view_array(base: Plong_double; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_long_double_view; cdecl; external libgsl;
function gsl_matrix_long_double_view_array_with_tda(base: Plong_double; n1: Tsize_t; n2: Tsize_t; tda: Tsize_t): Tgsl_matrix_long_double_view; cdecl; external libgsl;
function gsl_matrix_long_double_view_vector(v: Pgsl_vector_long_double; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_long_double_view; cdecl; external libgsl;
function gsl_matrix_long_double_view_vector_with_tda(v: Pgsl_vector_long_double; n1: Tsize_t; n2: Tsize_t; tda: Tsize_t): Tgsl_matrix_long_double_view; cdecl; external libgsl;
function gsl_matrix_long_double_const_submatrix(m: Pgsl_matrix_long_double; i: Tsize_t; j: Tsize_t; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_long_double_const_view; cdecl; external libgsl;
function gsl_matrix_long_double_const_row(m: Pgsl_matrix_long_double; i: Tsize_t): Tgsl_vector_long_double_const_view; cdecl; external libgsl;
function gsl_matrix_long_double_const_column(m: Pgsl_matrix_long_double; j: Tsize_t): Tgsl_vector_long_double_const_view; cdecl; external libgsl;
function gsl_matrix_long_double_const_diagonal(m: Pgsl_matrix_long_double): Tgsl_vector_long_double_const_view; cdecl; external libgsl;
function gsl_matrix_long_double_const_subdiagonal(m: Pgsl_matrix_long_double; k: Tsize_t): Tgsl_vector_long_double_const_view; cdecl; external libgsl;
function gsl_matrix_long_double_const_superdiagonal(m: Pgsl_matrix_long_double; k: Tsize_t): Tgsl_vector_long_double_const_view; cdecl; external libgsl;
function gsl_matrix_long_double_const_subrow(m: Pgsl_matrix_long_double; i: Tsize_t; offset: Tsize_t; n: Tsize_t): Tgsl_vector_long_double_const_view; cdecl; external libgsl;
function gsl_matrix_long_double_const_subcolumn(m: Pgsl_matrix_long_double; j: Tsize_t; offset: Tsize_t; n: Tsize_t): Tgsl_vector_long_double_const_view; cdecl; external libgsl;
function gsl_matrix_long_double_const_view_array(base: Plong_double; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_long_double_const_view; cdecl; external libgsl;
function gsl_matrix_long_double_const_view_array_with_tda(base: Plong_double; n1: Tsize_t; n2: Tsize_t; tda: Tsize_t): Tgsl_matrix_long_double_const_view; cdecl; external libgsl;
function gsl_matrix_long_double_const_view_vector(v: Pgsl_vector_long_double; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_long_double_const_view; cdecl; external libgsl;
function gsl_matrix_long_double_const_view_vector_with_tda(v: Pgsl_vector_long_double; n1: Tsize_t; n2: Tsize_t; tda: Tsize_t): Tgsl_matrix_long_double_const_view; cdecl; external libgsl;

procedure gsl_matrix_long_double_set_zero(m: Pgsl_matrix_long_double); cdecl; external libgsl;
procedure gsl_matrix_long_double_set_identity(m: Pgsl_matrix_long_double); cdecl; external libgsl;
procedure gsl_matrix_long_double_set_all(m: Pgsl_matrix_long_double; x: Tlong_double); cdecl; external libgsl;
function gsl_matrix_long_double_fread(stream: PFILE; m: Pgsl_matrix_long_double): longint; cdecl; external libgsl;
function gsl_matrix_long_double_fwrite(stream: PFILE; m: Pgsl_matrix_long_double): longint; cdecl; external libgsl;
function gsl_matrix_long_double_fscanf(stream: PFILE; m: Pgsl_matrix_long_double): longint; cdecl; external libgsl;
function gsl_matrix_long_double_fprintf(stream: PFILE; m: Pgsl_matrix_long_double; format: pchar): longint; cdecl; external libgsl;
function gsl_matrix_long_double_memcpy(dest: Pgsl_matrix_long_double; src: Pgsl_matrix_long_double): longint; cdecl; external libgsl;
function gsl_matrix_long_double_swap(m1: Pgsl_matrix_long_double; m2: Pgsl_matrix_long_double): longint; cdecl; external libgsl;
function gsl_matrix_long_double_tricpy(Uplo: TCBLAS_UPLO_t; Diag: TCBLAS_DIAG_t; dest: Pgsl_matrix_long_double; src: Pgsl_matrix_long_double): longint; cdecl; external libgsl;
function gsl_matrix_long_double_swap_rows(m: Pgsl_matrix_long_double; i: Tsize_t; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_matrix_long_double_swap_columns(m: Pgsl_matrix_long_double; i: Tsize_t; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_matrix_long_double_swap_rowcol(m: Pgsl_matrix_long_double; i: Tsize_t; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_matrix_long_double_transpose(m: Pgsl_matrix_long_double): longint; cdecl; external libgsl;
function gsl_matrix_long_double_transpose_memcpy(dest: Pgsl_matrix_long_double; src: Pgsl_matrix_long_double): longint; cdecl; external libgsl;
function gsl_matrix_long_double_transpose_tricpy(Uplo_src: TCBLAS_UPLO_t; Diag: TCBLAS_DIAG_t; dest: Pgsl_matrix_long_double; src: Pgsl_matrix_long_double): longint; cdecl; external libgsl;
function gsl_matrix_long_double_max(m: Pgsl_matrix_long_double): Tlong_double; cdecl; external libgsl;
function gsl_matrix_long_double_min(m: Pgsl_matrix_long_double): Tlong_double; cdecl; external libgsl;
procedure gsl_matrix_long_double_minmax(m: Pgsl_matrix_long_double; min_out: Plong_double; max_out: Plong_double); cdecl; external libgsl;
procedure gsl_matrix_long_double_max_index(m: Pgsl_matrix_long_double; imax: Psize_t; jmax: Psize_t); cdecl; external libgsl;
procedure gsl_matrix_long_double_min_index(m: Pgsl_matrix_long_double; imin: Psize_t; jmin: Psize_t); cdecl; external libgsl;
procedure gsl_matrix_long_double_minmax_index(m: Pgsl_matrix_long_double; imin: Psize_t; jmin: Psize_t; imax: Psize_t; jmax: Psize_t); cdecl; external libgsl;
function gsl_matrix_long_double_equal(a: Pgsl_matrix_long_double; b: Pgsl_matrix_long_double): longint; cdecl; external libgsl;
function gsl_matrix_long_double_isnull(m: Pgsl_matrix_long_double): longint; cdecl; external libgsl;
function gsl_matrix_long_double_ispos(m: Pgsl_matrix_long_double): longint; cdecl; external libgsl;
function gsl_matrix_long_double_isneg(m: Pgsl_matrix_long_double): longint; cdecl; external libgsl;
function gsl_matrix_long_double_isnonneg(m: Pgsl_matrix_long_double): longint; cdecl; external libgsl;
function gsl_matrix_long_double_norm1(m: Pgsl_matrix_long_double): Tlong_double; cdecl; external libgsl;
function gsl_matrix_long_double_add(a: Pgsl_matrix_long_double; b: Pgsl_matrix_long_double): longint; cdecl; external libgsl;
function gsl_matrix_long_double_sub(a: Pgsl_matrix_long_double; b: Pgsl_matrix_long_double): longint; cdecl; external libgsl;
function gsl_matrix_long_double_mul_elements(a: Pgsl_matrix_long_double; b: Pgsl_matrix_long_double): longint; cdecl; external libgsl;
function gsl_matrix_long_double_div_elements(a: Pgsl_matrix_long_double; b: Pgsl_matrix_long_double): longint; cdecl; external libgsl;
function gsl_matrix_long_double_scale(a: Pgsl_matrix_long_double; x: Tlong_double): longint; cdecl; external libgsl;
function gsl_matrix_long_double_scale_rows(a: Pgsl_matrix_long_double; x: Pgsl_vector_long_double): longint; cdecl; external libgsl;
function gsl_matrix_long_double_scale_columns(a: Pgsl_matrix_long_double; x: Pgsl_vector_long_double): longint; cdecl; external libgsl;
function gsl_matrix_long_double_add_constant(a: Pgsl_matrix_long_double; x: Tlong_double): longint; cdecl; external libgsl;
function gsl_matrix_long_double_add_diagonal(a: Pgsl_matrix_long_double; x: Tlong_double): longint; cdecl; external libgsl;

function gsl_matrix_long_double_get_row(v: Pgsl_vector_long_double; m: Pgsl_matrix_long_double; i: Tsize_t): longint; cdecl; external libgsl;
function gsl_matrix_long_double_get_col(v: Pgsl_vector_long_double; m: Pgsl_matrix_long_double; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_matrix_long_double_set_row(m: Pgsl_matrix_long_double; i: Tsize_t; v: Pgsl_vector_long_double): longint; cdecl; external libgsl;
function gsl_matrix_long_double_set_col(m: Pgsl_matrix_long_double; j: Tsize_t; v: Pgsl_vector_long_double): longint; cdecl; external libgsl;

function gsl_matrix_long_double_get(m: Pgsl_matrix_long_double; i: Tsize_t; j: Tsize_t): Tlong_double; cdecl; external libgsl;
procedure gsl_matrix_long_double_set(m: Pgsl_matrix_long_double; i: Tsize_t; j: Tsize_t; x: Tlong_double); cdecl; external libgsl;
function gsl_matrix_long_double_ptr(m: Pgsl_matrix_long_double; i: Tsize_t; j: Tsize_t): Plong_double; cdecl; external libgsl;
function gsl_matrix_long_double_const_ptr(m: Pgsl_matrix_long_double; i: Tsize_t; j: Tsize_t): Plong_double; cdecl; external libgsl;

// === Konventiert am: 20-8-25 15:20:54 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
