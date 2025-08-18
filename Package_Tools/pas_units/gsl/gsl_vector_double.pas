unit gsl_vector_double;

interface

uses
  fp_gsl, gsl_block_double;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tgsl_vector = record
    size: Tsize_t;
    stride: Tsize_t;
    data: Pdouble;
    block: Pgsl_block;
    owner: longint;
  end;
  Pgsl_vector = ^Tgsl_vector;

  Tgsl_vector_view = record
    vector: Tgsl_vector;
  end;
  Pgsl_vector_view = ^Tgsl_vector_view;

  Tgsl_vector_const_view = record
    vector: Tgsl_vector;
  end;
  Pgsl_vector_const_view = ^Tgsl_vector_const_view;

function gsl_vector_alloc(n: Tsize_t): Pgsl_vector; cdecl; external libgsl;
function gsl_vector_calloc(n: Tsize_t): Pgsl_vector; cdecl; external libgsl;
function gsl_vector_alloc_from_block(b: Pgsl_block; offset: Tsize_t; n: Tsize_t; stride: Tsize_t): Pgsl_vector; cdecl; external libgsl;
function gsl_vector_alloc_from_vector(v: Pgsl_vector; offset: Tsize_t; n: Tsize_t; stride: Tsize_t): Pgsl_vector; cdecl; external libgsl;
procedure gsl_vector_free(v: Pgsl_vector); cdecl; external libgsl;

function gsl_vector_view_array(v: Pdouble; n: Tsize_t): Tgsl_vector_view; cdecl; external libgsl;
function gsl_vector_view_array_with_stride(base: Pdouble; stride: Tsize_t; n: Tsize_t): Tgsl_vector_view; cdecl; external libgsl;
function gsl_vector_const_view_array(v: Pdouble; n: Tsize_t): Tgsl_vector_const_view; cdecl; external libgsl;
function gsl_vector_const_view_array_with_stride(base: Pdouble; stride: Tsize_t; n: Tsize_t): Tgsl_vector_const_view; cdecl; external libgsl;
function gsl_vector_subvector(v: Pgsl_vector; i: Tsize_t; n: Tsize_t): Tgsl_vector_view; cdecl; external libgsl;
function gsl_vector_subvector_with_stride(v: Pgsl_vector; i: Tsize_t; stride: Tsize_t; n: Tsize_t): Tgsl_vector_view; cdecl; external libgsl;
function gsl_vector_const_subvector(v: Pgsl_vector; i: Tsize_t; n: Tsize_t): Tgsl_vector_const_view; cdecl; external libgsl;
function gsl_vector_const_subvector_with_stride(v: Pgsl_vector; i: Tsize_t; stride: Tsize_t; n: Tsize_t): Tgsl_vector_const_view; cdecl; external libgsl;

procedure gsl_vector_set_zero(v: Pgsl_vector); cdecl; external libgsl;
procedure gsl_vector_set_all(v: Pgsl_vector; x: Tdouble); cdecl; external libgsl;
function gsl_vector_set_basis(v: Pgsl_vector; i: Tsize_t): longint; cdecl; external libgsl;
function gsl_vector_fread(stream: PFILE; v: Pgsl_vector): longint; cdecl; external libgsl;
function gsl_vector_fwrite(stream: PFILE; v: Pgsl_vector): longint; cdecl; external libgsl;
function gsl_vector_fscanf(stream: PFILE; v: Pgsl_vector): longint; cdecl; external libgsl;
function gsl_vector_fprintf(stream: PFILE; v: Pgsl_vector; format: pchar): longint; cdecl; external libgsl;
function gsl_vector_memcpy(dest: Pgsl_vector; src: Pgsl_vector): longint; cdecl; external libgsl;
function gsl_vector_reverse(v: Pgsl_vector): longint; cdecl; external libgsl;
function gsl_vector_swap(v: Pgsl_vector; w: Pgsl_vector): longint; cdecl; external libgsl;
function gsl_vector_swap_elements(v: Pgsl_vector; i: Tsize_t; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_vector_max(v: Pgsl_vector): Tdouble; cdecl; external libgsl;
function gsl_vector_min(v: Pgsl_vector): Tdouble; cdecl; external libgsl;
procedure gsl_vector_minmax(v: Pgsl_vector; min_out: Pdouble; max_out: Pdouble); cdecl; external libgsl;
function gsl_vector_max_index(v: Pgsl_vector): Tsize_t; cdecl; external libgsl;
function gsl_vector_min_index(v: Pgsl_vector): Tsize_t; cdecl; external libgsl;
procedure gsl_vector_minmax_index(v: Pgsl_vector; imin: Psize_t; imax: Psize_t); cdecl; external libgsl;
function gsl_vector_add(a: Pgsl_vector; b: Pgsl_vector): longint; cdecl; external libgsl;
function gsl_vector_sub(a: Pgsl_vector; b: Pgsl_vector): longint; cdecl; external libgsl;
function gsl_vector_mul(a: Pgsl_vector; b: Pgsl_vector): longint; cdecl; external libgsl;
function gsl_vector_div(a: Pgsl_vector; b: Pgsl_vector): longint; cdecl; external libgsl;
function gsl_vector_scale(a: Pgsl_vector; x: Tdouble): longint; cdecl; external libgsl;
function gsl_vector_add_constant(a: Pgsl_vector; x: Tdouble): longint; cdecl; external libgsl;
function gsl_vector_axpby(alpha: Tdouble; x: Pgsl_vector; beta: Tdouble; y: Pgsl_vector): longint; cdecl; external libgsl;
function gsl_vector_sum(a: Pgsl_vector): Tdouble; cdecl; external libgsl;
function gsl_vector_equal(u: Pgsl_vector; v: Pgsl_vector): longint; cdecl; external libgsl;
function gsl_vector_isnull(v: Pgsl_vector): longint; cdecl; external libgsl;
function gsl_vector_ispos(v: Pgsl_vector): longint; cdecl; external libgsl;
function gsl_vector_isneg(v: Pgsl_vector): longint; cdecl; external libgsl;
function gsl_vector_isnonneg(v: Pgsl_vector): longint; cdecl; external libgsl;
function gsl_vector_get(v: Pgsl_vector; i: Tsize_t): Tdouble; cdecl; external libgsl;
procedure gsl_vector_set(v: Pgsl_vector; i: Tsize_t; x: Tdouble); cdecl; external libgsl;
function gsl_vector_ptr(v: Pgsl_vector; i: Tsize_t): Pdouble; cdecl; external libgsl;
function gsl_vector_const_ptr(v: Pgsl_vector; i: Tsize_t): Pdouble; cdecl; external libgsl;

// === Konventiert am: 18-8-25 16:05:55 ===


implementation



end.
