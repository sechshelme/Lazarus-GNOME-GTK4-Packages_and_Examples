{$IFDEF read_interface}


type
  Tgsl_matrix_int = record
    size1: Tsize_t;
    size2: Tsize_t;
    tda: Tsize_t;
    data: Plongint;
    block: Pgsl_block_int;
    owner: longint;
  end;
  Pgsl_matrix_int = ^Tgsl_matrix_int;

  Tgsl_matrix_int_view = record
    matrix: Tgsl_matrix_int;
  end;
  Pgsl_matrix_int_view = ^Tgsl_matrix_int_view;

  Tgsl_matrix_int_const_view = record
    matrix: Tgsl_matrix_int;
  end;
  Pgsl_matrix_int_const_view = ^Tgsl_matrix_int_const_view;


function gsl_matrix_int_alloc(n1: Tsize_t; n2: Tsize_t): Pgsl_matrix_int; cdecl; external libgsl;
function gsl_matrix_int_calloc(n1: Tsize_t; n2: Tsize_t): Pgsl_matrix_int; cdecl; external libgsl;
function gsl_matrix_int_alloc_from_block(b: Pgsl_block_int; offset: Tsize_t; n1: Tsize_t; n2: Tsize_t; d2: Tsize_t): Pgsl_matrix_int; cdecl; external libgsl;
function gsl_matrix_int_alloc_from_matrix(m: Pgsl_matrix_int; k1: Tsize_t; k2: Tsize_t; n1: Tsize_t; n2: Tsize_t): Pgsl_matrix_int; cdecl; external libgsl;
function gsl_vector_int_alloc_row_from_matrix(m: Pgsl_matrix_int; i: Tsize_t): Pgsl_vector_int; cdecl; external libgsl;
function gsl_vector_int_alloc_col_from_matrix(m: Pgsl_matrix_int; j: Tsize_t): Pgsl_vector_int; cdecl; external libgsl;
procedure gsl_matrix_int_free(m: Pgsl_matrix_int); cdecl; external libgsl;

