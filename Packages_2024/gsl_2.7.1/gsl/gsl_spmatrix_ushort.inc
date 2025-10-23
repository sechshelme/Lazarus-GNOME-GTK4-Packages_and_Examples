{$IFDEF read_interface}


type
  Tgsl_spmatrix_ushort = record
    size1: Tsize_t;
    size2: Tsize_t;
    i: Plongint;
    data: Pword;
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
        2: (work_atomic: Pword);
      end;
    sptype: longint;
    spflags: Tsize_t;
  end;
  Pgsl_spmatrix_ushort = ^Tgsl_spmatrix_ushort;

function gsl_spmatrix_ushort_alloc(n1: Tsize_t; n2: Tsize_t): Pgsl_spmatrix_ushort; cdecl; external libgsl;
function gsl_spmatrix_ushort_alloc_nzmax(n1: Tsize_t; n2: Tsize_t; nzmax: Tsize_t; sptype: longint): Pgsl_spmatrix_ushort; cdecl; external libgsl;
procedure gsl_spmatrix_ushort_free(m: Pgsl_spmatrix_ushort); cdecl; external libgsl;
function gsl_spmatrix_ushort_realloc(nzmax: Tsize_t; m: Pgsl_spmatrix_ushort): longint; cdecl; external libgsl;
function gsl_spmatrix_ushort_nnz(m: Pgsl_spmatrix_ushort): Tsize_t; cdecl; external libgsl;
function gsl_spmatrix_ushort_type(m: Pgsl_spmatrix_ushort): pchar; cdecl; external libgsl;
function gsl_spmatrix_ushort_set_zero(m: Pgsl_spmatrix_ushort): longint; cdecl; external libgsl;
function gsl_spmatrix_ushort_tree_rebuild(m: Pgsl_spmatrix_ushort): longint; cdecl; external libgsl;

function gsl_spmatrix_ushort_csc(dest: Pgsl_spmatrix_ushort; src: Pgsl_spmatrix_ushort): longint; cdecl; external libgsl;
function gsl_spmatrix_ushort_csr(dest: Pgsl_spmatrix_ushort; src: Pgsl_spmatrix_ushort): longint; cdecl; external libgsl;
function gsl_spmatrix_ushort_compress(src: Pgsl_spmatrix_ushort; sptype: longint): Pgsl_spmatrix_ushort; cdecl; external libgsl;
function gsl_spmatrix_ushort_compcol(src: Pgsl_spmatrix_ushort): Pgsl_spmatrix_ushort; cdecl; external libgsl;
function gsl_spmatrix_ushort_ccs(src: Pgsl_spmatrix_ushort): Pgsl_spmatrix_ushort; cdecl; external libgsl;
function gsl_spmatrix_ushort_crs(src: Pgsl_spmatrix_ushort): Pgsl_spmatrix_ushort; cdecl; external libgsl;

function gsl_spmatrix_ushort_memcpy(dest: Pgsl_spmatrix_ushort; src: Pgsl_spmatrix_ushort): longint; cdecl; external libgsl;

function gsl_spmatrix_ushort_fprintf(stream: PFILE; m: Pgsl_spmatrix_ushort; format: pchar): longint; cdecl; external libgsl;
function gsl_spmatrix_ushort_fscanf(stream: PFILE): Pgsl_spmatrix_ushort; cdecl; external libgsl;
function gsl_spmatrix_ushort_fwrite(stream: PFILE; m: Pgsl_spmatrix_ushort): longint; cdecl; external libgsl;
function gsl_spmatrix_ushort_fread(stream: PFILE; m: Pgsl_spmatrix_ushort): longint; cdecl; external libgsl;

function gsl_spmatrix_ushort_get(m: Pgsl_spmatrix_ushort; i: Tsize_t; j: Tsize_t): word; cdecl; external libgsl;
function gsl_spmatrix_ushort_set(m: Pgsl_spmatrix_ushort; i: Tsize_t; j: Tsize_t; x: word): longint; cdecl; external libgsl;
function gsl_spmatrix_ushort_ptr(m: Pgsl_spmatrix_ushort; i: Tsize_t; j: Tsize_t): Pword; cdecl; external libgsl;

function gsl_spmatrix_ushort_minmax(m: Pgsl_spmatrix_ushort; min_out: Pword; max_out: Pword): longint; cdecl; external libgsl;
function gsl_spmatrix_ushort_min_index(m: Pgsl_spmatrix_ushort; imin_out: Psize_t; jmin_out: Psize_t): longint; cdecl; external libgsl;

function gsl_spmatrix_ushort_scale(m: Pgsl_spmatrix_ushort; x: word): longint; cdecl; external libgsl;
function gsl_spmatrix_ushort_scale_columns(m: Pgsl_spmatrix_ushort; x: Pgsl_vector_ushort): longint; cdecl; external libgsl;
function gsl_spmatrix_ushort_scale_rows(m: Pgsl_spmatrix_ushort; x: Pgsl_vector_ushort): longint; cdecl; external libgsl;
function gsl_spmatrix_ushort_add(c: Pgsl_spmatrix_ushort; a: Pgsl_spmatrix_ushort; b: Pgsl_spmatrix_ushort): longint; cdecl; external libgsl;
function gsl_spmatrix_ushort_dense_add(a: Pgsl_matrix_ushort; b: Pgsl_spmatrix_ushort): longint; cdecl; external libgsl;
function gsl_spmatrix_ushort_dense_sub(a: Pgsl_matrix_ushort; b: Pgsl_spmatrix_ushort): longint; cdecl; external libgsl;
function gsl_spmatrix_ushort_d2sp(T: Pgsl_spmatrix_ushort; A: Pgsl_matrix_ushort): longint; cdecl; external libgsl;
function gsl_spmatrix_ushort_sp2d(A: Pgsl_matrix_ushort; S: Pgsl_spmatrix_ushort): longint; cdecl; external libgsl;

function gsl_spmatrix_ushort_add_to_dense(a: Pgsl_matrix_ushort; b: Pgsl_spmatrix_ushort): longint; cdecl; external libgsl; deprecated;

function gsl_spmatrix_ushort_equal(a: Pgsl_spmatrix_ushort; b: Pgsl_spmatrix_ushort): longint; cdecl; external libgsl;
function gsl_spmatrix_ushort_norm1(a: Pgsl_spmatrix_ushort): word; cdecl; external libgsl;

function gsl_spmatrix_ushort_transpose(m: Pgsl_spmatrix_ushort): longint; cdecl; external libgsl;
function gsl_spmatrix_ushort_transpose2(m: Pgsl_spmatrix_ushort): longint; cdecl; external libgsl;
function gsl_spmatrix_ushort_transpose_memcpy(dest: Pgsl_spmatrix_ushort; src: Pgsl_spmatrix_ushort): longint; cdecl; external libgsl;

// === Konventiert am: 20-8-25 17:35:17 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
