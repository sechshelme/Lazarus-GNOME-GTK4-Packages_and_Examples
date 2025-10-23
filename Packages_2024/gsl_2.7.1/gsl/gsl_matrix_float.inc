{$IFDEF read_interface}


type
  Tgsl_matrix_float = record
    size1: Tsize_t;
    size2: Tsize_t;
    tda: Tsize_t;
    data: Psingle;
    block: Pgsl_block_float;
    owner: longint;
  end;
  Pgsl_matrix_float = ^Tgsl_matrix_float;

  Tgsl_matrix_float_view = record
    matrix: Tgsl_matrix_float;
  end;
  Pgsl_matrix_float_view = ^Tgsl_matrix_float_view;

  Tgsl_matrix_float_const_view = record
    matrix: Tgsl_matrix_float;
  end;
  Pgsl_matrix_float_const_view = ^Tgsl_matrix_float_const_view;


function gsl_matrix_float_alloc(n1: Tsize_t; n2: Tsize_t): Pgsl_matrix_float; cdecl; external libgsl;
function gsl_matrix_float_calloc(n1: Tsize_t; n2: Tsize_t): Pgsl_matrix_float; cdecl; external libgsl;
function gsl_matrix_float_alloc_from_block(b: Pgsl_block_float; offset: Tsize_t; n1: Tsize_t; n2: Tsize_t; d2: Tsize_t): Pgsl_matrix_float; cdecl; external libgsl;
function gsl_matrix_float_alloc_from_matrix(m: Pgsl_matrix_float; k1: Tsize_t; k2: Tsize_t; n1: Tsize_t; n2: Tsize_t): Pgsl_matrix_float; cdecl; external libgsl;
function gsl_vector_float_alloc_row_from_matrix(m: Pgsl_matrix_float; i: Tsize_t): Pgsl_vector_float; cdecl; external libgsl;
function gsl_vector_float_alloc_col_from_matrix(m: Pgsl_matrix_float; j: Tsize_t): Pgsl_vector_float; cdecl; external libgsl;
procedure gsl_matrix_float_free(m: Pgsl_matrix_float); cdecl; external libgsl;

