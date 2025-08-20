unit gsl_spmatrix_ulong;

interface

uses
  fp_gsl, gsl_bst, gsl_spmatrix, gsl_vector_ulong, gsl_matrix_ulong;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tgsl_spmatrix_ulong = record
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
  Pgsl_spmatrix_ulong = ^Tgsl_spmatrix_ulong;

function gsl_spmatrix_ulong_alloc(n1: Tsize_t; n2: Tsize_t): Pgsl_spmatrix_ulong; cdecl; external libgsl;
function gsl_spmatrix_ulong_alloc_nzmax(n1: Tsize_t; n2: Tsize_t; nzmax: Tsize_t; sptype: longint): Pgsl_spmatrix_ulong; cdecl; external libgsl;
procedure gsl_spmatrix_ulong_free(m: Pgsl_spmatrix_ulong); cdecl; external libgsl;
function gsl_spmatrix_ulong_realloc(nzmax: Tsize_t; m: Pgsl_spmatrix_ulong): longint; cdecl; external libgsl;
function gsl_spmatrix_ulong_nnz(m: Pgsl_spmatrix_ulong): Tsize_t; cdecl; external libgsl;
function gsl_spmatrix_ulong_type(m: Pgsl_spmatrix_ulong): pchar; cdecl; external libgsl;
function gsl_spmatrix_ulong_set_zero(m: Pgsl_spmatrix_ulong): longint; cdecl; external libgsl;
function gsl_spmatrix_ulong_tree_rebuild(m: Pgsl_spmatrix_ulong): longint; cdecl; external libgsl;

function gsl_spmatrix_ulong_csc(dest: Pgsl_spmatrix_ulong; src: Pgsl_spmatrix_ulong): longint; cdecl; external libgsl;
function gsl_spmatrix_ulong_csr(dest: Pgsl_spmatrix_ulong; src: Pgsl_spmatrix_ulong): longint; cdecl; external libgsl;
function gsl_spmatrix_ulong_compress(src: Pgsl_spmatrix_ulong; sptype: longint): Pgsl_spmatrix_ulong; cdecl; external libgsl;
function gsl_spmatrix_ulong_compcol(src: Pgsl_spmatrix_ulong): Pgsl_spmatrix_ulong; cdecl; external libgsl;
function gsl_spmatrix_ulong_ccs(src: Pgsl_spmatrix_ulong): Pgsl_spmatrix_ulong; cdecl; external libgsl;
function gsl_spmatrix_ulong_crs(src: Pgsl_spmatrix_ulong): Pgsl_spmatrix_ulong; cdecl; external libgsl;

function gsl_spmatrix_ulong_memcpy(dest: Pgsl_spmatrix_ulong; src: Pgsl_spmatrix_ulong): longint; cdecl; external libgsl;

function gsl_spmatrix_ulong_fprintf(stream: PFILE; m: Pgsl_spmatrix_ulong; format: pchar): longint; cdecl; external libgsl;
function gsl_spmatrix_ulong_fscanf(stream: PFILE): Pgsl_spmatrix_ulong; cdecl; external libgsl;
function gsl_spmatrix_ulong_fwrite(stream: PFILE; m: Pgsl_spmatrix_ulong): longint; cdecl; external libgsl;
function gsl_spmatrix_ulong_fread(stream: PFILE; m: Pgsl_spmatrix_ulong): longint; cdecl; external libgsl;

function gsl_spmatrix_ulong_get(m: Pgsl_spmatrix_ulong; i: Tsize_t; j: Tsize_t): dword; cdecl; external libgsl;
function gsl_spmatrix_ulong_set(m: Pgsl_spmatrix_ulong; i: Tsize_t; j: Tsize_t; x: dword): longint; cdecl; external libgsl;
function gsl_spmatrix_ulong_ptr(m: Pgsl_spmatrix_ulong; i: Tsize_t; j: Tsize_t): Pdword; cdecl; external libgsl;

function gsl_spmatrix_ulong_minmax(m: Pgsl_spmatrix_ulong; min_out: Pdword; max_out: Pdword): longint; cdecl; external libgsl;
function gsl_spmatrix_ulong_min_index(m: Pgsl_spmatrix_ulong; imin_out: Psize_t; jmin_out: Psize_t): longint; cdecl; external libgsl;

function gsl_spmatrix_ulong_scale(m: Pgsl_spmatrix_ulong; x: dword): longint; cdecl; external libgsl;
function gsl_spmatrix_ulong_scale_columns(m: Pgsl_spmatrix_ulong; x: Pgsl_vector_ulong): longint; cdecl; external libgsl;
function gsl_spmatrix_ulong_scale_rows(m: Pgsl_spmatrix_ulong; x: Pgsl_vector_ulong): longint; cdecl; external libgsl;
function gsl_spmatrix_ulong_add(c: Pgsl_spmatrix_ulong; a: Pgsl_spmatrix_ulong; b: Pgsl_spmatrix_ulong): longint; cdecl; external libgsl;
function gsl_spmatrix_ulong_dense_add(a: Pgsl_matrix_ulong; b: Pgsl_spmatrix_ulong): longint; cdecl; external libgsl;
function gsl_spmatrix_ulong_dense_sub(a: Pgsl_matrix_ulong; b: Pgsl_spmatrix_ulong): longint; cdecl; external libgsl;
function gsl_spmatrix_ulong_d2sp(T: Pgsl_spmatrix_ulong; A: Pgsl_matrix_ulong): longint; cdecl; external libgsl;
function gsl_spmatrix_ulong_sp2d(A: Pgsl_matrix_ulong; S: Pgsl_spmatrix_ulong): longint; cdecl; external libgsl;

function gsl_spmatrix_ulong_add_to_dense(a: Pgsl_matrix_ulong; b: Pgsl_spmatrix_ulong): longint; cdecl; external libgsl; deprecated;

function gsl_spmatrix_ulong_equal(a: Pgsl_spmatrix_ulong; b: Pgsl_spmatrix_ulong): longint; cdecl; external libgsl;
function gsl_spmatrix_ulong_norm1(a: Pgsl_spmatrix_ulong): dword; cdecl; external libgsl;

function gsl_spmatrix_ulong_transpose(m: Pgsl_spmatrix_ulong): longint; cdecl; external libgsl;
function gsl_spmatrix_ulong_transpose2(m: Pgsl_spmatrix_ulong): longint; cdecl; external libgsl;
function gsl_spmatrix_ulong_transpose_memcpy(dest: Pgsl_spmatrix_ulong; src: Pgsl_spmatrix_ulong): longint; cdecl; external libgsl;

// === Konventiert am: 20-8-25 17:35:14 ===


implementation



end.
