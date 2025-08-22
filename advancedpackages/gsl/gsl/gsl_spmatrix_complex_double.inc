{$IFDEF read_interface}


type
  Tgsl_spmatrix_complex = record
    size1: Tsize_t;
    size2: Tsize_t;
    i: Plongint;
    data: Pdouble;
    p: Plongint;
    nzmax: Tsize_t;
    nz: Tsize_t;
    tree: Pgsl_bst_workspace;
    pool: Pgsl_spmatrix_pool;
    node_size: Tsize_t;
    work: record
      case longint of
        0: (work_void: pointer);
        1: (work_int: Plongint);
        2: (work_atomic: Pdouble);
      end;
    sptype: longint;
    spflags: Tsize_t;
  end;
  Pgsl_spmatrix_complex = ^Tgsl_spmatrix_complex;

function gsl_spmatrix_complex_alloc(n1: Tsize_t; n2: Tsize_t): Pgsl_spmatrix_complex; cdecl; external libgsl;
function gsl_spmatrix_complex_alloc_nzmax(n1: Tsize_t; n2: Tsize_t; nzmax: Tsize_t; sptype: longint): Pgsl_spmatrix_complex; cdecl; external libgsl;
procedure gsl_spmatrix_complex_free(m: Pgsl_spmatrix_complex); cdecl; external libgsl;
function gsl_spmatrix_complex_realloc(nzmax: Tsize_t; m: Pgsl_spmatrix_complex): longint; cdecl; external libgsl;
function gsl_spmatrix_complex_nnz(m: Pgsl_spmatrix_complex): Tsize_t; cdecl; external libgsl;
function gsl_spmatrix_complex_type(m: Pgsl_spmatrix_complex): pchar; cdecl; external libgsl;
function gsl_spmatrix_complex_set_zero(m: Pgsl_spmatrix_complex): longint; cdecl; external libgsl;
function gsl_spmatrix_complex_tree_rebuild(m: Pgsl_spmatrix_complex): longint; cdecl; external libgsl;

function gsl_spmatrix_complex_csc(dest: Pgsl_spmatrix_complex; src: Pgsl_spmatrix_complex): longint; cdecl; external libgsl;
function gsl_spmatrix_complex_csr(dest: Pgsl_spmatrix_complex; src: Pgsl_spmatrix_complex): longint; cdecl; external libgsl;
function gsl_spmatrix_complex_compress(src: Pgsl_spmatrix_complex; sptype: longint): Pgsl_spmatrix_complex; cdecl; external libgsl;
function gsl_spmatrix_complex_compcol(src: Pgsl_spmatrix_complex): Pgsl_spmatrix_complex; cdecl; external libgsl;
function gsl_spmatrix_complex_ccs(src: Pgsl_spmatrix_complex): Pgsl_spmatrix_complex; cdecl; external libgsl;
function gsl_spmatrix_complex_crs(src: Pgsl_spmatrix_complex): Pgsl_spmatrix_complex; cdecl; external libgsl;

function gsl_spmatrix_complex_memcpy(dest: Pgsl_spmatrix_complex; src: Pgsl_spmatrix_complex): longint; cdecl; external libgsl;

function gsl_spmatrix_complex_fprintf(stream: PFILE; m: Pgsl_spmatrix_complex; format: pchar): longint; cdecl; external libgsl;
function gsl_spmatrix_complex_fscanf(stream: PFILE): Pgsl_spmatrix_complex; cdecl; external libgsl;
function gsl_spmatrix_complex_fwrite(stream: PFILE; m: Pgsl_spmatrix_complex): longint; cdecl; external libgsl;
function gsl_spmatrix_complex_fread(stream: PFILE; m: Pgsl_spmatrix_complex): longint; cdecl; external libgsl;

function gsl_spmatrix_complex_get(m: Pgsl_spmatrix_complex; i: Tsize_t; j: Tsize_t): Tgsl_complex; cdecl; external libgsl;
function gsl_spmatrix_complex_set(m: Pgsl_spmatrix_complex; i: Tsize_t; j: Tsize_t; x: Tgsl_complex): longint; cdecl; external libgsl;
function gsl_spmatrix_complex_ptr(m: Pgsl_spmatrix_complex; i: Tsize_t; j: Tsize_t): Pgsl_complex; cdecl; external libgsl;

function gsl_spmatrix_complex_scale(m: Pgsl_spmatrix_complex; x: Tgsl_complex): longint; cdecl; external libgsl;
function gsl_spmatrix_complex_scale_columns(m: Pgsl_spmatrix_complex; x: Pgsl_vector_complex): longint; cdecl; external libgsl;
function gsl_spmatrix_complex_scale_rows(m: Pgsl_spmatrix_complex; x: Pgsl_vector_complex): longint; cdecl; external libgsl;
function gsl_spmatrix_complex_add(c: Pgsl_spmatrix_complex; a: Pgsl_spmatrix_complex; b: Pgsl_spmatrix_complex): longint; cdecl; external libgsl;
function gsl_spmatrix_complex_dense_add(a: Pgsl_matrix_complex; b: Pgsl_spmatrix_complex): longint; cdecl; external libgsl;
function gsl_spmatrix_complex_dense_sub(a: Pgsl_matrix_complex; b: Pgsl_spmatrix_complex): longint; cdecl; external libgsl;
function gsl_spmatrix_complex_d2sp(T: Pgsl_spmatrix_complex; A: Pgsl_matrix_complex): longint; cdecl; external libgsl;
function gsl_spmatrix_complex_sp2d(A: Pgsl_matrix_complex; S: Pgsl_spmatrix_complex): longint; cdecl; external libgsl;

function gsl_spmatrix_complex_add_to_dense(a: Pgsl_matrix_complex; b: Pgsl_spmatrix_complex): longint; cdecl; external libgsl; deprecated;

function gsl_spmatrix_complex_equal(a: Pgsl_spmatrix_complex; b: Pgsl_spmatrix_complex): longint; cdecl; external libgsl;
function gsl_spmatrix_complex_transpose(m: Pgsl_spmatrix_complex): longint; cdecl; external libgsl;
function gsl_spmatrix_complex_transpose2(m: Pgsl_spmatrix_complex): longint; cdecl; external libgsl;
function gsl_spmatrix_complex_transpose_memcpy(dest: Pgsl_spmatrix_complex; src: Pgsl_spmatrix_complex): longint; cdecl; external libgsl;

// === Konventiert am: 20-8-25 17:32:54 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
