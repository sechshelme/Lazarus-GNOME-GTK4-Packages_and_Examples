{$IFDEF read_interface}


type
  Tgsl_spmatrix = record
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
  Pgsl_spmatrix = ^Tgsl_spmatrix;

function gsl_spmatrix_alloc(n1: Tsize_t; n2: Tsize_t): Pgsl_spmatrix; cdecl; external libgsl;
function gsl_spmatrix_alloc_nzmax(n1: Tsize_t; n2: Tsize_t; nzmax: Tsize_t; sptype: longint): Pgsl_spmatrix; cdecl; external libgsl;
procedure gsl_spmatrix_free(m: Pgsl_spmatrix); cdecl; external libgsl;
function gsl_spmatrix_realloc(nzmax: Tsize_t; m: Pgsl_spmatrix): longint; cdecl; external libgsl;
function gsl_spmatrix_nnz(m: Pgsl_spmatrix): Tsize_t; cdecl; external libgsl;
function gsl_spmatrix_type(m: Pgsl_spmatrix): pchar; cdecl; external libgsl;
function gsl_spmatrix_set_zero(m: Pgsl_spmatrix): longint; cdecl; external libgsl;
function gsl_spmatrix_tree_rebuild(m: Pgsl_spmatrix): longint; cdecl; external libgsl;

function gsl_spmatrix_csc(dest: Pgsl_spmatrix; src: Pgsl_spmatrix): longint; cdecl; external libgsl;
function gsl_spmatrix_csr(dest: Pgsl_spmatrix; src: Pgsl_spmatrix): longint; cdecl; external libgsl;
function gsl_spmatrix_compress(src: Pgsl_spmatrix; sptype: longint): Pgsl_spmatrix; cdecl; external libgsl;
function gsl_spmatrix_compcol(src: Pgsl_spmatrix): Pgsl_spmatrix; cdecl; external libgsl;
function gsl_spmatrix_ccs(src: Pgsl_spmatrix): Pgsl_spmatrix; cdecl; external libgsl;
function gsl_spmatrix_crs(src: Pgsl_spmatrix): Pgsl_spmatrix; cdecl; external libgsl;

function gsl_spmatrix_memcpy(dest: Pgsl_spmatrix; src: Pgsl_spmatrix): longint; cdecl; external libgsl;

function gsl_spmatrix_fprintf(stream: PFILE; m: Pgsl_spmatrix; format: pchar): longint; cdecl; external libgsl;
function gsl_spmatrix_fscanf(stream: PFILE): Pgsl_spmatrix; cdecl; external libgsl;
function gsl_spmatrix_fwrite(stream: PFILE; m: Pgsl_spmatrix): longint; cdecl; external libgsl;
function gsl_spmatrix_fread(stream: PFILE; m: Pgsl_spmatrix): longint; cdecl; external libgsl;

function gsl_spmatrix_get(m: Pgsl_spmatrix; i: Tsize_t; j: Tsize_t): double; cdecl; external libgsl;
function gsl_spmatrix_set(m: Pgsl_spmatrix; i: Tsize_t; j: Tsize_t; x: double): longint; cdecl; external libgsl;
function gsl_spmatrix_ptr(m: Pgsl_spmatrix; i: Tsize_t; j: Tsize_t): Pdouble; cdecl; external libgsl;

function gsl_spmatrix_minmax(m: Pgsl_spmatrix; min_out: Pdouble; max_out: Pdouble): longint; cdecl; external libgsl;
function gsl_spmatrix_min_index(m: Pgsl_spmatrix; imin_out: Psize_t; jmin_out: Psize_t): longint; cdecl; external libgsl;

function gsl_spmatrix_scale(m: Pgsl_spmatrix; x: double): longint; cdecl; external libgsl;
function gsl_spmatrix_scale_columns(m: Pgsl_spmatrix; x: Pgsl_vector): longint; cdecl; external libgsl;
function gsl_spmatrix_scale_rows(m: Pgsl_spmatrix; x: Pgsl_vector): longint; cdecl; external libgsl;
function gsl_spmatrix_add(c: Pgsl_spmatrix; a: Pgsl_spmatrix; b: Pgsl_spmatrix): longint; cdecl; external libgsl;
function gsl_spmatrix_dense_add(a: Pgsl_matrix; b: Pgsl_spmatrix): longint; cdecl; external libgsl;
function gsl_spmatrix_dense_sub(a: Pgsl_matrix; b: Pgsl_spmatrix): longint; cdecl; external libgsl;
function gsl_spmatrix_d2sp(T: Pgsl_spmatrix; A: Pgsl_matrix): longint; cdecl; external libgsl;
function gsl_spmatrix_sp2d(A: Pgsl_matrix; S: Pgsl_spmatrix): longint; cdecl; external libgsl;

function gsl_spmatrix_add_to_dense(a: Pgsl_matrix; b: Pgsl_spmatrix): longint; cdecl; external libgsl; deprecated;

function gsl_spmatrix_equal(a: Pgsl_spmatrix; b: Pgsl_spmatrix): longint; cdecl; external libgsl;
function gsl_spmatrix_norm1(a: Pgsl_spmatrix): double; cdecl; external libgsl;

function gsl_spmatrix_transpose(m: Pgsl_spmatrix): longint; cdecl; external libgsl;
function gsl_spmatrix_transpose2(m: Pgsl_spmatrix): longint; cdecl; external libgsl;
function gsl_spmatrix_transpose_memcpy(dest: Pgsl_spmatrix; src: Pgsl_spmatrix): longint; cdecl; external libgsl;

// === Konventiert am: 20-8-25 17:34:03 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
