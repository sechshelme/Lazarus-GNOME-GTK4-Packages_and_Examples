unit gsl_spmatrix_uchar;

interface

uses
  fp_gsl, gsl_bst, gsl_spmatrix, gsl_vector_uchar, gsl_matrix_uchar;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tgsl_spmatrix_uchar = record
    size1: Tsize_t;
    size2: Tsize_t;
    i: Plongint;
    data: pbyte;
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
        2: (work_atomic: pbyte);
      end;
    sptype: longint;
    spflags: Tsize_t;
  end;
  Pgsl_spmatrix_uchar = ^Tgsl_spmatrix_uchar;

function gsl_spmatrix_uchar_alloc(n1: Tsize_t; n2: Tsize_t): Pgsl_spmatrix_uchar; cdecl; external libgsl;
function gsl_spmatrix_uchar_alloc_nzmax(n1: Tsize_t; n2: Tsize_t; nzmax: Tsize_t; sptype: longint): Pgsl_spmatrix_uchar; cdecl; external libgsl;
procedure gsl_spmatrix_uchar_free(m: Pgsl_spmatrix_uchar); cdecl; external libgsl;
function gsl_spmatrix_uchar_realloc(nzmax: Tsize_t; m: Pgsl_spmatrix_uchar): longint; cdecl; external libgsl;
function gsl_spmatrix_uchar_nnz(m: Pgsl_spmatrix_uchar): Tsize_t; cdecl; external libgsl;
function gsl_spmatrix_uchar_type(m: Pgsl_spmatrix_uchar): pchar; cdecl; external libgsl;
function gsl_spmatrix_uchar_set_zero(m: Pgsl_spmatrix_uchar): longint; cdecl; external libgsl;
function gsl_spmatrix_uchar_tree_rebuild(m: Pgsl_spmatrix_uchar): longint; cdecl; external libgsl;

function gsl_spmatrix_uchar_csc(dest: Pgsl_spmatrix_uchar; src: Pgsl_spmatrix_uchar): longint; cdecl; external libgsl;
function gsl_spmatrix_uchar_csr(dest: Pgsl_spmatrix_uchar; src: Pgsl_spmatrix_uchar): longint; cdecl; external libgsl;
function gsl_spmatrix_uchar_compress(src: Pgsl_spmatrix_uchar; sptype: longint): Pgsl_spmatrix_uchar; cdecl; external libgsl;
function gsl_spmatrix_uchar_compcol(src: Pgsl_spmatrix_uchar): Pgsl_spmatrix_uchar; cdecl; external libgsl;
function gsl_spmatrix_uchar_ccs(src: Pgsl_spmatrix_uchar): Pgsl_spmatrix_uchar; cdecl; external libgsl;
function gsl_spmatrix_uchar_crs(src: Pgsl_spmatrix_uchar): Pgsl_spmatrix_uchar; cdecl; external libgsl;

function gsl_spmatrix_uchar_memcpy(dest: Pgsl_spmatrix_uchar; src: Pgsl_spmatrix_uchar): longint; cdecl; external libgsl;

function gsl_spmatrix_uchar_fprintf(stream: PFILE; m: Pgsl_spmatrix_uchar; format: pchar): longint; cdecl; external libgsl;
function gsl_spmatrix_uchar_fscanf(stream: PFILE): Pgsl_spmatrix_uchar; cdecl; external libgsl;
function gsl_spmatrix_uchar_fwrite(stream: PFILE; m: Pgsl_spmatrix_uchar): longint; cdecl; external libgsl;
function gsl_spmatrix_uchar_fread(stream: PFILE; m: Pgsl_spmatrix_uchar): longint; cdecl; external libgsl;

function gsl_spmatrix_uchar_get(m: Pgsl_spmatrix_uchar; i: Tsize_t; j: Tsize_t): byte; cdecl; external libgsl;
function gsl_spmatrix_uchar_set(m: Pgsl_spmatrix_uchar; i: Tsize_t; j: Tsize_t; x: byte): longint; cdecl; external libgsl;
function gsl_spmatrix_uchar_ptr(m: Pgsl_spmatrix_uchar; i: Tsize_t; j: Tsize_t): pbyte; cdecl; external libgsl;

function gsl_spmatrix_uchar_minmax(m: Pgsl_spmatrix_uchar; min_out: pbyte; max_out: pbyte): longint; cdecl; external libgsl;
function gsl_spmatrix_uchar_min_index(m: Pgsl_spmatrix_uchar; imin_out: Psize_t; jmin_out: Psize_t): longint; cdecl; external libgsl;

function gsl_spmatrix_uchar_scale(m: Pgsl_spmatrix_uchar; x: byte): longint; cdecl; external libgsl;
function gsl_spmatrix_uchar_scale_columns(m: Pgsl_spmatrix_uchar; x: Pgsl_vector_uchar): longint; cdecl; external libgsl;
function gsl_spmatrix_uchar_scale_rows(m: Pgsl_spmatrix_uchar; x: Pgsl_vector_uchar): longint; cdecl; external libgsl;
function gsl_spmatrix_uchar_add(c: Pgsl_spmatrix_uchar; a: Pgsl_spmatrix_uchar; b: Pgsl_spmatrix_uchar): longint; cdecl; external libgsl;
function gsl_spmatrix_uchar_dense_add(a: Pgsl_matrix_uchar; b: Pgsl_spmatrix_uchar): longint; cdecl; external libgsl;
function gsl_spmatrix_uchar_dense_sub(a: Pgsl_matrix_uchar; b: Pgsl_spmatrix_uchar): longint; cdecl; external libgsl;
function gsl_spmatrix_uchar_d2sp(T: Pgsl_spmatrix_uchar; A: Pgsl_matrix_uchar): longint; cdecl; external libgsl;
function gsl_spmatrix_uchar_sp2d(A: Pgsl_matrix_uchar; S: Pgsl_spmatrix_uchar): longint; cdecl; external libgsl;

function gsl_spmatrix_uchar_add_to_dense(a: Pgsl_matrix_uchar; b: Pgsl_spmatrix_uchar): longint; cdecl; external libgsl; deprecated;

function gsl_spmatrix_uchar_equal(a: Pgsl_spmatrix_uchar; b: Pgsl_spmatrix_uchar): longint; cdecl; external libgsl;
function gsl_spmatrix_uchar_norm1(a: Pgsl_spmatrix_uchar): byte; cdecl; external libgsl;

function gsl_spmatrix_uchar_transpose(m: Pgsl_spmatrix_uchar): longint; cdecl; external libgsl;
function gsl_spmatrix_uchar_transpose2(m: Pgsl_spmatrix_uchar): longint; cdecl; external libgsl;
function gsl_spmatrix_uchar_transpose_memcpy(dest: Pgsl_spmatrix_uchar; src: Pgsl_spmatrix_uchar): longint; cdecl; external libgsl;

// === Konventiert am: 20-8-25 17:35:05 ===


implementation



end.
