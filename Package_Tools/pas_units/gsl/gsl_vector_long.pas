unit gsl_vector_long;

interface

uses
  fp_gsl, gsl_block_long;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tgsl_vector_long = record
    size: Tsize_t;
    stride: Tsize_t;
    data: Plongint;
    block: Pgsl_block_long;
    owner: longint;
  end;
  Pgsl_vector_long = ^Tgsl_vector_long;

  Tgsl_vector_long_view = record
    vector: Tgsl_vector_long;
  end;
  Pgsl_vector_long_view = ^Tgsl_vector_long_view;

  Tgsl_vector_long_const_view = record
    vector: Tgsl_vector_long;
  end;
  Pgsl_vector_long_const_view = ^Tgsl_vector_long_const_view;


function gsl_vector_long_alloc(n: Tsize_t): Pgsl_vector_long; cdecl; external libgsl;
function gsl_vector_long_calloc(n: Tsize_t): Pgsl_vector_long; cdecl; external libgsl;
function gsl_vector_long_alloc_from_block(b: Pgsl_block_long; offset: Tsize_t; n: Tsize_t; stride: Tsize_t): Pgsl_vector_long; cdecl; external libgsl;
function gsl_vector_long_alloc_from_vector(v: Pgsl_vector_long; offset: Tsize_t; n: Tsize_t; stride: Tsize_t): Pgsl_vector_long; cdecl; external libgsl;
procedure gsl_vector_long_free(v: Pgsl_vector_long); cdecl; external libgsl;

function gsl_vector_long_view_array(v: Plongint; n: Tsize_t): Tgsl_vector_long_view; cdecl; external libgsl;
function gsl_vector_long_view_array_with_stride(base: Plongint; stride: Tsize_t; n: Tsize_t): Tgsl_vector_long_view; cdecl; external libgsl;
function gsl_vector_long_const_view_array(v: Plongint; n: Tsize_t): Tgsl_vector_long_const_view; cdecl; external libgsl;
function gsl_vector_long_const_view_array_with_stride(base: Plongint; stride: Tsize_t; n: Tsize_t): Tgsl_vector_long_const_view; cdecl; external libgsl;
function gsl_vector_long_subvector(v: Pgsl_vector_long; i: Tsize_t; n: Tsize_t): Tgsl_vector_long_view; cdecl; external libgsl;
function gsl_vector_long_subvector_with_stride(v: Pgsl_vector_long; i: Tsize_t; stride: Tsize_t; n: Tsize_t): Tgsl_vector_long_view; cdecl; external libgsl;
function gsl_vector_long_const_subvector(v: Pgsl_vector_long; i: Tsize_t; n: Tsize_t): Tgsl_vector_long_const_view; cdecl; external libgsl;
function gsl_vector_long_const_subvector_with_stride(v: Pgsl_vector_long; i: Tsize_t; stride: Tsize_t; n: Tsize_t): Tgsl_vector_long_const_view; cdecl; external libgsl;

procedure gsl_vector_long_set_zero(v: Pgsl_vector_long); cdecl; external libgsl;
procedure gsl_vector_long_set_all(v: Pgsl_vector_long; x: longint); cdecl; external libgsl;
function gsl_vector_long_set_basis(v: Pgsl_vector_long; i: Tsize_t): longint; cdecl; external libgsl;
function gsl_vector_long_fread(stream: PFILE; v: Pgsl_vector_long): longint; cdecl; external libgsl;
function gsl_vector_long_fwrite(stream: PFILE; v: Pgsl_vector_long): longint; cdecl; external libgsl;
function gsl_vector_long_fscanf(stream: PFILE; v: Pgsl_vector_long): longint; cdecl; external libgsl;
function gsl_vector_long_fprintf(stream: PFILE; v: Pgsl_vector_long; format: pchar): longint; cdecl; external libgsl;
function gsl_vector_long_memcpy(dest: Pgsl_vector_long; src: Pgsl_vector_long): longint; cdecl; external libgsl;
function gsl_vector_long_reverse(v: Pgsl_vector_long): longint; cdecl; external libgsl;
function gsl_vector_long_swap(v: Pgsl_vector_long; w: Pgsl_vector_long): longint; cdecl; external libgsl;
function gsl_vector_long_swap_elements(v: Pgsl_vector_long; i: Tsize_t; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_vector_long_max(v: Pgsl_vector_long): longint; cdecl; external libgsl;
function gsl_vector_long_min(v: Pgsl_vector_long): longint; cdecl; external libgsl;
procedure gsl_vector_long_minmax(v: Pgsl_vector_long; min_out: Plongint; max_out: Plongint); cdecl; external libgsl;
function gsl_vector_long_max_index(v: Pgsl_vector_long): Tsize_t; cdecl; external libgsl;
function gsl_vector_long_min_index(v: Pgsl_vector_long): Tsize_t; cdecl; external libgsl;
procedure gsl_vector_long_minmax_index(v: Pgsl_vector_long; imin: Psize_t; imax: Psize_t); cdecl; external libgsl;
function gsl_vector_long_add(a: Pgsl_vector_long; b: Pgsl_vector_long): longint; cdecl; external libgsl;
function gsl_vector_long_sub(a: Pgsl_vector_long; b: Pgsl_vector_long): longint; cdecl; external libgsl;
function gsl_vector_long_mul(a: Pgsl_vector_long; b: Pgsl_vector_long): longint; cdecl; external libgsl;
function gsl_vector_long_div(a: Pgsl_vector_long; b: Pgsl_vector_long): longint; cdecl; external libgsl;
function gsl_vector_long_scale(a: Pgsl_vector_long; x: longint): longint; cdecl; external libgsl;
function gsl_vector_long_add_constant(a: Pgsl_vector_long; x: longint): longint; cdecl; external libgsl;
function gsl_vector_long_axpby(alpha: longint; x: Pgsl_vector_long; beta: longint; y: Pgsl_vector_long): longint; cdecl; external libgsl;
function gsl_vector_long_sum(a: Pgsl_vector_long): longint; cdecl; external libgsl;
function gsl_vector_long_equal(u: Pgsl_vector_long; v: Pgsl_vector_long): longint; cdecl; external libgsl;
function gsl_vector_long_isnull(v: Pgsl_vector_long): longint; cdecl; external libgsl;
function gsl_vector_long_ispos(v: Pgsl_vector_long): longint; cdecl; external libgsl;
function gsl_vector_long_isneg(v: Pgsl_vector_long): longint; cdecl; external libgsl;
function gsl_vector_long_isnonneg(v: Pgsl_vector_long): longint; cdecl; external libgsl;
function gsl_vector_long_get(v: Pgsl_vector_long; i: Tsize_t): longint; cdecl; external libgsl;
procedure gsl_vector_long_set(v: Pgsl_vector_long; i: Tsize_t; x: longint); cdecl; external libgsl;
function gsl_vector_long_ptr(v: Pgsl_vector_long; i: Tsize_t): Plongint; cdecl; external libgsl;
function gsl_vector_long_const_ptr(v: Pgsl_vector_long; i: Tsize_t): Plongint; cdecl; external libgsl;

// === Konventiert am: 20-8-25 16:48:09 ===


implementation



end.
