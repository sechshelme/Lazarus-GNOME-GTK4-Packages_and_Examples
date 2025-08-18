unit gsl_vector_complex_double;

interface

uses
  fp_gsl, gsl_vector_double, gsl_block_complex_double, gsl_complex;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tgsl_vector_complex = record
    size: Tsize_t;
    stride: Tsize_t;
    data: Pdouble;
    block: Pgsl_block_complex;
    owner: longint;
  end;
  Pgsl_vector_complex = ^Tgsl_vector_complex;

  Tgsl_vector_complex_view = record
    vector: Tgsl_vector_complex;
  end;
  Pgsl_vector_complex_view = ^Tgsl_vector_complex_view;

  Tgsl_vector_complex_const_view = record
    vector: Tgsl_vector_complex;
  end;
  Pgsl_vector_complex_const_view = ^Tgsl_vector_complex_const_view;


function gsl_vector_complex_alloc(n: Tsize_t): Pgsl_vector_complex; cdecl; external libgsl;
function gsl_vector_complex_calloc(n: Tsize_t): Pgsl_vector_complex; cdecl; external libgsl;
function gsl_vector_complex_alloc_from_block(b: Pgsl_block_complex; offset: Tsize_t; n: Tsize_t; stride: Tsize_t): Pgsl_vector_complex; cdecl; external libgsl;
function gsl_vector_complex_alloc_from_vector(v: Pgsl_vector_complex; offset: Tsize_t; n: Tsize_t; stride: Tsize_t): Pgsl_vector_complex; cdecl; external libgsl;
procedure gsl_vector_complex_free(v: Pgsl_vector_complex); cdecl; external libgsl;

function gsl_vector_complex_view_array(base: Pdouble; n: Tsize_t): Tgsl_vector_complex_view; cdecl; external libgsl;
function gsl_vector_complex_view_array_with_stride(base: Pdouble; stride: Tsize_t; n: Tsize_t): Tgsl_vector_complex_view; cdecl; external libgsl;
function gsl_vector_complex_const_view_array(base: Pdouble; n: Tsize_t): Tgsl_vector_complex_const_view; cdecl; external libgsl;
function gsl_vector_complex_const_view_array_with_stride(base: Pdouble; stride: Tsize_t; n: Tsize_t): Tgsl_vector_complex_const_view; cdecl; external libgsl;
function gsl_vector_complex_subvector(base: Pgsl_vector_complex; i: Tsize_t; n: Tsize_t): Tgsl_vector_complex_view; cdecl; external libgsl;
function gsl_vector_complex_subvector_with_stride(v: Pgsl_vector_complex; i: Tsize_t; stride: Tsize_t; n: Tsize_t): Tgsl_vector_complex_view; cdecl; external libgsl;
function gsl_vector_complex_const_subvector(base: Pgsl_vector_complex; i: Tsize_t; n: Tsize_t): Tgsl_vector_complex_const_view; cdecl; external libgsl;
function gsl_vector_complex_const_subvector_with_stride(v: Pgsl_vector_complex; i: Tsize_t; stride: Tsize_t; n: Tsize_t): Tgsl_vector_complex_const_view; cdecl; external libgsl;
function gsl_vector_complex_real(v: Pgsl_vector_complex): Tgsl_vector_view; cdecl; external libgsl;
function gsl_vector_complex_imag(v: Pgsl_vector_complex): Tgsl_vector_view; cdecl; external libgsl;
function gsl_vector_complex_const_real(v: Pgsl_vector_complex): Tgsl_vector_const_view; cdecl; external libgsl;
function gsl_vector_complex_const_imag(v: Pgsl_vector_complex): Tgsl_vector_const_view; cdecl; external libgsl;

procedure gsl_vector_complex_set_zero(v: Pgsl_vector_complex); cdecl; external libgsl;
procedure gsl_vector_complex_set_all(v: Pgsl_vector_complex; z: Tgsl_complex); cdecl; external libgsl;
function gsl_vector_complex_set_basis(v: Pgsl_vector_complex; i: Tsize_t): longint; cdecl; external libgsl;
function gsl_vector_complex_fread(stream: PFILE; v: Pgsl_vector_complex): longint; cdecl; external libgsl;
function gsl_vector_complex_fwrite(stream: PFILE; v: Pgsl_vector_complex): longint; cdecl; external libgsl;
function gsl_vector_complex_fscanf(stream: PFILE; v: Pgsl_vector_complex): longint; cdecl; external libgsl;
function gsl_vector_complex_fprintf(stream: PFILE; v: Pgsl_vector_complex; format: pchar): longint; cdecl; external libgsl;
function gsl_vector_complex_memcpy(dest: Pgsl_vector_complex; src: Pgsl_vector_complex): longint; cdecl; external libgsl;
function gsl_vector_complex_reverse(v: Pgsl_vector_complex): longint; cdecl; external libgsl;
function gsl_vector_complex_swap(v: Pgsl_vector_complex; w: Pgsl_vector_complex): longint; cdecl; external libgsl;
function gsl_vector_complex_swap_elements(v: Pgsl_vector_complex; i: Tsize_t; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_vector_complex_equal(u: Pgsl_vector_complex; v: Pgsl_vector_complex): longint; cdecl; external libgsl;
function gsl_vector_complex_isnull(v: Pgsl_vector_complex): longint; cdecl; external libgsl;
function gsl_vector_complex_ispos(v: Pgsl_vector_complex): longint; cdecl; external libgsl;
function gsl_vector_complex_isneg(v: Pgsl_vector_complex): longint; cdecl; external libgsl;
function gsl_vector_complex_isnonneg(v: Pgsl_vector_complex): longint; cdecl; external libgsl;
function gsl_vector_complex_add(a: Pgsl_vector_complex; b: Pgsl_vector_complex): longint; cdecl; external libgsl;
function gsl_vector_complex_sub(a: Pgsl_vector_complex; b: Pgsl_vector_complex): longint; cdecl; external libgsl;
function gsl_vector_complex_mul(a: Pgsl_vector_complex; b: Pgsl_vector_complex): longint; cdecl; external libgsl;
function gsl_vector_complex_div(a: Pgsl_vector_complex; b: Pgsl_vector_complex): longint; cdecl; external libgsl;
function gsl_vector_complex_scale(a: Pgsl_vector_complex; x: Tgsl_complex): longint; cdecl; external libgsl;
function gsl_vector_complex_add_constant(a: Pgsl_vector_complex; x: Tgsl_complex): longint; cdecl; external libgsl;
function gsl_vector_complex_axpby(alpha: Tgsl_complex; x: Pgsl_vector_complex; beta: Tgsl_complex; y: Pgsl_vector_complex): longint; cdecl; external libgsl;
function gsl_vector_complex_get(v: Pgsl_vector_complex; i: Tsize_t): Tgsl_complex; cdecl; external libgsl;
procedure gsl_vector_complex_set(v: Pgsl_vector_complex; i: Tsize_t; z: Tgsl_complex); cdecl; external libgsl;
function gsl_vector_complex_ptr(v: Pgsl_vector_complex; i: Tsize_t): Pgsl_complex; cdecl; external libgsl;
function gsl_vector_complex_const_ptr(v: Pgsl_vector_complex; i: Tsize_t): Pgsl_complex; cdecl; external libgsl;

// === Konventiert am: 18-8-25 17:06:27 ===


implementation



end.
