unit gsl_spmatrix_uint;

interface

uses
  fp_gsl, gsl_bst, gsl_spmatrix, gsl_vector_uint, gsl_matrix_uint;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tgsl_spmatrix_uint = record
    size1: Tsize_t;
    size2: Tsize_t;
    i: Plongint;
    data: Pdword;
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
        2: (work_atomic: Pdword);
      end;
    sptype: longint;
    spflags: Tsize_t;
  end;
  Pgsl_spmatrix_uint = ^Tgsl_spmatrix_uint;

function gsl_spmatrix_uint_alloc(n1: Tsize_t; n2: Tsize_t): Pgsl_spmatrix_uint; cdecl; external libgsl;
function gsl_spmatrix_uint_alloc_nzmax(n1: Tsize_t; n2: Tsize_t; nzmax: Tsize_t; sptype: longint): Pgsl_spmatrix_uint; cdecl; external libgsl;
procedure gsl_spmatrix_uint_free(m: Pgsl_spmatrix_uint); cdecl; external libgsl;
function gsl_spmatrix_uint_realloc(nzmax: Tsize_t; m: Pgsl_spmatrix_uint): longint; cdecl; external libgsl;
function gsl_spmatrix_uint_nnz(m: Pgsl_spmatrix_uint): Tsize_t; cdecl; external libgsl;
function gsl_spmatrix_uint_type(m: Pgsl_spmatrix_uint): pchar; cdecl; external libgsl;
function gsl_spmatrix_uint_set_zero(m: Pgsl_spmatrix_uint): longint; cdecl; external libgsl;
function gsl_spmatrix_uint_tree_rebuild(m: Pgsl_spmatrix_uint): longint; cdecl; external libgsl;

function gsl_spmatrix_uint_csc(dest: Pgsl_spmatrix_uint; src: Pgsl_spmatrix_uint): longint; cdecl; external libgsl;
function gsl_spmatrix_uint_csr(dest: Pgsl_spmatrix_uint; src: Pgsl_spmatrix_uint): longint; cdecl; external libgsl;
function gsl_spmatrix_uint_compress(src: Pgsl_spmatrix_uint; sptype: longint): Pgsl_spmatrix_uint; cdecl; external libgsl;
function gsl_spmatrix_uint_compcol(src: Pgsl_spmatrix_uint): Pgsl_spmatrix_uint; cdecl; external libgsl;
function gsl_spmatrix_uint_ccs(src: Pgsl_spmatrix_uint): Pgsl_spmatrix_uint; cdecl; external libgsl;
function gsl_spmatrix_uint_crs(src: Pgsl_spmatrix_uint): Pgsl_spmatrix_uint; cdecl; external libgsl;

function gsl_spmatrix_uint_memcpy(dest: Pgsl_spmatrix_uint; src: Pgsl_spmatrix_uint): longint; cdecl; external libgsl;

function gsl_spmatrix_uint_fprintf(stream: PFILE; m: Pgsl_spmatrix_uint; format: pchar): longint; cdecl; external libgsl;
function gsl_spmatrix_uint_fscanf(stream: PFILE): Pgsl_spmatrix_uint; cdecl; external libgsl;
function gsl_spmatrix_uint_fwrite(stream: PFILE; m: Pgsl_spmatrix_uint): longint; cdecl; external libgsl;
function gsl_spmatrix_uint_fread(stream: PFILE; m: Pgsl_spmatrix_uint): longint; cdecl; external libgsl;

function gsl_spmatrix_uint_get(m: Pgsl_spmatrix_uint; i: Tsize_t; j: Tsize_t): dword; cdecl; external libgsl;
function gsl_spmatrix_uint_set(m: Pgsl_spmatrix_uint; i: Tsize_t; j: Tsize_t; x: dword): longint; cdecl; external libgsl;
function gsl_spmatrix_uint_ptr(m: Pgsl_spmatrix_uint; i: Tsize_t; j: Tsize_t): Pdword; cdecl; external libgsl;

function gsl_spmatrix_uint_minmax(m: Pgsl_spmatrix_uint; min_out: Pdword; max_out: Pdword): longint; cdecl; external libgsl;
function gsl_spmatrix_uint_min_index(m: Pgsl_spmatrix_uint; imin_out: Psize_t; jmin_out: Psize_t): longint; cdecl; external libgsl;

function gsl_spmatrix_uint_scale(m: Pgsl_spmatrix_uint; x: dword): longint; cdecl; external libgsl;
function gsl_spmatrix_uint_scale_columns(m: Pgsl_spmatrix_uint; x: Pgsl_vector_uint): longint; cdecl; external libgsl;
function gsl_spmatrix_uint_scale_rows(m: Pgsl_spmatrix_uint; x: Pgsl_vector_uint): longint; cdecl; external libgsl;
function gsl_spmatrix_uint_add(c: Pgsl_spmatrix_uint; a: Pgsl_spmatrix_uint; b: Pgsl_spmatrix_uint): longint; cdecl; external libgsl;
function gsl_spmatrix_uint_dense_add(a: Pgsl_matrix_uint; b: Pgsl_spmatrix_uint): longint; cdecl; external libgsl;
function gsl_spmatrix_uint_dense_sub(a: Pgsl_matrix_uint; b: Pgsl_spmatrix_uint): longint; cdecl; external libgsl;
function gsl_spmatrix_uint_d2sp(T: Pgsl_spmatrix_uint; A: Pgsl_matrix_uint): longint; cdecl; external libgsl;
function gsl_spmatrix_uint_sp2d(A: Pgsl_matrix_uint; S: Pgsl_spmatrix_uint): longint; cdecl; external libgsl;

function gsl_spmatrix_uint_add_to_dense(a: Pgsl_matrix_uint; b: Pgsl_spmatrix_uint): longint; cdecl; external libgsl; deprecated;

function gsl_spmatrix_uint_equal(a: Pgsl_spmatrix_uint; b: Pgsl_spmatrix_uint): longint; cdecl; external libgsl;
function gsl_spmatrix_uint_norm1(a: Pgsl_spmatrix_uint): dword; cdecl; external libgsl;

function gsl_spmatrix_uint_transpose(m: Pgsl_spmatrix_uint): longint; cdecl; external libgsl;
function gsl_spmatrix_uint_transpose2(m: Pgsl_spmatrix_uint): longint; cdecl; external libgsl;
function gsl_spmatrix_uint_transpose_memcpy(dest: Pgsl_spmatrix_uint; src: Pgsl_spmatrix_uint): longint; cdecl; external libgsl;

// === Konventiert am: 20-8-25 17:35:12 ===


implementation



end.
