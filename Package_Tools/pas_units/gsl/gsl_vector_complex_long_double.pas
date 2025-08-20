unit gsl_vector_complex_long_double;

interface

uses
  fp_gsl, gsl_complex, gsl_block_complex_long_double, gsl_vector_long_double;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tgsl_vector_complex_long_double = record
    size: Tsize_t;
    stride: Tsize_t;
    data: Plong_double;
    block: Pgsl_block_complex_long_double;
    owner: longint;
  end;
  Pgsl_vector_complex_long_double = ^Tgsl_vector_complex_long_double;

  Tgsl_vector_complex_long_double_view = record
    vector: Tgsl_vector_complex_long_double;
  end;
  Pgsl_vector_complex_long_double_view = ^Tgsl_vector_complex_long_double_view;

  Tgsl_vector_complex_long_double_const_view = record
    vector: Tgsl_vector_complex_long_double;
  end;
  Pgsl_vector_complex_long_double_const_view = ^Tgsl_vector_complex_long_double_const_view;


function gsl_vector_complex_long_double_alloc(n: Tsize_t): Pgsl_vector_complex_long_double; cdecl; external libgsl;
function gsl_vector_complex_long_double_calloc(n: Tsize_t): Pgsl_vector_complex_long_double; cdecl; external libgsl;
function gsl_vector_complex_long_double_alloc_from_block(b: Pgsl_block_complex_long_double; offset: Tsize_t; n: Tsize_t; stride: Tsize_t): Pgsl_vector_complex_long_double; cdecl; external libgsl;
function gsl_vector_complex_long_double_alloc_from_vector(v: Pgsl_vector_complex_long_double; offset: Tsize_t; n: Tsize_t; stride: Tsize_t): Pgsl_vector_complex_long_double; cdecl; external libgsl;
procedure gsl_vector_complex_long_double_free(v: Pgsl_vector_complex_long_double); cdecl; external libgsl;

function gsl_vector_complex_long_double_view_array(base: Plong_double; n: Tsize_t): Tgsl_vector_complex_long_double_view; cdecl; external libgsl;
function gsl_vector_complex_long_double_view_array_with_stride(base: Plong_double; stride: Tsize_t; n: Tsize_t): Tgsl_vector_complex_long_double_view; cdecl; external libgsl;
function gsl_vector_complex_long_double_const_view_array(base: Plong_double; n: Tsize_t): Tgsl_vector_complex_long_double_const_view; cdecl; external libgsl;
function gsl_vector_complex_long_double_const_view_array_with_stride(base: Plong_double; stride: Tsize_t; n: Tsize_t): Tgsl_vector_complex_long_double_const_view; cdecl; external libgsl;
function gsl_vector_complex_long_double_subvector(base: Pgsl_vector_complex_long_double; i: Tsize_t; n: Tsize_t): Tgsl_vector_complex_long_double_view; cdecl; external libgsl;
function gsl_vector_complex_long_double_subvector_with_stride(v: Pgsl_vector_complex_long_double; i: Tsize_t; stride: Tsize_t; n: Tsize_t): Tgsl_vector_complex_long_double_view; cdecl; external libgsl;
function gsl_vector_complex_long_double_const_subvector(base: Pgsl_vector_complex_long_double; i: Tsize_t; n: Tsize_t): Tgsl_vector_complex_long_double_const_view; cdecl; external libgsl;
function gsl_vector_complex_long_double_const_subvector_with_stride(v: Pgsl_vector_complex_long_double; i: Tsize_t; stride: Tsize_t; n: Tsize_t): Tgsl_vector_complex_long_double_const_view; cdecl; external libgsl;
function gsl_vector_complex_long_double_real(v: Pgsl_vector_complex_long_double): Tgsl_vector_long_double_view; cdecl; external libgsl;
function gsl_vector_complex_long_double_imag(v: Pgsl_vector_complex_long_double): Tgsl_vector_long_double_view; cdecl; external libgsl;
function gsl_vector_complex_long_double_const_real(v: Pgsl_vector_complex_long_double): Tgsl_vector_long_double_const_view; cdecl; external libgsl;
function gsl_vector_complex_long_double_const_imag(v: Pgsl_vector_complex_long_double): Tgsl_vector_long_double_const_view; cdecl; external libgsl;