function gsl_matrix_int_submatrix(m: Pgsl_matrix_int; i: Tsize_t; j: Tsize_t; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_int_view; cdecl; external libgsl;
function gsl_matrix_int_row(m: Pgsl_matrix_int; i: Tsize_t): Tgsl_vector_int_view; cdecl; external libgsl;
function gsl_matrix_int_column(m: Pgsl_matrix_int; j: Tsize_t): Tgsl_vector_int_view; cdecl; external libgsl;
function gsl_matrix_int_diagonal(m: Pgsl_matrix_int): Tgsl_vector_int_view; cdecl; external libgsl;
function gsl_matrix_int_subdiagonal(m: Pgsl_matrix_int; k: Tsize_t): Tgsl_vector_int_view; cdecl; external libgsl;
function gsl_matrix_int_superdiagonal(m: Pgsl_matrix_int; k: Tsize_t): Tgsl_vector_int_view; cdecl; external libgsl;
function gsl_matrix_int_subrow(m: Pgsl_matrix_int; i: Tsize_t; offset: Tsize_t; n: Tsize_t): Tgsl_vector_int_view; cdecl; external libgsl;
function gsl_matrix_int_subcolumn(m: Pgsl_matrix_int; j: Tsize_t; offset: Tsize_t; n: Tsize_t): Tgsl_vector_int_view; cdecl; external libgsl;
function gsl_matrix_int_view_array(base: Plongint; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_int_view; cdecl; external libgsl;
function gsl_matrix_int_view_array_with_tda(base: Plongint; n1: Tsize_t; n2: Tsize_t; tda: Tsize_t): Tgsl_matrix_int_view; cdecl; external libgsl;
function gsl_matrix_int_view_vector(v: Pgsl_vector_int; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_int_view; cdecl; external libgsl;
function gsl_matrix_int_view_vector_with_tda(v: Pgsl_vector_int; n1: Tsize_t; n2: Tsize_t; tda: Tsize_t): Tgsl_matrix_int_view; cdecl; external libgsl;
function gsl_matrix_int_const_submatrix(m: Pgsl_matrix_int; i: Tsize_t; j: Tsize_t; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_int_const_view; cdecl; external libgsl;
function gsl_matrix_int_const_row(m: Pgsl_matrix_int; i: Tsize_t): Tgsl_vector_int_const_view; cdecl; external libgsl;
function gsl_matrix_int_const_column(m: Pgsl_matrix_int; j: Tsize_t): Tgsl_vector_int_const_view; cdecl; external libgsl;
function gsl_matrix_int_const_diagonal(m: Pgsl_matrix_int): Tgsl_vector_int_const_view; cdecl; external libgsl;
function gsl_matrix_int_const_subdiagonal(m: Pgsl_matrix_int; k: Tsize_t): Tgsl_vector_int_const_view; cdecl; external libgsl;
function gsl_matrix_int_const_superdiagonal(m: Pgsl_matrix_int; k: Tsize_t): Tgsl_vector_int_const_view; cdecl; external libgsl;
function gsl_matrix_int_const_subrow(m: Pgsl_matrix_int; i: Tsize_t; offset: Tsize_t; n: Tsize_t): Tgsl_vector_int_const_view; cdecl; external libgsl;
function gsl_matrix_int_const_subcolumn(m: Pgsl_matrix_int; j: Tsize_t; offset: Tsize_t; n: Tsize_t): Tgsl_vector_int_const_view; cdecl; external libgsl;
function gsl_matrix_int_const_view_array(base: Plongint; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_int_const_view; cdecl; external libgsl;
function gsl_matrix_int_const_view_array_with_tda(base: Plongint; n1: Tsize_t; n2: Tsize_t; tda: Tsize_t): Tgsl_matrix_int_const_view; cdecl; external libgsl;
function gsl_matrix_int_const_view_vector(v: Pgsl_vector_int; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_int_const_view; cdecl; external libgsl;
function gsl_matrix_int_const_view_vector_with_tda(v: Pgsl_vector_int; n1: Tsize_t; n2: Tsize_t; tda: Tsize_t): Tgsl_matrix_int_const_view; cdecl; external libgsl;

procedure gsl_matrix_int_set_zero(m: Pgsl_matrix_int); cdecl; external libgsl;
procedure gsl_matrix_int_set_identity(m: Pgsl_matrix_int); cdecl; external libgsl;
procedure gsl_matrix_int_set_all(m: Pgsl_matrix_int; x: longint); cdecl; external libgsl;
function gsl_matrix_int_fread(stream: PFILE; m: Pgsl_matrix_int): longint; cdecl; external libgsl;
function gsl_matrix_int_fwrite(stream: PFILE; m: Pgsl_matrix_int): longint; cdecl; external libgsl;
function gsl_matrix_int_fscanf(stream: PFILE; m: Pgsl_matrix_int): longint; cdecl; external libgsl;
function gsl_matrix_int_fprintf(stream: PFILE; m: Pgsl_matrix_int; format: pchar): longint; cdecl; external libgsl;
function gsl_matrix_int_memcpy(dest: Pgsl_matrix_int; src: Pgsl_matrix_int): longint; cdecl; external libgsl;
function gsl_matrix_int_swap(m1: Pgsl_matrix_int; m2: Pgsl_matrix_int): longint; cdecl; external libgsl;
function gsl_matrix_int_tricpy(Uplo: TCBLAS_UPLO_t; Diag: TCBLAS_DIAG_t; dest: Pgsl_matrix_int; src: Pgsl_matrix_int): longint; cdecl; external libgsl;
function gsl_matrix_int_swap_rows(m: Pgsl_matrix_int; i: Tsize_t; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_matrix_int_swap_columns(m: Pgsl_matrix_int; i: Tsize_t; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_matrix_int_swap_rowcol(m: Pgsl_matrix_int; i: Tsize_t; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_matrix_int_transpose(m: Pgsl_matrix_int): longint; cdecl; external libgsl;
function gsl_matrix_int_transpose_memcpy(dest: Pgsl_matrix_int; src: Pgsl_matrix_int): longint; cdecl; external libgsl;
function gsl_matrix_int_transpose_tricpy(Uplo_src: TCBLAS_UPLO_t; Diag: TCBLAS_DIAG_t; dest: Pgsl_matrix_int; src: Pgsl_matrix_int): longint; cdecl; external libgsl;
function gsl_matrix_int_max(m: Pgsl_matrix_int): longint; cdecl; external libgsl;
function gsl_matrix_int_min(m: Pgsl_matrix_int): longint; cdecl; external libgsl;
procedure gsl_matrix_int_minmax(m: Pgsl_matrix_int; min_out: Plongint; max_out: Plongint); cdecl; external libgsl;
procedure gsl_matrix_int_max_index(m: Pgsl_matrix_int; imax: Psize_t; jmax: Psize_t); cdecl; external libgsl;
procedure gsl_matrix_int_min_index(m: Pgsl_matrix_int; imin: Psize_t; jmin: Psize_t); cdecl; external libgsl;
procedure gsl_matrix_int_minmax_index(m: Pgsl_matrix_int; imin: Psize_t; jmin: Psize_t; imax: Psize_t; jmax: Psize_t); cdecl; external libgsl;
function gsl_matrix_int_equal(a: Pgsl_matrix_int; b: Pgsl_matrix_int): longint; cdecl; external libgsl;
function gsl_matrix_int_isnull(m: Pgsl_matrix_int): longint; cdecl; external libgsl;
function gsl_matrix_int_ispos(m: Pgsl_matrix_int): longint; cdecl; external libgsl;
function gsl_matrix_int_isneg(m: Pgsl_matrix_int): longint; cdecl; external libgsl;
function gsl_matrix_int_isnonneg(m: Pgsl_matrix_int): longint; cdecl; external libgsl;
function gsl_matrix_int_norm1(m: Pgsl_matrix_int): longint; cdecl; external libgsl;
function gsl_matrix_int_add(a: Pgsl_matrix_int; b: Pgsl_matrix_int): longint; cdecl; external libgsl;
function gsl_matrix_int_sub(a: Pgsl_matrix_int; b: Pgsl_matrix_int): longint; cdecl; external libgsl;
function gsl_matrix_int_mul_elements(a: Pgsl_matrix_int; b: Pgsl_matrix_int): longint; cdecl; external libgsl;
function gsl_matrix_int_div_elements(a: Pgsl_matrix_int; b: Pgsl_matrix_int): longint; cdecl; external libgsl;
function gsl_matrix_int_scale(a: Pgsl_matrix_int; x: longint): longint; cdecl; external libgsl;
function gsl_matrix_int_scale_rows(a: Pgsl_matrix_int; x: Pgsl_vector_int): longint; cdecl; external libgsl;
function gsl_matrix_int_scale_columns(a: Pgsl_matrix_int; x: Pgsl_vector_int): longint; cdecl; external libgsl;
function gsl_matrix_int_add_constant(a: Pgsl_matrix_int; x: longint): longint; cdecl; external libgsl;
function gsl_matrix_int_add_diagonal(a: Pgsl_matrix_int; x: longint): longint; cdecl; external libgsl;

function gsl_matrix_int_get_row(v: Pgsl_vector_int; m: Pgsl_matrix_int; i: Tsize_t): longint; cdecl; external libgsl;
function gsl_matrix_int_get_col(v: Pgsl_vector_int; m: Pgsl_matrix_int; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_matrix_int_set_row(m: Pgsl_matrix_int; i: Tsize_t; v: Pgsl_vector_int): longint; cdecl; external libgsl;
function gsl_matrix_int_set_col(m: Pgsl_matrix_int; j: Tsize_t; v: Pgsl_vector_int): longint; cdecl; external libgsl;

function gsl_matrix_int_get(m: Pgsl_matrix_int; i: Tsize_t; j: Tsize_t): longint; cdecl; external libgsl;
procedure gsl_matrix_int_set(m: Pgsl_matrix_int; i: Tsize_t; j: Tsize_t; x: longint); cdecl; external libgsl;
function gsl_matrix_int_ptr(m: Pgsl_matrix_int; i: Tsize_t; j: Tsize_t): Plongint; cdecl; external libgsl;
function gsl_matrix_int_const_ptr(m: Pgsl_matrix_int; i: Tsize_t; j: Tsize_t): Plongint; cdecl; external libgsl;

// === Konventiert am: 20-8-25 17:01:51 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
