unit gsl_vector_float;

interface

uses
  fp_gsl, gsl_block_float;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tgsl_vector_float = record
    size: Tsize_t;
    stride: Tsize_t;
    data: Psingle;
    block: Pgsl_block_float;
    owner: longint;
  end;
  Pgsl_vector_float = ^Tgsl_vector_float;

  Tgsl_vector_float_view = record
    vector: Tgsl_vector_float;
  end;
  Pgsl_vector_float_view = ^Tgsl_vector_float_view;

  Tgsl_vector_float_const_view = record
    vector: Tgsl_vector_float;
  end;
  Pgsl_vector_float_const_view = ^Tgsl_vector_float_const_view;

function gsl_vector_float_alloc(n: Tsize_t): Pgsl_vector_float; cdecl; external libgsl;
function gsl_vector_float_calloc(n: Tsize_t): Pgsl_vector_float; cdecl; external libgsl;
function gsl_vector_float_alloc_from_block(b: Pgsl_block_float; offset: Tsize_t; n: Tsize_t; stride: Tsize_t): Pgsl_vector_float; cdecl; external libgsl;
function gsl_vector_float_alloc_from_vector(v: Pgsl_vector_float; offset: Tsize_t; n: Tsize_t; stride: Tsize_t): Pgsl_vector_float; cdecl; external libgsl;
procedure gsl_vector_float_free(v: Pgsl_vector_float); cdecl; external libgsl;

function gsl_vector_float_view_array(v: Psingle; n: Tsize_t): Tgsl_vector_float_view; cdecl; external libgsl;
function gsl_vector_float_view_array_with_stride(base: Psingle; stride: Tsize_t; n: Tsize_t): Tgsl_vector_float_view; cdecl; external libgsl;
function gsl_vector_float_const_view_array(v: Psingle; n: Tsize_t): Tgsl_vector_float_const_view; cdecl; external libgsl;
function gsl_vector_float_const_view_array_with_stride(base: Psingle; stride: Tsize_t; n: Tsize_t): Tgsl_vector_float_const_view; cdecl; external libgsl;
function gsl_vector_float_subvector(v: Pgsl_vector_float; i: Tsize_t; n: Tsize_t): Tgsl_vector_float_view; cdecl; external libgsl;
function gsl_vector_float_subvector_with_stride(v: Pgsl_vector_float; i: Tsize_t; stride: Tsize_t; n: Tsize_t): Tgsl_vector_float_view; cdecl; external libgsl;
function gsl_vector_float_const_subvector(v: Pgsl_vector_float; i: Tsize_t; n: Tsize_t): Tgsl_vector_float_const_view; cdecl; external libgsl;
function gsl_vector_float_const_subvector_with_stride(v: Pgsl_vector_float; i: Tsize_t; stride: Tsize_t; n: Tsize_t): Tgsl_vector_float_const_view; cdecl; external libgsl;
procedure gsl_vector_float_set_zero(v: Pgsl_vector_float); cdecl; external libgsl;

procedure gsl_vector_float_set_all(v: Pgsl_vector_float; x: single); cdecl; external libgsl;
function gsl_vector_float_set_basis(v: Pgsl_vector_float; i: Tsize_t): longint; cdecl; external libgsl;
function gsl_vector_float_fread(stream: PFILE; v: Pgsl_vector_float): longint; cdecl; external libgsl;
function gsl_vector_float_fwrite(stream: PFILE; v: Pgsl_vector_float): longint; cdecl; external libgsl;
function gsl_vector_float_fscanf(stream: PFILE; v: Pgsl_vector_float): longint; cdecl; external libgsl;
function gsl_vector_float_fprintf(stream: PFILE; v: Pgsl_vector_float; format: pchar): longint; cdecl; external libgsl;
function gsl_vector_float_memcpy(dest: Pgsl_vector_float; src: Pgsl_vector_float): longint; cdecl; external libgsl;
function gsl_vector_float_reverse(v: Pgsl_vector_float): longint; cdecl; external libgsl;
function gsl_vector_float_swap(v: Pgsl_vector_float; w: Pgsl_vector_float): longint; cdecl; external libgsl;
function gsl_vector_float_swap_elements(v: Pgsl_vector_float; i: Tsize_t; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_vector_float_max(v: Pgsl_vector_float): single; cdecl; external libgsl;
function gsl_vector_float_min(v: Pgsl_vector_float): single; cdecl; external libgsl;
procedure gsl_vector_float_minmax(v: Pgsl_vector_float; min_out: Psingle; max_out: Psingle); cdecl; external libgsl;
function gsl_vector_float_max_index(v: Pgsl_vector_float): Tsize_t; cdecl; external libgsl;
function gsl_vector_float_min_index(v: Pgsl_vector_float): Tsize_t; cdecl; external libgsl;
procedure gsl_vector_float_minmax_index(v: Pgsl_vector_float; imin: Psize_t; imax: Psize_t); cdecl; external libgsl;
function gsl_vector_float_add(a: Pgsl_vector_float; b: Pgsl_vector_float): longint; cdecl; external libgsl;
function gsl_vector_float_sub(a: Pgsl_vector_float; b: Pgsl_vector_float): longint; cdecl; external libgsl;
function gsl_vector_float_mul(a: Pgsl_vector_float; b: Pgsl_vector_float): longint; cdecl; external libgsl;
function gsl_vector_float_div(a: Pgsl_vector_float; b: Pgsl_vector_float): longint; cdecl; external libgsl;
function gsl_vector_float_scale(a: Pgsl_vector_float; x: single): longint; cdecl; external libgsl;
function gsl_vector_float_add_constant(a: Pgsl_vector_float; x: single): longint; cdecl; external libgsl;
function gsl_vector_float_axpby(alpha: single; x: Pgsl_vector_float; beta: single; y: Pgsl_vector_float): longint; cdecl; external libgsl;
function gsl_vector_float_sum(a: Pgsl_vector_float): single; cdecl; external libgsl;
function gsl_vector_float_equal(u: Pgsl_vector_float; v: Pgsl_vector_float): longint; cdecl; external libgsl;
function gsl_vector_float_isnull(v: Pgsl_vector_float): longint; cdecl; external libgsl;
function gsl_vector_float_ispos(v: Pgsl_vector_float): longint; cdecl; external libgsl;
function gsl_vector_float_isneg(v: Pgsl_vector_float): longint; cdecl; external libgsl;
function gsl_vector_float_isnonneg(v: Pgsl_vector_float): longint; cdecl; external libgsl;
function gsl_vector_float_get(v: Pgsl_vector_float; i: Tsize_t): single; cdecl; external libgsl;
procedure gsl_vector_float_set(v: Pgsl_vector_float; i: Tsize_t; x: single); cdecl; external libgsl;
function gsl_vector_float_ptr(v: Pgsl_vector_float; i: Tsize_t): Psingle; cdecl; external libgsl;
function gsl_vector_float_const_ptr(v: Pgsl_vector_float; i: Tsize_t): Psingle; cdecl; external libgsl;

// === Konventiert am: 18-8-25 16:31:04 ===


implementation



end.
