{$IFDEF read_interface}


type
  Tgsl_spmatrix_char = record
    size1: Tsize_t;
    size2: Tsize_t;
    i: Plongint;
    data: pint8;
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
        2: (work_atomic: pint8);
      end;
    sptype: longint;
    spflags: Tsize_t;
  end;
  Pgsl_spmatrix_char = ^Tgsl_spmatrix_char;

function gsl_spmatrix_char_alloc(n1: Tsize_t; n2: Tsize_t): Pgsl_spmatrix_char; cdecl; external libgsl;
function gsl_spmatrix_char_alloc_nzmax(n1: Tsize_t; n2: Tsize_t; nzmax: Tsize_t; sptype: longint): Pgsl_spmatrix_char; cdecl; external libgsl;
procedure gsl_spmatrix_char_free(m: Pgsl_spmatrix_char); cdecl; external libgsl;
function gsl_spmatrix_char_realloc(nzmax: Tsize_t; m: Pgsl_spmatrix_char): longint; cdecl; external libgsl;
function gsl_spmatrix_char_nnz(m: Pgsl_spmatrix_char): Tsize_t; cdecl; external libgsl;
function gsl_spmatrix_char_type(m: Pgsl_spmatrix_char): pchar; cdecl; external libgsl;
function gsl_spmatrix_char_set_zero(m: Pgsl_spmatrix_char): longint; cdecl; external libgsl;
function gsl_spmatrix_char_tree_rebuild(m: Pgsl_spmatrix_char): longint; cdecl; external libgsl;

function gsl_spmatrix_char_csc(dest: Pgsl_spmatrix_char; src: Pgsl_spmatrix_char): longint; cdecl; external libgsl;
function gsl_spmatrix_char_csr(dest: Pgsl_spmatrix_char; src: Pgsl_spmatrix_char): longint; cdecl; external libgsl;
function gsl_spmatrix_char_compress(src: Pgsl_spmatrix_char; sptype: longint): Pgsl_spmatrix_char; cdecl; external libgsl;
function gsl_spmatrix_char_compcol(src: Pgsl_spmatrix_char): Pgsl_spmatrix_char; cdecl; external libgsl;
function gsl_spmatrix_char_ccs(src: Pgsl_spmatrix_char): Pgsl_spmatrix_char; cdecl; external libgsl;
function gsl_spmatrix_char_crs(src: Pgsl_spmatrix_char): Pgsl_spmatrix_char; cdecl; external libgsl;

function gsl_spmatrix_char_memcpy(dest: Pgsl_spmatrix_char; src: Pgsl_spmatrix_char): longint; cdecl; external libgsl;

function gsl_spmatrix_char_fprintf(stream: PFILE; m: Pgsl_spmatrix_char; format: pchar): longint; cdecl; external libgsl;
function gsl_spmatrix_char_fscanf(stream: PFILE): Pgsl_spmatrix_char; cdecl; external libgsl;
function gsl_spmatrix_char_fwrite(stream: PFILE; m: Pgsl_spmatrix_char): longint; cdecl; external libgsl;
function gsl_spmatrix_char_fread(stream: PFILE; m: Pgsl_spmatrix_char): longint; cdecl; external libgsl;

function gsl_spmatrix_char_get(m: Pgsl_spmatrix_char; i: Tsize_t; j: Tsize_t): char; cdecl; external libgsl;
function gsl_spmatrix_char_set(m: Pgsl_spmatrix_char; i: Tsize_t; j: Tsize_t; x: char): longint; cdecl; external libgsl;
function gsl_spmatrix_char_ptr(m: Pgsl_spmatrix_char; i: Tsize_t; j: Tsize_t): pint8; cdecl; external libgsl;

function gsl_spmatrix_char_minmax(m: Pgsl_spmatrix_char; min_out: pint8; max_out: pint8): longint; cdecl; external libgsl;
function gsl_spmatrix_char_min_index(m: Pgsl_spmatrix_char; imin_out: Psize_t; jmin_out: Psize_t): longint; cdecl; external libgsl;

function gsl_spmatrix_char_scale(m: Pgsl_spmatrix_char; x: char): longint; cdecl; external libgsl;
function gsl_spmatrix_char_scale_columns(m: Pgsl_spmatrix_char; x: Pgsl_vector_char): longint; cdecl; external libgsl;
function gsl_spmatrix_char_scale_rows(m: Pgsl_spmatrix_char; x: Pgsl_vector_char): longint; cdecl; external libgsl;
function gsl_spmatrix_char_add(c: Pgsl_spmatrix_char; a: Pgsl_spmatrix_char; b: Pgsl_spmatrix_char): longint; cdecl; external libgsl;
function gsl_spmatrix_char_dense_add(a: Pgsl_matrix_char; b: Pgsl_spmatrix_char): longint; cdecl; external libgsl;
function gsl_spmatrix_char_dense_sub(a: Pgsl_matrix_char; b: Pgsl_spmatrix_char): longint; cdecl; external libgsl;
function gsl_spmatrix_char_d2sp(T: Pgsl_spmatrix_char; A: Pgsl_matrix_char): longint; cdecl; external libgsl;
function gsl_spmatrix_char_sp2d(A: Pgsl_matrix_char; S: Pgsl_spmatrix_char): longint; cdecl; external libgsl;

function gsl_spmatrix_char_add_to_dense(a: Pgsl_matrix_char; b: Pgsl_spmatrix_char): longint; cdecl; external libgsl; deprecated;

function gsl_spmatrix_char_equal(a: Pgsl_spmatrix_char; b: Pgsl_spmatrix_char): longint; cdecl; external libgsl;
function gsl_spmatrix_char_norm1(a: Pgsl_spmatrix_char): char; cdecl; external libgsl;

function gsl_spmatrix_char_transpose(m: Pgsl_spmatrix_char): longint; cdecl; external libgsl;
function gsl_spmatrix_char_transpose2(m: Pgsl_spmatrix_char): longint; cdecl; external libgsl;
function gsl_spmatrix_char_transpose_memcpy(dest: Pgsl_spmatrix_char; src: Pgsl_spmatrix_char): longint; cdecl; external libgsl;

// === Konventiert am: 20-8-25 17:32:51 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
