unit gsl_spmatrix_complex_float;

interface

uses
  fp_gsl, gsl_bst, gsl_spmatrix, gsl_complex, gsl_vector_complex_float, gsl_matrix_complex_float;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tgsl_spmatrix_complex_float = record
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
  Pgsl_spmatrix_complex_float = ^Tgsl_spmatrix_complex_float;

function gsl_spmatrix_complex_float_alloc(n1: Tsize_t; n2: Tsize_t): Pgsl_spmatrix_complex_float; cdecl; external libgsl;
function gsl_spmatrix_complex_float_alloc_nzmax(n1: Tsize_t; n2: Tsize_t; nzmax: Tsize_t; sptype: longint): Pgsl_spmatrix_complex_float; cdecl; external libgsl;
procedure gsl_spmatrix_complex_float_free(m: Pgsl_spmatrix_complex_float); cdecl; external libgsl;
function gsl_spmatrix_complex_float_realloc(nzmax: Tsize_t; m: Pgsl_spmatrix_complex_float): longint; cdecl; external libgsl;
function gsl_spmatrix_complex_float_nnz(m: Pgsl_spmatrix_complex_float): Tsize_t; cdecl; external libgsl;
function gsl_spmatrix_complex_float_type(m: Pgsl_spmatrix_complex_float): pchar; cdecl; external libgsl;
function gsl_spmatrix_complex_float_set_zero(m: Pgsl_spmatrix_complex_float): longint; cdecl; external libgsl;
function gsl_spmatrix_complex_float_tree_rebuild(m: Pgsl_spmatrix_complex_float): longint; cdecl; external libgsl;

function gsl_spmatrix_complex_float_csc(dest: Pgsl_spmatrix_complex_float; src: Pgsl_spmatrix_complex_float): longint; cdecl; external libgsl;
function gsl_spmatrix_complex_float_csr(dest: Pgsl_spmatrix_complex_float; src: Pgsl_spmatrix_complex_float): longint; cdecl; external libgsl;
function gsl_spmatrix_complex_float_compress(src: Pgsl_spmatrix_complex_float; sptype: longint): Pgsl_spmatrix_complex_float; cdecl; external libgsl;
function gsl_spmatrix_complex_float_compcol(src: Pgsl_spmatrix_complex_float): Pgsl_spmatrix_complex_float; cdecl; external libgsl;
function gsl_spmatrix_complex_float_ccs(src: Pgsl_spmatrix_complex_float): Pgsl_spmatrix_complex_float; cdecl; external libgsl;
function gsl_spmatrix_complex_float_crs(src: Pgsl_spmatrix_complex_float): Pgsl_spmatrix_complex_float; cdecl; external libgsl;

function gsl_spmatrix_complex_float_memcpy(dest: Pgsl_spmatrix_complex_float; src: Pgsl_spmatrix_complex_float): longint; cdecl; external libgsl;

function gsl_spmatrix_complex_float_fprintf(stream: PFILE; m: Pgsl_spmatrix_complex_float; format: pchar): longint; cdecl; external libgsl;
function gsl_spmatrix_complex_float_fscanf(stream: PFILE): Pgsl_spmatrix_complex_float; cdecl; external libgsl;
function gsl_spmatrix_complex_float_fwrite(stream: PFILE; m: Pgsl_spmatrix_complex_float): longint; cdecl; external libgsl;
function gsl_spmatrix_complex_float_fread(stream: PFILE; m: Pgsl_spmatrix_complex_float): longint; cdecl; external libgsl;

function gsl_spmatrix_complex_float_get(m: Pgsl_spmatrix_complex_float; i: Tsize_t; j: Tsize_t): Tgsl_complex_float; cdecl; external libgsl;
function gsl_spmatrix_complex_float_set(m: Pgsl_spmatrix_complex_float; i: Tsize_t; j: Tsize_t; x: Tgsl_complex_float): longint; cdecl; external libgsl;
function gsl_spmatrix_complex_float_ptr(m: Pgsl_spmatrix_complex_float; i: Tsize_t; j: Tsize_t): Pgsl_complex_float; cdecl; external libgsl;

function gsl_spmatrix_complex_float_scale(m: Pgsl_spmatrix_complex_float; x: Tgsl_complex_float): longint; cdecl; external libgsl;
function gsl_spmatrix_complex_float_scale_columns(m: Pgsl_spmatrix_complex_float; x: Pgsl_vector_complex_float): longint; cdecl; external libgsl;
function gsl_spmatrix_complex_float_scale_rows(m: Pgsl_spmatrix_complex_float; x: Pgsl_vector_complex_float): longint; cdecl; external libgsl;
function gsl_spmatrix_complex_float_add(c: Pgsl_spmatrix_complex_float; a: Pgsl_spmatrix_complex_float; b: Pgsl_spmatrix_complex_float): longint; cdecl; external libgsl;
function gsl_spmatrix_complex_float_dense_add(a: Pgsl_matrix_complex_float; b: Pgsl_spmatrix_complex_float): longint; cdecl; external libgsl;
function gsl_spmatrix_complex_float_dense_sub(a: Pgsl_matrix_complex_float; b: Pgsl_spmatrix_complex_float): longint; cdecl; external libgsl;
function gsl_spmatrix_complex_float_d2sp(T: Pgsl_spmatrix_complex_float; A: Pgsl_matrix_complex_float): longint; cdecl; external libgsl;
function gsl_spmatrix_complex_float_sp2d(A: Pgsl_matrix_complex_float; S: Pgsl_spmatrix_complex_float): longint; cdecl; external libgsl;

function gsl_spmatrix_complex_float_add_to_dense(a: Pgsl_matrix_complex_float; b: Pgsl_spmatrix_complex_float): longint; cdecl; external libgsl; deprecated;

function gsl_spmatrix_complex_float_equal(a: Pgsl_spmatrix_complex_float; b: Pgsl_spmatrix_complex_float): longint; cdecl; external libgsl;

function gsl_spmatrix_complex_float_transpose(m: Pgsl_spmatrix_complex_float): longint; cdecl; external libgsl;
function gsl_spmatrix_complex_float_transpose2(m: Pgsl_spmatrix_complex_float): longint; cdecl; external libgsl;
function gsl_spmatrix_complex_float_transpose_memcpy(dest: Pgsl_spmatrix_complex_float; src: Pgsl_spmatrix_complex_float): longint; cdecl; external libgsl;

// === Konventiert am: 20-8-25 17:33:56 ===


implementation



end.
