unit gsl_vector_int;

interface

uses
  fp_gsl, gsl_block_int;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tgsl_vector_int = record
    size: Tsize_t;
    stride: Tsize_t;
    data: Plongint;
    block: Pgsl_block_int;
    owner: longint;
  end;
  Pgsl_vector_int = ^Tgsl_vector_int;

  Tgsl_vector_int_view = record
    vector: Tgsl_vector_int;
  end;
  Pgsl_vector_int_view = ^Tgsl_vector_int_view;

  Tgsl_vector_int_const_view = record
    vector: Tgsl_vector_int;
  end;
  Pgsl_vector_int_const_view = ^Tgsl_vector_int_const_view;


function gsl_vector_int_alloc(n: Tsize_t): Pgsl_vector_int; cdecl; external libgsl;
function gsl_vector_int_calloc(n: Tsize_t): Pgsl_vector_int; cdecl; external libgsl;
function gsl_vector_int_alloc_from_block(b: Pgsl_block_int; offset: Tsize_t; n: Tsize_t; stride: Tsize_t): Pgsl_vector_int; cdecl; external libgsl;
function gsl_vector_int_alloc_from_vector(v: Pgsl_vector_int; offset: Tsize_t; n: Tsize_t; stride: Tsize_t): Pgsl_vector_int; cdecl; external libgsl;
procedure gsl_vector_int_free(v: Pgsl_vector_int); cdecl; external libgsl;

function gsl_vector_int_view_array(v: Plongint; n: Tsize_t): Tgsl_vector_int_view; cdecl; external libgsl;
function gsl_vector_int_view_array_with_stride(base: Plongint; stride: Tsize_t; n: Tsize_t): Tgsl_vector_int_view; cdecl; external libgsl;
function gsl_vector_int_const_view_array(v: Plongint; n: Tsize_t): Tgsl_vector_int_const_view; cdecl; external libgsl;
function gsl_vector_int_const_view_array_with_stride(base: Plongint; stride: Tsize_t; n: Tsize_t): Tgsl_vector_int_const_view; cdecl; external libgsl;
function gsl_vector_int_subvector(v: Pgsl_vector_int; i: Tsize_t; n: Tsize_t): Tgsl_vector_int_view; cdecl; external libgsl;
function gsl_vector_int_subvector_with_stride(v: Pgsl_vector_int; i: Tsize_t; stride: Tsize_t; n: Tsize_t): Tgsl_vector_int_view; cdecl; external libgsl;
function gsl_vector_int_const_subvector(v: Pgsl_vector_int; i: Tsize_t; n: Tsize_t): Tgsl_vector_int_const_view; cdecl; external libgsl;
function gsl_vector_int_const_subvector_with_stride(v: Pgsl_vector_int; i: Tsize_t; stride: Tsize_t; n: Tsize_t): Tgsl_vector_int_const_view; cdecl; external libgsl;

procedure gsl_vector_int_set_zero(v: Pgsl_vector_int); cdecl; external libgsl;
procedure gsl_vector_int_set_all(v: Pgsl_vector_int; x: longint); cdecl; external libgsl;
function gsl_vector_int_set_basis(v: Pgsl_vector_int; i: Tsize_t): longint; cdecl; external libgsl;
function gsl_vector_int_fread(stream: PFILE; v: Pgsl_vector_int): longint; cdecl; external libgsl;
function gsl_vector_int_fwrite(stream: PFILE; v: Pgsl_vector_int): longint; cdecl; external libgsl;
function gsl_vector_int_fscanf(stream: PFILE; v: Pgsl_vector_int): longint; cdecl; external libgsl;
function gsl_vector_int_fprintf(stream: PFILE; v: Pgsl_vector_int; format: pchar): longint; cdecl; external libgsl;
function gsl_vector_int_memcpy(dest: Pgsl_vector_int; src: Pgsl_vector_int): longint; cdecl; external libgsl;
function gsl_vector_int_reverse(v: Pgsl_vector_int): longint; cdecl; external libgsl;
function gsl_vector_int_swap(v: Pgsl_vector_int; w: Pgsl_vector_int): longint; cdecl; external libgsl;
function gsl_vector_int_swap_elements(v: Pgsl_vector_int; i: Tsize_t; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_vector_int_max(v: Pgsl_vector_int): longint; cdecl; external libgsl;
function gsl_vector_int_min(v: Pgsl_vector_int): longint; cdecl; external libgsl;
procedure gsl_vector_int_minmax(v: Pgsl_vector_int; min_out: Plongint; max_out: Plongint); cdecl; external libgsl;
function gsl_vector_int_max_index(v: Pgsl_vector_int): Tsize_t; cdecl; external libgsl;
function gsl_vector_int_min_index(v: Pgsl_vector_int): Tsize_t; cdecl; external libgsl;
procedure gsl_vector_int_minmax_index(v: Pgsl_vector_int; imin: Psize_t; imax: Psize_t); cdecl; external libgsl;
function gsl_vector_int_add(a: Pgsl_vector_int; b: Pgsl_vector_int): longint; cdecl; external libgsl;
function gsl_vector_int_sub(a: Pgsl_vector_int; b: Pgsl_vector_int): longint; cdecl; external libgsl;
function gsl_vector_int_mul(a: Pgsl_vector_int; b: Pgsl_vector_int): longint; cdecl; external libgsl;
function gsl_vector_int_div(a: Pgsl_vector_int; b: Pgsl_vector_int): longint; cdecl; external libgsl;
function gsl_vector_int_scale(a: Pgsl_vector_int; x: longint): longint; cdecl; external libgsl;
function gsl_vector_int_add_constant(a: Pgsl_vector_int; x: longint): longint; cdecl; external libgsl;
function gsl_vector_int_axpby(alpha: longint; x: Pgsl_vector_int; beta: longint; y: Pgsl_vector_int): longint; cdecl; external libgsl;
function gsl_vector_int_sum(a: Pgsl_vector_int): longint; cdecl; external libgsl;
function gsl_vector_int_equal(u: Pgsl_vector_int; v: Pgsl_vector_int): longint; cdecl; external libgsl;
function gsl_vector_int_isnull(v: Pgsl_vector_int): longint; cdecl; external libgsl;
function gsl_vector_int_ispos(v: Pgsl_vector_int): longint; cdecl; external libgsl;
function gsl_vector_int_isneg(v: Pgsl_vector_int): longint; cdecl; external libgsl;
function gsl_vector_int_isnonneg(v: Pgsl_vector_int): longint; cdecl; external libgsl;
function gsl_vector_int_get(v: Pgsl_vector_int; i: Tsize_t): longint; cdecl; external libgsl;
procedure gsl_vector_int_set(v: Pgsl_vector_int; i: Tsize_t; x: longint); cdecl; external libgsl;
function gsl_vector_int_ptr(v: Pgsl_vector_int; i: Tsize_t): Plongint; cdecl; external libgsl;
function gsl_vector_int_const_ptr(v: Pgsl_vector_int; i: Tsize_t): Plongint; cdecl; external libgsl;

// === Konventiert am: 20-8-25 16:48:06 ===


implementation



end.
