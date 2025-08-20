unit gsl_spmatrix_float;

interface

uses
  fp_gsl, gsl_bst, gsl_spmatrix, gsl_vector_float, gsl_matrix_float;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tgsl_spmatrix_float = record
    size1: Tsize_t;
    size2: Tsize_t;
    i: Plongint;
    data: Psingle;
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
        2: (work_atomic: Psingle);
      end;
    sptype: longint;
    spflags: Tsize_t;
  end;
  Pgsl_spmatrix_float = ^Tgsl_spmatrix_float;

function gsl_spmatrix_float_alloc(n1: Tsize_t; n2: Tsize_t): Pgsl_spmatrix_float; cdecl; external libgsl;
function gsl_spmatrix_float_alloc_nzmax(n1: Tsize_t; n2: Tsize_t; nzmax: Tsize_t; sptype: longint): Pgsl_spmatrix_float; cdecl; external libgsl;
procedure gsl_spmatrix_float_free(m: Pgsl_spmatrix_float); cdecl; external libgsl;
function gsl_spmatrix_float_realloc(nzmax: Tsize_t; m: Pgsl_spmatrix_float): longint; cdecl; external libgsl;
function gsl_spmatrix_float_nnz(m: Pgsl_spmatrix_float): Tsize_t; cdecl; external libgsl;
function gsl_spmatrix_float_type(m: Pgsl_spmatrix_float): pchar; cdecl; external libgsl;
function gsl_spmatrix_float_set_zero(m: Pgsl_spmatrix_float): longint; cdecl; external libgsl;
function gsl_spmatrix_float_tree_rebuild(m: Pgsl_spmatrix_float): longint; cdecl; external libgsl;

function gsl_spmatrix_float_csc(dest: Pgsl_spmatrix_float; src: Pgsl_spmatrix_float): longint; cdecl; external libgsl;
function gsl_spmatrix_float_csr(dest: Pgsl_spmatrix_float; src: Pgsl_spmatrix_float): longint; cdecl; external libgsl;
function gsl_spmatrix_float_compress(src: Pgsl_spmatrix_float; sptype: longint): Pgsl_spmatrix_float; cdecl; external libgsl;
function gsl_spmatrix_float_compcol(src: Pgsl_spmatrix_float): Pgsl_spmatrix_float; cdecl; external libgsl;
function gsl_spmatrix_float_ccs(src: Pgsl_spmatrix_float): Pgsl_spmatrix_float; cdecl; external libgsl;
function gsl_spmatrix_float_crs(src: Pgsl_spmatrix_float): Pgsl_spmatrix_float; cdecl; external libgsl;

function gsl_spmatrix_float_memcpy(dest: Pgsl_spmatrix_float; src: Pgsl_spmatrix_float): longint; cdecl; external libgsl;

function gsl_spmatrix_float_fprintf(stream: PFILE; m: Pgsl_spmatrix_float; format: pchar): longint; cdecl; external libgsl;
function gsl_spmatrix_float_fscanf(stream: PFILE): Pgsl_spmatrix_float; cdecl; external libgsl;
function gsl_spmatrix_float_fwrite(stream: PFILE; m: Pgsl_spmatrix_float): longint; cdecl; external libgsl;
function gsl_spmatrix_float_fread(stream: PFILE; m: Pgsl_spmatrix_float): longint; cdecl; external libgsl;

function gsl_spmatrix_float_get(m: Pgsl_spmatrix_float; i: Tsize_t; j: Tsize_t): single; cdecl; external libgsl;
function gsl_spmatrix_float_set(m: Pgsl_spmatrix_float; i: Tsize_t; j: Tsize_t; x: single): longint; cdecl; external libgsl;
function gsl_spmatrix_float_ptr(m: Pgsl_spmatrix_float; i: Tsize_t; j: Tsize_t): Psingle; cdecl; external libgsl;

function gsl_spmatrix_float_minmax(m: Pgsl_spmatrix_float; min_out: Psingle; max_out: Psingle): longint; cdecl; external libgsl;
function gsl_spmatrix_float_min_index(m: Pgsl_spmatrix_float; imin_out: Psize_t; jmin_out: Psize_t): longint; cdecl; external libgsl;

function gsl_spmatrix_float_scale(m: Pgsl_spmatrix_float; x: single): longint; cdecl; external libgsl;
function gsl_spmatrix_float_scale_columns(m: Pgsl_spmatrix_float; x: Pgsl_vector_float): longint; cdecl; external libgsl;
function gsl_spmatrix_float_scale_rows(m: Pgsl_spmatrix_float; x: Pgsl_vector_float): longint; cdecl; external libgsl;
function gsl_spmatrix_float_add(c: Pgsl_spmatrix_float; a: Pgsl_spmatrix_float; b: Pgsl_spmatrix_float): longint; cdecl; external libgsl;
function gsl_spmatrix_float_dense_add(a: Pgsl_matrix_float; b: Pgsl_spmatrix_float): longint; cdecl; external libgsl;
function gsl_spmatrix_float_dense_sub(a: Pgsl_matrix_float; b: Pgsl_spmatrix_float): longint; cdecl; external libgsl;
function gsl_spmatrix_float_d2sp(T: Pgsl_spmatrix_float; A: Pgsl_matrix_float): longint; cdecl; external libgsl;
function gsl_spmatrix_float_sp2d(A: Pgsl_matrix_float; S: Pgsl_spmatrix_float): longint; cdecl; external libgsl;

function gsl_spmatrix_float_add_to_dense(a: Pgsl_matrix_float; b: Pgsl_spmatrix_float): longint; cdecl; external libgsl; deprecated;

function gsl_spmatrix_float_equal(a: Pgsl_spmatrix_float; b: Pgsl_spmatrix_float): longint; cdecl; external libgsl;
function gsl_spmatrix_float_norm1(a: Pgsl_spmatrix_float): single; cdecl; external libgsl;

function gsl_spmatrix_float_transpose(m: Pgsl_spmatrix_float): longint; cdecl; external libgsl;
function gsl_spmatrix_float_transpose2(m: Pgsl_spmatrix_float): longint; cdecl; external libgsl;
function gsl_spmatrix_float_transpose_memcpy(dest: Pgsl_spmatrix_float; src: Pgsl_spmatrix_float): longint; cdecl; external libgsl;

// === Konventiert am: 20-8-25 17:34:06 ===


implementation



end.
