unit gsl_vector_complex_float;

interface

uses
  fp_gsl, gsl_block_complex_float, gsl_vector_float, gsl_complex;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tgsl_vector_complex_float = record
    size: Tsize_t;
    stride: Tsize_t;
    data: Psingle;
    block: Pgsl_block_complex_float;
    owner: longint;
  end;
  Pgsl_vector_complex_float = ^Tgsl_vector_complex_float;

  Tgsl_vector_complex_float_view = record
    vector: Tgsl_vector_complex_float;
  end;
  Pgsl_vector_complex_float_view = ^Tgsl_vector_complex_float_view;

  Tgsl_vector_complex_float_const_view = record
    vector: Tgsl_vector_complex_float;
  end;
  Pgsl_vector_complex_float_const_view = ^Tgsl_vector_complex_float_const_view;


function gsl_vector_complex_float_alloc(n: Tsize_t): Pgsl_vector_complex_float; cdecl; external libgsl;
function gsl_vector_complex_float_calloc(n: Tsize_t): Pgsl_vector_complex_float; cdecl; external libgsl;
function gsl_vector_complex_float_alloc_from_block(b: Pgsl_block_complex_float; offset: Tsize_t; n: Tsize_t; stride: Tsize_t): Pgsl_vector_complex_float; cdecl; external libgsl;
function gsl_vector_complex_float_alloc_from_vector(v: Pgsl_vector_complex_float; offset: Tsize_t; n: Tsize_t; stride: Tsize_t): Pgsl_vector_complex_float; cdecl; external libgsl;
procedure gsl_vector_complex_float_free(v: Pgsl_vector_complex_float); cdecl; external libgsl;

function gsl_vector_complex_float_view_array(base: Psingle; n: Tsize_t): Tgsl_vector_complex_float_view; cdecl; external libgsl;
function gsl_vector_complex_float_view_array_with_stride(base: Psingle; stride: Tsize_t; n: Tsize_t): Tgsl_vector_complex_float_view; cdecl; external libgsl;
function gsl_vector_complex_float_const_view_array(base: Psingle; n: Tsize_t): Tgsl_vector_complex_float_const_view; cdecl; external libgsl;
function gsl_vector_complex_float_const_view_array_with_stride(base: Psingle; stride: Tsize_t; n: Tsize_t): Tgsl_vector_complex_float_const_view; cdecl; external libgsl;
function gsl_vector_complex_float_subvector(base: Pgsl_vector_complex_float; i: Tsize_t; n: Tsize_t): Tgsl_vector_complex_float_view; cdecl; external libgsl;
function gsl_vector_complex_float_subvector_with_stride(v: Pgsl_vector_complex_float; i: Tsize_t; stride: Tsize_t; n: Tsize_t): Tgsl_vector_complex_float_view; cdecl; external libgsl;
function gsl_vector_complex_float_const_subvector(base: Pgsl_vector_complex_float; i: Tsize_t; n: Tsize_t): Tgsl_vector_complex_float_const_view; cdecl; external libgsl;
function gsl_vector_complex_float_const_subvector_with_stride(v: Pgsl_vector_complex_float; i: Tsize_t; stride: Tsize_t; n: Tsize_t): Tgsl_vector_complex_float_const_view; cdecl; external libgsl;
function gsl_vector_complex_float_real(v: Pgsl_vector_complex_float): Tgsl_vector_float_view; cdecl; external libgsl;
function gsl_vector_complex_float_imag(v: Pgsl_vector_complex_float): Tgsl_vector_float_view; cdecl; external libgsl;
function gsl_vector_complex_float_const_real(v: Pgsl_vector_complex_float): Tgsl_vector_float_const_view; cdecl; external libgsl;
function gsl_vector_complex_float_const_imag(v: Pgsl_vector_complex_float): Tgsl_vector_float_const_view; cdecl; external libgsl;

