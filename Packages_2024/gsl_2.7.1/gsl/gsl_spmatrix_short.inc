{$IFDEF read_interface}


type
  Tgsl_spmatrix_short = record
    size1: Tsize_t;
    size2: Tsize_t;
    i: Plongint;
    data: Psmallint;
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
        2: (work_atomic: Psmallint);
      end;
    sptype: longint;
    spflags: Tsize_t;
  end;
  Pgsl_spmatrix_short = ^Tgsl_spmatrix_short;

function gsl_spmatrix_short_alloc(n1: Tsize_t; n2: Tsize_t): Pgsl_spmatrix_short; cdecl; external libgsl;
function gsl_spmatrix_short_alloc_nzmax(n1: Tsize_t; n2: Tsize_t; nzmax: Tsize_t; sptype: longint): Pgsl_spmatrix_short; cdecl; external libgsl;
procedure gsl_spmatrix_short_free(m: Pgsl_spmatrix_short); cdecl; external libgsl;
function gsl_spmatrix_short_realloc(nzmax: Tsize_t; m: Pgsl_spmatrix_short): longint; cdecl; external libgsl;
function gsl_spmatrix_short_nnz(m: Pgsl_spmatrix_short): Tsize_t; cdecl; external libgsl;
function gsl_spmatrix_short_type(m: Pgsl_spmatrix_short): pchar; cdecl; external libgsl;
function gsl_spmatrix_short_set_zero(m: Pgsl_spmatrix_short): longint; cdecl; external libgsl;
function gsl_spmatrix_short_tree_rebuild(m: Pgsl_spmatrix_short): longint; cdecl; external libgsl;

function gsl_spmatrix_short_csc(dest: Pgsl_spmatrix_short; src: Pgsl_spmatrix_short): longint; cdecl; external libgsl;
function gsl_spmatrix_short_csr(dest: Pgsl_spmatrix_short; src: Pgsl_spmatrix_short): longint; cdecl; external libgsl;
function gsl_spmatrix_short_compress(src: Pgsl_spmatrix_short; sptype: longint): Pgsl_spmatrix_short; cdecl; external libgsl;
function gsl_spmatrix_short_compcol(src: Pgsl_spmatrix_short): Pgsl_spmatrix_short; cdecl; external libgsl;
function gsl_spmatrix_short_ccs(src: Pgsl_spmatrix_short): Pgsl_spmatrix_short; cdecl; external libgsl;
function gsl_spmatrix_short_crs(src: Pgsl_spmatrix_short): Pgsl_spmatrix_short; cdecl; external libgsl;

function gsl_spmatrix_short_memcpy(dest: Pgsl_spmatrix_short; src: Pgsl_spmatrix_short): longint; cdecl; external libgsl;

function gsl_spmatrix_short_fprintf(stream: PFILE; m: Pgsl_spmatrix_short; format: pchar): longint; cdecl; external libgsl;
function gsl_spmatrix_short_fscanf(stream: PFILE): Pgsl_spmatrix_short; cdecl; external libgsl;
function gsl_spmatrix_short_fwrite(stream: PFILE; m: Pgsl_spmatrix_short): longint; cdecl; external libgsl;
function gsl_spmatrix_short_fread(stream: PFILE; m: Pgsl_spmatrix_short): longint; cdecl; external libgsl;

function gsl_spmatrix_short_get(m: Pgsl_spmatrix_short; i: Tsize_t; j: Tsize_t): smallint; cdecl; external libgsl;
function gsl_spmatrix_short_set(m: Pgsl_spmatrix_short; i: Tsize_t; j: Tsize_t; x: smallint): longint; cdecl; external libgsl;
function gsl_spmatrix_short_ptr(m: Pgsl_spmatrix_short; i: Tsize_t; j: Tsize_t): Psmallint; cdecl; external libgsl;

function gsl_spmatrix_short_minmax(m: Pgsl_spmatrix_short; min_out: Psmallint; max_out: Psmallint): longint; cdecl; external libgsl;
function gsl_spmatrix_short_min_index(m: Pgsl_spmatrix_short; imin_out: Psize_t; jmin_out: Psize_t): longint; cdecl; external libgsl;

function gsl_spmatrix_short_scale(m: Pgsl_spmatrix_short; x: smallint): longint; cdecl; external libgsl;
function gsl_spmatrix_short_scale_columns(m: Pgsl_spmatrix_short; x: Pgsl_vector_short): longint; cdecl; external libgsl;
function gsl_spmatrix_short_scale_rows(m: Pgsl_spmatrix_short; x: Pgsl_vector_short): longint; cdecl; external libgsl;
function gsl_spmatrix_short_add(c: Pgsl_spmatrix_short; a: Pgsl_spmatrix_short; b: Pgsl_spmatrix_short): longint; cdecl; external libgsl;
function gsl_spmatrix_short_dense_add(a: Pgsl_matrix_short; b: Pgsl_spmatrix_short): longint; cdecl; external libgsl;
function gsl_spmatrix_short_dense_sub(a: Pgsl_matrix_short; b: Pgsl_spmatrix_short): longint; cdecl; external libgsl;
function gsl_spmatrix_short_d2sp(T: Pgsl_spmatrix_short; A: Pgsl_matrix_short): longint; cdecl; external libgsl;
function gsl_spmatrix_short_sp2d(A: Pgsl_matrix_short; S: Pgsl_spmatrix_short): longint; cdecl; external libgsl;

function gsl_spmatrix_short_add_to_dense(a: Pgsl_matrix_short; b: Pgsl_spmatrix_short): longint; cdecl; external libgsl; deprecated;

function gsl_spmatrix_short_equal(a: Pgsl_spmatrix_short; b: Pgsl_spmatrix_short): longint; cdecl; external libgsl;
function gsl_spmatrix_short_norm1(a: Pgsl_spmatrix_short): smallint; cdecl; external libgsl;

function gsl_spmatrix_short_transpose(m: Pgsl_spmatrix_short): longint; cdecl; external libgsl;
function gsl_spmatrix_short_transpose2(m: Pgsl_spmatrix_short): longint; cdecl; external libgsl;
function gsl_spmatrix_short_transpose_memcpy(dest: Pgsl_spmatrix_short; src: Pgsl_spmatrix_short): longint; cdecl; external libgsl;

// === Konventiert am: 20-8-25 17:35:02 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
