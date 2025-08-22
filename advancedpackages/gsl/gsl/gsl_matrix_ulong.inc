{$IFDEF read_interface}


type
  Tgsl_matrix_ulong = record
    size1: Tsize_t;
    size2: Tsize_t;
    tda: Tsize_t;
    data: Pdword;
    block: Pgsl_block_ulong;
    owner: longint;
  end;
  Pgsl_matrix_ulong = ^Tgsl_matrix_ulong;

  Tgsl_matrix_ulong_view = record
    matrix: Tgsl_matrix_ulong;
  end;
  Pgsl_matrix_ulong_view = ^Tgsl_matrix_ulong_view;

  Tgsl_matrix_ulong_const_view = record
    matrix: Tgsl_matrix_ulong;
  end;
  Pgsl_matrix_ulong_const_view = ^Tgsl_matrix_ulong_const_view;

function gsl_matrix_ulong_alloc(n1: Tsize_t; n2: Tsize_t): Pgsl_matrix_ulong; cdecl; external libgsl;
function gsl_matrix_ulong_calloc(n1: Tsize_t; n2: Tsize_t): Pgsl_matrix_ulong; cdecl; external libgsl;
function gsl_matrix_ulong_alloc_from_block(b: Pgsl_block_ulong; offset: Tsize_t; n1: Tsize_t; n2: Tsize_t; d2: Tsize_t): Pgsl_matrix_ulong; cdecl; external libgsl;
function gsl_matrix_ulong_alloc_from_matrix(m: Pgsl_matrix_ulong; k1: Tsize_t; k2: Tsize_t; n1: Tsize_t; n2: Tsize_t): Pgsl_matrix_ulong; cdecl; external libgsl;
function gsl_vector_ulong_alloc_row_from_matrix(m: Pgsl_matrix_ulong; i: Tsize_t): Pgsl_vector_ulong; cdecl; external libgsl;
function gsl_vector_ulong_alloc_col_from_matrix(m: Pgsl_matrix_ulong; j: Tsize_t): Pgsl_vector_ulong; cdecl; external libgsl;
procedure gsl_matrix_ulong_free(m: Pgsl_matrix_ulong); cdecl; external libgsl;