function gsl_matrix_float_submatrix(m: Pgsl_matrix_float; i: Tsize_t; j: Tsize_t; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_float_view; cdecl; external libgsl;
function gsl_matrix_float_row(m: Pgsl_matrix_float; i: Tsize_t): Tgsl_vector_float_view; cdecl; external libgsl;
function gsl_matrix_float_column(m: Pgsl_matrix_float; j: Tsize_t): Tgsl_vector_float_view; cdecl; external libgsl;
function gsl_matrix_float_diagonal(m: Pgsl_matrix_float): Tgsl_vector_float_view; cdecl; external libgsl;
function gsl_matrix_float_subdiagonal(m: Pgsl_matrix_float; k: Tsize_t): Tgsl_vector_float_view; cdecl; external libgsl;
function gsl_matrix_float_superdiagonal(m: Pgsl_matrix_float; k: Tsize_t): Tgsl_vector_float_view; cdecl; external libgsl;
function gsl_matrix_float_subrow(m: Pgsl_matrix_float; i: Tsize_t; offset: Tsize_t; n: Tsize_t): Tgsl_vector_float_view; cdecl; external libgsl;
function gsl_matrix_float_subcolumn(m: Pgsl_matrix_float; j: Tsize_t; offset: Tsize_t; n: Tsize_t): Tgsl_vector_float_view; cdecl; external libgsl;
function gsl_matrix_float_view_array(base: Psingle; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_float_view; cdecl; external libgsl;
function gsl_matrix_float_view_array_with_tda(base: Psingle; n1: Tsize_t; n2: Tsize_t; tda: Tsize_t): Tgsl_matrix_float_view; cdecl; external libgsl;
function gsl_matrix_float_view_vector(v: Pgsl_vector_float; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_float_view; cdecl; external libgsl;
function gsl_matrix_float_view_vector_with_tda(v: Pgsl_vector_float; n1: Tsize_t; n2: Tsize_t; tda: Tsize_t): Tgsl_matrix_float_view; cdecl; external libgsl;
function gsl_matrix_float_const_submatrix(m: Pgsl_matrix_float; i: Tsize_t; j: Tsize_t; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_float_const_view; cdecl; external libgsl;
function gsl_matrix_float_const_row(m: Pgsl_matrix_float; i: Tsize_t): Tgsl_vector_float_const_view; cdecl; external libgsl;
function gsl_matrix_float_const_column(m: Pgsl_matrix_float; j: Tsize_t): Tgsl_vector_float_const_view; cdecl; external libgsl;
function gsl_matrix_float_const_diagonal(m: Pgsl_matrix_float): Tgsl_vector_float_const_view; cdecl; external libgsl;
function gsl_matrix_float_const_subdiagonal(m: Pgsl_matrix_float; k: Tsize_t): Tgsl_vector_float_const_view; cdecl; external libgsl;
function gsl_matrix_float_const_superdiagonal(m: Pgsl_matrix_float; k: Tsize_t): Tgsl_vector_float_const_view; cdecl; external libgsl;
function gsl_matrix_float_const_subrow(m: Pgsl_matrix_float; i: Tsize_t; offset: Tsize_t; n: Tsize_t): Tgsl_vector_float_const_view; cdecl; external libgsl;
function gsl_matrix_float_const_subcolumn(m: Pgsl_matrix_float; j: Tsize_t; offset: Tsize_t; n: Tsize_t): Tgsl_vector_float_const_view; cdecl; external libgsl;
function gsl_matrix_float_const_view_array(base: Psingle; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_float_const_view; cdecl; external libgsl;
function gsl_matrix_float_const_view_array_with_tda(base: Psingle; n1: Tsize_t; n2: Tsize_t; tda: Tsize_t): Tgsl_matrix_float_const_view; cdecl; external libgsl;
function gsl_matrix_float_const_view_vector(v: Pgsl_vector_float; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_float_const_view; cdecl; external libgsl;
function gsl_matrix_float_const_view_vector_with_tda(v: Pgsl_vector_float; n1: Tsize_t; n2: Tsize_t; tda: Tsize_t): Tgsl_matrix_float_const_view; cdecl; external libgsl;

procedure gsl_matrix_float_set_zero(m: Pgsl_matrix_float); cdecl; external libgsl;
procedure gsl_matrix_float_set_identity(m: Pgsl_matrix_float); cdecl; external libgsl;
procedure gsl_matrix_float_set_all(m: Pgsl_matrix_float; x: single); cdecl; external libgsl;
function gsl_matrix_float_fread(stream: PFILE; m: Pgsl_matrix_float): longint; cdecl; external libgsl;
function gsl_matrix_float_fwrite(stream: PFILE; m: Pgsl_matrix_float): longint; cdecl; external libgsl;
function gsl_matrix_float_fscanf(stream: PFILE; m: Pgsl_matrix_float): longint; cdecl; external libgsl;
function gsl_matrix_float_fprintf(stream: PFILE; m: Pgsl_matrix_float; format: pchar): longint; cdecl; external libgsl;
function gsl_matrix_float_memcpy(dest: Pgsl_matrix_float; src: Pgsl_matrix_float): longint; cdecl; external libgsl;
function gsl_matrix_float_swap(m1: Pgsl_matrix_float; m2: Pgsl_matrix_float): longint; cdecl; external libgsl;
function gsl_matrix_float_tricpy(Uplo: TCBLAS_UPLO_t; Diag: TCBLAS_DIAG_t; dest: Pgsl_matrix_float; src: Pgsl_matrix_float): longint; cdecl; external libgsl;
function gsl_matrix_float_swap_rows(m: Pgsl_matrix_float; i: Tsize_t; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_matrix_float_swap_columns(m: Pgsl_matrix_float; i: Tsize_t; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_matrix_float_swap_rowcol(m: Pgsl_matrix_float; i: Tsize_t; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_matrix_float_transpose(m: Pgsl_matrix_float): longint; cdecl; external libgsl;
function gsl_matrix_float_transpose_memcpy(dest: Pgsl_matrix_float; src: Pgsl_matrix_float): longint; cdecl; external libgsl;
function gsl_matrix_float_transpose_tricpy(Uplo_src: TCBLAS_UPLO_t; Diag: TCBLAS_DIAG_t; dest: Pgsl_matrix_float; src: Pgsl_matrix_float): longint; cdecl; external libgsl;
function gsl_matrix_float_max(m: Pgsl_matrix_float): single; cdecl; external libgsl;
function gsl_matrix_float_min(m: Pgsl_matrix_float): single; cdecl; external libgsl;
procedure gsl_matrix_float_minmax(m: Pgsl_matrix_float; min_out: Psingle; max_out: Psingle); cdecl; external libgsl;
procedure gsl_matrix_float_max_index(m: Pgsl_matrix_float; imax: Psize_t; jmax: Psize_t); cdecl; external libgsl;
procedure gsl_matrix_float_min_index(m: Pgsl_matrix_float; imin: Psize_t; jmin: Psize_t); cdecl; external libgsl;
procedure gsl_matrix_float_minmax_index(m: Pgsl_matrix_float; imin: Psize_t; jmin: Psize_t; imax: Psize_t; jmax: Psize_t); cdecl; external libgsl;
function gsl_matrix_float_equal(a: Pgsl_matrix_float; b: Pgsl_matrix_float): longint; cdecl; external libgsl;
function gsl_matrix_float_isnull(m: Pgsl_matrix_float): longint; cdecl; external libgsl;
function gsl_matrix_float_ispos(m: Pgsl_matrix_float): longint; cdecl; external libgsl;
function gsl_matrix_float_isneg(m: Pgsl_matrix_float): longint; cdecl; external libgsl;
function gsl_matrix_float_isnonneg(m: Pgsl_matrix_float): longint; cdecl; external libgsl;
function gsl_matrix_float_norm1(m: Pgsl_matrix_float): single; cdecl; external libgsl;
function gsl_matrix_float_add(a: Pgsl_matrix_float; b: Pgsl_matrix_float): longint; cdecl; external libgsl;
function gsl_matrix_float_sub(a: Pgsl_matrix_float; b: Pgsl_matrix_float): longint; cdecl; external libgsl;
function gsl_matrix_float_mul_elements(a: Pgsl_matrix_float; b: Pgsl_matrix_float): longint; cdecl; external libgsl;
function gsl_matrix_float_div_elements(a: Pgsl_matrix_float; b: Pgsl_matrix_float): longint; cdecl; external libgsl;
function gsl_matrix_float_scale(a: Pgsl_matrix_float; x: single): longint; cdecl; external libgsl;
function gsl_matrix_float_scale_rows(a: Pgsl_matrix_float; x: Pgsl_vector_float): longint; cdecl; external libgsl;
function gsl_matrix_float_scale_columns(a: Pgsl_matrix_float; x: Pgsl_vector_float): longint; cdecl; external libgsl;
function gsl_matrix_float_add_constant(a: Pgsl_matrix_float; x: single): longint; cdecl; external libgsl;
function gsl_matrix_float_add_diagonal(a: Pgsl_matrix_float; x: single): longint; cdecl; external libgsl;

function gsl_matrix_float_get_row(v: Pgsl_vector_float; m: Pgsl_matrix_float; i: Tsize_t): longint; cdecl; external libgsl;
function gsl_matrix_float_get_col(v: Pgsl_vector_float; m: Pgsl_matrix_float; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_matrix_float_set_row(m: Pgsl_matrix_float; i: Tsize_t; v: Pgsl_vector_float): longint; cdecl; external libgsl;
function gsl_matrix_float_set_col(m: Pgsl_matrix_float; j: Tsize_t; v: Pgsl_vector_float): longint; cdecl; external libgsl;

function gsl_matrix_float_get(m: Pgsl_matrix_float; i: Tsize_t; j: Tsize_t): single; cdecl; external libgsl;
procedure gsl_matrix_float_set(m: Pgsl_matrix_float; i: Tsize_t; j: Tsize_t; x: single); cdecl; external libgsl;
function gsl_matrix_float_ptr(m: Pgsl_matrix_float; i: Tsize_t; j: Tsize_t): Psingle; cdecl; external libgsl;
function gsl_matrix_float_const_ptr(m: Pgsl_matrix_float; i: Tsize_t; j: Tsize_t): Psingle; cdecl; external libgsl;

// === Konventiert am: 18-8-25 17:14:53 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
