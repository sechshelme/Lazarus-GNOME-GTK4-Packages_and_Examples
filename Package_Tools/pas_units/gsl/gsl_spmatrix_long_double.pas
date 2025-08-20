unit gsl_spmatrix_long_double;

interface

uses
  fp_gsl, gsl_bst, gsl_spmatrix, gsl_vector_long_double, gsl_matrix_long_double;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tgsl_spmatrix_long_double = record
    size1: Tsize_t;
    size2: Tsize_t;
    i: Plongint;
    data: Plong_double;
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
        2: (work_atomic: Plong_double);
      end;
    sptype: longint;
    spflags: Tsize_t;
  end;
  Pgsl_spmatrix_long_double = ^Tgsl_spmatrix_long_double;

function gsl_spmatrix_long_double_alloc(n1: Tsize_t; n2: Tsize_t): Pgsl_spmatrix_long_double; cdecl; external libgsl;
function gsl_spmatrix_long_double_alloc_nzmax(n1: Tsize_t; n2: Tsize_t; nzmax: Tsize_t; sptype: longint): Pgsl_spmatrix_long_double; cdecl; external libgsl;
procedure gsl_spmatrix_long_double_free(m: Pgsl_spmatrix_long_double); cdecl; external libgsl;
function gsl_spmatrix_long_double_realloc(nzmax: Tsize_t; m: Pgsl_spmatrix_long_double): longint; cdecl; external libgsl;
function gsl_spmatrix_long_double_nnz(m: Pgsl_spmatrix_long_double): Tsize_t; cdecl; external libgsl;
function gsl_spmatrix_long_double_type(m: Pgsl_spmatrix_long_double): pchar; cdecl; external libgsl;
function gsl_spmatrix_long_double_set_zero(m: Pgsl_spmatrix_long_double): longint; cdecl; external libgsl;
function gsl_spmatrix_long_double_tree_rebuild(m: Pgsl_spmatrix_long_double): longint; cdecl; external libgsl;

function gsl_spmatrix_long_double_csc(dest: Pgsl_spmatrix_long_double; src: Pgsl_spmatrix_long_double): longint; cdecl; external libgsl;
function gsl_spmatrix_long_double_csr(dest: Pgsl_spmatrix_long_double; src: Pgsl_spmatrix_long_double): longint; cdecl; external libgsl;
function gsl_spmatrix_long_double_compress(src: Pgsl_spmatrix_long_double; sptype: longint): Pgsl_spmatrix_long_double; cdecl; external libgsl;
function gsl_spmatrix_long_double_compcol(src: Pgsl_spmatrix_long_double): Pgsl_spmatrix_long_double; cdecl; external libgsl;
function gsl_spmatrix_long_double_ccs(src: Pgsl_spmatrix_long_double): Pgsl_spmatrix_long_double; cdecl; external libgsl;
function gsl_spmatrix_long_double_crs(src: Pgsl_spmatrix_long_double): Pgsl_spmatrix_long_double; cdecl; external libgsl;

function gsl_spmatrix_long_double_memcpy(dest: Pgsl_spmatrix_long_double; src: Pgsl_spmatrix_long_double): longint; cdecl; external libgsl;

function gsl_spmatrix_long_double_fprintf(stream: PFILE; m: Pgsl_spmatrix_long_double; format: pchar): longint; cdecl; external libgsl;
function gsl_spmatrix_long_double_fscanf(stream: PFILE): Pgsl_spmatrix_long_double; cdecl; external libgsl;
function gsl_spmatrix_long_double_fwrite(stream: PFILE; m: Pgsl_spmatrix_long_double): longint; cdecl; external libgsl;
function gsl_spmatrix_long_double_fread(stream: PFILE; m: Pgsl_spmatrix_long_double): longint; cdecl; external libgsl;

function gsl_spmatrix_long_double_get(m: Pgsl_spmatrix_long_double; i: Tsize_t; j: Tsize_t): Tlong_double; cdecl; external libgsl;
function gsl_spmatrix_long_double_set(m: Pgsl_spmatrix_long_double; i: Tsize_t; j: Tsize_t; x: Tlong_double): longint; cdecl; external libgsl;
function gsl_spmatrix_long_double_ptr(m: Pgsl_spmatrix_long_double; i: Tsize_t; j: Tsize_t): Plong_double; cdecl; external libgsl;

function gsl_spmatrix_long_double_minmax(m: Pgsl_spmatrix_long_double; min_out: Plong_double; max_out: Plong_double): longint; cdecl; external libgsl;
function gsl_spmatrix_long_double_min_index(m: Pgsl_spmatrix_long_double; imin_out: Psize_t; jmin_out: Psize_t): longint; cdecl; external libgsl;

function gsl_spmatrix_long_double_scale(m: Pgsl_spmatrix_long_double; x: Tlong_double): longint; cdecl; external libgsl;
function gsl_spmatrix_long_double_scale_columns(m: Pgsl_spmatrix_long_double; x: Pgsl_vector_long_double): longint; cdecl; external libgsl;
function gsl_spmatrix_long_double_scale_rows(m: Pgsl_spmatrix_long_double; x: Pgsl_vector_long_double): longint; cdecl; external libgsl;
function gsl_spmatrix_long_double_add(c: Pgsl_spmatrix_long_double; a: Pgsl_spmatrix_long_double; b: Pgsl_spmatrix_long_double): longint; cdecl; external libgsl;
function gsl_spmatrix_long_double_dense_add(a: Pgsl_matrix_long_double; b: Pgsl_spmatrix_long_double): longint; cdecl; external libgsl;
function gsl_spmatrix_long_double_dense_sub(a: Pgsl_matrix_long_double; b: Pgsl_spmatrix_long_double): longint; cdecl; external libgsl;
function gsl_spmatrix_long_double_d2sp(T: Pgsl_spmatrix_long_double; A: Pgsl_matrix_long_double): longint; cdecl; external libgsl;
function gsl_spmatrix_long_double_sp2d(A: Pgsl_matrix_long_double; S: Pgsl_spmatrix_long_double): longint; cdecl; external libgsl;

function gsl_spmatrix_long_double_add_to_dense(a: Pgsl_matrix_long_double; b: Pgsl_spmatrix_long_double): longint; cdecl; external libgsl; deprecated;

function gsl_spmatrix_long_double_equal(a: Pgsl_spmatrix_long_double; b: Pgsl_spmatrix_long_double): longint; cdecl; external libgsl;
function gsl_spmatrix_long_double_norm1(a: Pgsl_spmatrix_long_double): Tlong_double; cdecl; external libgsl;

function gsl_spmatrix_long_double_transpose(m: Pgsl_spmatrix_long_double): longint; cdecl; external libgsl;
function gsl_spmatrix_long_double_transpose2(m: Pgsl_spmatrix_long_double): longint; cdecl; external libgsl;
function gsl_spmatrix_long_double_transpose_memcpy(dest: Pgsl_spmatrix_long_double; src: Pgsl_spmatrix_long_double): longint; cdecl; external libgsl;

// === Konventiert am: 20-8-25 17:35:00 ===


implementation



end.
