unit gsl_vector_uint;

interface

uses
  fp_gsl, gsl_block_uint;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tgsl_vector_uint = record
    size: Tsize_t;
    stride: Tsize_t;
    data: Pdword;
    block: Pgsl_block_uint;
    owner: longint;
  end;
  Pgsl_vector_uint = ^Tgsl_vector_uint;

  Tgsl_vector_uint_view = record
    vector: Tgsl_vector_uint;
  end;
  Pgsl_vector_uint_view = ^Tgsl_vector_uint_view;

  Tgsl_vector_uint_const_view = record
    vector: Tgsl_vector_uint;
  end;
  Pgsl_vector_uint_const_view = ^Tgsl_vector_uint_const_view;


function gsl_vector_uint_alloc(n: Tsize_t): Pgsl_vector_uint; cdecl; external libgsl;
function gsl_vector_uint_calloc(n: Tsize_t): Pgsl_vector_uint; cdecl; external libgsl;
function gsl_vector_uint_alloc_from_block(b: Pgsl_block_uint; offset: Tsize_t; n: Tsize_t; stride: Tsize_t): Pgsl_vector_uint; cdecl; external libgsl;
function gsl_vector_uint_alloc_from_vector(v: Pgsl_vector_uint; offset: Tsize_t; n: Tsize_t; stride: Tsize_t): Pgsl_vector_uint; cdecl; external libgsl;
procedure gsl_vector_uint_free(v: Pgsl_vector_uint); cdecl; external libgsl;

function gsl_vector_uint_view_array(v: Pdword; n: Tsize_t): Tgsl_vector_uint_view; cdecl; external libgsl;
function gsl_vector_uint_view_array_with_stride(base: Pdword; stride: Tsize_t; n: Tsize_t): Tgsl_vector_uint_view; cdecl; external libgsl;
function gsl_vector_uint_const_view_array(v: Pdword; n: Tsize_t): Tgsl_vector_uint_const_view; cdecl; external libgsl;
function gsl_vector_uint_const_view_array_with_stride(base: Pdword; stride: Tsize_t; n: Tsize_t): Tgsl_vector_uint_const_view; cdecl; external libgsl;
function gsl_vector_uint_subvector(v: Pgsl_vector_uint; i: Tsize_t; n: Tsize_t): Tgsl_vector_uint_view; cdecl; external libgsl;
function gsl_vector_uint_subvector_with_stride(v: Pgsl_vector_uint; i: Tsize_t; stride: Tsize_t; n: Tsize_t): Tgsl_vector_uint_view; cdecl; external libgsl;
function gsl_vector_uint_const_subvector(v: Pgsl_vector_uint; i: Tsize_t; n: Tsize_t): Tgsl_vector_uint_const_view; cdecl; external libgsl;
function gsl_vector_uint_const_subvector_with_stride(v: Pgsl_vector_uint; i: Tsize_t; stride: Tsize_t; n: Tsize_t): Tgsl_vector_uint_const_view; cdecl; external libgsl;

procedure gsl_vector_uint_set_zero(v: Pgsl_vector_uint); cdecl; external libgsl;
procedure gsl_vector_uint_set_all(v: Pgsl_vector_uint; x: dword); cdecl; external libgsl;
function gsl_vector_uint_set_basis(v: Pgsl_vector_uint; i: Tsize_t): longint; cdecl; external libgsl;
function gsl_vector_uint_fread(stream: PFILE; v: Pgsl_vector_uint): longint; cdecl; external libgsl;
function gsl_vector_uint_fwrite(stream: PFILE; v: Pgsl_vector_uint): longint; cdecl; external libgsl;
function gsl_vector_uint_fscanf(stream: PFILE; v: Pgsl_vector_uint): longint; cdecl; external libgsl;
function gsl_vector_uint_fprintf(stream: PFILE; v: Pgsl_vector_uint; format: pchar): longint; cdecl; external libgsl;
function gsl_vector_uint_memcpy(dest: Pgsl_vector_uint; src: Pgsl_vector_uint): longint; cdecl; external libgsl;
function gsl_vector_uint_reverse(v: Pgsl_vector_uint): longint; cdecl; external libgsl;
function gsl_vector_uint_swap(v: Pgsl_vector_uint; w: Pgsl_vector_uint): longint; cdecl; external libgsl;
function gsl_vector_uint_swap_elements(v: Pgsl_vector_uint; i: Tsize_t; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_vector_uint_max(v: Pgsl_vector_uint): dword; cdecl; external libgsl;
function gsl_vector_uint_min(v: Pgsl_vector_uint): dword; cdecl; external libgsl;
procedure gsl_vector_uint_minmax(v: Pgsl_vector_uint; min_out: Pdword; max_out: Pdword); cdecl; external libgsl;
function gsl_vector_uint_max_index(v: Pgsl_vector_uint): Tsize_t; cdecl; external libgsl;
function gsl_vector_uint_min_index(v: Pgsl_vector_uint): Tsize_t; cdecl; external libgsl;
procedure gsl_vector_uint_minmax_index(v: Pgsl_vector_uint; imin: Psize_t; imax: Psize_t); cdecl; external libgsl;
function gsl_vector_uint_add(a: Pgsl_vector_uint; b: Pgsl_vector_uint): longint; cdecl; external libgsl;
function gsl_vector_uint_sub(a: Pgsl_vector_uint; b: Pgsl_vector_uint): longint; cdecl; external libgsl;
function gsl_vector_uint_mul(a: Pgsl_vector_uint; b: Pgsl_vector_uint): longint; cdecl; external libgsl;
function gsl_vector_uint_div(a: Pgsl_vector_uint; b: Pgsl_vector_uint): longint; cdecl; external libgsl;
function gsl_vector_uint_scale(a: Pgsl_vector_uint; x: dword): longint; cdecl; external libgsl;
function gsl_vector_uint_add_constant(a: Pgsl_vector_uint; x: dword): longint; cdecl; external libgsl;
function gsl_vector_uint_axpby(alpha: dword; x: Pgsl_vector_uint; beta: dword; y: Pgsl_vector_uint): longint; cdecl; external libgsl;
function gsl_vector_uint_sum(a: Pgsl_vector_uint): dword; cdecl; external libgsl;
function gsl_vector_uint_equal(u: Pgsl_vector_uint; v: Pgsl_vector_uint): longint; cdecl; external libgsl;
function gsl_vector_uint_isnull(v: Pgsl_vector_uint): longint; cdecl; external libgsl;
function gsl_vector_uint_ispos(v: Pgsl_vector_uint): longint; cdecl; external libgsl;
function gsl_vector_uint_isneg(v: Pgsl_vector_uint): longint; cdecl; external libgsl;
function gsl_vector_uint_isnonneg(v: Pgsl_vector_uint): longint; cdecl; external libgsl;
function gsl_vector_uint_get(v: Pgsl_vector_uint; i: Tsize_t): dword; cdecl; external libgsl;
procedure gsl_vector_uint_set(v: Pgsl_vector_uint; i: Tsize_t; x: dword); cdecl; external libgsl;
function gsl_vector_uint_ptr(v: Pgsl_vector_uint; i: Tsize_t): Pdword; cdecl; external libgsl;
function gsl_vector_uint_const_ptr(v: Pgsl_vector_uint; i: Tsize_t): Pdword; cdecl; external libgsl;

// === Konventiert am: 20-8-25 16:48:16 ===


implementation



end.