function gsl_matrix_ulong_submatrix(m: Pgsl_matrix_ulong; i: Tsize_t; j: Tsize_t; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_ulong_view; cdecl; external libgsl;
function gsl_matrix_ulong_row(m: Pgsl_matrix_ulong; i: Tsize_t): Tgsl_vector_ulong_view; cdecl; external libgsl;
function gsl_matrix_ulong_column(m: Pgsl_matrix_ulong; j: Tsize_t): Tgsl_vector_ulong_view; cdecl; external libgsl;
function gsl_matrix_ulong_diagonal(m: Pgsl_matrix_ulong): Tgsl_vector_ulong_view; cdecl; external libgsl;
function gsl_matrix_ulong_subdiagonal(m: Pgsl_matrix_ulong; k: Tsize_t): Tgsl_vector_ulong_view; cdecl; external libgsl;
function gsl_matrix_ulong_superdiagonal(m: Pgsl_matrix_ulong; k: Tsize_t): Tgsl_vector_ulong_view; cdecl; external libgsl;
function gsl_matrix_ulong_subrow(m: Pgsl_matrix_ulong; i: Tsize_t; offset: Tsize_t; n: Tsize_t): Tgsl_vector_ulong_view; cdecl; external libgsl;
function gsl_matrix_ulong_subcolumn(m: Pgsl_matrix_ulong; j: Tsize_t; offset: Tsize_t; n: Tsize_t): Tgsl_vector_ulong_view; cdecl; external libgsl;
function gsl_matrix_ulong_view_array(base: Pdword; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_ulong_view; cdecl; external libgsl;
function gsl_matrix_ulong_view_array_with_tda(base: Pdword; n1: Tsize_t; n2: Tsize_t; tda: Tsize_t): Tgsl_matrix_ulong_view; cdecl; external libgsl;
function gsl_matrix_ulong_view_vector(v: Pgsl_vector_ulong; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_ulong_view; cdecl; external libgsl;
function gsl_matrix_ulong_view_vector_with_tda(v: Pgsl_vector_ulong; n1: Tsize_t; n2: Tsize_t; tda: Tsize_t): Tgsl_matrix_ulong_view; cdecl; external libgsl;
function gsl_matrix_ulong_const_submatrix(m: Pgsl_matrix_ulong; i: Tsize_t; j: Tsize_t; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_ulong_const_view; cdecl; external libgsl;
function gsl_matrix_ulong_const_row(m: Pgsl_matrix_ulong; i: Tsize_t): Tgsl_vector_ulong_const_view; cdecl; external libgsl;
function gsl_matrix_ulong_const_column(m: Pgsl_matrix_ulong; j: Tsize_t): Tgsl_vector_ulong_const_view; cdecl; external libgsl;
function gsl_matrix_ulong_const_diagonal(m: Pgsl_matrix_ulong): Tgsl_vector_ulong_const_view; cdecl; external libgsl;
function gsl_matrix_ulong_const_subdiagonal(m: Pgsl_matrix_ulong; k: Tsize_t): Tgsl_vector_ulong_const_view; cdecl; external libgsl;
function gsl_matrix_ulong_const_superdiagonal(m: Pgsl_matrix_ulong; k: Tsize_t): Tgsl_vector_ulong_const_view; cdecl; external libgsl;
function gsl_matrix_ulong_const_subrow(m: Pgsl_matrix_ulong; i: Tsize_t; offset: Tsize_t; n: Tsize_t): Tgsl_vector_ulong_const_view; cdecl; external libgsl;
function gsl_matrix_ulong_const_subcolumn(m: Pgsl_matrix_ulong; j: Tsize_t; offset: Tsize_t; n: Tsize_t): Tgsl_vector_ulong_const_view; cdecl; external libgsl;
function gsl_matrix_ulong_const_view_array(base: Pdword; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_ulong_const_view; cdecl; external libgsl;
function gsl_matrix_ulong_const_view_array_with_tda(base: Pdword; n1: Tsize_t; n2: Tsize_t; tda: Tsize_t): Tgsl_matrix_ulong_const_view; cdecl; external libgsl;
function gsl_matrix_ulong_const_view_vector(v: Pgsl_vector_ulong; n1: Tsize_t; n2: Tsize_t): Tgsl_matrix_ulong_const_view; cdecl; external libgsl;
function gsl_matrix_ulong_const_view_vector_with_tda(v: Pgsl_vector_ulong; n1: Tsize_t; n2: Tsize_t; tda: Tsize_t): Tgsl_matrix_ulong_const_view; cdecl; external libgsl;

procedure gsl_matrix_ulong_set_zero(m: Pgsl_matrix_ulong); cdecl; external libgsl;
procedure gsl_matrix_ulong_set_identity(m: Pgsl_matrix_ulong); cdecl; external libgsl;
procedure gsl_matrix_ulong_set_all(m: Pgsl_matrix_ulong; x: dword); cdecl; external libgsl;
function gsl_matrix_ulong_fread(stream: PFILE; m: Pgsl_matrix_ulong): longint; cdecl; external libgsl;
function gsl_matrix_ulong_fwrite(stream: PFILE; m: Pgsl_matrix_ulong): longint; cdecl; external libgsl;
function gsl_matrix_ulong_fscanf(stream: PFILE; m: Pgsl_matrix_ulong): longint; cdecl; external libgsl;
function gsl_matrix_ulong_fprintf(stream: PFILE; m: Pgsl_matrix_ulong; format: pchar): longint; cdecl; external libgsl;
function gsl_matrix_ulong_memcpy(dest: Pgsl_matrix_ulong; src: Pgsl_matrix_ulong): longint; cdecl; external libgsl;
function gsl_matrix_ulong_swap(m1: Pgsl_matrix_ulong; m2: Pgsl_matrix_ulong): longint; cdecl; external libgsl;
function gsl_matrix_ulong_tricpy(Uplo: TCBLAS_UPLO_t; Diag: TCBLAS_DIAG_t; dest: Pgsl_matrix_ulong; src: Pgsl_matrix_ulong): longint; cdecl; external libgsl;
function gsl_matrix_ulong_swap_rows(m: Pgsl_matrix_ulong; i: Tsize_t; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_matrix_ulong_swap_columns(m: Pgsl_matrix_ulong; i: Tsize_t; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_matrix_ulong_swap_rowcol(m: Pgsl_matrix_ulong; i: Tsize_t; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_matrix_ulong_transpose(m: Pgsl_matrix_ulong): longint; cdecl; external libgsl;
function gsl_matrix_ulong_transpose_memcpy(dest: Pgsl_matrix_ulong; src: Pgsl_matrix_ulong): longint; cdecl; external libgsl;
function gsl_matrix_ulong_transpose_tricpy(Uplo_src: TCBLAS_UPLO_t; Diag: TCBLAS_DIAG_t; dest: Pgsl_matrix_ulong; src: Pgsl_matrix_ulong): longint; cdecl; external libgsl;
function gsl_matrix_ulong_max(m: Pgsl_matrix_ulong): dword; cdecl; external libgsl;
function gsl_matrix_ulong_min(m: Pgsl_matrix_ulong): dword; cdecl; external libgsl;
procedure gsl_matrix_ulong_minmax(m: Pgsl_matrix_ulong; min_out: Pdword; max_out: Pdword); cdecl; external libgsl;
procedure gsl_matrix_ulong_max_index(m: Pgsl_matrix_ulong; imax: Psize_t; jmax: Psize_t); cdecl; external libgsl;
procedure gsl_matrix_ulong_min_index(m: Pgsl_matrix_ulong; imin: Psize_t; jmin: Psize_t); cdecl; external libgsl;
procedure gsl_matrix_ulong_minmax_index(m: Pgsl_matrix_ulong; imin: Psize_t; jmin: Psize_t; imax: Psize_t; jmax: Psize_t); cdecl; external libgsl;
function gsl_matrix_ulong_equal(a: Pgsl_matrix_ulong; b: Pgsl_matrix_ulong): longint; cdecl; external libgsl;
function gsl_matrix_ulong_isnull(m: Pgsl_matrix_ulong): longint; cdecl; external libgsl;
function gsl_matrix_ulong_ispos(m: Pgsl_matrix_ulong): longint; cdecl; external libgsl;
function gsl_matrix_ulong_isneg(m: Pgsl_matrix_ulong): longint; cdecl; external libgsl;
function gsl_matrix_ulong_isnonneg(m: Pgsl_matrix_ulong): longint; cdecl; external libgsl;
function gsl_matrix_ulong_norm1(m: Pgsl_matrix_ulong): dword; cdecl; external libgsl;
function gsl_matrix_ulong_add(a: Pgsl_matrix_ulong; b: Pgsl_matrix_ulong): longint; cdecl; external libgsl;
function gsl_matrix_ulong_sub(a: Pgsl_matrix_ulong; b: Pgsl_matrix_ulong): longint; cdecl; external libgsl;
function gsl_matrix_ulong_mul_elements(a: Pgsl_matrix_ulong; b: Pgsl_matrix_ulong): longint; cdecl; external libgsl;
function gsl_matrix_ulong_div_elements(a: Pgsl_matrix_ulong; b: Pgsl_matrix_ulong): longint; cdecl; external libgsl;
function gsl_matrix_ulong_scale(a: Pgsl_matrix_ulong; x: dword): longint; cdecl; external libgsl;
function gsl_matrix_ulong_scale_rows(a: Pgsl_matrix_ulong; x: Pgsl_vector_ulong): longint; cdecl; external libgsl;
function gsl_matrix_ulong_scale_columns(a: Pgsl_matrix_ulong; x: Pgsl_vector_ulong): longint; cdecl; external libgsl;
function gsl_matrix_ulong_add_constant(a: Pgsl_matrix_ulong; x: dword): longint; cdecl; external libgsl;
function gsl_matrix_ulong_add_diagonal(a: Pgsl_matrix_ulong; x: dword): longint; cdecl; external libgsl;

function gsl_matrix_ulong_get_row(v: Pgsl_vector_ulong; m: Pgsl_matrix_ulong; i: Tsize_t): longint; cdecl; external libgsl;
function gsl_matrix_ulong_get_col(v: Pgsl_vector_ulong; m: Pgsl_matrix_ulong; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_matrix_ulong_set_row(m: Pgsl_matrix_ulong; i: Tsize_t; v: Pgsl_vector_ulong): longint; cdecl; external libgsl;
function gsl_matrix_ulong_set_col(m: Pgsl_matrix_ulong; j: Tsize_t; v: Pgsl_vector_ulong): longint; cdecl; external libgsl;

function gsl_matrix_ulong_get(m: Pgsl_matrix_ulong; i: Tsize_t; j: Tsize_t): dword; cdecl; external libgsl;
procedure gsl_matrix_ulong_set(m: Pgsl_matrix_ulong; i: Tsize_t; j: Tsize_t; x: dword); cdecl; external libgsl;
function gsl_matrix_ulong_ptr(m: Pgsl_matrix_ulong; i: Tsize_t; j: Tsize_t): Pdword; cdecl; external libgsl;
function gsl_matrix_ulong_const_ptr(m: Pgsl_matrix_ulong; i: Tsize_t; j: Tsize_t): Pdword; cdecl; external libgsl;

// === Konventiert am: 20-8-25 17:02:04 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