procedure gsl_vector_complex_long_double_set_zero(v: Pgsl_vector_complex_long_double); cdecl; external libgsl;
procedure gsl_vector_complex_long_double_set_all(v: Pgsl_vector_complex_long_double; z: Tgsl_complex_long_double); cdecl; external libgsl;
function gsl_vector_complex_long_double_set_basis(v: Pgsl_vector_complex_long_double; i: Tsize_t): longint; cdecl; external libgsl;
function gsl_vector_complex_long_double_fread(stream: PFILE; v: Pgsl_vector_complex_long_double): longint; cdecl; external libgsl;
function gsl_vector_complex_long_double_fwrite(stream: PFILE; v: Pgsl_vector_complex_long_double): longint; cdecl; external libgsl;
function gsl_vector_complex_long_double_fscanf(stream: PFILE; v: Pgsl_vector_complex_long_double): longint; cdecl; external libgsl;
function gsl_vector_complex_long_double_fprintf(stream: PFILE; v: Pgsl_vector_complex_long_double; format: pchar): longint; cdecl; external libgsl;
function gsl_vector_complex_long_double_memcpy(dest: Pgsl_vector_complex_long_double; src: Pgsl_vector_complex_long_double): longint; cdecl; external libgsl;
function gsl_vector_complex_long_double_reverse(v: Pgsl_vector_complex_long_double): longint; cdecl; external libgsl;
function gsl_vector_complex_long_double_swap(v: Pgsl_vector_complex_long_double; w: Pgsl_vector_complex_long_double): longint; cdecl; external libgsl;
function gsl_vector_complex_long_double_swap_elements(v: Pgsl_vector_complex_long_double; i: Tsize_t; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_vector_complex_long_double_equal(u: Pgsl_vector_complex_long_double; v: Pgsl_vector_complex_long_double): longint; cdecl; external libgsl;
function gsl_vector_complex_long_double_isnull(v: Pgsl_vector_complex_long_double): longint; cdecl; external libgsl;
function gsl_vector_complex_long_double_ispos(v: Pgsl_vector_complex_long_double): longint; cdecl; external libgsl;
function gsl_vector_complex_long_double_isneg(v: Pgsl_vector_complex_long_double): longint; cdecl; external libgsl;
function gsl_vector_complex_long_double_isnonneg(v: Pgsl_vector_complex_long_double): longint; cdecl; external libgsl;
function gsl_vector_complex_long_double_add(a: Pgsl_vector_complex_long_double; b: Pgsl_vector_complex_long_double): longint; cdecl; external libgsl;
function gsl_vector_complex_long_double_sub(a: Pgsl_vector_complex_long_double; b: Pgsl_vector_complex_long_double): longint; cdecl; external libgsl;
function gsl_vector_complex_long_double_mul(a: Pgsl_vector_complex_long_double; b: Pgsl_vector_complex_long_double): longint; cdecl; external libgsl;
function gsl_vector_complex_long_double_div(a: Pgsl_vector_complex_long_double; b: Pgsl_vector_complex_long_double): longint; cdecl; external libgsl;
function gsl_vector_complex_long_double_scale(a: Pgsl_vector_complex_long_double; x: Tgsl_complex_long_double): longint; cdecl; external libgsl;
function gsl_vector_complex_long_double_add_constant(a: Pgsl_vector_complex_long_double; x: Tgsl_complex_long_double): longint; cdecl; external libgsl;
function gsl_vector_complex_long_double_axpby(alpha: Tgsl_complex_long_double; x: Pgsl_vector_complex_long_double; beta: Tgsl_complex_long_double; y: Pgsl_vector_complex_long_double): longint; cdecl; external libgsl;
function gsl_vector_complex_long_double_get(v: Pgsl_vector_complex_long_double; i: Tsize_t): Tgsl_complex_long_double; cdecl; external libgsl;
procedure gsl_vector_complex_long_double_set(v: Pgsl_vector_complex_long_double; i: Tsize_t; z: Tgsl_complex_long_double); cdecl; external libgsl;
function gsl_vector_complex_long_double_ptr(v: Pgsl_vector_complex_long_double; i: Tsize_t): Pgsl_complex_long_double; cdecl; external libgsl;
function gsl_vector_complex_long_double_const_ptr(v: Pgsl_vector_complex_long_double; i: Tsize_t): Pgsl_complex_long_double; cdecl; external libgsl;

// === Konventiert am: 20-8-25 15:20:58 ===


implementation



end.
