{$IFDEF read_interface}


type
  Tgsl_spmatrix_int = record
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
  Pgsl_spmatrix_int = ^Tgsl_spmatrix_int;

function gsl_spmatrix_int_alloc(n1: Tsize_t; n2: Tsize_t): Pgsl_spmatrix_int; cdecl; external libgsl;
function gsl_spmatrix_int_alloc_nzmax(n1: Tsize_t; n2: Tsize_t; nzmax: Tsize_t; sptype: longint): Pgsl_spmatrix_int; cdecl; external libgsl;
procedure gsl_spmatrix_int_free(m: Pgsl_spmatrix_int); cdecl; external libgsl;
function gsl_spmatrix_int_realloc(nzmax: Tsize_t; m: Pgsl_spmatrix_int): longint; cdecl; external libgsl;
function gsl_spmatrix_int_nnz(m: Pgsl_spmatrix_int): Tsize_t; cdecl; external libgsl;
function gsl_spmatrix_int_type(m: Pgsl_spmatrix_int): pchar; cdecl; external libgsl;
function gsl_spmatrix_int_set_zero(m: Pgsl_spmatrix_int): longint; cdecl; external libgsl;
function gsl_spmatrix_int_tree_rebuild(m: Pgsl_spmatrix_int): longint; cdecl; external libgsl;

function gsl_spmatrix_int_csc(dest: Pgsl_spmatrix_int; src: Pgsl_spmatrix_int): longint; cdecl; external libgsl;
function gsl_spmatrix_int_csr(dest: Pgsl_spmatrix_int; src: Pgsl_spmatrix_int): longint; cdecl; external libgsl;
function gsl_spmatrix_int_compress(src: Pgsl_spmatrix_int; sptype: longint): Pgsl_spmatrix_int; cdecl; external libgsl;
function gsl_spmatrix_int_compcol(src: Pgsl_spmatrix_int): Pgsl_spmatrix_int; cdecl; external libgsl;
function gsl_spmatrix_int_ccs(src: Pgsl_spmatrix_int): Pgsl_spmatrix_int; cdecl; external libgsl;
function gsl_spmatrix_int_crs(src: Pgsl_spmatrix_int): Pgsl_spmatrix_int; cdecl; external libgsl;

function gsl_spmatrix_int_memcpy(dest: Pgsl_spmatrix_int; src: Pgsl_spmatrix_int): longint; cdecl; external libgsl;

function gsl_spmatrix_int_fprintf(stream: PFILE; m: Pgsl_spmatrix_int; format: pchar): longint; cdecl; external libgsl;
function gsl_spmatrix_int_fscanf(stream: PFILE): Pgsl_spmatrix_int; cdecl; external libgsl;
function gsl_spmatrix_int_fwrite(stream: PFILE; m: Pgsl_spmatrix_int): longint; cdecl; external libgsl;
function gsl_spmatrix_int_fread(stream: PFILE; m: Pgsl_spmatrix_int): longint; cdecl; external libgsl;

function gsl_spmatrix_int_get(m: Pgsl_spmatrix_int; i: Tsize_t; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_spmatrix_int_set(m: Pgsl_spmatrix_int; i: Tsize_t; j: Tsize_t; x: longint): longint; cdecl; external libgsl;
function gsl_spmatrix_int_ptr(m: Pgsl_spmatrix_int; i: Tsize_t; j: Tsize_t): Plongint; cdecl; external libgsl;

function gsl_spmatrix_int_minmax(m: Pgsl_spmatrix_int; min_out: Plongint; max_out: Plongint): longint; cdecl; external libgsl;
function gsl_spmatrix_int_min_index(m: Pgsl_spmatrix_int; imin_out: Psize_t; jmin_out: Psize_t): longint; cdecl; external libgsl;

function gsl_spmatrix_int_scale(m: Pgsl_spmatrix_int; x: longint): longint; cdecl; external libgsl;
function gsl_spmatrix_int_scale_columns(m: Pgsl_spmatrix_int; x: Pgsl_vector_int): longint; cdecl; external libgsl;
function gsl_spmatrix_int_scale_rows(m: Pgsl_spmatrix_int; x: Pgsl_vector_int): longint; cdecl; external libgsl;
function gsl_spmatrix_int_add(c: Pgsl_spmatrix_int; a: Pgsl_spmatrix_int; b: Pgsl_spmatrix_int): longint; cdecl; external libgsl;
function gsl_spmatrix_int_dense_add(a: Pgsl_matrix_int; b: Pgsl_spmatrix_int): longint; cdecl; external libgsl;
function gsl_spmatrix_int_dense_sub(a: Pgsl_matrix_int; b: Pgsl_spmatrix_int): longint; cdecl; external libgsl;
function gsl_spmatrix_int_d2sp(T: Pgsl_spmatrix_int; A: Pgsl_matrix_int): longint; cdecl; external libgsl;
function gsl_spmatrix_int_sp2d(A: Pgsl_matrix_int; S: Pgsl_spmatrix_int): longint; cdecl; external libgsl;

function gsl_spmatrix_int_add_to_dense(a: Pgsl_matrix_int; b: Pgsl_spmatrix_int): longint; cdecl; external libgsl; deprecated;

function gsl_spmatrix_int_equal(a: Pgsl_spmatrix_int; b: Pgsl_spmatrix_int): longint; cdecl; external libgsl;
function gsl_spmatrix_int_norm1(a: Pgsl_spmatrix_int): longint; cdecl; external libgsl;

function gsl_spmatrix_int_transpose(m: Pgsl_spmatrix_int): longint; cdecl; external libgsl;
function gsl_spmatrix_int_transpose2(m: Pgsl_spmatrix_int): longint; cdecl; external libgsl;
function gsl_spmatrix_int_transpose_memcpy(dest: Pgsl_spmatrix_int; src: Pgsl_spmatrix_int): longint; cdecl; external libgsl;

// === Konventiert am: 20-8-25 17:34:08 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
