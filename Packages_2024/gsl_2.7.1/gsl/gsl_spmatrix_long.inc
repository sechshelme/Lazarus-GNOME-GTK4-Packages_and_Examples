{$IFDEF read_interface}


type
  Tgsl_spmatrix_long = record
    size1: Tsize_t;
    size2: Tsize_t;
    i: Plongint;
    data: Plongint;
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
        2: (work_atomic: Plongint);
      end;
    sptype: longint;
    spflags: Tsize_t;
  end;
  Pgsl_spmatrix_long = ^Tgsl_spmatrix_long;

function gsl_spmatrix_long_alloc(n1: Tsize_t; n2: Tsize_t): Pgsl_spmatrix_long; cdecl; external libgsl;
function gsl_spmatrix_long_alloc_nzmax(n1: Tsize_t; n2: Tsize_t; nzmax: Tsize_t; sptype: longint): Pgsl_spmatrix_long; cdecl; external libgsl;
procedure gsl_spmatrix_long_free(m: Pgsl_spmatrix_long); cdecl; external libgsl;
function gsl_spmatrix_long_realloc(nzmax: Tsize_t; m: Pgsl_spmatrix_long): longint; cdecl; external libgsl;
function gsl_spmatrix_long_nnz(m: Pgsl_spmatrix_long): Tsize_t; cdecl; external libgsl;
function gsl_spmatrix_long_type(m: Pgsl_spmatrix_long): pchar; cdecl; external libgsl;
function gsl_spmatrix_long_set_zero(m: Pgsl_spmatrix_long): longint; cdecl; external libgsl;
function gsl_spmatrix_long_tree_rebuild(m: Pgsl_spmatrix_long): longint; cdecl; external libgsl;

function gsl_spmatrix_long_csc(dest: Pgsl_spmatrix_long; src: Pgsl_spmatrix_long): longint; cdecl; external libgsl;
function gsl_spmatrix_long_csr(dest: Pgsl_spmatrix_long; src: Pgsl_spmatrix_long): longint; cdecl; external libgsl;
function gsl_spmatrix_long_compress(src: Pgsl_spmatrix_long; sptype: longint): Pgsl_spmatrix_long; cdecl; external libgsl;
function gsl_spmatrix_long_compcol(src: Pgsl_spmatrix_long): Pgsl_spmatrix_long; cdecl; external libgsl;
function gsl_spmatrix_long_ccs(src: Pgsl_spmatrix_long): Pgsl_spmatrix_long; cdecl; external libgsl;
function gsl_spmatrix_long_crs(src: Pgsl_spmatrix_long): Pgsl_spmatrix_long; cdecl; external libgsl;

function gsl_spmatrix_long_memcpy(dest: Pgsl_spmatrix_long; src: Pgsl_spmatrix_long): longint; cdecl; external libgsl;

function gsl_spmatrix_long_fprintf(stream: PFILE; m: Pgsl_spmatrix_long; format: pchar): longint; cdecl; external libgsl;
function gsl_spmatrix_long_fscanf(stream: PFILE): Pgsl_spmatrix_long; cdecl; external libgsl;
function gsl_spmatrix_long_fwrite(stream: PFILE; m: Pgsl_spmatrix_long): longint; cdecl; external libgsl;
function gsl_spmatrix_long_fread(stream: PFILE; m: Pgsl_spmatrix_long): longint; cdecl; external libgsl;

function gsl_spmatrix_long_get(m: Pgsl_spmatrix_long; i: Tsize_t; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_spmatrix_long_set(m: Pgsl_spmatrix_long; i: Tsize_t; j: Tsize_t; x: longint): longint; cdecl; external libgsl;
function gsl_spmatrix_long_ptr(m: Pgsl_spmatrix_long; i: Tsize_t; j: Tsize_t): Plongint; cdecl; external libgsl;

function gsl_spmatrix_long_minmax(m: Pgsl_spmatrix_long; min_out: Plongint; max_out: Plongint): longint; cdecl; external libgsl;
function gsl_spmatrix_long_min_index(m: Pgsl_spmatrix_long; imin_out: Psize_t; jmin_out: Psize_t): longint; cdecl; external libgsl;

function gsl_spmatrix_long_scale(m: Pgsl_spmatrix_long; x: longint): longint; cdecl; external libgsl;
function gsl_spmatrix_long_scale_columns(m: Pgsl_spmatrix_long; x: Pgsl_vector_long): longint; cdecl; external libgsl;
function gsl_spmatrix_long_scale_rows(m: Pgsl_spmatrix_long; x: Pgsl_vector_long): longint; cdecl; external libgsl;
function gsl_spmatrix_long_add(c: Pgsl_spmatrix_long; a: Pgsl_spmatrix_long; b: Pgsl_spmatrix_long): longint; cdecl; external libgsl;
function gsl_spmatrix_long_dense_add(a: Pgsl_matrix_long; b: Pgsl_spmatrix_long): longint; cdecl; external libgsl;
function gsl_spmatrix_long_dense_sub(a: Pgsl_matrix_long; b: Pgsl_spmatrix_long): longint; cdecl; external libgsl;
function gsl_spmatrix_long_d2sp(T: Pgsl_spmatrix_long; A: Pgsl_matrix_long): longint; cdecl; external libgsl;
function gsl_spmatrix_long_sp2d(A: Pgsl_matrix_long; S: Pgsl_spmatrix_long): longint; cdecl; external libgsl;

function gsl_spmatrix_long_add_to_dense(a: Pgsl_matrix_long; b: Pgsl_spmatrix_long): longint; cdecl; external libgsl; deprecated;

function gsl_spmatrix_long_equal(a: Pgsl_spmatrix_long; b: Pgsl_spmatrix_long): longint; cdecl; external libgsl;
function gsl_spmatrix_long_norm1(a: Pgsl_spmatrix_long): longint; cdecl; external libgsl;

function gsl_spmatrix_long_transpose(m: Pgsl_spmatrix_long): longint; cdecl; external libgsl;
function gsl_spmatrix_long_transpose2(m: Pgsl_spmatrix_long): longint; cdecl; external libgsl;
function gsl_spmatrix_long_transpose_memcpy(dest: Pgsl_spmatrix_long; src: Pgsl_spmatrix_long): longint; cdecl; external libgsl;

// === Konventiert am: 20-8-25 17:34:11 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