procedure gsl_vector_complex_float_set_zero(v: Pgsl_vector_complex_float); cdecl; external libgsl;
procedure gsl_vector_complex_float_set_all(v: Pgsl_vector_complex_float; z: Tgsl_complex_float); cdecl; external libgsl;
function gsl_vector_complex_float_set_basis(v: Pgsl_vector_complex_float; i: Tsize_t): longint; cdecl; external libgsl;
function gsl_vector_complex_float_fread(stream: PFILE; v: Pgsl_vector_complex_float): longint; cdecl; external libgsl;
function gsl_vector_complex_float_fwrite(stream: PFILE; v: Pgsl_vector_complex_float): longint; cdecl; external libgsl;
function gsl_vector_complex_float_fscanf(stream: PFILE; v: Pgsl_vector_complex_float): longint; cdecl; external libgsl;
function gsl_vector_complex_float_fprintf(stream: PFILE; v: Pgsl_vector_complex_float; format: pchar): longint; cdecl; external libgsl;
function gsl_vector_complex_float_memcpy(dest: Pgsl_vector_complex_float; src: Pgsl_vector_complex_float): longint; cdecl; external libgsl;
function gsl_vector_complex_float_reverse(v: Pgsl_vector_complex_float): longint; cdecl; external libgsl;
function gsl_vector_complex_float_swap(v: Pgsl_vector_complex_float; w: Pgsl_vector_complex_float): longint; cdecl; external libgsl;
function gsl_vector_complex_float_swap_elements(v: Pgsl_vector_complex_float; i: Tsize_t; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_vector_complex_float_equal(u: Pgsl_vector_complex_float; v: Pgsl_vector_complex_float): longint; cdecl; external libgsl;
function gsl_vector_complex_float_isnull(v: Pgsl_vector_complex_float): longint; cdecl; external libgsl;
function gsl_vector_complex_float_ispos(v: Pgsl_vector_complex_float): longint; cdecl; external libgsl;
function gsl_vector_complex_float_isneg(v: Pgsl_vector_complex_float): longint; cdecl; external libgsl;
function gsl_vector_complex_float_isnonneg(v: Pgsl_vector_complex_float): longint; cdecl; external libgsl;
function gsl_vector_complex_float_add(a: Pgsl_vector_complex_float; b: Pgsl_vector_complex_float): longint; cdecl; external libgsl;
function gsl_vector_complex_float_sub(a: Pgsl_vector_complex_float; b: Pgsl_vector_complex_float): longint; cdecl; external libgsl;
function gsl_vector_complex_float_mul(a: Pgsl_vector_complex_float; b: Pgsl_vector_complex_float): longint; cdecl; external libgsl;
function gsl_vector_complex_float_div(a: Pgsl_vector_complex_float; b: Pgsl_vector_complex_float): longint; cdecl; external libgsl;
function gsl_vector_complex_float_scale(a: Pgsl_vector_complex_float; x: Tgsl_complex_float): longint; cdecl; external libgsl;
function gsl_vector_complex_float_add_constant(a: Pgsl_vector_complex_float; x: Tgsl_complex_float): longint; cdecl; external libgsl;
function gsl_vector_complex_float_axpby(alpha: Tgsl_complex_float; x: Pgsl_vector_complex_float; beta: Tgsl_complex_float; y: Pgsl_vector_complex_float): longint; cdecl; external libgsl;
function gsl_vector_complex_float_get(v: Pgsl_vector_complex_float; i: Tsize_t): Tgsl_complex_float; cdecl; external libgsl;
procedure gsl_vector_complex_float_set(v: Pgsl_vector_complex_float; i: Tsize_t; z: Tgsl_complex_float); cdecl; external libgsl;
function gsl_vector_complex_float_ptr(v: Pgsl_vector_complex_float; i: Tsize_t): Pgsl_complex_float; cdecl; external libgsl;
function gsl_vector_complex_float_const_ptr(v: Pgsl_vector_complex_float; i: Tsize_t): Pgsl_complex_float; cdecl; external libgsl;

// === Konventiert am: 18-8-25 16:43:26 ===


implementation



end.
